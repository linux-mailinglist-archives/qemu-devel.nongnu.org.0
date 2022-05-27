Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8118E5364BF
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 17:32:57 +0200 (CEST)
Received: from localhost ([::1]:33234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nubxQ-00060y-5i
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 11:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1nubvX-00054e-Lf
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:31:00 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:39766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1nubvV-0001c3-Mp
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:30:59 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C7C671F855;
 Fri, 27 May 2022 15:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1653665455; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=M3xBeDYEDWFGqqCmesI1438vmP//SKiuAckeCl2d3+E=;
 b=WHhqpfEfWot/sdT5a9asfBLjC9B5Rri005LqxWD5SJY/blEWbg4Qg2sp+syx8/T8d2+LR4
 M9Mbn0kYuC/xv2XCIYgj8wzkxTiByzU1tikQrlqayMY4dz/C79C4ZNyE+ORBsKMh+bH+ZP
 GM4DuYigYJXskQqfIkXfTLkpc+FIx5A=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A221913A84;
 Fri, 27 May 2022 15:30:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6JMCJa/ukGLsfwAAMHmgww
 (envelope-from <dfaggioli@suse.com>); Fri, 27 May 2022 15:30:55 +0000
Subject: [PATCH] tests/Makefile.include: Fix 'make check-help' output
From: Dario Faggioli <dfaggioli@suse.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 27 May 2022 17:30:54 +0200
Message-ID: <165366545439.6869.11633009118019728798.stgit@work>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=dfaggioli@suse.com;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Since commit 3d2f73ef75e ("build: use "meson test" as the test harness"),
check-report.tap is no more, and we have check-report.junit.xml.

Update the output of 'make check-help', which was still listing
'check-report.tap', accordingly.

Fixes: 3d2f73ef75e
Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/Makefile.include |   30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index ec84b2ebc0..5caa3836ad 100644
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
+	@echo " $(MAKE) check-report.junit.xml Generates an aggregated TAP test report"
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



