Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A602F3239
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 14:53:16 +0100 (CET)
Received: from localhost ([::1]:49108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzK6l-0008GK-I1
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 08:53:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kzK5p-0007kG-Ra; Tue, 12 Jan 2021 08:52:17 -0500
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:37628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kzK5n-000853-5K; Tue, 12 Jan 2021 08:52:17 -0500
Received: by mail-lf1-x12a.google.com with SMTP id o17so3478363lfg.4;
 Tue, 12 Jan 2021 05:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=RXGaqJ5HxsBNBQnnVGMrerbDK5x5fC9jjnHLVvGL5Nw=;
 b=CplZfarTQqc4JkqVjP3180Bfkwq11KkGjXCjk40eHo5a9AxCjCNfaHftwDvA7F/2be
 qdagaHpJ47mFSbq5hIhjhGRPrFUGiRTSw2lo5t8K6fkKUfL3Uvw/wZTgvuOfK4Nwquks
 VMruSuB3x6zTK0tXZFaMGjLr3lenveCN1WGLRp+WaqOTihCKGIlMC5PYvba+pAmaD+/9
 V5fAx1JChTUNv5lakRevpzcLUmFtjUPsM/UNTMBLdT+8n9Gd+2Rge32V9p6WPuTWOyjv
 Xtd/JgxJvUpUG0SP1tE0vYVrT8JeTczWBdOx61P+2BtkqjK1vNG4Zj791onsx3rhcxbA
 HNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=RXGaqJ5HxsBNBQnnVGMrerbDK5x5fC9jjnHLVvGL5Nw=;
 b=izzorSRq2ZXK494P46T9yiE4fdlU7hPxOlMCGBZHR//+IDmVphT4yId9Ym+ucpy5ZW
 R0S01+IA1T0EbUZK4JwcLUOklWxtIQaWvZGbkw+WJfIAvXky1wgWiwuAC4uAegKbCaZe
 FPTmnvXonOlnynmiQeyCCz3j7CO8GU6K6mElolHosObGrP/P09tXc/c2Uk4VMnB9qwi6
 KixX7mm/OM7HRoEIThMrVXpWfnXGUI4lSMZ1y9U2lPdYUEDx+IGpj3NArJQ7kog7ibjH
 tIY6SxmlCPkgX/lOH9hB3lO5TmS2OPWtyniENAVTd4+8a68USO6IT7FMIs7C9Io6cWQX
 uNNA==
X-Gm-Message-State: AOAM53128QDC22bHGK/CNxDlazIMytxlZwQX1Aig4UO9caPiUTW61SVA
 NZ0fDh0UX0nsFSGuwUJk+eFSzszowhYFq92FZKA=
X-Google-Smtp-Source: ABdhPJyqYQ4wBbeR+eajy8IDEnUbx2i5DVPfg5DgxK4d5jNj/SUNtfIkwFHO+cy563X2lldq1a/WI8sDpbfFllJ55nM=
X-Received: by 2002:a19:ad4b:: with SMTP id s11mr2293512lfd.427.1610459533025; 
 Tue, 12 Jan 2021 05:52:13 -0800 (PST)
MIME-Version: 1.0
References: <CAE2XoE84K6vdQ23upRa1MaCNWSycUGKja9DrTpVCQ4bdY7bZuQ@mail.gmail.com>
 <db5077c9-4b20-08f1-131e-0bbc7ae15313@kaod.org>
 <CAE2XoE-Fc3Tc51uiDN70_6suHPwczdp9EcS_LirLK-txzgS+yw@mail.gmail.com>
 <ef0eb70c-5b56-9850-2ad3-f12591cd6b4b@kaod.org>
 <CAE2XoE-VAMPYwNcGYK_3fqKgy138VOx6JaaSHD+bvz-fkH_jZA@mail.gmail.com>
 <96e02d87-3326-748d-9c97-de910b5b1533@kaod.org>
In-Reply-To: <96e02d87-3326-748d-9c97-de910b5b1533@kaod.org>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Tue, 12 Jan 2021 21:52:02 +0800
Message-ID: <CAE2XoE-QDj2=o-WZBFh8R2cDxqRLGvDVC6kt0q0xap_R7pB0Rg@mail.gmail.com>
Subject: Re: What's the correct way to implement rfi and related instruction.
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: multipart/alternative; boundary="00000000000064267b05b8b45489"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=luoyonggang@gmail.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: luoyonggang@gmail.com
Cc: qemu-level <qemu-devel@nongnu.org>, qemu-ppc@nongnu.org,
 Thomas Monjalon <thomas@monjalon.net>, Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000064267b05b8b45489
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 5:23 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> > QEMU 5.2.x, an e300 based machine ppc603 are impacted.
> > Here is my fix, narrowed down to  MSR_TGPR and  MSR_ILE
> > ```
> > From 42ce41671f1e6c4dd44e6fb481bbda9df09320bd Mon Sep 17 00:00:00 2001
> > From: Yonggang Luo <luoyonggang@gmail.com <mailto:luoyonggang@gmail.com
>>
> > Date: Sun, 10 Jan 2021 00:08:00 -0800
> > Subject: [PATCH] ppc: Fix rfi/rfid/hrfi/... emulation again
> >
> > This revert part mask bits for ppc603/ppc4x that disabled in
 a2e71b28e832346409efc795ecd1f0a2bcb705a3.
> > Remove redundant macro MSR_BOOK3S_MASK.
> > Fixes boot VxWorks on e300
> >
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com <mailto:
luoyonggang@gmail.com>>
> > ---
> >  target/ppc/excp_helper.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> > index 1c48b9fdf6..df70c5a4e8 100644
> > --- a/target/ppc/excp_helper.c
> > +++ b/target/ppc/excp_helper.c
> > @@ -1156,8 +1156,10 @@ static inline void do_rfi(CPUPPCState *env,
target_ulong nip, target_ulong msr)
> >  {
> >      CPUState *cs =3D env_cpu(env);
> >
> > -    /* MSR:POW cannot be set by any form of rfi */
> > +    /* MSR:POW,TGPR,ILE cannot be set by any form of rfi */
> >      msr &=3D ~(1ULL << MSR_POW);
> > +    msr &=3D ~(1ULL << MSR_TGPR);
>
> Indeed. The e300 user manual says that TGPR is cleared by rfi. We should
> add a per-cpu family mask and not a global setting.
Refer to https://www.nxp.com/docs/en/reference-manual/e300coreRM.pdf

`Table 2-4. MSR Bit Settings`

```
  Temporary GPR remapping (implementation-specific) 0 Normal operation 1
TGPR mode. GPR0=E2=80=93GPR3 are remapped to TGPR0=E2=80=93TGPR3 for use by=
 TLB miss
routines. The contents of GPR0=E2=80=93GPR3 remain unchanged while MSR[TGPR=
] =3D 1.
Attempts to use GPR4=E2=80=93GPR31 with MSR[TGPR] =3D 1 yield undefined res=
ults.
Temporarily replaces TGPR0=E2=80=93TGPR3 with GPR0=E2=80=93GPR3 for use by =
TLB miss
routines. The TGPR bit is set when either an instruction TLB miss, data
read miss, or data write miss interrupt is taken. The TGPR bit is cleared
by an rfi instruction.
```

>
> > +    msr &=3D ~(1ULL << MSR_ILE);
>
> that's curious. I am still trying to understand that part. May be this is
> due to the lack of HID2 modeling which contains a "True little-endian"
bit.

Don't understand this part, I am running VxWorks 6.9 on MPC8349EA
https://www.nxp.com/docs/en/reference-manual/MPC8349EARM.pdf

Didn't got any idea about why  MSR_ILE are set

>
> Is your image Little endian ?
>
Big Endian vxworks image.

> C.
>
> >
> >  #if defined(TARGET_PPC64)
> >      /* Switching to 32-bit ? Crop the nip */
> > @@ -1190,7 +1192,6 @@ void helper_rfi(CPUPPCState *env)
> >      do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1] & 0xfffffffful)=
;
> >  }
> >
> > -#define MSR_BOOK3S_MASK
> >  #if defined(TARGET_PPC64)
> >  void helper_rfid(CPUPPCState *env)
> >  {
> > --
> > 2.29.2.windows.3
> >
> > ```
> >
> > --
> >          =E6=AD=A4=E8=87=B4
> > =E7=A4=BC
> > =E7=BD=97=E5=8B=87=E5=88=9A
> > Yours
> >     sincerely,
> > Yonggang Luo
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--00000000000064267b05b8b45489
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Tue, Jan 12, 2021 at 5:23 PM C=C3=A9dric Le Goa=
ter &lt;<a href=3D"mailto:clg@kaod.org">clg@kaod.org</a>&gt; wrote:<br>&gt;=
<br>&gt; &gt; QEMU 5.2.x, an e300 based machine ppc603 are impacted.<br>&gt=
; &gt; Here is my fix, narrowed down to =C2=A0MSR_TGPR and =C2=A0MSR_ILE<br=
>&gt; &gt; ```<br>&gt; &gt; From 42ce41671f1e6c4dd44e6fb481bbda9df09320bd M=
on Sep 17 00:00:00 2001<br>&gt; &gt; From: Yonggang Luo &lt;<a href=3D"mail=
to:luoyonggang@gmail.com">luoyonggang@gmail.com</a> &lt;mailto:<a href=3D"m=
ailto:luoyonggang@gmail.com">luoyonggang@gmail.com</a>&gt;&gt;<br>&gt; &gt;=
 Date: Sun, 10 Jan 2021 00:08:00 -0800<br>&gt; &gt; Subject: [PATCH] ppc: F=
ix rfi/rfid/hrfi/... emulation again<br>&gt; &gt;<br>&gt; &gt; This revert =
part mask bits for ppc603/ppc4x that disabled in =C2=A0a2e71b28e832346409ef=
c795ecd1f0a2bcb705a3.<br>&gt; &gt; Remove redundant macro MSR_BOOK3S_MASK.<=
br>&gt; &gt; Fixes boot VxWorks on e300<br>&gt; &gt;<br>&gt; &gt; Signed-of=
f-by: Yonggang Luo &lt;<a href=3D"mailto:luoyonggang@gmail.com">luoyonggang=
@gmail.com</a> &lt;mailto:<a href=3D"mailto:luoyonggang@gmail.com">luoyongg=
ang@gmail.com</a>&gt;&gt;<br>&gt; &gt; ---<br>&gt; &gt; =C2=A0target/ppc/ex=
cp_helper.c | 5 +++--<br>&gt; &gt; =C2=A01 file changed, 3 insertions(+), 2=
 deletions(-)<br>&gt; &gt;<br>&gt; &gt; diff --git a/target/ppc/excp_helper=
.c b/target/ppc/excp_helper.c<br>&gt; &gt; index 1c48b9fdf6..df70c5a4e8 100=
644<br>&gt; &gt; --- a/target/ppc/excp_helper.c<br>&gt; &gt; +++ b/target/p=
pc/excp_helper.c<br>&gt; &gt; @@ -1156,8 +1156,10 @@ static inline void do_=
rfi(CPUPPCState *env, target_ulong nip, target_ulong msr)<br>&gt; &gt; =C2=
=A0{<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_cpu(env);<br>&gt=
; &gt; =C2=A0<br>&gt; &gt; - =C2=A0 =C2=A0/* MSR:POW cannot be set by any f=
orm of rfi */<br>&gt; &gt; + =C2=A0 =C2=A0/* MSR:POW,TGPR,ILE cannot be set=
 by any form of rfi */<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0msr &amp;=3D ~(1ULL=
 &lt;&lt; MSR_POW);<br>&gt; &gt; + =C2=A0 =C2=A0msr &amp;=3D ~(1ULL &lt;&lt=
; MSR_TGPR);<br>&gt;<br>&gt; Indeed. The e300 user manual says that TGPR is=
 cleared by rfi. We should<br>&gt; add a per-cpu family mask and not a glob=
al setting.<div>Refer to=C2=A0<a href=3D"https://www.nxp.com/docs/en/refere=
nce-manual/e300coreRM.pdf">https://www.nxp.com/docs/en/reference-manual/e30=
0coreRM.pdf</a></div><div><br></div><div>`Table 2-4. MSR Bit Settings`</div=
><div><br></div><div>```</div><div>=C2=A0 Temporary GPR remapping (implemen=
tation-specific)
0 Normal operation
1 TGPR mode. GPR0=E2=80=93GPR3 are remapped to TGPR0=E2=80=93TGPR3 for use =
by TLB miss routines.
The contents of GPR0=E2=80=93GPR3 remain unchanged while MSR[TGPR] =3D 1. A=
ttempts to use GPR4=E2=80=93GPR31 with
MSR[TGPR] =3D 1 yield undefined results. Temporarily replaces TGPR0=E2=80=
=93TGPR3 with GPR0=E2=80=93GPR3 for use by
TLB miss routines. The TGPR bit is set when either an instruction TLB miss,=
 data read miss, or data write miss
interrupt is taken. The TGPR bit is cleared by an rfi instruction.=C2=A0=C2=
=A0<br></div><div>```</div><div>=C2=A0=C2=A0<br>&gt;<br>&gt; &gt; + =C2=A0 =
=C2=A0msr &amp;=3D ~(1ULL &lt;&lt; MSR_ILE);<br>&gt;<br>&gt; that&#39;s cur=
ious. I am still trying to understand that part. May be this is<br>&gt; due=
 to the lack of HID2 modeling which contains a &quot;True little-endian&quo=
t; bit.</div><div><br></div><div>Don&#39;t understand this part, I am runni=
ng VxWorks 6.9 on=20

MPC8349EA

</div><div><a href=3D"https://www.nxp.com/docs/en/reference-manual/MPC8349E=
ARM.pdf">https://www.nxp.com/docs/en/reference-manual/MPC8349EARM.pdf</a><b=
r></div><div><br></div><div>Didn&#39;t got any idea about why=C2=A0

MSR_ILE are set</div><div><br>&gt;<br>&gt; Is your image Little endian ?<br=
>&gt;</div><div>Big Endian vxworks image.</div><div><br>&gt; C.<br>&gt;<br>=
&gt; &gt; =C2=A0<br>&gt; &gt; =C2=A0#if defined(TARGET_PPC64)<br>&gt; &gt; =
=C2=A0 =C2=A0 =C2=A0/* Switching to 32-bit ? Crop the nip */<br>&gt; &gt; @=
@ -1190,7 +1192,6 @@ void helper_rfi(CPUPPCState *env)<br>&gt; &gt; =C2=A0 =
=C2=A0 =C2=A0do_rfi(env, env-&gt;spr[SPR_SRR0], env-&gt;spr[SPR_SRR1] &amp;=
 0xfffffffful);<br>&gt; &gt; =C2=A0}<br>&gt; &gt; =C2=A0<br>&gt; &gt; -#def=
ine MSR_BOOK3S_MASK<br>&gt; &gt; =C2=A0#if defined(TARGET_PPC64)<br>&gt; &g=
t; =C2=A0void helper_rfid(CPUPPCState *env)<br>&gt; &gt; =C2=A0{<br>&gt; &g=
t; --<br>&gt; &gt; 2.29.2.windows.3<br>&gt; &gt;<br>&gt; &gt; ```<br>&gt; &=
gt;<br>&gt; &gt; --<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=
=A4=E8=87=B4<br>&gt; &gt; =E7=A4=BC<br>&gt; &gt; =E7=BD=97=E5=8B=87=E5=88=
=9A<br>&gt; &gt; Yours<br>&gt; &gt; =C2=A0 =C2=A0 sincerely,<br>&gt; &gt; Y=
onggang Luo<br>&gt;<br><br><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=
=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=
=A0 =C2=A0 sincerely,<br>Yonggang Luo</div></div>

--00000000000064267b05b8b45489--

