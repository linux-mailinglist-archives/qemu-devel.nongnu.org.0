Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDB948BB41
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 00:09:14 +0100 (CET)
Received: from localhost ([::1]:37196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7QGP-0006NK-9D
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 18:09:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1n7QE5-0005gK-B7
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 18:06:49 -0500
Received: from [2607:f8b0:4864:20::933] (port=39451
 helo=mail-ua1-x933.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1n7QE3-0002LK-6l
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 18:06:49 -0500
Received: by mail-ua1-x933.google.com with SMTP id m15so1502407uap.6
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 15:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GOqa+twuWvUrdAjP1D9orYPz5m59mt8/b0y5DSpiWsk=;
 b=maXbwofNdaRFE6HrjM/Gy9JHpybJRH5/2iBnUaRsHskmeHfaVjlsddZP8jUDhyV2UU
 iAtVUkBz8Oxoh2Wx1+SJ/WFRPAFFybShOsD5u3IPkVtoMN8pXcawD7Dq2GNq3qOy9N2v
 +WO0s3LEjuxcXDwJd74be+A/wJbxfAz6Bc4aT3A4LUQTfQsDWyrLy7BKXvCtC0Skc+Ro
 SrYeNvloQvwx8tnUPNQGtOfvS8/yfdOV8wMWuuB3PuNravG2wAxes4MtAtAktiDNPMKk
 MT6QDVbzGBYSR9xGZwOavhB5xAYI3tow+TdK0nGMhs2xuurYhAzIJbNfGY+Ar77kK0tr
 Nibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GOqa+twuWvUrdAjP1D9orYPz5m59mt8/b0y5DSpiWsk=;
 b=rVrvzBuwYa7GKPTw9N2zSvM4mLIxFgrmCmqJU1qJ7/O8zL6+/0z/pOVD5k9P7nRuV0
 jP263MlbIDQewIihDHgmnnchvg9R52sYULbequ7ROzRVnCFnrXRN/RMDVJfVDusEBtNB
 HM+mvPAkN1ObSGHLDK70uBvIvvj3OmHMaAP2GUtONP0zFkIs5/+aLnAp4MPjHdoh2+ju
 s6yAnueS2FHis4g/IVrt+kEW623HepLIWYSjWnOqmgTuhnK+iEizOCCiWog9oi8Mrsrq
 gJ4VJrY4AxJByRc0sbdzqtcn1XEXyHSnxLWexgc7Izk+eM2w+jKSae2CUGBa5j1iZjKr
 bErg==
X-Gm-Message-State: AOAM530JY7IYP1mW7pMYRv1BehkQ2s49AsTik2kVqKW85caXjxzEDPZm
 i60jKWt3KUmHBgA3BOfzK5sNUECZruMWfdMDMSHByQ==
X-Google-Smtp-Source: ABdhPJxjsIIM2AOQjVfsL+Ty6n/bJV4omxCeWsRz5xP6MaaghOx9he+4NqwlxhTzI7ND8hUORw7yvKFrzijuPo3x0UE=
X-Received: by 2002:a67:cf04:: with SMTP id y4mr2948736vsl.35.1641942405936;
 Tue, 11 Jan 2022 15:06:45 -0800 (PST)
MIME-Version: 1.0
References: <20220106220038.3658586-1-venture@google.com>
 <3d44e8ff-6adc-8c52-5449-1c3ef4355786@vivier.eu>
 <CAO=notz06X6SP+U_FSkMsJtUO751+2EkqffCRQqyNUkTPb6oqA@mail.gmail.com>
 <718486b4-0ad1-5d48-9f24-4d8b58ee072b@vivier.eu>
In-Reply-To: <718486b4-0ad1-5d48-9f24-4d8b58ee072b@vivier.eu>
From: Patrick Venture <venture@google.com>
Date: Tue, 11 Jan 2022 15:06:34 -0800
Message-ID: <CAO=notwDxr__=qYZpDCzRRx_0e8_Gped22yL-y1oeS8Z7BL-RA@mail.gmail.com>
Subject: Re: [PATCH] linux-user: rt_sigprocmask, check read perms first
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Shu-Chun Weng <scw@google.com>
Content-Type: multipart/alternative; boundary="000000000000d9510c05d5568147"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::933
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=venture@google.com; helo=mail-ua1-x933.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

--000000000000d9510c05d5568147
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 11, 2022 at 12:50 PM Laurent Vivier <laurent@vivier.eu> wrote:

> Hi Patrick,
>
> Le 11/01/2022 =C3=A0 21:14, Patrick Venture a =C3=A9crit :
> >
> >
> > On Sat, Jan 8, 2022 at 10:16 AM Laurent Vivier <laurent@vivier.eu
> <mailto:laurent@vivier.eu>> wrote:
> >
> >     Le 06/01/2022 =C3=A0 23:00, Patrick Venture a =C3=A9crit :
> >      > From: Shu-Chun Weng <scw@google.com <mailto:scw@google.com>>
> >      >
> >      > Linux kernel does it this way (checks read permission before
> validating `how`)
> >      > and the latest version of ABSL's `AddressIsReadable()` depends o=
n
> this
> >      > behavior.
> >      >
> >      > c.f.
> >
> https://github.com/torvalds/linux/blob/9539ba4308ad5bdca6cb41c7b73cbb9f79=
6dcdd7/kernel/signal.c#L3147
> >     <
> https://github.com/torvalds/linux/blob/9539ba4308ad5bdca6cb41c7b73cbb9f79=
6dcdd7/kernel/signal.c#L3147
> >
> >      > Reviewed-by: Patrick Venture <venture@google.com <mailto:
> venture@google.com>>
> >      > Signed-off-by: Shu-Chun Weng <scw@google.com <mailto:
> scw@google.com>>
> >      > ---
> >      >   linux-user/syscall.c | 10 +++++-----
> >      >   1 file changed, 5 insertions(+), 5 deletions(-)
> >      >
> >      > diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> >      > index ce9d64896c..3070d31f34 100644
> >      > --- a/linux-user/syscall.c
> >      > +++ b/linux-user/syscall.c
> >      > @@ -9491,6 +9491,11 @@ static abi_long do_syscall1(void *cpu_env=
,
> int num, abi_long arg1,
> >      >               }
> >      >
> >      >               if (arg2) {
> >      > +                if (!(p =3D lock_user(VERIFY_READ, arg2,
> sizeof(target_sigset_t), 1)))
> >      > +                    return -TARGET_EFAULT;
> >      > +                target_to_host_sigset(&set, p);
> >      > +                unlock_user(p, arg2, 0);
> >      > +                set_ptr =3D &set;
> >      >                   switch(how) {
> >      >                   case TARGET_SIG_BLOCK:
> >      >                       how =3D SIG_BLOCK;
> >      > @@ -9504,11 +9509,6 @@ static abi_long do_syscall1(void *cpu_env=
,
> int num, abi_long arg1,
> >      >                   default:
> >      >                       return -TARGET_EINVAL;
> >      >                   }
> >      > -                if (!(p =3D lock_user(VERIFY_READ, arg2,
> sizeof(target_sigset_t), 1)))
> >      > -                    return -TARGET_EFAULT;
> >      > -                target_to_host_sigset(&set, p);
> >      > -                unlock_user(p, arg2, 0);
> >      > -                set_ptr =3D &set;
> >      >               } else {
> >      >                   how =3D 0;
> >      >                   set_ptr =3D NULL;
> >
> >     I know it's only code move but generally we also update the style t=
o
> pass scripts/checkpatch.pl
> >     <http://checkpatch.pl>
> >     successfully.
> >
> >
> > That is a reasonable request, however, can I just send a follow-on
> patch?  I didn't write this one
> > and I honestly don't know much about it, but I don't mind doing the
> cleanup
> >
> >
> >     Could you also update TARGET_NR_sigprocmask in the same way as it
> seems the kernel behaves like
> >     this
> >     too in this case?
> >
> >
> > I can take a look.  I would prefer then to also prefetch the style fixu=
p
> in a preceding patch. I
> > don't recall seeing whether qemu supports clang-format.
> >
>
> There is no problem. You can keep this patch unmodified, and add patches
> to fix the problems.
>
> I only ask to have all the patches in one series.
>

Will take a swing at this for v2.


>
> Thanks,
> Laurent
>
>

--000000000000d9510c05d5568147
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 11, 2022 at 12:50 PM Laur=
ent Vivier &lt;<a href=3D"mailto:laurent@vivier.eu">laurent@vivier.eu</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Pat=
rick,<br>
<br>
Le 11/01/2022 =C3=A0 21:14, Patrick Venture a =C3=A9crit=C2=A0:<br>
&gt; <br>
&gt; <br>
&gt; On Sat, Jan 8, 2022 at 10:16 AM Laurent Vivier &lt;<a href=3D"mailto:l=
aurent@vivier.eu" target=3D"_blank">laurent@vivier.eu</a> &lt;mailto:<a hre=
f=3D"mailto:laurent@vivier.eu" target=3D"_blank">laurent@vivier.eu</a>&gt;&=
gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Le 06/01/2022 =C3=A0 23:00, Patrick Venture a =C3=
=A9crit=C2=A0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; From: Shu-Chun Weng &lt;<a href=3D"mailto:scw=
@google.com" target=3D"_blank">scw@google.com</a> &lt;mailto:<a href=3D"mai=
lto:scw@google.com" target=3D"_blank">scw@google.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Linux kernel does it this way (checks read pe=
rmission before validating `how`)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; and the latest version of ABSL&#39;s `Address=
IsReadable()` depends on this<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; behavior.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; c.f.<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/torvalds/linux/blob/9=
539ba4308ad5bdca6cb41c7b73cbb9f796dcdd7/kernel/signal.c#L3147" rel=3D"noref=
errer" target=3D"_blank">https://github.com/torvalds/linux/blob/9539ba4308a=
d5bdca6cb41c7b73cbb9f796dcdd7/kernel/signal.c#L3147</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/torvalds/linux/bl=
ob/9539ba4308ad5bdca6cb41c7b73cbb9f796dcdd7/kernel/signal.c#L3147" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/torvalds/linux/blob/9539ba4=
308ad5bdca6cb41c7b73cbb9f796dcdd7/kernel/signal.c#L3147</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Reviewed-by: Patrick Venture &lt;<a href=3D"m=
ailto:venture@google.com" target=3D"_blank">venture@google.com</a> &lt;mail=
to:<a href=3D"mailto:venture@google.com" target=3D"_blank">venture@google.c=
om</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Shu-Chun Weng &lt;<a href=3D"m=
ailto:scw@google.com" target=3D"_blank">scw@google.com</a> &lt;mailto:<a hr=
ef=3D"mailto:scw@google.com" target=3D"_blank">scw@google.com</a>&gt;&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0linux-user/syscall.c | 10 +++++--=
---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A01 file changed, 5 insertions(+), =
5 deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/linux-user/syscall.c b/linux-use=
r/syscall.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index ce9d64896c..3070d31f34 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/linux-user/syscall.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/linux-user/syscall.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -9491,6 +9491,11 @@ static abi_long do_sys=
call1(void *cpu_env, int num, abi_long arg1,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (arg2) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if (!(p =3D lock_user(VERIFY_READ, arg2, sizeof(target_sigset=
_t), 1)))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_EFAULT;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 target_to_host_sigset(&amp;set, p);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 unlock_user(p, arg2, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 set_ptr =3D &amp;set;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0switch(how) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0case TARGET_SIG_BLOCK:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0how =3D SIG_BLOCK;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -9504,11 +9509,6 @@ static abi_long do_sys=
call1(void *cpu_env, int num, abi_long arg1,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -TARGET_EINVAL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if (!(p =3D lock_user(VERIFY_READ, arg2, sizeof(target_sigset=
_t), 1)))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_EFAULT;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 target_to_host_sigset(&amp;set, p);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 unlock_user(p, arg2, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 set_ptr =3D &amp;set;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0} else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0how =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0set_ptr =3D NULL;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I know it&#39;s only code move but generally we als=
o update the style to pass scripts/<a href=3D"http://checkpatch.pl" rel=3D"=
noreferrer" target=3D"_blank">checkpatch.pl</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://checkpatch.pl" rel=3D"norefer=
rer" target=3D"_blank">http://checkpatch.pl</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0successfully.<br>
&gt; <br>
&gt; <br>
&gt; That is a reasonable request, however, can I just send a follow-on pat=
ch?=C2=A0 I didn&#39;t write this one <br>
&gt; and I honestly don&#39;t know much about it, but I don&#39;t mind doin=
g the cleanup<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Could you also update TARGET_NR_sigprocmask in the =
same way as it seems the kernel behaves like<br>
&gt;=C2=A0 =C2=A0 =C2=A0this<br>
&gt;=C2=A0 =C2=A0 =C2=A0too in this case?<br>
&gt; <br>
&gt; <br>
&gt; I can take a look.=C2=A0 I would prefer then to also prefetch the styl=
e fixup in a preceding patch. I <br>
&gt; don&#39;t recall seeing whether qemu supports clang-format.<br>
&gt; <br>
<br>
There is no problem. You can keep this patch unmodified, and add patches to=
 fix the problems.<br>
<br>
I only ask to have all the patches in one series.<br></blockquote><div><br>=
</div><div>Will take a swing at this for v2.</div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
Laurent<br>
<br>
</blockquote></div></div>

--000000000000d9510c05d5568147--

