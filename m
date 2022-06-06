Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C641E53E54A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 17:05:15 +0200 (CEST)
Received: from localhost ([::1]:50240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyEI6-0006eZ-KU
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 11:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDrF-0002O9-HP
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDr6-0000aS-IC
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kM387v1WsabA4prRH3l5I9WuqejFFO0SIdWUvFlOYXs=;
 b=TRdEROjVluuUFRuGMT7TRF8co1q/OMGjoUE85n5sXBoBqKNVi7acjUceB2jAv+MD9hHHaV
 UVIVRGexyDn89/Uamx+X632Z2aZFNDNJZq5QKONy9KmJyP1Rv/TrqczCbASjioo1aKR1hL
 BTG1BY2cZNojCygyHo8WBPbqZC1Hjow=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-Q32B0ZCTPnCbL3ywODBvpQ-1; Mon, 06 Jun 2022 10:37:17 -0400
X-MC-Unique: Q32B0ZCTPnCbL3ywODBvpQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 d9-20020adfe849000000b00213375a746aso2396029wrn.18
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kM387v1WsabA4prRH3l5I9WuqejFFO0SIdWUvFlOYXs=;
 b=fwaAu8BphpJBzg5NM28oG1O+bY+NVKGToB8uYu7aBBMsE4YBKufMKXLTyDnX1W68fp
 2P4OXgR5bOU7hhbWIiLtsaYr8Z1/Agxd0h3KwK+dBoIyMa2FAuXfOPLJymnRwF1wlU31
 syzk1YPU46eK1i8j9gwT/sLztRU6/9A0391bjzkjt6gH0Yv71LbcfB+nKvay+0aXs+Il
 6/QiWzjQUitOmiV6mXrvfPQpHHuY0kAL1HPNYI8r02t4bo1pTgi2mdkJajhAR/zrBoWA
 1JU7z9AqHTdEjs+KTlKRwtwFG2HepORUZmOVBQVT++NUaghn1cB/s4LabgS2jYfQnjfO
 X3Dw==
X-Gm-Message-State: AOAM530EZFdcnHWiPpDxkR7toF2M/RkiDmN18ax7sxD5tVboq1eulbiF
 nLOsW/v8tIljT4qsU/55eFUcyG3cnYwZXl0jhH0cXYORwZP59biJCCKIQUaM8wLZHtvk4W/E5PP
 t/I0BvWwybB+BJslAJSmMyDmjBaIMhzxrwTaWXNPJVV6Pl8+zzV6bq5XK5kH1Fnz6iLQ=
X-Received: by 2002:a05:600c:4ec9:b0:397:750a:798a with SMTP id
 g9-20020a05600c4ec900b00397750a798amr51975877wmq.169.1654526235525; 
 Mon, 06 Jun 2022 07:37:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZo/4+Ty8kyv3wS9kujdFV6YEXj4aPI/G9D8MnVdvQjyIm2hS2NJXpcp47apaSUQDQ+rh1RA==
X-Received: by 2002:a05:600c:4ec9:b0:397:750a:798a with SMTP id
 g9-20020a05600c4ec900b00397750a798amr51975818wmq.169.1654526235058; 
 Mon, 06 Jun 2022 07:37:15 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 o17-20020a5d6711000000b00218453adaefsm1551558wru.101.2022.06.06.07.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:37:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 15/29] tests/Makefile.include: Fix 'make check-help' output
Date: Mon,  6 Jun 2022 16:36:30 +0200
Message-Id: <20220606143644.1151112-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606143644.1151112-1-pbonzini@redhat.com>
References: <20220606143644.1151112-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Dario Faggioli <dfaggioli@suse.com>

Since commit 3d2f73ef75e ("build: use "meson test" as the test harness"),
check-report.tap is no more, and we have check-report.junit.xml.

Update the output of 'make check-help', which was still listing
'check-report.tap', accordingly.

Fixes: 3d2f73ef75e
Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
Message-Id: <165366545439.6869.11633009118019728798.stgit@work>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/Makefile.include | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 6a1688e33e..2a1c77440a 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -3,28 +3,28 @@
 .PHONY: check-help
 check-help:
 	@echo "Regression testing targets:"
-	@echo " $(MAKE) check                Run block, qapi-schema, unit, softfloat, qtest and decodetree tests"
-	@echo " $(MAKE) bench                Run speed tests"
+	@echo " $(MAKE) check                  Run block, qapi-schema, unit, softfloat, qtest and decodetree tests"
+	@echo " $(MAKE) bench                  Run speed tests"
 	@echo
 	@echo "Individual test suites:"
-	@echo " $(MAKE) check-qtest-TARGET   Run qtest tests for given target"
-	@echo " $(MAKE) check-qtest          Run qtest tests"
-	@echo " $(MAKE) check-unit           Run qobject tests"
-	@echo " $(MAKE) check-qapi-schema    Run QAPI schema tests"
-	@echo " $(MAKE) check-block          Run block tests"
+	@echo " $(MAKE) check-qtest-TARGET     Run qtest tests for given target"
+	@echo " $(MAKE) check-qtest            Run qtest tests"
+	@echo " $(MAKE) check-unit             Run qobject tests"
+	@echo " $(MAKE) check-qapi-schema      Run QAPI schema tests"
+	@echo " $(MAKE) check-block            Run block tests"
 ifneq ($(filter $(all-check-targets), check-softfloat),)
-	@echo " $(MAKE) check-tcg            Run TCG tests"
-	@echo " $(MAKE) check-softfloat      Run FPU emulation tests"
+	@echo " $(MAKE) check-tcg              Run TCG tests"
+	@echo " $(MAKE) check-softfloat        Run FPU emulation tests"
 endif
-	@echo " $(MAKE) check-avocado        Run avocado (integration) tests for currently configured targets"
+	@echo " $(MAKE) check-avocado          Run avocado (integration) tests for currently configured targets"
 	@echo
-	@echo " $(MAKE) check-report.tap     Generates an aggregated TAP test report"
-	@echo " $(MAKE) check-venv           Creates a Python venv for tests"
-	@echo " $(MAKE) check-clean          Clean the tests and related data"
+	@echo " $(MAKE) check-report.junit.xml Generates an aggregated XML test report"
+	@echo " $(MAKE) check-venv             Creates a Python venv for tests"
+	@echo " $(MAKE) check-clean            Clean the tests and related data"
 	@echo
 	@echo "The following are useful for CI builds"
-	@echo " $(MAKE) check-build          Build most test binaries"
-	@echo " $(MAKE) get-vm-images        Downloads all images used by avocado tests, according to configured targets (~350 MB each, 1.5 GB max)"
+	@echo " $(MAKE) check-build            Build most test binaries"
+	@echo " $(MAKE) get-vm-images          Downloads all images used by avocado tests, according to configured targets (~350 MB each, 1.5 GB max)"
 	@echo
 	@echo
 	@echo "The variable SPEED can be set to control the gtester speed setting."
-- 
2.36.1



