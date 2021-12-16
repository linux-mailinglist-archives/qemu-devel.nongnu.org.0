Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDC847794D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 17:36:54 +0100 (CET)
Received: from localhost ([::1]:53774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxtkT-0003sN-06
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 11:36:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxti8-0002u9-84
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:34:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxti4-00051X-Tl
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 11:34:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639672464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4XSFFVFenxHwQPTRrwUSGtw1+atpMv921LWVGiBDQ3M=;
 b=bVNFmP5CsqShkpStGehCu6uTLPWLNqV3y1j8O8XuhIz2ZmbbM2hIuol0DcNLz8dcOZ4MKM
 E+GrTE6lmKR0r5u8nuToZ5hd0NHZ26Dl6sg0ttnuAWNUQqs7IWLOrPb9vQrjlPnbmarIDy
 3jiZUyrRSSaJ/ulW0R2a7B7NzXgAa9I=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-bSfEBdxsPE60KXKOR6yNTw-1; Thu, 16 Dec 2021 11:34:14 -0500
X-MC-Unique: bSfEBdxsPE60KXKOR6yNTw-1
Received: by mail-vk1-f199.google.com with SMTP id
 q3-20020a056122116300b002faa0b9026fso12223854vko.18
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 08:34:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4XSFFVFenxHwQPTRrwUSGtw1+atpMv921LWVGiBDQ3M=;
 b=Tm+T3lQNeLLn1y2LWrbnBUe/OPbTkig9NkIiyMKswvZ+E1bT+gtz+y3UUiVkSDmnBV
 KeNMM1FmLNgzoWEldzOmYsD11oCeCsTjFNqig5HZ0i3QFwm7mixeSeHUdhpg1bRTr+h9
 bU9DjNK0YVwVVSLWhxAqPDHV15UJy824W7Jv16C+rJQdE+jMrDeUmtcbAjZLuT8Xjlzx
 TzGpkAuuhgu6ESBFPhTNRLQ9DhnrHj/KF1qeJfWt5lBY91jGCr1Daucj1rFQiSb7K4be
 40EoZoSN+yhcz79jHbiV8nnvtmKsI5y0CCEiBdRi1u/OH1IhyX/rW1+HaIqOKRoU8eGL
 348g==
X-Gm-Message-State: AOAM5330DiLo1Kc3QzbIXIP7Xue9GFpQQzch7NVYxZRPQCw3eKOZ9/Dw
 mTZopU0INj7ZtbgunKn5/XpoxMkwdcLIRArSfPWPmqzft85UBbBQq0GBUCT6N/p6/rOynvsbKVe
 dDMEHndRfQuuenacoLtcn4lNqCkaawCk=
X-Received: by 2002:a67:441:: with SMTP id 62mr5355134vse.61.1639672453623;
 Thu, 16 Dec 2021 08:34:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbapbPvrPh9GxdniAVL1QlL3xy1RvYgmqnDUHf1XfXyUtZ4sO/3l69s3WRLNCvRPVREisAiDBtWg6UghbECB8=
X-Received: by 2002:a67:441:: with SMTP id 62mr5355120vse.61.1639672453427;
 Thu, 16 Dec 2021 08:34:13 -0800 (PST)
MIME-Version: 1.0
References: <20211215210634.3779791-1-jsnow@redhat.com>
 <20211215210634.3779791-4-jsnow@redhat.com>
 <YbsYO514CsqjYn5t@redhat.com>
In-Reply-To: <YbsYO514CsqjYn5t@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 16 Dec 2021 11:34:02 -0500
Message-ID: <CAFn=p-Y+oo7HUKBCfRZNJG==51xT10_DNEYXV9uFneZMVLp36w@mail.gmail.com>
Subject: Re: [RFC qemu.qmp PATCH 03/24] Update maintainer metadata
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000022891f05d345fec4"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000022891f05d345fec4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 16, 2021 at 5:43 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Wed, Dec 15, 2021 at 04:06:13PM -0500, John Snow wrote:
> > I'm the primary author of this particular component; update the metadat=
a
> > accordingly.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  setup.cfg | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/setup.cfg b/setup.cfg
> > index 9999bca..7cd8470 100644
> > --- a/setup.cfg
> > +++ b/setup.cfg
> > @@ -1,7 +1,9 @@
> >  [metadata]
> >  name =3D qemu.qmp
> >  version =3D file:VERSION
> > -maintainer =3D QEMU Developer Team
> > +author =3D John Snow
> > +author_email =3D jsnow@redhat.com
>
> Isn't the authorship of this more of a collaborative effort ?
> IOW, shouldn't it just be "The QEMU Project" as for the
> maintainer.
>

Sorta. The code in this specific package is > 95% written by me, so I felt
the authorship credit here was roughly appropriate. So, I put myself as the
"Author" but "QEMU Project" as the "maintainer". I put a lot of work into
this, so it felt weird to say that it was authored by a mailing list.

I also wanted to avoid not listing my own name at all, since this has
largely been my initiative to polish it up, write docs, and split it out --
it feels rude to just dump responsibility straight back on the list and
pretend I'm not the point of contact for it.

>
> > +maintainer =3D QEMU Project
> >  maintainer_email =3D qemu-devel@nongnu.org
> >  url =3D https://www.qemu.org/
> >  download_url =3D https://www.qemu.org/download/
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--00000000000022891f05d345fec4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 16, 2021 at 5:43 AM Danie=
l P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Wed, Dec 15, 2021 at 04:06:13PM -0500, John Snow wrote:<br>
&gt; I&#39;m the primary author of this particular component; update the me=
tadata<br>
&gt; accordingly.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 setup.cfg | 4 +++-<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/setup.cfg b/setup.cfg<br>
&gt; index 9999bca..7cd8470 100644<br>
&gt; --- a/setup.cfg<br>
&gt; +++ b/setup.cfg<br>
&gt; @@ -1,7 +1,9 @@<br>
&gt;=C2=A0 [metadata]<br>
&gt;=C2=A0 name =3D qemu.qmp<br>
&gt;=C2=A0 version =3D file:VERSION<br>
&gt; -maintainer =3D QEMU Developer Team<br>
&gt; +author =3D John Snow<br>
&gt; +author_email =3D <a href=3D"mailto:jsnow@redhat.com" target=3D"_blank=
">jsnow@redhat.com</a><br>
<br>
Isn&#39;t the authorship of this more of a collaborative effort ?<br>
IOW, shouldn&#39;t it just be &quot;The QEMU Project&quot; as for the<br>
maintainer.<br></blockquote><div><br></div><div>Sorta. The code in this spe=
cific package is &gt; 95% written by me, so I felt the authorship credit he=
re was roughly appropriate. So, I put myself as the &quot;Author&quot; but =
&quot;QEMU Project&quot; as the &quot;maintainer&quot;. I put a lot of work=
 into this, so it felt weird to say that it was authored by a mailing list.=
</div><div><br></div><div>I also wanted to avoid not listing my own name at=
 all, since this has largely been my initiative to polish it up, write docs=
, and split it out -- it feels rude to just dump responsibility straight ba=
ck on the list and pretend I&#39;m not the point of contact for it.<br></di=
v>=C2=A0<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +maintainer =3D QEMU Project<br>
&gt;=C2=A0 maintainer_email =3D <a href=3D"mailto:qemu-devel@nongnu.org" ta=
rget=3D"_blank">qemu-devel@nongnu.org</a><br>
&gt;=C2=A0 url =3D <a href=3D"https://www.qemu.org/" rel=3D"noreferrer" tar=
get=3D"_blank">https://www.qemu.org/</a><br>
&gt;=C2=A0 download_url =3D <a href=3D"https://www.qemu.org/download/" rel=
=3D"noreferrer" target=3D"_blank">https://www.qemu.org/download/</a><br>
<br>
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div>

--00000000000022891f05d345fec4--


