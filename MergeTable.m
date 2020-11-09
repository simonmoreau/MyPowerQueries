let
	        DateTable = (sourceTable as table, column as text) as table => 
    let
    promotedHeaders = Table.PromoteHeaders(sourceTable, [PromoteAllScalars=true]),
    changedType = Table.TransformColumnTypes(promotedHeaders,{{"Name", type text}, {"Level", type text}, {"Area", type number}}),
    AddColumn = Table.AddColumn(changedType, "Version", each column)
    in
        AddColumn,

    Source1 = Csv.Document(File.Contents("C:\Users\Simon\OneDrive - Bouygues Immobilier\06 - IE\ZC5\Etudes\20201109 - Extension R+7\Surfaces\Area Schedule (SU) All.txt"),[Delimiter="	", Columns=4, Encoding=1200, QuoteStyle=QuoteStyle.None]),
    Source2 = Csv.Document(File.Contents("C:\Users\Simon\OneDrive - Bouygues Immobilier\06 - IE\ZC5\Etudes\20201109 - Extension R+7\Surfaces\ZC5B - PC - Area Schedule (SDP) All.txt"),[Delimiter="	", Columns=4, Encoding=1200, QuoteStyle=QuoteStyle.None]),
    table1 = DateTable(Source1,"Nouveau"),
    table2 = DateTable(Source2,"PC"),
    dateTable = Table.Combine({table1,table2}),
    #"Removed Columns" = Table.RemoveColumns(dateTable,{""})
in
    #"Removed Columns"