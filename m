Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E853334AEC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 23:05:38 +0100 (CET)
Received: from localhost ([::1]:40406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK6xV-0001bk-Fp
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 17:05:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6eB-0003FT-C0; Wed, 10 Mar 2021 16:45:39 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:37851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6e3-0004TV-Qd; Wed, 10 Mar 2021 16:45:39 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mr8SG-1m8Eh01aLO-00oEZi; Wed, 10 Mar 2021 22:45:24 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 16/22] tests/fp/fp-test: Replace the word 'blacklist'
Date: Wed, 10 Mar 2021 22:44:58 +0100
Message-Id: <20210310214504.1183162-17-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310214504.1183162-1-laurent@vivier.eu>
References: <20210310214504.1183162-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:A+Q/w2Ck9Mm8oiHHM5SogxE2dKCRGjoNHmFPTCi8o35kVlzcMjs
 FM7K6a/sIsIOSniSWyAn2vpw+ECphvI3BmNQy3l9VfQMEm6mce6oIVQsbn71jWK1SOzVCqS
 p7Z+BcCqHQfruBcmYPFbn3gs7bXwX96k2GogX4vLzKGlPmV8T6AQpIkt1bdp2zocnvLOvNT
 sF3sz+eeHmHbCvu+KthGg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7Q5m8vQbm1E=:toMlx6VYrvo7s6QFGTIl5u
 Zq8rZy+VA9eZ+OyGYQK8G7JGvgOsOtqGCXnMQJpM2MV3sPlKnvwbgIA37Ac45OfHpe0tiHt+s
 YkFY0N9uPP8UzBrT71bjIpifWTqQc4cOn+F5HCpoEx/Oj5WTdk6cBWpKwOKU06073uymgfTvE
 3VR3iMx932XjeyAIqKOtrTVt5poTRoPNzPSQ4Ly1QkptFKztDrr5vRyCAivvdWO/Eh1cv6g5n
 g+VNEdb7VYDqgXlrDZ7DBWtTB8Arhl0Aal6D0FOVEO5P+FeAI/McEulaghsAkg+GWlPwQGHYf
 Mwi6r+cVVERrqIJ8ojTlgPkWKeaGThKDGAEDhEKHm++q5bRwsUAEuP8jxrJcPtjfWlzGpn48f
 V5SW6OilQfvyevmqaqO5T8O2nI/85Pw60Huf+J6Fx42mjYAaPO8R6G5P/eAGdKiHFGq0oUd19
 PLYXguWGPg==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the word "blacklist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Acked-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210303184644.1639691-6-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/fp/fp-test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/fp/fp-test.c b/tests/fp/fp-test.c
index 06ffebd6db17..5a4cad8c8b23 100644
--- a/tests/fp/fp-test.c
+++ b/tests/fp/fp-test.c
@@ -123,7 +123,7 @@ static void not_implemented(void)
     fprintf(stderr, "Not implemented.\n");
 }
 
-static bool blacklisted(unsigned op, int rmode)
+static bool is_allowed(unsigned op, int rmode)
 {
     /* odd has not been implemented for any 80-bit ops */
     if (rmode == softfloat_round_odd) {
@@ -161,10 +161,10 @@ static bool blacklisted(unsigned op, int rmode)
         case F32_TO_EXTF80:
         case F64_TO_EXTF80:
         case F128_TO_EXTF80:
-            return true;
+            return false;
         }
     }
-    return false;
+    return true;
 }
 
 static void do_testfloat(int op, int rmode, bool exact)
@@ -194,7 +194,7 @@ static void do_testfloat(int op, int rmode, bool exact)
     verCases_writeFunctionName(stderr);
     fputs("\n", stderr);
 
-    if (blacklisted(op, rmode)) {
+    if (!is_allowed(op, rmode)) {
         not_implemented();
         return;
     }
-- 
2.29.2


