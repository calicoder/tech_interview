#design a call center

def Employee
  attr_accesor :supervisor

  def getCallHandler(call)
    if available?
      #pick up
    else
      escalateCall(call)
    end
  end

  def available?
    #not on call and in the office
  end

  def escalateCall(call)
    supervisor.getCallHandler(call)
  end
end

def Fresher < Employee
end

def TL < Employee
end

def PM < Employee
  def escalateCall(call)
    #play voice mail
  end
end

