let
	        DateTable = (Source as table, rank as number) as table => 
    let
    Data0 = Source{rank}[Data],
    ChangedType = Table.TransformColumnTypes(Data0,{{"Year", type text}, {"Company", type text}, {"Current location", type text}, {"Field", type text}, {"Sources", type text}})
    in
        ChangedType,

    Source = Web.Page(Web.Contents("https://en.wikipedia.org/wiki/List_of_oldest_companies")),
    table0 = DateTable(Source,0),
    table1 = DateTable(Source,1),
    table2 = DateTable(Source,2),
    table3 = DateTable(Source,3),
    table4 = DateTable(Source,4),
    table5 = DateTable(Source,5),
    dateTable = Table.Combine({table0,table1,table2,table3,table4,table5})
in
    dateTable