Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB442F07C3
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 16:06:42 +0100 (CET)
Received: from localhost ([::1]:55266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kycIj-0003WB-HW
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 10:06:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kycDP-0001fy-A5; Sun, 10 Jan 2021 10:01:12 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:39939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kycDL-0004F0-SB; Sun, 10 Jan 2021 10:01:11 -0500
Received: by mail-lf1-x136.google.com with SMTP id m12so34163873lfo.7;
 Sun, 10 Jan 2021 07:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=Y+wMx+4cARd7DHQFRKJ3PwVWt3P5HiEYakWrGnjzDZc=;
 b=lJkyxMEFZayHOvVrUietxGY+cQYwpV89R6ZHk3LjkoYKsbq1rCeZ8/20xCJ49lW6Tx
 mBaKQ5sovdVy1G+p34UR3bmP19/Rj4sRzbKpUyvNpCKSl/YWcpdqZumNxnUmPVGUUqfQ
 ommJS2wERhIa6g9o4NUdPwX7wFTeNr/rGFrJ/tX7SFcGLJdUH0bqiu5peJVbLMIcv36U
 K3ZRKk9yD+y6RDQpyQCRHQr3z6hVZqdvtdcVZMpLHPDdqOXTEAwzT0PQB1BdOvespvLc
 aTa1U56GpIWfG9OMiyBmMVQCLLA+B5WYDH43UfLJk2+FOsL1kXf6dLCu1cWDHpS1muce
 RfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=Y+wMx+4cARd7DHQFRKJ3PwVWt3P5HiEYakWrGnjzDZc=;
 b=R6eiSxYac5yHUVRLeqcjh3B/3q+yxXTKHEw7cGJfXWu5fxN7yir++9R7BsoM2sgc2E
 +GFF/z15JE4xBegaGP83UvJt7eNBHSIeEN/aWLf2oRa+PpHbP4dwfLWc/Hj/af4zQLzC
 tr2lmrN28wriJ7D1P+Hk0Pn1DEjgvUBlMYJx7S7LmROiPXngB/XvsFVKkOGgVfV5Dzlh
 iYrU5DMaRBTuKolP03U4N9QceUlS5dGUkAXWQxCKNTUOrgMrlVJs8keWF69Z7rS9ZsRg
 yTNu/0pXaSllbqUOIiF1IzgQB34/VQX9OfA97FMPLZmoKluvoOeTle7ncou62TDybP4V
 gpzQ==
X-Gm-Message-State: AOAM531ayBujfrvU04Xcgon2W3vyUNc/igXnWd7R4esJugu8Dp5BBALC
 S5L7W1y9JoVwn3GVikrfn1IkPKtN0lpd6vj13ag=
X-Google-Smtp-Source: ABdhPJyqVUZPOA9CP6wZnYEJH2DadGVZ3OqdP3sVkTiF1vPjSAWjLa+lhC8LSGlTwQn8bVQgwE/NRPOLiq+vrU7/XEs=
X-Received: by 2002:a19:6a1a:: with SMTP id u26mr2490948lfu.497.1610290865195; 
 Sun, 10 Jan 2021 07:01:05 -0800 (PST)
MIME-Version: 1.0
References: <CAE2XoE84K6vdQ23upRa1MaCNWSycUGKja9DrTpVCQ4bdY7bZuQ@mail.gmail.com>
 <db5077c9-4b20-08f1-131e-0bbc7ae15313@kaod.org>
 <CAE2XoE-Fc3Tc51uiDN70_6suHPwczdp9EcS_LirLK-txzgS+yw@mail.gmail.com>
 <ef0eb70c-5b56-9850-2ad3-f12591cd6b4b@kaod.org>
In-Reply-To: <ef0eb70c-5b56-9850-2ad3-f12591cd6b4b@kaod.org>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Sun, 10 Jan 2021 07:00:52 -0800
Message-ID: <CAE2XoE-VAMPYwNcGYK_3fqKgy138VOx6JaaSHD+bvz-fkH_jZA@mail.gmail.com>
Subject: Re: What's the correct way to implement rfi and related instruction.
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: multipart/alternative; boundary="000000000000014f3905b88d0f2f"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=luoyonggang@gmail.com; helo=mail-lf1-x136.google.com
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

--000000000000014f3905b88d0f2f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 8, 2021 at 2:02 AM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 1/8/21 5:21 AM, =E7=BD=97=E5=8B=87=E5=88=9A(Yonggang Luo) wrote:
> >
> >
> > On Fri, Jan 8, 2021 at 5:54 AM C=C3=A9dric Le Goater <clg@kaod.org <mai=
lto:
clg@kaod.org>> wrote:
> >>
> >> On 1/7/21 8:14 PM, =E7=BD=97=E5=8B=87=E5=88=9A(Yonggang Luo) wrote:
> >> > This is the first patch,:
> >> > It's store MSR bits differntly for different rfi instructions:
> >> > [Qemu-devel] [PATCH] target-ppc: fix RFI by clearing some bits of MS=
R
> >> > https://lists.gnu.org/archive/html/qemu-devel/2010-05/msg02999.html =
<
https://lists.gnu.org/archive/html/qemu-devel/2010-05/msg02999.html> <
https://lists.gnu.org/archive/html/qemu-devel/2010-05/msg02999.html <
https://lists.gnu.org/archive/html/qemu-devel/2010-05/msg02999.html>>
> >> > Comes from  target-ppc: fix RFI by clearing some bits of MSR
> >> > SHA-1: c3d420ead1aee9fcfd12be11cbdf6b1620134773
> >> >  target-ppc/op_helper.c | 6 +++---
> >> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >> > ```
> >> > diff --git a/target-ppc/op_helper.c b/target-ppc/op_helper.c
> >> > index 8f2ee986bb..3c3aa60bc3 100644
> >> > --- a/target-ppc/op_helper.c
> >> > +++ b/target-ppc/op_helper.c
> >> > @@ -1646,20 +1646,20 @@ static inline void do_rfi(target_ulong nip,
target_ulong msr,
> >> >  void helper_rfi (void)
> >> >  {
> >> >      do_rfi(env->spr[SPR_SRR0], env->spr[SPR_SRR1],
> >> > -           ~((target_ulong)0x0), 1);
> >> > +           ~((target_ulong)0x783F0000), 1);
> >> >  }
> >> >
> >> >  #if defined(TARGET_PPC64)
> >> >  void helper_rfid (void)
> >> >  {
> >> >      do_rfi(env->spr[SPR_SRR0], env->spr[SPR_SRR1],
> >> > -           ~((target_ulong)0x0), 0);
> >> > +           ~((target_ulong)0x783F0000), 0);
> >> >  }
> >> >
> >> >  void helper_hrfid (void)
> >> >  {
> >> >      do_rfi(env->spr[SPR_HSRR0], env->spr[SPR_HSRR1],
> >> > -           ~((target_ulong)0x0), 0);
> >> > +           ~((target_ulong)0x783F0000), 0);
> >> >  }
> >> >  #endif
> >> >  #endif
> >> > ```
> >> >
> >> > This is the second patch,:
> >> > it's remove the parameter  `target_ulong msrm, int keep_msrh`
> >> > Comes from ppc: Fix rfi/rfid/hrfi/... emulation
> >> > SHA-1: a2e71b28e832346409efc795ecd1f0a2bcb705a3
> >> > ```
> >> >  target-ppc/excp_helper.c | 51
+++++++++++++++++++-----------------------------
> >> >  1 file changed, 20 insertions(+), 31 deletions(-)
> >> >
> >> > diff --git a/target-ppc/excp_helper.c b/target-ppc/excp_helper.c
> >> > index 30e960e30b..aa0b63f4b0 100644
> >> > --- a/target-ppc/excp_helper.c
> >> > +++ b/target-ppc/excp_helper.c
> >> > @@ -922,25 +922,20 @@ void helper_store_msr(CPUPPCState *env,
target_ulong val)
> >> >      }
> >> >  }
> >> >
> >> > -static inline void do_rfi(CPUPPCState *env, target_ulong nip,
target_ulong msr,
> >> > -                          target_ulong msrm, int keep_msrh)
> >> > +static inline void do_rfi(CPUPPCState *env, target_ulong nip,
target_ulong msr)
> >> >  {
> >> >      CPUState *cs =3D CPU(ppc_env_get_cpu(env));
> >> >
> >> > +    /* MSR:POW cannot be set by any form of rfi */
> >> > +    msr &=3D ~(1ULL << MSR_POW);
> >> > +
> >> >  #if defined(TARGET_PPC64)
> >> > -    if (msr_is_64bit(env, msr)) {
> >> > -        nip =3D (uint64_t)nip;
> >> > -        msr &=3D (uint64_t)msrm;
> >> > -    } else {
> >> > +    /* Switching to 32-bit ? Crop the nip */
> >> > +    if (!msr_is_64bit(env, msr)) {
> >> >          nip =3D (uint32_t)nip;
> >> > -        msr =3D (uint32_t)(msr & msrm);
> >> > -        if (keep_msrh) {
> >> > -            msr |=3D env->msr & ~((uint64_t)0xFFFFFFFF);
> >> > -        }
> >> >      }
> >> >  #else
> >> >      nip =3D (uint32_t)nip;
> >> > -    msr &=3D (uint32_t)msrm;
> >> >  #endif
> >> >      /* XXX: beware: this is false if VLE is supported */
> >> >      env->nip =3D nip & ~((target_ulong)0x00000003);
> >> > @@ -959,26 +954,24 @@ static inline void do_rfi(CPUPPCState *env,
target_ulong nip, target_ulong msr,
> >> >
> >> >  void helper_rfi(CPUPPCState *env)
> >> >  {
> >> > -    if (env->excp_model =3D=3D POWERPC_EXCP_BOOKE) {
> >> > -        do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1],
> >> > -               ~((target_ulong)0), 0);
> >> > -    } else {
> >> > -        do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1],
> >> > -               ~((target_ulong)0x783F0000), 1);
> >> > -    }
> >> > +    do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1] &
0xfffffffful);
> >> >  }
> >> >
> >> > +#define MSR_BOOK3S_MASK
> >> >  #if defined(TARGET_PPC64)
> >> >  void helper_rfid(CPUPPCState *env)
> >> >  {
> >> > -    do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1],
> >> > -           ~((target_ulong)0x783F0000), 0);
> >> > +    /* The architeture defines a number of rules for which bits
> >> > +     * can change but in practice, we handle this in
hreg_store_msr()
> >> > +     * which will be called by do_rfi(), so there is no need to
filter
> >> > +     * here
> >> > +     */
> >> > +    do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1]);
> >> >  }
> >> >
> >> >  void helper_hrfid(CPUPPCState *env)
> >> >  {
> >> > -    do_rfi(env, env->spr[SPR_HSRR0], env->spr[SPR_HSRR1],
> >> > -           ~((target_ulong)0x783F0000), 0);
> >> > +    do_rfi(env, env->spr[SPR_HSRR0], env->spr[SPR_HSRR1]);
> >> >  }
> >> >  #endif
> >> >
> >> > @@ -986,28 +979,24 @@ void helper_hrfid(CPUPPCState *env)
> >> >  /* Embedded PowerPC specific helpers */
> >> >  void helper_40x_rfci(CPUPPCState *env)
> >> >  {
> >> > -    do_rfi(env, env->spr[SPR_40x_SRR2], env->spr[SPR_40x_SRR3],
> >> > -           ~((target_ulong)0xFFFF0000), 0);
> >> > +    do_rfi(env, env->spr[SPR_40x_SRR2], env->spr[SPR_40x_SRR3]);
> >> >  }
> >> >
> >> >  void helper_rfci(CPUPPCState *env)
> >> >  {
> >> > -    do_rfi(env, env->spr[SPR_BOOKE_CSRR0],
env->spr[SPR_BOOKE_CSRR1],
> >> > -           ~((target_ulong)0), 0);
> >> > +    do_rfi(env, env->spr[SPR_BOOKE_CSRR0],
env->spr[SPR_BOOKE_CSRR1]);
> >> >  }
> >> >
> >> >  void helper_rfdi(CPUPPCState *env)
> >> >  {
> >> >      /* FIXME: choose CSRR1 or DSRR1 based on cpu type */
> >> > -    do_rfi(env, env->spr[SPR_BOOKE_DSRR0],
env->spr[SPR_BOOKE_DSRR1],
> >> > -           ~((target_ulong)0), 0);
> >> > +    do_rfi(env, env->spr[SPR_BOOKE_DSRR0],
env->spr[SPR_BOOKE_DSRR1]);
> >> >  }
> >> >
> >> >  void helper_rfmci(CPUPPCState *env)
> >> >  {
> >> >      /* FIXME: choose CSRR1 or MCSRR1 based on cpu type */
> >> > -    do_rfi(env, env->spr[SPR_BOOKE_MCSRR0],
env->spr[SPR_BOOKE_MCSRR1],
> >> > -           ~((target_ulong)0), 0);
> >> > +    do_rfi(env, env->spr[SPR_BOOKE_MCSRR0],
env->spr[SPR_BOOKE_MCSRR1]);
> >> >  }
> >> >  #endif
> >> >
> >> > @@ -1045,7 +1034,7 @@ void helper_td(CPUPPCState *env, target_ulong
arg1, target_ulong arg2,
> >> >
> >> >  void helper_rfsvc(CPUPPCState *env)
> >> >  {
> >> > -    do_rfi(env, env->lr, env->ctr, 0x0000FFFF, 0);
> >> > +    do_rfi(env, env->lr, env->ctr & 0x0000FFFF);
> >> >  }
> >> >
> >> >  /* Embedded.Processor Control */
> >> > ```
> >> >
> >> > And of cause, the second patch fixes some problem, but also cause
new problem,
> >> > how to implement these instruction properly?
> >>
> >> What are the new problems  ?
> >
> >
> > Before this patch, VxWorks can working, but after this, VxWorks can not
boot anymore.
>
> I suppose you did a bisect to reach this patch.
>
> Which QEMU machine is impacted ? Which CPU ? What are the symptoms ?
>
> Did you try to run with -d exec or -d in_asm to identify the exact
> instruction ?
>
> From there, you could try to revert partially the patch above to
> fix the problem.
>
> Thanks,
>
> C.
>
>
>
QEMU 5.2.x, an e300 based machine ppc603 are impacted.
Here is my fix, narrowed down to  MSR_TGPR and  MSR_ILE
```
From 42ce41671f1e6c4dd44e6fb481bbda9df09320bd Mon Sep 17 00:00:00 2001
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Sun, 10 Jan 2021 00:08:00 -0800
Subject: [PATCH] ppc: Fix rfi/rfid/hrfi/... emulation again

This revert part mask bits for ppc603/ppc4x that disabled in
 a2e71b28e832346409efc795ecd1f0a2bcb705a3.
Remove redundant macro MSR_BOOK3S_MASK.
Fixes boot VxWorks on e300

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/ppc/excp_helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 1c48b9fdf6..df70c5a4e8 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1156,8 +1156,10 @@ static inline void do_rfi(CPUPPCState *env,
target_ulong nip, target_ulong msr)
 {
     CPUState *cs =3D env_cpu(env);

-    /* MSR:POW cannot be set by any form of rfi */
+    /* MSR:POW,TGPR,ILE cannot be set by any form of rfi */
     msr &=3D ~(1ULL << MSR_POW);
+    msr &=3D ~(1ULL << MSR_TGPR);
+    msr &=3D ~(1ULL << MSR_ILE);

 #if defined(TARGET_PPC64)
     /* Switching to 32-bit ? Crop the nip */
@@ -1190,7 +1192,6 @@ void helper_rfi(CPUPPCState *env)
     do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1] & 0xfffffffful);
 }

-#define MSR_BOOK3S_MASK
 #if defined(TARGET_PPC64)
 void helper_rfid(CPUPPCState *env)
 {
--=20
2.29.2.windows.3

```

--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000014f3905b88d0f2f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Fri, Jan 8, 2021 at 2:02 AM C=C3=A9dric Le Goat=
er &lt;<a href=3D"mailto:clg@kaod.org">clg@kaod.org</a>&gt; wrote:<br>&gt;<=
br>&gt; On 1/8/21 5:21 AM, =E7=BD=97=E5=8B=87=E5=88=9A(Yonggang Luo) wrote:=
<br>&gt; &gt;<br>&gt; &gt;<br>&gt; &gt; On Fri, Jan 8, 2021 at 5:54 AM C=C3=
=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.org">clg@kaod.org</a> &lt;=
mailto:<a href=3D"mailto:clg@kaod.org">clg@kaod.org</a>&gt;&gt; wrote:<br>&=
gt; &gt;&gt;<br>&gt; &gt;&gt; On 1/7/21 8:14 PM, =E7=BD=97=E5=8B=87=E5=88=
=9A(Yonggang Luo) wrote:<br>&gt; &gt;&gt; &gt; This is the first patch,:<br=
>&gt; &gt;&gt; &gt; It&#39;s store MSR bits differntly for different rfi in=
structions:<br>&gt; &gt;&gt; &gt; [Qemu-devel] [PATCH] target-ppc: fix RFI =
by clearing some bits of MSR<br>&gt; &gt;&gt; &gt; <a href=3D"https://lists=
.gnu.org/archive/html/qemu-devel/2010-05/msg02999.html">https://lists.gnu.o=
rg/archive/html/qemu-devel/2010-05/msg02999.html</a> &lt;<a href=3D"https:/=
/lists.gnu.org/archive/html/qemu-devel/2010-05/msg02999.html">https://lists=
.gnu.org/archive/html/qemu-devel/2010-05/msg02999.html</a>&gt; &lt;<a href=
=3D"https://lists.gnu.org/archive/html/qemu-devel/2010-05/msg02999.html">ht=
tps://lists.gnu.org/archive/html/qemu-devel/2010-05/msg02999.html</a> &lt;<=
a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2010-05/msg02999.ht=
ml">https://lists.gnu.org/archive/html/qemu-devel/2010-05/msg02999.html</a>=
&gt;&gt;<br>&gt; &gt;&gt; &gt; Comes from =C2=A0target-ppc: fix RFI by clea=
ring some bits of MSR<br>&gt; &gt;&gt; &gt; SHA-1: c3d420ead1aee9fcfd12be11=
cbdf6b1620134773<br>&gt; &gt;&gt; &gt; =C2=A0target-ppc/op_helper.c | 6 +++=
---<br>&gt; &gt;&gt; &gt; =C2=A01 file changed, 3 insertions(+), 3 deletion=
s(-)<br>&gt; &gt;&gt; &gt; ```<br>&gt; &gt;&gt; &gt; diff --git a/target-pp=
c/op_helper.c b/target-ppc/op_helper.c<br>&gt; &gt;&gt; &gt; index 8f2ee986=
bb..3c3aa60bc3 100644<br>&gt; &gt;&gt; &gt; --- a/target-ppc/op_helper.c<br=
>&gt; &gt;&gt; &gt; +++ b/target-ppc/op_helper.c<br>&gt; &gt;&gt; &gt; @@ -=
1646,20 +1646,20 @@ static inline void do_rfi(target_ulong nip, target_ulon=
g msr,<br>&gt; &gt;&gt; &gt; =C2=A0void helper_rfi (void)<br>&gt; &gt;&gt; =
&gt; =C2=A0{<br>&gt; &gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0do_rfi(env-&gt;spr[S=
PR_SRR0], env-&gt;spr[SPR_SRR1],<br>&gt; &gt;&gt; &gt; - =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ~((target_ulong)0x0), 1);<br>&gt; &gt;&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ~((target_ulong)0x783F0000), 1);<br>&gt; &gt;&g=
t; &gt; =C2=A0}<br>&gt; &gt;&gt; &gt; =C2=A0<br>&gt; &gt;&gt; &gt; =C2=A0#i=
f defined(TARGET_PPC64)<br>&gt; &gt;&gt; &gt; =C2=A0void helper_rfid (void)=
<br>&gt; &gt;&gt; &gt; =C2=A0{<br>&gt; &gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0do=
_rfi(env-&gt;spr[SPR_SRR0], env-&gt;spr[SPR_SRR1],<br>&gt; &gt;&gt; &gt; - =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~((target_ulong)0x0), 0);<br>&gt; &gt;&g=
t; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~((target_ulong)0x783F0000), 0=
);<br>&gt; &gt;&gt; &gt; =C2=A0}<br>&gt; &gt;&gt; &gt; =C2=A0<br>&gt; &gt;&=
gt; &gt; =C2=A0void helper_hrfid (void)<br>&gt; &gt;&gt; &gt; =C2=A0{<br>&g=
t; &gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0do_rfi(env-&gt;spr[SPR_HSRR0], env-&gt=
;spr[SPR_HSRR1],<br>&gt; &gt;&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ~((target_ulong)0x0), 0);<br>&gt; &gt;&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ~((target_ulong)0x783F0000), 0);<br>&gt; &gt;&gt; &gt; =C2=A0}<b=
r>&gt; &gt;&gt; &gt; =C2=A0#endif<br>&gt; &gt;&gt; &gt; =C2=A0#endif<br>&gt=
; &gt;&gt; &gt; ```<br>&gt; &gt;&gt; &gt;<br>&gt; &gt;&gt; &gt; This is the=
 second patch,:<br>&gt; &gt;&gt; &gt; it&#39;s remove the parameter =C2=A0`=
target_ulong msrm, int keep_msrh`<br>&gt; &gt;&gt; &gt; Comes from ppc: Fix=
 rfi/rfid/hrfi/... emulation<br>&gt; &gt;&gt; &gt; SHA-1: a2e71b28e83234640=
9efc795ecd1f0a2bcb705a3<br>&gt; &gt;&gt; &gt; ```<br>&gt; &gt;&gt; &gt; =C2=
=A0target-ppc/excp_helper.c | 51 +++++++++++++++++++-----------------------=
------<br>&gt; &gt;&gt; &gt; =C2=A01 file changed, 20 insertions(+), 31 del=
etions(-)<br>&gt; &gt;&gt; &gt;<br>&gt; &gt;&gt; &gt; diff --git a/target-p=
pc/excp_helper.c b/target-ppc/excp_helper.c<br>&gt; &gt;&gt; &gt; index 30e=
960e30b..aa0b63f4b0 100644<br>&gt; &gt;&gt; &gt; --- a/target-ppc/excp_help=
er.c<br>&gt; &gt;&gt; &gt; +++ b/target-ppc/excp_helper.c<br>&gt; &gt;&gt; =
&gt; @@ -922,25 +922,20 @@ void helper_store_msr(CPUPPCState *env, target_u=
long val)<br>&gt; &gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0}<br>&gt; &gt;&gt; &gt;=
 =C2=A0}<br>&gt; &gt;&gt; &gt; =C2=A0<br>&gt; &gt;&gt; &gt; -static inline =
