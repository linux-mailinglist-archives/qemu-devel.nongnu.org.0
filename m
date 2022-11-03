Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD074618418
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:19:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqcwa-0004Ir-HK; Thu, 03 Nov 2022 12:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqcuf-0000uN-4J; Thu, 03 Nov 2022 12:18:00 -0400
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqcuR-00087M-Jg; Thu, 03 Nov 2022 12:17:45 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MyseA-1pBt793ZYY-00vvzg; Thu, 03
 Nov 2022 17:17:34 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 09/10] target/tricore: Rename csfr.def -> csfr.h.inc
Date: Thu,  3 Nov 2022 17:17:26 +0100
Message-Id: <20221103161727.4116147-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221103161727.4116147-1-laurent@vivier.eu>
References: <20221103161727.4116147-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8E4dBtgYRVoAC+EnsgpeE+/ot8vvhCoHU3BGrydozZryu+ic0iv
 WZZjWNa8FkQhtRKyUyrZqMFNZxXhCt/YneHlQRoPfLsN4GrekzAXqJv/oFne5I5Ea8EKwGF
 vEknyxaUD2FL9CMQ2TZnVqKCbXRd2GmOSmT5/bJo5gd2pvbBJsrmimJ6HMhPQbUZf7MSTFJ
 PAsOT6DxANB4K+vURDnsA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6Z5eQ/yeXMs=:8fSExvAy4KMEnQrxN0gOqt
 Xxuuellsnm9W42jJMm0vJ/ffDNYdP9GTAGN5joPLFYhI/muJHdhHlM5NXYaTAqsObRFZKxPTh
 wbSWaVENaRtz1968b6iigKP460kO5QapB2Bp3cCV4xwxrkw5Xqo/bWXAve1+Kq33/y4jnuJEa
 u7wkSdMgmqgHm/kZL8ZiNPRweWNY54Cv2gh1pxNPmTdAqYx3Xgf03c8AZXaQgh6RtFIOZomOW
 ASB7bVCH7uAC3pCxC31PAxf21Fy4Ftz6Pl3r5Sf6BM3YaGubD7/FJ2CYM/7bF4iMg7lY5VmpG
 SV05gVs+fAULH8pY0iB8gjsrvaBhCj8ACqGDwZtUHioMv3QOMzOtJQPR1hbsmHpWA7b9MdpLJ
 hTNBBAlp4ekCeHroe2WFsqzWVZQ5uG2sYnYqO1dh8zBHoPOrVA8cA4vz7EmB3YqzWgpqT2WY1
 TEcAHBXsLM+zQx9Q5gl2euEfcciEKtKC0nBzCmwkakUE9sNQPaB6Tzp+J4m9APvxeWYn2krTH
 DLSBC/21cRJ2Nov5Bq5JoGUBpDzT4pq6HDAbLLC1CwqyQQEevUYEsmbeVsWJPUDYbaMLVBaFI
 cgSfbapu+d3OcVWdm7UYcuQmByQy0iOTwpATBT72I1YccyVBApYTV5LZra/eMD7IAlJ2SFvkj
 3X6u9R9sYkS8dkVJycUXOAhd5LL6CxrgRTKZIBt+zTdIHLpB8EyBZgny7nK/xDsBavkCPJVcD
 YM+zO5127dJxsWu13JyGa7PPTai87U/khmEQXmd9bp0ILsBrAKtPmd/iEM4r14fxlsjvUrIiN
 gIQzbrv
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_NONE=0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221025235006.7215-4-philmd@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/tricore/{csfr.def => csfr.h.inc} | 0
 target/tricore/translate.c              | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename target/tricore/{csfr.def => csfr.h.inc} (100%)

diff --git a/target/tricore/csfr.def b/target/tricore/csfr.h.inc
similarity index 100%
rename from target/tricore/csfr.def
rename to target/tricore/csfr.h.inc
diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index c5b7bfbf2013..df9e46c6495e 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -388,7 +388,7 @@ static inline void gen_mfcr(DisasContext *ctx, TCGv ret, int32_t offset)
         gen_helper_psw_read(ret, cpu_env);
     } else {
         switch (offset) {
-#include "csfr.def"
+#include "csfr.h.inc"
         }
     }
 }
@@ -418,7 +418,7 @@ static inline void gen_mtcr(DisasContext *ctx, TCGv r1,
             gen_helper_psw_write(cpu_env, r1);
         } else {
             switch (offset) {
-#include "csfr.def"
+#include "csfr.h.inc"
             }
         }
     } else {
-- 
2.37.3


