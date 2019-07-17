#define CRLF Chr( 13 ) + Chr( 10 )

function Main()
    
   local aLines := HB_aTokens( MemoRead( "README.md" ), Chr( 10 ) )
   local cRSS
 
   cRSS = '<?xml version="1.0" encoding="utf-8"?>' + CRLF
   cRSS += '<rss version="2.0">' + CRLF
   cRSS += '<channel>' + CRLF
   cRSS += "<title>chromecast-backgrounds</title>" + CRLF
   cRSS += "<link>https://github.com/FiveTechSoft/chromecast-backgrounds</link>" + CRLF 
   cRSS += "<description>dconnolly chromecast-backgrounds collection</description>" + CRLF
 
   AEval( aLines, { | cLine, n | cRSS += StrTran( StrTran( cLine, "![](", "<item>" + CRLF + ;
          "<title>" + AllTrim( Str( n ) ) + "</title>" + CRLF + "<link>" ), ")",;
          "</link>" + CRLF + "</item>" ) + CRLF } )
   
   hb_MemoWrit( "test.rss", SubStr( cRSS, 1, Len( cRSS ) - 2 ) + "</channel>" + CRLF + "</rss>" )

return nil    