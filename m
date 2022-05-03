Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EB151818B
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 11:46:46 +0200 (CEST)
Received: from localhost ([::1]:56324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlp7F-0004o2-Fn
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 05:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nlp2H-0000mg-Kf
 for qemu-devel@nongnu.org; Tue, 03 May 2022 05:41:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1nlp2F-0004LQ-Mt
 for qemu-devel@nongnu.org; Tue, 03 May 2022 05:41:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651570894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5MUfsdylKu96Yi+6Iyoy8SyfhgvJPh1eVodoqMzVgMY=;
 b=FnqMShmP/lbWhGALpZy0RPSTiv83yks9yT8p7AT/CtsIVYE/BVf/uHxBO5U9Rt7/DhLskC
 3W5t/2+3y65ZlP/RtVH8u409mvLqJ5AMyQWSIhkds1+TjGFUwjyRRv8WQS0XK/LgOtKhXs
 0X3kZBMBQqqz3fgDRT4RkPT612mItvE=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-345-j8rc-U6oOoicdKvNeGn_Fg-1; Tue, 03 May 2022 05:41:33 -0400
X-MC-Unique: j8rc-U6oOoicdKvNeGn_Fg-1
Received: by mail-yb1-f198.google.com with SMTP id
 b33-20020a25aea1000000b0064588c45fbaso9835047ybj.16
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 02:41:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5MUfsdylKu96Yi+6Iyoy8SyfhgvJPh1eVodoqMzVgMY=;
 b=vNCHZuKD96FcDixpTBhFCFtfEOtdfNLILNGkOlO/GEC0PEsGXjvTNzvzovmilgPpKU
 OgJOgkwXMnTxkRoX4Yu67bH1u33+e0leYzeY1kbZ1dflnSM9AYnyV/zUtl6/q7M48MBg
 ajaNizXyaRCOZV2adWLtyzE5k53DLgyfadSHsy1PFiaFvx+u9iEouWrOB+XjHO//wGzq
 HGneYmnvChl/BWAgmRn3Hllztnsm3QazH95AO44VR6PSOmq27KmVCrbSmhc66wVxaLZH
 0nORNsllsP1PdFz9294Q2DvFeLiHumUVMPHqsf35OhR7TiOYra1isS7Wxpon/Nyr5TNd
 C+Ig==
X-Gm-Message-State: AOAM5331kVwBdL8joxVYgsUhhErU76UjW4wE2zicuYLcwbhkyS5vPVdE
 vws/aM2fJJD3k5SyPz+TMS49j4/Cl8ChM3ta/27NbgMJQjcTXXpVYfdcoYJR95Bxm4Ax32ADXuW
 XR5PNsY16wGJnbLg3XL3VyjjUpB/YbqI=
X-Received: by 2002:a81:b044:0:b0:2d6:bd1f:5d8b with SMTP id
 x4-20020a81b044000000b002d6bd1f5d8bmr14467599ywk.27.1651570892996; 
 Tue, 03 May 2022 02:41:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlrFDkmA4dyZXbyNsO6Pm9Wezpz7KJpr2f91cc73g+YXus3sHgbBKeZzbTDtCEqpR6rwdwtTwwrfz7LSC4Wjo=
X-Received: by 2002:a81:b044:0:b0:2d6:bd1f:5d8b with SMTP id
 x4-20020a81b044000000b002d6bd1f5d8bmr14467586ywk.27.1651570892800; Tue, 03
 May 2022 02:41:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220428182120.302066-1-kkostiuk@redhat.com>
 <0b0afdba-2f8f-1035-458b-f13d1f09f355@redhat.com>
 <YnDu4lkn9UPcspqX@redhat.com>
In-Reply-To: <YnDu4lkn9UPcspqX@redhat.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Tue, 3 May 2022 12:41:22 +0300
Message-ID: <CAPMcbCrCefWrcbNC5hieSC7GHL53hBvnW6owH2xGYveWA5XX3g@mail.gmail.com>
Subject: Re: [PATCH 0/2] build improvments
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>, 
 Thomas Huth <thuth@redhat.com>, Michael Roth <michael.roth@amd.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000006314ce05de1850c6"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006314ce05de1850c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

This was my mistake when I sent patches.
Thanks for your comment.

Best Regards,
Konstantin Kostiuk.


On Tue, May 3, 2022 at 11:59 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Fri, Apr 29, 2022 at 12:10:34AM +0200, Paolo Bonzini wrote:
> > On 4/28/22 20:21, Konstantin Kostiuk wrote:
> > > Konstantin Kostiuk (2):
> > >    configure: Add cross prefix for widl tool
> > >    qga-vss: always build qga-vss.tlb when qga-vss.dll is built
> > >
> > >   configure                 | 3 +++
> > >   qga/vss-win32/meson.build | 4 ++--
> > >   2 files changed, 5 insertions(+), 2 deletions(-)
> >
> > Both titles make sense, but they didn't reach the mailing list.
>
> They did, but were each sent as standalone mail threads before this
> cover letter was sent.
>
> Konstantin: I'd suggest using 'git-publish' for sending patches in
> future, as it automatically does the right thing, ensuring that the
> threading is set correctly, and has many other benefits over sending
> patch emails manually
>
> With regards,
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

--0000000000006314ce05de1850c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Daniel,</div><div><br></div><div>This was my mista=
ke when I sent patches.</div><div>Thanks for your comment. </div><div><br><=
/div><div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D=
"gmail_signature"><div dir=3D"ltr"><div>Best Regards,</div><div>Konstantin =
Kostiuk.</div></div></div></div><br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 3, 2022 at 11:59 AM D=
aniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@=
redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Fri, Apr 29, 2022 at 12:10:34AM +0200, Paolo Bonzini wrote:<b=
r>
&gt; On 4/28/22 20:21, Konstantin Kostiuk wrote:<br>
&gt; &gt; Konstantin Kostiuk (2):<br>
&gt; &gt;=C2=A0 =C2=A0 configure: Add cross prefix for widl tool<br>
&gt; &gt;=C2=A0 =C2=A0 qga-vss: always build qga-vss.tlb when qga-vss.dll i=
s built<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 3 +++<br>
&gt; &gt;=C2=A0 =C2=A0qga/vss-win32/meson.build | 4 ++--<br>
&gt; &gt;=C2=A0 =C2=A02 files changed, 5 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; Both titles make sense, but they didn&#39;t reach the mailing list.<br=
>
<br>
They did, but were each sent as standalone mail threads before this<br>
cover letter was sent.<br>
<br>
Konstantin: I&#39;d suggest using &#39;git-publish&#39; for sending patches=
 in<br>
future, as it automatically does the right thing, ensuring that the<br>
threading is set correctly, and has many other benefits over sending<br>
patch emails manually<br>
<br>
With regards,<br>
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
</blockquote></div>

--0000000000006314ce05de1850c6--


