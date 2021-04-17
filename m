Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F06B0362F62
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 12:55:14 +0200 (CEST)
Received: from localhost ([::1]:54908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXibZ-00015R-ML
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 06:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lXiZg-0000dk-Tn
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 06:53:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lXiZc-00063E-9V
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 06:53:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618656790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u0lQEbvVNnvbQX7xtksnpTUMiw58ZsYyI8pqIDsybTE=;
 b=VxM0jzwVsBUYjqpjzPUNl1zM0CrHKiq5XCFqk1UDMaj59pm+uX4Mhs784e6fh73/DtDTqa
 vbWTMUyDPFumsVSSNgtniSGr+KSpxI4efBi1RwLT2IihT9wqsb6CPyzCW1+3Zpm3gcDcAm
 1joPeG8nBSW+xZce944iuY9GR6L0nmI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-OZ8OW2SFOtKq53GIo_oQHg-1; Sat, 17 Apr 2021 06:53:05 -0400
X-MC-Unique: OZ8OW2SFOtKq53GIo_oQHg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8114E107ACCA;
 Sat, 17 Apr 2021 10:53:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B66419CA0;
 Sat, 17 Apr 2021 10:53:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 348D8113525D; Sat, 17 Apr 2021 12:52:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 02/19] flake8: Enforce shorter line length for
 comments and docstrings
References: <20210325060356.4040114-1-jsnow@redhat.com>
 <20210325060356.4040114-3-jsnow@redhat.com>
 <878s5i5rgm.fsf@dusky.pond.sub.org>
 <929a61e6-dde7-597a-d741-79b6be44ff14@redhat.com>
Date: Sat, 17 Apr 2021 12:52:51 +0200
In-Reply-To: <929a61e6-dde7-597a-d741-79b6be44ff14@redhat.com> (John Snow's
 message of "Fri, 16 Apr 2021 16:25:38 -0400")
Message-ID: <87fszp18u4.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

John Snow <jsnow@redhat.com> writes:

> On 4/16/21 8:44 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> PEP8's BDFL writes: "For flowing long blocks of text with fewer
>>> structural restrictions (docstrings or comments), the line length should
>>> be limited to 72 characters."
>>>
>>> I do not like this patch. I have included it explicitly to recommend we
>>> do not pay any further heed to the 72 column limit.
>> 
>> Let me go through the patch hunk by hunk to see what I like and what I
>> don't like.
>> 
>> In case you'd prefer not to pay any further heed to line length: please
>> check out my comment on c_name() anyway.  It's about doc string style,
>> and relevant regardless of line length limits.
>> 
>
> Right, yeah. I just don't think this is productive right now. I'll read 
> it, though!

Thanks!

