Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 865B2225F7
	for <lists+qemu-devel@lfdr.de>; Sun, 19 May 2019 06:38:28 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43765 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSDad-0003Uu-Mn
	for lists+qemu-devel@lfdr.de; Sun, 19 May 2019 00:38:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44461)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hSDSr-0005xg-FV
	for qemu-devel@nongnu.org; Sun, 19 May 2019 00:30:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hSDEP-0004lI-87
	for qemu-devel@nongnu.org; Sun, 19 May 2019 00:15:30 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:35719)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hSDEP-0004kZ-2L
	for qemu-devel@nongnu.org; Sun, 19 May 2019 00:15:29 -0400
Received: by mail-pg1-x542.google.com with SMTP id t1so3735626pgc.2
	for <qemu-devel@nongnu.org>; Sat, 18 May 2019 21:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YfGVkAkAdchVmsbR1Bbtd6g0EjAyZZwmv0vuRe19lD0=;
	b=FGru2E7SYc23+VWoUthA8xDmW9nmauqdoaPvE9XDBBnGJW2+5oyUf3070ukwfKlsXb
	S9WzNoEsPzG1LNyfUWOd5nFRJ73GcSIKg9hETmdpodSNseE4CKCGsuRKLxxyfH2//zFg
	yUqZA5I+axRfaIwgVZYoZLksPXuIPx4iQA8oMKyDsPjG6BNANVpKNG1Ny0kM2xTZUTZ8
	ciAPNHKCgiPdcHeCPRB7ey9ftoTXD9CumlhVqlx5O3WBPay7WUCBzQjd9Nsjiluihvux
	UXkIOKv/PVOAuvp7+ieAU/F/MSMAo+q3sKEd9EuK0Q0k3zU+VCliD1vCYt6KURKMOUKO
	AJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YfGVkAkAdchVmsbR1Bbtd6g0EjAyZZwmv0vuRe19lD0=;
	b=razi8M7kqWpzMwNT8UoR1fwUFNIx8DOhlotQEtgvO0xQTNfly6/ejTSrlqZBbU6+iQ
	cHIB4xw8WGQ5ueZ5YuXk9BZiOelHhpYgNl7ZMEluP1n/fOm/iPZ6zu0ZkJSFeReLcoxd
	iRTxkBSwjLYielE83C3wvzXImbp+OpCYhSUHfqCIkqUsYnwr7FnNtnQdzC71frJse/QD
	wNj+tX6Nbv2WmG4em+V7w3jRDOmqEagWonODMsboWLRzbNuJwsKLTJBXWcR8mAf3YSM0
	iAKXMtugW7VhsH+MpnGoY9gls26WIRiSYWOHzyALJBTPwpznf4qFnMQfnQObUR2pBO37
	S+PA==
X-Gm-Message-State: APjAAAUNHB0xlaRLewpvYI/9DnS0DBW+6Kgd3CCtZIC1EPrMFqj+ukrS
	6bjpTlqGazaVZwEAf09NreMI/arMc6s=
X-Google-Smtp-Source: APXvYqx3mKLpnEU1tXm4of1yE0U8b/ehg1iYffQT+AkdN/WdS7DWNR+FG/+jrgJUcZ5mgAPKfh6IqA==
X-Received: by 2002:a63:5c4c:: with SMTP id n12mr68194711pgm.111.1558239327376;
	Sat, 18 May 2019 21:15:27 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231]) by smtp.gmail.com with ESMTPSA id
	k63sm19381200pfb.108.2019.05.18.21.15.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 May 2019 21:15:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 18 May 2019 21:15:17 -0700
Message-Id: <20190519041522.12327-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190519041522.12327-1-richard.henderson@linaro.org>
References: <20190519041522.12327-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-devel] [PATCH v4 2/7] tcg/ppc: Support vector shift by
 immediate
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: mark.cave-ayland@ilande.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For Altivec, this is done via vector shift by vector,
and loading the immediate into a register.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.h     |  2 +-
 tcg/ppc/tcg-target.inc.c | 58 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 57 insertions(+), 3 deletions(-)

diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index 368c250c6a..766706fd30 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -152,7 +152,7 @@ extern bool have_isa_3_00;
 #define TCG_TARGET_HAS_abs_vec          0
 #define TCG_TARGET_HAS_shi_vec          0
 #define TCG_TARGET_HAS_shs_vec          0
-#define TCG_TARGET_HAS_shv_vec          0
+#define TCG_TARGET_HAS_shv_vec          1
 #define TCG_TARGET_HAS_cmp_vec          1
 #define TCG_TARGET_HAS_mul_vec          0
 #define TCG_TARGET_HAS_sat_vec          1
