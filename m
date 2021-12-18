Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6014479C6C
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 20:50:42 +0100 (CET)
Received: from localhost ([::1]:59178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myfj8-0004jw-1t
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 14:50:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbi-0000lT-Rc
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:43:02 -0500
Received: from [2607:f8b0:4864:20::42d] (port=39705
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myfbh-0003Tv-6L
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 14:43:02 -0500
Received: by mail-pf1-x42d.google.com with SMTP id i12so5122753pfd.6
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 11:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=3BxDKbNZOJjvmRbureJbaNIxOWOPVaowITK+Wk22ZVM=;
 b=S1VICXGiXSUyblBwipYqvnb295RiJ4w7Vha8xum/F29iOEKs15BeW5nLG4R6u59Rct
 h5DhI885GDUihPTls94xmJPDjWBeXTXRhxevRFJKyDvENflKJXhMwQEKnV1kE5UPmdDy
 /BQgSBVprkdfoxESdGEey18WkgE1Qzhb9tYJMocEGVymNNOi37pjUSFHCDi9RVN7ZMEv
 GH6I/41K7w2dIVMqqlj5UDlsM4FhSMzfdCmjHAgp3D+E4v0BZzgtQUmtQhBcGrlXb/ZK
 /e1rJVO4bOrpVsvcSRQ1jNg/POCJch+mxb5tsGgyEOaZkIgCroiUEMQwSenJLDcq9asC
 mixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3BxDKbNZOJjvmRbureJbaNIxOWOPVaowITK+Wk22ZVM=;
 b=NrGseg7JC9JtZQ5hLCnHM8CsycmI2TKHdfVX2YgJJOFvZYmfMRqQDA6cWa/iGPw2iE
 BYrqEQ27nhGI1jeGpnIUgbVfWt9VGbizfN0Sv7KuFrUwljc7N63AjtSRSTBvr9FgdjNt
 QXpQ7FJcP5RzBtuUB2pcv9l0o0emTZjeemY1r9CoGzx54YOBGw3QC+/mFYMnYOg9vHND
 ePndgBOFAXreD62l8ZlOWNRVqEV+VpuZ3qYkqHjtmF4xB/OGYjLUPvpYbIJCrghVF1FW
 bVjHa5rbwz39B3BaDoRpRB2/97s/VarbfAWPnBsS4wENLyJ84aiYMFxg0RAY2RK1QuNg
 0JCA==
X-Gm-Message-State: AOAM531pZlbCvqADrEnKOzN8fT09p/XqWaA51uEOqZ0XDhIwR/NQ3o81
 M94wXR5OTEYiQpGKV+gox+GstYUydNfkHQ==
X-Google-Smtp-Source: ABdhPJwdngY7oCmEFrkTwbV8swXZ03lbfZUhltMvq7DaaVvuLFdD3Dd5Kv2gz/f61zVk/1UyHa/2WQ==
X-Received: by 2002:a05:6a00:198c:b0:4a4:e75f:75cb with SMTP id
 d12-20020a056a00198c00b004a4e75f75cbmr8627225pfl.38.1639856579860; 
 Sat, 18 Dec 2021 11:42:59 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id g19sm10645919pfc.145.2021.12.18.11.42.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 11:42:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/20] tcg/i386: Support avx512vbmi2 vector shift-double
 instructions
Date: Sat, 18 Dec 2021 11:42:43 -0800
Message-Id: <20211218194250.247633-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211218194250.247633-1-richard.henderson@linaro.org>
References: <20211218194250.247633-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

We will use VPSHLD, VPSHLDV and VPSHRDV for 16-bit rotates.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target-con-set.h |  1 +
 tcg/i386/tcg-target.opc.h     |  3 +++
 tcg/i386/tcg-target.c.inc     | 38 +++++++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/tcg/i386/tcg-target-con-set.h b/tcg/i386/tcg-target-con-set.h
index 78774d1005..91ceb0e1da 100644
--- a/tcg/i386/tcg-target-con-set.h
+++ b/tcg/i386/tcg-target-con-set.h
@@ -45,6 +45,7 @@ C_O1_I2(r, r, rI)
 C_O1_I2(x, x, x)
 C_N1_I2(r, r, r)
 C_N1_I2(r, r, rW)
+C_O1_I3(x, 0, x, x)
 C_O1_I3(x, x, x, x)
 C_O1_I4(r, r, re, r, 0)
 C_O1_I4(r, r, r, ri, ri)
diff --git a/tcg/i386/tcg-target.opc.h b/tcg/i386/tcg-target.opc.h
index 1312941800..b5f403e35e 100644
--- a/tcg/i386/tcg-target.opc.h
+++ b/tcg/i386/tcg-target.opc.h
@@ -33,3 +33,6 @@ DEF(x86_psrldq_vec, 1, 1, 1, IMPLVEC)
 DEF(x86_vperm2i128_vec, 1, 2, 1, IMPLVEC)
 DEF(x86_punpckl_vec, 1, 2, 0, IMPLVEC)
 DEF(x86_punpckh_vec, 1, 2, 0, IMPLVEC)
+DEF(x86_vpshldi_vec, 1, 2, 1, IMPLVEC)
+DEF(x86_vpshldv_vec, 1, 3, 0, IMPLVEC)
+DEF(x86_vpshrdv_vec, 1, 3, 0, IMPLVEC)
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 7fd6edb887..30b9afc1d3 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -423,6 +423,15 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_VPROLVQ     (0x15 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_VPRORVD     (0x14 | P_EXT38 | P_DATA16 | P_EVEX)
 #define OPC_VPRORVQ     (0x14 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
+#define OPC_VPSHLDW     (0x70 | P_EXT3A | P_DATA16 | P_VEXW | P_EVEX)
+#define OPC_VPSHLDD     (0x71 | P_EXT3A | P_DATA16 | P_EVEX)
+#define OPC_VPSHLDQ     (0x71 | P_EXT3A | P_DATA16 | P_VEXW | P_EVEX)
+#define OPC_VPSHLDVW    (0x70 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
+#define OPC_VPSHLDVD    (0x71 | P_EXT38 | P_DATA16 | P_EVEX)
+#define OPC_VPSHLDVQ    (0x71 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
+#define OPC_VPSHRDVW    (0x72 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
+#define OPC_VPSHRDVD    (0x73 | P_EXT38 | P_DATA16 | P_EVEX)
+#define OPC_VPSHRDVQ    (0x73 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_VPSLLVW     (0x12 | P_EXT38 | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_VPSLLVD     (0x47 | P_EXT38 | P_DATA16)
 #define OPC_VPSLLVQ     (0x47 | P_EXT38 | P_DATA16 | P_VEXW)
@@ -2774,6 +2783,15 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     static int const sars_insn[4] = {
         OPC_UD2, OPC_PSRAW, OPC_PSRAD, OPC_VPSRAQ
     };
+    static int const vpshldi_insn[4] = {
+        OPC_UD2, OPC_VPSHLDW, OPC_VPSHLDD, OPC_VPSHLDQ
+    };
+    static int const vpshldv_insn[4] = {
+        OPC_UD2, OPC_VPSHLDVW, OPC_VPSHLDVD, OPC_VPSHLDVQ
+    };
+    static int const vpshrdv_insn[4] = {
+        OPC_UD2, OPC_VPSHRDVW, OPC_VPSHRDVD, OPC_VPSHRDVQ
+    };
     static int const abs_insn[4] = {
         /* TODO: AVX512 adds support for MO_64.  */
         OPC_PABSB, OPC_PABSW, OPC_PABSD, OPC_UD2
@@ -2866,6 +2884,16 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_x86_packus_vec:
         insn = packus_insn[vece];
         goto gen_simd;
+    case INDEX_op_x86_vpshldv_vec:
+        insn = vpshldv_insn[vece];
+        a1 = a2;
+        a2 = args[3];
+        goto gen_simd;
+    case INDEX_op_x86_vpshrdv_vec:
+        insn = vpshrdv_insn[vece];
+        a1 = a2;
+        a2 = args[3];
+        goto gen_simd;
 #if TCG_TARGET_REG_BITS == 32
     case INDEX_op_dup2_vec:
         /* First merge the two 32-bit inputs to a single 64-bit element. */
@@ -2967,7 +2995,12 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         insn = OPC_VPERM2I128;
         sub = args[3];
         goto gen_simd_imm8;
+    case INDEX_op_x86_vpshldi_vec:
+        insn = vpshldi_insn[vece];
+        sub = args[3];
+        goto gen_simd_imm8;
     gen_simd_imm8:
+        tcg_debug_assert(insn != OPC_UD2);
         if (type == TCG_TYPE_V256) {
             insn |= P_VEXL;
         }
@@ -3211,6 +3244,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_x86_vperm2i128_vec:
     case INDEX_op_x86_punpckl_vec:
     case INDEX_op_x86_punpckh_vec:
+    case INDEX_op_x86_vpshldi_vec:
 #if TCG_TARGET_REG_BITS == 32
     case INDEX_op_dup2_vec:
 #endif
@@ -3225,6 +3259,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_x86_psrldq_vec:
         return C_O1_I1(x, x);
 
+    case INDEX_op_x86_vpshldv_vec:
+    case INDEX_op_x86_vpshrdv_vec:
+        return C_O1_I3(x, 0, x, x);
+
     case INDEX_op_x86_vpblendvb_vec:
         return C_O1_I3(x, x, x, x);
 
-- 
2.25.1


