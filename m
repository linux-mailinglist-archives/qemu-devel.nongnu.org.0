Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A326A8944
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 20:14:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXoLT-0008Jo-H4; Thu, 02 Mar 2023 14:12:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pXoLR-0008FH-Mn; Thu, 02 Mar 2023 14:12:01 -0500
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pXoLQ-0006iU-16; Thu, 02 Mar 2023 14:12:01 -0500
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 7980A261092;
 Thu,  2 Mar 2023 20:11:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IdTaJIq_VHC0; Thu,  2 Mar 2023 20:11:51 +0100 (CET)
Received: from puchatek.lan (83.11.36.13.ipv4.supernova.orange.pl
 [83.11.36.13])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id C74EA260167;
 Thu,  2 Mar 2023 20:11:50 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 1/3] tests/avocado: update AArch64 tests to Alpine 3.17.2
Date: Thu,  2 Mar 2023 20:11:44 +0100
Message-Id: <20230302191146.1790560-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

To test Alpine boot on SBSA-Ref target we need Alpine Linux
'standard' image as 'virt' one lacks kernel modules.

So to minimalize Avocado cache I move test to 'standard' image.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 tests/avocado/machine_aarch64_virt.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/avocado/machine_aarch64_virt.py b/tests/avocado/machine_aarch64_virt.py
index 25dab8dc00..a90dc6ff4b 100644
--- a/tests/avocado/machine_aarch64_virt.py
+++ b/tests/avocado/machine_aarch64_virt.py
@@ -38,11 +38,11 @@ def test_alpine_virt_tcg_gic_max(self):
         :avocado: tags=accel:tcg
         """
         iso_url = ('https://dl-cdn.alpinelinux.org/'
-                   'alpine/v3.16/releases/aarch64/'
-                   'alpine-virt-3.16.3-aarch64.iso')
+                   'alpine/v3.17/releases/aarch64/'
+                   'alpine-standard-3.17.2-aarch64.iso')
 
         # Alpine use sha256 so I recalculated this myself
-        iso_sha1 = '0683bc089486d55c91bf6607d5ecb93925769bc0'
+        iso_sha1 = '76284fcd7b41fe899b0c2375ceb8470803eea839'
         iso_path = self.fetch_asset(iso_url, asset_hash=iso_sha1)
 
         self.vm.set_console()
@@ -65,7 +65,7 @@ def test_alpine_virt_tcg_gic_max(self):
         self.vm.add_args('-object', 'rng-random,id=rng0,filename=/dev/urandom')
 
         self.vm.launch()
-        self.wait_for_console_pattern('Welcome to Alpine Linux 3.16')
+        self.wait_for_console_pattern('Welcome to Alpine Linux 3.17')
 
 
     def common_aarch64_virt(self, machine):
-- 
2.39.2


