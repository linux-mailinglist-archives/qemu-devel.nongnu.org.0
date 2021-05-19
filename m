Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD1538953E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:23:54 +0200 (CEST)
Received: from localhost ([::1]:53988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljQrJ-0006N6-Jy
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljQoy-0004Eu-En
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:21:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ljQoo-0000I2-7j
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:21:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621448475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oPVBVYAXqT6fgMFaqs2Bc55kxdETI64Uq6kOuEIR7Bc=;
 b=c273dgyDIi8W1BG7z5MFTvXPiRC56thwce6YLuKvYvh3unXE8CXaLAnLi0qLb7iMFDocsn
 81vkup8paI/alcRBI7EgM/PyHrby+zKIaPzr3R3skssTMJU+BWekv8ROILkG/7EjZE+2rs
 1OojyOTPHBhdaSZww+uVrmrbprTPIc4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-_lRy8maMPJecucZi8N0a8w-1; Wed, 19 May 2021 14:21:12 -0400
X-MC-Unique: _lRy8maMPJecucZi8N0a8w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2A2F1A8A63;
 Wed, 19 May 2021 18:21:11 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C9439473;
 Wed, 19 May 2021 18:21:11 +0000 (UTC)
Subject: Re: [PATCH v2 15/21] qapi/parser: add docstrings
To: Markus Armbruster <armbru@redhat.com>
References: <20210511220601.2110055-1-jsnow@redhat.com>
 <20210511220601.2110055-16-jsnow@redhat.com>
 <87h7iz1azx.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <537041f0-9691-4881-7274-81794ce6e0f2@redhat.com>
Date: Wed, 19 May 2021 14:21:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87h7iz1azx.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/19/21 2:41 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/parser.py | 68 ++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 68 insertions(+)
>>
>> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
>> index e80e0a7d965..ed543a2b7a4 100644
>> --- a/scripts/qapi/parser.py
>> +++ b/scripts/qapi/parser.py
>> @@ -47,7 +47,27 @@ def __init__(self, parser: 'QAPISchemaParser', msg: str):
>>   
>>   
>>   class QAPISchemaParser:
>> +    """
>> +    Performs syntactic parsing of a QAPI schema source file.
> 
> "Syntactic parsing" makes me wonder what non-syntactic parsing could be.
> 
> Also, PEP 257 wants imperative mood: "Perform X", not "Performs X".
> 
> What about a laconic "Parse QAPI schema source"?
> 

Sure. It was just that in an earlier review you seemed keen to spell out 
that this performs the lower-level parsing and not the uh, 
language-level parsing of the QAPI Schema language.

....ehhhhhhh whatever.

"Parse QAPI schema source" it is.

>>   
>> +    Parses a JSON-esque schema file, See qapi-code-gen.txt section
> 
> Imperative mood, please.  Period, not comma.
> 
>> +    "Schema Syntax" for more information. Grammatical validation
>> +    is handled later by `expr.check_exprs()`.
> 
> We could mention the processing of directives.  Perhaps:
> 
>         Parse a JSON-esque schema file.  See qapi-code-gen.txt section
>         "Schema Syntax" for the exact syntax.  Also process directives.
>         Grammatical validation is handled later by `expr.check_exprs()`.
> 
> What do you think?
> 

     Parse a JSON-esque schema file and process directives.  See 

     qapi-code-gen.txt section "Schema Syntax" for the exact syntax. 

     Grammatical validation is handled later by `expr.check_exprs()`. 


>> +
>> +    :param fname: Source filename.
>> +    :param previously_included:
>> +        The absolute pathnames of previously included source files,
> 
> Either file name / filename (either spelling, but let's pick one), or
> pathname, but not both, please.
> 
> Possible resolution:
> 
>         :param fname: Source file name.
>         :param previously_included:
>             The absolute names of previously included source files,
> 

You got it, boss.

>> +        if being invoked from another parser.
>> +    :param incl_info:
>> +       `QAPISourceInfo` belonging to the parent module.
>> +       ``None`` implies this is the root module.
>> +
>> +    :ivar exprs: Resulting parsed expressions.
>> +    :ivar docs: Resulting parsed documentation blocks.
>> +
>> +    :raise OSError: For problems opening the root schema document.
> 
> Hardly matters, but here we go: its both for open() and .read().  We
> could say "reading" instead of "opening".
> 

True enough. Fixed.

>> +    :raise QAPIError: For syntactic or semantic parsing errors.
> 
> "Semantic parsing errors" sounds like "triangular squares" :)
> 

I am horrified to learn that words mean things to people. I just pick 
the ones that are the prettiest and cause me to experience dopamine. Am 
I to believe that other people do otherwise?

> I figure you wrote this because we're using both QAPIParseError and
> QAPISemError.  The latter gets raised where we do more than just parse,
> e.g. in directive processing.  It hardly matters, as we don't really
> care for the difference between these error classes anywhere, and
> pragmatically use whatever class is convenient.
> 
> Perhaps we should have a single class with multiple constructors
> instead.  Even if yes, not now.
> 

Moving the column tracking stuff directly into QAPISourceInfo would be a 
way to do it. The special constructor there could go away. It could help 
solidify the token :: info correlation.

Then we don't need the two error classes anymore, really. Except for 
semantics, if we want them, to help provide hints at the CLI level about 
which phase went wrong.

Yes, later. Don't worry about it right now. I am facing similar design 
consideration challenges for my Async QMP client over trying to decide 
which errors to "hide" or wrap and which to promote as interface. 
Ongoing learning process for me.

> I recommend to gloss over (irrelevant) details and say "For parse
> errors".  Yes, some of the errors aren't parse errors in the theory of
> parsing sense, but I doubt readers care.  If *you* care, then maybe "For
> errors in the schema source".  And then you might want to tweak the
> OSError explanation to "For problems reading the root schema source
> file".
> 

I care a *little*. I am still trying to develop a sense of consistency 
for which things to document with :raise: and which I shouldn't.

(You are not the only person doing some guinea pig experiments and 
abusing a review process, you see ...)

I like the phrasing of "For errors in the schema source" more than "For 
parse errors" anyway. 1% less cryptic, even if the context is 
"inherently obvious".

>> +    """
>>       def __init__(self,
>>                    fname: str,
>>                    previously_included: Optional[Set[str]] = None,
>> @@ -73,6 +93,11 @@ def __init__(self,
>>           self._parse()
>>   
>>       def _parse(self) -> None:
>> +        """
>> +        Parse the QAPI schema document.
>> +
>> +        :return: None. Results are stored in ``.exprs`` and ``.docs``.
>> +        """
>>           cur_doc = None
>>   
>>           # May raise OSError; allow the caller to handle it.
>> @@ -199,6 +224,49 @@ def check_list_str(name: str, value: object) -> List[str]:
>>               raise QAPISemError(info, "unknown pragma '%s'" % name)
>>   
>>       def accept(self, skip_comment: bool = True) -> None:
>> +        """Read and store the next token.
>> +
>> +        :param skip_comment:
>> +            When false, return COMMENT tokens ("#").
>> +            This is used when reading documentation blocks.
>> +
>> +        :return:
>> +            None. Several instance attributes are updated instead:
>> +
>> +            - ``.tok`` represents the token type. See below for values.
>> +            - ``.info`` describes the token's source location.
>> +            - ``.val`` is the token's value, if any. See below.
>> +            - ``.pos`` is the buffer index of the first character of
>> +              the token.
>> +
>> +        * Single-character tokens:
>> +
>> +            These are "{", "}", ":", ",", "[", and "]". ``.tok`` holds
>> +            the single character and ``.val`` is None.
>> +
>> +        * Multi-character tokens:
>> +
>> +          * COMMENT:
>> +
>> +            This token is not normally returned by the lexer, but it can
>> +            be when ``skip_comment`` is False. ``.tok`` is "#", and
>> +            ``.val`` is a string including all chars until end-of-line,
>> +            including the "#" itself.
>> +
>> +          * STRING:
>> +
>> +            ``.tok`` is "'", the single quote. ``.val`` contains the
>> +            string, excluding the surrounding quotes.
>> +
>> +          * TRUE and FALSE:
>> +
>> +            ``.tok`` is either "t" or "f", ``.val`` will be the
>> +            corresponding bool value.
>> +
>> +          * EOF:
>> +
>> +            ``.tok`` and ``.val`` will both be None at EOF.
>> +        """
>>           while True:
>>               self.tok = self.src[self.cursor]
>>               self.pos = self.cursor
> 
> This doc string is much better now, thanks!
> 

Great! I took some liberties with your suggestions as I always do, but I 
like indicating the state changes in the :return: blurb in particular.

--js


