Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C42043167A0
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 14:14:06 +0100 (CET)
Received: from localhost ([::1]:35044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9pJl-0001Hz-M2
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 08:14:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l9pFB-0007md-Hf
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 08:09:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l9pF5-0002XY-22
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 08:09:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612962553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N1QNg6J5Wrs67LBmdEVtOijF+Xvbwd7yzfig51oBpGU=;
 b=X9A8Aak90eLygotVrT95lDqLyveAplH3KZz31wOCSmm1UWdP1FKHZoDkqisFw1W/+gMURV
 9Qj8UgGiNpozbGUK7l6SF8KQvJh8mv5P9YMcKo5QJ+ZJMlMaFE0TKmDC3GNVJrGxw3EI/u
 rJTmdKJuu+1w9pzfqKzJgbkRyfcLHzs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-zmatxEsFN2SEaUFvrSWvBA-1; Wed, 10 Feb 2021 08:09:10 -0500
X-MC-Unique: zmatxEsFN2SEaUFvrSWvBA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A86831005501
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 13:09:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DC1960C05;
 Wed, 10 Feb 2021 13:09:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A1BD1113865F; Wed, 10 Feb 2021 14:09:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 6/6] tests/qapi-schema: Test cases for aliases
References: <20201112172850.401925-1-kwolf@redhat.com>
 <20201112172850.401925-7-kwolf@redhat.com>
Date: Wed, 10 Feb 2021 14:09:07 +0100
In-Reply-To: <20201112172850.401925-7-kwolf@redhat.com> (Kevin Wolf's message
 of "Thu, 12 Nov 2020 18:28:50 +0100")
Message-ID: <87mtwcysr0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I like to add tests in the same commit as the code they test, because
I feel it makes review slightly easier.  Keeping them separate is not
wrong, of course.

Kevin Wolf <kwolf@redhat.com> writes:

> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
[...]
> diff --git a/tests/qapi-schema/alias-bad-type.err b/tests/qapi-schema/alias-bad-type.err
> new file mode 100644
> index 0000000000..a982d380b8
> --- /dev/null
> +++ b/tests/qapi-schema/alias-bad-type.err
> @@ -0,0 +1,2 @@
> +alias-bad-type.json: In struct 'AliasStruct0':
> +alias-bad-type.json:1: 'aliases' entries must be objects

Nitpick: we use "members" elsewhere, not "entries".

> diff --git a/tests/qapi-schema/alias-bad-type.json b/tests/qapi-schema/alias-bad-type.json
> new file mode 100644
> index 0000000000..0aa5d206fe
> --- /dev/null
> +++ b/tests/qapi-schema/alias-bad-type.json
> @@ -0,0 +1,3 @@
> +{ 'struct': 'AliasStruct0',
> +  'data': { 'foo': 'int' },
> +  'aliases': [ 'must be an object' ] }
> diff --git a/tests/qapi-schema/alias-bad-type.out b/tests/qapi-schema/alias-bad-type.out
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qapi-schema/alias-missing-source.err b/tests/qapi-schema/alias-missing-source.err
> new file mode 100644
> index 0000000000..1cfe8a6aa5
> --- /dev/null
> +++ b/tests/qapi-schema/alias-missing-source.err
> @@ -0,0 +1,2 @@
> +alias-missing-source.json: In struct 'AliasStruct0':
> +alias-missing-source.json:1: alias misses key 'source'

Recommend

    'aliases' member misses ...

for consistency with features-member-missing-name.err and the like.

> diff --git a/tests/qapi-schema/alias-missing-source.json b/tests/qapi-schema/alias-missing-source.json
> new file mode 100644
> index 0000000000..4ae22c2221
> --- /dev/null
> +++ b/tests/qapi-schema/alias-missing-source.json
> @@ -0,0 +1,3 @@
> +{ 'struct': 'AliasStruct0',
> +  'data': { 'foo': 'int' },
> +  'aliases': [ { 'alias': 'bar' } ] }
> diff --git a/tests/qapi-schema/alias-missing-source.out b/tests/qapi-schema/alias-missing-source.out
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qapi-schema/alias-name-bad-type.err b/tests/qapi-schema/alias-name-bad-type.err
> new file mode 100644
> index 0000000000..83b9fe0b65
> --- /dev/null
> +++ b/tests/qapi-schema/alias-name-bad-type.err
> @@ -0,0 +1,2 @@
> +alias-name-bad-type.json: In struct 'AliasStruct0':
> +alias-name-bad-type.json:1: alias member 'alias' requires a string name

