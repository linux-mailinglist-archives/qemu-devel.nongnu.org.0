Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9853EFD8F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 09:12:50 +0200 (CEST)
Received: from localhost ([::1]:37146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGFkn-0000v0-LG
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 03:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1mGFhG-0006JR-1l
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 03:09:10 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:35744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1mGFhE-0008G2-Cb
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 03:09:09 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 q11-20020a7bce8b0000b02902e6880d0accso3690257wmj.0
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 00:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FqnCqUbvKoythDShE33NAc32UKogIt9FfTN8uVIQDlA=;
 b=UPjUWHbc/FPZYtzE+rxjxJ44jmT0LfSy6FvHLJ+c0IE5+IeXf2jpNXLYxEJEJCoO4Z
 ao/0wP2ZEfjl6EGzTDmVis5HQ0N9ywOJjNuFSJPnPzdAwldAhlIlopr9Eu8FWVbmDZn0
 9yVdRc5XAjlRLxhamci9iVpf5kZ0LMGCkLp08IQaXUbUW7KEFJh4jAYPC738LY6k4pK1
 Ul67NoBkF83bz/nzyaaz7nH0oFFyBArYHhmLpbPhDsAK0Ro+3prh4E6aMprnmrbvuQXx
 QjixXWNv7z+mmC2pjmmCKvQrV/zs4qxhLduTufrFWG/3xFt101vphnbosT5er/6CNKQ+
 k9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FqnCqUbvKoythDShE33NAc32UKogIt9FfTN8uVIQDlA=;
 b=Onn8HCQq1gWRzQURMcV9kPCIg9Ot8wK95LKGs184TvOG1TUCHKvGkhpwluOg77lOoQ
 3MtjTHVQPYHdD1l76NQzVrCl7O4ZuptyE+0mESHVgl/SC3aftwrzYnhoy5NbehtGkI9a
 c+Y408lK/7mvYN08GjLj/QmP6gN5mCKXeKPacRR0yDOkHuqbPKTcMR83fhjf4pge17oK
 +IYfJ6xjXOZFMm6kD4exJKkQ2A9TdMinzgXXlQORjkBnQCuxw8v3x/myICeyBI08ajCK
 EuL13i3BTRuK4JQ+vr+bP3s7jwluU304/EzoiT6p/8pb9NMnX0mHU6w+VdRP/2vUTEzI
 4UVQ==
X-Gm-Message-State: AOAM533OmVL67Neq5mPz8KfKPOWkQXjlz1VW+BMJzRPh704U5HJSTqMx
 0w6gT0st0ZVThhssDpKu+TpelTET0kA=
X-Google-Smtp-Source: ABdhPJzJAiXgnrwVandcU2iCMhR2tkJz+bIhSV85oGMHhEU+svj0DlOIwLqV3JOUNMMJ16lZ678kXQ==
X-Received: by 2002:a1c:a181:: with SMTP id k123mr1813567wme.90.1629270546652; 
 Wed, 18 Aug 2021 00:09:06 -0700 (PDT)
Received: from laral.fritz.box
 (200116b82b53c5004989ea3bb9da8dea.dip.versatel-1u1.de.
 [2001:16b8:2b53:c500:4989:ea3b:b9da:8dea])
 by smtp.gmail.com with ESMTPSA id w18sm4902609wrg.68.2021.08.18.00.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 00:09:06 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] target/i386: Added changed priority check for VIRQ
Date: Wed, 18 Aug 2021 09:08:38 +0200
Message-Id: <20210818070838.44344-6-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818070838.44344-1-laramglazier@gmail.com>
References: <20210818070838.44344-1-laramglazier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=laramglazier@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Writes to cr8 affect v_tpr. This could set or unset an interrupt
request as the priority might have changed.

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
---
 target/i386/cpu.h                    | 15 +++++++++++++++
 target/i386/tcg/sysemu/misc_helper.c |  7 +++++++
 target/i386/tcg/sysemu/svm_helper.c  | 15 ---------------
 3 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d26df6de6b..69e722253d 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2245,6 +2245,21 @@ static inline uint64_t cr4_reserved_bits(CPUX86State *env)
     return reserved_bits;
 }
 
+static inline bool ctl_has_irq(CPUX86State *env)
+{
+    uint32_t int_prio;
+    uint32_t tpr;
+
+    int_prio = (env->int_ctl & V_INTR_PRIO_MASK) >> V_INTR_PRIO_SHIFT;
+    tpr = env->int_ctl & V_TPR_MASK;
+
+    if (env->int_ctl & V_IGN_TPR_MASK) {
+        return (env->int_ctl & V_IRQ_MASK);
+    }
+
+    return (env->int_ctl & V_IRQ_MASK) && (int_prio >= tpr);
+}
+
 #if defined(TARGET_X86_64) && \
     defined(CONFIG_USER_ONLY) && \
     defined(CONFIG_LINUX)
diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index 91b0fc916b..9ccaa054c4 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -122,6 +122,13 @@ void helper_write_crN(CPUX86State *env, int reg, target_ulong t0)
             qemu_mutex_unlock_iothread();
         }
         env->int_ctl = (env->int_ctl & ~V_TPR_MASK) | (t0 & V_TPR_MASK);
+
+        CPUState *cs = env_cpu(env);
+        if (ctl_has_irq(env)) {
+            cpu_interrupt(cs, CPU_INTERRUPT_VIRQ);
+        } else {
+            cpu_reset_interrupt(cs, CPU_INTERRUPT_VIRQ);
+        }
         break;
     default:
         env->cr[reg] = t0;
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index cbd3f086c4..312f10f1e4 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -76,21 +76,6 @@ static inline void svm_load_seg_cache(CPUX86State *env, hwaddr addr,
                            sc->base, sc->limit, sc->flags);
 }
 
-static inline bool ctl_has_irq(CPUX86State *env)
-{
-    uint32_t int_prio;
-    uint32_t tpr;
-
-    int_prio = (env->int_ctl & V_INTR_PRIO_MASK) >> V_INTR_PRIO_SHIFT;
-    tpr = env->int_ctl & V_TPR_MASK;
-
-    if (env->int_ctl & V_IGN_TPR_MASK) {
-        return env->int_ctl & V_IRQ_MASK;
-    }
-
-    return (env->int_ctl & V_IRQ_MASK) && (int_prio >= tpr);
-}
-
 static inline bool is_efer_invalid_state (CPUX86State *env)
 {
     if (!(env->efer & MSR_EFER_SVME)) {
-- 
2.25.1


