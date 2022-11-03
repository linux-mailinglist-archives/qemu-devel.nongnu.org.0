Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB859618429
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:21:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqcwY-0003vP-IN; Thu, 03 Nov 2022 12:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqcuf-0000uM-3U; Thu, 03 Nov 2022 12:18:00 -0400
Received: from mout.kundenserver.de ([212.227.126.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqcuN-00084o-8R; Thu, 03 Nov 2022 12:17:50 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M4s91-1oquHz2WN5-00227l; Thu, 03
 Nov 2022 17:17:32 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 07/10] target/m68k: Rename qregs.def -> qregs.h.inc
Date: Thu,  3 Nov 2022 17:17:24 +0100
Message-Id: <20221103161727.4116147-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221103161727.4116147-1-laurent@vivier.eu>
References: <20221103161727.4116147-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dvSvIvrw089J35lQcZ5ZNwsAyp6pHEQriT/6QC8+EUZR+X4Sysz
 28+Jn1wuzMsEsT6wJPY5SkEhAgpIzyC1oSt0roITnQ1CxpTEHTiNk3qgWXtaeTEDXa33tqk
 eLqGUJaVKpwHGZdGgTlJverFgwGiv3ocM9TBFw/hv7sS1QMWsA5bQbhLTw7Ed9k/o/QvZKg
 OhtK7PqEcPBdthzHB31VQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sAzmYMz7mPg=:ECIKIPHBSWip6pktqXpVrB
 +OoxHulp9tErouyS/IeFpTChZNP7G92dOMBDwIWr+U6/OWcSPYGbtq7qoczE0K/Fk0Ui+fizv
 tCcfI6mLb8Yzs2h1O4jqgJWeqoNCXagCCTT+WvGjZPv61QSVbnQ8Pzu8L1TDjm4ppB8JJQpuw
 Jc6vfEir2GRqU8pi231M2CDW5l+SsuH5QIALchzJQGEZvADk7NUhLDvsV+myMFYZu6dt03XOa
 JW/2huczSe+tniR89O5rziuuIhB5Qr47rwxFD/MQJwSn2ex3SrNHHunVpIIxM68pmjOIHamRr
 DZqTOmhZ4gQj8aWKQFBU5/a7HxvmlIhn23AV8UwS3b9cqlnxuEGv9t9bJ31Psi40QTtJnx/n/
 AfnbZHaWAUb4TT58+6Wd/G+Dq+PlnApQIc0wRwt4J/inZHWJgji3qRYXI/nMz7sy7RC8lykKF
 XdoI8heTc15+bokNl0TAZjN7Cs9cVaHcLB7ug4/RlmlVuf4DcnKklIqETW11mqjHzAN6xt9Ae
 R9vAiVotWibOUtzoYXjkZKlVmFrASzz1jo0XGFHnjpg7Pbt5hO7lZeoJo3hQRRn+WpqXOkdkb
 eivO8yRe6syipZcErU1spehQGovNDwKT05tNQyVhkUtObx8HUtANZJi9qrgehuSAtYhMaPWm4
 ZLDB4PXYsWGZ/pGZH65Hhu2Jy5ZUCoLg7rIKGq7aQa1CysklsMCSU4rGgmIHpaolncbvyV7NB
 01lOTRgOhsfh26eylvKwECVVn8OsLhiTI5v9hOFfoSbA/H+e2bRInWvxI0rc/RM/O5byJJhq1
 HTabcWH
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

We use the .h.inc extension to include C headers. To be consistent
with the rest of the codebase, rename the C headers using the .def
extension.

IDE/tools using our .editorconfig / .gitattributes will leverage
this consistency.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221025235006.7215-2-philmd@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/{qregs.def => qregs.h.inc} | 0
 target/m68k/translate.c                | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename target/m68k/{qregs.def => qregs.h.inc} (100%)

diff --git a/target/m68k/qregs.def b/target/m68k/qregs.h.inc
similarity index 100%
rename from target/m68k/qregs.def
rename to target/m68k/qregs.h.inc
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 5cbde4be3404..18418312b14b 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -39,7 +39,7 @@
 
 #define DEFO32(name, offset) static TCGv QREG_##name;
 #define DEFO64(name, offset) static TCGv_i64 QREG_##name;
-#include "qregs.def"
+#include "qregs.h.inc"
 #undef DEFO32
 #undef DEFO64
 
@@ -75,7 +75,7 @@ void m68k_tcg_init(void)
 #define DEFO64(name, offset) \
     QREG_##name = tcg_global_mem_new_i64(cpu_env, \
         offsetof(CPUM68KState, offset), #name);
-#include "qregs.def"
+#include "qregs.h.inc"
 #undef DEFO32
 #undef DEFO64
 
-- 
2.37.3


