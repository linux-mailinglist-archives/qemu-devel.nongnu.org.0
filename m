Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E044D4799
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:03:10 +0100 (CET)
Received: from localhost ([::1]:33050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIRh-0003SS-1X
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:03:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9p-0006pR-RK; Thu, 10 Mar 2022 07:44:42 -0500
Received: from [2a00:1450:4864:20::42f] (port=43707
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9l-0005Dd-9z; Thu, 10 Mar 2022 07:44:39 -0500
Received: by mail-wr1-x42f.google.com with SMTP id e24so7741077wrc.10;
 Thu, 10 Mar 2022 04:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NP0Ei/vqiEwTAvjNN9/HZJ4grZhsDkMiqmp8SfogxL4=;
 b=Npy0igV1JKdWSfZhK8GP8k1T2YAUSTTT0bFcL4gjPelSZnsZmIBAr1ghcUmAIVWYgP
 IJUgJf73L0xuoc+IBCbFqjgskB3mtYyCKPGUUXj7QY5RV4Y/2mzHCEHa9HiRbKOysFv/
 j2IHWnrNx4ab2Rv6A2F7THO0peQ1CdBqQTFJecunMBN2h/zqL61yQ4Zvy8+i6bfv8nqR
 XOmvCaAgtuC0GSbua89zZvkLw6rTARLiCs1A1MMU0uU0C+lSeMkfGooNX1nHPA0CM91A
 2DdihHV5+Kl9XrTilaIYYv3clFX+NeJ6VWjcPgK1GKQB5opVnU2++7rhh1HEJWOgN0Kw
 OLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NP0Ei/vqiEwTAvjNN9/HZJ4grZhsDkMiqmp8SfogxL4=;
 b=pd7RvprZ00HAOfqwgXkbsRDUGRnJMz4qLJ/PQ/pPMZjxPT6x/aN+br4sdE/+DRfiEo
 AXjD22gDZWm/37c48vcpvNZSiE7+q35VM2+ml6/277BMu9owWD6vTbnamfTuu+nlDISc
 d84mNdezuqM71imfolSnmlrxBlA3aC/7vZQYFrYkvVe2l4LwwYGlXPg7fx8f04Ex4Kla
 u7UdgfRJowa6h+pcfYUrk79liHdRTv5Z6BMqHl8kp9WP0avztWznbMZpwURd4oAbh+R6
 4Z5FxSg1kCTrYYV6D4vxuT4PBTvnaGo03HPBQu3LsB+3H+mOv4NHtpsB4siNZhqw6piu
 TWYA==
X-Gm-Message-State: AOAM530g0hxSt2+nYDIVLow9vbZ+RW9BoImp1Msv+Q6UdA6Pf0h2EJ0V
 BfddwwcjRKIOZhkKJ+vW1sl1tjKlpt0=
X-Google-Smtp-Source: ABdhPJyrpxN1Hz/doivErdLN9RTzlQPPiVP0O3SxPoRbP6ylboztxYp0S6jPehe0AL0cJLsPPg5C+Q==
X-Received: by 2002:a05:6000:2c4:b0:203:7e20:f828 with SMTP id
 o4-20020a05600002c400b002037e20f828mr3574291wry.232.1646916275743; 
 Thu, 10 Mar 2022 04:44:35 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:35 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/35] /basic/entered
Date: Thu, 10 Mar 2022 13:43:54 +0100
Message-Id: <20220310124413.1102441-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: hreitz@redhat.com, stefanha@redhat.com, qemu-block@nongnu.org,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/test-coroutine.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/tests/unit/test-coroutine.c b/tests/unit/test-coroutine.c
index c701113d77..bc75050463 100644
--- a/tests/unit/test-coroutine.c
+++ b/tests/unit/test-coroutine.c
@@ -55,26 +55,40 @@ static void test_self(void)
     coroutine = qemu_coroutine_create(verify_self, &coroutine);
     qemu_coroutine_enter(coroutine);
 }
-#if 0
 
 /*
  * Check that qemu_coroutine_entered() works
  */
 
-static void coroutine_fn verify_entered_step_2(void *opaque)
+CO_DECLARE_FRAME(verify_entered_step_2, Coroutine *caller);
+static CoroutineAction co__verify_entered_step_2(void *_frame)
 {
-    Coroutine *caller = (Coroutine *)opaque;
+    struct FRAME__verify_entered_step_2 *_f = _frame;
+    CO_ARG(caller);
 
+switch(_f->_step)
+{
+case 0:
     g_assert(qemu_coroutine_entered(caller));
     g_assert(qemu_coroutine_entered(qemu_coroutine_self()));
-    qemu_coroutine_yield();
-
+    _f->_step = 1;
+    return qemu_coroutine_yield();
+case 1:
     /* Once more to check it still works after yielding */
     g_assert(qemu_coroutine_entered(caller));
     g_assert(qemu_coroutine_entered(qemu_coroutine_self()));
+    break;
+}
+return stack_free(&_f->common);
 }
 
-static void coroutine_fn verify_entered_step_1(void *opaque)
+static CoroutineAction verify_entered_step_2(void *opaque)
+{
+    Coroutine *caller = (Coroutine *)opaque;
+    return CO_INIT_FRAME(verify_entered_step_2, caller);
+}
+
+static CoroutineAction verify_entered_step_1(void *opaque)
 {
     Coroutine *self = qemu_coroutine_self();
     Coroutine *coroutine;
@@ -86,6 +100,7 @@ static void coroutine_fn verify_entered_step_1(void *opaque)
     qemu_coroutine_enter(coroutine);
     g_assert(!qemu_coroutine_entered(coroutine));
     qemu_coroutine_enter(coroutine);
+    return COROUTINE_CONTINUE;
 }
 
 static void test_entered(void)
@@ -96,7 +111,6 @@ static void test_entered(void)
     g_assert(!qemu_coroutine_entered(coroutine));
     qemu_coroutine_enter(coroutine);
 }
-#endif
 
 /*
  * Check that coroutines may nest multiple levels
@@ -685,8 +699,8 @@ int main(int argc, char **argv)
     g_test_add_func("/basic/yield", test_yield);
     g_test_add_func("/basic/nesting", test_nesting);
     g_test_add_func("/basic/self", test_self);
-#if 0
     g_test_add_func("/basic/entered", test_entered);
+#if 0
     g_test_add_func("/basic/in_coroutine", test_in_coroutine);
     g_test_add_func("/basic/order", test_order);
     g_test_add_func("/locking/co-mutex", test_co_mutex);
-- 
2.35.1



