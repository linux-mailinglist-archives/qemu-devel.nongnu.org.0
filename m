Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 382AE43A1A2
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 21:38:52 +0200 (CEST)
Received: from localhost ([::1]:51688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf5o3-0003TI-9d
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 15:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mf5Xm-0000Vt-JS
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 15:22:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mf5Xi-0007AQ-BJ
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 15:22:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635189717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lWjKBUIo4dTPSWcY0FqtKY7MXgiNMqAhWuPpQHhNyOQ=;
 b=Q9+i4WIK88afvaWGaZjSKHlntSUm++azKnYQjqmdxBHBHBIffKtkFhvg3ZzVI1e3077uX+
 288f+p++FS5PFEu467HTyOmCYF6c1zwu9W6fntYhoxSveTRiamWYryNN9z5BYbh32tU4wh
 lSxRaDosvq2zZx/vS7VF0pyTBbBC87k=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-NZl_Zm1UMWqyxZXbZIrbag-1; Mon, 25 Oct 2021 15:21:56 -0400
X-MC-Unique: NZl_Zm1UMWqyxZXbZIrbag-1
Received: by mail-vk1-f199.google.com with SMTP id
 a186-20020a1f98c3000000b002dc2d7639b9so2530488vke.10
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 12:21:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lWjKBUIo4dTPSWcY0FqtKY7MXgiNMqAhWuPpQHhNyOQ=;
 b=AIhJmmswgKljWn9CoQCOGibIE+LUFTitqZmW0yNcgAjGvH93T0a0Jd9Piu3Xj6Paw2
 9hbl6nfmke0ADhnPgTLYiAvT//4PR5PsOmVJkLD+8IJ3fW91bjHUO0aqF3DOViH9gGRc
 Eyr9KvS5ZPmX+Wj8arqK8vbUkywqggbn981U0R6rQln5Mr659rVXVxstfH2AxT9rtM5+
 oyfv1oc3h70t1QDfaiDKCg5btdgYqHov5ulBFI4s3cefv5TQGNFLsnQsJh8JwgUi7uhJ
 dxrAUYYFJ0agFTEA0wrBIg3bXoihBnIDJlDpOSAaHBCPGUER/BVysEkWijVeq5tZ5iLN
 j1+w==
X-Gm-Message-State: AOAM532L0WNGst1TmBwwBwtrZXdnFNSVeVaSbBLZLieLKkaK3EyIsZqK
 zHX9MCp4T5jAh+gHqAD8+oOW231U8IEG8m2IzegECrVLSlSt+7hWLEER9+7QC5ttF+BbpyS3koO
 2ijJbAo8k3lbd6Nph0K6xZB0nValmVhs=
X-Received: by 2002:a67:33ce:: with SMTP id z197mr7778876vsz.13.1635189714134; 
 Mon, 25 Oct 2021 12:21:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGRbALyqpTlpdLXD9lEUKorao8LFohcHFA4G0vMOpcFrguUFrliS5vgRAKp3BZL0JTAeuXBGle6+PHMblWfV4=
X-Received: by 2002:a67:33ce:: with SMTP id z197mr7778855vsz.13.1635189713974; 
 Mon, 25 Oct 2021 12:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-5-armbru@redhat.com>
In-Reply-To: <20211025052532.3859634-5-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 25 Oct 2021 15:21:43 -0400
Message-ID: <CAFn=p-a41vWkiS_sCKjk_-DNt7=V741q0FntQXWZMAt3m76bBQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] qapi: Tools for sets of special feature flags in
 generated code
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000000ad03105cf324694"
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

--0000000000000ad03105cf324694
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 25, 2021 at 1:25 AM Markus Armbruster <armbru@redhat.com> wrote:

