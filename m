Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE4243BC5A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 23:25:55 +0200 (CEST)
Received: from localhost ([::1]:59100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfTxC-0000PG-55
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 17:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfTut-00087e-HE
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 17:23:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfTum-0001Dj-RD
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 17:23:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635283402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SijIpOP2NQ6jxTxqiG4vXYFOQ5jIKJY5HHi2BbMbfXE=;
 b=AI+SD39uocCY2Plas3wfSP9VHD/36R0xR9LTVQ7Tbc8GM5K2YKpC7kye6MFq4tnvpttkPA
 zzuXO1i3OdZ2WC3ZKHxpBq3ZoyDVf4SW47pFq+lR24MRTqvrXWt9A1BapEtLwhB9EvBurZ
 Q47YzUDWxr0Mg8Hf8K8nzEaS/WTp+hk=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-uI-cZP6VMG2QkJrrvlcOsg-1; Tue, 26 Oct 2021 17:23:19 -0400
X-MC-Unique: uI-cZP6VMG2QkJrrvlcOsg-1
Received: by mail-ua1-f69.google.com with SMTP id
 j29-20020ab0185d000000b002cbb3c4660bso231926uag.23
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 14:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SijIpOP2NQ6jxTxqiG4vXYFOQ5jIKJY5HHi2BbMbfXE=;
 b=fhd0JYWkkR6vsgDlYiuFc0D4qCwWxBCUfGls4TDaQxOdjrWa44pCUPTbu5cTqYEXyD
 6JkwtEaJfGTRWC2NmAwfPLJ22IoNFIv6wyKh6dblxCSMBUVMAViRfpJjoa1YTWxnQs1X
 e1GyVTH/MYmvRUdjwEPBVVy8ek0/ufPyoXnJyyiOBNHIEYn85kdw/0m1s+Hm3zk4EzQK
 soarcBOYyMytjUeGv3swU0xIhj2LoXczaSAV8PXdQuEIkvx8Yo0rEasyqkytS1gzOwvA
 JiO9Q8Ofvc2G/vY2Zd1829OIBTHpMBOd5Kg6Jmbdxb4p5hPMOh/p2Z0Sm7PMp2y5W+Xl
 39uw==
X-Gm-Message-State: AOAM530uB0UpaY6rBfbxrZjrdfBbNFRrOpkYdbYeBoRyg6Z6xAg5z+GG
 gpKqGa+GZJMOzoMTtbVjfzGADKaoe8kyHjvZ221ZF7q4U3m2fuPIwQOzcawrLt7nkdJfKhCNmV3
 EGpXB4ZmAt0NH1CerbPy7DpegmJs6tKw=
X-Received: by 2002:a05:6122:2224:: with SMTP id
 bb36mr26247985vkb.23.1635283398639; 
 Tue, 26 Oct 2021 14:23:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweBqRYck79p63umhlVSre0H0WbWHlRCJPi74lBuX1NZJwluhcoEM4oSE56OCqbAX1yZCv/qLUQg5rqgihWEUs=
X-Received: by 2002:a05:6122:2224:: with SMTP id
 bb36mr26247959vkb.23.1635283398424; 
 Tue, 26 Oct 2021 14:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210917161320.201086-1-kwolf@redhat.com>
In-Reply-To: <20210917161320.201086-1-kwolf@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 26 Oct 2021 17:23:07 -0400
Message-ID: <CAFn=p-ahKc+EjkUAPnSODQNY808z-qyc-DQUsseAobmB8A8NwA@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] qapi: Add support for aliases
To: Kevin Wolf <kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000120f6505cf481646"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000120f6505cf481646
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 17, 2021 at 12:13 PM Kevin Wolf <kwolf@redhat.com> wrote:

> This series introduces alias definitions for QAPI object types (structs
> and unions).
>
> This allows using the same QAPI type and visitor even when the syntax
> has some variations between different external interfaces such as QMP
> and the command line.
>
>
I'm absurdly late to the party here, and I'm afraid my involvement may only
stall your progress even further, but ... can you fill me in on the
slightly-less-higher-level details here?

I'm curious as to the nature of "has some variations" and how the aliases
help alleviate them. Do you accomplish that compatibility by using
different names for different fields of the struct?

