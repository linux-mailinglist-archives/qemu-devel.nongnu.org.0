Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 210305B51D9
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:21:52 +0200 (CEST)
Received: from localhost ([::1]:40732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXWGt-0006UL-6C
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0Y-0000Lf-8a
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:04:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW0W-00070r-BS
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=88eLT3Xhok9qSDyVtfiTEEhAbzO8EaXK7iUzrXYOifs=;
 b=PFfeGpQWkRxHtbdm2dxOflS0VcPlcY+Qyyvq4z/lMfUP1MuCfyQS/Vbi8+GvAWWTcJaLkm
 qymPvDtREQCtdVlkH8f5LjS0AQ1cZ/Kcimt/n3JNFdwR3OaYYf6gPtD5vyQ0x9PyWHmXSM
 NjFrEDu787pgxoCw6qfh3i6rxji89Jc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-358-BdzMww4_PJqVZ3SglK5b6w-1; Sun, 11 Sep 2022 19:04:51 -0400
X-MC-Unique: BdzMww4_PJqVZ3SglK5b6w-1
Received: by mail-ej1-f71.google.com with SMTP id
 qk37-20020a1709077fa500b00730c2d975a0so2295845ejc.13
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=88eLT3Xhok9qSDyVtfiTEEhAbzO8EaXK7iUzrXYOifs=;
 b=Uc5uvPeFKrJbaS2TEmXIzVBcRbWjlizvrN9+/v1AjX/jTbUxvxV183U/n7EAMmhLYb
 +BhW2/wH6t4urgQgsuTirwP7YTQpMq2X2DWPndW9bbQS4JEj1spwmuNX/1r4IbFREzYh
 xoU6hLCBXeeKmQx8VPqIh2E8IfIsMYu3ufJ2TCw89QGQ8L34UNjNq2dufhSydDe98QFN
 QZSf/EaLm3ylYi70acO5saAd68gMvLMu9Ti4NSfxb4rkcV/g5Vmc2lZJP07iwaYOx47S
 lWMz7GTuBTBVskc1Kt0N6scAAIbOjxwXxw550CFFsJqy3z/5eAkr3xOFD9BawOru0k9t
 RxTw==
X-Gm-Message-State: ACgBeo0hZnZKElGfkkCbT9VYuV2N5Z23bMpbXD4wgBqiFZ0+sGrc3yJB
 l7MHk2Y1RPs+C/pJbLS61H60n3BkrHcdNhe97AQFyaVdoZkEk6Mo0545jzQCSFC0EOOgDHP8/Ga
 89B62YOqvHW8YGvtBKBHVxI60I0fkBZmvde+NAsB+lTr7adnxoBym9VrIjjaJ1X5Id38=
X-Received: by 2002:a05:6402:2546:b0:451:5444:8c83 with SMTP id
 l6-20020a056402254600b0045154448c83mr6867545edb.194.1662937490516; 
 Sun, 11 Sep 2022 16:04:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5haGv0G3SdylQrb7LkkzmHMcor+NWdGX1aqyX4J3BvRd8YZgM+Ok6i/3VhDP1rzW35Oz7gxw==
X-Received: by 2002:a05:6402:2546:b0:451:5444:8c83 with SMTP id
 l6-20020a056402254600b0045154448c83mr6867530edb.194.1662937490219; 
 Sun, 11 Sep 2022 16:04:50 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a17090633cf00b007417041fb2bsm3444301eja.116.2022.09.11.16.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:04:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paul Brook <paul@nowt.org>
Subject: [PATCH 09/37] target/i386: add AVX_EN hflag
Date: Mon, 12 Sep 2022 01:03:49 +0200
Message-Id: <20220911230418.340941-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911230418.340941-1-pbonzini@redhat.com>
References: <20220911230418.340941-1-pbonzini@redhat.com>
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

From: Paul Brook <paul@nowt.org>

Add a new hflag bit to determine whether AVX instructions are allowed

Signed-off-by: Paul Brook <paul@nowt.org>
Message-Id: <20220424220204.2493824-4-paul@nowt.org>
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



