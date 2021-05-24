Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE1038E1E9
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 09:45:57 +0200 (CEST)
Received: from localhost ([::1]:35932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll5Hg-0001dh-46
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 03:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sendtozouxu@gmail.com>)
 id 1ll5Gs-0000tJ-2L
 for qemu-devel@nongnu.org; Mon, 24 May 2021 03:45:06 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:44571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sendtozouxu@gmail.com>)
 id 1ll5Gp-0001Cm-RG
 for qemu-devel@nongnu.org; Mon, 24 May 2021 03:45:05 -0400
Received: by mail-lj1-x244.google.com with SMTP id s25so32329495ljo.11
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 00:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=9St9gDR6dhSzX/GMKzChsblB8hRjAFJkdD2SKYDJakM=;
 b=O3WrMIWBLqa3VT15Z/+Tp6kQm+1Krs7CCEx8WhYN0+R6vHIwgVFWjY8Uya1ekeYzWi
 4+Llx9MsTh4++UTF12fDRoPA0y6HNaypumMmayX0ZhWP51acvQPb5h+fwBK4qGFCXPa9
 LiOWEFuWD8O3ZhraHa5AXa0msWhUVIAsZXX31reRwCDyz0rERrKG5Okzm4gamvhoMXCv
 tBKXmA+T3Nt9pXXLvfNC5Zj/VV+1cyrBa7ztydqCab1q7NvKdB7bGs0iNkpawre/mgvw
 UGBWA+VavbAwzUI7YLyv/PL2CPKEkUoB/FtY5Wyi4kKLamYs/vbNjo5bm65di6mBetri
 muQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=9St9gDR6dhSzX/GMKzChsblB8hRjAFJkdD2SKYDJakM=;
 b=p7XzqrnKneOW539AxUAB3k/jXas9Y1jqmcc0xDztFT9QF8+jUmJHI0niV1rnBLHN02
 xYDmt3Uw7BPY75yoSPq/4CY+5jv5IOrQdDXYaprf5ntarJjGDQIJbesi1zRwdjtOv+Tj
 RacunA1/46ydK+aS/DLIcMvaDTDnc4E6AQdohmKfprIeQ2ciTtYy5ndetHkQbFlJAVlr
 AsU60XHCgfaWhr09sp+2yZ4qBIrV086+KCv2b7iUTIWn7VE49lWZAobw/BWAOlQ69lAx
 r0d1ndj2oXIEUGWOdEg1SzRIxL+m3HdzvZvFfo5M59IV9YjhXZMr22SwNdR+fXV8C9Jz
 QVxg==
X-Gm-Message-State: AOAM530C/SmQSHAZUPGKY7TWNsp5yWE18SryyzOChUb9vEjl73ZtbG4q
 VdtLexoTL6MqHqq0fNFKZyJiO5ih/uU+xR/wZEFJkNbrtLdRgw==
X-Google-Smtp-Source: ABdhPJzhk3mQ75IupAwZ1JXNt9yID8jM33TxgsWc7rgT5IScMsjCq9BDv7s7+MlSWU0qJK85PAJ/NiIcv5Ivu8GBPss=
X-Received: by 2002:a2e:b8d5:: with SMTP id s21mr15594012ljp.163.1621842300969; 
 Mon, 24 May 2021 00:45:00 -0700 (PDT)
MIME-Version: 1.0
From: Xu Zou <sendtozouxu@gmail.com>
Date: Mon, 24 May 2021 15:44:49 +0800
Message-ID: <CAK8YQrX9uRp904ddUZYu2t=i9HwAkt3cCCMxrMf4gJW1agD=ig@mail.gmail.com>
Subject: [PATCH] linux-user: Handle EXCP10_COPR properly for i386
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000003b256305c30e969d"
Received-SPF: pass client-ip=2a00:1450:4864:20::244;
 envelope-from=sendtozouxu@gmail.com; helo=mail-lj1-x244.google.com
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
Cc: laurent@vivier.eu, Xu Zou <sendtozouxu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003b256305c30e969d
Content-Type: text/plain; charset="UTF-8"

From e55f890c11aea6e28e4b3cd5ef7f2496775f2a43 Mon Sep 17 00:00:00 2001
From: Xu Zou <sendtozouxu@gmail.com>
Date: Mon, 24 May 2021 09:43:54 +0800
Subject: [PATCH] linux-user: Handle EXCP10_COPR properly for i386

Handle EXCP10_COPR properly for i386 in cpu loop.

NE flag is set to select the native mode for handling floating-point
exceptions. FWAIT instruction can raise EXCP10_COPR exception by using
fpu_raise_exception() function.

The code is based on kernel's function fpu__exception_code() in
arch/x86/kernel/fpu/core.c.

