Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E670A362C8C
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 03:01:34 +0200 (CEST)
Received: from localhost ([::1]:41714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXZL3-000205-Jr
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 21:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lXZJo-00018q-6r
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 21:00:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lXZJi-0000k9-Ky
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 21:00:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618621209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b3LR9jqXNgTKUy0r8akeaJ6VPsxhzyboftBC8kiGdGM=;
 b=MuvDqIuiZutgXbquBOuPKquzgvWS4pPSOlcPmk37i8QAIsNP4U7r4yCvkEaO4AJ+pc2aHQ
 Alcd1JMktdh0HiezZy15fmHkckiVgwu496D3PB7atc0mhDyn4rzixAbA4F4fzCbCveuMs6
 FAAj2k1ugvpYF6+CTq5QxBw7hVjDQdY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-K6D1BdFDNyq5ewTUle-rsQ-1; Fri, 16 Apr 2021 21:00:06 -0400
X-MC-Unique: K6D1BdFDNyq5ewTUle-rsQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 280CA64159;
 Sat, 17 Apr 2021 01:00:05 +0000 (UTC)
Received: from [10.10.117.61] (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E20385D9C6;
 Sat, 17 Apr 2021 01:00:02 +0000 (UTC)
Subject: Re: [PATCH v4 16/19] qapi/expr.py: Add docstrings
To: Markus Armbruster <armbru@redhat.com>
References: <20210325060356.4040114-1-jsnow@redhat.com>
 <20210325060356.4040114-17-jsnow@redhat.com>
 <871rbckiuf.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <f958a02d-7c14-f6ee-4337-fc85ef567ee5@redhat.com>
Date: Fri, 16 Apr 2021 21:00:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <871rbckiuf.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On 4/14/21 11:04 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 

Thanks for taking this on. I realize it's a slog.

(Update: much later: AUUUGHHHHH WHY DID I DECIDE TO WRITE DOCS. MY HUBRIS)

>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/expr.py | 213 ++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 208 insertions(+), 5 deletions(-)
>>
>> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
>> index 1869ddf815..adc5b903bc 100644
>> --- a/scripts/qapi/expr.py
>> +++ b/scripts/qapi/expr.py
>> @@ -1,7 +1,5 @@
>>   # -*- coding: utf-8 -*-
>>   #
>> -# Check (context-free) QAPI schema expression structure
>> -#
>>   # Copyright IBM, Corp. 2011
>>   # Copyright (c) 2013-2019 Red Hat Inc.
>>   #
>> @@ -14,6 +12,25 @@
>>   # This work is licensed under the terms of the GNU GPL, version 2.
>>   # See the COPYING file in the top-level directory.
>>   
>> +"""
>> +Normalize and validate (context-free) QAPI schema expression structures.
>> +
>> +After QAPI expressions are parsed from disk, they are stored in
>> +recursively nested Python data structures using Dict, List, str, bool,
>> +and int. This module ensures that those nested structures have the
>> +correct type(s) and key(s) where appropriate for the QAPI context-free
>> +grammar.
> 
> "from disk"?  Perhaps something like "QAPISchemaParser parses the QAPI
> schema into abstract syntax trees consisting of dict, list, str, bool
> and int nodes."  This isn't quite accurate; it parses into a list of
> {'expr': AST, 'info': INFO}, but that's detail.
> 

Let's skip the detail; it doesn't help communicate purpose in the first 
paragraph here at the high level. The bulk of this module IS primarily 
concerned with the structures named.

Edited to:

`QAPISchemaParser` parses a QAPI schema into abstract syntax trees 
consisting of dict, list, str, bool, and int nodes. This module ensures 
that these nested structures have the correct type(s) and key(s) where 
appropriate for the QAPI context-free grammar.

(I replaced "the QAPI schema" with "a QAPI schema" as we have several; 
and I wanted to hint at (somehow) that this processes configurable input 
(i.e. "from disk") and not something indelibly linked.)

((What's wrong with "from disk?"))

> PEP 8: You should use two spaces after a sentence-ending period in
> multi- sentence comments, except after the final sentence.
> 

Is this a demand?

>> +
>> +The QAPI schema expression language allows for syntactic sugar; this
> 
> suggest "certain syntactic sugar".
> 

OK

>> +module also handles the normalization process of these nested
>> +structures.
>> +
>> +See `check_exprs` for the main entry point.
>> +
>> +See `schema.QAPISchema` for processing into native Python data
>> +structures and contextual semantic validation.
>> +"""
>> +
>>   import re
>>   from typing import (
>>       Collection,
>> @@ -31,9 +48,10 @@
>>   from .source import QAPISourceInfo
>>   
>>   
>> -# Deserialized JSON objects as returned by the parser;
>> -# The values of this mapping are not necessary to exhaustively type
>> -# here, because the purpose of this module is to interrogate that type.
>> +#: Deserialized JSON objects as returned by the parser.
>> +#:
>> +#: The values of this mapping are not necessary to exhaustively type
>> +#: here, because the purpose of this module is to interrogate that type.
> 
> First time I see #: comments; pardon my ignorance.  What's the deal?
> 

Sphinx-ese: It indicates that this comment is actually a block relating 
to the entity below. It also means that I can cross-reference 
`_JSONObject` in docstrings.

... which, because of the rewrite where I stopped calling this object an 
Expression to avoid overloading a term, is something I actually don't 
try to cross-reference anymore.

So this block can be dropped now, actually.

(Also: It came up in part one, actually: I snuck one in for EATSPACE, 
and reference it in the comment for cgen. We cannot cross-reference 
constants unless they are documented, and this is how we accomplish that.)

>>   _JSONObject = Dict[str, object]
>>   
>>   
>> @@ -48,11 +66,29 @@
>>   def check_name_is_str(name: object,
>>                         info: QAPISourceInfo,
>>                         source: str) -> None:
>> +    """Ensures that ``name`` is a string."""
> 
> PEP 257: The docstring [...] prescribes the function or method's effect
> as a command ("Do this", "Return that"), not as a description;
> e.g. don't write "Returns the pathname ...".
> 
> More of the same below.
> 

Alright.

While we're here, then ...

I take this to mean that you prefer:

:raise: to :raises:, and
:return: to :returns: ?

And since I need to adjust the verb anyway, I might as well use "Check" 
instead of "Ensure".

     """ 

     Check that ``name`` is a string. 

 

     :raise: QAPISemError when ``name`` is an incorrect type. 

     """

which means our preferred spellings should be:

:param: (and not parameter, arg, argument, key, keyword)
:raise: (and not raises, except, exception)
:var/ivar/cvar: (variable, instance variable, class variable)
:return: (and not returns)

Disallow these, as covered by the mypy signature:

:type:
:vartype:
:rtype:

>>       if not isinstance(name, str):
>>           raise QAPISemError(info, "%s requires a string name" % source)
>>   
>>   
>>   def check_name_str(name: str, info: QAPISourceInfo, source: str) -> str:
>> +    """
>> +    Ensures a string is a legal name.
> 
> I feel "legal" is best reserved to matters of law.  Suggest "valid QAPI
> name".
> 
> More of the same below.
> 

Yep, that's the type of review I like here. Getting the terms exactly 
correct. You've usually gone through some length to be consistent in 
your own writing, but it doesn't always stick with me.

(I want a jargon file...)

>> +
>> +    A legal name consists of ascii letters, digits, ``-``, and ``_``,
> 
> ASCII
> 
>> +    starting with a letter. The names of downstream extensions are
>> +    prefixed with an __com.example_ style prefix, allowing ``.`` and
>> +    ``-``.  An experimental name is prefixed with ``x-``, following the
>> +    RFQDN if present.
> 
> I get that "an _com.experimental style prefix" and "the RFQDN" mean the
> same thing, but can we make this clearer?  Perhaps
> 
>         A valid name consists of ascii letters, digits, ``-``, and ``_``,
>         starting with a letter.  It may be prefixed by a downstream
>         prefix of the form __RFQDN_, or the experimental prefix ``x-``.
>         If both prefixes are present, the __RFQDN_ prefix goes first.
> 

"It may be prefixed by a downstream prefix" seems redundant, but no 
better ideas. Adopted your phrasing wholesale.

> I'm clueless on proper use of `` in doc strings.  Can you educate me?
> 

It's just markup to get "literal" text. In practice, it renders in 
monospace. I may not have a great internal barometer for when it should 
be used or not. Some tendencies:

1. When referring to literal symbols without wanting to invoke any 
specific string literal syntax between languages, e.g. 'A' vs "A" might 
work well as ``A``.

2. When referring to parameter names, to intuit that this is a proper 
noun in the code. (The @foo syntax you use in qapi-doc is resolved to 
the equivalent of ``foo``when we generate those docs.)

3. Generally whenever I need to highlight symbols like ' " ` . _ - that 
might get confused for other punctuation, might accidentally render as 
markup, or otherwise need some kind of dressing.

Whenever the noun I want to address is something cross-referencable, I 
will instead use `thing` and Sphinx will decorate that reference as it 
deems appropriate for the type of symbol that it is.

>> +
>> +    A legal name cannot start with ``q_``, which is reserved.
>> +
>> +    :param name:   Name to check.
>> +    :param info:   QAPI source file information.
> 
> Suggest to say "QAPI schema source information", or maybe "QAPI schema
> source file information".
> 

OK

>> +    :param source: Human-readable str describing "what" this name is.
> 
> Could mention it's for use in error messages, but we have many similar
> parameters all over the place, so this would perhaps be more tiresome
> than helpful.  Fine as is.
> 

Yes, I struggled because I think it doesn't have a consistent "type" of 
string that it is -- sometimes it's just the name of the definition 
type, sometimes it's a small phrase. Grammatically, I guess it is the 
subject of the error sentence.

If you have a concrete suggestion, I'll take it. Otherwise, I'm just 
gonna make it worse.

>> +
>> +    :return: The stem of the valid name, with no prefixes.
>> +    """
>>       # Reserve the entire 'q_' namespace for c_name(), and for 'q_empty'
>>       # and 'q_obj_*' implicit type names.
>>       match = valid_name.match(name)
>> @@ -62,6 +98,12 @@ def check_name_str(name: str, info: QAPISourceInfo, source: str) -> str:
>>   
>>   
>>   def check_name_upper(name: str, info: QAPISourceInfo, source: str) -> None:
>> +    """
>> +    Ensures a string is a legal event name.
>> +
>> +    Checks the same criteria as `check_name_str`, but requires uppercase
>> +    and prohibits ``-``.
>> +    """
>>       stem = check_name_str(name, info, source)
>>       if re.search(r'[a-z-]', stem):
>>           raise QAPISemError(
>> @@ -71,6 +113,15 @@ def check_name_upper(name: str, info: QAPISourceInfo, source: str) -> None:
>>   def check_name_lower(name: str, info: QAPISourceInfo, source: str,
>>                        permit_upper: bool = False,
>>                        permit_underscore: bool = False) -> None:
>> +    """
>> +    Ensures a string is a legal user defined type name.
>> +
>> +    Checks the same criteria as `check_name_str`, but may impose
>> +    additional constraints.
> 
> Correct, but it leads to slightly awkward "permit_FOO: prohibit ... when
> false":
> 
>> +
>> +    :param permit_upper: Prohibits uppercase when false.
>> +    :param permit_underscore: Prohibits underscores when false.
>> +    """
> 
> Perhaps something like
> 
>         Ensure @str is a valid command or member name.
> 
>         This means it must be a valid QAPI name (as ensured by
>         check_name_str()), where the stem consists of lowercase
>         characters and '-'.
> 
>         :param permit_upper: Additionally permit uppercase.
>         :param permit_underscore: Additionally permit '_'.
> 
> We'd then want to update check_name_upper() and check_name_camel() for
> consistency.
> 
     """
     Check that ``name`` is a valid user defined type name.

     This means it must be a valid QAPI name as checked by
     `check_name_str()`, but where the stem prohibits uppercase
     characters and ``_``.

     :param permit_upper: Additionally permit uppercase.
     :param permit_underscore: Additionally permit ``_``.
     """

Using "but where" to highlight the differences, and removing the 
parenthetical to make the "see also" more clear to avoid repeating a 
paraphrase of what a valid QAPI name is.

Using literals to highlight @name, because otherwise there is no 
processing here that will do the same for us. It may be possible to 
extend Sphinx so that it will do it for us, if you are attached to that 
visual signifier in the code itself.

>>       stem = check_name_str(name, info, source)
>>       if ((not permit_upper and re.search(r'[A-Z]', stem))
>>               or (not permit_underscore and '_' in stem)):
>> @@ -79,12 +130,31 @@ def check_name_lower(name: str, info: QAPISourceInfo, source: str,
>>   
>>   
>>   def check_name_camel(name: str, info: QAPISourceInfo, source: str) -> None:
>> +    """
>> +    Ensures a string is a legal CamelCase name.
>> +
>> +    Checks the same criteria as `check_name_str`,
>> +    but additionally imposes a CamelCase constraint.
>> +    """
>>       stem = check_name_str(name, info, source)
>>       if not re.match(r'[A-Z][A-Za-z0-9]*[a-z][A-Za-z0-9]*$', stem):
>>           raise QAPISemError(info, "name of %s must use CamelCase" % source)
> 
> Related: we discussed renaming check_name_{upper,camel,lower} to
> check_name_{event,type,other} or check_name_{event,user_defined_type,
> command_or_member}.
> 

Yep, it's a *little* funny to have check_lower(allow_upper=True) ... but 
I am happy with a doc for now.

     """ 

     Check that ``name`` is a valid command or member name. 

 

     This means it must be a valid QAPI name as checked by 

     `check_name_str()`, but where the stem must be in CamelCase. 

     """

>>   
>>   
>>   def check_defn_name_str(name: str, info: QAPISourceInfo, meta: str) -> None:
>> +    """
>> +    Ensures a name is a legal definition name.
>> +
>> +    - 'event' names adhere to `check_name_upper`.
>> +    - 'command' names adhere to `check_name_lower`.
>> +    - All other names adhere to `check_name_camel`.
> 
> When is a name an 'event' name?  We should spell out how this uses
> @meta.  Perhaps something like:
> 
>         - If meta == 'event', ...
>         - If meta == 'command, ...
>         - Else, meta is a type, and ...
> 
>> +
>> +    All name types must not end with ``Kind`` nor ``List``.
> 
> Do you mean "type names"?
> 

I meant "all categories of names".

"All names must not end with ``Kind`` nor ``List``."

> Outside this patch's scope: qapi-code-gen.txt reserves suffixes Kind and
> List only for type names, but the code rejects them for events and
> commands, too.  One of them should be changed to match the other.
> 

Instinct is that code should change to match the "spec", as it probably 
best represents your intent. Laziness suggests that updating the "spec" 
means I don't have to write new tests.

>> +
>> +    :param name: Name to check.
>> +    :param info: QAPI source file information.
>> +    :param meta: Type name of the QAPI expression.
>> +    """
> 
> Glosses over the use of pragma command-name-exceptions.  Do we mind?
> 

Mmmm. Nah? I think if you're digging that deep by now you'll have 
noticed that check_name_lower() takes some parameters, so the shorter 
statement isn't lying. It just isn't telling you exactly how the 
parameters are decided.

>>       if meta == 'event':
>>           check_name_upper(name, info, meta)
>>       elif meta == 'command':
>> @@ -103,6 +173,15 @@ def check_keys(value: _JSONObject,
>>                  source: str,
>>                  required: Collection[str],
>>                  optional: Collection[str]) -> None:
>> +    """
>> +    Ensures an object has a specific set of keys.
>> +
>> +    :param value:    The object to check.
>> +    :param info:     QAPI source file information.
>> +    :param source:   Human-readable str describing this value.
>> +    :param required: Keys that *must* be present.
>> +    :param optional: Keys that *may* be present.
>> +    """
>>   

Style check: Avoid the two-column approach for stuff like this, too? 
Also, reminder to self, update the phrasing on ALL :param info: statements.

>>       def pprint(elems: Iterable[str]) -> str:
>>           return ', '.join("'" + e + "'" for e in sorted(elems))
>> @@ -125,6 +204,12 @@ def pprint(elems: Iterable[str]) -> str:
>>   
>>   
>>   def check_flags(expr: _JSONObject, info: QAPISourceInfo) -> None:
>> +    """
>> +    Ensures common fields in an expression are correct.
> 
> Rather vague.  The function is really about checking "flag" members,
> i.e. members that must have a boolean value.  Perhaps
> 
>         Ensure flag members (if present) have valid values.
> 

Done!

>> +
>> +    :param expr: Expression to validate.
>> +    :param info: QAPI source file information.
>> +    """
>>       for key in ['gen', 'success-response']:
>>           if key in expr and expr[key] is not False:
>>               raise QAPISemError(
>> @@ -143,7 +228,22 @@ def check_flags(expr: _JSONObject, info: QAPISourceInfo) -> None:
>>   
>>   
>>   def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) -> None:
>> +    """
>> +    Syntactically validate and normalize the ``if`` field of an object.
> 
> qapi-code-gen.txt consistently uses "member", not "field".  Let's stick
> to "member".
> 

Good, thanks.

>>   
>> +    The ``if`` field may be either a ``str`` or a ``List[str]``.
>> +    A ``str`` element will be normalized to ``List[str]``.
> 
> element?  I think you mean value.
> 

Err, yeah. because... it's a single element ... of the list we're gonna 
make. Get it? (:

(Fixed.)

> Doesn't spell out how str is normalized to List[str], but I guess that's
> obvious enough.
> 
>> +
>> +    :forms:
>> +      :sugared: ``Union[str, List[str]]``
>> +      :canonical: ``List[str]``
> 
> Uh... :param FOO: and :return: are obvious enough, but this :forms:
> stuff feels a bit too fancy for me to rely on voodoo understanding.  Can
> you point me to :documentation:?
> 

Haha.

https://docutils.sourceforge.io/docs/user/rst/quickref.html#field-lists

The "canonical" field lists we use are just special ones that have been 
bookmarked by Sphinx as having special significance. You can use others 
arbitrarily, if you want.

This nests them to achieve a multi-column thing.

Forms: Sugared:   Foo
        Canonical: Bar

>> +
>> +    :param expr: A ``dict``.
> 
> Elsewhere, you have "the object to check", which I like better.
> 

I agree. I was not careful about not accidentally repeating type 
information where it wasn't necessary. Semantic descriptions and not 
mechanical descriptions are certainly preferred. Fixed!

>> +                 The ``if`` field, if present, will be validated.
>> +    :param info: QAPI source file information.
>> +
>> +    :return: None, ``expr`` is normalized in-place as needed.
>> +    """
>>       ifcond = expr.get('if')
>>       if ifcond is None:
>>           return
>> @@ -167,6 +267,20 @@ def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) -> None:
>>   
>>   
>>   def normalize_members(members: object) -> None:
>> +    """
>> +    Normalize a "members" value.
>> +
>> +    If ``members`` is an object, for every value in that object, if that
> 
> If it's a dict, actually.
> 

Sigh, yeah. Working at the boundary between two languages is going to 
murder what's left of my sanity, I can feel it.

>> +    value is not itself already an object, normalize it to
>> +    ``{'type': value}``.
>> +
>> +    :forms:
>> +      :sugared: ``Dict[str, Union[str, TypeRef]]``
>> +      :canonical: ``Dict[str, TypeRef]``
>> +
>> +    :param members: The members object to normalize.
>> +    :return: None, ``members`` is normalized in-place as needed.
>> +    """
>>       if isinstance(members, dict):
>>           for key, arg in members.items():
>>               if isinstance(arg, dict):
>> @@ -179,6 +293,23 @@ def check_type(value: Optional[object],
>>                  source: str,
>>                  allow_array: bool = False,
>>                  allow_dict: Union[bool, str] = False) -> None:
>> +    """
>> +    Check the QAPI type of ``value``.
>> +
>> +    Python types of ``str`` or ``None`` are always allowed.
>> +
>> +    :param value:       The value to check.
>> +    :param info:        QAPI Source file information.
>> +    :param source:      Human-readable str describing this value.
>> +    :param allow_array: Allow a ``List[str]`` of length 1,
>> +                        which indicates an Array<T> type.
> 
> Leaves open where T comes from.  Perhaps "indicates an array of the type
> named by the list element".
> 

Fair.

>> +    :param allow_dict:  Allow a dict, treated as an anonymous type.
> 
> "treated as anonymous type" isn't quite right.  The dict is either
> MEMBERS or BRANCHES in qapi-code-gen.txt parlance.  The former is like
> an anonymous struct type, the latter isn't.
> 

Oh, yes. Ehm.

>> +                        When given a string, check if that name is
>> +                        allowed to have keys that use uppercase letters,
>> +                        and modify validation accordingly.
> 
> The second sentence feels both cryptic and vague.
> 

This weird ol' function signature is not done torturing me.

Maybe:

     :param allow_dict: Allow a dict, which represents a union branch
         or an anonymous struct type. This parameter may be given the
         struct or union name ``value`` under consideration. In this
         case, the name is used to conditionally allow less strict name
         validation, based on `QAPISchemaPragma`.

(Oh, you suggested a fix below. Oops.)

Argh. Maybe I'll just 'fix' this to have a slightly more laborious 
signature.

def check_type(value: Optional[object],
                info: QAPISourceInfo,
	       source: str,
	       allow_array: bool = False,
                allow_dict: bool = False,
                defn_name: str = '')

and then

-    permissive = False
-    if isinstance(allow_dict, str):
-        permissive = allow_dict in info.pragma.member_name_exceptions
+    permissive = defn_name and defn_name in 
info.pragma.member_name_exceptions

and callers just have to specify both:

check_type(..., allow_dict=True, defn_name=name)

and then say:

:param allow_dict: Allow ``value`` to be a dict, representing a union
     branch or an anonymous struct type.
:param defn_name: The struct or union name under consideration. Used to
     conditionally allow more permissive member name validation based on
    `QAPISchemaPragma`.


Stuff for later?

>> +
>> +    :return: None, ``value`` is normalized in-place as needed.
> 
> First mention of normalization.  I think we normalize only dicts.
> 

No, I also use that term in the docstrings for this module, check_if, 
and normalize_members above. (Maybe your review is non-linear. No problem.)

I consider desugaring a form of input normalization. I have mentioned it 
for :return: to suggest that although there is no return value on the 
stack, the value passed (or a descendant thereof) *may* be modified.

(That is, this isn't "just" a check function, it CAN modify your input!)

It may occur here because of our call to check_if().

> Perhaps:
> 
>         :param allow_dict: Allow a dict.  Its members can be struct type
>             members or union branches.  When the value of @allow_dict is
>             in pragma member-name-exceptions, the dict's keys may violate
>             the member naming rules.  The dict members are normalized in
>             place.
> 
> Still neglects to explain we normalize.
> 
> Also note the indentation style: it produces reasonable text width
> regardless of parameter name length.  Slightly different way to get
> that:
> 
>         :param allow_dict:
>             Allow a dict.  Its members can be struct type members or
>             union branches.  When the value of @allow_dict is in pragma
>             member-name-exceptions, the dict's keys may violate the
>             member naming rules.  The dict members are normalized in
>             place.
> 

Oh, I like that style a lot -- it helps preserve the "term / definition" 
visual distinction. I may adopt that for any definition longer than a 
single-line.

I'll probably adopt it for this patch and beyond.

>> +    """
>>       if value is None:
>>           return
>>   
>> @@ -227,6 +358,21 @@ def check_type(value: Optional[object],
>>   
>>   def check_features(features: Optional[object],
>>                      info: QAPISourceInfo) -> None:
>> +    """
>> +    Syntactically validate and normalize the ``features`` field.
>> +
>> +    ``features`` may be a ``list`` of either ``str`` or ``dict``.
>> +    Any ``str`` element will be normalized to ``{'name': element}``.
>> +
>> +    :forms:
>> +      :sugared: ``List[Union[str, Feature]]``
>> +      :canonical: ``List[Feature]``
>> +
>> +    :param features: an optional list of either str or dict.
>> +    :param info: QAPI Source file information.
>> +
>> +    :return: None, ``features`` is normalized in-place as needed.
>> +    """
>>       if features is None:
>>           return
>>       if not isinstance(features, list):
>> @@ -244,6 +390,14 @@ def check_features(features: Optional[object],
>>   
>>   
>>   def check_enum(expr: _JSONObject, info: QAPISourceInfo) -> None:
>> +    """
>> +    Validate this expression as an ``enum`` definition.
>> +
>> +    :param expr: The expression to validate.
>> +    :param info: QAPI source file information.
>> +
>> +    :return: None, ``expr`` is normalized in-place as needed.
>> +    """
> 
> Unlike the one for check_features(), this one doesn't describe how we
> normalize.  More of the same below.  Observation, not demand.
> 

I didn't mention specifics because another helper actually does the 
work; it's done through descendant calls on fields that may only be 
optionally present.

I tried to keep a consistent phrasing for it.

>>       name = expr['enum']
>>       members = expr['data']
>>       prefix = expr.get('prefix')
>> @@ -273,6 +427,14 @@ def check_enum(expr: _JSONObject, info: QAPISourceInfo) -> None:
>>   
>>   
>>   def check_struct(expr: _JSONObject, info: QAPISourceInfo) -> None:
>> +    """
>> +    Validate this expression as a ``struct`` definition.
>> +
>> +    :param expr: The expression to validate.
>> +    :param info: QAPI source file information.
>> +
>> +    :return: None, ``expr`` is normalized in-place as needed.
>> +    """
>>       name = cast(str, expr['struct'])  # Asserted in check_exprs
>>       members = expr['data']
>>   
>> @@ -281,6 +443,14 @@ def check_struct(expr: _JSONObject, info: QAPISourceInfo) -> None:
>>   
>>   
>>   def check_union(expr: _JSONObject, info: QAPISourceInfo) -> None:
>> +    """
>> +    Validate this expression as a ``union`` definition.
>> +
>> +    :param expr: The expression to validate.
>> +    :param info: QAPI source file information.
>> +
>> +    :return: None, ``expr`` is normalized in-place as needed.
>> +    """
>>       name = cast(str, expr['union'])  # Asserted in check_exprs
>>       base = expr.get('base')
>>       discriminator = expr.get('discriminator')
>> @@ -309,6 +479,14 @@ def check_union(expr: _JSONObject, info: QAPISourceInfo) -> None:
>>   
>>   
>>   def check_alternate(expr: _JSONObject, info: QAPISourceInfo) -> None:
>> +    """
>> +    Validate this expression as an ``alternate`` definition.
>> +
>> +    :param expr: The expression to validate.
>> +    :param info: QAPI source file information.
>> +
>> +    :return: None, ``expr`` is normalized in-place as needed.
>> +    """
>>       members = expr['data']
>>   
>>       if not members:
>> @@ -326,6 +504,14 @@ def check_alternate(expr: _JSONObject, info: QAPISourceInfo) -> None:
>>   
>>   
>>   def check_command(expr: _JSONObject, info: QAPISourceInfo) -> None:
>> +    """
>> +    Validate this expression as a ``command`` definition.
>> +
>> +    :param expr: The expression to validate.
>> +    :param info: QAPI source file information.
>> +
>> +    :return: None, ``expr`` is normalized in-place as needed.
>> +    """
>>       args = expr.get('data')
>>       rets = expr.get('returns')
>>       boxed = expr.get('boxed', False)
>> @@ -337,6 +523,14 @@ def check_command(expr: _JSONObject, info: QAPISourceInfo) -> None:
>>   
>>   
>>   def check_event(expr: _JSONObject, info: QAPISourceInfo) -> None:
>> +    """
>> +    Normalize and validate this expression as an ``event`` definition.
>> +
>> +    :param expr: The expression to validate.
>> +    :param info: QAPI source file information.
>> +
>> +    :return: None, ``expr`` is normalized in-place as needed.
>> +    """
>>       args = expr.get('data')
>>       boxed = expr.get('boxed', False)
>>   
>> @@ -346,6 +540,15 @@ def check_event(expr: _JSONObject, info: QAPISourceInfo) -> None:
>>   
>>   
>>   def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
>> +    """
>> +    Validate and normalize a list of parsed QAPI schema expressions.
>> +
>> +    This function accepts a list of expressions + metadta as returned by
> 
> Typo: metadata.
> 

I've invented a new kind of data, actually.

(Fixed.)

>> +    the parser. It destructively normalizes the expressions in-place.
>> +
>> +    :param exprs: The list of expressions to normalize/validate.
>> +    :return: The same list of expressions (now modified).
>> +    """
>>       for expr_elem in exprs:
>>           # Expression
>>           assert isinstance(expr_elem['expr'], dict)

Made a bunch of changes, but held off on trying to "finish" it; I want 
to make a checklist for myself to review with your counter-feedback and 
methodically revise it all in one shot.

Thanks!

--js


