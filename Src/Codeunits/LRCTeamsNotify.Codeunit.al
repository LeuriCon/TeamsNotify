/// <summary>
/// Codeunit LRC Teams Notify (ID 50100).
/// </summary>
codeunit 50100 "LRC Teams Notify"
{

    /// <summary>
    /// PostSimpleMessage.
    /// </summary>
    /// <param name="Url">Text[250].</param>
    /// <param name="Message">Text[1000]].</param>
    procedure PostSimpleMessage(Url: Text[250]; Message: Text[1000])
    var
        JsonObject: JsonObject;
        JsonText: Text;
    begin
        JsonObject.Add('Text', Message);
        JsonObject.WriteTo(JsonText);
        PostTeamsMessage(Url, JsonText);
    end;
    /// <summary>
    /// PostTeamsMessage.
    /// </summary>
    /// <param name="Url">Text[250].</param>
    /// <param name="JsonText">Text.</param>
    procedure PostTeamsMessage(Url: Text[250]; JsonText: Text)
    var
        HttpRequestMessage: HttpRequestMessage;
        HttpResponseMessage: HttpResponseMessage;
        HttpContent: HttpContent;
        Headers: HttpHeaders;
        Httpclient: HttpClient;
        ResponsTxt: Text;
    begin
        HttpRequestMessage.Method := 'POST';
        HttpRequestMessage.SetRequestUri(url);
        HttpContent.WriteFrom(JsonText);
        HttpContent.GetHeaders(Headers);
        Headers.Remove('Content-Type');
        Headers.Add('Content-Type', 'application/json');
        HttpRequestMessage.Content := HttpContent;
        Httpclient.Send(HttpRequestMessage, HttpResponseMessage);
        Message(Format(HttpResponseMessage.Content.ReadAs(ResponsTxt)));
    end;
}