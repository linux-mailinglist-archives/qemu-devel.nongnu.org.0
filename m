Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FED0528B70
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 18:59:36 +0200 (CEST)
Received: from localhost ([::1]:55688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqe4F-0006Hm-Ow
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 12:59:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd57-00026o-3G
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd55-0003NG-Ab
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652716582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h2E53zbfCoAvd6aaoTcTPsEGfNWjOlKglDiTq7iilGk=;
 b=dIwNaOm1f0ZBsgxXaJu3UVQ8MLSJkh46tvSVxfzjSvxOGEkUEYKhVzV7oolxlxlLqpynbK
 MlRUNwjs2zsU8Qh0NSMS83V0YGaln3HzHTgUBG6bbxJUkJ2YnjGwfE0prEZKxrMd34YxrE
 8fVroQLn2IZzng0YcruQsAXJ2bgduIU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-_tpm5QZjNOqCFFcs4Z02iw-1; Mon, 16 May 2022 11:56:21 -0400
X-MC-Unique: _tpm5QZjNOqCFFcs4Z02iw-1
Received: by mail-ed1-f71.google.com with SMTP id
 bc17-20020a056402205100b0042aa0e072d3so3682554edb.17
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h2E53zbfCoAvd6aaoTcTPsEGfNWjOlKglDiTq7iilGk=;
 b=i0bVUfshl5k22aBeoiergruYAQnOtfT9LW+dldvIEhgTR3I8hmBTkkTs3Bhltozf0T
 3uGfZR+zITP2qNIJ/CkMKm5QiRwBV10046qLF/q/GCnOJfp/AZJ2RFRHskJXQtzamale
 dLzjV3S0qSzDxFH9Hv9TNmI2mDybnmS1ittl/lO7YhBpkCXe9Q7SmTXxpE3s0ioxGHCn
 /ps6D6L52ufqGQL33jA/ZxEPSM12QE8wYcwp2rmSmuZR+cHXXq0SNKm4dTTouW0YAzbl
 WJMTwVg/2K56MO7aZiVVAccpbJ8iVo9Lq3Ha8D3oNShh3XGXvtDf7NposIvGJw5YwUjx
 KCdA==
X-Gm-Message-State: AOAM530FFZ77502+CfJ9D+rtlT1OVUYaKLJ53KzcU8QmLcnxlc8f1H71
 w7neFQpjD0qgkQ88kIJfRL+fQxEbJJNB3zvRxxp3Ft580cXkVR7n3qGPZxCtXy+312aZVxYtH/G
 VDy/kvnQjgFbTFwoVVzOj5N7Lo4CDTNhlBjYzBAwsWuUdvuZI5qZ9iXuW454ixZC7gGM=
X-Received: by 2002:a17:906:d552:b0:6f5:942e:bc5f with SMTP id
 cr18-20020a170906d55200b006f5942ebc5fmr15542923ejc.110.1652716580064; 
 Mon, 16 May 2022 08:56:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycRue7QcvkUQdu6w5LvPmecZIZbLuPUKLO7eIpuLymfmj6p0drfemJGpB9yk8HzD59dxSADQ==
X-Received: by 2002:a17:906:d552:b0:6f5:942e:bc5f with SMTP id
 cr18-20020a170906d55200b006f5942ebc5fmr15542908ejc.110.1652716579808; 
 Mon, 16 May 2022 08:56:19 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 dq21-20020a170907735500b006f3ef214df2sm45895ejc.88.2022.05.16.08.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:56:19 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yang Weijiang <weijiang.yang@intel.com>
Subject: [PULL 09/23] target/i386: Add XSAVES support for Arch LBR
Date: Mon, 16 May 2022 17:55:49 +0200
Message-Id: <20220516155603.1234712-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220516155603.1234712-1-pbonzini@redhat.com>
References: <20220516155603.1234712-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Yang Weijiang <weijiang.yang@intel.com>

Define Arch LBR bit in XSS and save/restore structure
for XSAVE area size calculation.

Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
Message-Id: <20220215195258.29149-6-weijiang.yang@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c |  6 +++++-
 target/i386/cpu.h | 23 +++++++++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 643536d05d..1816c37852 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1411,7 +1411,7 @@ static const X86RegisterInfo32 x86_reg_info_32[CPU_NB_REGS32] = {
 #undef REGISTER
 
 /* CPUID feature bits available in XSS */
-#define CPUID_XSTATE_XSS_MASK    (0)
+#define CPUID_XSTATE_XSS_MASK    (XSTATE_ARCH_LBR_MASK)
 
 ExtSaveArea x86_ext_save_areas[XSAVE_STATE_AREA_COUNT] = {
     [XSTATE_FP_BIT] = {
@@ -1445,6 +1445,10 @@ ExtSaveArea x86_ext_save_areas[XSAVE_STATE_AREA_COUNT] = {
     [XSTATE_PKRU_BIT] =
           { .feature = FEAT_7_0_ECX, .bits = CPUID_7_0_ECX_PKU,
             .size = sizeof(XSavePKRU) },
+    [XSTATE_ARCH_LBR_BIT] = {
+            .feature = FEAT_7_0_EDX, .bits = CPUID_7_0_EDX_ARCH_LBR,
+            .offset = 0 /*supervisor mode component, offset = 0 */,
+            .size = sizeof(XSavesArchLBR) },
     [XSTATE_XTILE_CFG_BIT] = {
         .feature = FEAT_7_0_EDX, .bits = CPUID_7_0_EDX_AMX_TILE,
         .size = sizeof(XSaveXTILECFG),
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 453b80eae2..dba92936a2 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -544,6 +544,7 @@ typedef enum X86Seg {
 #define XSTATE_ZMM_Hi256_BIT            6
 #define XSTATE_Hi16_ZMM_BIT             7
 #define XSTATE_PKRU_BIT                 9
+#define XSTATE_ARCH_LBR_BIT             15
 #define XSTATE_XTILE_CFG_BIT            17
 #define XSTATE_XTILE_DATA_BIT           18
 
@@ -556,6 +557,7 @@ typedef enum X86Seg {
 #define XSTATE_ZMM_Hi256_MASK           (1ULL << XSTATE_ZMM_Hi256_BIT)
 #define XSTATE_Hi16_ZMM_MASK            (1ULL << XSTATE_Hi16_ZMM_BIT)
 #define XSTATE_PKRU_MASK                (1ULL << XSTATE_PKRU_BIT)
+#define XSTATE_ARCH_LBR_MASK            (1ULL << XSTATE_ARCH_LBR_BIT)
 #define XSTATE_XTILE_CFG_MASK           (1ULL << XSTATE_XTILE_CFG_BIT)
 #define XSTATE_XTILE_DATA_MASK          (1ULL << XSTATE_XTILE_DATA_BIT)
 
@@ -870,6 +872,8 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
 #define CPUID_7_0_EDX_SERIALIZE         (1U << 14)
 /* TSX Suspend Load Address Tracking instruction */
 #define CPUID_7_0_EDX_TSX_LDTRK         (1U << 16)
+/* Architectural LBRs */
+#define CPUID_7_0_EDX_ARCH_LBR          (1U << 19)
 /* AVX512_FP16 instruction */
 #define CPUID_7_0_EDX_AVX512_FP16       (1U << 23)
 /* AMX tile (two-dimensional register) */
@@ -1376,6 +1380,24 @@ typedef struct XSaveXTILEDATA {
     uint8_t xtiledata[8][1024];
 } XSaveXTILEDATA;
 
+typedef struct {
+       uint64_t from;
+       uint64_t to;
+       uint64_t info;
+} LBREntry;
+
+#define ARCH_LBR_NR_ENTRIES            32
+
+/* Ext. save area 19: Supervisor mode Arch LBR state */
+typedef struct XSavesArchLBR {
+    uint64_t lbr_ctl;
+    uint64_t lbr_depth;
+    uint64_t ler_from;
+    uint64_t ler_to;
+    uint64_t ler_info;
+    LBREntry lbr_records[ARCH_LBR_NR_ENTRIES];
+} XSavesArchLBR;
+
 QEMU_BUILD_BUG_ON(sizeof(XSaveAVX) != 0x100);
 QEMU_BUILD_BUG_ON(sizeof(XSaveBNDREG) != 0x40);
 QEMU_BUILD_BUG_ON(sizeof(XSaveBNDCSR) != 0x40);
@@ -1385,6 +1407,7 @@ QEMU_BUILD_BUG_ON(sizeof(XSaveHi16_ZMM) != 0x400);
 QEMU_BUILD_BUG_ON(sizeof(XSavePKRU) != 0x8);
 QEMU_BUILD_BUG_ON(sizeof(XSaveXTILECFG) != 0x40);
 QEMU_BUILD_BUG_ON(sizeof(XSaveXTILEDATA) != 0x2000);
+QEMU_BUILD_BUG_ON(sizeof(XSavesArchLBR) != 0x328);
 
 typedef struct ExtSaveArea {
     uint32_t feature, bits;
-- 
2.36.0


