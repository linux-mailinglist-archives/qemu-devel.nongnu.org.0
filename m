Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF54E35F6F8
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 17:07:06 +0200 (CEST)
Received: from localhost ([::1]:51066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWh6f-00045u-Mu
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 11:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lWh4o-0003E6-VG
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:05:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lWh4j-0000Dz-Gq
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:05:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618412703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zu12E65AVxDFOio50YHZfFsjvEwSPc4tzWuRJf5oFic=;
 b=Gc1TrV5QTspNaC0As3RjbpStFksJxj3p+bM/Xpf0U1GIEsWCV5sJOjhtSp86jBoKsYv6t9
 92tXlwOZkaahpg2+3sYogFJzM6RnKHsNr/O1J9oWUkuK9XQjd8ixHYBIDPzMczHiGz1aAH
 4Z7je8rF2JS7B44NDB6z7CbUs7FgR1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-ekleNBiUPWWc4Fgmn4og2A-1; Wed, 14 Apr 2021 11:05:01 -0400
X-MC-Unique: ekleNBiUPWWc4Fgmn4og2A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB21A107ACED;
 Wed, 14 Apr 2021 15:05:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5B775D9DC;
 Wed, 14 Apr 2021 15:04:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6AACF113525D; Wed, 14 Apr 2021 17:04:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 16/19] qapi/expr.py: Add docstrings
References: <20210325060356.4040114-1-jsnow@redhat.com>
 <20210325060356.4040114-17-jsnow@redhat.com>
Date: Wed, 14 Apr 2021 17:04:56 +0200
In-Reply-To: <20210325060356.4040114-17-jsnow@redhat.com> (John Snow's message
 of "Thu, 25 Mar 2021 02:03:53 -0400")
