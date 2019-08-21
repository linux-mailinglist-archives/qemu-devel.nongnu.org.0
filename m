Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 434F898256
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 20:06:44 +0200 (CEST)
Received: from localhost ([::1]:51498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0V0M-0006LI-P2
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 14:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40955)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jan.bobek@gmail.com>) id 1i0URF-00013z-8z
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:30:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1i0URE-0007Qp-A7
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:30:25 -0400
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:35302)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1i0URE-0007PI-5x
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:30:24 -0400
Received: by mail-yb1-xb43.google.com with SMTP id c9so1353244ybf.2
 for <qemu-devel@nongnu.org>; Wed, 21 Aug 2019 10:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q98AimDtwVY381Wbpacj9E/FBb8VmamvTK/57HXfzu4=;
 b=GcGbpCAyVf+Q4NMS+Gshz1tQEJLuTWS6wNY2JMHoPTnxMv2j+6qWpXa53yVUrQLVIb
 zgsltgVInfnTObgfJCXKj2YY9z3y2A6KJfCnTQNU+5LcMR8kMB4rNmL2jqomyVEAaOaT
 Hn7iec+E2R+VRs5bxLUw33H1RBlvT65SP2lUQOy4v8gZd8YRVR3J4zZo50i4Az2kKELB
 8DoFmH4WiuXpstkoUcq3vs/nYNOyiFC58wfat1PlGbegRW2bYVGYerAYBginThWmcAh7
 U2W4sY4epd/37dA9JP6xmSLfR0jnwqF+WNw0x3irtM54V9gBn/UCBJAcl4DY6tX9RMW0
 Wsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q98AimDtwVY381Wbpacj9E/FBb8VmamvTK/57HXfzu4=;
 b=tqJg1Xjm86Hwj926V0EF8O9WjqwDqobhBadgKWvT7stbupowsxk0+mDwKEIUunnQDR
 U5H4UkvyJQ/89np0fVsseUyI1q69Ar/nnDRojIlzyosG+oUeeB8IJztTMTfVdChTOP6T
 JHXslEniXNIpEd8T3D4c2S3OF/N+vr/tLXV+F+38AFd70E9CxnjhFsPsB2LOLTGLwFb2
 vbsL/sFy2p/e+9UTSiegmnz3nnLB09lhsp0AjS2HVhEkRAUEl7cOVURXwuXzpQUYrThU
 IpvPaqjWjRtc/ye8gfxyjtbVwiq/kWS8++cHNBd4hogGMbMIiftGJMQvVXPzQRwqnsUw
 +s2Q==
X-Gm-Message-State: APjAAAWVP6giffHXV4jfQWM6ftU2gHyfr7i/m5gKzwqPGHPpM0AX/9fV
 tDQaECALCCFuh2EmsEJoELFvn2cJ
X-Google-Smtp-Source: APXvYqyZo9/AWGRAVj8NIWrUtiatkx3Zjsl5MyUcFttI3zgVZ/ZZdxk2x/05s/8851/xD2/JYpTF7A==
X-Received: by 2002:a25:7005:: with SMTP id l5mr25780274ybc.452.1566408623303; 
 Wed, 21 Aug 2019 10:30:23 -0700 (PDT)
Received: from localhost.localdomain ([2601:c0:c67f:e390::3])
 by smtp.gmail.com with ESMTPSA id l71sm2826167ywl.39.2019.08.21.10.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 10:30:22 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 21 Aug 2019 13:28:59 -0400
Message-Id: <20190821172951.15333-24-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821172951.15333-1-jan.bobek@gmail.com>
References: <20190821172951.15333-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b43
Subject: [Qemu-devel] [RFC PATCH v4 23/75] target/i386: introduce operands
 for decoding modrm fields
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
Cc: Jan Bobek <jan.bobek@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The old code uses bitshifts and bitwise-and all over the place for
decoding ModR/M fields. Avoid doing that by introducing proper
decoding operands.

Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
---
 target/i386/translate.c | 62 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index a0a9f64ff3..b3b316d389 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -4791,6 +4791,68 @@ INSNOP_FINALIZE(modrm)
 {
 }
 
+/*
+ * modrm_mod
+ *
+ * Operand whose value is the MOD field of the ModR/M byte.
+ */
+typedef int insnop_arg_t(modrm_mod);
+typedef struct {} insnop_ctxt_t(modrm_mod);
+
+INSNOP_INIT(modrm_mod)
+{
+    return true;
+}
+INSNOP_PREPARE(modrm_mod)
+{
+    return (modrm >> 6) & 3;
+}
+INSNOP_FINALIZE(modrm_mod)
+{
+}
+
+/*
+ * modrm_reg
+ *
+ * Operand whose value is the REG field of the ModR/M byte, extended
+ * with the REX.R bit if REX prefix is present.
+ */
+typedef int insnop_arg_t(modrm_reg);
+typedef struct {} insnop_ctxt_t(modrm_reg);
+
+INSNOP_INIT(modrm_reg)
+{
+    return true;
+}
+INSNOP_PREPARE(modrm_reg)
+{
+    return ((modrm >> 3) & 7) | REX_R(s);
+}
+INSNOP_FINALIZE(modrm_reg)
+{
+}
+
+/*
+ * modrm_rm
+ *
+ * Operand whose value is the RM field of the ModR/M byte, extended
+ * with the REX.B bit if REX prefix is present.
+ */
+typedef int insnop_arg_t(modrm_rm);
+typedef struct {} insnop_ctxt_t(modrm_rm);
+
+INSNOP_INIT(modrm_rm)
+{
+    return true;
+}
+INSNOP_PREPARE(modrm_rm)
+{
+    return (modrm & 7) | REX_B(s);
+}
+INSNOP_FINALIZE(modrm_rm)
+{
+}
+
 static void gen_sse_ng(CPUX86State *env, DisasContext *s, int b)
 {
     enum {
-- 
2.20.1


