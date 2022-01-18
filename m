Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C12492764
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 14:43:22 +0100 (CET)
Received: from localhost ([::1]:58432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9old-0000ZY-4M
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 08:43:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9nbd-0004ZV-RZ; Tue, 18 Jan 2022 07:28:57 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:51291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n9nbb-0001ui-RX; Tue, 18 Jan 2022 07:28:57 -0500
Received: from quad ([82.142.13.186]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M3VAI-1n9FNB1tHG-000gBP; Tue, 18
 Jan 2022 13:28:51 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/9] tests: Fix typo in check-help output
Date: Tue, 18 Jan 2022 13:28:42 +0100
Message-Id: <20220118122847.636461-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118122847.636461-1-laurent@vivier.eu>
References: <20220118122847.636461-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:i6PYalnVU2B2ycDWxlaBzav/aWen7xXrmyb15vd3e3gWxsJuWvq
 M/6ncqwhCw/OLAvx8QET447iEO/OW2Yum9vN37JuXoTfE9Xzw6iPlHyCkpFXHCtK0cSMFhY
 +by/oXo9t3mxYBe7SDjnRtoSiEk1vtU4WdvxK7lAX5AvSeFFHZdSHm43blnSFJ7meQSRz46
 rdqzocIheiU6icnlxobnw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:on+rD648Jcs=:MojisKvTT3W39aEIZKwlnL
 JVMNiKOc/BQppiJWustL2Bou2Dli8Xv8OJU+/WjfWKqLywI4ZyxzLwkuzGNDKLOCHjhb7HzbW
 n05ldfDJzCyVXKj6MfqWpdX1qHiDrwDHChjWXggoeGKXxamXK+a3JexmvX80h8XJF6vxPNisC
 tjtXedTuDPWMmhaiQH81onCKgjlyyLs07KUIp3dhaQMRIo5Gcl4BXDhEghi2S8WOZJmWmg45Y
 lo/GVKibwugYPGqF1cTboHmSg24ILiNx7+yU7RHbLy8AGM372sfpkVxkMQd2lMXe8EM41bBcQ
 Q0VGnZuim68iOH0a3KN4L4zxydycy2Q/eKK6dcZDDMsqb5LPccUUuBsfRnrU5skh5RuX0vgK6
 ZygdCzg1ES1xQnF1FxvxCuhgeYqVHmor38i2qbze9nqhF/nCYpcSp4d0XHkWTcHGsbLpyceBz
 vNhiczfxVZFQOw7uEqel9ss+Nb/RBdvISlUZXuvzec8h25kpv9l6BHFWUkaY7EE6NDdrWcWP+
 Zyrgtlc9J92zAq1cL2BElqJJ9c1YrSmA+gDPz6g7zshc1RK2iOqeVoLaae/+O4ZwP46CUf5FY
 uSMjo5LLfJRFqLObOa2k8iYISqsQqAtcnzKjhPbfigEUGIwLTZE6Qe7C9tL6f50oyKFY0Gsar
 Ks+tyDGTZ03qMxW1r4i7dYCffWkMuMDtGk2XTH6UC7psvZ8+NIjcAi/iepp5bIxd7vUE=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Fix typo in 'make check-help' output.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220111175528.22294-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 4c564cf7899e..3aba62240099 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -23,7 +23,7 @@ endif
 	@echo " $(MAKE) check-clean          Clean the tests and related data"
 	@echo
 	@echo "The following are useful for CI builds"
-	@echo " $(MAKE) check-build          Build most test binaris"
+	@echo " $(MAKE) check-build          Build most test binaries"
 	@echo " $(MAKE) get-vm-images        Downloads all images used by avocado tests, according to configured targets (~350 MB each, 1.5 GB max)"
 	@echo
 	@echo
-- 
2.34.1