so e.g. x.foo can be used as an alias for x.bar, but both map ultimately
onto 'x.foo'? Or does this series provide for some more fundamental
mechanical changes to map one type onto another?


> It also provides a new tool for evolving the schema while maintaining
> backwards compatibility (possibly during a deprecation period).
>
> The first user is intended to be a QAPIfied -chardev command line
> option, for which I'll send a separate series. A git tag is available
> that contains both this series and the chardev changes that make use of
> it:
>
>     https://repo.or.cz/qemu/kevin.git qapi-alias-chardev-v4
>
>
v4:
> - Make sure to keep a defined order of aliases in StackObject.aliases
> - Added patch 4 to allow for better error messages when wildcard aliases
>   provide a second value for a member, which may or may not be consumed
>   elsewhere.
> - Resolve chained aliases only once instead of just checking that they
>   can be resolved while looking for matching aliases, and actually
>   resolving them at the end. This is not only a code simplification, but
>   actually necessary for correct error messages on conflicts.
> - Separate schema.py cleanup patch by Markus ('qapi: Revert an
>   accidental change from list to view object')
> - Fixed alias name checks in the QAPI generator
> - Changed check_path() to avoid modifying its 'path' parameter
> - Some more test cases
> - Coding style fixes
> - Documentation improvements
>
> v3:
> - Mention the new functions in the big comment in visitor.h. However,
>   since the comment is about users of the visitor rather than the
>   generated code, it seems like to wrong place to go into details.
> - Updated commit message for patch 3 ('Simplify full_name_nth() ...')
> - Patch 4 ('qapi: Apply aliases in qobject-input-visitor'):
>     - Multiple matching wildcard aliases are considered conflicting now
>     - Improved comments for several functions
>     - Renamed bool *implicit_object into *is_alias_prefix, which
>       describes better what it is rather than what it is used for
>     - Simplified alias_present() into input_present()
>     - Fixed potential use of wrong StackObject in error message
> - Patch 5 ('qapi: Add support for aliases'):
>     - Made QAPISchemaAlias a QAPISchemaMember
>     - Check validity of alias source paths (must exist in at least one
>       variant, no optional objects in the path of a wildcard alias, no
>       alias loops)
> - Many new tests cases, both positive and negative, including unit tests
>   of the generated visit functions
> - Coding style changes
> - Rebased documentation (.txt -> .rst conversion in master)
>
> v2:
> - Renamed 'alias' to 'name' in all data structures describing aliases
> - Tons of new or changed comments and other documentation
> - Be more explicit that empty 'source' is invalid and assert it
> - Fixed full_name_so() for lists (added a parameter to tell the function
>   whether the name of a list member or the list itself is meant)
> - Changed some QAPI generator error messages
> - Assert the type of parameters in QAPISchemaAlias.__init__()
>
> Kevin Wolf (7):
>   qapi: Add interfaces for alias support to Visitor
>   qapi: Remember alias definitions in qobject-input-visitor
>   qapi: Simplify full_name_nth() in qobject-input-visitor
>   qapi: Store Error in StackObject.h for qobject-input-visitor
>   qapi: Apply aliases in qobject-input-visitor
>   qapi: Add support for aliases
>   tests/qapi-schema: Test cases for aliases
>
> Markus Armbruster (1):
>   qapi: Revert an accidental change from list to view object
>
>  docs/devel/qapi-code-gen.rst                  | 109 ++++-
>  docs/sphinx/qapidoc.py                        |   2 +-
>  include/qapi/visitor-impl.h                   |  12 +
>  include/qapi/visitor.h                        |  59 ++-
>  qapi/qapi-visit-core.c                        |  22 +
>  qapi/qobject-input-visitor.c                  | 452 ++++++++++++++++--
>  tests/unit/test-qmp-cmds.c                    |  10 +
>  tests/unit/test-qobject-input-visitor.c       | 271 +++++++++++
>  scripts/qapi/expr.py                          |  54 ++-
>  scripts/qapi/schema.py                        | 117 ++++-
>  scripts/qapi/types.py                         |   4 +-
>  scripts/qapi/visit.py                         |  34 +-
>  tests/qapi-schema/test-qapi.py                |   7 +-
>  tests/qapi-schema/alias-bad-type.err          |   2 +
>  tests/qapi-schema/alias-bad-type.json         |   3 +
>  tests/qapi-schema/alias-bad-type.out          |   0
>  tests/qapi-schema/alias-missing-source.err    |   2 +
>  tests/qapi-schema/alias-missing-source.json   |   3 +
>  tests/qapi-schema/alias-missing-source.out    |   0
>  tests/qapi-schema/alias-name-bad-type.err     |   2 +
>  tests/qapi-schema/alias-name-bad-type.json    |   3 +
>  tests/qapi-schema/alias-name-bad-type.out     |   0
>  tests/qapi-schema/alias-name-conflict.err     |   2 +
>  tests/qapi-schema/alias-name-conflict.json    |   4 +
>  tests/qapi-schema/alias-name-conflict.out     |   0
>  tests/qapi-schema/alias-recursive.err         |   2 +
>  tests/qapi-schema/alias-recursive.json        |   4 +
>  tests/qapi-schema/alias-recursive.out         |   0
>  tests/qapi-schema/alias-source-bad-type.err   |   2 +
>  tests/qapi-schema/alias-source-bad-type.json  |   3 +
>  tests/qapi-schema/alias-source-bad-type.out   |   0
>  .../alias-source-elem-bad-type.err            |   2 +
>  .../alias-source-elem-bad-type.json           |   3 +
>  .../alias-source-elem-bad-type.out            |   0
>  tests/qapi-schema/alias-source-empty.err      |   2 +
>  tests/qapi-schema/alias-source-empty.json     |   3 +
>  tests/qapi-schema/alias-source-empty.out      |   0
>  .../alias-source-inexistent-variants.err      |   2 +
>  .../alias-source-inexistent-variants.json     |  12 +
>  .../alias-source-inexistent-variants.out      |   0
>  tests/qapi-schema/alias-source-inexistent.err |   2 +
>  .../qapi-schema/alias-source-inexistent.json  |   3 +
>  tests/qapi-schema/alias-source-inexistent.out |   0
>  .../alias-source-non-object-path.err          |   2 +
>  .../alias-source-non-object-path.json         |   3 +
>  .../alias-source-non-object-path.out          |   0
>  .../alias-source-non-object-wildcard.err      |   2 +
>  .../alias-source-non-object-wildcard.json     |   3 +
>  .../alias-source-non-object-wildcard.out      |   0
>  ...lias-source-optional-wildcard-indirect.err |   2 +
>  ...ias-source-optional-wildcard-indirect.json |   6 +
>  ...lias-source-optional-wildcard-indirect.out |   0
>  .../alias-source-optional-wildcard.err        |   2 +
>  .../alias-source-optional-wildcard.json       |   5 +
>  .../alias-source-optional-wildcard.out        |   0
>  tests/qapi-schema/alias-unknown-key.err       |   3 +
>  tests/qapi-schema/alias-unknown-key.json      |   3 +
>  tests/qapi-schema/alias-unknown-key.out       |   0
>  tests/qapi-schema/aliases-bad-type.err        |   2 +
>  tests/qapi-schema/aliases-bad-type.json       |   3 +
>  tests/qapi-schema/aliases-bad-type.out        |   0
>  tests/qapi-schema/meson.build                 |  16 +
>  tests/qapi-schema/qapi-schema-test.json       |  35 ++
>  tests/qapi-schema/qapi-schema-test.out        |  44 ++
>  tests/qapi-schema/unknown-expr-key.err        |   2 +-
>  65 files changed, 1290 insertions(+), 57 deletions(-)
>  create mode 100644 tests/qapi-schema/alias-bad-type.err
>  create mode 100644 tests/qapi-schema/alias-bad-type.json
>  create mode 100644 tests/qapi-schema/alias-bad-type.out
>  create mode 100644 tests/qapi-schema/alias-missing-source.err
>  create mode 100644 tests/qapi-schema/alias-missing-source.json
>  create mode 100644 tests/qapi-schema/alias-missing-source.out
>  create mode 100644 tests/qapi-schema/alias-name-bad-type.err
>  create mode 100644 tests/qapi-schema/alias-name-bad-type.json
>  create mode 100644 tests/qapi-schema/alias-name-bad-type.out
>  create mode 100644 tests/qapi-schema/alias-name-conflict.err
>  create mode 100644 tests/qapi-schema/alias-name-conflict.json
>  create mode 100644 tests/qapi-schema/alias-name-conflict.out
>  create mode 100644 tests/qapi-schema/alias-recursive.err
>  create mode 100644 tests/qapi-schema/alias-recursive.json
>  create mode 100644 tests/qapi-schema/alias-recursive.out
>  create mode 100644 tests/qapi-schema/alias-source-bad-type.err
>  create mode 100644 tests/qapi-schema/alias-source-bad-type.json
>  create mode 100644 tests/qapi-schema/alias-source-bad-type.out
>  create mode 100644 tests/qapi-schema/alias-source-elem-bad-type.err
>  create mode 100644 tests/qapi-schema/alias-source-elem-bad-type.json
>  create mode 100644 tests/qapi-schema/alias-source-elem-bad-type.out
>  create mode 100644 tests/qapi-schema/alias-source-empty.err
>  create mode 100644 tests/qapi-schema/alias-source-empty.json
>  create mode 100644 tests/qapi-schema/alias-source-empty.out
>  create mode 100644 tests/qapi-schema/alias-source-inexistent-variants.err
>  create mode 100644 tests/qapi-schema/alias-source-inexistent-variants.json
>  create mode 100644 tests/qapi-schema/alias-source-inexistent-variants.out
>  create mode 100644 tests/qapi-schema/alias-source-inexistent.err
>  create mode 100644 tests/qapi-schema/alias-source-inexistent.json
>  create mode 100644 tests/qapi-schema/alias-source-inexistent.out
>  create mode 100644 tests/qapi-schema/alias-source-non-object-path.err
>  create mode 100644 tests/qapi-schema/alias-source-non-object-path.json
>  create mode 100644 tests/qapi-schema/alias-source-non-object-path.out
>  create mode 100644 tests/qapi-schema/alias-source-non-object-wildcard.err
>  create mode 100644 tests/qapi-schema/alias-source-non-object-wildcard.json
>  create mode 100644 tests/qapi-schema/alias-source-non-object-wildcard.out
>  create mode 100644
> tests/qapi-schema/alias-source-optional-wildcard-indirect.err
>  create mode 100644
> tests/qapi-schema/alias-source-optional-wildcard-indirect.json
>  create mode 100644
> tests/qapi-schema/alias-source-optional-wildcard-indirect.out
>  create mode 100644 tests/qapi-schema/alias-source-optional-wildcard.err
>  create mode 100644 tests/qapi-schema/alias-source-optional-wildcard.json
>  create mode 100644 tests/qapi-schema/alias-source-optional-wildcard.out
>  create mode 100644 tests/qapi-schema/alias-unknown-key.err
>  create mode 100644 tests/qapi-schema/alias-unknown-key.json
>  create mode 100644 tests/qapi-schema/alias-unknown-key.out
>  create mode 100644 tests/qapi-schema/aliases-bad-type.err
>  create mode 100644 tests/qapi-schema/aliases-bad-type.json
>  create mode 100644 tests/qapi-schema/aliases-bad-type.out
>
> --
> 2.31.1
>
>

--000000000000120f6505cf481646
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 17, 2021 at 12:13 PM Kevi=
n Wolf &lt;<a href=3D"mailto:kwolf@redhat.com">kwolf@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This series =
introduces alias definitions for QAPI object types (structs<br>
and unions).<br>
<br>
This allows using the same QAPI type and visitor even when the syntax<br>
has some variations between different external interfaces such as QMP<br>
and the command line.<br>
<br></blockquote><div><br></div><div><div>I&#39;m absurdly late to the part=
y here, and I&#39;m afraid my involvement may only stall your progress even=
 further, but ... can you fill me in on the slightly-less-higher-level deta=
ils here?</div><div><br></div></div><div>I&#39;m curious as to the nature o=
f &quot;has some variations&quot; and how the aliases help alleviate them. =
Do you accomplish that compatibility by using different names for different=
 fields of the struct?</div><div><br></div><div>so e.g. x.foo can be used a=
s an alias for x.bar, but both map ultimately onto &#39;x.foo&#39;? Or does=
 this series provide for some more fundamental mechanical changes to map on=
e type onto another?<br></div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
It also provides a new tool for evolving the schema while maintaining<br>
backwards compatibility (possibly during a deprecation period).<br>
<br>
The first user is intended to be a QAPIfied -chardev command line<br>
option, for which I&#39;ll send a separate series. A git tag is available<b=
r>
that contains both this series and the chardev changes that make use of<br>
it:<br>
<br>
=C2=A0 =C2=A0 <a href=3D"https://repo.or.cz/qemu/kevin.git" rel=3D"noreferr=
er" target=3D"_blank">https://repo.or.cz/qemu/kevin.git</a> qapi-alias-char=
dev-v4<br>
<br></blockquote><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
v4:<br>
- Make sure to keep a defined order of aliases in StackObject.aliases<br>
- Added patch 4 to allow for better error messages when wildcard aliases<br=
>
=C2=A0 provide a second value for a member, which may or may not be consume=
d<br>
=C2=A0 elsewhere.<br>
- Resolve chained aliases only once instead of just checking that they<br>
=C2=A0 can be resolved while looking for matching aliases, and actually<br>
=C2=A0 resolving them at the end. This is not only a code simplification, b=
ut<br>
=C2=A0 actually necessary for correct error messages on conflicts.<br>
- Separate schema.py cleanup patch by Markus (&#39;qapi: Revert an<br>
=C2=A0 accidental change from list to view object&#39;)<br>
- Fixed alias name checks in the QAPI generator<br>
- Changed check_path() to avoid modifying its &#39;path&#39; parameter<br>
- Some more test cases<br>
- Coding style fixes<br>
- Documentation improvements<br>
<br>
v3:<br>
- Mention the new functions in the big comment in visitor.h. However,<br>
=C2=A0 since the comment is about users of the visitor rather than the<br>
=C2=A0 generated code, it seems like to wrong place to go into details.<br>
- Updated commit message for patch 3 (&#39;Simplify full_name_nth() ...&#39=
;)<br>
- Patch 4 (&#39;qapi: Apply aliases in qobject-input-visitor&#39;):<br>
=C2=A0 =C2=A0 - Multiple matching wildcard aliases are considered conflicti=
ng now<br>
=C2=A0 =C2=A0 - Improved comments for several functions<br>
=C2=A0 =C2=A0 - Renamed bool *implicit_object into *is_alias_prefix, which<=
br>
=C2=A0 =C2=A0 =C2=A0 describes better what it is rather than what it is use=
d for<br>
=C2=A0 =C2=A0 - Simplified alias_present() into input_present()<br>
=C2=A0 =C2=A0 - Fixed potential use of wrong StackObject in error message<b=
r>
- Patch 5 (&#39;qapi: Add support for aliases&#39;):<br>
=C2=A0 =C2=A0 - Made QAPISchemaAlias a QAPISchemaMember<br>
=C2=A0 =C2=A0 - Check validity of alias source paths (must exist in at leas=
t one<br>
=C2=A0 =C2=A0 =C2=A0 variant, no optional objects in the path of a wildcard=
 alias, no<br>
=C2=A0 =C2=A0 =C2=A0 alias loops)<br>
- Many new tests cases, both positive and negative, including unit tests<br=
>
=C2=A0 of the generated visit functions<br>
- Coding style changes<br>
- Rebased documentation (.txt -&gt; .rst conversion in master)<br>
<br>
v2:<br>
- Renamed &#39;alias&#39; to &#39;name&#39; in all data structures describi=
ng aliases<br>
- Tons of new or changed comments and other documentation<br>
- Be more explicit that empty &#39;source&#39; is invalid and assert it<br>
- Fixed full_name_so() for lists (added a parameter to tell the function<br=
>
=C2=A0 whether the name of a list member or the list itself is meant)<br>
- Changed some QAPI generator error messages<br>
- Assert the type of parameters in QAPISchemaAlias.__init__()<br>
<br>
Kevin Wolf (7):<br>
=C2=A0 qapi: Add interfaces for alias support to Visitor<br>
=C2=A0 qapi: Remember alias definitions in qobject-input-visitor<br>
=C2=A0 qapi: Simplify full_name_nth() in qobject-input-visitor<br>
=C2=A0 qapi: Store Error in StackObject.h for qobject-input-visitor<br>
=C2=A0 qapi: Apply aliases in qobject-input-visitor<br>
=C2=A0 qapi: Add support for aliases<br>
=C2=A0 tests/qapi-schema: Test cases for aliases<br>
<br>
Markus Armbruster (1):<br>
=C2=A0 qapi: Revert an accidental change from list to view object<br>
<br>
=C2=A0docs/devel/qapi-code-gen.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 109 ++++-<br>
=C2=A0docs/sphinx/qapidoc.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0include/qapi/visitor-impl.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 12 +<br>
=C2=A0include/qapi/visitor.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 59 ++-<br>
=C2=A0qapi/qapi-visit-core.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 22 +<br>
=C2=A0qapi/qobject-input-visitor.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 452 ++++++++++++++++--<br>
=C2=A0tests/unit/test-qmp-cmds.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 +<br>
=C2=A0tests/unit/test-qobject-input-visitor.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2=
71 +++++++++++<br>
=C2=A0scripts/qapi/expr.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 54 ++-<br>
=C2=A0scripts/qapi/schema.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 117 ++++-<br>
=C2=A0scripts/qapi/types.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0scripts/qapi/visit.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 34 +-<br>
=C2=A0tests/qapi-schema/test-qapi.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +-<br>
=C2=A0tests/qapi-schema/alias-bad-type.err=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0tests/qapi-schema/alias-bad-type.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A03 +<br>
=C2=A0tests/qapi-schema/alias-bad-type.out=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A00<br>
=C2=A0tests/qapi-schema/alias-missing-source.err=C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +<br>
=C2=A0tests/qapi-schema/alias-missing-source.json=C2=A0 =C2=A0|=C2=A0 =C2=
=A03 +<br>
=C2=A0tests/qapi-schema/alias-missing-source.out=C2=A0 =C2=A0 |=C2=A0 =C2=
=A00<br>
=C2=A0tests/qapi-schema/alias-name-bad-type.err=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +<br>
=C2=A0tests/qapi-schema/alias-name-bad-type.json=C2=A0 =C2=A0 |=C2=A0 =C2=
=A03 +<br>
=C2=A0tests/qapi-schema/alias-name-bad-type.out=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A00<br>
=C2=A0tests/qapi-schema/alias-name-conflict.err=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +<br>
=C2=A0tests/qapi-schema/alias-name-conflict.json=C2=A0 =C2=A0 |=C2=A0 =C2=
=A04 +<br>
=C2=A0tests/qapi-schema/alias-name-conflict.out=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A00<br>
=C2=A0tests/qapi-schema/alias-recursive.err=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +<br>
=C2=A0tests/qapi-schema/alias-recursive.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A04 +<br>
=C2=A0tests/qapi-schema/alias-recursive.out=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A00<br>
=C2=A0tests/qapi-schema/alias-source-bad-type.err=C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
=C2=A0tests/qapi-schema/alias-source-bad-type.json=C2=A0 |=C2=A0 =C2=A03 +<=
br>
=C2=A0tests/qapi-schema/alias-source-bad-type.out=C2=A0 =C2=A0|=C2=A0 =C2=
=A00<br>
=C2=A0.../alias-source-elem-bad-type.err=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../alias-source-elem-bad-type.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0.../alias-source-elem-bad-type.out=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A00<br>
=C2=A0tests/qapi-schema/alias-source-empty.err=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +<br>
=C2=A0tests/qapi-schema/alias-source-empty.json=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A03 +<br>
=C2=A0tests/qapi-schema/alias-source-empty.out=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A00<br>
=C2=A0.../alias-source-inexistent-variants.err=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +<br>
=C2=A0.../alias-source-inexistent-variants.json=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
12 +<br>
=C2=A0.../alias-source-inexistent-variants.out=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A00<br>
=C2=A0tests/qapi-schema/alias-source-inexistent.err |=C2=A0 =C2=A02 +<br>
=C2=A0.../qapi-schema/alias-source-inexistent.json=C2=A0 |=C2=A0 =C2=A03 +<=
br>
=C2=A0tests/qapi-schema/alias-source-inexistent.out |=C2=A0 =C2=A00<br>
=C2=A0.../alias-source-non-object-path.err=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../alias-source-non-object-path.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A03 +<br>
=C2=A0.../alias-source-non-object-path.out=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A00<br>
=C2=A0.../alias-source-non-object-wildcard.err=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +<br>
=C2=A0.../alias-source-non-object-wildcard.json=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A03 +<br>
=C2=A0.../alias-source-non-object-wildcard.out=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A00<br>
=C2=A0...lias-source-optional-wildcard-indirect.err |=C2=A0 =C2=A02 +<br>
=C2=A0...ias-source-optional-wildcard-indirect.json |=C2=A0 =C2=A06 +<br>
=C2=A0...lias-source-optional-wildcard-indirect.out |=C2=A0 =C2=A00<br>
=C2=A0.../alias-source-optional-wildcard.err=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +<br>
=C2=A0.../alias-source-optional-wildcard.json=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A05 +<br>
=C2=A0.../alias-source-optional-wildcard.out=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A00<br>
=C2=A0tests/qapi-schema/alias-unknown-key.err=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A03 +<br>
=C2=A0tests/qapi-schema/alias-unknown-key.json=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A03 +<br>
=C2=A0tests/qapi-schema/alias-unknown-key.out=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A00<br>
=C2=A0tests/qapi-schema/aliases-bad-type.err=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +<br>
=C2=A0tests/qapi-schema/aliases-bad-type.json=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A03 +<br>
=C2=A0tests/qapi-schema/aliases-bad-type.out=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A00<br>
=C2=A0tests/qapi-schema/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 16 +<br>
=C2=A0tests/qapi-schema/qapi-schema-test.json=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 35 ++<br>
=C2=A0tests/qapi-schema/qapi-schema-test.out=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 44 ++<br>
=C2=A0tests/qapi-schema/unknown-expr-key.err=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A065 files changed, 1290 insertions(+), 57 deletions(-)<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-bad-type.err<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-bad-type.json<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-bad-type.out<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-missing-source.err<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-missing-source.json<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-missing-source.out<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-name-bad-type.err<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-name-bad-type.json<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-name-bad-type.out<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-name-conflict.err<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-name-conflict.json<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-name-conflict.out<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-recursive.err<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-recursive.json<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-recursive.out<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-source-bad-type.err<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-source-bad-type.json<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-source-bad-type.out<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-source-elem-bad-type.err<b=
r>
=C2=A0create mode 100644 tests/qapi-schema/alias-source-elem-bad-type.json<=
br>
=C2=A0create mode 100644 tests/qapi-schema/alias-source-elem-bad-type.out<b=
r>
=C2=A0create mode 100644 tests/qapi-schema/alias-source-empty.err<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-source-empty.json<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-source-empty.out<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-source-inexistent-variants=
.err<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-source-inexistent-variants=
.json<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-source-inexistent-variants=
.out<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-source-inexistent.err<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-source-inexistent.json<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-source-inexistent.out<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-source-non-object-path.err=
<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-source-non-object-path.jso=
n<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-source-non-object-path.out=
<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-source-non-object-wildcard=
.err<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-source-non-object-wildcard=
.json<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-source-non-object-wildcard=
.out<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-source-optional-wildcard-i=
ndirect.err<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-source-optional-wildcard-i=
ndirect.json<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-source-optional-wildcard-i=
ndirect.out<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-source-optional-wildcard.e=
rr<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-source-optional-wildcard.j=
son<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-source-optional-wildcard.o=
ut<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-unknown-key.err<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-unknown-key.json<br>
=C2=A0create mode 100644 tests/qapi-schema/alias-unknown-key.out<br>
=C2=A0create mode 100644 tests/qapi-schema/aliases-bad-type.err<br>
=C2=A0create mode 100644 tests/qapi-schema/aliases-bad-type.json<br>
=C2=A0create mode 100644 tests/qapi-schema/aliases-bad-type.out<br>
<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000120f6505cf481646--


