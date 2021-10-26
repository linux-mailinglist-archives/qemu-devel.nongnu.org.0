Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE59843B6F9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 18:19:09 +0200 (CEST)
Received: from localhost ([::1]:50802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfPAK-0006c3-Jl
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 12:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfP6W-0003l8-JH
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:15:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfP6S-0001kL-D6
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:15:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635264906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qj486gZkKM2O1/4kptAcAzbyLCdnJ6PosY109GppccA=;
 b=ftMSZYNKVA7Xylwnu3UfJ/ysIT4e7J6q3VgcF+biWCEXGfB8py2r6pLUUTvBs2gVKYti3k
 c5rEkYribIB3Wn3PISUqd0snKALjz45IkwaGxpxrBTDee/u4G/YzlhLyb77ZudaPOaM7To
 8berQOi7QbfZu84rb39jNdokuLqSHYM=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-LrLqSJfsPiGHBOsKL5X-Ug-1; Tue, 26 Oct 2021 12:15:03 -0400
X-MC-Unique: LrLqSJfsPiGHBOsKL5X-Ug-1
Received: by mail-ua1-f69.google.com with SMTP id
 g44-20020ab059af000000b002cb93a5cee0so3903048uad.6
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 09:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qj486gZkKM2O1/4kptAcAzbyLCdnJ6PosY109GppccA=;
 b=NDqlvLPBqlb8H32LBWGQSjJYvAK+IxFhW4nC4lmAu8zCA4Hgcmjz/FlWGwUSN7AMmM
 SdegPOSAzWXNnj2fi1b5CC+5uFFrwDbAVatJ100I9TrucgqmcJVex/jcmGLQk97gn/B9
 ov5O+RQjfgPvy4Jbm4szi1CAQUoHtd+WwrQ/SNP4bqlZK2AZxJlHMERv4uzsHSTaRgc5
 xZoPD+fME/ZbNeOUTz919VRN1C7INWX0zEEpDZ8JuQnfDSe6SdCy+sz2RFCEMuAJGKpw
 ubQekRMLCIHKlfSH+u7d316vkeIBR/+A75RMbnCdZfYJ8Zh79ycaUHjJ6kZLdPruB1RN
 HyhQ==
X-Gm-Message-State: AOAM5301jXxy0Egc3khgWEVZmAkXw1rSZFrEPL2qtcpxf7eSdP8Nov2M
 o2Y5A7wik3AumqBGYbraugd5z0HH7gykUvLDxYvjT2uQNO5YdexJ8C3tiuuZmU9/BCxuxwGO5iM
 W9VxLYNQ4VG2gDNrH5N0p/eFLTE94mV0=
X-Received: by 2002:a67:ec94:: with SMTP id h20mr24481575vsp.59.1635264903358; 
 Tue, 26 Oct 2021 09:15:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7isncV2gyV+ztaFurlWLh0TlJBoxwSfUk6Dd0FRmXaRVe5jxmM7jyliGDldZPGHCtxOVzcHC5jejmkOQOPuE=
X-Received: by 2002:a67:ec94:: with SMTP id h20mr24481540vsp.59.1635264903188; 
 Tue, 26 Oct 2021 09:15:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-8-armbru@redhat.com>
 <CAFn=p-aCMCzDoA_Q54j85Lz=TEnLEVn-h-YeHS0EtWdA12fRDw@mail.gmail.com>
 <87ilxk3yv2.fsf@dusky.pond.sub.org>
In-Reply-To: <87ilxk3yv2.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Tue, 26 Oct 2021 12:14:52 -0400
Message-ID: <CAFn=p-ZUmUn3EM1sJ5WRyOj9rLWKuvr29zN40-jPM2VLbbJTXw@mail.gmail.com>
Subject: Re: [PATCH 7/9] qapi: Generalize enum member policy checking
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000ab36e405cf43c7c1"
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

--000000000000ab36e405cf43c7c1
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 26, 2021 at 5:43 AM Markus Armbruster <armbru@redhat.com> wrote:

> John Snow <jsnow@redhat.com> writes:
>
> > On Mon, Oct 25, 2021 at 1:26 AM Markus Armbruster <armbru@redhat.com>
> wrote:
> >
> >> The code to check enumeration value policy can see special feature
> >> flag 'deprecated' in QEnumLookup member flags[value].  I want to make
> >> feature flag 'unstable' visible there as well, so I can add policy for
> >> it.
> >>
> >> Instead of extending flags[], replace it by @special_features (a
> >> bitset of QapiSpecialFeature), because that's how special features get
> >> passed around elsewhere.
> >>
> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >> ---
> >>  include/qapi/util.h    |  5 +----
> >>  qapi/qapi-visit-core.c |  3 ++-
> >>  scripts/qapi/types.py  | 22 ++++++++++++----------
> >>  3 files changed, 15 insertions(+), 15 deletions(-)
> >>
> >> diff --git a/include/qapi/util.h b/include/qapi/util.h
> >> index 7a8d5c7d72..0cc98db9f9 100644
> >> --- a/include/qapi/util.h
> >> +++ b/include/qapi/util.h
> >> @@ -15,12 +15,9 @@ typedef enum {
> >>      QAPI_DEPRECATED,
> >>  } QapiSpecialFeature;
> >>
> >> -/* QEnumLookup flags */
> >> -#define QAPI_ENUM_DEPRECATED 1
> >> -
> >>  typedef struct QEnumLookup {
> >>      const char *const *array;
> >> -    const unsigned char *const flags;
> >> +    const unsigned char *const special_features;
> >>      const int size;
> >>  } QEnumLookup;
> >>
> >> diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c
> >> index b4a81f1757..5572d90efb 100644
> >> --- a/qapi/qapi-visit-core.c
> >> +++ b/qapi/qapi-visit-core.c
> >> @@ -407,7 +407,8 @@ static bool input_type_enum(Visitor *v, const char
> >> *name, int *obj,
> >>          return false;
> >>      }
> >>
> >> -    if (lookup->flags && (lookup->flags[value] &
> QAPI_ENUM_DEPRECATED)) {
> >> +    if (lookup->special_features
> >> +        && (lookup->special_features[value] & QAPI_DEPRECATED)) {
> >>          switch (v->compat_policy.deprecated_input) {
> >>          case COMPAT_POLICY_INPUT_ACCEPT:
> >>              break;
> >> diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
> >> index ab2441adc9..3013329c24 100644
> >> --- a/scripts/qapi/types.py
> >> +++ b/scripts/qapi/types.py
> >> @@ -16,7 +16,7 @@
> >>  from typing import List, Optional
> >>
> >>  from .common import c_enum_const, c_name, mcgen
> >> -from .gen import QAPISchemaModularCVisitor, ifcontext
> >> +from .gen import QAPISchemaModularCVisitor, gen_special_features,
> >> ifcontext
> >>  from .schema import (
> >>      QAPISchema,
> >>      QAPISchemaEnumMember,
> >> @@ -39,7 +39,7 @@ def gen_enum_lookup(name: str,
> >>                      members: List[QAPISchemaEnumMember],
> >>                      prefix: Optional[str] = None) -> str:
> >>      max_index = c_enum_const(name, '_MAX', prefix)
> >> -    flags = ''
> >> +    feats = ''
> >>      ret = mcgen('''
> >>
> >>  const QEnumLookup %(c_name)s_lookup = {
> >> @@ -54,19 +54,21 @@ def gen_enum_lookup(name: str,
> >>  ''',
> >>                       index=index, name=memb.name)
> >>          ret += memb.ifcond.gen_endif()
> >> -        if 'deprecated' in (f.name for f in memb.features):
> >> -            flags += mcgen('''
> >> -        [%(index)s] = QAPI_ENUM_DEPRECATED,
> >> -''',
> >> -                           index=index)
> >>
> >> -    if flags:
> >> +        special_features = gen_special_features(memb.features)
> >> +        if special_features != '0':
> >>
> >
> > Though, I have to admit the common reoccurrence of this pattern suggests
> to
> > me that gen_special_features really ought to be returning something
> false-y
> > in these cases. Something about testing for the empty case with something
> > that represents, but isn't empty, gives me a brief pause.
> >
> > Not willing to wage war over it.
>
> I habitually start stupid, and when stupid confuses or annoys me later,
> I smarten it up some.
>
> Let's see how this instance of "stupid" ages, okay?
>
>
"I see what you're saying, but mehhhhh" is a relatable feeling ;)

>
> >> +            feats += mcgen('''
> >> +        [%(index)s] = %(special_features)s,
> >> +''',
> >> +                           index=index,
> special_features=special_features)
> >> +
> >> +    if feats:
> >>          ret += mcgen('''
> >>      },
> >> -    .flags = (const unsigned char[%(max_index)s]) {
> >> +    .special_features = (const unsigned char[%(max_index)s]) {
> >>  ''',
> >>                       max_index=max_index)
> >> -        ret += flags
> >> +        ret += feats
> >>
> >>      ret += mcgen('''
> >>      },
> >> --
> >> 2.31.1
> >>
> >>
> > Python bits: Acked-by: John Snow <jsnow@redhat.com>
>
> Thanks!
>
>

--000000000000ab36e405cf43c7c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 26, 2021 at 5:43 AM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">John=
 Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@redha=
t.com</a>&gt; writes:<br>
<br>
&gt; On Mon, Oct 25, 2021 at 1:26 AM Markus Armbruster &lt;<a href=3D"mailt=
o:armbru@redhat.com" target=3D"_blank">armbru@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; The code to check enumeration value policy can see special feature=
<br>
&gt;&gt; flag &#39;deprecated&#39; in QEnumLookup member flags[value].=C2=
=A0 I want to make<br>
&gt;&gt; feature flag &#39;unstable&#39; visible there as well, so I can ad=
d policy for<br>
&gt;&gt; it.<br>
&gt;&gt;<br>
&gt;&gt; Instead of extending flags[], replace it by @special_features (a<b=
r>
&gt;&gt; bitset of QapiSpecialFeature), because that&#39;s how special feat=
ures get<br>
&gt;&gt; passed around elsewhere.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redh=
at.com" target=3D"_blank">armbru@redhat.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 include/qapi/util.h=C2=A0 =C2=A0 |=C2=A0 5 +----<br>
&gt;&gt;=C2=A0 qapi/qapi-visit-core.c |=C2=A0 3 ++-<br>
&gt;&gt;=C2=A0 scripts/qapi/types.py=C2=A0 | 22 ++++++++++++----------<br>
&gt;&gt;=C2=A0 3 files changed, 15 insertions(+), 15 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/include/qapi/util.h b/include/qapi/util.h<br>
&gt;&gt; index 7a8d5c7d72..0cc98db9f9 100644<br>
&gt;&gt; --- a/include/qapi/util.h<br>
&gt;&gt; +++ b/include/qapi/util.h<br>
&gt;&gt; @@ -15,12 +15,9 @@ typedef enum {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 QAPI_DEPRECATED,<br>
&gt;&gt;=C2=A0 } QapiSpecialFeature;<br>
&gt;&gt;<br>
&gt;&gt; -/* QEnumLookup flags */<br>
&gt;&gt; -#define QAPI_ENUM_DEPRECATED 1<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 typedef struct QEnumLookup {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 const char *const *array;<br>
&gt;&gt; -=C2=A0 =C2=A0 const unsigned char *const flags;<br>
&gt;&gt; +=C2=A0 =C2=A0 const unsigned char *const special_features;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 const int size;<br>
&gt;&gt;=C2=A0 } QEnumLookup;<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c<br>
&gt;&gt; index b4a81f1757..5572d90efb 100644<br>
&gt;&gt; --- a/qapi/qapi-visit-core.c<br>
&gt;&gt; +++ b/qapi/qapi-visit-core.c<br>
&gt;&gt; @@ -407,7 +407,8 @@ static bool input_type_enum(Visitor *v, const =
char<br>
&gt;&gt; *name, int *obj,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 if (lookup-&gt;flags &amp;&amp; (lookup-&gt;flags[v=
alue] &amp; QAPI_ENUM_DEPRECATED)) {<br>
&gt;&gt; +=C2=A0 =C2=A0 if (lookup-&gt;special_features<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (lookup-&gt;special_featur=
es[value] &amp; QAPI_DEPRECATED)) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (v-&gt;compat_policy.depr=
ecated_input) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case COMPAT_POLICY_INPUT_ACCEPT:=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py<br>
&gt;&gt; index ab2441adc9..3013329c24 100644<br>
&gt;&gt; --- a/scripts/qapi/types.py<br>
&gt;&gt; +++ b/scripts/qapi/types.py<br>
&gt;&gt; @@ -16,7 +16,7 @@<br>
&gt;&gt;=C2=A0 from typing import List, Optional<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 from .common import c_enum_const, c_name, mcgen<br>
&gt;&gt; -from .gen import QAPISchemaModularCVisitor, ifcontext<br>
&gt;&gt; +from .gen import QAPISchemaModularCVisitor, gen_special_features,=
<br>
&gt;&gt; ifcontext<br>
&gt;&gt;=C2=A0 from .schema import (<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchema,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 QAPISchemaEnumMember,<br>
&gt;&gt; @@ -39,7 +39,7 @@ def gen_enum_lookup(name: str,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 members: List[QAPISchemaEnumMember],<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 prefix: Optional[str] =3D None) -&gt; str:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 max_index =3D c_enum_const(name, &#39;_MAX&#39=
;, prefix)<br>
&gt;&gt; -=C2=A0 =C2=A0 flags =3D &#39;&#39;<br>
&gt;&gt; +=C2=A0 =C2=A0 feats =3D &#39;&#39;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 ret =3D mcgen(&#39;&#39;&#39;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 const QEnumLookup %(c_name)s_lookup =3D {<br>
&gt;&gt; @@ -54,19 +54,21 @@ def gen_enum_lookup(name: str,<br>
&gt;&gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0index=3Dindex, name=3D<a href=3D"http://memb.name" rel=3D"=
noreferrer" target=3D"_blank">memb.name</a>)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D memb.ifcond.gen_endif()=
<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;deprecated&#39; in (<a href=
=3D"http://f.name" rel=3D"noreferrer" target=3D"_blank">f.name</a> for f in=
 memb.features):<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flags +=3D mcgen(&#39;&=
#39;&#39;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 [%(index)s] =3D QAPI_ENUM_DEPRECATED,=
<br>
&gt;&gt; -&#39;&#39;&#39;,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0index=3Dindex)<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 if flags:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 special_features =3D gen_special_feat=
ures(memb.features)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if special_features !=3D &#39;0&#39;:=
<br>
&gt;&gt;<br>
&gt;<br>
&gt; Though, I have to admit the common reoccurrence of this pattern sugges=
ts to<br>
&gt; me that gen_special_features really ought to be returning something fa=
lse-y<br>
&gt; in these cases. Something about testing for the empty case with someth=
ing<br>
&gt; that represents, but isn&#39;t empty, gives me a brief pause.<br>
&gt;<br>
&gt; Not willing to wage war over it.<br>
<br>
I habitually start stupid, and when stupid confuses or annoys me later,<br>
I smarten it up some.<br>
<br>
Let&#39;s see how this instance of &quot;stupid&quot; ages, okay?<br>
<br></blockquote></div><div class=3D"gmail_quote"><br></div><div class=3D"g=
mail_quote">&quot;I see what you&#39;re saying, but mehhhhh&quot; is a rela=
table feeling ;)<br></div><div class=3D"gmail_quote">=C2=A0<blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 feats +=3D mcgen(&#39;&=
#39;&#39;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [%(index)s] =3D %(special_features)s,=
<br>
&gt;&gt; +&#39;&#39;&#39;,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0index=3Dindex, special_features=3Dspecial=
_features)<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 if feats:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 },<br>
&gt;&gt; -=C2=A0 =C2=A0 .flags =3D (const unsigned char[%(max_index)s]) {<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 .special_features =3D (const unsigned char[%(max_in=
dex)s]) {<br>
&gt;&gt;=C2=A0 &#39;&#39;&#39;,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0max_index=3Dmax_index)<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D flags<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret +=3D feats<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 ret +=3D mcgen(&#39;&#39;&#39;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 },<br>
&gt;&gt; --<br>
&gt;&gt; 2.31.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; Python bits: Acked-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.co=
m" target=3D"_blank">jsnow@redhat.com</a>&gt;<br>
<br>
Thanks!<br>
<br>
</blockquote></div></div>

--000000000000ab36e405cf43c7c1--


