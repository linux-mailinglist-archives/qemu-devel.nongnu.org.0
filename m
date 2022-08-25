Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 904AD5A1CA0
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:43:19 +0200 (CEST)
Received: from localhost ([::1]:35964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLZG-0002tu-5e
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKb-0002Qw-LP
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKZ-0004cG-Ue
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661466487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wfUK++oQSGerAprj/QPojpDrLsHtNokzSp7rqGxE1N0=;
 b=QEtaCn7kX2hbVj+KinviJ9hqLAFEYLCo6mINRG1Hw+oPVssyyK9tBsq4PbYd0qplefEowp
 HuvLJs1PUrRcGOoQVKzJNxtOvY9+fYhpKLYywyBBB48iLJBwV2xtOnkYGvNghAg+Nwk9HX
 +V+1hf6xelPSqXDe+WqUswOwyaNhe8E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-244-N78pT4-SP0-vcAe2VwEIWA-1; Thu, 25 Aug 2022 18:28:06 -0400
X-MC-Unique: N78pT4-SP0-vcAe2VwEIWA-1
Received: by mail-wm1-f69.google.com with SMTP id
 v3-20020a1cac03000000b003a7012c430dso321491wme.3
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=wfUK++oQSGerAprj/QPojpDrLsHtNokzSp7rqGxE1N0=;
 b=Uae7O3odxpGWnQKe/anovz+eTEzC2n6XbB4q9deeVhZX47sqMUE/AHhGn+DACoqp1/
 RavFm1EuDudDM0SM2QhY1Uicc8++IHF4jqrEbnlPrUXuBdAYmdopjH5EI1MM1fYTs27/
 fq0UO/3V+tIbZcydqpmxyiNHmOfZMUxDE6323+Hgr/Z0Pwkd8YjR+KPcVj2YcpHc/SyF
 6n4XY51lLBjhftZl1y3KSf8nUHCAqhalmbsKUKnavTrq6rnifo12077ZIv43y9gLb0Lr
 Rt8XjjJIXcD/ywMbUIvk0rrHpeqR73R8oFnJQHp2jguo4B3GKtiblnGSECdIEe5bVjPr
 DABQ==
X-Gm-Message-State: ACgBeo0ADZwBUCPBMkC9Cjnc98iEG10ym7fp/nZ9yIuzdXGsasvTohgs
 b/5Bn2zldRC7McjE01yOgEyV9vl0AR1XGmqhj2uuo7HavMh2QR0Pl6ylzewSBsWGPWe8eVJRwAB
 QQcydBdBteprOVCoeMS+UkE9LPFKhGhDpeR8f55oWr2nANFHvu74LHN4aaUQ+v61hYlw=
X-Received: by 2002:a05:600c:2e47:b0:3a6:75fe:82a9 with SMTP id
 q7-20020a05600c2e4700b003a675fe82a9mr3532869wmf.189.1661466484667; 
 Thu, 25 Aug 2022 15:28:04 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4BBiBSeelL0OfQdr2khOpj3+yQeEUE30wQL7BSNxtpiW/hEk2vlPnpKjsbHCsRfKEIg9hzCA==
X-Received: by 2002:a05:600c:2e47:b0:3a6:75fe:82a9 with SMTP id
 q7-20020a05600c2e4700b003a675fe82a9mr3532859wmf.189.1661466484316; 
 Thu, 25 Aug 2022 15:28:04 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a05600c4f8500b003a601a1c2f7sm6660669wmq.19.2022.08.25.15.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:28:03 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH 11/20] tests/tcg: unify ppc64 and ppc64le Makefiles
Date: Fri, 26 Aug 2022 00:27:36 +0200
Message-Id: <20220825222745.38779-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825222745.38779-1-pbonzini@redhat.com>
References: <20220825222745.38779-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Make tests/tcg/ppc64le include tests/tcg/ppc64 instead of duplicating
the rules.  Because the ppc64le vpath includes tests/tcg/ppc64 but
not vice versa, the tests have to be moved from tests/tcg/ppc64le/
to tests/tcg/ppc64.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/tcg/ppc64/Makefile.target               |  1 -
 tests/tcg/{ppc64le => ppc64}/bcdsub.c         |  0
 tests/tcg/{ppc64le => ppc64}/byte_reverse.c   |  0
 tests/tcg/{ppc64le => ppc64}/mffsce.c         |  0
 tests/tcg/{ppc64le => ppc64}/mtfsf.c          |  0
 .../{ppc64le => ppc64}/non_signalling_xscv.c  |  0
 .../signal_save_restore_xer.c                 |  0
 tests/tcg/{ppc64le => ppc64}/xxspltw.c        |  0
 tests/tcg/ppc64le/Makefile.target             | 26 +------------------
 9 files changed, 1 insertion(+), 26 deletions(-)
 rename tests/tcg/{ppc64le => ppc64}/bcdsub.c (100%)
 rename tests/tcg/{ppc64le => ppc64}/byte_reverse.c (100%)
 rename tests/tcg/{ppc64le => ppc64}/mffsce.c (100%)
 rename tests/tcg/{ppc64le => ppc64}/mtfsf.c (100%)
 rename tests/tcg/{ppc64le => ppc64}/non_signalling_xscv.c (100%)
 rename tests/tcg/{ppc64le => ppc64}/signal_save_restore_xer.c (100%)
 rename tests/tcg/{ppc64le => ppc64}/xxspltw.c (100%)

diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
index 331fae628e..7db7a3e2b3 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -3,7 +3,6 @@
 # ppc64 specific tweaks
 
 VPATH += $(SRC_PATH)/tests/tcg/ppc64
-VPATH += $(SRC_PATH)/tests/tcg/ppc64le
 
 ifneq ($(CROSS_CC_HAS_POWER8_VECTOR),)
 PPC64_TESTS=bcdsub non_signalling_xscv
diff --git a/tests/tcg/ppc64le/bcdsub.c b/tests/tcg/ppc64/bcdsub.c
similarity index 100%
rename from tests/tcg/ppc64le/bcdsub.c
rename to tests/tcg/ppc64/bcdsub.c
diff --git a/tests/tcg/ppc64le/byte_reverse.c b/tests/tcg/ppc64/byte_reverse.c
similarity index 100%
rename from tests/tcg/ppc64le/byte_reverse.c
rename to tests/tcg/ppc64/byte_reverse.c
diff --git a/tests/tcg/ppc64le/mffsce.c b/tests/tcg/ppc64/mffsce.c
similarity index 100%
rename from tests/tcg/ppc64le/mffsce.c
rename to tests/tcg/ppc64/mffsce.c
diff --git a/tests/tcg/ppc64le/mtfsf.c b/tests/tcg/ppc64/mtfsf.c
similarity index 100%
rename from tests/tcg/ppc64le/mtfsf.c
rename to tests/tcg/ppc64/mtfsf.c
diff --git a/tests/tcg/ppc64le/non_signalling_xscv.c b/tests/tcg/ppc64/non_signalling_xscv.c
similarity index 100%
rename from tests/tcg/ppc64le/non_signalling_xscv.c
rename to tests/tcg/ppc64/non_signalling_xscv.c
diff --git a/tests/tcg/ppc64le/signal_save_restore_xer.c b/tests/tcg/ppc64/signal_save_restore_xer.c
similarity index 100%
rename from tests/tcg/ppc64le/signal_save_restore_xer.c
rename to tests/tcg/ppc64/signal_save_restore_xer.c
diff --git a/tests/tcg/ppc64le/xxspltw.c b/tests/tcg/ppc64/xxspltw.c
similarity index 100%
rename from tests/tcg/ppc64le/xxspltw.c
rename to tests/tcg/ppc64/xxspltw.c
diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefile.target
index 6ca3003f02..daad5118a5 100644
--- a/tests/tcg/ppc64le/Makefile.target
+++ b/tests/tcg/ppc64le/Makefile.target
@@ -4,28 +4,4 @@
 
 VPATH += $(SRC_PATH)/tests/tcg/ppc64le
 
-ifneq ($(CROSS_CC_HAS_POWER8_VECTOR),)
-PPC64LE_TESTS=bcdsub non_signalling_xscv
-endif
-$(PPC64LE_TESTS): CFLAGS += -mpower8-vector
-
-ifneq ($(CROSS_CC_HAS_POWER10),)
-PPC64LE_TESTS += byte_reverse sha512-vector
-endif
-byte_reverse: CFLAGS += -mcpu=power10
-run-byte_reverse: QEMU_OPTS+=-cpu POWER10
-run-plugin-byte_reverse-with-%: QEMU_OPTS+=-cpu POWER10
-
-sha512-vector: CFLAGS +=-mcpu=power10 -O3
-sha512-vector: sha512.c
-	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
-
-run-sha512-vector: QEMU_OPTS+=-cpu POWER10
-run-plugin-sha512-vector-with-%: QEMU_OPTS+=-cpu POWER10
-
-PPC64LE_TESTS += mtfsf
-PPC64LE_TESTS += mffsce
-PPC64LE_TESTS += signal_save_restore_xer
-PPC64LE_TESTS += xxspltw
-
-TESTS += $(PPC64LE_TESTS)
+include $(SRC_PATH)/tests/tcg/ppc64/Makefile.target
-- 
2.37.1



