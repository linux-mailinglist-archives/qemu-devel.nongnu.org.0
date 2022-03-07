Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA4D4D0696
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:31:40 +0100 (CET)
Received: from localhost ([::1]:57948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRI8x-0007L1-64
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:31:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHuk-0001DN-6b
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:58 -0500
Received: from [2a00:1450:4864:20::62f] (port=45935
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRHud-0005Nn-9u
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:16:57 -0500
Received: by mail-ej1-x62f.google.com with SMTP id qa43so33763307ejc.12
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 10:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bgnQk/oKm9yMpJRSm1pFwoAeO2+68i+serPntyN6GVM=;
 b=p4M3cgegboLjZwNk8AbS9Z4uocnCZKiIBf+csMcBTQqtWnIhDcThEwB3l4F9wAxcP5
 Sgo1YZRrWxbOuFDmoqlbhTLE0TKI0MkijizTQzfuukH91kP+AzH9qGRNiG8rGqbrKetB
 AlBB7lrUUY5njxPDSUGNYU3iR1ixNRJGNvSDzwbSOcs3ZURgWDGTBScZsT0k0NF/7Twz
 gve0nmNeG+mej+IK2O7G1p+1v4HsnHpXuDctNmMpKaJwZCk2d5aYtYu7Y83UucBdUVuf
 EDgTPvUKU+WJ1FiTRL27a4dk+0P2ejT2NpESAoGa+Mj4AdIqNhiJZx+jP6UNPvWRs3F9
 YxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bgnQk/oKm9yMpJRSm1pFwoAeO2+68i+serPntyN6GVM=;
 b=H2OO9gCJJKhljpZIIy3Jyvfbp3tGbq4ON4Q+WuTzms2kSoITYrJj3Zg+ZSz6VmK5Xn
 hxOzGIf5589Prbin0Gpw3d3kyHcV3UpQ0ecipFMzI4UQA+lLKrO7e3lNlOThM8vvy1lo
 V/2qCr4q+riAboydYCKHBfybS3OpmRpfcjuLbVL8/9mCdwNlFR2OzhtRVitCuMlwjxhP
 oC7yNNJCgtjSf8T83gKxZzTeV4h/2DKdhbznVnftZMZjWnWjrvHKkiFt8OURUadVNtkl
 wu3vypGNf+8oZT8m/GyhlQvv9IABWPd6WFrJYwuQzcFT1JbQX30LaHdLjc/qp7FK09sV
 i29Q==
X-Gm-Message-State: AOAM532H180Bhx2Vt4mgKSAJ+tu/aobZ7W50wjBzLfscWVI0NFcpmeVC
 b8mpW4F/3ktyXSrT1i/047du8ctc86Y=
X-Google-Smtp-Source: ABdhPJxdL9dFXEcc5XxIMOimLiYCIy3Le8hBaHz8TACqNSEENvbEDQHMRESRLiQuhDR47rIWJRDZtA==
X-Received: by 2002:a17:906:2584:b0:6d6:e5c9:221b with SMTP id
 m4-20020a170906258400b006d6e5c9221bmr10060918ejb.514.1646677006647; 
 Mon, 07 Mar 2022 10:16:46 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a170906304800b006cdf8a1e146sm4983382ejd.217.2022.03.07.10.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 10:16:46 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/23] x86: Add AMX XTILECFG and XTILEDATA components
Date: Mon,  7 Mar 2022 19:16:24 +0100
Message-Id: <20220307181633.596898-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307181633.596898-1-pbonzini@redhat.com>
References: <20220307181633.596898-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>, Jing Liu <jing2.liu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jing Liu <jing2.liu@intel.com>

The AMX TILECFG register and the TMMx tile data registers are
saved/restored via XSAVE, respectively in state component 17
(64 bytes) and state component 18 (8192 bytes).

Add AMX feature bits to x86_ext_save_areas array to set
up AMX components. Add structs that define the layout of
AMX XSAVE areas and use QEMU_BUILD_BUG_ON to validate the
structs sizes.

Signed-off-by: Jing Liu <jing2.liu@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20220217060434.52460-3-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c |  8 ++++++++
 target/i386/cpu.h | 18 +++++++++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 0f3c477dfc..ec35dd1717 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1402,6 +1402,14 @@ ExtSaveArea x86_ext_save_areas[XSAVE_STATE_AREA_COUNT] = {
     [XSTATE_PKRU_BIT] =
           { .feature = FEAT_7_0_ECX, .bits = CPUID_7_0_ECX_PKU,
             .size = sizeof(XSavePKRU) },
+    [XSTATE_XTILE_CFG_BIT] = {
+        .feature = FEAT_7_0_EDX, .bits = CPUID_7_0_EDX_AMX_TILE,
+        .size = sizeof(XSaveXTILECFG),
+    },
+    [XSTATE_XTILE_DATA_BIT] = {
+        .feature = FEAT_7_0_EDX, .bits = CPUID_7_0_EDX_AMX_TILE,
+        .size = sizeof(XSaveXTILEDATA)
+    },
 };
 
 static uint32_t xsave_area_size(uint64_t mask)
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 7bd9d58505..3ff1b49d29 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -539,6 +539,8 @@ typedef enum X86Seg {
 #define XSTATE_ZMM_Hi256_BIT            6
 #define XSTATE_Hi16_ZMM_BIT             7
 #define XSTATE_PKRU_BIT                 9
+#define XSTATE_XTILE_CFG_BIT            17
+#define XSTATE_XTILE_DATA_BIT           18
 
 #define XSTATE_FP_MASK                  (1ULL << XSTATE_FP_BIT)
 #define XSTATE_SSE_MASK                 (1ULL << XSTATE_SSE_BIT)
@@ -847,6 +849,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_7_0_EDX_TSX_LDTRK         (1U << 16)
 /* AVX512_FP16 instruction */
 #define CPUID_7_0_EDX_AVX512_FP16       (1U << 23)
+/* AMX tile (two-dimensional register) */
+#define CPUID_7_0_EDX_AMX_TILE          (1U << 24)
 /* Speculation Control */
 #define CPUID_7_0_EDX_SPEC_CTRL         (1U << 26)
 /* Single Thread Indirect Branch Predictors */
@@ -1350,6 +1354,16 @@ typedef struct XSavePKRU {
     uint32_t padding;
 } XSavePKRU;
 
+/* Ext. save area 17: AMX XTILECFG state */
+typedef struct XSaveXTILECFG {
+    uint8_t xtilecfg[64];
+} XSaveXTILECFG;
+
+/* Ext. save area 18: AMX XTILEDATA state */
+typedef struct XSaveXTILEDATA {
+    uint8_t xtiledata[8][1024];
+} XSaveXTILEDATA;
+
 QEMU_BUILD_BUG_ON(sizeof(XSaveAVX) != 0x100);
 QEMU_BUILD_BUG_ON(sizeof(XSaveBNDREG) != 0x40);
 QEMU_BUILD_BUG_ON(sizeof(XSaveBNDCSR) != 0x40);
@@ -1357,6 +1371,8 @@ QEMU_BUILD_BUG_ON(sizeof(XSaveOpmask) != 0x40);
 QEMU_BUILD_BUG_ON(sizeof(XSaveZMM_Hi256) != 0x200);
 QEMU_BUILD_BUG_ON(sizeof(XSaveHi16_ZMM) != 0x400);
 QEMU_BUILD_BUG_ON(sizeof(XSavePKRU) != 0x8);
+QEMU_BUILD_BUG_ON(sizeof(XSaveXTILECFG) != 0x40);
+QEMU_BUILD_BUG_ON(sizeof(XSaveXTILEDATA) != 0x2000);
 
 typedef struct ExtSaveArea {
     uint32_t feature, bits;
@@ -1364,7 +1380,7 @@ typedef struct ExtSaveArea {
     uint32_t ecx;
 } ExtSaveArea;
 
-#define XSAVE_STATE_AREA_COUNT (XSTATE_PKRU_BIT + 1)
+#define XSAVE_STATE_AREA_COUNT (XSTATE_XTILE_DATA_BIT + 1)
 
 extern ExtSaveArea x86_ext_save_areas[XSAVE_STATE_AREA_COUNT];
 
-- 
2.34.1



