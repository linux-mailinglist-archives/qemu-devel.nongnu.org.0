Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 720B4439EEF
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 21:04:17 +0200 (CEST)
Received: from localhost ([::1]:48098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf5Ga-0004mS-3o
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 15:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mf5EL-0002gt-Uz
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 15:01:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mf5EG-00042n-AC
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 15:01:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635188510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ebfqdms0ZVdN1KCpehdztsTYrt5bHqLKF6Hh6B2c6PY=;
 b=VGM0y5nH6bZOGE4IMM9e1YkjNOJqBZJQcTR3a9Tt33QXHWAWY6wIMLVZDvFg88CIptjWmQ
 0ahlIJl8xo+zD/j+s82MG5ZGY7RrZR5uNC7PVtFrF5rWYs2vYz3ioBXP29ylGgiWsN+0Gv
 lkfqsV0MGWK9IaWjMqKiNuNp0tPBZj8=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-_XTfWXQUMy-4pwGg01nRVA-1; Mon, 25 Oct 2021 15:01:48 -0400
X-MC-Unique: _XTfWXQUMy-4pwGg01nRVA-1
Received: by mail-vk1-f197.google.com with SMTP id
 j190-20020a1f23c7000000b002a420cdd181so3647540vkj.21
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 12:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ebfqdms0ZVdN1KCpehdztsTYrt5bHqLKF6Hh6B2c6PY=;
 b=o/SoLDzwwKQvkCF9eIL5K8SBZUHpEaHH+W3Y1RIaYWnT4VOnw9olVG1CUqN40Nxp/a
 k1Poc6gjL6Pi0XHQB82OUp9BFBcfo1/HeQY/NViBhjTP72prHqDoe8Ltid/pQRn0RNNH
 aQGQQmUuxyQJ0GgOVI2xpGKk3cZMQVA/CiogmX79wJ7Kaa5I8uA0Xmqw3skdz8vumueC
 NVif8hIHZafi2MY5jqDa2omtGPytl3u9hkfFRCmui7k46jyzQgzwVPhpckrDzG8ZRUhr
 3q/K2OaBAWdqQV+xoztf5qxCLt9qVZvWT+IroC3e+dtwTa7aMBiuCeZTP2t/ulEb6GcD
 hwCw==
X-Gm-Message-State: AOAM5335fFXVAlHWLnCz3x7Kjl34jw88EERHmPOl6qE17Pf/xkYcswSO
 A4JC7BB09TmrnqKkkTsMH226lxfIhA4dIL3h4kJxQcAalwBB4x0FwIt/NBTb6FDlLOoXrSyHQGI
 WlZEqVYSkhk8qO+ESmoyyXTT8jFZWCDw=
X-Received: by 2002:a05:6122:c89:: with SMTP id
 ba9mr16948723vkb.25.1635188507993; 
 Mon, 25 Oct 2021 12:01:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeRqiHE1N7fqKTerlsD85EHsCkahK1YxzW4HAT6CaHo/EnQYeV4rtffegmSOxEiuq3Ys3l3noFUiVhUgKnnTE=
X-Received: by 2002:a05:6122:c89:: with SMTP id
 ba9mr16948692vkb.25.1635188507813; 
 Mon, 25 Oct 2021 12:01:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-2-armbru@redhat.com>
In-Reply-To: <20211025052532.3859634-2-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 25 Oct 2021 15:01:37 -0400
Message-ID: <CAFn=p-YsLXCQDqHSTiUqOHcS1OBxcFa15bXQ=ggagabQDX8N=Q@mail.gmail.com>
Subject: Re: [PATCH 1/9] qapi: New special feature flag "unstable"
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000263cf105cf31fe05"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, pkrempa@redhat.com,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 libvir-list@redhat.com, qemu-devel <qemu-devel@nongnu.org>,
 mdroth@linux.vnet.ibm.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000263cf105cf31fe05
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 25, 2021 at 1:26 AM Markus Armbruster <armbru@redhat.com> wrote:

> By convention, names starting with "x-" are experimental.  The parts
> of external interfaces so named may be withdrawn or changed
> incompatibly in future releases.
>
> Drawback: promoting something from experimental to stable involves a
> name change.  Client code needs to be updated.
>
> Moreover, the convention is not universally observed:
>
> * QOM type "input-barrier" has properties "x-origin", "y-origin".
>   Looks accidental, but it's ABI since 4.2.
>
> * QOM types "memory-backend-file", "memory-backend-memfd",
>   "memory-backend-ram", and "memory-backend-epc" have a property
>   "x-use-canonical-path-for-ramblock-id" that is documented to be
>   stable despite its name.
>
> We could document these exceptions, but documentation helps only
> humans.  We want to recognize "unstable" in code, like "deprecated".
>
> Replace the convention by a new special feature flag "unstable".  It
> will be recognized by the QAPI generator, like the existing feature
> flag "deprecated", and unlike regular feature flags.
>
> This commit updates documentation and prepares tests.  The next commit
> updates the QAPI schema.  The remaining patches update the QAPI
> generator and wire up -compat policy checking.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  docs/devel/qapi-code-gen.rst            | 9 ++++++---
>  tests/qapi-schema/qapi-schema-test.json | 7 +++++--
>  tests/qapi-schema/qapi-schema-test.out  | 5 +++++
>  3 files changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
> index 4071c9074a..38f2d7aad3 100644
> --- a/docs/devel/qapi-code-gen.rst
> +++ b/docs/devel/qapi-code-gen.rst
> @@ -713,6 +713,10 @@ member as deprecated.  It is not supported elsewhere
> so far.
>  Interfaces so marked may be withdrawn in future releases in accordance
>  with QEMU's deprecation policy.
>
> +Feature "unstable" marks a command, event, enum value, or struct
> +member as unstable.  It is not supported elsewhere so far.  Interfaces
> +so marked may be withdrawn or changed incompatibly in future releases.
> +
>
>  Naming rules and reserved names
>  -------------------------------
> @@ -746,9 +750,8 @@ Member name ``u`` and names starting with ``has-`` or
> ``has_`` are reserved
>  for the generator, which uses them for unions and for tracking
>  optional members.
>
> -Any name (command, event, type, member, or enum value) beginning with
> -``x-`` is marked experimental, and may be withdrawn or changed
> -incompatibly in a future release.
> +Names beginning with ``x-`` used to signify "experimental".  This
> +convention has been replaced by special feature "unstable".
>
>  Pragmas ``command-name-exceptions`` and ``member-name-exceptions`` let
>  you violate naming rules.  Use for new code is strongly discouraged. See
> diff --git a/tests/qapi-schema/qapi-schema-test.json
> b/tests/qapi-schema/qapi-schema-test.json
> index b677ab861d..43b8697002 100644
> --- a/tests/qapi-schema/qapi-schema-test.json
> +++ b/tests/qapi-schema/qapi-schema-test.json
> @@ -273,7 +273,7 @@
>    'data': { 'foo': { 'type': 'int', 'features': [ 'deprecated' ] } },
>    'features': [ 'feature1' ] }
>  { 'struct': 'FeatureStruct2',
> -  'data': { 'foo': 'int' },
> +  'data': { 'foo': { 'type': 'int', 'features': [ 'unstable' ] } },
>    'features': [ { 'name': 'feature1' } ] }
>  { 'struct': 'FeatureStruct3',
>    'data': { 'foo': 'int' },
> @@ -331,7 +331,7 @@
>  { 'command': 'test-command-features1',
>    'features': [ 'deprecated' ] }
>  { 'command': 'test-command-features3',
> -  'features': [ 'feature1', 'feature2' ] }
> +  'features': [ 'unstable', 'feature1', 'feature2' ] }
>
>  { 'command': 'test-command-cond-features1',
>    'features': [ { 'name': 'feature1', 'if': 'TEST_IF_FEATURE_1'} ] }
> @@ -348,3 +348,6 @@
>
>  { 'event': 'TEST_EVENT_FEATURES1',
>    'features': [ 'deprecated' ] }
> +
> +{ 'event': 'TEST_EVENT_FEATURES2',
> +  'features': [ 'unstable' ] }
> diff --git a/tests/qapi-schema/qapi-schema-test.out
> b/tests/qapi-schema/qapi-schema-test.out
> index 16846dbeb8..1f9585fa9b 100644
> --- a/tests/qapi-schema/qapi-schema-test.out
> +++ b/tests/qapi-schema/qapi-schema-test.out
> @@ -308,6 +308,7 @@ object FeatureStruct1
>      feature feature1
>  object FeatureStruct2
>      member foo: int optional=False
> +        feature unstable
>      feature feature1
>  object FeatureStruct3
>      member foo: int optional=False
> @@ -373,6 +374,7 @@ command test-command-features1 None -> None
>      feature deprecated
>  command test-command-features3 None -> None
>      gen=True success_response=True boxed=False oob=False preconfig=False
> +    feature unstable
>      feature feature1
>      feature feature2
>  command test-command-cond-features1 None -> None
> @@ -394,6 +396,9 @@ event TEST_EVENT_FEATURES0 FeatureStruct1
>  event TEST_EVENT_FEATURES1 None
>      boxed=False
>      feature deprecated
> +event TEST_EVENT_FEATURES2 None
> +    boxed=False
> +    feature unstable
>  module include/sub-module.json
>  include sub-sub-module.json
>  object SecondArrayRef
> --
> 2.31.1
>
>
Feels odd to combine the doc update *and* test prep, but eh, whatever.

