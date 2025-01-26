WITH CTE AS (
    -- Selecting the entry and exit transactions for each operator
    SELECT 
        o.OperNo AS OperatorNumber, -- Operator number
        o.Name AS OperatorName, -- Operator name
        CONVERT(DATE, entry.DateTime) AS Date, -- Date of the transaction (only the date part)
        entry.DateTime AS EntryDateTime,  -- Exact time of the entry 
        exit.DateTime AS ExitDateTime, -- Exact time of the exit 
        DATEDIFF(MINUTE, entry.DateTime, exit.DateTime) AS DifferenceInMinutes, -- Difference in minutes between entry and exit
        ROW_NUMBER() OVER (
            PARTITION BY entry.OperNo, entry.DateTime  -- For each operator and entry date
            ORDER BY exit.DateTime ASC -- Sorting transactions by exit time
        ) AS TransactionRank
    FROM 
        dbo.Operators o -- Operators table
    JOIN 
        dbo.Main entry ON o.OperNo = entry.OperNo AND entry.code = 'entry_time'  -- Entry (code = 'entry_time')
    JOIN 
        dbo.Main exit ON o.OperNo = exit.OperNo AND exit.code = 'exit_time' -- Exit (code = 'exit_time')
        AND CONVERT(DATE, entry.DateTime) = CONVERT(DATE, exit.DateTime) -- Ensuring entry and exit dates are the same
    WHERE 
        entry.DateTime < exit.DateTime -- Ensuring entry time is before exit time
        AND MONTH(entry.DateTime) = 11 -- Filtering transactions from the month of November
)
-- Now we select the necessary data from the CTE
SELECT 
    OperatorNumber, -- Operator number
    OperatorName, -- Operator name
    Date, -- Transaction date
    EntryDateTime, -- Exact entry time
    ExitDateTime, -- Exact exit time
    DifferenceInMinutes -- Difference in minutes between entry and exit
FROM 
    CTE -- CTE with calculated information
WHERE 
    TransactionRank = 1 -- Only taking the first transaction for each date and operator
ORDER BY 
    OperatorNumber, EntryDateTime, ExitDateTime; -- Sorting by operator and entry/exit times