void do_rfi(CPUPPCState *env, target_ulong nip, target_ulong msr,<br>&gt; &=
gt;&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong msrm, int keep_msrh)<br>&gt; &g=
t;&gt; &gt; +static inline void do_rfi(CPUPPCState *env, target_ulong nip, =
target_ulong msr)<br>&gt; &gt;&gt; &gt; =C2=A0{<br>&gt; &gt;&gt; &gt; =C2=
=A0 =C2=A0 =C2=A0CPUState *cs =3D CPU(ppc_env_get_cpu(env));<br>&gt; &gt;&g=
t; &gt; =C2=A0<br>&gt; &gt;&gt; &gt; + =C2=A0 =C2=A0/* MSR:POW cannot be se=
t by any form of rfi */<br>&gt; &gt;&gt; &gt; + =C2=A0 =C2=A0msr &amp;=3D ~=
(1ULL &lt;&lt; MSR_POW);<br>&gt; &gt;&gt; &gt; +<br>&gt; &gt;&gt; &gt; =C2=
=A0#if defined(TARGET_PPC64)<br>&gt; &gt;&gt; &gt; - =C2=A0 =C2=A0if (msr_i=
s_64bit(env, msr)) {<br>&gt; &gt;&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0nip=
 =3D (uint64_t)nip;<br>&gt; &gt;&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0msr =
&amp;=3D (uint64_t)msrm;<br>&gt; &gt;&gt; &gt; - =C2=A0 =C2=A0} else {<br>&=
gt; &gt;&gt; &gt; + =C2=A0 =C2=A0/* Switching to 32-bit ? Crop the nip */<b=
r>&gt; &gt;&gt; &gt; + =C2=A0 =C2=A0if (!msr_is_64bit(env, msr)) {<br>&gt; =
&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nip =3D (uint32_t)nip;<br>&=
gt; &gt;&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0msr =3D (uint32_t)(msr &amp;=
 msrm);<br>&gt; &gt;&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0if (keep_msrh) {=
<br>&gt; &gt;&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msr |=3D =
env-&gt;msr &amp; ~((uint64_t)0xFFFFFFFF);<br>&gt; &gt;&gt; &gt; - =C2=A0 =
=C2=A0 =C2=A0 =C2=A0}<br>&gt; &gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0}<br>&gt; &=
gt;&gt; &gt; =C2=A0#else<br>&gt; &gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0nip =3D =
(uint32_t)nip;<br>&gt; &gt;&gt; &gt; - =C2=A0 =C2=A0msr &amp;=3D (uint32_t)=
msrm;<br>&gt; &gt;&gt; &gt; =C2=A0#endif<br>&gt; &gt;&gt; &gt; =C2=A0 =C2=
=A0 =C2=A0/* XXX: beware: this is false if VLE is supported */<br>&gt; &gt;=
&gt; &gt; =C2=A0 =C2=A0 =C2=A0env-&gt;nip =3D nip &amp; ~((target_ulong)0x0=
0000003);<br>&gt; &gt;&gt; &gt; @@ -959,26 +954,24 @@ static inline void do=
_rfi(CPUPPCState *env, target_ulong nip, target_ulong msr,<br>&gt; &gt;&gt;=
 &gt; =C2=A0<br>&gt; &gt;&gt; &gt; =C2=A0void helper_rfi(CPUPPCState *env)<=
br>&gt; &gt;&gt; &gt; =C2=A0{<br>&gt; &gt;&gt; &gt; - =C2=A0 =C2=A0if (env-=
&gt;excp_model =3D=3D POWERPC_EXCP_BOOKE) {<br>&gt; &gt;&gt; &gt; - =C2=A0 =
=C2=A0 =C2=A0 =C2=A0do_rfi(env, env-&gt;spr[SPR_SRR0], env-&gt;spr[SPR_SRR1=
],<br>&gt; &gt;&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ~((target_ulong)0), 0);<br>&gt; &gt;&gt; &gt; - =C2=A0 =C2=A0} else {<br>&=
gt; &gt;&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0do_rfi(env, env-&gt;spr[SPR_=
SRR0], env-&gt;spr[SPR_SRR1],<br>&gt; &gt;&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ~((target_ulong)0x783F0000), 1);<br>&gt; &gt;&g=
t; &gt; - =C2=A0 =C2=A0}<br>&gt; &gt;&gt; &gt; + =C2=A0 =C2=A0do_rfi(env, e=
nv-&gt;spr[SPR_SRR0], env-&gt;spr[SPR_SRR1] &amp; 0xfffffffful);<br>&gt; &g=
t;&gt; &gt; =C2=A0}<br>&gt; &gt;&gt; &gt; =C2=A0<br>&gt; &gt;&gt; &gt; +#de=
fine MSR_BOOK3S_MASK<br>&gt; &gt;&gt; &gt; =C2=A0#if defined(TARGET_PPC64)<=
br>&gt; &gt;&gt; &gt; =C2=A0void helper_rfid(CPUPPCState *env)<br>&gt; &gt;=
&gt; &gt; =C2=A0{<br>&gt; &gt;&gt; &gt; - =C2=A0 =C2=A0do_rfi(env, env-&gt;=
spr[SPR_SRR0], env-&gt;spr[SPR_SRR1],<br>&gt; &gt;&gt; &gt; - =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ~((target_ulong)0x783F0000), 0);<br>&gt; &gt;&gt; &gt=
; + =C2=A0 =C2=A0/* The architeture defines a number of rules for which bit=
s<br>&gt; &gt;&gt; &gt; + =C2=A0 =C2=A0 * can change but in practice, we ha=
ndle this in hreg_store_msr()<br>&gt; &gt;&gt; &gt; + =C2=A0 =C2=A0 * which=
 will be called by do_rfi(), so there is no need to filter<br>&gt; &gt;&gt;=
 &gt; + =C2=A0 =C2=A0 * here<br>&gt; &gt;&gt; &gt; + =C2=A0 =C2=A0 */<br>&g=
t; &gt;&gt; &gt; + =C2=A0 =C2=A0do_rfi(env, env-&gt;spr[SPR_SRR0], env-&gt;=
spr[SPR_SRR1]);<br>&gt; &gt;&gt; &gt; =C2=A0}<br>&gt; &gt;&gt; &gt; =C2=A0<=
br>&gt; &gt;&gt; &gt; =C2=A0void helper_hrfid(CPUPPCState *env)<br>&gt; &gt=
;&gt; &gt; =C2=A0{<br>&gt; &gt;&gt; &gt; - =C2=A0 =C2=A0do_rfi(env, env-&gt=
;spr[SPR_HSRR0], env-&gt;spr[SPR_HSRR1],<br>&gt; &gt;&gt; &gt; - =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ~((target_ulong)0x783F0000), 0);<br>&gt; &gt;&gt; =
&gt; + =C2=A0 =C2=A0do_rfi(env, env-&gt;spr[SPR_HSRR0], env-&gt;spr[SPR_HSR=
R1]);<br>&gt; &gt;&gt; &gt; =C2=A0}<br>&gt; &gt;&gt; &gt; =C2=A0#endif<br>&=
gt; &gt;&gt; &gt; =C2=A0<br>&gt; &gt;&gt; &gt; @@ -986,28 +979,24 @@ void h=
elper_hrfid(CPUPPCState *env)<br>&gt; &gt;&gt; &gt; =C2=A0/* Embedded Power=
PC specific helpers */<br>&gt; &gt;&gt; &gt; =C2=A0void helper_40x_rfci(CPU=
PPCState *env)<br>&gt; &gt;&gt; &gt; =C2=A0{<br>&gt; &gt;&gt; &gt; - =C2=A0=
 =C2=A0do_rfi(env, env-&gt;spr[SPR_40x_SRR2], env-&gt;spr[SPR_40x_SRR3],<br=
>&gt; &gt;&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~((target_ulong)0x=
FFFF0000), 0);<br>&gt; &gt;&gt; &gt; + =C2=A0 =C2=A0do_rfi(env, env-&gt;spr=
[SPR_40x_SRR2], env-&gt;spr[SPR_40x_SRR3]);<br>&gt; &gt;&gt; &gt; =C2=A0}<b=
r>&gt; &gt;&gt; &gt; =C2=A0<br>&gt; &gt;&gt; &gt; =C2=A0void helper_rfci(CP=
UPPCState *env)<br>&gt; &gt;&gt; &gt; =C2=A0{<br>&gt; &gt;&gt; &gt; - =C2=
=A0 =C2=A0do_rfi(env, env-&gt;spr[SPR_BOOKE_CSRR0], env-&gt;spr[SPR_BOOKE_C=
SRR1],<br>&gt; &gt;&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~((target=
_ulong)0), 0);<br>&gt; &gt;&gt; &gt; + =C2=A0 =C2=A0do_rfi(env, env-&gt;spr=
[SPR_BOOKE_CSRR0], env-&gt;spr[SPR_BOOKE_CSRR1]);<br>&gt; &gt;&gt; &gt; =C2=
=A0}<br>&gt; &gt;&gt; &gt; =C2=A0<br>&gt; &gt;&gt; &gt; =C2=A0void helper_r=
fdi(CPUPPCState *env)<br>&gt; &gt;&gt; &gt; =C2=A0{<br>&gt; &gt;&gt; &gt; =
=C2=A0 =C2=A0 =C2=A0/* FIXME: choose CSRR1 or DSRR1 based on cpu type */<br=
>&gt; &gt;&gt; &gt; - =C2=A0 =C2=A0do_rfi(env, env-&gt;spr[SPR_BOOKE_DSRR0]=
, env-&gt;spr[SPR_BOOKE_DSRR1],<br>&gt; &gt;&gt; &gt; - =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ~((target_ulong)0), 0);<br>&gt; &gt;&gt; &gt; + =C2=A0 =
=C2=A0do_rfi(env, env-&gt;spr[SPR_BOOKE_DSRR0], env-&gt;spr[SPR_BOOKE_DSRR1=
]);<br>&gt; &gt;&gt; &gt; =C2=A0}<br>&gt; &gt;&gt; &gt; =C2=A0<br>&gt; &gt;=
&gt; &gt; =C2=A0void helper_rfmci(CPUPPCState *env)<br>&gt; &gt;&gt; &gt; =
=C2=A0{<br>&gt; &gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0/* FIXME: choose CSRR1 or=
 MCSRR1 based on cpu type */<br>&gt; &gt;&gt; &gt; - =C2=A0 =C2=A0do_rfi(en=
v, env-&gt;spr[SPR_BOOKE_MCSRR0], env-&gt;spr[SPR_BOOKE_MCSRR1],<br>&gt; &g=
t;&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~((target_ulong)0), 0);<br=
>&gt; &gt;&gt; &gt; + =C2=A0 =C2=A0do_rfi(env, env-&gt;spr[SPR_BOOKE_MCSRR0=
], env-&gt;spr[SPR_BOOKE_MCSRR1]);<br>&gt; &gt;&gt; &gt; =C2=A0}<br>&gt; &g=
t;&gt; &gt; =C2=A0#endif<br>&gt; &gt;&gt; &gt; =C2=A0<br>&gt; &gt;&gt; &gt;=
 @@ -1045,7 +1034,7 @@ void helper_td(CPUPPCState *env, target_ulong arg1, =
target_ulong arg2,<br>&gt; &gt;&gt; &gt; =C2=A0<br>&gt; &gt;&gt; &gt; =C2=
=A0void helper_rfsvc(CPUPPCState *env)<br>&gt; &gt;&gt; &gt; =C2=A0{<br>&gt=
; &gt;&gt; &gt; - =C2=A0 =C2=A0do_rfi(env, env-&gt;lr, env-&gt;ctr, 0x0000F=
FFF, 0);<br>&gt; &gt;&gt; &gt; + =C2=A0 =C2=A0do_rfi(env, env-&gt;lr, env-&=
gt;ctr &amp; 0x0000FFFF);<br>&gt; &gt;&gt; &gt; =C2=A0}<br>&gt; &gt;&gt; &g=
t; =C2=A0<br>&gt; &gt;&gt; &gt; =C2=A0/* Embedded.Processor Control */<br>&=
gt; &gt;&gt; &gt; ```<br>&gt; &gt;&gt; &gt;<br>&gt; &gt;&gt; &gt; And of ca=
use, the second patch fixes some problem, but also cause new problem,<br>&g=
t; &gt;&gt; &gt; how to implement these instruction properly?<br>&gt; &gt;&=
gt;<br>&gt; &gt;&gt; What are the new problems =C2=A0?<br>&gt; &gt;<br>&gt;=
 &gt;<br>&gt; &gt; Before this patch, VxWorks can working, but after this, =
VxWorks can not boot anymore.<br>&gt;<br>&gt; I suppose you did a bisect to=
 reach this patch.<br>&gt;<br>&gt; Which QEMU machine is impacted ? Which C=
PU ? What are the symptoms ?<br>&gt;<br>&gt; Did you try to run with -d exe=
c or -d in_asm to identify the exact<br>&gt; instruction ?<br>&gt;<br>&gt; =
From there, you could try to revert partially the patch above to<br>&gt; fi=
x the problem.<br>&gt;<br>&gt; Thanks,<br>&gt;<br>&gt; C.<br>&gt;<br>&gt;<b=
r>&gt;<br>QEMU 5.2.x, an e300 based machine ppc603 are impacted.<div>Here i=
s my fix, narrowed down to=C2=A0

MSR_TGPR and=C2=A0

MSR_ILE

</div><div>```</div><div>From 42ce41671f1e6c4dd44e6fb481bbda9df09320bd Mon =
Sep 17 00:00:00 2001<br>From: Yonggang Luo &lt;<a href=3D"mailto:luoyonggan=
g@gmail.com">luoyonggang@gmail.com</a>&gt;<br>Date: Sun, 10 Jan 2021 00:08:=
00 -0800<br>Subject: [PATCH] ppc: Fix rfi/rfid/hrfi/... emulation again<br>=
<br>This revert part mask bits for ppc603/ppc4x that disabled in =C2=A0a2e7=
1b28e832346409efc795ecd1f0a2bcb705a3.<br>Remove redundant macro MSR_BOOK3S_=
MASK.<br>Fixes boot VxWorks on e300<br><br>Signed-off-by: Yonggang Luo &lt;=
<a href=3D"mailto:luoyonggang@gmail.com">luoyonggang@gmail.com</a>&gt;<br>-=
--<br>=C2=A0target/ppc/excp_helper.c | 5 +++--<br>=C2=A01 file changed, 3 i=
nsertions(+), 2 deletions(-)<br><br>diff --git a/target/ppc/excp_helper.c b=
/target/ppc/excp_helper.c<br>index 1c48b9fdf6..df70c5a4e8 100644<br>--- a/t=
arget/ppc/excp_helper.c<br>+++ b/target/ppc/excp_helper.c<br>@@ -1156,8 +11=
56,10 @@ static inline void do_rfi(CPUPPCState *env, target_ulong nip, targ=
et_ulong msr)<br>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_cpu(en=
v);<br>=C2=A0<br>- =C2=A0 =C2=A0/* MSR:POW cannot be set by any form of rfi=
 */<br>+ =C2=A0 =C2=A0/* MSR:POW,TGPR,ILE cannot be set by any form of rfi =
*/<br>=C2=A0 =C2=A0 =C2=A0msr &amp;=3D ~(1ULL &lt;&lt; MSR_POW);<br>+ =C2=
=A0 =C2=A0msr &amp;=3D ~(1ULL &lt;&lt; MSR_TGPR);<br>+ =C2=A0 =C2=A0msr &am=
p;=3D ~(1ULL &lt;&lt; MSR_ILE);<br>=C2=A0<br>=C2=A0#if defined(TARGET_PPC64=
)<br>=C2=A0 =C2=A0 =C2=A0/* Switching to 32-bit ? Crop the nip */<br>@@ -11=
90,7 +1192,6 @@ void helper_rfi(CPUPPCState *env)<br>=C2=A0 =C2=A0 =C2=A0do=
_rfi(env, env-&gt;spr[SPR_SRR0], env-&gt;spr[SPR_SRR1] &amp; 0xfffffffful);=
<br>=C2=A0}<br>=C2=A0<br>-#define MSR_BOOK3S_MASK<br>=C2=A0#if defined(TARG=
ET_PPC64)<br>=C2=A0void helper_rfid(CPUPPCState *env)<br>=C2=A0{<br>-- <br>=
2.29.2.windows.3<br><br></div><div>```<br><br>--<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A=
<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo</div></div>

--000000000000014f3905b88d0f2f--