Reviewed-by: John Snow <jsnow@redhat.com>

--000000000000263cf105cf31fe05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 25, 2021 at 1:26 AM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">By c=
onvention, names starting with &quot;x-&quot; are experimental.=C2=A0 The p=
arts<br>
of external interfaces so named may be withdrawn or changed<br>
incompatibly in future releases.<br>
<br>
Drawback: promoting something from experimental to stable involves a<br>
name change.=C2=A0 Client code needs to be updated.<br>
<br>
Moreover, the convention is not universally observed:<br>
<br>
* QOM type &quot;input-barrier&quot; has properties &quot;x-origin&quot;, &=
quot;y-origin&quot;.<br>
=C2=A0 Looks accidental, but it&#39;s ABI since 4.2.<br>
<br>
* QOM types &quot;memory-backend-file&quot;, &quot;memory-backend-memfd&quo=
t;,<br>
=C2=A0 &quot;memory-backend-ram&quot;, and &quot;memory-backend-epc&quot; h=
ave a property<br>
=C2=A0 &quot;x-use-canonical-path-for-ramblock-id&quot; that is documented =
to be<br>
=C2=A0 stable despite its name.<br>
<br>
We could document these exceptions, but documentation helps only<br>
humans.=C2=A0 We want to recognize &quot;unstable&quot; in code, like &quot=
;deprecated&quot;.<br>
<br>
Replace the convention by a new special feature flag &quot;unstable&quot;.=
=C2=A0 It<br>
will be recognized by the QAPI generator, like the existing feature<br>
flag &quot;deprecated&quot;, and unlike regular feature flags.<br>
<br>
This commit updates documentation and prepares tests.=C2=A0 The next commit=
<br>
updates the QAPI schema.=C2=A0 The remaining patches update the QAPI<br>
generator and wire up -compat policy checking.<br>
<br>
Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" t=
arget=3D"_blank">armbru@redhat.com</a>&gt;<br>
---<br>
=C2=A0docs/devel/qapi-code-gen.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 9 ++++++---<br>
=C2=A0tests/qapi-schema/qapi-schema-test.json | 7 +++++--<br>
=C2=A0tests/qapi-schema/qapi-schema-test.out=C2=A0 | 5 +++++<br>
=C2=A03 files changed, 16 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst<br=
>
index 4071c9074a..38f2d7aad3 100644<br>
--- a/docs/devel/qapi-code-gen.rst<br>
+++ b/docs/devel/qapi-code-gen.rst<br>
@@ -713,6 +713,10 @@ member as deprecated.=C2=A0 It is not supported elsewh=
ere so far.<br>
=C2=A0Interfaces so marked may be withdrawn in future releases in accordanc=
e<br>
=C2=A0with QEMU&#39;s deprecation policy.<br>
<br>
+Feature &quot;unstable&quot; marks a command, event, enum value, or struct=
<br>
+member as unstable.=C2=A0 It is not supported elsewhere so far.=C2=A0 Inte=
rfaces<br>
+so marked may be withdrawn or changed incompatibly in future releases.<br>
+<br>
<br>
=C2=A0Naming rules and reserved names<br>
=C2=A0-------------------------------<br>
@@ -746,9 +750,8 @@ Member name ``u`` and names starting with ``has-`` or `=
`has_`` are reserved<br>
=C2=A0for the generator, which uses them for unions and for tracking<br>
=C2=A0optional members.<br>
<br>
-Any name (command, event, type, member, or enum value) beginning with<br>
-``x-`` is marked experimental, and may be withdrawn or changed<br>
-incompatibly in a future release.<br>
+Names beginning with ``x-`` used to signify &quot;experimental&quot;.=C2=
=A0 This<br>
+convention has been replaced by special feature &quot;unstable&quot;.<br>
<br>
=C2=A0Pragmas ``command-name-exceptions`` and ``member-name-exceptions`` le=
t<br>
=C2=A0you violate naming rules.=C2=A0 Use for new code is strongly discoura=
ged. See<br>
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qa=
pi-schema-test.json<br>
index b677ab861d..43b8697002 100644<br>
--- a/tests/qapi-schema/qapi-schema-test.json<br>
+++ b/tests/qapi-schema/qapi-schema-test.json<br>
@@ -273,7 +273,7 @@<br>
=C2=A0 =C2=A0&#39;data&#39;: { &#39;foo&#39;: { &#39;type&#39;: &#39;int&#3=
9;, &#39;features&#39;: [ &#39;deprecated&#39; ] } },<br>
=C2=A0 =C2=A0&#39;features&#39;: [ &#39;feature1&#39; ] }<br>
=C2=A0{ &#39;struct&#39;: &#39;FeatureStruct2&#39;,<br>
-=C2=A0 &#39;data&#39;: { &#39;foo&#39;: &#39;int&#39; },<br>
+=C2=A0 &#39;data&#39;: { &#39;foo&#39;: { &#39;type&#39;: &#39;int&#39;, &=
#39;features&#39;: [ &#39;unstable&#39; ] } },<br>
=C2=A0 =C2=A0&#39;features&#39;: [ { &#39;name&#39;: &#39;feature1&#39; } ]=
 }<br>