Signed-off-by: Xu Zou <sendtozouxu@gmail.com>
---
 linux-user/i386/cpu_loop.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index f813e87294..e1f2911554 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -199,6 +199,8 @@ void cpu_loop(CPUX86State *env)
 {
     CPUState *cs = env_cpu(env);
     int trapnr;
+    int si_code;
+    uint8_t status;
     abi_ulong pc;
     abi_ulong ret;

@@ -315,6 +317,28 @@ void cpu_loop(CPUX86State *env)
         case EXCP_ATOMIC:
             cpu_exec_step_atomic(cs);
             break;
+        case EXCP10_COPR:
+            si_code = 0;
+            status = env->fp_status.float_exception_flags;
+            if (status & float_flag_invalid) {
+                si_code = TARGET_FPE_FLTINV;
+            }
+            if (status & float_flag_divbyzero) {
+                si_code = TARGET_FPE_FLTDIV;
+            }
+            if (status & float_flag_overflow) {
+                si_code = TARGET_FPE_FLTOVF;
+            }
+            if ((status & float_flag_underflow) ||
+                (status & float_flag_input_denormal) ||
+                (status & float_flag_output_denormal)) {
+                si_code = TARGET_FPE_FLTUND;
+            }
+            if (status & float_flag_inexact) {
+                si_code = TARGET_FPE_FLTRES;
+            }
+            gen_signal(env, TARGET_SIGFPE, si_code, env->eip);
+            break;
         default:
             pc = env->segs[R_CS].base + env->eip;
             EXCP_DUMP(env, "qemu: 0x%08lx: unhandled CPU exception 0x%x -
aborting\n",
@@ -327,7 +351,7 @@ void cpu_loop(CPUX86State *env)

 void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
 {
-    env->cr[0] = CR0_PG_MASK | CR0_WP_MASK | CR0_PE_MASK;
+    env->cr[0] = CR0_PG_MASK | CR0_WP_MASK | CR0_PE_MASK | CR0_NE_MASK;
     env->hflags |= HF_PE_MASK | HF_CPL_MASK;
     if (env->features[FEAT_1_EDX] & CPUID_SSE) {
         env->cr[4] |= CR4_OSFXSR_MASK;
-- 
2.25.1

--0000000000003b256305c30e969d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">From e55f890c11aea6e28e4b3cd5ef7f2496775f2a43 Mon Sep 17 0=
0:00:00 2001<br>From: Xu Zou &lt;<a href=3D"mailto:sendtozouxu@gmail.com">s=
endtozouxu@gmail.com</a>&gt;<br>Date: Mon, 24 May 2021 09:43:54 +0800<br>Su=
bject: [PATCH] linux-user: Handle EXCP10_COPR properly for i386<br><br>Hand=
le EXCP10_COPR properly for i386 in cpu loop.<br><br>NE flag is set to sele=
ct the native mode for handling floating-point<br>exceptions. FWAIT instruc=
tion can raise EXCP10_COPR exception by using<br>fpu_raise_exception() func=
tion.<br><br>The code is based on kernel&#39;s function fpu__exception_code=
() in<br>arch/x86/kernel/fpu/core.c.<br><br>Signed-off-by: Xu Zou &lt;<a hr=
ef=3D"mailto:sendtozouxu@gmail.com">sendtozouxu@gmail.com</a>&gt;<br>---<br=
>=C2=A0linux-user/i386/cpu_loop.c | 26 +++++++++++++++++++++++++-<br>=C2=A0=
1 file changed, 25 insertions(+), 1 deletion(-)<br><br>diff --git a/linux-u=
ser/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c<br>index f813e87294..e1f29=
11554 100644<br>--- a/linux-user/i386/cpu_loop.c<br>+++ b/linux-user/i386/c=
pu_loop.c<br>@@ -199,6 +199,8 @@ void cpu_loop(CPUX86State *env)<br>=C2=A0{=
<br>=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_cpu(env);<br>=C2=A0 =C2=A0 =C2=
=A0int trapnr;<br>+ =C2=A0 =C2=A0int si_code;<br>+ =C2=A0 =C2=A0uint8_t sta=
tus;<br>=C2=A0 =C2=A0 =C2=A0abi_ulong pc;<br>=C2=A0 =C2=A0 =C2=A0abi_ulong =
ret;<br>=C2=A0<br>@@ -315,6 +317,28 @@ void cpu_loop(CPUX86State *env)<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case EXCP_ATOMIC:<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu_exec_step_atomic(cs);<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0case =
EXCP10_COPR:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0si_code =3D 0;<b=
r>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D env-&gt;fp_status.f=
loat_exception_flags;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sta=
tus &amp; float_flag_invalid) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0si_code =3D TARGET_FPE_FLTINV;<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sta=
tus &amp; float_flag_divbyzero) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0si_code =3D TARGET_FPE_FLTDIV;<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if =
(status &amp; float_flag_overflow) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0si_code =3D TARGET_FPE_FLTOVF;<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
if ((status &amp; float_flag_underflow) ||<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0(status &amp; float_flag_input_denormal) ||<br>=
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(status &amp; floa=
t_flag_output_denormal)) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0si_code =3D TARGET_FPE_FLTUND;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (status=
 &amp; float_flag_inexact) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0si_code =3D TARGET_FPE_FLTRES;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_signal=
(env, TARGET_SIGFPE, si_code, env-&gt;eip);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0break;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pc =3D env-&gt;segs[R_CS].b=
ase + env-&gt;eip;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EXCP_=
DUMP(env, &quot;qemu: 0x%08lx: unhandled CPU exception 0x%x - aborting\n&qu=
ot;,<br>@@ -327,7 +351,7 @@ void cpu_loop(CPUX86State *env)<br>=C2=A0<br>=
=C2=A0void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *r=
egs)<br>=C2=A0{<br>- =C2=A0 =C2=A0env-&gt;cr[0] =3D CR0_PG_MASK | CR0_WP_MA=
SK | CR0_PE_MASK;<br>+ =C2=A0 =C2=A0env-&gt;cr[0] =3D CR0_PG_MASK | CR0_WP_=
MASK | CR0_PE_MASK | CR0_NE_MASK;<br>=C2=A0 =C2=A0 =C2=A0env-&gt;hflags |=
=3D HF_PE_MASK | HF_CPL_MASK;<br>=C2=A0 =C2=A0 =C2=A0if (env-&gt;features[F=
EAT_1_EDX] &amp; CPUID_SSE) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;=
cr[4] |=3D CR4_OSFXSR_MASK;<br>-- <br>2.25.1<br><br></div>

--0000000000003b256305c30e969d--

