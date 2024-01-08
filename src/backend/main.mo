import Principal "mo:base/Principal";
import Text "mo:base/Text";
import Http "http";
import TrieMap "mo:base/TrieMap";
import Buffer "mo:base/Buffer";
import HashMap "mo:base/HashMap";
import Hash "mo:base/Hash";
import Int "mo:base/Int";
actor {

  type Status = {
    #Open;
    #Accepted;
    #Rejected;
  };

  type Proposal = {
    id : Int;
    status : Status;
    manifest : Text;
    votes : Int;
    voters : [Principal];
  }; // To define

var NextProposalId : Int = 0;
let proposals = TrieMap.TrieMap<Int, Proposal>(Int.equal, Int.hash);

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
    return proposals.get(id);
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
