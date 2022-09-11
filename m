Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 988B15B51F5
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 01:38:12 +0200 (CEST)
Received: from localhost ([::1]:53316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXWWh-0000uX-Mr
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 19:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW1a-0001fd-Ko
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:06:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXW1Z-0007OA-1U
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 19:06:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662937560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XfveNXHWPuBDWCBxYw20yQD27dwpQZ3MhFlsQhrWRRc=;
 b=Ig1hihEch/qQBvo/h3VP3gBX/+ck3Pm0f29elOZhSgEf9zY21qTRfQQbopOexUPi75lYnS
 RfeHzFRfw7/IDIJsaVENQKD2bwhQzq4KqNnGzt5RMZ/3CmwJaN93rJG416vAoXxLdOp7w4
 OMnEkMIs/kL0R6WOcnBCkHeaWVtFX54=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-2XQhcek_MvqLAgKQsQF90A-1; Sun, 11 Sep 2022 19:05:58 -0400
X-MC-Unique: 2XQhcek_MvqLAgKQsQF90A-1
Received: by mail-ed1-f69.google.com with SMTP id
 t13-20020a056402524d00b0043db1fbefdeso4956175edd.2
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 16:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=XfveNXHWPuBDWCBxYw20yQD27dwpQZ3MhFlsQhrWRRc=;
 b=hJjLQ12g/d0awFnFG6dRCyYuwUC9DXdgAgrJsZp3KxRF/vAh5NIaOEJcFWb3HralGc
 GKLqoehiIwz96bpT8YZQOvJtWTum7ZC1UMbQNvPaj0skAYt8+RtAY9SwJhatgzB3bc7N
 EDNfTb8luirw35cBqnk8xddzjl8PsLPEjy57UQwQSZm2Hza9/ArPN79p0y1gXU59hOni
 c4xqpsLGEEIuCsmOnGMqn4pf9gUoFyUkhYKwXRuHGsXGR4dlMWJxEV1BtXuE0vXPMIHX
 /lbd/5gKVWHT41+87DCYoqH9N6L4+UnZej3fM5rdUt6zXxzr1eH4Ukt/PF51yysrXvxz
 CKtA==
X-Gm-Message-State: ACgBeo1DQmKA7MWWFEylBw4a7MSTiaz/ricI+BwFUGKMg5c4pGOIJkHa
 kBMJrXjvIWtTVfSQbi3pr6zynMXpU5zrV2VPesbkywA3P8Hn3GyGy0AVOb3fPd0hV+ZAW72rn8n
 6GQXaSmKOYlFFzGC0wSl0/SEszfinuBCtWdgL57wuK+7jc/bz88jNn+Ida8/FsjygJco=
X-Received: by 2002:a50:ed0d:0:b0:44e:8882:fc4a with SMTP id
 j13-20020a50ed0d000000b0044e8882fc4amr20036283eds.190.1662937556896; 
 Sun, 11 Sep 2022 16:05:56 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4q6OCCGR392I6uUhFgFwjNeIU0+aN3otUyjl9leCKhu1tYrbptxxR+i2EEXTewybpes6S9WQ==
X-Received: by 2002:a50:ed0d:0:b0:44e:8882:fc4a with SMTP id
 j13-20020a50ed0d000000b0044e8882fc4amr20036270eds.190.1662937556568; 
 Sun, 11 Sep 2022 16:05:56 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 s15-20020aa7c54f000000b004466f5375a5sm4712093edr.53.2022.09.11.16.05.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 16:05:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 32/37] target/i386: implement XSAVE and XRSTOR of AVX registers
Date: Mon, 12 Sep 2022 01:04:12 +0200
Message-Id: <20220911230418.340941-33-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911230418.340941-1-pbonzini@redhat.com>
References: <20220911230418.340941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/fpu_helper.c | 84 ++++++++++++++++++++++++++++++++++--
 1 file changed, 81 insertions(+), 3 deletions(-)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 230907bc5c..1be620257e 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -2571,6 +2571,25 @@ static void do_xsave_sse(CPUX86State *env, target_ulong ptr, uintptr_t ra)
     }
 }
 