>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> ---
>>>   scripts/qapi/.flake8       |  1 +
>>>   scripts/qapi/common.py     |  8 +++++---
>>>   scripts/qapi/events.py     |  9 +++++----
>>>   scripts/qapi/gen.py        |  8 ++++----
>>>   scripts/qapi/introspect.py |  8 +++++---
>>>   scripts/qapi/main.py       |  4 ++--
>>>   scripts/qapi/parser.py     | 15 ++++++++-------
>>>   scripts/qapi/schema.py     | 23 +++++++++++++----------
>>>   scripts/qapi/types.py      |  7 ++++---
>>>   9 files changed, 47 insertions(+), 36 deletions(-)
>>>
>>> diff --git a/scripts/qapi/.flake8 b/scripts/qapi/.flake8
>>> index 6b158c68b8..4f00455290 100644
>>> --- a/scripts/qapi/.flake8
>>> +++ b/scripts/qapi/.flake8
>>> @@ -1,2 +1,3 @@
>>>   [flake8]
>>>   extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
>>> +max-doc-length = 72
>>> \ No newline at end of file
>> 
>> Since we intend to make use of PEP 8's license to go over the line
>> length limit, having the build gripe about it is not useful.  Drop.
>> 
>>> diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
>>> index cbd3fd81d3..6e3d9b8ecd 100644
>>> --- a/scripts/qapi/common.py
>>> +++ b/scripts/qapi/common.py
>>> @@ -41,7 +41,8 @@ def camel_to_upper(value: str) -> str:
>>>       length = len(c_fun_str)
>>>       for i in range(length):
>>>           char = c_fun_str[i]
>>> -        # When char is upper case and no '_' appears before, do more checks
>>> +        # When char is upper case and no '_' appears before,
>>> +        # do more checks
>>>           if char.isupper() and (i > 0) and c_fun_str[i - 1] != '_':
>>>               if i < length - 1 and c_fun_str[i + 1].islower():
>>>                   new_name += '_'
>> 
>> The comment paraphrases the if condition.  Feels useless.  Let's drop
>> it.
>> 
>>> @@ -78,8 +79,9 @@ def c_name(name: str, protect: bool = True) -> str:
>>>       protect=True: 'int' -> 'q_int'; protect=False: 'int' -> 'int'
>>>   
>>>       :param name: The name to map.
>>> -    :param protect: If true, avoid returning certain ticklish identifiers
>>> -                    (like C keywords) by prepending ``q_``.
>>> +    :param protect: If true, avoid returning certain ticklish
>>> +                    identifiers (like C keywords) by prepending
>>> +                    ``q_``.
>> 
>> Better:
>> 
>>         :param protect: If true, avoid returning certain ticklish
>>             identifiers (like C keywords) by prepending ``q_``.
>> 
>> For what it's worth, this indentation style is also used in the
>> Sphinx-RTD-Tutorial[*].  I like it much better than aligning the text
>> like you did, because that wastes screen real estate when the parameter
>> names are long, and tempts people to aligning all the parameters, like
>> 
>>         :param name:    The name to map.
>>         :param protect: If true, avoid returning certain ticklish identifiers
>>                         (like C keywords) by prepending ``q_``.
>> 
>> which leads to either churn or inconsistency when parameters with longer
>> names get added.
>> 
>
> Yeah, that should be fine. I don't like the wasted margin space either, 
> but I suppose I like the "two column" layout for ease of visual 
> distinction of the parameter names. I suppose it isn't really worth the 
> kind of column-reformatting churn and the wasted space.
>
> ...And if we do print a sphinx manual for this, I'll get my visual 
> distinction there in the rendered output. I'm fine with adopting this 
> style to cover the entire Python codebase.
>
> It will be an eventual thing, though: I think we need to agree on a 
> style guide document and in that same series, fix up the instances of 
> defying that guide. I think it's important to pair that work, because 
> the ease of finding and fixing those style deviations will help inform 
> how pragmatic the style guide is.

Makes sense.

The introduction of "sphinxy" doc strings (starting with commit
adcb9b36c) may have been premature.

> I feel like it's something I want to do very soon, but not right now. 
> Maybe during the next freeze we can tackle it?

Whenever you're ready.

Until then, I feel we should try to minimize doc string churn.  Leave
existing doc strings alone unless they're harmful.  Add new ones only
when we believe they're helpful enough to justify some churn later.

