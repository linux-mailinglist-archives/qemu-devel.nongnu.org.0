Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 578852DE0BC
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:09:57 +0100 (CET)
Received: from localhost ([::1]:53504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqChw-0003Gd-EH
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:09:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kqCgv-0002q5-FE
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:08:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kqCgp-0001no-8M
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:08:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608286126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OpthnczLNsHUfMWtwNZMuv3Pn0xFwSHBX+7mhhwawSA=;
 b=NYDDYui4SPmPqNPA2DQ2O6nCSoUy+M6Ek+NWGS67KJ7ciIgKrvG4kTZ1x3SWe10MH1brp4
 i4cpB4XaGmLcQsTWIKIqs1/YuW2QtgbeFCn5Fj226DMdp6EpA7rAlBuvbEYegCukYVV8X7
 zwbkl/MKRv/rYE00f+1M+qtnsczstNQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-J8d5Qo18NuiYcb5NBw-TPA-1; Fri, 18 Dec 2020 05:08:43 -0500
X-MC-Unique: J8d5Qo18NuiYcb5NBw-TPA-1
Received: by mail-ed1-f72.google.com with SMTP id bf13so882755edb.10
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 02:08:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OpthnczLNsHUfMWtwNZMuv3Pn0xFwSHBX+7mhhwawSA=;
 b=eHsGvO6qqiljaxJl3lv9TaU2/vnbiy0ttEu9zfhHy53CnlQziLTFmvHg/3CZ7ri+Hf
 r7dpEL6ICuBfBMloEvXFOv0JsmTeyMQPDvuiFdOvO8ytGqa8TaW27zitHbbJSItWrEmG
 j+wbk4WuqdpsJNr9ZTyvBz57PgsZSykt2VrP8A6J6wdPKc0pyTXBIRTiqXv++5/uT3Kx
 b7i4bM6a3BrdZSpRCPY8nnEO6yL2J9b8ikN5Ie/Bw0cGZL7YVAHogoOd2stcMEfCjiLr
 uI02FKuWI4nncc0H3OtCWcoVaRKg2+1FBuojYR8R+yfciRoPbD/YNGK7RzcRa6hrr3lK
 6ldA==
X-Gm-Message-State: AOAM530DQw1l3C8O7QcL2YKBRObvrhML0lY/Kz90XVNG+ZmDsfMKBduR
 oJre8DoS+CcOT2BGg6hgLLPWM9xY/yjG+6IKY52tmOLNg2h2x59vVwAc1Z/wq08McTH8O3Vk1dW
 eyjZczr6oI9qtblVkf+ygjCfCP38bxbk=
X-Received: by 2002:a17:906:3114:: with SMTP id
 20mr3253538ejx.460.1608286122463; 
 Fri, 18 Dec 2020 02:08:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/dsWylB9+JB3Q0fAlOxAVMFWOtc3QMy8JpalLnExQoY7K2utryV82y+n2fy7FCfYC/fmwnN3qBeXxpHbo2r0=
X-Received: by 2002:a17:906:3114:: with SMTP id
 20mr3253528ejx.460.1608286122333; 
 Fri, 18 Dec 2020 02:08:42 -0800 (PST)
MIME-Version: 1.0
References: <20201218084611.634254-1-marcandre.lureau@redhat.com>
 <023ac901-2c57-15da-4dfe-62b1f4f1c23d@redhat.com>
In-Reply-To: <023ac901-2c57-15da-4dfe-62b1f4f1c23d@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 18 Dec 2020 14:08:31 +0400
Message-ID: <CAMxuvayDzUmpBg8n10zD=7pYtKtwQZs1n0wAvPjMzKTZ4ZNuGQ@mail.gmail.com>
Subject: Re: [PATCH] whpx: fix compilation
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000004edbf05b6ba4b53"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: sunilmut@microsoft.com, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000004edbf05b6ba4b53
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Dec 18, 2020 at 1:51 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 18/12/20 09:46, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > When compiling WHPX (on msys2)
> >
> > FAILED: libqemu-x86_64-softmmu.fa.p/target_i386_whpx_whpx-all.c.obj
> > ../target/i386/whpx/whpx-all.c:29:10: fatal error: whp-dispatch.h: No
> such file or directory
> >     29 | #include "whp-dispatch.h"
> >        |          ^~~~~~~~~~~~~~~~
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   include/sysemu/whpx.h | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/sysemu/whpx.h b/include/sysemu/whpx.h
> > index 9346fd92e9..79ab3d73cf 100644
> > --- a/include/sysemu/whpx.h
> > +++ b/include/sysemu/whpx.h
> > @@ -15,7 +15,9 @@
> >
> >   #ifdef CONFIG_WHPX
> >
> > -#include "whp-dispatch.h"
> > +#include <windows.h>
> > +#include <WinHvPlatform.h>
> > +#include <WinHvEmulation.h>
> >
> >   struct whpx_state {
> >       uint64_t mem_quota;
> >
>
> This is wrong, just "git mv target/i386/whpx/whp-dispatch.h
> include/sysemu" instead (and possibly change the #include line to
> sysemu/whp-dispatch.h).
>

Wrong? It fixes the build. So whatever is in whp-dispatch, it's not exactly
necessary. Why should it be included?

Furthermore, I tried your suggestion first. But it fails with other include
issues. I can probably solve them differently, but why should whp-dispatch
be in include/sysemu?


> But I wonder if whp-dispatch.h is needed at all in this file.  If we can
> just include it in whpx-all.c and whpx-apic.c, that would be much better.
>

May be, but how does this solve the issue with include/sysemu/whpx.h ?

--00000000000004edbf05b6ba4b53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 18, 2020 at 1:51 PM Pao=
lo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 18/12/20 09:46, <a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_=
blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; When compiling WHPX (on msys2)<br>
&gt; <br>
&gt; FAILED: libqemu-x86_64-softmmu.fa.p/target_i386_whpx_whpx-all.c.obj<br=
>
&gt; ../target/i386/whpx/whpx-all.c:29:10: fatal error: whp-dispatch.h: No =
such file or directory<br>
&gt;=C2=A0 =C2=A0 =C2=A029 | #include &quot;whp-dispatch.h&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~=
~~~~~~~~~<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 =C2=A0include/sysemu/whpx.h | 4 +++-<br>
&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/include/sysemu/whpx.h b/include/sysemu/whpx.h<br>
&gt; index 9346fd92e9..79ab3d73cf 100644<br>
&gt; --- a/include/sysemu/whpx.h<br>
&gt; +++ b/include/sysemu/whpx.h<br>
&gt; @@ -15,7 +15,9 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#ifdef CONFIG_WHPX<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -#include &quot;whp-dispatch.h&quot;<br>
&gt; +#include &lt;windows.h&gt;<br>
&gt; +#include &lt;WinHvPlatform.h&gt;<br>
&gt; +#include &lt;WinHvEmulation.h&gt;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0struct whpx_state {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t mem_quota;<br>
&gt; <br>
<br>
This is wrong, just &quot;git mv target/i386/whpx/whp-dispatch.h <br>
include/sysemu&quot; instead (and possibly change the #include line to <br>
sysemu/whp-dispatch.h).<br></blockquote><div><br></div><div>Wrong? It fixes=
 the build. So whatever is in whp-dispatch, it&#39;s not exactly necessary.=
 Why should it be included?<br></div><div><br></div><div>Furthermore, I tri=
ed your suggestion first. But it fails with other include issues. I can pro=
bably solve them differently, but why should whp-dispatch be in include/sys=
emu?<br></div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
But I wonder if whp-dispatch.h is needed at all in this file.=C2=A0 If we c=
an <br>
just include it in whpx-all.c and whpx-apic.c, that would be much better.<b=
r></blockquote><div><br></div><div>May be, but how does this solve the issu=
e with include/sysemu/whpx.h ? <br></div></div></div>

--00000000000004edbf05b6ba4b53--