+static void do_xsave_ymmh(CPUX86State *env, target_ulong ptr, uintptr_t ra)
+{
+    int i, nb_xmm_regs;
+    target_ulong addr;
+
+    if (env->hflags & HF_CS64_MASK) {
+        nb_xmm_regs = 16;
+    } else {
+        nb_xmm_regs = 8;
+    }
+
+    addr = ptr + XO(avx_state);
+    for (i = 0; i < nb_xmm_regs; i++) {
+        cpu_stq_data_ra(env, addr, env->xmm_regs[i].ZMM_Q(2), ra);
+        cpu_stq_data_ra(env, addr + 8, env->xmm_regs[i].ZMM_Q(3), ra);
+        addr += 16;
+    }
+}
+
 static void do_xsave_bndregs(CPUX86State *env, target_ulong ptr, uintptr_t ra)
 {
     target_ulong addr = ptr + offsetof(XSaveBNDREG, bnd_regs);
@@ -2663,6 +2682,9 @@ static void do_xsave(CPUX86State *env, target_ulong ptr, uint64_t rfbm,
     if (opt & XSTATE_SSE_MASK) {
         do_xsave_sse(env, ptr, ra);
     }
+    if (opt & XSTATE_YMM_MASK) {
+        do_xsave_ymmh(env, ptr + XO(avx_state), ra);
+    }
     if (opt & XSTATE_BNDREGS_MASK) {
         do_xsave_bndregs(env, ptr + XO(bndreg_state), ra);
     }
@@ -2737,6 +2759,57 @@ static void do_xrstor_sse(CPUX86State *env, target_ulong ptr, uintptr_t ra)
     }
 }
 
+static void do_clear_sse(CPUX86State *env)
+{
+    int i, nb_xmm_regs;
+
+    if (env->hflags & HF_CS64_MASK) {
+        nb_xmm_regs = 16;
+    } else {
+        nb_xmm_regs = 8;
+    }
+
+    for (i = 0; i < nb_xmm_regs; i++) {
+        env->xmm_regs[i].ZMM_Q(0) = 0;
+        env->xmm_regs[i].ZMM_Q(1) = 0;
+    }
+}
+
+static void do_xrstor_ymmh(CPUX86State *env, target_ulong ptr, uintptr_t ra)
+{
+    int i, nb_xmm_regs;
+    target_ulong addr;
+
+    if (env->hflags & HF_CS64_MASK) {
+        nb_xmm_regs = 16;
+    } else {
+        nb_xmm_regs = 8;
+    }
+
+    addr = ptr + XO(avx_state);
+    for (i = 0; i < nb_xmm_regs; i++) {
+        env->xmm_regs[i].ZMM_Q(2) = cpu_ldq_data_ra(env, addr, ra);
+        env->xmm_regs[i].ZMM_Q(3) = cpu_ldq_data_ra(env, addr + 8, ra);
+        addr += 16;
+    }
+}
+
+static void do_clear_ymmh(CPUX86State *env)
+{
+    int i, nb_xmm_regs;
+
+    if (env->hflags & HF_CS64_MASK) {
+        nb_xmm_regs = 16;
+    } else {
+        nb_xmm_regs = 8;
+    }
+
+    for (i = 0; i < nb_xmm_regs; i++) {
+        env->xmm_regs[i].ZMM_Q(2) = 0;
+        env->xmm_regs[i].ZMM_Q(3) = 0;
+    }
+}
+
 static void do_xrstor_bndregs(CPUX86State *env, target_ulong ptr, uintptr_t ra)
 {
     target_ulong addr = ptr + offsetof(XSaveBNDREG, bnd_regs);
@@ -2856,9 +2929,14 @@ void helper_xrstor(CPUX86State *env, target_ulong ptr, uint64_t rfbm)
         if (xstate_bv & XSTATE_SSE_MASK) {
             do_xrstor_sse(env, ptr, ra);
         } else {
-            /* ??? When AVX is implemented, we may have to be more
-               selective in the clearing.  */
-            memset(env->xmm_regs, 0, sizeof(env->xmm_regs));
+            do_clear_sse(env);
+        }
+    }
+    if (rfbm & XSTATE_YMM_MASK) {
+        if (xstate_bv & XSTATE_BNDREGS_MASK) {
+            do_xrstor_ymmh(env, ptr, ra);
+        } else {
+            do_clear_ymmh(env);
         }
     }
     if (rfbm & XSTATE_BNDREGS_MASK) {
-- 
2.37.2