>>>       """
>>>       # ANSI X3J11/88-090, 3.1.1
>>>       c89_words = set(['auto', 'break', 'case', 'char', 'const', 'continue',
>>> diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
>>> index fee8c671e7..210b56974f 100644
>>> --- a/scripts/qapi/events.py
>>> +++ b/scripts/qapi/events.py
>>> @@ -48,7 +48,8 @@ def gen_param_var(typ: QAPISchemaObjectType) -> str:
>>>       """
>>>       Generate a struct variable holding the event parameters.
>>>   
>>> -    Initialize it with the function arguments defined in `gen_event_send`.
>>> +    Initialize it with the function arguments defined in
>>> +    `gen_event_send`.
>>>       """
>>>       assert not typ.variants
>>>       ret = mcgen('''
>> 
>> Looks like a wash.  I figure the doc string will be rewritten to Sphinx
>> format (or whatever other format we adopt for our Python code) anyway,
>> so let's not mess with it now.
>> 
>>> @@ -86,9 +87,9 @@ def gen_event_send(name: str,
>>>       # FIXME: Our declaration of local variables (and of 'errp' in the
>>>       # parameter list) can collide with exploded members of the event's
>>>       # data type passed in as parameters.  If this collision ever hits in
>>> -    # practice, we can rename our local variables with a leading _ prefix,
>>> -    # or split the code into a wrapper function that creates a boxed
>>> -    # 'param' object then calls another to do the real work.
>>> +    # practice, we can rename our local variables with a leading _
>>> +    # prefix, or split the code into a wrapper function that creates a
>>> +    # boxed 'param' object then calls another to do the real work.
>>>       have_args = boxed or (arg_type and not arg_type.is_empty())
>>>   
>>>       ret = mcgen('''
>> 
>> Improvement.
>> 
>>> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
>>> index 1fa503bdbd..c54980074e 100644
>>> --- a/scripts/qapi/gen.py
>>> +++ b/scripts/qapi/gen.py
>>> @@ -63,9 +63,9 @@ def _bottom(self) -> str:
>>>           return ''
>>>   
>>>       def write(self, output_dir: str) -> None:
>>> -        # Include paths starting with ../ are used to reuse modules of the main
>>> -        # schema in specialised schemas. Don't overwrite the files that are
>>> -        # already generated for the main schema.
>>> +        # Include paths starting with ../ are used to reuse modules
>>> +        # of the main schema in specialised schemas. Don't overwrite
>>> +        # the files that are already generated for the main schema.
>>>           if self.fname.startswith('../'):
>>>               return
>>>           pathname = os.path.join(output_dir, self.fname)
>> 
>> Improvement, but mind PEP 8's "You should use two spaces after a
>> sentence-ending period in multi-sentence comments".
>> 
>
> How important is this, and why? My existing prejudice is that it's only 
> a superficial detail of writing with no real impact.

Holy wars have been fought over less.

> (Of course, a single space typist WOULD believe that, wouldn't they? 
> Those single-space typists are all the same!)

I offer three reasons:

* Local consistency

* Stick to PEP 8 unless you have good reason not to.

* It makes Emacs sentence commands work by default.

>>> @@ -189,7 +189,7 @@ def _bottom(self) -> str:
>>>   @contextmanager
>>>   def ifcontext(ifcond: Sequence[str], *args: QAPIGenCCode) -> Iterator[None]:
>>>       """
>>> -    A with-statement context manager that wraps with `start_if()` / `end_if()`.
>>> +    A context manager that wraps output with `start_if()` / `end_if()`.
>>>   
>>>       :param ifcond: A sequence of conditionals, passed to `start_if()`.
>>>       :param args: any number of `QAPIGenCCode`.
>> 
>> Improvement.
>> 
>>> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
>>> index 9a348ca2e5..faf00013ad 100644
>>> --- a/scripts/qapi/introspect.py
>>> +++ b/scripts/qapi/introspect.py
>>> @@ -61,8 +61,9 @@
>>>   # With optional annotations, the type of all values is:
>>>   # JSONValue = Union[_Value, Annotated[_Value]]
>>>   #
>>> -# Sadly, mypy does not support recursive types; so the _Stub alias is used to
>>> -# mark the imprecision in the type model where we'd otherwise use JSONValue.
>>> +# Sadly, mypy does not support recursive types; so the _Stub alias is
>>> +# used to mark the imprecision in the type model where we'd otherwise
>>> +# use JSONValue.
>>>   _Stub = Any
>>>   _Scalar = Union[str, bool, None]
>>>   _NonScalar = Union[Dict[str, _Stub], List[_Stub]]
>> 
>> Improvement.
>> 
>>> @@ -217,7 +218,8 @@ def visit_end(self) -> None:
>>>           self._name_map = {}
>>>   
>>>       def visit_needed(self, entity: QAPISchemaEntity) -> bool:
>>> -        # Ignore types on first pass; visit_end() will pick up used types
>>> +        # Ignore types on first pass;
>>> +        # visit_end() will pick up used types
>> 
>> Looks a bit odd.  Since the original is only slightly over the limit, we
>> can keep it.  Alternatively.
>> 
>>             # Ignore types on first pass; visit_end() will pick up the
>>             # types that are actually used
>> 
>>>           return not isinstance(entity, QAPISchemaType)
>>>   
>>>       def _name(self, name: str) -> str:
>>> diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
>>> index 703e7ed1ed..5bcac83985 100644
>>> --- a/scripts/qapi/main.py
>>> +++ b/scripts/qapi/main.py
>>> @@ -1,5 +1,5 @@
>>> -# This work is licensed under the terms of the GNU GPL, version 2 or later.
>>> -# See the COPYING file in the top-level directory.
>>> +# This work is licensed under the terms of the GNU GPL, version 2 or
>>> +# later. See the COPYING file in the top-level directory.
>> 
>> Let's drop this one.  The line is only slightly too long, and
>> consistency with the copright notices elsewhere is more important.
>> 
>>>   
>>>   """
>>>   QAPI Generator
>>> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
>>> index 58267c3db9..d5bf91f2b0 100644
>>> --- a/scripts/qapi/parser.py
>>> +++ b/scripts/qapi/parser.py
>>> @@ -331,8 +331,8 @@ def __init__(self, parser, name=None, indent=0):
>>>               self._indent = indent
>>>   
>>>           def append(self, line):
>>> -            # Strip leading spaces corresponding to the expected indent level
>>> -            # Blank lines are always OK.
>>> +            # Strip leading spaces corresponding to the expected indent
>>> +            # level. Blank lines are always OK.
>>>               if line:
>>>                   indent = re.match(r'\s*', line).end()
>>>                   if indent < self._indent:
>> 
>> Improvement, but mind PEP 8's "You should use two spaces after a
>> sentence-ending period".
>> 
>>> @@ -353,10 +353,10 @@ def connect(self, member):
>>>               self.member = member
>>>   
>>>       def __init__(self, parser, info):
>>> -        # self._parser is used to report errors with QAPIParseError.  The
>>> -        # resulting error position depends on the state of the parser.
>>> -        # It happens to be the beginning of the comment.  More or less
>>> -        # servicable, but action at a distance.
>>> +        # self._parser is used to report errors with QAPIParseError.
>>> +        # The resulting error position depends on the state of the
>>> +        # parser. It happens to be the beginning of the comment. More
>>> +        # or less servicable, but action at a distance.
>>>           self._parser = parser
>>>           self.info = info
>>>           self.symbol = None
>> 
>> Why not.  Two spaces again.
>> 
>>> @@ -430,7 +430,8 @@ def _append_body_line(self, line):
>>>               if not line.endswith(':'):
>>>                   raise QAPIParseError(self._parser, "line should end with ':'")
>>>               self.symbol = line[1:-1]
>>> -            # FIXME invalid names other than the empty string aren't flagged
>>> +            # FIXME invalid names other than the empty string aren't
>>> +            # flagged
>>>               if not self.symbol:
>>>                   raise QAPIParseError(self._parser, "invalid name")
>>>           elif self.symbol:
>> 
>> Not an improvement, drop the hunk.
>> 
>>> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
>>> index 703b446fd2..01cdd753cd 100644
>>> --- a/scripts/qapi/schema.py
>>> +++ b/scripts/qapi/schema.py
>>> @@ -166,9 +166,10 @@ def is_user_module(cls, name: str) -> bool:
>>>       @classmethod
>>>       def is_builtin_module(cls, name: str) -> bool:
>>>           """
>>> -        The built-in module is a single System module for the built-in types.
>>> +        Return true when given the built-in module name.
>>>   
>>> -        It is always "./builtin".
>>> +        The built-in module is a specific System module for the built-in
>>> +        types. It is always "./builtin".
>>>           """
>>>           return name == cls.BUILTIN_MODULE_NAME
>>>   
>> 
>> I figure the doc string will be rewritten to Sphinx format anyway, so
>> let's not mess with it now.
>> 
>>> @@ -294,7 +295,8 @@ def connect_doc(self, doc=None):
>>>               m.connect_doc(doc)
>>>   
>>>       def is_implicit(self):
>>> -        # See QAPISchema._make_implicit_enum_type() and ._def_predefineds()
>>> +        # See QAPISchema._make_implicit_enum_type() and
>>> +        # ._def_predefineds()
>>>           return self.name.endswith('Kind') or self.name == 'QType'
>>>   
>>>       def c_type(self):
>> 
>> Not an improvement, drop the hunk.
>> 
>>> @@ -421,9 +423,9 @@ def check(self, schema):
>>>   
>>>           self.members = members  # mark completed
>>>   
>>> -    # Check that the members of this type do not cause duplicate JSON members,
>>> -    # and update seen to track the members seen so far. Report any errors
>>> -    # on behalf of info, which is not necessarily self.info
>>> +    # Check that the members of this type do not cause duplicate JSON
>>> +    # members, and update seen to track the members seen so far. Report
>>> +    # any errors on behalf of info, which is not necessarily self.info
>>>       def check_clash(self, info, seen):
>>>           assert self._checked
>>>           assert not self.variants       # not implemented
>> 
>> Improvement.  Two spaces again.
>> 
>>> @@ -494,11 +496,12 @@ def __init__(self, name, info, doc, ifcond, features, variants):
>>>       def check(self, schema):
>>>           super().check(schema)
>>>           self.variants.tag_member.check(schema)
>>> -        # Not calling self.variants.check_clash(), because there's nothing
>>> -        # to clash with
>>> +        # Not calling self.variants.check_clash(), because there's
>>> +        # nothing to clash with
>>>           self.variants.check(schema, {})
>>> -        # Alternate branch names have no relation to the tag enum values;
>>> -        # so we have to check for potential name collisions ourselves.
>>> +        # Alternate branch names have no relation to the tag enum
>>> +        # values; so we have to check for potential name collisions
>>> +        # ourselves.
>>>           seen = {}
>>>           types_seen = {}
>>>           for v in self.variants.variants:
>> 
>> Why not.
>> 
>>> diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
>>> index 20d572a23a..2e67ab1752 100644
>>> --- a/scripts/qapi/types.py
>>> +++ b/scripts/qapi/types.py
>>> @@ -35,8 +35,8 @@
>>>   from .source import QAPISourceInfo
>>>   
>>>   
>>> -# variants must be emitted before their container; track what has already
>>> -# been output
>>> +# variants must be emitted before their container; track what has
>>> +# already been output
>>>   objects_seen = set()
>>>   
>>>   
>> 
>> Why not.
>> 
>>> @@ -297,7 +297,8 @@ def _begin_user_module(self, name: str) -> None:
>>>   '''))
>>>   
>>>       def visit_begin(self, schema: QAPISchema) -> None:
>>> -        # gen_object() is recursive, ensure it doesn't visit the empty type
>>> +        # gen_object() is recursive, ensure
>>> +        # it doesn't visit the empty type
>> 
>> Looks a bit odd.  Since the original is only slightly over the limit, we
>> can keep it.
>> 
>> Pattern: turning single line comments into multi-line comments to avoid
>> small length overruns is usually not an improvement.
>> 
>
> Yep, that's my core argument against turning on the option for flake8. 
> Usually rephrasing is better than re-flowing, but that wasn't always 
> easy either. (I don't like rewriting things to be less terse, I find it 
> unpleasant, sorry!)
>
> Unfortunately, omitting it from flake8 means I'll probably also miss 
> cases where I or someone else have gone slightly over the limit for 
> docstrings, and doubt it will be enforced consistently.

I'm happy to correct the occasional minor style issue manually.

> "Patches welcome" as the old curse goes.
>
>>>           objects_seen.add(schema.the_empty_object_type.name)
>>>   
>>>       def _gen_type_cleanup(self, name: str) -> None:
>> 
>> Bottom line: I find some hunks likable enough.
>> 
>> Ways forward:
>> 
>> 1. If you need to respin:
>> 
>> 1.1. you may keep this patch, and work in my feedback.
>> 
>> 1.2. you may drop it.  I can pick it up and take care of it.
>
> This one, please!

You got it.

> I have to admit that my appetite for consistency runs out right around 
> here, but I'll never reject someone else doing this kind of work if they 
> find it important.
>
> You may also wish to look into the Python packaging series at some 
> point, as you may be able to augment the tests to provide a "manual" run 
> that produces some extra warnings from time to time that you may want to 
> address, which you might find helpful for pursuing these kinds of 
> cleanups in the future where I suspect they will inevitably regress.

Good idea.  We may find other warnings we don't want to treat as errors,
but do want to consider case by case.

>> 2. If we decide to go without a respin:
>> 
>> 2.1. I can work in my feedback in my tree.
>> 
>> 2.2. I can extract the patch and take care of it separately.
>> 
>> I'd prefer to avoid 2.1, because I feel it's too much change for
>> comfort.  1.1. vs. 1.2 would be up to you.
>> 
>> 
>> 
>> [*] https://sphinx-rtd-tutorial.readthedocs.io/en/latest/docstrings.html#an-example-class-with-docstrings
>> 


