Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1311C2EEC77
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 05:23:16 +0100 (CET)
Received: from localhost ([::1]:44140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxjIw-00006C-KC
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 23:23:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxjHK-00081Q-9n; Thu, 07 Jan 2021 23:21:34 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:43168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxjHG-0001NK-Py; Thu, 07 Jan 2021 23:21:34 -0500
Received: by mail-lf1-x12f.google.com with SMTP id 23so19875434lfg.10;
 Thu, 07 Jan 2021 20:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=6oAUAyrsBRX7gdKV92FLjycAneHVrNrOvjcYfmSPbFU=;
 b=L1JkTmlqyODRwjaPzM+gqJJZ79O0V5KLF3GStShPhdCXCzEsJ5bYgUGf+NMGA6Xomt
 gB92DPx4nolT8mnxDSP9iDELZohyZAI8TO+NNOpf6z2ijzaGXMdXtJYeCUj0A+t91Asb
 0NJb3Z+mTk/cE5zbnPhqepFDxqgJPU9e6WwCjXnTfvyqPZRKZ+VNOJ2DIojhzkPA7UmE
 VEpZ79vdPcnsv35cNhiLA98BocE+aqj/BijC+14div6aNW5qNSzg4ckGg0cEpXJRfYgX
 T6TXpldyWTnHwmyXDK3BE/DBxaEk631jqKH3qXHRz0WMY5OxgyugLhPNp7siztNjLYjZ
 yOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=6oAUAyrsBRX7gdKV92FLjycAneHVrNrOvjcYfmSPbFU=;
 b=oXa1o7M0eJXLpncbtMahQbw1bITxs3WgtO7/Sz4z/7/dJbtt/RjoHipA6oomh9PHov
 UKyglDebnVb+apyMwDP3iFIJEw17RQumsRpETimRQOW8iiwCYN64ND4NVrtVcGNJz9Bb
 F53tQCepIWIYXeB0xraWf8rHJ28Ur04M5mHpEbbSokY/BqmR9oczgIAoItyeUaS4pnHF
 TMu63ZPDm8CPk6VGQb8G/j1fkISNgTzdsyp+9zKKih9ESsZTUFz4JbvHvehP4KuxhfZy
 BRC2D5gCal8L9y0vubBDoRBidbxE0ohksENwXt8MqlgNHziz5fLMeK71AQfI5r5jvzk9
 M2ow==
X-Gm-Message-State: AOAM532Bfh6xHokH3koLLCu+7bviVCteILG+jwQ4k3HIfVyNFeJIM0OR
 SobBuGaxjx3dFPOtAOSKHpcxNeJysOXzNW8ceuI=
X-Google-Smtp-Source: ABdhPJwbXURiX0LL4P1ij0pA40zXSeCjLMABXtrdIVVBTjpEzvg9xBHIWCQQCJhBY9yJJoPLvkZIfHEQ1epkyJjCQPo=
X-Received: by 2002:a19:ecb:: with SMTP id 194mr827307lfo.70.1610079687902;
 Thu, 07 Jan 2021 20:21:27 -0800 (PST)
MIME-Version: 1.0
References: <CAE2XoE84K6vdQ23upRa1MaCNWSycUGKja9DrTpVCQ4bdY7bZuQ@mail.gmail.com>
 <db5077c9-4b20-08f1-131e-0bbc7ae15313@kaod.org>
In-Reply-To: <db5077c9-4b20-08f1-131e-0bbc7ae15313@kaod.org>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Fri, 8 Jan 2021 12:21:17 +0800
Message-ID: <CAE2XoE-Fc3Tc51uiDN70_6suHPwczdp9EcS_LirLK-txzgS+yw@mail.gmail.com>
Subject: Re: What's the correct way to implement rfi and related instruction.
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: multipart/alternative; boundary="000000000000db89c905b85be38d"
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
Cc: Thomas Monjalon <thomas@monjalon.net>, qemu-ppc@nongnu.org,
 qemu-level <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000db89c905b85be38d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 8, 2021 at 5:54 AM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 1/7/21 8:14 PM, =E7=BD=97=E5=8B=87=E5=88=9A(Yonggang Luo) wrote:
> > This is the first patch,:
> > It's store MSR bits differntly for different rfi instructions:
> > [Qemu-devel] [PATCH] target-ppc: fix RFI by clearing some bits of MSR
> > https://lists.gnu.org/archive/html/qemu-devel/2010-05/msg02999.html <
https://lists.gnu.org/archive/html/qemu-devel/2010-05/msg02999.html>
> > Comes from  target-ppc: fix RFI by clearing some bits of MSR
> > SHA-1: c3d420ead1aee9fcfd12be11cbdf6b1620134773
> >  target-ppc/op_helper.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > ```
> > diff --git a/target-ppc/op_helper.c b/target-ppc/op_helper.c
> > index 8f2ee986bb..3c3aa60bc3 100644
> > --- a/target-ppc/op_helper.c
> > +++ b/target-ppc/op_helper.c
> > @@ -1646,20 +1646,20 @@ static inline void do_rfi(target_ulong nip,
target_ulong msr,
> >  void helper_rfi (void)
> >  {
> >      do_rfi(env->spr[SPR_SRR0], env->spr[SPR_SRR1],
> > -           ~((target_ulong)0x0), 1);
> > +           ~((target_ulong)0x783F0000), 1);
> >  }
> >
> >  #if defined(TARGET_PPC64)
> >  void helper_rfid (void)
> >  {
> >      do_rfi(env->spr[SPR_SRR0], env->spr[SPR_SRR1],
> > -           ~((target_ulong)0x0), 0);
> > +           ~((target_ulong)0x783F0000), 0);
> >  }
> >
> >  void helper_hrfid (void)
> >  {
> >      do_rfi(env->spr[SPR_HSRR0], env->spr[SPR_HSRR1],
> > -           ~((target_ulong)0x0), 0);
> > +           ~((target_ulong)0x783F0000), 0);
> >  }
> >  #endif
> >  #endif
> > ```
> >
> > This is the second patch,:
> > it's remove the parameter  `target_ulong msrm, int keep_msrh`
> > Comes from ppc: Fix rfi/rfid/hrfi/... emulation
> > SHA-1: a2e71b28e832346409efc795ecd1f0a2bcb705a3
> > ```
> >  target-ppc/excp_helper.c | 51
+++++++++++++++++++-----------------------------
> >  1 file changed, 20 insertions(+), 31 deletions(-)
> >
> > diff --git a/target-ppc/excp_helper.c b/target-ppc/excp_helper.c
> > index 30e960e30b..aa0b63f4b0 100644
> > --- a/target-ppc/excp_helper.c
> > +++ b/target-ppc/excp_helper.c
> > @@ -922,25 +922,20 @@ void helper_store_msr(CPUPPCState *env,
target_ulong val)
> >      }
> >  }
> >
> > -static inline void do_rfi(CPUPPCState *env, target_ulong nip,
target_ulong msr,
> > -                          target_ulong msrm, int keep_msrh)
> > +static inline void do_rfi(CPUPPCState *env, target_ulong nip,
target_ulong msr)
> >  {
> >      CPUState *cs =3D CPU(ppc_env_get_cpu(env));
> >
> > +    /* MSR:POW cannot be set by any form of rfi */
> > +    msr &=3D ~(1ULL << MSR_POW);
> > +
> >  #if defined(TARGET_PPC64)
> > -    if (msr_is_64bit(env, msr)) {
> > -        nip =3D (uint64_t)nip;
> > -        msr &=3D (uint64_t)msrm;
> > -    } else {
> > +    /* Switching to 32-bit ? Crop the nip */
> > +    if (!msr_is_64bit(env, msr)) {
> >          nip =3D (uint32_t)nip;
> > -        msr =3D (uint32_t)(msr & msrm);
> > -        if (keep_msrh) {
> > -            msr |=3D env->msr & ~((uint64_t)0xFFFFFFFF);
> > -        }
> >      }
> >  #else
> >      nip =3D (uint32_t)nip;
> > -    msr &=3D (uint32_t)msrm;
> >  #endif
> >      /* XXX: beware: this is false if VLE is supported */
> >      env->nip =3D nip & ~((target_ulong)0x00000003);
> > @@ -959,26 +954,24 @@ static inline void do_rfi(CPUPPCState *env,
target_ulong nip, target_ulong msr,
> >
> >  void helper_rfi(CPUPPCState *env)
> >  {
> > -    if (env->excp_model =3D=3D POWERPC_EXCP_BOOKE) {
> > -        do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1],
> > -               ~((target_ulong)0), 0);
> > -    } else {
> > -        do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1],
> > -               ~((target_ulong)0x783F0000), 1);
> > -    }
> > +    do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1] & 0xfffffffful)=
;
> >  }
> >
> > +#define MSR_BOOK3S_MASK
> >  #if defined(TARGET_PPC64)
> >  void helper_rfid(CPUPPCState *env)
> >  {
> > -    do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1],
> > -           ~((target_ulong)0x783F0000), 0);
> > +    /* The architeture defines a number of rules for which bits
> > +     * can change but in practice, we handle this in hreg_store_msr()
> > +     * which will be called by do_rfi(), so there is no need to filter
> > +     * here
> > +     */
> > +    do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1]);
> >  }
> >
> >  void helper_hrfid(CPUPPCState *env)
> >  {
> > -    do_rfi(env, env->spr[SPR_HSRR0], env->spr[SPR_HSRR1],
> > -           ~((target_ulong)0x783F0000), 0);
> > +    do_rfi(env, env->spr[SPR_HSRR0], env->spr[SPR_HSRR1]);
> >  }
> >  #endif
> >
> > @@ -986,28 +979,24 @@ void helper_hrfid(CPUPPCState *env)
> >  /* Embedded PowerPC specific helpers */
> >  void helper_40x_rfci(CPUPPCState *env)
> >  {
> > -    do_rfi(env, env->spr[SPR_40x_SRR2], env->spr[SPR_40x_SRR3],
> > -           ~((target_ulong)0xFFFF0000), 0);
> > +    do_rfi(env, env->spr[SPR_40x_SRR2], env->spr[SPR_40x_SRR3]);
> >  }
> >
> >  void helper_rfci(CPUPPCState *env)
> >  {
> > -    do_rfi(env, env->spr[SPR_BOOKE_CSRR0], env->spr[SPR_BOOKE_CSRR1],
> > -           ~((target_ulong)0), 0);
> > +    do_rfi(env, env->spr[SPR_BOOKE_CSRR0], env->spr[SPR_BOOKE_CSRR1]);
> >  }
> >
> >  void helper_rfdi(CPUPPCState *env)
> >  {
> >      /* FIXME: choose CSRR1 or DSRR1 based on cpu type */
> > -    do_rfi(env, env->spr[SPR_BOOKE_DSRR0], env->spr[SPR_BOOKE_DSRR1],
> > -           ~((target_ulong)0), 0);
> > +    do_rfi(env, env->spr[SPR_BOOKE_DSRR0], env->spr[SPR_BOOKE_DSRR1]);
> >  }
> >
> >  void helper_rfmci(CPUPPCState *env)
> >  {
> >      /* FIXME: choose CSRR1 or MCSRR1 based on cpu type */
> > -    do_rfi(env, env->spr[SPR_BOOKE_MCSRR0], env->spr[SPR_BOOKE_MCSRR1]=
,
> > -           ~((target_ulong)0), 0);
> > +    do_rfi(env, env->spr[SPR_BOOKE_MCSRR0],
env->spr[SPR_BOOKE_MCSRR1]);
> >  }
> >  #endif
> >
> > @@ -1045,7 +1034,7 @@ void helper_td(CPUPPCState *env, target_ulong
arg1, target_ulong arg2,
> >
> >  void helper_rfsvc(CPUPPCState *env)
> >  {
> > -    do_rfi(env, env->lr, env->ctr, 0x0000FFFF, 0);
> > +    do_rfi(env, env->lr, env->ctr & 0x0000FFFF);
> >  }
> >
> >  /* Embedded.Processor Control */
> > ```
> >
> > And of cause, the second patch fixes some problem, but also cause new
problem,
> > how to implement these instruction properly?
>
> What are the new problems  ?
Before this patch, VxWorks can working, but after this, VxWorks can not
boot anymore.

>
> C.
>
> >
> >
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

--000000000000db89c905b85be38d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Fri, Jan 8, 2021 at 5:54 AM C=C3=A9dric Le Goat=
er &lt;<a href=3D"mailto:clg@kaod.org">clg@kaod.org</a>&gt; wrote:<br>&gt;<=
br>&gt; On 1/7/21 8:14 PM, =E7=BD=97=E5=8B=87=E5=88=9A(Yonggang Luo) wrote:=
<br>&gt; &gt; This is the first patch,:<br>&gt; &gt; It&#39;s store MSR bit=
s differntly for different rfi instructions:<br>&gt; &gt; [Qemu-devel] [PAT=
CH] target-ppc: fix RFI by clearing some bits of MSR<br>&gt; &gt; <a href=
=3D"https://lists.gnu.org/archive/html/qemu-devel/2010-05/msg02999.html">ht=
tps://lists.gnu.org/archive/html/qemu-devel/2010-05/msg02999.html</a> &lt;<=
a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2010-05/msg02999.ht=
ml">https://lists.gnu.org/archive/html/qemu-devel/2010-05/msg02999.html</a>=
&gt;<br>&gt; &gt; Comes from =C2=A0target-ppc: fix RFI by clearing some bit=
s of MSR<br>&gt; &gt; SHA-1: c3d420ead1aee9fcfd12be11cbdf6b1620134773<br>&g=
t; &gt; =C2=A0target-ppc/op_helper.c | 6 +++---<br>&gt; &gt; =C2=A01 file c=
hanged, 3 insertions(+), 3 deletions(-)<br>&gt; &gt; ```<br>&gt; &gt; diff =
--git a/target-ppc/op_helper.c b/target-ppc/op_helper.c<br>&gt; &gt; index =
8f2ee986bb..3c3aa60bc3 100644<br>&gt; &gt; --- a/target-ppc/op_helper.c<br>=
&gt; &gt; +++ b/target-ppc/op_helper.c<br>&gt; &gt; @@ -1646,20 +1646,20 @@=
 static inline void do_rfi(target_ulong nip, target_ulong msr,<br>&gt; &gt;=
 =C2=A0void helper_rfi (void)<br>&gt; &gt; =C2=A0{<br>&gt; &gt; =C2=A0 =C2=
=A0 =C2=A0do_rfi(env-&gt;spr[SPR_SRR0], env-&gt;spr[SPR_SRR1],<br>&gt; &gt;=
 - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~((target_ulong)0x0), 1);<br>&gt; &gt=
; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~((target_ulong)0x783F0000), 1);<br>=
&gt; &gt; =C2=A0}<br>&gt; &gt; =C2=A0<br>&gt; &gt; =C2=A0#if defined(TARGET=
_PPC64)<br>&gt; &gt; =C2=A0void helper_rfid (void)<br>&gt; &gt; =C2=A0{<br>=
&gt; &gt; =C2=A0 =C2=A0 =C2=A0do_rfi(env-&gt;spr[SPR_SRR0], env-&gt;spr[SPR=
_SRR1],<br>&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~((target_ulong)0=
x0), 0);<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~((target_ulong)=
0x783F0000), 0);<br>&gt; &gt; =C2=A0}<br>&gt; &gt; =C2=A0<br>&gt; &gt; =C2=
=A0void helper_hrfid (void)<br>&gt; &gt; =C2=A0{<br>&gt; &gt; =C2=A0 =C2=A0=
 =C2=A0do_rfi(env-&gt;spr[SPR_HSRR0], env-&gt;spr[SPR_HSRR1],<br>&gt; &gt; =
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~((target_ulong)0x0), 0);<br>&gt; &gt;=
 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~((target_ulong)0x783F0000), 0);<br>&=
gt; &gt; =C2=A0}<br>&gt; &gt; =C2=A0#endif<br>&gt; &gt; =C2=A0#endif<br>&gt=
; &gt; ```<br>&gt; &gt;<br>&gt; &gt; This is the second patch,:<br>&gt; &gt=
; it&#39;s remove the parameter =C2=A0`target_ulong msrm, int keep_msrh`<br=
>&gt; &gt; Comes from ppc: Fix rfi/rfid/hrfi/... emulation<br>&gt; &gt; SHA=
-1: a2e71b28e832346409efc795ecd1f0a2bcb705a3<br>&gt; &gt; ```<br>&gt; &gt; =
=C2=A0target-ppc/excp_helper.c | 51 +++++++++++++++++++--------------------=
---------<br>&gt; &gt; =C2=A01 file changed, 20 insertions(+), 31 deletions=
(-)<br>&gt; &gt;<br>&gt; &gt; diff --git a/target-ppc/excp_helper.c b/targe=
t-ppc/excp_helper.c<br>&gt; &gt; index 30e960e30b..aa0b63f4b0 100644<br>&gt=
; &gt; --- a/target-ppc/excp_helper.c<br>&gt; &gt; +++ b/target-ppc/excp_he=
lper.c<br>&gt; &gt; @@ -922,25 +922,20 @@ void helper_store_msr(CPUPPCState=
 *env, target_ulong val)<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0}<br>&gt; &gt; =
=C2=A0}<br>&gt; &gt; =C2=A0<br>&gt; &gt; -static inline void do_rfi(CPUPPCS=
tate *env, target_ulong nip, target_ulong msr,<br>&gt; &gt; - =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0target_ulong msrm, int keep_msrh)<br>&gt; &gt; +static inline void do_rf=
i(CPUPPCState *env, target_ulong nip, target_ulong msr)<br>&gt; &gt; =C2=A0=
{<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0CPUState *cs =3D CPU(ppc_env_get_cpu(env=
));<br>&gt; &gt; =C2=A0<br>&gt; &gt; + =C2=A0 =C2=A0/* MSR:POW cannot be se=
t by any form of rfi */<br>&gt; &gt; + =C2=A0 =C2=A0msr &amp;=3D ~(1ULL &lt=
;&lt; MSR_POW);<br>&gt; &gt; +<br>&gt; &gt; =C2=A0#if defined(TARGET_PPC64)=
<br>&gt; &gt; - =C2=A0 =C2=A0if (msr_is_64bit(env, msr)) {<br>&gt; &gt; - =
=C2=A0 =C2=A0 =C2=A0 =C2=A0nip =3D (uint64_t)nip;<br>&gt; &gt; - =C2=A0 =C2=
=A0 =C2=A0 =C2=A0msr &amp;=3D (uint64_t)msrm;<br>&gt; &gt; - =C2=A0 =C2=A0}=
 else {<br>&gt; &gt; + =C2=A0 =C2=A0/* Switching to 32-bit ? Crop the nip *=
/<br>&gt; &gt; + =C2=A0 =C2=A0if (!msr_is_64bit(env, msr)) {<br>&gt; &gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nip =3D (uint32_t)nip;<br>&gt; &gt; - =C2=
=A0 =C2=A0 =C2=A0 =C2=A0msr =3D (uint32_t)(msr &amp; msrm);<br>&gt; &gt; - =
=C2=A0 =C2=A0 =C2=A0 =C2=A0if (keep_msrh) {<br>&gt; &gt; - =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0msr |=3D env-&gt;msr &amp; ~((uint64_t)0xFFFFFFF=
F);<br>&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>&gt; &gt; =C2=A0 =C2=A0 =
=C2=A0}<br>&gt; &gt; =C2=A0#else<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0nip =3D (=
uint32_t)nip;<br>&gt; &gt; - =C2=A0 =C2=A0msr &amp;=3D (uint32_t)msrm;<br>&=
gt; &gt; =C2=A0#endif<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0/* XXX: beware: this=
 is false if VLE is supported */<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0env-&gt;n=
ip =3D nip &amp; ~((target_ulong)0x00000003);<br>&gt; &gt; @@ -959,26 +954,=
24 @@ static inline void do_rfi(CPUPPCState *env, target_ulong nip, target_=
ulong msr,<br>&gt; &gt; =C2=A0<br>&gt; &gt; =C2=A0void helper_rfi(CPUPPCSta=
te *env)<br>&gt; &gt; =C2=A0{<br>&gt; &gt; - =C2=A0 =C2=A0if (env-&gt;excp_=
model =3D=3D POWERPC_EXCP_BOOKE) {<br>&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=
=A0do_rfi(env, env-&gt;spr[SPR_SRR0], env-&gt;spr[SPR_SRR1],<br>&gt; &gt; -=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~((target_ulong)0), 0);<b=
r>&gt; &gt; - =C2=A0 =C2=A0} else {<br>&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=
=A0do_rfi(env, env-&gt;spr[SPR_SRR0], env-&gt;spr[SPR_SRR1],<br>&gt; &gt; -=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~((target_ulong)0x783F000=
0), 1);<br>&gt; &gt; - =C2=A0 =C2=A0}<br>&gt; &gt; + =C2=A0 =C2=A0do_rfi(en=
v, env-&gt;spr[SPR_SRR0], env-&gt;spr[SPR_SRR1] &amp; 0xfffffffful);<br>&gt=
; &gt; =C2=A0}<br>&gt; &gt; =C2=A0<br>&gt; &gt; +#define MSR_BOOK3S_MASK<br=
>&gt; &gt; =C2=A0#if defined(TARGET_PPC64)<br>&gt; &gt; =C2=A0void helper_r=
fid(CPUPPCState *env)<br>&gt; &gt; =C2=A0{<br>&gt; &gt; - =C2=A0 =C2=A0do_r=
fi(env, env-&gt;spr[SPR_SRR0], env-&gt;spr[SPR_SRR1],<br>&gt; &gt; - =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~((target_ulong)0x783F0000), 0);<br>&gt; &gt; =
+ =C2=A0 =C2=A0/* The architeture defines a number of rules for which bits<=
br>&gt; &gt; + =C2=A0 =C2=A0 * can change but in practice, we handle this i=
n hreg_store_msr()<br>&gt; &gt; + =C2=A0 =C2=A0 * which will be called by d=
o_rfi(), so there is no need to filter<br>&gt; &gt; + =C2=A0 =C2=A0 * here<=
br>&gt; &gt; + =C2=A0 =C2=A0 */<br>&gt; &gt; + =C2=A0 =C2=A0do_rfi(env, env=
-&gt;spr[SPR_SRR0], env-&gt;spr[SPR_SRR1]);<br>&gt; &gt; =C2=A0}<br>&gt; &g=
t; =C2=A0<br>&gt; &gt; =C2=A0void helper_hrfid(CPUPPCState *env)<br>&gt; &g=
t; =C2=A0{<br>&gt; &gt; - =C2=A0 =C2=A0do_rfi(env, env-&gt;spr[SPR_HSRR0], =
env-&gt;spr[SPR_HSRR1],<br>&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~=
((target_ulong)0x783F0000), 0);<br>&gt; &gt; + =C2=A0 =C2=A0do_rfi(env, env=
-&gt;spr[SPR_HSRR0], env-&gt;spr[SPR_HSRR1]);<br>&gt; &gt; =C2=A0}<br>&gt; =
&gt; =C2=A0#endif<br>&gt; &gt; =C2=A0<br>&gt; &gt; @@ -986,28 +979,24 @@ vo=
id helper_hrfid(CPUPPCState *env)<br>&gt; &gt; =C2=A0/* Embedded PowerPC sp=
ecific helpers */<br>&gt; &gt; =C2=A0void helper_40x_rfci(CPUPPCState *env)=
<br>&gt; &gt; =C2=A0{<br>&gt; &gt; - =C2=A0 =C2=A0do_rfi(env, env-&gt;spr[S=
PR_40x_SRR2], env-&gt;spr[SPR_40x_SRR3],<br>&gt; &gt; - =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ~((target_ulong)0xFFFF0000), 0);<br>&gt; &gt; + =C2=A0 =
=C2=A0do_rfi(env, env-&gt;spr[SPR_40x_SRR2], env-&gt;spr[SPR_40x_SRR3]);<br=
>&gt; &gt; =C2=A0}<br>&gt; &gt; =C2=A0<br>&gt; &gt; =C2=A0void helper_rfci(=
CPUPPCState *env)<br>&gt; &gt; =C2=A0{<br>&gt; &gt; - =C2=A0 =C2=A0do_rfi(e=
nv, env-&gt;spr[SPR_BOOKE_CSRR0], env-&gt;spr[SPR_BOOKE_CSRR1],<br>&gt; &gt=
; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~((target_ulong)0), 0);<br>&gt; &gt;=
 + =C2=A0 =C2=A0do_rfi(env, env-&gt;spr[SPR_BOOKE_CSRR0], env-&gt;spr[SPR_B=
OOKE_CSRR1]);<br>&gt; &gt; =C2=A0}<br>&gt; &gt; =C2=A0<br>&gt; &gt; =C2=A0v=
oid helper_rfdi(CPUPPCState *env)<br>&gt; &gt; =C2=A0{<br>&gt; &gt; =C2=A0 =
=C2=A0 =C2=A0/* FIXME: choose CSRR1 or DSRR1 based on cpu type */<br>&gt; &=
gt; - =C2=A0 =C2=A0do_rfi(env, env-&gt;spr[SPR_BOOKE_DSRR0], env-&gt;spr[SP=
R_BOOKE_DSRR1],<br>&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~((target=
_ulong)0), 0);<br>&gt; &gt; + =C2=A0 =C2=A0do_rfi(env, env-&gt;spr[SPR_BOOK=
E_DSRR0], env-&gt;spr[SPR_BOOKE_DSRR1]);<br>&gt; &gt; =C2=A0}<br>&gt; &gt; =
=C2=A0<br>&gt; &gt; =C2=A0void helper_rfmci(CPUPPCState *env)<br>&gt; &gt; =
=C2=A0{<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0/* FIXME: choose CSRR1 or MCSRR1 b=
ased on cpu type */<br>&gt; &gt; - =C2=A0 =C2=A0do_rfi(env, env-&gt;spr[SPR=
_BOOKE_MCSRR0], env-&gt;spr[SPR_BOOKE_MCSRR1],<br>&gt; &gt; - =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ~((target_ulong)0), 0);<br>&gt; &gt; + =C2=A0 =C2=A0d=
o_rfi(env, env-&gt;spr[SPR_BOOKE_MCSRR0], env-&gt;spr[SPR_BOOKE_MCSRR1]);<b=
r>&gt; &gt; =C2=A0}<br>&gt; &gt; =C2=A0#endif<br>&gt; &gt; =C2=A0<br>&gt; &=
gt; @@ -1045,7 +1034,7 @@ void helper_td(CPUPPCState *env, target_ulong arg=
1, target_ulong arg2,<br>&gt; &gt; =C2=A0<br>&gt; &gt; =C2=A0void helper_rf=
svc(CPUPPCState *env)<br>&gt; &gt; =C2=A0{<br>&gt; &gt; - =C2=A0 =C2=A0do_r=
fi(env, env-&gt;lr, env-&gt;ctr, 0x0000FFFF, 0);<br>&gt; &gt; + =C2=A0 =C2=
=A0do_rfi(env, env-&gt;lr, env-&gt;ctr &amp; 0x0000FFFF);<br>&gt; &gt; =C2=
=A0}<br>&gt; &gt; =C2=A0<br>&gt; &gt; =C2=A0/* Embedded.Processor Control *=
/<br>&gt; &gt; ```<br>&gt; &gt;<br>&gt; &gt; And of cause, the second patch=
 fixes some problem, but also cause new problem,<br>&gt; &gt; how to implem=
ent these instruction properly?<br>&gt;<br>&gt; What are the new problems =
=C2=A0?<div>Before this patch, VxWorks can working, but after this, VxWorks=
 can not boot anymore.</div><div><br>&gt;<br>&gt; C.<br>&gt;<br>&gt; &gt;<b=
r>&gt; &gt;<br>&gt; &gt;<br>&gt; &gt; --<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>&gt; &gt; =E7=A4=BC<br>&gt; &gt; =E7=BD=
=97=E5=8B=87=E5=88=9A<br>&gt; &gt; Yours<br>&gt; &gt; =C2=A0 =C2=A0 sincere=
ly,<br>&gt; &gt; Yonggang Luo<br>&gt;<br><br><br>--<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=
=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo</div></div>

--000000000000db89c905b85be38d--

