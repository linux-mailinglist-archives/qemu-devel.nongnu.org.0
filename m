Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B18AE374D49
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 04:09:34 +0200 (CEST)
Received: from localhost ([::1]:47936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leTSH-0008N6-Qu
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 22:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1leTRI-0007vo-Cf
 for qemu-devel@nongnu.org; Wed, 05 May 2021 22:08:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1leTRF-0007S6-1L
 for qemu-devel@nongnu.org; Wed, 05 May 2021 22:08:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620266907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FW3BeJPF5kSp0xNOvg5NLPAeicEo8Q9yAUEvTqsjjzc=;
 b=U73ycmVokwSUavdNG8lHppBcdmEuMqAvXnK0nmMliibyXvgimJTbfB045YMWeEUApisesp
 8rQ7xQ9z6oTCg6zxBa5+bf3/U8a0Vv7Mi1Efv68uoVfYisslpJCw/husr1F/dsVt0OvhBw
 FbnebgNINPXoKmZEqv+xl0cNqDHwl8I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-GMlZ9UTcOYOJ4Tbt3MaTtQ-1; Wed, 05 May 2021 22:08:22 -0400
X-MC-Unique: GMlZ9UTcOYOJ4Tbt3MaTtQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB6E2107ACC7;
 Thu,  6 May 2021 02:08:21 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FB811002D71;
 Thu,  6 May 2021 02:08:20 +0000 (UTC)
Subject: Re: [PATCH 16/22] qapi/parser: add docstrings
To: Markus Armbruster <armbru@redhat.com>
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-17-jsnow@redhat.com>
 <877dkq5w9x.fsf@dusky.pond.sub.org>
 <6ea6efc8-0506-326c-ee57-eb81fd61dfae@redhat.com>
 <87lf942j73.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <aa7e8787-9198-37c2-6bb5-04aa25d26bce@redhat.com>
Date: Wed, 5 May 2021 22:08:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87lf942j73.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/21 5:03 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> On 4/25/21 9:27 AM, Markus Armbruster wrote:
>>> John Snow <jsnow@redhat.com> writes:
>>>
>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>>
>>>> ---
>>>>
>>>> My hubris is infinite.
>>>
>>> Score one of the three principal virtues of a programmer ;)
>>>
>>
>> It was written before the prior review, but I promise I am slowing down
>> on adding these. I just genuinely left them to help remind myself how
>> these modules are actually structured and work so that I will be able to
>> "pop in" quickly in the future and make a tactical, informed edit.
>>
>>>> OK, I only added a few -- to help me remember how the parser works at a glance.
>>>>
>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>> ---
>>>>    scripts/qapi/parser.py | 66 ++++++++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 66 insertions(+)
>>>>
>>>> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
>>>> index dbbd0fcbc2f..8fc77808ace 100644
>>>> --- a/scripts/qapi/parser.py
>>>> +++ b/scripts/qapi/parser.py
>>>> @@ -51,7 +51,24 @@ def __init__(self, parser: 'QAPISchemaParser', msg: str):
>>>>    
>>>>    
>>>>    class QAPISchemaParser:
>>>> +    """
>>>> +    Performs parsing of a QAPI schema source file.
>>>
>>> Actually, this parses one of two layers, see qapi-code-gen.txt section
>>> "Schema syntax".  Pointing there might help.
>>>
>>
>> It sort of parses one-and-a-half layers, but yes ... I know the
>> distinction you're drawing here. This is *mostly* the JSON/AST level.
>>
>> (With some upper-level or mid-level parsing for Pragmas and Includes.)
> 
> True.  I chose simplicity over purity.
> 
>>>>    
>>>> +    :param fname: Path to the source file
>>>
>>> Either "Source file name" or "Source pathname", please.  I prefer "file
>>> name" for additional distance to "path" in the sense of a search path,
>>> i.e. a list of directory names.
>>>
>>
>> OK, I am not sure I have any ... prejudice about when to use which kind
>> of description for these sorts of things. I'm happy to defer to you, but
>> if there's some kind of existing standard vocabulary I'm trampling all
>> over, feel free to point me to your preferred hacker dictionary.
>>
>> Anyway, happy to adopt your phrasing here.
>>
>>>> +    :param previously_included:
>>>> +        The absolute paths of previously included source files.
>>>
>>> Either "absolute file name" or "absulute pathname".
>>>
>>
>> OK.
>>
>>>> +        Only used by recursive calls to avoid re-parsing files.
>>>
>>> Feels like detail, not sure it's needed here.
>>>
>>
>> You're probably right, but I suppose I wanted to hint/suggest that it
>> was not necessary to feed it this argument for the root schema, but it
>> was crucial for the recursive calls.
> 
> To me "if root schema, then nothing was previously included" feels
> obvious enough :)  But if you want to spell out proper use of the
> parameter, I recommend to stick to the interface, i.e. when to pass it,
> not what the function does with it (in the hope that the reader can
> then guess when to pass it).
> 
>> (Earlier I mentioned possibly just passing the parent parser in: that
>> helps eliminate some of this ambiguity, too.)
>>
>>>> +    :param incl_info:
>>>> +       `QAPISourceInfo` for the parent document.
>>>> +       This may be None if this is the root schema document.
>>>
>>> Recommend s/This maybe //.
>>>
>>> qapi-code-gen.txt calls a QAPI schema that uses include directives
>>> "modular", and the included files "sub-modules".  s/root schema
>>> document/root module/?
>>>
>>
>> Sure. All in favor of phrasing consistency.
>>
>> (By the way: I did write up a draft for converting qapi-code-gen.txt to
>> ReST format, and if I had finished that, it might be nice to hotlink to
>> it here. I stopped for now because I wanted to solidify some conventions
>> on how to markup certain constructs first, and wanted ... not to
>> overwhelm you with more doc-wrangling.)
> 
> Appreciated :)
> 
>>>> +
>>>> +    :ivar exprs: Resulting parsed expressions.
>>>> +    :ivar docs: Resulting parsed documentation blocks.
>>>
>>> Uh, why are these here?  A doc string is interface documentation...
>>>
>>
>> These *are* interface. It is how callers are expected to get the results
>> of parsing.
> 
> You're right, but is the constructor the right place to document
> attributes?
> 

This is the docstring for the class, actually.

https://www.python.org/dev/peps/pep-0257/ says:

"The docstring for a class should summarize its behavior and list the 
public methods and instance variables. If the class is intended to be 
subclassed, and has an additional interface for subclasses, this 
interface should be listed separately (in the docstring). The class 
constructor should be documented in the docstring for its __init__ 
method. Individual methods should be documented by their own docstring."

So that's where parameters for the init method goes, as well as class 
and instance variables.

One-stop shop for interface documentation.

>> We could change that, of course, but that is absolutely how this class
>> works today.
>>
>>>> +
>>>> +    :raise OSError: For problems opening the root schema document.
>>>> +    :raise QAPIParseError: For JSON or QAPIDoc syntax problems.
>>>> +    :raise QAPISemError: For various semantic issues with the schema.
>>>
>>> Should callers care for the difference between QAPIParseError and
>>> QAPISemError?
>>>
>>
>> That's up to the caller, I suppose. I just dutifully reported the truth
>> of the matter here.
>>
>> (That's a real non-answer, I know.)
>>
>> I could always document QAPISourceError instead, with a note about the
>> subclasses used for completeness.
>>
>> (The intent is that QAPIError is always assumed/implied to be sufficient
>> for capturing absolutely everything raised directly by this package, if
>> you want to ignore the meanings behind them.)
> 
> I honestly can't think of a reason for catching anything but QAPIError.
> The other classes exist only to give us more convenient ways to
> construct instances of QAPIError.  We could replace them all by
> functions returning QAPIError.
> 

Summary it is.

>>>> +    """
>>>>        def __init__(self,
>>>>                     fname: str,
>>>>                     previously_included: Optional[Set[str]] = None,
>>>> @@ -77,6 +94,11 @@ def __init__(self,
>>>>            self._parse()
>>>>    
>>>>        def _parse(self) -> None:
>>>> +        """
>>>> +        Parse the QAPI schema document.
>>>> +
>>>> +        :return: None; results are stored in ``exprs`` and ``docs``.
>>>
>>> Another ignorant doc string markup question...  how am I supposed to see
>>> that exprs and docs are attributes, and not global variables?
>>>
>>
>> I don't know, it's an unsolved mystery for me too. I need more time in
>> the Sphinx dungeon to figure out how this stuff is supposed to work.
>> You're right to wonder.
> 
> Use self.exprs and self.docs meanwhile?
> 

If I don't accidentally trip and fall and decide to care more about it 
by the time I finish revising the docs tomorrow, yes.

>>>> +        """
>>>>            cur_doc = None
>>>>    
>>>>            with open(self._fname, 'r', encoding='utf-8') as fp:
>>>> @@ -197,6 +219,50 @@ def _check(name: str, value: object) -> List[str]:
>>>>                raise QAPISemError(info, "unknown pragma '%s'" % name)
>>>>    
>>>>        def accept(self, skip_comment: bool = True) -> None:
>>>> +        """
>>>> +        Read the next lexeme and process it into a token.
>>>> +
>>>> +        :Object state:
>>>> +          :tok: represents the token type. See below for values.
>>>> +          :pos: is the position of the first character in the lexeme.
>>>> +          :cursor: is the position of the next character.
>>>
>>> Define "position" :)  It's an index in self.src.
>>>
>>
>> Good call.
>>
>>> self.cursor and self.pos are not used outside accept().  Not sure thet
>>> belong into interface documentation.
>>>
>>
>> Fair point, though I was on a mission to document exactly how the parser
>> works even at the internal level, because accept(), despite being
>> "public", is really more of an internal function here.
>>
>> I am somewhat partial to documenting these state variables for my own
>> sake so that I can remember the way this lexer behaves.
> 
> I understand why you want to document how they work.  Since they're
> internal to accept(), a comment in accept() seems more proper than
> accept() doc string.  Admittedly doesn't matter that much, as accept()
> is internal to the class.
> 

OK, I'll take it into consideration and see what subjectively looks and 
feels the nicest.

>>>> +          :val: is the variable value of the token, if any.
>>>
>>> Missing: self.info, which *is* used outside accept().
>>>
>>
>> Oh, yes.
>>
>>>> +
>>>> +        Single-character tokens:
>>>> +
>>>> +        These include ``LBRACE``, ``RBRACE``, ``COLON``, ``COMMA``,
>>>> +        ``LSQB``, and ``RSQB``.
>>>
>>> "These include ..." is misleading.  This is the complete list of
>>> single-character tokens.
>>>
>>
>> I'm just testing your ability to recognize the difference between proper
>> and improper subsets.
>>
>> (Joking. I'll reword to avoid that ambiguity.)
>>
>>>> +        ``LSQB``, and ``RSQB``.  ``tok`` holds the single character
>>>> +        lexeme.  ``val`` is ``None``.
>>>> +
>>>> +        Multi-character tokens:
>>>> +
>>>> +        - ``COMMENT``:
>>>> +
>>>> +          - This token is not normally yielded by the lexer, but it
>>>> +            can be when ``skip_comment`` is False.
>>>> +          - ``tok`` is the value ``"#"``.
>>>> +          - ``val`` is a string including all chars until end-of-line.
>>>> +
>>>> +        - ``STRING``:
>>>> +
>>>> +          - ``tok`` is the ``"'"``, the single quote.
>>>> +          - ``value`` is the string, *excluding* the quotes.
>>>> +
>>>> +        - ``TRUE`` and ``FALSE``:
>>>> +
>>>> +          - ``tok`` is either ``"t"`` or ``"f"`` accordingly.
>>>> +          - ``val`` is either ``True`` or ``False`` accordingly.
>>>> +
>>>> +        - ``NEWLINE`` and ``SPACE``:
>>>> +
>>>> +          - These are consumed by the lexer directly. ``line_pos`` and
>>>> +            ``info`` are advanced when ``NEWLINE`` is encountered.
>>>> +            ``tok`` is set to ``None`` upon reaching EOF.
>>>> +
>>>> +        :param skip_comment:
>>>> +            When false, return ``COMMENT`` tokens.
>>>> +            This is used when reading documentation blocks.
>>>
>>> The doc string mostly describes possible state on return of accept().
>>> *Within* accept(), self.tok may be any character.
>>>
>>> "Mostly" because item ``NEWLINE`` and ``SPACE`` is about something that
>>> happens within accept().
>>>
>>
>> Almost kinda-sorta. The value of "tok" is important there, too.
> 
> --verbose?
> 

Fair enough. I'll trim it down. There is some future bleed from some 
experimental stuff I cut out here.

(It's been banished to some realm even further beyond pt5c, the 
oft-feared but seldom-mentioned pt7. Spoken of in frightened whispers, 
leading QAPI scholars are as of yet unable to confirm it truly exists.)

>>> Perhaps phrasing it as a postcondition would be clearer:
>>>
>>>       Read and store the next token.
>>>
>>>       On return, self.tok is the token type, self.info is describes its
>>>       source location, and self.value is the token's value.
>>>
>>>       The possible token types and their values are
>>>
>>>       ...
>>>
>>
>> OK, I will play with this suggestion while I try to clean up the docs.
>>
>>>> +        """
>>>>            while True:
>>>>                self.tok = self.src[self.cursor]
>>>>                self.pos = self.cursor
>>
>> Thanks for taking a look at this one.
> 
> Thank *you* for documenting my[*] code!
> 
> 
> [*] Some of it mine in the sense I wrote it, some of it mine in the
> sense I maintain it.
> 
> 

I assure you it's entirely selfish. I have the memory of a goldfish and 
the docs I wrote myself here have *already* come in handy for reminding 
myself what's going on in here.

--js