diff --git a/tcg/ppc/tcg-target.inc.c b/tcg/ppc/tcg-target.inc.c
index 479e653da6..62a8c428e0 100644
--- a/tcg/ppc/tcg-target.inc.c
+++ b/tcg/ppc/tcg-target.inc.c
@@ -517,6 +517,16 @@ static int tcg_target_const_match(tcg_target_long val, TCGType type,
 #define VCMPGTUH   VX4(582)
 #define VCMPGTUW   VX4(646)
 
+#define VSLB       VX4(260)
+#define VSLH       VX4(324)
+#define VSLW       VX4(388)
+#define VSRB       VX4(516)
+#define VSRH       VX4(580)
+#define VSRW       VX4(644)
+#define VSRAB      VX4(772)
+#define VSRAH      VX4(836)
+#define VSRAW      VX4(900)
+
 #define VAND       VX4(1028)
 #define VANDC      VX4(1092)
 #define VNOR       VX4(1284)
@@ -2877,8 +2887,14 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_sssub_vec:
     case INDEX_op_usadd_vec:
     case INDEX_op_ussub_vec:
+    case INDEX_op_shlv_vec:
+    case INDEX_op_shrv_vec:
+    case INDEX_op_sarv_vec:
         return vece <= MO_32;
     case INDEX_op_cmp_vec:
+    case INDEX_op_shli_vec:
+    case INDEX_op_shri_vec:
+    case INDEX_op_sari_vec:
         return vece <= MO_32 ? -1 : 0;
     default:
         return 0;
@@ -2986,7 +3002,10 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         umin_op[4] = { VMINUB, VMINUH, VMINUW, 0 },
         smin_op[4] = { VMINSB, VMINSH, VMINSW, 0 },
         umax_op[4] = { VMAXUB, VMAXUH, VMAXUW, 0 },
-        smax_op[4] = { VMAXSB, VMAXSH, VMAXSW, 0 };
+        smax_op[4] = { VMAXSB, VMAXSH, VMAXSW, 0 },
+        shlv_op[4] = { VSLB, VSLH, VSLW, 0 },
+        shrv_op[4] = { VSRB, VSRH, VSRW, 0 },
+        sarv_op[4] = { VSRAB, VSRAH, VSRAW, 0 };
 
     TCGType type = vecl + TCG_TYPE_V64;
     TCGArg a0 = args[0], a1 = args[1], a2 = args[2];
@@ -3033,6 +3052,15 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_umax_vec:
         insn = umax_op[vece];
         break;
+    case INDEX_op_shlv_vec:
+        insn = shlv_op[vece];
+        break;
+    case INDEX_op_shrv_vec:
+        insn = shrv_op[vece];
+        break;
+    case INDEX_op_sarv_vec:
+        insn = sarv_op[vece];
+        break;
     case INDEX_op_and_vec:
         insn = VAND;
         break;
@@ -3077,6 +3105,18 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     tcg_out32(s, insn | VRT(a0) | VRA(a1) | VRB(a2));
 }
 
+static void expand_vec_shi(TCGType type, unsigned vece, TCGv_vec v0,
+                           TCGv_vec v1, TCGArg imm, TCGOpcode opci)
+{
+    TCGv_vec t1 = tcg_temp_new_vec(type);
+
+    /* Splat w/bytes for xxspltib.  */
+    tcg_gen_dupi_vec(MO_8, t1, imm & ((8 << vece) - 1));
+    vec_gen_3(opci, type, vece, tcgv_vec_arg(v0),
+              tcgv_vec_arg(v1), tcgv_vec_arg(t1));
+    tcg_temp_free_vec(t1);
+}
+
 static void expand_vec_cmp(TCGType type, unsigned vece, TCGv_vec v0,
                            TCGv_vec v1, TCGv_vec v2, TCGCond cond)
 {
@@ -3128,14 +3168,25 @@ void tcg_expand_vec_op(TCGOpcode opc, TCGType type, unsigned vece,
 {
     va_list va;
     TCGv_vec v0, v1, v2;
+    TCGArg a2;
 
     va_start(va, a0);
     v0 = temp_tcgv_vec(arg_temp(a0));
     v1 = temp_tcgv_vec(arg_temp(va_arg(va, TCGArg)));
-    v2 = temp_tcgv_vec(arg_temp(va_arg(va, TCGArg)));
+    a2 = va_arg(va, TCGArg);
 
     switch (opc) {
+    case INDEX_op_shli_vec:
+        expand_vec_shi(type, vece, v0, v1, a2, INDEX_op_shlv_vec);
+        break;
+    case INDEX_op_shri_vec:
+        expand_vec_shi(type, vece, v0, v1, a2, INDEX_op_shrv_vec);
+        break;
+    case INDEX_op_sari_vec:
+        expand_vec_shi(type, vece, v0, v1, a2, INDEX_op_sarv_vec);
+        break;
     case INDEX_op_cmp_vec:
+        v2 = temp_tcgv_vec(arg_temp(a2));
         expand_vec_cmp(type, vece, v0, v1, v2, va_arg(va, TCGArg));
         break;
     default:
@@ -3336,6 +3387,9 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_smin_vec:
     case INDEX_op_umax_vec:
     case INDEX_op_umin_vec:
+    case INDEX_op_shlv_vec:
+    case INDEX_op_shrv_vec:
+    case INDEX_op_sarv_vec:
         return &v_v_v;
     case INDEX_op_not_vec:
     case INDEX_op_dup_vec:
-- 
2.17.1