=C2=A0{ &#39;struct&#39;: &#39;FeatureStruct3&#39;,<br>
=C2=A0 =C2=A0&#39;data&#39;: { &#39;foo&#39;: &#39;int&#39; },<br>
@@ -331,7 +331,7 @@<br>
=C2=A0{ &#39;command&#39;: &#39;test-command-features1&#39;,<br>
=C2=A0 =C2=A0&#39;features&#39;: [ &#39;deprecated&#39; ] }<br>
=C2=A0{ &#39;command&#39;: &#39;test-command-features3&#39;,<br>
-=C2=A0 &#39;features&#39;: [ &#39;feature1&#39;, &#39;feature2&#39; ] }<br=
>
+=C2=A0 &#39;features&#39;: [ &#39;unstable&#39;, &#39;feature1&#39;, &#39;=
feature2&#39; ] }<br>
<br>
=C2=A0{ &#39;command&#39;: &#39;test-command-cond-features1&#39;,<br>
=C2=A0 =C2=A0&#39;features&#39;: [ { &#39;name&#39;: &#39;feature1&#39;, &#=
39;if&#39;: &#39;TEST_IF_FEATURE_1&#39;} ] }<br>
@@ -348,3 +348,6 @@<br>
<br>
=C2=A0{ &#39;event&#39;: &#39;TEST_EVENT_FEATURES1&#39;,<br>
=C2=A0 =C2=A0&#39;features&#39;: [ &#39;deprecated&#39; ] }<br>
+<br>
+{ &#39;event&#39;: &#39;TEST_EVENT_FEATURES2&#39;,<br>
+=C2=A0 &#39;features&#39;: [ &#39;unstable&#39; ] }<br>
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qap=
i-schema-test.out<br>
index 16846dbeb8..1f9585fa9b 100644<br>
--- a/tests/qapi-schema/qapi-schema-test.out<br>
+++ b/tests/qapi-schema/qapi-schema-test.out<br>
@@ -308,6 +308,7 @@ object FeatureStruct1<br>
=C2=A0 =C2=A0 =C2=A0feature feature1<br>
=C2=A0object FeatureStruct2<br>
=C2=A0 =C2=A0 =C2=A0member foo: int optional=3DFalse<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 feature unstable<br>
=C2=A0 =C2=A0 =C2=A0feature feature1<br>
=C2=A0object FeatureStruct3<br>
=C2=A0 =C2=A0 =C2=A0member foo: int optional=3DFalse<br>
@@ -373,6 +374,7 @@ command test-command-features1 None -&gt; None<br>
=C2=A0 =C2=A0 =C2=A0feature deprecated<br>
=C2=A0command test-command-features3 None -&gt; None<br>
=C2=A0 =C2=A0 =C2=A0gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3D=
False preconfig=3DFalse<br>
+=C2=A0 =C2=A0 feature unstable<br>
=C2=A0 =C2=A0 =C2=A0feature feature1<br>
=C2=A0 =C2=A0 =C2=A0feature feature2<br>
=C2=A0command test-command-cond-features1 None -&gt; None<br>
@@ -394,6 +396,9 @@ event TEST_EVENT_FEATURES0 FeatureStruct1<br>
=C2=A0event TEST_EVENT_FEATURES1 None<br>
=C2=A0 =C2=A0 =C2=A0boxed=3DFalse<br>
=C2=A0 =C2=A0 =C2=A0feature deprecated<br>
+event TEST_EVENT_FEATURES2 None<br>
+=C2=A0 =C2=A0 boxed=3DFalse<br>
+=C2=A0 =C2=A0 feature unstable<br>
=C2=A0module include/sub-module.json<br>
=C2=A0include sub-sub-module.json<br>
=C2=A0object SecondArrayRef<br>
-- <br>
2.31.1<br>
<br></blockquote></div><div class=3D"gmail_quote"><br></div><div class=3D"g=
mail_quote">Feels odd to combine the doc update *and* test prep, but eh, wh=
atever.</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote=
">Reviewed-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redh=
at.com</a>&gt;<br></div></div>

--000000000000263cf105cf31fe05--