Would "'aliases' member 'alias'..." be more consistent?

> diff --git a/tests/qapi-schema/alias-name-bad-type.json b/tests/qapi-schema/alias-name-bad-type.json
> new file mode 100644
> index 0000000000..6d993be332
> --- /dev/null
> +++ b/tests/qapi-schema/alias-name-bad-type.json
> @@ -0,0 +1,3 @@
> +{ 'struct': 'AliasStruct0',
> +  'data': { 'foo': 'int' },
> +  'aliases': [ { 'alias': ['bar'], 'source': ['foo'] } ] }
> diff --git a/tests/qapi-schema/alias-name-bad-type.out b/tests/qapi-schema/alias-name-bad-type.out
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qapi-schema/alias-source-bad-type.err b/tests/qapi-schema/alias-source-bad-type.err
> new file mode 100644
> index 0000000000..e3b949ff77
> --- /dev/null
> +++ b/tests/qapi-schema/alias-source-bad-type.err
> @@ -0,0 +1,2 @@
> +alias-source-bad-type.json: In struct 'AliasStruct0':
> +alias-source-bad-type.json:1: 'source' must be an array

Confusing when the struct also has a member 'source'.  Recommend to
avoid this the same way as in the previous test's error.

> diff --git a/tests/qapi-schema/alias-source-bad-type.json b/tests/qapi-schema/alias-source-bad-type.json
> new file mode 100644
> index 0000000000..0099a6439e
> --- /dev/null
> +++ b/tests/qapi-schema/alias-source-bad-type.json
> @@ -0,0 +1,3 @@
> +{ 'struct': 'AliasStruct0',
> +  'data': { 'foo': 'int' },
> +  'aliases': [ { 'alias': 'bar', 'source': 'foo' } ] }
> diff --git a/tests/qapi-schema/alias-source-bad-type.out b/tests/qapi-schema/alias-source-bad-type.out
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qapi-schema/alias-source-elem-bad-type.err b/tests/qapi-schema/alias-source-elem-bad-type.err
> new file mode 100644
> index 0000000000..44d219e352
> --- /dev/null
> +++ b/tests/qapi-schema/alias-source-elem-bad-type.err
> @@ -0,0 +1,2 @@
> +alias-source-elem-bad-type.json: In struct 'AliasStruct0':
> +alias-source-elem-bad-type.json:1: element of alias member 'source' requires a string name

Nitpick: we use "member" elsewhere, not "element".

I think the error message could be better, but it's what we can get out
of check_name_is_str().  Let's not worry about this now.

> diff --git a/tests/qapi-schema/alias-source-elem-bad-type.json b/tests/qapi-schema/alias-source-elem-bad-type.json
> new file mode 100644
> index 0000000000..28cb1c37c5
> --- /dev/null
> +++ b/tests/qapi-schema/alias-source-elem-bad-type.json
> @@ -0,0 +1,3 @@
> +{ 'struct': 'AliasStruct0',
> +  'data': { 'foo': 'int' },
> +  'aliases': [ { 'alias': 'bar', 'source': ['foo', true] } ] }
> diff --git a/tests/qapi-schema/alias-source-elem-bad-type.out b/tests/qapi-schema/alias-source-elem-bad-type.out
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qapi-schema/alias-source-empty.err b/tests/qapi-schema/alias-source-empty.err
> new file mode 100644
> index 0000000000..f7687e404c
> --- /dev/null
> +++ b/tests/qapi-schema/alias-source-empty.err
> @@ -0,0 +1,2 @@
> +alias-source-empty.json: In struct 'AliasStruct0':
> +alias-source-empty.json:1: 'source' must not be empty

Same comment as for alias-source-bad-type.err

> diff --git a/tests/qapi-schema/alias-source-empty.json b/tests/qapi-schema/alias-source-empty.json
> new file mode 100644
> index 0000000000..9d2d2f109f
> --- /dev/null
> +++ b/tests/qapi-schema/alias-source-empty.json
> @@ -0,0 +1,3 @@
> +{ 'struct': 'AliasStruct0',
> +  'data': { 'foo': 'int' },
> +  'aliases': [ { 'alias': 'bar', 'source': [] } ] }
> diff --git a/tests/qapi-schema/alias-source-empty.out b/tests/qapi-schema/alias-source-empty.out
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qapi-schema/alias-unknown-key.err b/tests/qapi-schema/alias-unknown-key.err
> new file mode 100644
> index 0000000000..d4dc5e4611
> --- /dev/null
> +++ b/tests/qapi-schema/alias-unknown-key.err
> @@ -0,0 +1,3 @@
> +alias-unknown-key.json: In struct 'AliasStruct0':
> +alias-unknown-key.json:1: alias has unknown key 'known'
> +Valid keys are 'alias', 'source'.

