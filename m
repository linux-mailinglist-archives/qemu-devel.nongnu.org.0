Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B0249D43F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 22:12:20 +0100 (CET)
Received: from localhost ([::1]:54956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCpaV-0006XB-5B
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 16:12:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nCpYg-0004vB-EO
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:10:26 -0500
Received: from [2607:f8b0:4864:20::92e] (port=42655
 helo=mail-ua1-x92e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nCpYa-0005kJ-07
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:10:25 -0500
Received: by mail-ua1-x92e.google.com with SMTP id e17so1059784uad.9
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 13:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gTPveKZ7BN2W/8w0/EyC6fBGWZ/DnQiSvcpaoHIvd0I=;
 b=SHfGOqyajg510XUt7dwB7D2LpTza6Qk6OWlt/wnYlCV4KpOiATYaYZ7/o/QmplM9Ey
 TmjLKGI3+FCOuRejO3S0EqdYehzUR00Rh+5YrV7Jx/4hkbLf1cp6JGNHugFdlzq2HaY5
 rbpf7a46DoyCJ1k3Wd82dAyZ5bQ2NlNZccQ7PrPUA78v5YgImXrmpNYhBch3copKl9Hq
 m2lPl5p1tQzOuwCl0+eEpQ0wnj5rYjLapn0H/jcVxgR9XrpmaMemOjg0UfQAwD+377ix
 Z31lQGlCOlTYfSJsgdnyZq17aTkdzOQjo8L/JC4tDNBUjXkHtjuqy8RAg78d9H1Q40T+
 c9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gTPveKZ7BN2W/8w0/EyC6fBGWZ/DnQiSvcpaoHIvd0I=;
 b=t7vyIZVGFtLfEIiMnC9NPeVCZ00vul2qT7ug3OpiP2jpuflHrl7UZ4QloOvbuH2cGJ
 oDuqLsi/vLClsy3MxalX+8TSFMEPXbaWnLfdQgGK/omY+y8UkSOXOXcKSWC6XEFMUrFo
 ESmF2lD5djr8SNU7bhgIYBLL1Ood5ZAwbC3qS4C5hQYGIoYO7/MTrW+cNaScwdFnwrBs
 hi/TFlOvK5ECm4NT91y1mPLRyZOooulnkhj5f+R00ZVoLQkDmSl03OnPC6RjpmTbeKrZ
 7ltus3gBkI5rDTGzTAB/Ygxx8ePKpPUdODVy6j9oO4zBrPpests4TeTyL5z50nX7nkL7
 rXfA==
X-Gm-Message-State: AOAM532077Tb2Cpq1KjPH4GpBon7tfjYZaaukTzUSzHN1QYX4km46aJH
 +1BNwABDsR7qwnSEeXiM+3CHJXxNR3g5QmIIUOFocg==
X-Google-Smtp-Source: ABdhPJzQiSeII8RnjA82XqI9rDlN6cMlwLJnMEept6T/aVv292hXgaBOtxfrqd4hYXRYflRxojk7nlfzMDGG2ElYQbg=
X-Received: by 2002:ab0:7c69:: with SMTP id h9mr426357uax.127.1643231415765;
 Wed, 26 Jan 2022 13:10:15 -0800 (PST)
MIME-Version: 1.0
References: <20220126175850.1904968-1-venture@google.com>
 <20220126175850.1904968-2-venture@google.com>
 <48f25af9-fc8f-aab3-bf34-f2d1ed013390@vivier.eu>
In-Reply-To: <48f25af9-fc8f-aab3-bf34-f2d1ed013390@vivier.eu>
From: Patrick Venture <venture@google.com>
Date: Wed, 26 Jan 2022 13:10:04 -0800
Message-ID: <CAO=notwkMt9HbsVg5Yc_JzENwpkuWTL52-g5zpj60J9ic3NQHQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] linux-user: rt_sigprocmask, check read perms first
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Shu-Chun Weng <scw@google.com>
Content-Type: multipart/alternative; boundary="000000000000d296f805d682a0c7"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=venture@google.com; helo=mail-ua1-x92e.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
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

--000000000000d296f805d682a0c7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 26, 2022 at 11:26 AM Laurent Vivier <laurent@vivier.eu> wrote:

> Le 26/01/2022 =C3=A0 18:58, Patrick Venture a =C3=A9crit :
> > From: Shu-Chun Weng <scw@google.com>
> >
> > Linux kernel does it this way (checks read permission before validating
> `how`)
> > and the latest version of ABSL's `AddressIsReadable()` depends on this
> > behavior.
> >
> > c.f.
> https://github.com/torvalds/linux/blob/9539ba4308ad5bdca6cb41c7b73cbb9f79=
6dcdd7/kernel/signal.c#L3147
> > Reviewed-by: Patrick Venture <venture@google.com>
> > Signed-off-by: Shu-Chun Weng <scw@google.com>
>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>
> but you must resend the patch: you are not the author, but you have to ad=
d
> your Signed-off-by.
> (and now you can add my reviewed-by)
>
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/SubmittingPatches?id=3Df6f94e2ab1b33f0082ac22d71f66385a60d8157=
f#n296


Thanks! I definitely forgot to sign the patches I wasn't the author -- but
you're right and thanks for pointing me to the guide.


>
>
> Thanks,
> Laurent
>
> > ---
> >   linux-user/syscall.c | 12 +++++++-----
> >   1 file changed, 7 insertions(+), 5 deletions(-)
> >
> > diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> > index 5950222a77..34bd819e38 100644
> > --- a/linux-user/syscall.c
> > +++ b/linux-user/syscall.c
> > @@ -9508,6 +9508,13 @@ static abi_long do_syscall1(void *cpu_env, int
> num, abi_long arg1,
> >               }
> >
> >               if (arg2) {
> > +                p =3D lock_user(VERIFY_READ, arg2,
> sizeof(target_sigset_t), 1);
> > +                if (!p) {
> > +                    return -TARGET_EFAULT;
> > +                }
> > +                target_to_host_sigset(&set, p);
> > +                unlock_user(p, arg2, 0);
> > +                set_ptr =3D &set;
> >                   switch(how) {
> >                   case TARGET_SIG_BLOCK:
> >                       how =3D SIG_BLOCK;
> > @@ -9521,11 +9528,6 @@ static abi_long do_syscall1(void *cpu_env, int
> num, abi_long arg1,
> >                   default:
> >                       return -TARGET_EINVAL;
> >                   }
> > -                if (!(p =3D lock_user(VERIFY_READ, arg2,
> sizeof(target_sigset_t), 1)))
> > -                    return -TARGET_EFAULT;
> > -                target_to_host_sigset(&set, p);
> > -                unlock_user(p, arg2, 0);
> > -                set_ptr =3D &set;
> >               } else {
> >                   how =3D 0;
> >                   set_ptr =3D NULL;
>
>

--000000000000d296f805d682a0c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 26, 2022 at 11:26 AM Laur=
ent Vivier &lt;<a href=3D"mailto:laurent@vivier.eu">laurent@vivier.eu</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Le 26/=
01/2022 =C3=A0 18:58, Patrick Venture a =C3=A9crit=C2=A0:<br>
&gt; From: Shu-Chun Weng &lt;<a href=3D"mailto:scw@google.com" target=3D"_b=
lank">scw@google.com</a>&gt;<br>
&gt; <br>
&gt; Linux kernel does it this way (checks read permission before validatin=
g `how`)<br>
&gt; and the latest version of ABSL&#39;s `AddressIsReadable()` depends on =
this<br>
&gt; behavior.<br>
&gt; <br>
&gt; c.f.=C2=A0 <a href=3D"https://github.com/torvalds/linux/blob/9539ba430=
8ad5bdca6cb41c7b73cbb9f796dcdd7/kernel/signal.c#L3147" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/torvalds/linux/blob/9539ba4308ad5bdca6c=
b41c7b73cbb9f796dcdd7/kernel/signal.c#L3147</a><br>
&gt; Reviewed-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.com"=
 target=3D"_blank">venture@google.com</a>&gt;<br>
&gt; Signed-off-by: Shu-Chun Weng &lt;<a href=3D"mailto:scw@google.com" tar=
get=3D"_blank">scw@google.com</a>&gt;<br>
<br>
Reviewed-by: Laurent Vivier &lt;<a href=3D"mailto:laurent@vivier.eu" target=
=3D"_blank">laurent@vivier.eu</a>&gt;<br>
<br>
but you must resend the patch: you are not the author, but you have to add =
your Signed-off-by.<br>
(and now you can add my reviewed-by)<br>
<br>
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/tree/Documentation/SubmittingPatches?id=3Df6f94e2ab1b33f0082ac22d71f6638=
5a60d8157f#n296" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.or=
g/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/Submitting=
Patches?id=3Df6f94e2ab1b33f0082ac22d71f66385a60d8157f#n296</a></blockquote>=
<div><br></div><div>Thanks! I definitely forgot to sign the patches I wasn&=
#39;t the author -- but you&#39;re right and thanks for pointing me to the =
guide.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><br>
<br>
Thanks,<br>
Laurent<br>
<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0linux-user/syscall.c | 12 +++++++-----<br>
&gt;=C2=A0 =C2=A01 file changed, 7 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; diff --git a/linux-user/syscall.c b/linux-user/syscall.c<br>
&gt; index 5950222a77..34bd819e38 100644<br>
&gt; --- a/linux-user/syscall.c<br>
&gt; +++ b/linux-user/syscall.c<br>
&gt; @@ -9508,6 +9508,13 @@ static abi_long do_syscall1(void *cpu_env, int =
num, abi_long arg1,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (arg2) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D lock_us=
er(VERIFY_READ, arg2, sizeof(target_sigset_t), 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!p) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 return -TARGET_EFAULT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_to_hos=
t_sigset(&amp;set, p);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unlock_user(p=
, arg2, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_ptr =3D &=
amp;set;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sw=
itch(how) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ca=
se TARGET_SIG_BLOCK:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0how =3D SIG_BLOCK;<br>
&gt; @@ -9521,11 +9528,6 @@ static abi_long do_syscall1(void *cpu_env, int =
num, abi_long arg1,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0de=
fault:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return -TARGET_EINVAL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(p =3D l=
ock_user(VERIFY_READ, arg2, sizeof(target_sigset_t), 1)))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 return -TARGET_EFAULT;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_to_hos=
t_sigset(&amp;set, p);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unlock_user(p=
, arg2, 0);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_ptr =3D &=
amp;set;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ho=
w =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0se=
t_ptr =3D NULL;<br>
<br>
</blockquote></div></div>

--000000000000d296f805d682a0c7--

