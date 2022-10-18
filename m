Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F10F602D98
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 15:57:57 +0200 (CEST)
Received: from localhost ([::1]:57774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okn6S-0004iJ-3d
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 09:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmiS-0004RK-UO
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:33:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmhe-0005F2-Dd
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:32:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T72QVSqLSxlxzXN8nSLOrwkRd0Y8/+Od4Hyl1a3jdVQ=;
 b=Fh0z9CHl9gFWWK3n1+gOA+gEEVzJnE1PbNAXdXH7v7zubPqIuuJWR+ivDG+vcIFCY4R8r/
 z0lbdvCI+QXeGTH0QXfDIH+A4yLkS0oVJulp4ZCButKV3jT4wAVqNAYRToiQ9TAFJ4JGJe
 5uV7fveuMiYeesy8gJCA5DPiThepGho=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-170-V_Gvm2C0MGqvet4lAAx9bw-1; Tue, 18 Oct 2022 09:32:11 -0400
X-MC-Unique: V_Gvm2C0MGqvet4lAAx9bw-1
Received: by mail-ed1-f72.google.com with SMTP id
 z7-20020a05640235c700b0045d3841ccf2so8254528edc.9
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T72QVSqLSxlxzXN8nSLOrwkRd0Y8/+Od4Hyl1a3jdVQ=;
 b=aAO0BQyqSD5r7VNZp7Fv1AWxvUWlKSp9PcWkKXVTqLzNi2GNKnxMBvjivVfNjk8uYz
 BUaLMZ/+hDsyEhfGYA3YI3dE9Oyjti2Vn+PkUv9p4T9C0J3AcLdNHOmlGGf8VqAHkSIC
 CLZMnucHvOTGuqGW4bb8A6sSJlfgVDrh+MfgtqXY24HVr6iAJ0Esiabeq6jrs70Ijk+U
 JGq8l94Gk8uumHHMouOVBOfytqwDQZ5ff5e6MXw1mJJHi++jApqcskFOigae15jXXE9a
 FXQK/4q1A+8CB73QRiyXUu16zGRJSkspxBpc1NqS2xafzc4tzs0w3+QEvV08GSdkCOoM
 55Mg==
X-Gm-Message-State: ACrzQf2dm1rHwFCZ0xmAD3bwg5v915E22flODJC9At6v9mXJniHny8rK
 paHe5UMXAco8o2D7/KPFN7kyCw/ozecYVA6U07Q204YQpKYmiNU6zqScHSHE+PtCjSUMiFodcQ1
 M8lHibPLyxy/PWxBKh9szrTdFbmo2FQwH0g+vP64IsXPFoqUn/WCOnmSO4KtsHH6TW/4=
X-Received: by 2002:a17:907:808:b0:730:54cc:b597 with SMTP id
 wv8-20020a170907080800b0073054ccb597mr2435978ejb.434.1666099929822; 
 Tue, 18 Oct 2022 06:32:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM42UZEgyKkEbHHC4FI9jxB1kx2ABbJNCmZwqA83wCFmoflE8LYOlCzj5cPnN5mTNl5D1pii+g==
X-Received: by 2002:a17:907:808:b0:730:54cc:b597 with SMTP id
 wv8-20020a170907080800b0073054ccb597mr2435947ejb.434.1666099929511; 
 Tue, 18 Oct 2022 06:32:09 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a056402524500b0045726e8a22bsm9116506edd.46.2022.10.18.06.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:32:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paul Brook <paul@nowt.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 25/53] target/i386: add AVX_EN hflag
Date: Tue, 18 Oct 2022 15:30:14 +0200
Message-Id: <20221018133042.856368-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018133042.856368-1-pbonzini@redhat.com>
References: <20221018133042.856368-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
index 5be90e72a9..dad2b2db8d 100644
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
 
@@ -2126,6 +2128,7 @@ void host_cpuid(uint32_t function, uint32_t count,
 
 /* helper.c */
 void x86_cpu_set_a20(X86CPU *cpu, int a20_state);
+void cpu_sync_avx_hflag(CPUX86State *env);
 
 #ifndef CONFIG_USER_ONLY
 static inline int x86_asidx_from_attrs(CPUState *cs, MemTxAttrs attrs)
diff --git a/target/i386/helper.c b/target/i386/helper.c
index b954ccda50..b62a1e48e2 100644
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
index ad58931751..9b59026e37 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -2955,6 +2955,7 @@ void helper_xsetbv(CPUX86State *env, uint32_t ecx, uint64_t mask)
 
     env->xcr0 = mask;
     cpu_sync_bndcs_hflags(env);
+    cpu_sync_avx_hflag(env);
     return;
 
  do_gpf:
-- 
2.37.3