Message-ID: <871rbckiuf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  scripts/qapi/expr.py | 213 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 208 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
> index 1869ddf815..adc5b903bc 100644
> --- a/scripts/qapi/expr.py
> +++ b/scripts/qapi/expr.py
> @@ -1,7 +1,5 @@
>  # -*- coding: utf-8 -*-
>  #
> -# Check (context-free) QAPI schema expression structure
> -#
>  # Copyright IBM, Corp. 2011
>  # Copyright (c) 2013-2019 Red Hat Inc.
>  #
> @@ -14,6 +12,25 @@
>  # This work is licensed under the terms of the GNU GPL, version 2.
>  # See the COPYING file in the top-level directory.
>  
> +"""
> +Normalize and validate (context-free) QAPI schema expression structures.
> +
> +After QAPI expressions are parsed from disk, they are stored in
> +recursively nested Python data structures using Dict, List, str, bool,
> +and int. This module ensures that those nested structures have the
> +correct type(s) and key(s) where appropriate for the QAPI context-free
> +grammar.

"from disk"?  Perhaps something like "QAPISchemaParser parses the QAPI
schema into abstract syntax trees consisting of dict, list, str, bool
and int nodes."  This isn't quite accurate; it parses into a list of
{'expr': AST, 'info': INFO}, but that's detail.

PEP 8: You should use two spaces after a sentence-ending period in
multi- sentence comments, except after the final sentence.

> +
> +The QAPI schema expression language allows for syntactic sugar; this

suggest "certain syntactic sugar".

> +module also handles the normalization process of these nested
> +structures.
> +
> +See `check_exprs` for the main entry point.
> +
> +See `schema.QAPISchema` for processing into native Python data
> +structures and contextual semantic validation.
> +"""
> +
>  import re
>  from typing import (
>      Collection,
> @@ -31,9 +48,10 @@
>  from .source import QAPISourceInfo
>  
>  
> -# Deserialized JSON objects as returned by the parser;
> -# The values of this mapping are not necessary to exhaustively type
> -# here, because the purpose of this module is to interrogate that type.
> +#: Deserialized JSON objects as returned by the parser.
> +#:
> +#: The values of this mapping are not necessary to exhaustively type
> +#: here, because the purpose of this module is to interrogate that type.

First time I see #: comments; pardon my ignorance.  What's the deal?

>  _JSONObject = Dict[str, object]
>  
>  
> @@ -48,11 +66,29 @@
>  def check_name_is_str(name: object,
>                        info: QAPISourceInfo,
>                        source: str) -> None:
> +    """Ensures that ``name`` is a string."""

PEP 257: The docstring [...] prescribes the function or method's effect
as a command ("Do this", "Return that"), not as a description;
e.g. don't write "Returns the pathname ...".

More of the same below.

>      if not isinstance(name, str):
>          raise QAPISemError(info, "%s requires a string name" % source)
>  
>  
>  def check_name_str(name: str, info: QAPISourceInfo, source: str) -> str:
> +    """
> +    Ensures a string is a legal name.

I feel "legal" is best reserved to matters of law.  Suggest "valid QAPI
name".

More of the same below.

> +
> +    A legal name consists of ascii letters, digits, ``-``, and ``_``,

ASCII

> +    starting with a letter. The names of downstream extensions are
> +    prefixed with an __com.example_ style prefix, allowing ``.`` and
> +    ``-``.  An experimental name is prefixed with ``x-``, following the
> +    RFQDN if present.

I get that "an _com.experimental style prefix" and "the RFQDN" mean the
same thing, but can we make this clearer?  Perhaps

       A valid name consists of ascii letters, digits, ``-``, and ``_``,
       starting with a letter.  It may be prefixed by a downstream
       prefix of the form __RFQDN_, or the experimental prefix ``x-``.
       If both prefixes are present, the __RFQDN_ prefix goes first.

I'm clueless on proper use of `` in doc strings.  Can you educate me?

> +
> +    A legal name cannot start with ``q_``, which is reserved.
> +
> +    :param name:   Name to check.
> +    :param info:   QAPI source file information.

Suggest to say "QAPI schema source information", or maybe "QAPI schema
source file information".

> +    :param source: Human-readable str describing "what" this name is.

Could mention it's for use in error messages, but we have many similar
parameters all over the place, so this would perhaps be more tiresome
than helpful.  Fine as is.

> +
> +    :return: The stem of the valid name, with no prefixes.
> +    """
>      # Reserve the entire 'q_' namespace for c_name(), and for 'q_empty'
>      # and 'q_obj_*' implicit type names.
>      match = valid_name.match(name)
> @@ -62,6 +98,12 @@ def check_name_str(name: str, info: QAPISourceInfo, source: str) -> str:
>  
>  
>  def check_name_upper(name: str, info: QAPISourceInfo, source: str) -> None:
> +    """
> +    Ensures a string is a legal event name.
> +
> +    Checks the same criteria as `check_name_str`, but requires uppercase
> +    and prohibits ``-``.
> +    """
>      stem = check_name_str(name, info, source)
>      if re.search(r'[a-z-]', stem):
>          raise QAPISemError(
> @@ -71,6 +113,15 @@ def check_name_upper(name: str, info: QAPISourceInfo, source: str) -> None:
>  def check_name_lower(name: str, info: QAPISourceInfo, source: str,
>                       permit_upper: bool = False,
>                       permit_underscore: bool = False) -> None:
> +    """
> +    Ensures a string is a legal user defined type name.
> +
> +    Checks the same criteria as `check_name_str`, but may impose
> +    additional constraints.

Correct, but it leads to slightly awkward "permit_FOO: prohibit ... when
false":

> +
> +    :param permit_upper: Prohibits uppercase when false.
> +    :param permit_underscore: Prohibits underscores when false.
> +    """

Perhaps something like

       Ensure @str is a valid command or member name.

       This means it must be a valid QAPI name (as ensured by
       check_name_str()), where the stem consists of lowercase
       characters and '-'.

       :param permit_upper: Additionally permit uppercase.
       :param permit_underscore: Additionally permit '_'.

We'd then want to update check_name_upper() and check_name_camel() for
consistency.

>      stem = check_name_str(name, info, source)
>      if ((not permit_upper and re.search(r'[A-Z]', stem))
>              or (not permit_underscore and '_' in stem)):
> @@ -79,12 +130,31 @@ def check_name_lower(name: str, info: QAPISourceInfo, source: str,
>  
>  
>  def check_name_camel(name: str, info: QAPISourceInfo, source: str) -> None:
> +    """
> +    Ensures a string is a legal CamelCase name.
> +
> +    Checks the same criteria as `check_name_str`,
> +    but additionally imposes a CamelCase constraint.
> +    """
>      stem = check_name_str(name, info, source)
>      if not re.match(r'[A-Z][A-Za-z0-9]*[a-z][A-Za-z0-9]*$', stem):
>          raise QAPISemError(info, "name of %s must use CamelCase" % source)

Related: we discussed renaming check_name_{upper,camel,lower} to
check_name_{event,type,other} or check_name_{event,user_defined_type,
command_or_member}.

>  
>  
>  def check_defn_name_str(name: str, info: QAPISourceInfo, meta: str) -> None:
> +    """
> +    Ensures a name is a legal definition name.
> +
> +    - 'event' names adhere to `check_name_upper`.
> +    - 'command' names adhere to `check_name_lower`.
> +    - All other names adhere to `check_name_camel`.

When is a name an 'event' name?  We should spell out how this uses
@meta.  Perhaps something like:

       - If meta == 'event', ...
       - If meta == 'command, ...
       - Else, meta is a type, and ...

> +
> +    All name types must not end with ``Kind`` nor ``List``.

Do you mean "type names"?

Outside this patch's scope: qapi-code-gen.txt reserves suffixes Kind and
List only for type names, but the code rejects them for events and
commands, too.  One of them should be changed to match the other.

> +
> +    :param name: Name to check.
> +    :param info: QAPI source file information.
> +    :param meta: Type name of the QAPI expression.
> +    """

Glosses over the use of pragma command-name-exceptions.  Do we mind?

>      if meta == 'event':
>          check_name_upper(name, info, meta)
>      elif meta == 'command':
> @@ -103,6 +173,15 @@ def check_keys(value: _JSONObject,
>                 source: str,
>                 required: Collection[str],
>                 optional: Collection[str]) -> None:
> +    """
> +    Ensures an object has a specific set of keys.
> +
> +    :param value:    The object to check.
> +    :param info:     QAPI source file information.
> +    :param source:   Human-readable str describing this value.
> +    :param required: Keys that *must* be present.
> +    :param optional: Keys that *may* be present.
> +    """
>  
>      def pprint(elems: Iterable[str]) -> str:
>          return ', '.join("'" + e + "'" for e in sorted(elems))
> @@ -125,6 +204,12 @@ def pprint(elems: Iterable[str]) -> str:
>  
>  
>  def check_flags(expr: _JSONObject, info: QAPISourceInfo) -> None:
> +    """
> +    Ensures common fields in an expression are correct.

Rather vague.  The function is really about checking "flag" members,
i.e. members that must have a boolean value.  Perhaps

       Ensure flag members (if present) have valid values.

> +
> +    :param expr: Expression to validate.
> +    :param info: QAPI source file information.
> +    """
>      for key in ['gen', 'success-response']:
>          if key in expr and expr[key] is not False:
>              raise QAPISemError(
> @@ -143,7 +228,22 @@ def check_flags(expr: _JSONObject, info: QAPISourceInfo) -> None:
>  
>  
>  def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) -> None:
> +    """
> +    Syntactically validate and normalize the ``if`` field of an object.

qapi-code-gen.txt consistently uses "member", not "field".  Let's stick
to "member".

>  
> +    The ``if`` field may be either a ``str`` or a ``List[str]``.
> +    A ``str`` element will be normalized to ``List[str]``.

element?  I think you mean value.

Doesn't spell out how str is normalized to List[str], but I guess that's
obvious enough.

> +
> +    :forms:
> +      :sugared: ``Union[str, List[str]]``
> +      :canonical: ``List[str]``

Uh... :param FOO: and :return: are obvious enough, but this :forms:
stuff feels a bit too fancy for me to rely on voodoo understanding.  Can
you point me to :documentation:?

> +
> +    :param expr: A ``dict``.

Elsewhere, you have "the object to check", which I like better.

> +                 The ``if`` field, if present, will be validated.
> +    :param info: QAPI source file information.
> +
> +    :return: None, ``expr`` is normalized in-place as needed.
> +    """
>      ifcond = expr.get('if')
>      if ifcond is None:
>          return
> @@ -167,6 +267,20 @@ def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) -> None:
>  
>  
>  def normalize_members(members: object) -> None:
> +    """
> +    Normalize a "members" value.
> +
> +    If ``members`` is an object, for every value in that object, if that

If it's a dict, actually.

> +    value is not itself already an object, normalize it to
> +    ``{'type': value}``.
> +
> +    :forms:
> +      :sugared: ``Dict[str, Union[str, TypeRef]]``
> +      :canonical: ``Dict[str, TypeRef]``
> +
> +    :param members: The members object to normalize.
> +    :return: None, ``members`` is normalized in-place as needed.
> +    """
>      if isinstance(members, dict):
>          for key, arg in members.items():
>              if isinstance(arg, dict):
> @@ -179,6 +293,23 @@ def check_type(value: Optional[object],
>                 source: str,
>                 allow_array: bool = False,
>                 allow_dict: Union[bool, str] = False) -> None:
> +    """
> +    Check the QAPI type of ``value``.
> +
> +    Python types of ``str`` or ``None`` are always allowed.
> +
> +    :param value:       The value to check.
> +    :param info:        QAPI Source file information.
> +    :param source:      Human-readable str describing this value.
> +    :param allow_array: Allow a ``List[str]`` of length 1,
> +                        which indicates an Array<T> type.

Leaves open where T comes from.  Perhaps "indicates an array of the type
named by the list element".

> +    :param allow_dict:  Allow a dict, treated as an anonymous type.

"treated as anonymous type" isn't quite right.  The dict is either
MEMBERS or BRANCHES in qapi-code-gen.txt parlance.  The former is like
an anonymous struct type, the latter isn't.

> +                        When given a string, check if that name is
> +                        allowed to have keys that use uppercase letters,
> +                        and modify validation accordingly.

The second sentence feels both cryptic and vague.

> +
> +    :return: None, ``value`` is normalized in-place as needed.

First mention of normalization.  I think we normalize only dicts.

Perhaps:

       :param allow_dict: Allow a dict.  Its members can be struct type
           members or union branches.  When the value of @allow_dict is
           in pragma member-name-exceptions, the dict's keys may violate
           the member naming rules.  The dict members are normalized in
           place.

Still neglects to explain we normalize.

Also note the indentation style: it produces reasonable text width
regardless of parameter name length.  Slightly different way to get
that:

       :param allow_dict:
           Allow a dict.  Its members can be struct type members or
           union branches.  When the value of @allow_dict is in pragma
           member-name-exceptions, the dict's keys may violate the
           member naming rules.  The dict members are normalized in
           place.

> +    """
>      if value is None:
>          return
>  
> @@ -227,6 +358,21 @@ def check_type(value: Optional[object],
>  
>  def check_features(features: Optional[object],
>                     info: QAPISourceInfo) -> None:
> +    """
> +    Syntactically validate and normalize the ``features`` field.
> +
> +    ``features`` may be a ``list`` of either ``str`` or ``dict``.
> +    Any ``str`` element will be normalized to ``{'name': element}``.
> +
> +    :forms:
> +      :sugared: ``List[Union[str, Feature]]``
> +      :canonical: ``List[Feature]``
> +
> +    :param features: an optional list of either str or dict.
> +    :param info: QAPI Source file information.
> +
> +    :return: None, ``features`` is normalized in-place as needed.
> +    """
>      if features is None:
>          return
>      if not isinstance(features, list):
> @@ -244,6 +390,14 @@ def check_features(features: Optional[object],
>  
>  
>  def check_enum(expr: _JSONObject, info: QAPISourceInfo) -> None:
> +    """
> +    Validate this expression as an ``enum`` definition.
> +
> +    :param expr: The expression to validate.
> +    :param info: QAPI source file information.
> +
> +    :return: None, ``expr`` is normalized in-place as needed.
> +    """

Unlike the one for check_features(), this one doesn't describe how we
normalize.  More of the same below.  Observation, not demand.

>      name = expr['enum']
>      members = expr['data']
>      prefix = expr.get('prefix')
> @@ -273,6 +427,14 @@ def check_enum(expr: _JSONObject, info: QAPISourceInfo) -> None:
>  
>  
>  def check_struct(expr: _JSONObject, info: QAPISourceInfo) -> None:
> +    """
> +    Validate this expression as a ``struct`` definition.
> +
> +    :param expr: The expression to validate.
> +    :param info: QAPI source file information.
> +
> +    :return: None, ``expr`` is normalized in-place as needed.
> +    """
>      name = cast(str, expr['struct'])  # Asserted in check_exprs
>      members = expr['data']
>  
> @@ -281,6 +443,14 @@ def check_struct(expr: _JSONObject, info: QAPISourceInfo) -> None:
>  
>  
>  def check_union(expr: _JSONObject, info: QAPISourceInfo) -> None:
> +    """
> +    Validate this expression as a ``union`` definition.
> +
> +    :param expr: The expression to validate.
> +    :param info: QAPI source file information.
> +
> +    :return: None, ``expr`` is normalized in-place as needed.
> +    """
>      name = cast(str, expr['union'])  # Asserted in check_exprs
>      base = expr.get('base')
>      discriminator = expr.get('discriminator')
> @@ -309,6 +479,14 @@ def check_union(expr: _JSONObject, info: QAPISourceInfo) -> None:
>  
>  
>  def check_alternate(expr: _JSONObject, info: QAPISourceInfo) -> None:
> +    """
> +    Validate this expression as an ``alternate`` definition.
> +
> +    :param expr: The expression to validate.
> +    :param info: QAPI source file information.
> +
> +    :return: None, ``expr`` is normalized in-place as needed.
> +    """
>      members = expr['data']
>  
>      if not members:
> @@ -326,6 +504,14 @@ def check_alternate(expr: _JSONObject, info: QAPISourceInfo) -> None:
>  
>  
>  def check_command(expr: _JSONObject, info: QAPISourceInfo) -> None:
> +    """
> +    Validate this expression as a ``command`` definition.
> +
> +    :param expr: The expression to validate.
> +    :param info: QAPI source file information.
> +
> +    :return: None, ``expr`` is normalized in-place as needed.
> +    """
>      args = expr.get('data')
>      rets = expr.get('returns')
>      boxed = expr.get('boxed', False)
> @@ -337,6 +523,14 @@ def check_command(expr: _JSONObject, info: QAPISourceInfo) -> None:
>  
>  
>  def check_event(expr: _JSONObject, info: QAPISourceInfo) -> None:
> +    """
> +    Normalize and validate this expression as an ``event`` definition.
> +
> +    :param expr: The expression to validate.
> +    :param info: QAPI source file information.
> +
> +    :return: None, ``expr`` is normalized in-place as needed.
> +    """
>      args = expr.get('data')
>      boxed = expr.get('boxed', False)
>  
> @@ -346,6 +540,15 @@ def check_event(expr: _JSONObject, info: QAPISourceInfo) -> None:
>  
>  
>  def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
> +    """
> +    Validate and normalize a list of parsed QAPI schema expressions.
> +
> +    This function accepts a list of expressions + metadta as returned by

Typo: metadata.

> +    the parser. It destructively normalizes the expressions in-place.
> +
> +    :param exprs: The list of expressions to normalize/validate.
> +    :return: The same list of expressions (now modified).
> +    """
>      for expr_elem in exprs:
>          # Expression
>          assert isinstance(expr_elem['expr'], dict)


