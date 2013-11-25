/*
// author : Kazuhiko Imamura
// created date: 11/25/2013
*/
public class SignaturepadSampleController {
    Public Sobject obj{set; get;}
    Public String fileName{set;get;}
    Public Transient String signData{set;get;}

    Public SignaturepadSampleController(ApexPages.StandardController controller) {
         this.obj = (Sobject)controller.getRecord();
    }
    
    Public PageReference saveSign2Obj() {
        Attachment attachment = new Attachment();
        attachment.Name = fileName + '.png';  // filename
        attachment.Body = EncodingUtil.base64Decode(signData.remove('data:image/png;base64,'));  // data
        attachment.ParentId = obj.Id;  // parent record Id
        insert attachment;
        
        return null;
    }
}