Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA9B61DDEE
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 20:54:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orPDd-0008En-5Y; Sat, 05 Nov 2022 15:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1orPDZ-0008Bh-Im; Sat, 05 Nov 2022 15:52:37 -0400
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1orPDX-0003a1-5t; Sat, 05 Nov 2022 15:52:37 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MHndY-1olIWv3VSA-00Evzt; Sat, 05
 Nov 2022 20:52:32 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 4/7] target/m68k: Rename qregs.def -> qregs.h.inc
Date: Sat,  5 Nov 2022 20:52:24 +0100
Message-Id: <20221105195227.354769-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221105195227.354769-1-laurent@vivier.eu>
References: <20221105195227.354769-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KqkWFJF4qEqDsMz6J3gdsinnXe2P7pXNcsCTwHrIej+gWXe98oG
 a2tESZt5gPPY9Gqw1l6uRJic0KOM2iz1k+Nn9usf9eaWrOUSwwCzqw5KO+b0t3yd6yEkqzS
 tBU5AsZY8DnHfP0ho4n/fpeB+ivJ/Yi7Gmnajaz3EE0QaT3vei4/ODADFm550kNMSPr7tNx
 oOwayi/18+eCWm6aLopdQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SrQzScEA6PM=:yHwhGHzyrD84uoWJiXOK72
 JgCP/newo+WK1943wd878jfSFHWKSdbF0xIjsF/sPxrcBIOHMcJePuG9fBF0DM5DO24Z6vQtj
 A+iHGdKdXBPWNsrWcSxN6mcQ3aVvB7c+DCDT4o2wY+eSP3YxzV8j40+FBJHPjNiOAYmOiipiI
 xnht9+yX+Her5xgnuqcA94oALnIdcTryj9t5r50KJtdztpwmbQ+fMTCjB7crMV+LCHtkJWZUQ
 HZId6LK/MStqhaJt/CR0UNnv7gWU4+UlSwKZ6YRpSSJzvodnDYVRcUGHw9N9QF7dtltuRJwli
 GWl8Rs11wj4zU5mghOZgdnfpNmpWqDzOaaF9hw/GH5d3032bF1dZSeKsZHq0Yw6pUNOZ9B9KC
 PK+MjC/YpsRASnD3SeJkK1S1hyjZZoI76X0ctPJ+HsLu9Im2oAuhKFJSvGX93Elamk48yb9+f
 teU7l6Tufmkyr5s1MEZoguBW1ldEtoBKUCx8KxHJy4tcBYeTITQl+AeHOoXKhQlZGfbCR7MHW
 WZXssddRC/3eRI/FpdexMh4Ez9KUdhc9k1+FHDi2WHYkS7jx7tIH0Lj92Erms2a+S19igAQTl
 02rZ3LwmUCbuLst1uAbBo8xIhIQxNrO1zIFP3YtuowfQVV8a3i/cKtT4VFDskU4ABEyq/gfDy
 CnrIUW5xxMQiGTsjk21D/8VNF++M0VLvTkOLc9MTC9p+ClWKANNVGVRyILw6DEpLI4ocNiV2K
 2shWdwNoBI88fw0qUwVX4V7pdQf9KjYDWUuTE6xouWFCGgW92CpTldMBjNs/mCuHPr2K/bFKM
 IrWgKc1
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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


