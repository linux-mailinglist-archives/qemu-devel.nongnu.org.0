Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B795B2ED762
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 20:19:49 +0100 (CET)
Received: from localhost ([::1]:54752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxap2-00085V-Rk
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 14:19:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxajg-0005YB-RN; Thu, 07 Jan 2021 14:14:16 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:37473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxaje-000517-EJ; Thu, 07 Jan 2021 14:14:16 -0500
Received: by mail-lf1-x131.google.com with SMTP id o17so17203104lfg.4;
 Thu, 07 Jan 2021 11:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=LxWSjQwSCtTOrhjVFzV1KWoB9MXhmsVFQk7YBEnHuiU=;
 b=Ss+vcUqH9PFBrISKWitv+jkljkQgvJiml7L1Rp8dIhMiknDdX64ZLy1nmZfDwIYuVq
 kZEShePQFCtDd9J1GGYdQWmhon3glJ+6RIQcIcl390hnT18y38InJlh1AmM5wpwHcAIO
 o4CPin1rekvXf9j7v/J9acXJSorZZLYIiECA+N9iIeBJ2VY1osigUIc21kPpWyCGaDg/
 o7fSEHrTI8q3B/L7zf7VGA6fJanKVEtlyesEWADxKfLJ2JFUcnUuj71usbXGNV5AH+m/
 V1mDluHO/o3QQefo+Mlnpl4vmdV+3XtIigzCBc9Je1hgh2IK0BjVSWCQz3pukE6zzS84
 7MBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=LxWSjQwSCtTOrhjVFzV1KWoB9MXhmsVFQk7YBEnHuiU=;
 b=c+kQhgAyCNKvmAqk+MuT0uybNnRowUhuQUKpmMlW9pMeyTyORmWJ05+XqSvxkjMWbO
 T8XR9pO8OGzklRc8vcst3X0b5t57WRRLs/lY5aKEYkTE5AMG+g4hi4L//LACMrsQSVdj
 UJOanI0xQf3nMudXTQj9La7B3qal4X66p7mYMOGddh3mZ+pG9aCaSmYAlPWrqHQdZDbU
 2T8minzLVzqTQkRad9AEdCs7tz7+2G6JRXa5iMPkKk7aCPU2sHMGdp91WdBtYb6nSwC8
 CMTgbrM3sr/vzG99x4unj8WI+J+BAdZ03ReCDPAWI5dq5cmDv44ZcgRJDp7lUxW0tJui
 v8oQ==
X-Gm-Message-State: AOAM533cg6GFvQQgU4zzBrK+IDBE33b58NhSk5GbZZGbBLQWy7pSxNNu
 KiAhOtydNU9tvF6s0q7bWokRbLDtOIv6HPLneTjQba28VpaQ1A==
X-Google-Smtp-Source: ABdhPJzN6LAtk11UeRQZG2q1AHl1RSMtV8K+692nND1vbGjdrwGTUaI4bKa5aLFM8kvwDN+8KSkVmNEvjvH3PZruYU8=
X-Received: by 2002:a2e:9214:: with SMTP id k20mr4870230ljg.45.1610046851862; 
 Thu, 07 Jan 2021 11:14:11 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Thu, 7 Jan 2021 11:14:00 -0800
Message-ID: <CAE2XoE84K6vdQ23upRa1MaCNWSycUGKja9DrTpVCQ4bdY7bZuQ@mail.gmail.com>
Subject: What's the correct way to implement rfi and related instruction.
To: qemu-level <qemu-devel@nongnu.org>, qemu-ppc@nongnu.org, 
 David Gibson <david@gibson.dropbear.id.au>,
 Thomas Monjalon <thomas@monjalon.net>, agraf@suse.de, 
 Aurelien Jarno <aurelien@aurel32.net>
Content-Type: multipart/alternative; boundary="000000000000ad580305b8543eb7"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=luoyonggang@gmail.com; helo=mail-lf1-x131.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ad580305b8543eb7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is the first patch,:
It's store MSR bits differntly for different rfi instructions:
[Qemu-devel] [PATCH] target-ppc: fix RFI by clearing some bits of MSR
https://lists.gnu.org/archive/html/qemu-devel/2010-05/msg02999.html
Comes from  target-ppc: fix RFI by clearing some bits of MSR
SHA-1: c3d420ead1aee9fcfd12be11cbdf6b1620134773
 target-ppc/op_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
```
diff --git a/target-ppc/op_helper.c b/target-ppc/op_helper.c
index 8f2ee986bb..3c3aa60bc3 100644
--- a/target-ppc/op_helper.c
+++ b/target-ppc/op_helper.c
@@ -1646,20 +1646,20 @@ static inline void do_rfi(target_ulong nip,
target_ulong msr,
 void helper_rfi (void)
 {
     do_rfi(env->spr[SPR_SRR0], env->spr[SPR_SRR1],
-           ~((target_ulong)0x0), 1);
+           ~((target_ulong)0x783F0000), 1);
 }

 #if defined(TARGET_PPC64)
 void helper_rfid (void)
 {
     do_rfi(env->spr[SPR_SRR0], env->spr[SPR_SRR1],
-           ~((target_ulong)0x0), 0);
+           ~((target_ulong)0x783F0000), 0);
 }

 void helper_hrfid (void)
 {
     do_rfi(env->spr[SPR_HSRR0], env->spr[SPR_HSRR1],
-           ~((target_ulong)0x0), 0);
+           ~((target_ulong)0x783F0000), 0);
 }
 #endif
 #endif
```

This is the second patch,:
it's remove the parameter  `target_ulong msrm, int keep_msrh`
Comes from ppc: Fix rfi/rfid/hrfi/... emulation
SHA-1: a2e71b28e832346409efc795ecd1f0a2bcb705a3
```
 target-ppc/excp_helper.c | 51
+++++++++++++++++++-----------------------------
 1 file changed, 20 insertions(+), 31 deletions(-)

diff --git a/target-ppc/excp_helper.c b/target-ppc/excp_helper.c
index 30e960e30b..aa0b63f4b0 100644
--- a/target-ppc/excp_helper.c
+++ b/target-ppc/excp_helper.c
@@ -922,25 +922,20 @@ void helper_store_msr(CPUPPCState *env, target_ulong
val)
     }
 }

-static inline void do_rfi(CPUPPCState *env, target_ulong nip, target_ulong
msr,
-                          target_ulong msrm, int keep_msrh)
+static inline void do_rfi(CPUPPCState *env, target_ulong nip, target_ulong
msr)
 {
     CPUState *cs =3D CPU(ppc_env_get_cpu(env));

+    /* MSR:POW cannot be set by any form of rfi */
+    msr &=3D ~(1ULL << MSR_POW);
+
 #if defined(TARGET_PPC64)
-    if (msr_is_64bit(env, msr)) {
-        nip =3D (uint64_t)nip;
-        msr &=3D (uint64_t)msrm;
-    } else {
+    /* Switching to 32-bit ? Crop the nip */
+    if (!msr_is_64bit(env, msr)) {
         nip =3D (uint32_t)nip;
-        msr =3D (uint32_t)(msr & msrm);
-        if (keep_msrh) {
-            msr |=3D env->msr & ~((uint64_t)0xFFFFFFFF);
-        }
     }
 #else
     nip =3D (uint32_t)nip;
-    msr &=3D (uint32_t)msrm;
 #endif
     /* XXX: beware: this is false if VLE is supported */
     env->nip =3D nip & ~((target_ulong)0x00000003);
@@ -959,26 +954,24 @@ static inline void do_rfi(CPUPPCState *env,
target_ulong nip, target_ulong msr,

 void helper_rfi(CPUPPCState *env)
 {
-    if (env->excp_model =3D=3D POWERPC_EXCP_BOOKE) {
-        do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1],
-               ~((target_ulong)0), 0);
-    } else {
-        do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1],
-               ~((target_ulong)0x783F0000), 1);
-    }
+    do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1] & 0xfffffffful);
 }

+#define MSR_BOOK3S_MASK
 #if defined(TARGET_PPC64)
 void helper_rfid(CPUPPCState *env)
 {
-    do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1],
-           ~((target_ulong)0x783F0000), 0);
+    /* The architeture defines a number of rules for which bits
+     * can change but in practice, we handle this in hreg_store_msr()
+     * which will be called by do_rfi(), so there is no need to filter
+     * here
+     */
+    do_rfi(env, env->spr[SPR_SRR0], env->spr[SPR_SRR1]);
 }

 void helper_hrfid(CPUPPCState *env)
 {
-    do_rfi(env, env->spr[SPR_HSRR0], env->spr[SPR_HSRR1],
-           ~((target_ulong)0x783F0000), 0);
+    do_rfi(env, env->spr[SPR_HSRR0], env->spr[SPR_HSRR1]);
 }
 #endif

@@ -986,28 +979,24 @@ void helper_hrfid(CPUPPCState *env)
 /* Embedded PowerPC specific helpers */
 void helper_40x_rfci(CPUPPCState *env)
 {
-    do_rfi(env, env->spr[SPR_40x_SRR2], env->spr[SPR_40x_SRR3],
-           ~((target_ulong)0xFFFF0000), 0);
+    do_rfi(env, env->spr[SPR_40x_SRR2], env->spr[SPR_40x_SRR3]);
 }

 void helper_rfci(CPUPPCState *env)
 {
-    do_rfi(env, env->spr[SPR_BOOKE_CSRR0], env->spr[SPR_BOOKE_CSRR1],
-           ~((target_ulong)0), 0);
+    do_rfi(env, env->spr[SPR_BOOKE_CSRR0], env->spr[SPR_BOOKE_CSRR1]);
 }

 void helper_rfdi(CPUPPCState *env)
 {
     /* FIXME: choose CSRR1 or DSRR1 based on cpu type */
-    do_rfi(env, env->spr[SPR_BOOKE_DSRR0], env->spr[SPR_BOOKE_DSRR1],
-           ~((target_ulong)0), 0);
+    do_rfi(env, env->spr[SPR_BOOKE_DSRR0], env->spr[SPR_BOOKE_DSRR1]);
 }

 void helper_rfmci(CPUPPCState *env)
 {
     /* FIXME: choose CSRR1 or MCSRR1 based on cpu type */
-    do_rfi(env, env->spr[SPR_BOOKE_MCSRR0], env->spr[SPR_BOOKE_MCSRR1],
-           ~((target_ulong)0), 0);
+    do_rfi(env, env->spr[SPR_BOOKE_MCSRR0], env->spr[SPR_BOOKE_MCSRR1]);
 }
 #endif

@@ -1045,7 +1034,7 @@ void helper_td(CPUPPCState *env, target_ulong arg1,
target_ulong arg2,

 void helper_rfsvc(CPUPPCState *env)
 {
-    do_rfi(env, env->lr, env->ctr, 0x0000FFFF, 0);
+    do_rfi(env, env->lr, env->ctr & 0x0000FFFF);
 }

 /* Embedded.Processor Control */
```

And of cause, the second patch fixes some problem, but also cause new
problem, how to implement these instruction properly?



--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000ad580305b8543eb7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is the first patch,:<br>It&#39;s store MSR bits diffe=
rntly for different rfi instructions:<br>[Qemu-devel] [PATCH] target-ppc: f=
ix RFI by clearing some bits of MSR<br><a href=3D"https://lists.gnu.org/arc=
hive/html/qemu-devel/2010-05/msg02999.html">https://lists.gnu.org/archive/h=
tml/qemu-devel/2010-05/msg02999.html</a><br>Comes from =C2=A0target-ppc: fi=
x RFI by clearing some bits of MSR<br>SHA-1: c3d420ead1aee9fcfd12be11cbdf6b=
1620134773<br>=C2=A0target-ppc/op_helper.c | 6 +++---<br>=C2=A01 file chang=
ed, 3 insertions(+), 3 deletions(-)<br>```<br>diff --git a/target-ppc/op_he=
lper.c b/target-ppc/op_helper.c<br>index 8f2ee986bb..3c3aa60bc3 100644<br>-=
-- a/target-ppc/op_helper.c<br>+++ b/target-ppc/op_helper.c<br>@@ -1646,20 =
+1646,20 @@ static inline void do_rfi(target_ulong nip, target_ulong msr,<b=
r>=C2=A0void helper_rfi (void)<br>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0do_rfi(env=
-&gt;spr[SPR_SRR0], env-&gt;spr[SPR_SRR1],<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ~((target_ulong)0x0), 1);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~=
((target_ulong)0x783F0000), 1);<br>=C2=A0}<br>=C2=A0<br>=C2=A0#if defined(T=
ARGET_PPC64)<br>=C2=A0void helper_rfid (void)<br>=C2=A0{<br>=C2=A0 =C2=A0 =
=C2=A0do_rfi(env-&gt;spr[SPR_SRR0], env-&gt;spr[SPR_SRR1],<br>- =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ~((target_ulong)0x0), 0);<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ~((target_ulong)0x783F0000), 0);<br>=C2=A0}<br>=C2=A0<br>=
=C2=A0void helper_hrfid (void)<br>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0do_rfi(env=
-&gt;spr[SPR_HSRR0], env-&gt;spr[SPR_HSRR1],<br>- =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ~((target_ulong)0x0), 0);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ~((target_ulong)0x783F0000), 0);<br>=C2=A0}<br>=C2=A0#endif<br>=C2=A0#e=
ndif<br>```<div><br>This is the second patch,:<br>it&#39;s remove the param=
eter =C2=A0`target_ulong msrm, int keep_msrh`<br>Comes from ppc: Fix rfi/rf=
id/hrfi/... emulation<br>SHA-1: a2e71b28e832346409efc795ecd1f0a2bcb705a3<br=
>```<br>=C2=A0target-ppc/excp_helper.c | 51 +++++++++++++++++++------------=
-----------------<br>=C2=A01 file changed, 20 insertions(+), 31 deletions(-=
)<br><br>diff --git a/target-ppc/excp_helper.c b/target-ppc/excp_helper.c<b=
r>index 30e960e30b..aa0b63f4b0 100644<br>--- a/target-ppc/excp_helper.c<br>=
+++ b/target-ppc/excp_helper.c<br>@@ -922,25 +922,20 @@ void helper_store_m=
sr(CPUPPCState *env, target_ulong val)<br>=C2=A0 =C2=A0 =C2=A0}<br>=C2=A0}<=
br>=C2=A0<br>-static inline void do_rfi(CPUPPCState *env, target_ulong nip,=
 target_ulong msr,<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong msrm, int keep_msrh)<=
br>+static inline void do_rfi(CPUPPCState *env, target_ulong nip, target_ul=
ong msr)<br>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D CPU(ppc_env_get=
_cpu(env));<br>=C2=A0<br>+ =C2=A0 =C2=A0/* MSR:POW cannot be set by any for=
m of rfi */<br>+ =C2=A0 =C2=A0msr &amp;=3D ~(1ULL &lt;&lt; MSR_POW);<br>+<b=
r>=C2=A0#if defined(TARGET_PPC64)<br>- =C2=A0 =C2=A0if (msr_is_64bit(env, m=
sr)) {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0nip =3D (uint64_t)nip;<br>- =C2=A0 =
=C2=A0 =C2=A0 =C2=A0msr &amp;=3D (uint64_t)msrm;<br>- =C2=A0 =C2=A0} else {=
<br>+ =C2=A0 =C2=A0/* Switching to 32-bit ? Crop the nip */<br>+ =C2=A0 =C2=
=A0if (!msr_is_64bit(env, msr)) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nip =
=3D (uint32_t)nip;<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0msr =3D (uint32_t)(msr &=
amp; msrm);<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0if (keep_msrh) {<br>- =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msr |=3D env-&gt;msr &amp; ~((uint64_t)0x=
FFFFFFFF);<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>=C2=A0 =C2=A0 =C2=A0}<br>=
=C2=A0#else<br>=C2=A0 =C2=A0 =C2=A0nip =3D (uint32_t)nip;<br>- =C2=A0 =C2=
=A0msr &amp;=3D (uint32_t)msrm;<br>=C2=A0#endif<br>=C2=A0 =C2=A0 =C2=A0/* X=
XX: beware: this is false if VLE is supported */<br>=C2=A0 =C2=A0 =C2=A0env=
-&gt;nip =3D nip &amp; ~((target_ulong)0x00000003);<br>@@ -959,26 +954,24 @=
@ static inline void do_rfi(CPUPPCState *env, target_ulong nip, target_ulon=
g msr,<br>=C2=A0<br>=C2=A0void helper_rfi(CPUPPCState *env)<br>=C2=A0{<br>-=
 =C2=A0 =C2=A0if (env-&gt;excp_model =3D=3D POWERPC_EXCP_BOOKE) {<br>- =C2=
=A0 =C2=A0 =C2=A0 =C2=A0do_rfi(env, env-&gt;spr[SPR_SRR0], env-&gt;spr[SPR_=
SRR1],<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~((target_ulon=
g)0), 0);<br>- =C2=A0 =C2=A0} else {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0do_rfi=
(env, env-&gt;spr[SPR_SRR0], env-&gt;spr[SPR_SRR1],<br>- =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~((target_ulong)0x783F0000), 1);<br>- =C2=
=A0 =C2=A0}<br>+ =C2=A0 =C2=A0do_rfi(env, env-&gt;spr[SPR_SRR0], env-&gt;sp=
r[SPR_SRR1] &amp; 0xfffffffful);<br>=C2=A0}<br>=C2=A0<br>+#define MSR_BOOK3=
S_MASK<br>=C2=A0#if defined(TARGET_PPC64)<br>=C2=A0void helper_rfid(CPUPPCS=
tate *env)<br>=C2=A0{<br>- =C2=A0 =C2=A0do_rfi(env, env-&gt;spr[SPR_SRR0], =
env-&gt;spr[SPR_SRR1],<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~((target_ul=
ong)0x783F0000), 0);<br>+ =C2=A0 =C2=A0/* The architeture defines a number =
of rules for which bits<br>+ =C2=A0 =C2=A0 * can change but in practice, we=
 handle this in hreg_store_msr()<br>+ =C2=A0 =C2=A0 * which will be called =
by do_rfi(), so there is no need to filter<br>+ =C2=A0 =C2=A0 * here<br>+ =
=C2=A0 =C2=A0 */<br>+ =C2=A0 =C2=A0do_rfi(env, env-&gt;spr[SPR_SRR0], env-&=
gt;spr[SPR_SRR1]);<br>=C2=A0}<br>=C2=A0<br>=C2=A0void helper_hrfid(CPUPPCSt=
ate *env)<br>=C2=A0{<br>- =C2=A0 =C2=A0do_rfi(env, env-&gt;spr[SPR_HSRR0], =
env-&gt;spr[SPR_HSRR1],<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~((target_u=
long)0x783F0000), 0);<br>+ =C2=A0 =C2=A0do_rfi(env, env-&gt;spr[SPR_HSRR0],=
 env-&gt;spr[SPR_HSRR1]);<br>=C2=A0}<br>=C2=A0#endif<br>=C2=A0<br>@@ -986,2=
8 +979,24 @@ void helper_hrfid(CPUPPCState *env)<br>=C2=A0/* Embedded Power=
PC specific helpers */<br>=C2=A0void helper_40x_rfci(CPUPPCState *env)<br>=
=C2=A0{<br>- =C2=A0 =C2=A0do_rfi(env, env-&gt;spr[SPR_40x_SRR2], env-&gt;sp=
r[SPR_40x_SRR3],<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~((target_ulong)0x=
FFFF0000), 0);<br>+ =C2=A0 =C2=A0do_rfi(env, env-&gt;spr[SPR_40x_SRR2], env=
-&gt;spr[SPR_40x_SRR3]);<br>=C2=A0}<br>=C2=A0<br>=C2=A0void helper_rfci(CPU=
PPCState *env)<br>=C2=A0{<br>- =C2=A0 =C2=A0do_rfi(env, env-&gt;spr[SPR_BOO=
KE_CSRR0], env-&gt;spr[SPR_BOOKE_CSRR1],<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ~((target_ulong)0), 0);<br>+ =C2=A0 =C2=A0do_rfi(env, env-&gt;spr[SP=
R_BOOKE_CSRR0], env-&gt;spr[SPR_BOOKE_CSRR1]);<br>=C2=A0}<br>=C2=A0<br>=C2=
=A0void helper_rfdi(CPUPPCState *env)<br>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0/* =
FIXME: choose CSRR1 or DSRR1 based on cpu type */<br>- =C2=A0 =C2=A0do_rfi(=
env, env-&gt;spr[SPR_BOOKE_DSRR0], env-&gt;spr[SPR_BOOKE_DSRR1],<br>- =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~((target_ulong)0), 0);<br>+ =C2=A0 =C2=A0d=
o_rfi(env, env-&gt;spr[SPR_BOOKE_DSRR0], env-&gt;spr[SPR_BOOKE_DSRR1]);<br>=
=C2=A0}<br>=C2=A0<br>=C2=A0void helper_rfmci(CPUPPCState *env)<br>=C2=A0{<b=
r>=C2=A0 =C2=A0 =C2=A0/* FIXME: choose CSRR1 or MCSRR1 based on cpu type */=
<br>- =C2=A0 =C2=A0do_rfi(env, env-&gt;spr[SPR_BOOKE_MCSRR0], env-&gt;spr[S=
PR_BOOKE_MCSRR1],<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~((target_ulong)0=
), 0);<br>+ =C2=A0 =C2=A0do_rfi(env, env-&gt;spr[SPR_BOOKE_MCSRR0], env-&gt=
;spr[SPR_BOOKE_MCSRR1]);<br>=C2=A0}<br>=C2=A0#endif<br>=C2=A0<br>@@ -1045,7=
 +1034,7 @@ void helper_td(CPUPPCState *env, target_ulong arg1, target_ulon=
g arg2,<br>=C2=A0<br>=C2=A0void helper_rfsvc(CPUPPCState *env)<br>=C2=A0{<b=
r>- =C2=A0 =C2=A0do_rfi(env, env-&gt;lr, env-&gt;ctr, 0x0000FFFF, 0);<br>+ =
=C2=A0 =C2=A0do_rfi(env, env-&gt;lr, env-&gt;ctr &amp; 0x0000FFFF);<br>=C2=
=A0}<br>=C2=A0<br>=C2=A0/* Embedded.Processor Control */<br>```</div><div><=
br></div><div>And of cause, the second patch fixes some problem, but also c=
ause new problem, how to implement these instruction properly?</div><div><b=
r></div><div><br></div><div><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E6=
=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=
=A0 =C2=A0 sincerely,<br>Yonggang Luo<br></div></div>

--000000000000ad580305b8543eb7--

