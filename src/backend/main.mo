import Principal "mo:base/Principal";
import Text "mo:base/Text";
import Http "http";
actor {

  type Proposal = {}; // To define

  public shared ({ caller }) func submitProposal(text : Text) : async {
    #Ok : Proposal;
    #Err : Text;
  } {
    return #Err("Your principal is : " # Principal.toText(caller));
  };

  public shared ({ caller }) func vote(proposalId : Int, yesOrNo : Bool) : async {
    #Ok : (Nat, Nat);
    #Err : Text;
  } {
    return #Err("Not implemented yet");
  };

  public query func getProposal(id : Int) : async ?Proposal {
    return null;
  };

  public query func getAllProposals() : async [(Int, Proposal)] {
    return [];
  };

  // Webpage
  public type HttpRequest = Http.Request;
  public type HttpResponse = Http.Response;
  public query func http_request(request : HttpRequest) : async HttpResponse {
    return ({
      body = Text.encodeUtf8("This is a DAO controlled webpage, okay?");
      headers = [("Content-Type", "text/html; charset=UTF-8")];
      status_code = 200 : Nat16;
      streaming_strategy = null;
    });
  };
};
