Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72473307786
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 14:59:26 +0100 (CET)
Received: from localhost ([::1]:51752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l57pV-0008Q9-D9
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 08:59:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1l57mr-0007TY-Az
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:56:41 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:59410
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1l57mn-0000CX-BP
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:56:40 -0500
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id 01D1FDA07BF;
 Thu, 28 Jan 2021 14:56:35 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id EE192460C81; Thu, 28 Jan 2021 14:56:34 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] tests/tcg: Replace /bin/true by true (required on macOS)
Date: Thu, 28 Jan 2021 14:56:27 +0100
Message-Id: <20210128135627.2067003-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

/bin/true is missing on macOS, but simply "true" is available as a shell builtin.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

A similar change might be needed for tests/qemu-iotests.

Regards,
Stefan

 tests/tcg/Makefile.qemu | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/Makefile.qemu b/tests/tcg/Makefile.qemu
index c096c611a2..a56564660c 100644
--- a/tests/tcg/Makefile.qemu
+++ b/tests/tcg/Makefile.qemu
@@ -90,11 +90,11 @@ run-guest-tests: guest-tests
 
 else
 guest-tests:
-	$(call quiet-command, /bin/true, "BUILD", \
+	$(call quiet-command, true, "BUILD", \
 		"$(TARGET) guest-tests SKIPPED")
 
 run-guest-tests:
-	$(call quiet-command, /bin/true, "RUN", \
+	$(call quiet-command, true, "RUN", \
 		"tests for $(TARGET) SKIPPED")
 endif
 
-- 
2.24.3 (Apple Git-128)


