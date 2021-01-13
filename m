Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1152F4832
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 11:05:56 +0100 (CET)
Received: from localhost ([::1]:48282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzd2J-0005vt-DH
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 05:05:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kzcz8-0004Ld-2w; Wed, 13 Jan 2021 05:02:38 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:43297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kzcz1-0000km-TF; Wed, 13 Jan 2021 05:02:37 -0500
Received: by mail-lf1-x12f.google.com with SMTP id 23so1861359lfg.10;
 Wed, 13 Jan 2021 02:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=dRW3alDubTOLluPze7sM4Htc1i9CrixpggS+1jlP9bg=;
 b=LBPiMnNROsBfFbp+TUhqYR2j98OKCSuhTj1/E5P5IK3QK/ELE80MvUua44v7hXmuz6
 9bU2D7v3M9M5hnbiQ45dP4rmnrM+g33+E5Evk/H8X0SH7c44OKi+Bv+vWkifOksxgNLb
 XLtP2QSpnStQzutdKSx8W3c76vGpzKHqD953zTQ9PJ1Gcg4ATcm42IIbMelj2DTYJThB
 eV0QU/K0KWgCapmreksjJ52U6LWcASh+07NYpmLHwbgZFsJB0dBZ1Nc2BhVGXLFGXINB
 xzqCAythFem5/7wTWiixjQGK0CcGTtDOCe5hAEV4aVURxvMypchxuvU+Z6Hm67jEE0Yu
 Ovhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=dRW3alDubTOLluPze7sM4Htc1i9CrixpggS+1jlP9bg=;
 b=dGOyAoYBkrYZTZuee/Tg9NU3akCzTP8kloEJ22ljIvC5NhpDbELOPjPAUMBnvFjgnr
 gMQ5M61OF8IeuHbi8dmnaOMdx5klLKyP62tGWRkgxH0/EJGGZtzLWUb7vZ7B070w1hl+
 QiQuYNAHNBr03U6wOFEZtqWfHCDo6MD0AX8Bpb7qUBL4IRTgdrThzGYuZvjYaJXAn4L4
 FpbiAX0kh/xLeAgb3L1qkIoAD+f1QORtfR49PuLyIV5HvfxQsJ93DNRDRvmt30lVuDOJ
 olmH00f4HrtMjhFg3Z1kvwSNg67zb083VnGIr1Xny+p2ZbAeTiVHxUb8AdjfxvHeDKpd
 ZSdg==
X-Gm-Message-State: AOAM533dIW19Ix/XbcrPLf5vsxHeyVkZiKNOnkI66TLYbuUzxxa0upWG
 1Kl8De+ipoAziLAbJ426xzVILzVOdu4MVf5A71E=
X-Google-Smtp-Source: ABdhPJy+L5KKM41QMckORCML0yfIVfsvaBspoHo0JedIehuO1SpF4WyEZRG1kxaqOZzzdDQvfipXs845StywLamxd1A=
X-Received: by 2002:a19:2247:: with SMTP id i68mr501504lfi.613.1610532149001; 
 Wed, 13 Jan 2021 02:02:29 -0800 (PST)
MIME-Version: 1.0
References: <CAE2XoE84K6vdQ23upRa1MaCNWSycUGKja9DrTpVCQ4bdY7bZuQ@mail.gmail.com>
 <db5077c9-4b20-08f1-131e-0bbc7ae15313@kaod.org>
 <CAE2XoE-Fc3Tc51uiDN70_6suHPwczdp9EcS_LirLK-txzgS+yw@mail.gmail.com>
 <ef0eb70c-5b56-9850-2ad3-f12591cd6b4b@kaod.org>
 <CAE2XoE-VAMPYwNcGYK_3fqKgy138VOx6JaaSHD+bvz-fkH_jZA@mail.gmail.com>
 <96e02d87-3326-748d-9c97-de910b5b1533@kaod.org>
In-Reply-To: <96e02d87-3326-748d-9c97-de910b5b1533@kaod.org>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Wed, 13 Jan 2021 18:02:17 +0800
Message-ID: <CAE2XoE_NoUXH7i1LKV-kkSxakCYhTrkXT-x1ufqhjTJPU-KoOQ@mail.gmail.com>
Subject: Re: What's the correct way to implement rfi and related instruction.
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: multipart/alternative; boundary="000000000000a4041f05b8c53c59"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=luoyonggang@gmail.com; helo=mail-lf1-x12f.google.com
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

--000000000000a4041f05b8c53c59
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 1:23 AM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
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
>
> > +    msr &=3D ~(1ULL << MSR_ILE);
>
> that's curious. I am still trying to understand that part. May be this is
> due to the lack of HID2 modeling which contains a "True little-endian"
bit.
>
> Is your image Little endian ?

Hi, According to ` Table 2-4. MSR Bit Settings (continued) ` in
https://www.nxp.com/docs/en/reference-manual/e300coreRM.pdf
```
  Interrupt little-endian mode. When an interrupt occurs, this bit is
copied into MSR[LE] to select the endian mode for the context established
by the interrupt.
```
Does this means MSR[LE] =3D  MSR[LE]
>
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

--000000000000a4041f05b8c53c59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Tue, Jan 12, 2021 at 1:23 AM C=C3=A9dric Le Goa=
ter &lt;<a href=3D"mailto:clg@kaod.org" target=3D"_blank">clg@kaod.org</a>&=
gt; wrote:<br>&gt;<br>&gt; &gt; QEMU 5.2.x, an e300 based machine ppc603 ar=
e impacted.<br>&gt; &gt; Here is my fix, narrowed down to =C2=A0MSR_TGPR an=
d =C2=A0MSR_ILE<br>&gt; &gt; ```<br>&gt; &gt; From 42ce41671f1e6c4dd44e6fb4=
81bbda9df09320bd Mon Sep 17 00:00:00 2001<br>&gt; &gt; From: Yonggang Luo &=
lt;<a href=3D"mailto:luoyonggang@gmail.com" target=3D"_blank">luoyonggang@g=
mail.com</a> &lt;mailto:<a href=3D"mailto:luoyonggang@gmail.com" target=3D"=
_blank">luoyonggang@gmail.com</a>&gt;&gt;<br>&gt; &gt; Date: Sun, 10 Jan 20=
21 00:08:00 -0800<br>&gt; &gt; Subject: [PATCH] ppc: Fix rfi/rfid/hrfi/... =
emulation again<br>&gt; &gt;<br>&gt; &gt; This revert part mask bits for pp=
c603/ppc4x that disabled in =C2=A0a2e71b28e832346409efc795ecd1f0a2bcb705a3.=
<br>&gt; &gt; Remove redundant macro MSR_BOOK3S_MASK.<br>&gt; &gt; Fixes bo=
ot VxWorks on e300<br>&gt; &gt;<br>&gt; &gt; Signed-off-by: Yonggang Luo &l=
t;<a href=3D"mailto:luoyonggang@gmail.com" target=3D"_blank">luoyonggang@gm=
ail.com</a> &lt;mailto:<a href=3D"mailto:luoyonggang@gmail.com" target=3D"_=
blank">luoyonggang@gmail.com</a>&gt;&gt;<br>&gt; &gt; ---<br>&gt; &gt; =C2=
=A0target/ppc/excp_helper.c | 5 +++--<br>&gt; &gt; =C2=A01 file changed, 3 =
insertions(+), 2 deletions(-)<br>&gt; &gt;<br>&gt; &gt; diff --git a/target=
/ppc/excp_helper.c b/target/ppc/excp_helper.c<br>&gt; &gt; index 1c48b9fdf6=
..df70c5a4e8 100644<br>&gt; &gt; --- a/target/ppc/excp_helper.c<br>&gt; &gt=
; +++ b/target/ppc/excp_helper.c<br>&gt; &gt; @@ -1156,8 +1156,10 @@ static=
 inline void do_rfi(CPUPPCState *env, target_ulong nip, target_ulong msr)<b=
r>&gt; &gt; =C2=A0{<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_c=
pu(env);<br>&gt; &gt; =C2=A0<br>&gt; &gt; - =C2=A0 =C2=A0/* MSR:POW cannot =
be set by any form of rfi */<br>&gt; &gt; + =C2=A0 =C2=A0/* MSR:POW,TGPR,IL=
E cannot be set by any form of rfi */<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0msr =
&amp;=3D ~(1ULL &lt;&lt; MSR_POW);<br>&gt; &gt; + =C2=A0 =C2=A0msr &amp;=3D=
 ~(1ULL &lt;&lt; MSR_TGPR);<br>&gt;<br>&gt; Indeed. The e300 user manual sa=
ys that TGPR is cleared by rfi. We should<br>&gt; add a per-cpu family mask=
 and not a global setting.<br>&gt;<br>&gt; &gt; + =C2=A0 =C2=A0msr &amp;=3D=
 ~(1ULL &lt;&lt; MSR_ILE);<br>&gt;<br>&gt; that&#39;s curious. I am still t=
rying to understand that part. May be this is<br>&gt; due to the lack of HI=
D2 modeling which contains a &quot;True little-endian&quot; bit.<br>&gt;<br=
>&gt; Is your image Little endian ?<div><br><div>Hi, According to `

Table 2-4. MSR Bit Settings (continued)


` in=C2=A0<a href=3D"https://www.nxp.com/docs/en/reference-manual/e300coreR=
M.pdf" target=3D"_blank">https://www.nxp.com/docs/en/reference-manual/e300c=
oreRM.pdf</a></div><div>```<br>=C2=A0 Interrupt little-endian mode. When an=
 interrupt occurs, this bit is copied into MSR[LE] to select the endian
mode for the context established by the interrupt.=C2=A0=C2=A0<br></div><di=
v>```</div><div>Does this means MSR[LE] =3D=C2=A0

MSR[LE]

</div><div>&gt;<br>&gt; C.<br>&gt;<br>&gt; &gt; =C2=A0<br>&gt; &gt; =C2=A0#=
if defined(TARGET_PPC64)<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0/* Switching to 3=
2-bit ? Crop the nip */<br>&gt; &gt; @@ -1190,7 +1192,6 @@ void helper_rfi(=
CPUPPCState *env)<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0do_rfi(env, env-&gt;spr[=
SPR_SRR0], env-&gt;spr[SPR_SRR1] &amp; 0xfffffffful);<br>&gt; &gt; =C2=A0}<=
br>&gt; &gt; =C2=A0<br>&gt; &gt; -#define MSR_BOOK3S_MASK<br>&gt; &gt; =C2=
=A0#if defined(TARGET_PPC64)<br>&gt; &gt; =C2=A0void helper_rfid(CPUPPCStat=
e *env)<br>&gt; &gt; =C2=A0{<br>&gt; &gt; --<br>&gt; &gt; 2.29.2.windows.3<=
br>&gt; &gt;<br>&gt; &gt; ```<br>&gt; &gt;<br>&gt; &gt; --<br>&gt; &gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>&gt; &gt; =E7=A4=BC<br=
>&gt; &gt; =E7=BD=97=E5=8B=87=E5=88=9A<br>&gt; &gt; Yours<br>&gt; &gt; =C2=
=A0 =C2=A0 sincerely,<br>&gt; &gt; Yonggang Luo<br>&gt;<br><br><br>--<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=
=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo<=
/div></div></div>

--000000000000a4041f05b8c53c59--