Recommend

    'aliases' member has ...

for consistency with features-member-unknown-key.err and the like.

> diff --git a/tests/qapi-schema/alias-unknown-key.json b/tests/qapi-schema/alias-unknown-key.json
> new file mode 100644
> index 0000000000..444f80ca30
> --- /dev/null
> +++ b/tests/qapi-schema/alias-unknown-key.json
> @@ -0,0 +1,3 @@
> +{ 'struct': 'AliasStruct0',
> +  'data': { 'foo': 'int' },
> +  'aliases': [ { 'alias': 'bar', 'source': ['foo'], 'known': false } ] }
> diff --git a/tests/qapi-schema/alias-unknown-key.out b/tests/qapi-schema/alias-unknown-key.out
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qapi-schema/aliases-bad-type.err b/tests/qapi-schema/aliases-bad-type.err
> new file mode 100644
> index 0000000000..7ffe789ec0
> --- /dev/null
> +++ b/tests/qapi-schema/aliases-bad-type.err
> @@ -0,0 +1,2 @@
> +aliases-bad-type.json: In struct 'AliasStruct0':
> +aliases-bad-type.json:1: 'aliases' must be an array
> diff --git a/tests/qapi-schema/aliases-bad-type.json b/tests/qapi-schema/aliases-bad-type.json
> new file mode 100644
> index 0000000000..4bbf6d6b20
> --- /dev/null
> +++ b/tests/qapi-schema/aliases-bad-type.json
> @@ -0,0 +1,3 @@
> +{ 'struct': 'AliasStruct0',
> +  'data': { 'foo': 'int' },
> +  'aliases': 'this must be an array' }
> diff --git a/tests/qapi-schema/aliases-bad-type.out b/tests/qapi-schema/aliases-bad-type.out
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
> index 304ef939bd..710cd60b61 100644
> --- a/tests/qapi-schema/meson.build
> +++ b/tests/qapi-schema/meson.build
> @@ -3,6 +3,14 @@ test_env.set('PYTHONPATH', meson.source_root() / 'scripts')
>  test_env.set('PYTHONIOENCODING', 'utf-8')
>  
>  schemas = [
> +  'alias-bad-type.json',
> +  'aliases-bad-type.json',
> +  'alias-missing-source.json',
> +  'alias-name-bad-type.json',
> +  'alias-source-bad-type.json',
> +  'alias-source-elem-bad-type.json',
> +  'alias-source-empty.json',
> +  'alias-unknown-key.json',
>    'alternate-any.json',
>    'alternate-array.json',
>    'alternate-base.json',
> diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
> index 63f92adf68..cc2497b2a2 100644
> --- a/tests/qapi-schema/qapi-schema-test.json
> +++ b/tests/qapi-schema/qapi-schema-test.json
> @@ -325,3 +325,27 @@
>  
>  { 'event': 'TEST-EVENT-FEATURES1',
>    'features': [ 'deprecated' ] }
> +
> +# test  'aliases'
> +
> +{ 'struct': 'AliasStruct0',
> +  'data': { 'foo': 'int' },
> +  'aliases': [] }
> +{ 'struct': 'AliasStruct1',
> +  'data': { 'foo': 'int' },
> +  'aliases': [ { 'alias': 'bar', 'source': ['foo'] } ] }
> +{ 'struct': 'AliasStruct2',
> +  'data': { 'nested': 'AliasStruct1' },
> +  'aliases': [ { 'alias': 'bar', 'source': ['nested', 'foo'] } ] }
> +{ 'struct': 'AliasStruct3',
> +  'data': { 'nested': 'AliasStruct1' },
> +  'aliases': [ { 'source': ['nested'] } ] }
> +
> +{ 'union': 'AliasFlatUnion',
> +  'base': { 'tag': 'FeatureEnum1' },
> +  'discriminator': 'tag',
> +  'data': { 'eins': 'FeatureStruct1' },
> +  'aliases': [ { 'alias': 'bar', 'source': ['foo'] } ] }
> +{ 'union': 'AliasSimpleUnion',
> +  'data': { 'eins': 'AliasStruct1' },
> +  'aliases': [ { 'source': ['data'] } ] }
> diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
> index 8868ca0dca..8ed88a257d 100644
> --- a/tests/qapi-schema/qapi-schema-test.out
> +++ b/tests/qapi-schema/qapi-schema-test.out
> @@ -443,6 +443,35 @@ command test-command-cond-features3 None -> None
>  event TEST-EVENT-FEATURES1 None
>      boxed=False
>      feature deprecated
> +object AliasStruct0
> +    member foo: int optional=False
> +object AliasStruct1
> +    member foo: int optional=False
> +    alias bar -> foo
> +object AliasStruct2
> +    member nested: AliasStruct1 optional=False
> +    alias bar -> nested/foo
> +object AliasStruct3
> +    member nested: AliasStruct1 optional=False
> +    alias * -> nested/*
> +object q_obj_AliasFlatUnion-base
> +    member tag: FeatureEnum1 optional=False
> +object AliasFlatUnion
> +    base q_obj_AliasFlatUnion-base
> +    alias bar -> foo
> +    tag tag
> +    case eins: FeatureStruct1
> +    case zwei: q_empty
> +    case drei: q_empty
> +object q_obj_AliasStruct1-wrapper
> +    member data: AliasStruct1 optional=False
> +enum AliasSimpleUnionKind
> +    member eins
> +object AliasSimpleUnion
> +    member type: AliasSimpleUnionKind optional=False
> +    alias * -> data/*
> +    tag type
> +    case eins: q_obj_AliasStruct1-wrapper
>  module include/sub-module.json
>  include sub-sub-module.json
>  object SecondArrayRef

The negative tests should cover every error the previous commit adds.
Let's check:

   diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
   index e03abcbb95..6c94c01148 100644
   --- a/docs/sphinx/qapidoc.py
   +++ b/docs/sphinx/qapidoc.py
   @@ -310,7 +310,7 @@ class QAPISchemaGenRSTVisitor(QAPISchemaVisitor):
                          + self._nodes_for_if_section(ifcond))

        def visit_object_type(self, name, info, ifcond, features,
   -                          base, members, variants):
   +                          base, members, variants, aliases):
            doc = self._cur_doc
            if base and base.is_implicit():
                base = None
   diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
   index 2fcaaa2497..21fded529b 100644
   --- a/scripts/qapi/expr.py
   +++ b/scripts/qapi/expr.py
   @@ -198,6 +198,32 @@ def check_features(features, info):
            check_if(f, info, source)


   +def check_aliases(aliases, info):
   +    if aliases is None:
   +        return
   +    if not isinstance(aliases, list):
   +        raise QAPISemError(info, "'aliases' must be an array")

aliases-bad-type

   +    for a in aliases:
   +        if not isinstance(a, dict):
   +            raise QAPISemError(info, "'aliases' entries must be objects")

alias-bad-type


   +        check_keys(a, info, "alias", ['source'], ['alias'])

alias-missing-source
alias-unknown-key

   +
   +        if 'alias' in a:
   +            source = "alias member 'alias'"
   +            check_name_is_str(a['alias'], info, source)

alias-name-bad-type

   +            check_name_str(a['alias'], info, source)

Not covered.  Okay; we don't have to cover it separately for every call
site.

   +
   +        if not isinstance(a['source'], list):
   +            raise QAPISemError(info, "'source' must be an array")

alias-source-bad-type

   +        if not a['source']:
   +            raise QAPISemError(info, "'source' must not be empty")

alias-source-empty

   +
   +        source = "element of alias member 'source'"
   +        for s in a['source']:
   +            check_name_is_str(s, info, source)

alias-source-elem-bad-type

   +            check_name_str(s, info, source)

Not covered.  Okay; we don't have to cover it separately for every call
site.

   +
   +
    def check_enum(expr, info):
        name = expr['enum']
        members = expr['data']
   @@ -228,6 +254,7 @@ def check_struct(expr, info):

        check_type(members, info, "'data'", allow_dict=name)
        check_type(expr.get('base'), info, "'base'")
   +    check_aliases(expr.get('aliases'), info)


    def check_union(expr, info):
   @@ -245,6 +272,8 @@ def check_union(expr, info):
                raise QAPISemError(info, "'discriminator' requires 'base'")
            check_name_is_str(discriminator, info, "'discriminator'")

   +    check_aliases(expr.get('aliases'), info)
   +
        for (key, value) in members.items():
            source = "'data' member '%s'" % key
            check_name_str(key, info, source)
   @@ -331,7 +360,7 @@ def check_exprs(exprs):
            elif meta == 'union':
                check_keys(expr, info, meta,
                           ['union', 'data'],
   -                       ['base', 'discriminator', 'if', 'features'])
   +                       ['base', 'discriminator', 'if', 'features', 'aliases'])
                normalize_members(expr.get('base'))
                normalize_members(expr['data'])
                check_union(expr, info)
   @@ -342,7 +371,8 @@ def check_exprs(exprs):
                check_alternate(expr, info)
            elif meta == 'struct':
                check_keys(expr, info, meta,
   -                       ['struct', 'data'], ['base', 'if', 'features'])
   +                       ['struct', 'data'],
   +                       ['base', 'if', 'features', 'aliases'])
                normalize_members(expr['data'])
                check_struct(expr, info)
            elif meta == 'command':
   diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
   index 720449feee..5daa137163 100644
   --- a/scripts/qapi/schema.py
   +++ b/scripts/qapi/schema.py
   @@ -117,7 +117,7 @@ class QAPISchemaVisitor:
            pass

        def visit_object_type(self, name, info, ifcond, features,
   -                          base, members, variants):
   +                          base, members, variants, aliases):
            pass

        def visit_object_type_flat(self, name, info, ifcond, features,
   @@ -331,9 +331,16 @@ class QAPISchemaArrayType(QAPISchemaType):
            return "%s type ['%s']" % (self.meta, self._element_type_name)


   +class QAPISchemaAlias:
   +    def __init__(self, alias, source):
   +        assert source
   +        self.alias = alias
   +        self.source = source

No checking here, thus no errors to cover.

   +
   +
    class QAPISchemaObjectType(QAPISchemaType):
        def __init__(self, name, info, doc, ifcond, features,
   -                 base, local_members, variants):
   +                 base, local_members, variants, aliases=None):
            # struct has local_members, optional base, and no variants
            # flat union has base, variants, and no local_members
            # simple union has local_members, variants, and no base
   @@ -351,6 +358,7 @@ class QAPISchemaObjectType(QAPISchemaType):
            self.local_members = local_members
            self.variants = variants
            self.members = None
   +        self.aliases = aliases or []

        def check(self, schema):
            # This calls another type T's .check() exactly when the C
   @@ -443,7 +451,7 @@ class QAPISchemaObjectType(QAPISchemaType):
            super().visit(visitor)
            visitor.visit_object_type(
                self.name, self.info, self.ifcond, self.features,
   -            self.base, self.local_members, self.variants)
   +            self.base, self.local_members, self.variants, self.aliases)
            visitor.visit_object_type_flat(
                self.name, self.info, self.ifcond, self.features,
                self.members, self.variants)
   @@ -934,6 +942,12 @@ class QAPISchema:
            return [QAPISchemaFeature(f['name'], info, f.get('if'))
                    for f in features]

   +    def _make_aliases(self, aliases):
   +        if aliases is None:
   +            return []
   +        return [QAPISchemaAlias(a.get('alias'), a['source'])
   +                for a in aliases]
   +
        def _make_enum_members(self, values, info):
            return [QAPISchemaEnumMember(v['name'], info, v.get('if'))
                    for v in values]
   @@ -1008,11 +1022,12 @@ class QAPISchema:
            base = expr.get('base')
            data = expr['data']
            ifcond = expr.get('if')
   +        aliases = self._make_aliases(expr.get('aliases'))
            features = self._make_features(expr.get('features'), info)
            self._def_entity(QAPISchemaObjectType(
                name, info, doc, ifcond, features, base,
                self._make_members(data, info),
   -            None))
   +            None, aliases))

        def _make_variant(self, case, typ, ifcond, info):
            return QAPISchemaVariant(case, info, typ, ifcond)
   @@ -1031,6 +1046,7 @@ class QAPISchema:
            data = expr['data']
            base = expr.get('base')
            ifcond = expr.get('if')
   +        aliases = self._make_aliases(expr.get('aliases'))
            features = self._make_features(expr.get('features'), info)
            tag_name = expr.get('discriminator')
            tag_member = None
   @@ -1055,7 +1071,8 @@ class QAPISchema:
                QAPISchemaObjectType(name, info, doc, ifcond, features,
                                     base, members,
                                     QAPISchemaVariants(
   -                                     tag_name, info, tag_member, variants)))
   +                                     tag_name, info, tag_member, variants),
   +                                 aliases))

        def _def_alternate_type(self, expr, info, doc):
            name = expr['alternate']

Error coverage is okay.


