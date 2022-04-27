Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 768C7511C90
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 19:24:11 +0200 (CEST)
Received: from localhost ([::1]:40026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njlOc-0000Mb-Az
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 13:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1njlMY-00063W-Tg
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 13:22:04 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:45878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1njlMU-00017v-BT
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 13:22:02 -0400
Received: by mail-pf1-x42c.google.com with SMTP id h1so2110558pfv.12
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 10:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BEd4+7M6Tx8gR8spKKlq17Z4n7cYpoQSdj6J9B2o2EI=;
 b=FmkaCUkKqZchGj9PgA47oK6fTwVceVGk4Xzp8wOhpXmhS19mNCVKpV10OOx4hB9RWi
 v2abQQs5b1oPMAhKxwaeOCn0TfijI761RCeemAYtMKicJIj1GlSlMNRMrcrsa9eNx5co
 kqSVzI5jIPvTr2bc5bFj/oOqkOuyKaP0y9N8xO3CL3DC0QaxlDegaBQk82HTrD8IsKw8
 9rrZ1ScG15PdZFT1e9k0Ro97fvDRIqYgKgIUyu4bAkh80Y5+JHmJrJM7azzpXoesf6Fp
 vUSnTYCl2NWm9XwLcjFc7ocg0r0UbFsH56984Ynk23KZWQxzRT8YiDWjR5AC/CTDi7ZH
 A3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BEd4+7M6Tx8gR8spKKlq17Z4n7cYpoQSdj6J9B2o2EI=;
 b=IQlfwYCQSOqx0qTTlifBKYA0i/FBgLHHwbSUYvlcslikxEso00gJXeMmu21C6t9W5A
 l/No7CcS6H7sj44cfC1B2xCFeJHKrYJfEeZS6Vjkpdh/eUyEatOwpP/AwVVLR01AqIx6
 +kGN0AU0iFHzH3rDkhrJReafZblWAC0t5a17GmY7AmkwUesEraYjwqJjWQIIrBiBkThP
 q1r5GnGmBxFNLHAAERaWACusYNwWYHyN6PkVchNlSrRyzNKxX/HGrjt2qnU4DzMVYUkn
 n7nLus3b+NRQ42AI9ZdGx9Jega7uZ21BGEmkxKzMeQiSzF0BAjHCYqS3OLaSEBtLgGA4
 FEjw==
X-Gm-Message-State: AOAM530N05J4ku2Giybg66PKEypHrJ+4vzDDmM2kBVbnhiFi6q7KOcVG
 F3igLo1eJMzMd78PfTkU7SLEvzbIxWY=
X-Google-Smtp-Source: ABdhPJwR17l5RfAaIVM4DNLFxCIt6xlot99f+UqgZMS3mWfUtBxwTXg0+QkDtosYe/8gJX1ZTNCUVQ==
X-Received: by 2002:a63:7c42:0:b0:39c:c333:b3d4 with SMTP id
 l2-20020a637c42000000b0039cc333b3d4mr25048059pgn.456.1651080116648; 
 Wed, 27 Apr 2022 10:21:56 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:76e8:b785:3fb9:b6d6])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a056a00239000b004fa7103e13csm21202124pfc.41.2022.04.27.10.21.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 10:21:56 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] tests/tcg/xtensa: remove dependency on the loop option
Date: Wed, 27 Apr 2022 10:21:37 -0700
Message-Id: <20220427172140.1406059-5-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220427172140.1406059-1-jcmvbkbc@gmail.com>
References: <20220427172140.1406059-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

xtensa core may not have the loop option, but still have timers. Don't
use loop opcode in the timer test.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 tests/tcg/xtensa/test_timer.S | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tests/tcg/xtensa/test_timer.S b/tests/tcg/xtensa/test_timer.S
index 1ec8e20883ff..2a383e77190e 100644
--- a/tests/tcg/xtensa/test_timer.S
+++ b/tests/tcg/xtensa/test_timer.S
@@ -115,9 +115,9 @@ test ccompare0_interrupt
     movi    a2, 1 << XCHAL_TIMER0_INTERRUPT
     wsr     a2, intenable
     rsil    a2, 0
-    loop    a3, 1f
-    nop
 1:
+    addi    a3, a3, -1
+    bnez    a3, 1b
     test_fail
 2:
     rsr     a2, exccause
@@ -148,9 +148,9 @@ test ccompare1_interrupt
     movi    a2, 1 << XCHAL_TIMER1_INTERRUPT
     wsr     a2, intenable
     rsil    a2, INTERRUPT_LEVEL(XCHAL_TIMER1_INTERRUPT) - 1
-    loop    a3, 1f
-    nop
 1:
+    addi    a3, a3, -1
+    bnez    a3, 1b
     test_fail
 2:
 test_end
@@ -177,9 +177,9 @@ test ccompare2_interrupt
     movi    a2, 1 << XCHAL_TIMER2_INTERRUPT
     wsr     a2, intenable
     rsil    a2, INTERRUPT_LEVEL(XCHAL_TIMER2_INTERRUPT) - 1
-    loop    a3, 1f
-    nop
 1:
+    addi    a3, a3, -1
+    bnez    a3, 1b
     test_fail
 2:
 test_end
@@ -197,7 +197,7 @@ test ccompare_interrupt_masked
     wsr     a2, ccompare2
 #endif
 
-    movi    a3, 2 * WAIT_LOOPS
+    movi    a3, WAIT_LOOPS
     make_ccount_delta a2, a15
 #if XCHAL_NUM_TIMERS > 1
     wsr     a2, ccompare1
@@ -211,9 +211,10 @@ test ccompare_interrupt_masked
     movi    a2, 1 << XCHAL_TIMER0_INTERRUPT
     wsr     a2, intenable
     rsil    a2, 0
-    loop    a3, 1f
-    nop
 1:
+    addi    a3, a3, -1
+    bnez    a3, 1b
+
     test_fail
 2:
     rsr     a2, exccause
@@ -231,7 +232,6 @@ test ccompare_interrupt_masked_waiti
     wsr     a2, ccompare2
 #endif
 
-    movi    a3, 2 * WAIT_LOOPS
     make_ccount_delta a2, a15
 #if XCHAL_NUM_TIMERS > 1
     wsr     a2, ccompare1
-- 
2.30.2