> New enum QapiSpecialFeature enumerates the special feature flags.
>
> New helper gen_special_features() returns code to represent a
> collection of special feature flags as a bitset.
>
> The next few commits will put them to use.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/qapi/util.h    |  4 ++++
>  scripts/qapi/gen.py    | 13 +++++++++++++
>  scripts/qapi/schema.py |  3 +++
>  3 files changed, 20 insertions(+)
>
> diff --git a/include/qapi/util.h b/include/qapi/util.h
> index 257c600f99..7a8d5c7d72 100644
> --- a/include/qapi/util.h
> +++ b/include/qapi/util.h
> @@ -11,6 +11,10 @@
>  #ifndef QAPI_UTIL_H
>  #define QAPI_UTIL_H
>
> +typedef enum {
> +    QAPI_DEPRECATED,
> +} QapiSpecialFeature;
> +
>  /* QEnumLookup flags */
>  #define QAPI_ENUM_DEPRECATED 1
>
> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
> index 2ec1e7b3b6..9d07b88cf6 100644
> --- a/scripts/qapi/gen.py
> +++ b/scripts/qapi/gen.py
> @@ -29,6 +29,7 @@
>      mcgen,
>  )
>  from .schema import (
> +    QAPISchemaFeature,
>      QAPISchemaIfCond,
>      QAPISchemaModule,
>      QAPISchemaObjectType,
> @@ -37,6 +38,18 @@
>  from .source import QAPISourceInfo
>
>
> +def gen_special_features(features: QAPISchemaFeature):
> +    ret = ''
> +    sep = ''
> +
> +    for feat in features:
> +        if feat.is_special():
> +            ret += ('%s1u << QAPI_%s' % (sep, feat.name.upper()))
>

Building the constant name here "feels" fragile, but I'll trust that the
test suite and/or the compiler will catch us if we accidentally goof up
this mapping. In the interest of simplicity, then, "sure, why not."


> +            sep = ' | '
> +
>
+    return ret or '0'
> +
>

Subjectively more pythonic:

special_features = [f"1u << QAPI_{feat.name.upper()}" for feat in features
if feat.is_special()]
ret = ' | '.join(special_features)
return ret or '0'

A bit more dense, but more functional. Up to you, but I find join() easier
to read and reason about for the presence of separators.


> +
>  class QAPIGen:
>      def __init__(self, fname: str):
>          self.fname = fname
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index 6d5f46509a..55f82d7389 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -725,6 +725,9 @@ def connect_doc(self, doc):
>  class QAPISchemaFeature(QAPISchemaMember):
>      role = 'feature'
>
> +    def is_special(self):
> +        return self.name in ('deprecated')
> +
>

alrighty.

(Briefly wondered: is it worth naming special features as a property of the
class, but with only two names, it's probably fine enough to leave it
embedded in the method logic. Only a style thing and doesn't have any
actual impact that I can imagine, so ... nevermind.)


>
>  class QAPISchemaObjectTypeMember(QAPISchemaMember):
>      def __init__(self, name, info, typ, optional, ifcond=None,
> features=None):
> --
> 2.31.1
>
>
Well, either way:

Reviewed-by: John Snow <jsnow@redhat.com>

--0000000000000ad03105cf324694
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 25, 2021 at 1:25 AM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">New =
enum QapiSpecialFeature enumerates the special feature flags.<br>
<br>
New helper gen_special_features() returns code to represent a<br>
collection of special feature flags as a bitset.<br>
<br>
The next few commits will put them to use.<br>
<br>
Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" t=
arget=3D"_blank">armbru@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/qapi/util.h=C2=A0 =C2=A0 |=C2=A0 4 ++++<br>
=C2=A0scripts/qapi/gen.py=C2=A0 =C2=A0 | 13 +++++++++++++<br>
=C2=A0scripts/qapi/schema.py |=C2=A0 3 +++<br>
=C2=A03 files changed, 20 insertions(+)<br>
<br>
diff --git a/include/qapi/util.h b/include/qapi/util.h<br>
index 257c600f99..7a8d5c7d72 100644<br>
--- a/include/qapi/util.h<br>
+++ b/include/qapi/util.h<br>
@@ -11,6 +11,10 @@<br>
=C2=A0#ifndef QAPI_UTIL_H<br>
=C2=A0#define QAPI_UTIL_H<br>
<br>
+typedef enum {<br>
+=C2=A0 =C2=A0 QAPI_DEPRECATED,<br>
+} QapiSpecialFeature;<br>
+<br>
=C2=A0/* QEnumLookup flags */<br>
=C2=A0#define QAPI_ENUM_DEPRECATED 1<br>
<br>
diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py<br>
index 2ec1e7b3b6..9d07b88cf6 100644<br>
--- a/scripts/qapi/gen.py<br>
+++ b/scripts/qapi/gen.py<br>
@@ -29,6 +29,7 @@<br>
=C2=A0 =C2=A0 =C2=A0mcgen,<br>
=C2=A0)<br>
=C2=A0from .schema import (<br>
+=C2=A0 =C2=A0 QAPISchemaFeature,<br>
=C2=A0 =C2=A0 =C2=A0QAPISchemaIfCond,<br>
=C2=A0 =C2=A0 =C2=A0QAPISchemaModule,<br>
=C2=A0 =C2=A0 =C2=A0QAPISchemaObjectType,<br>
@@ -37,6 +38,18 @@<br>
=C2=A0from .source import QAPISourceInfo<br>
<br>
<br>
+def gen_special_features(features: QAPISchemaFeature):<br>
+=C2=A0 =C2=A0 ret =3D &#39;&#39;<br>
+=C2=A0 =C2=A0 sep =3D &#39;&#39;<br>
+<br>
+=C2=A0 =C2=A0 for feat in features:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if feat.is_special():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D (&#39;%s1u &lt;&lt; QAP=
I_%s&#39; % (sep, feat.name.upper()))<br></blockquote><div><br></div><div>B=
uilding the constant name here &quot;feels&quot; fragile, but I&#39;ll trus=
t that the test suite and/or the compiler will catch us if we=20
accidentally goof up this mapping. In the interest of simplicity, then,=20
&quot;sure, why not.&quot; <br></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sep =3D &#39; | &#39;<br>
+<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 return ret or &#39;0&#39;<br>
+<br></blockquote><div><br></div><div>Subjectively more pythonic:<br></div>=
<div><br><div>special_features =3D [f&quot;1u &lt;&lt; QAPI_{feat.name.uppe=
r()}&quot; for feat in features if feat.is_special()]</div><div>ret =3D &#3=
9; | &#39;.join(special_features)</div><div>return ret or &#39;0&#39;</div>=
<div><br></div><div>A bit more dense, but more functional. Up to you, but I=
 find join() easier to read and reason about for the presence of separators=
.<br></div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+<br>
=C2=A0class QAPIGen:<br>
=C2=A0 =C2=A0 =C2=A0def __init__(self, fname: str):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.fname =3D fname<br>
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py<br>
index 6d5f46509a..55f82d7389 100644<br>
--- a/scripts/qapi/schema.py<br>
+++ b/scripts/qapi/schema.py<br>
@@ -725,6 +725,9 @@ def connect_doc(self, doc):<br>
=C2=A0class QAPISchemaFeature(QAPISchemaMember):<br>
=C2=A0 =C2=A0 =C2=A0role =3D &#39;feature&#39;<br>
<br>
+=C2=A0 =C2=A0 def is_special(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return <a href=3D"http://self.name" rel=3D"nor=
eferrer" target=3D"_blank">self.name</a> in (&#39;deprecated&#39;)<br>
+<br></blockquote><div><br></div><div>alrighty.</div><div><br></div><div>(B=
riefly wondered: is it worth naming special features as a property of the c=
lass, but with only two names, it&#39;s probably fine enough to leave it em=
bedded in the method logic. Only a style thing and doesn&#39;t have any act=
ual impact that I can imagine, so ... nevermind.)<br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0class QAPISchemaObjectTypeMember(QAPISchemaMember):<br>
=C2=A0 =C2=A0 =C2=A0def __init__(self, name, info, typ, optional, ifcond=3D=
None, features=3DNone):<br>
-- <br>
2.31.1<br>
<br></blockquote><div><br></div><div>Well, either way:</div><div><br></div>=
<div>Reviewed-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@r=
edhat.com</a>&gt;<br></div></div></div>

--0000000000000ad03105cf324694--


