Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3973A5BF051
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:42:23 +0200 (CEST)
Received: from localhost ([::1]:60668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalwc-0007Wc-AW
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oagzw-0006Ku-Le
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oagzu-00027j-7w
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:25:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663694725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yc6DxNmSj3Qg1jfzzJSXZqJn2BBTcGOivU6NJ/hq6Pw=;
 b=UYjJ0Aphy+ftVbWvP4JAMhEb8EswrXG6a9MS9oiVNGy5w+lzQ+m2T2PVBMRplthO8TX2F3
 lz7lwGrgaf0Obvn1FUKq+uohet3zjQRPEyauAGKnBHKbVQUmfUiglLtsLvFBBfjZwvcQE6
 G64inewzlS2HKxHREFvqH20zOo49VnE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-448-NVUfrrhbPmSO0AW7zhTrbg-1; Tue, 20 Sep 2022 13:25:24 -0400
X-MC-Unique: NVUfrrhbPmSO0AW7zhTrbg-1
Received: by mail-ej1-f69.google.com with SMTP id
 xj11-20020a170906db0b00b0077b6ecb23fcso1770790ejb.5
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Yc6DxNmSj3Qg1jfzzJSXZqJn2BBTcGOivU6NJ/hq6Pw=;
 b=ox8gbuzcOU0A+7HxwdwzwiCDTtYa4HvtgrkcP6Htc+nQcPhtS6XSM6heWYlN1VP9k7
 uO2/XDe3bgnPDp8z68NF4s7R5l2o2PkwQXskIb+aP3UpDGUDbaSMtVC95b9Zkb4FcplH
 42CbgBJtmPmlpZXYUDYwDN5FiyG+ftxht+J++PT29PEmQzfeRLOF5O8wyBixEnjPzsc6
 qIcntCb8/rfhTg5Vq/g3G7hUCDLxU+y/q6xXenfV+tCdxlAs+3e4W9Ways2Ysc/xwcLJ
 lkjw3K1CcKQpoWlKUnrKcv16G7Q+hWasrVPFeqRHoG+Z21jugWqzVfanmiBTf1cYP6Oh
 1QoA==
X-Gm-Message-State: ACrzQf0zZUmZ+gO9CKxiOBTCdtdNFmiksG7GO/lPv/SHh4BbAGp948tF
 Tvds51Er8q80nD9XgCm45iUc+px6yOl1/cY2Pw9b1QORxma2UupuFiuxEsRUcWHyzT88U2yFsN0
 jJvag5ySMvdV8b7N/xNei1GKuRBymifQbAFYsf/ZpG07Xb8ogRoOGZS0AugwcajM66e8=
X-Received: by 2002:a17:906:b106:b0:780:83a8:773 with SMTP id
 u6-20020a170906b10600b0078083a80773mr17597670ejy.758.1663694722995; 
 Tue, 20 Sep 2022 10:25:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5zgTwzmTT3x4+VMPo9x89B6aDIaEnB2u8IEf5bkGsz6hPGyZgqAUs1sEzI5soaPhfjSLaI2A==
X-Received: by 2002:a17:906:b106:b0:780:83a8:773 with SMTP id
 u6-20020a170906b10600b0078083a80773mr17597650ejy.758.1663694722714; 
 Tue, 20 Sep 2022 10:25:22 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a50c308000000b00445e930e20esm180920edb.64.2022.09.20.10.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:25:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	paul@nowt.org
Subject: [PATCH v2 09/37] target/i386: add AVX_EN hflag
Date: Tue, 20 Sep 2022 19:24:39 +0200
Message-Id: <20220920172507.95568-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220920172507.95568-1-pbonzini@redhat.com>
References: <20220920172507.95568-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Paul Brook <paul@nowt.org>

Add a new hflag bit to determine whether AVX instructions are allowed

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-4-paul@nowt.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h            |  3 +++
 target/i386/helper.c         | 12 ++++++++++++
 target/i386/tcg/fpu_helper.c |  1 +
 3 files changed, 16 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 8311b69c88..ff1df4ea53 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -169,6 +169,7 @@ typedef enum X86Seg {
 #define HF_MPX_EN_SHIFT     25 /* MPX Enabled (CR4+XCR0+BNDCFGx) */
 #define HF_MPX_IU_SHIFT     26 /* BND registers in-use */
 #define HF_UMIP_SHIFT       27 /* CR4.UMIP */
+#define HF_AVX_EN_SHIFT     28 /* AVX Enabled (CR4+XCR0) */
 
 #define HF_CPL_MASK          (3 << HF_CPL_SHIFT)
 #define HF_INHIBIT_IRQ_MASK  (1 << HF_INHIBIT_IRQ_SHIFT)
@@ -195,6 +196,7 @@ typedef enum X86Seg {
 #define HF_MPX_EN_MASK       (1 << HF_MPX_EN_SHIFT)
 #define HF_MPX_IU_MASK       (1 << HF_MPX_IU_SHIFT)
 #define HF_UMIP_MASK         (1 << HF_UMIP_SHIFT)
+#define HF_AVX_EN_MASK       (1 << HF_AVX_EN_SHIFT)
 
 /* hflags2 */
 
@@ -2121,6 +2123,7 @@ void host_cpuid(uint32_t function, uint32_t count,
 
 /* helper.c */
 void x86_cpu_set_a20(X86CPU *cpu, int a20_state);
+void cpu_sync_avx_hflag(CPUX86State *env);
 
 #ifndef CONFIG_USER_ONLY
 static inline int x86_asidx_from_attrs(CPUState *cs, MemTxAttrs attrs)
diff --git a/target/i386/helper.c b/target/i386/helper.c
index fa409e9c44..30083c9cff 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -29,6 +29,17 @@
 #endif
 #include "qemu/log.h"
 
+void cpu_sync_avx_hflag(CPUX86State *env)
+{
+    if ((env->cr[4] & CR4_OSXSAVE_MASK)
+        && (env->xcr0 & (XSTATE_SSE_MASK | XSTATE_YMM_MASK))
+            == (XSTATE_SSE_MASK | XSTATE_YMM_MASK)) {
+        env->hflags |= HF_AVX_EN_MASK;
+    } else{
+        env->hflags &= ~HF_AVX_EN_MASK;
+    }
+}
+
 void cpu_sync_bndcs_hflags(CPUX86State *env)
 {
     uint32_t hflags = env->hflags;
@@ -209,6 +220,7 @@ void cpu_x86_update_cr4(CPUX86State *env, uint32_t new_cr4)
     env->hflags = hflags;
 
     cpu_sync_bndcs_hflags(env);
+    cpu_sync_avx_hflag(env);
 }
 
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 30bc44fcf8..48bf0c5cf8 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -2943,6 +2943,7 @@ void helper_xsetbv(CPUX86State *env, uint32_t ecx, uint64_t mask)
 
     env->xcr0 = mask;
     cpu_sync_bndcs_hflags(env);
+    cpu_sync_avx_hflag(env);
     return;
 
  do_gpf:
-- 
2.37.2


