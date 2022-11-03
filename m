Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF06618432
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:22:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqcwf-0004zY-54; Thu, 03 Nov 2022 12:19:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqcuU-0000pi-KM; Thu, 03 Nov 2022 12:18:00 -0400
Received: from mout.kundenserver.de ([212.227.126.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqcuR-00087Q-04; Thu, 03 Nov 2022 12:17:40 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mwfj0-1pE4yF12aY-00y8uq; Thu, 03
 Nov 2022 17:17:33 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 08/10] target/s390x: Rename insn-data/format.def ->
 insn-data/format.h.inc
Date: Thu,  3 Nov 2022 17:17:25 +0100
Message-Id: <20221103161727.4116147-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221103161727.4116147-1-laurent@vivier.eu>
References: <20221103161727.4116147-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:INBG5XPnmLC0Yn23mMRjd3dakHhX1xQbSM9teoLHSmlfgw1awEK
 GVhQMlIv4ByZXzBGm7LGGVBp4hpGX2BysBNJ6uCq1/PAI0J49l+cXOni3DmoZPP42vmG8yb
 nwxFw0YlUsG8EySbvX70l7/sAr+bspdLokcwPrzqo1mNhUDCWasuIHvvtduXw3BEPorRPeR
 Ogbxb9GDsVwBlbvy2/TPw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SSZtkizDVT0=:3ToH93LiwSNfrmwsTe+9LJ
 v4tPKRXdVTRLK2RYCAUx13LD6xnjLE43/buaQDURm4BVuBLrUEJdEgnSJXpuGxOrSF64NepmN
 PQrNy3+vHVmKx+b1fYdbiege83hOcZ3a4ojDQFpHZeJ8a0U/R7vbWNV9IORiKw7YFplk+CzKD
 cDCig+4EioWtDAwbjElVqbnIIamP0Bo3/fN9D0yUNbUiG4QH0w+qR0UrrLbfIEHuIOMuagTxA
 k6HbVBjJl/Sfb6ZXwXIdDL3mEn6nc/4z/Bl2Wq1Jdrs0OiGjpCEYezVsvH7SC0LMQFHCmZfQj
 I4KjbuGezRSnhOcUWEbYZLdebxMLyCLFCBR7XkUlHQr4vkCmkUPrBSSVufYWn3ftjPaTH9Gkx
 MpTzmHCv38nII6ZZsfR+uzuQ7IkbsCMaYoAshrcp0hVCk1SZ5UccE+tyRDKi5MmXUhP30U5nA
 rdFarpu0Zok4xE0ifd7OSPn6ld97nqpMoxNBOdwYRufZoq+MhwTQg6PvyVC3rSlardQjarUo/
 ZJ2tMUMnq9kQM4U7yZI8ZdrQfDETex5uP/vDrJaC2qPRJ1Tw5dFcv2fddDi5NrSd7pXT77UkB
 A1s/VSlfKtsccGNwudXkxjo1txpyGMfkvieoEG7ZTAYkgN+WLzTxmuRXJGunlXV9zne72vKtT
 zNTves9KnB/tzE4agkCqHqmVW+xbSR27cPkuNFZ/LsMTRqLDEriuTacjJVqwwlJ9tqqnKmZEf
 udiHXJKxah34adQZ3sm3FiPmIcU1bfZ6Tiems21HMPC3Gbs9BnwGiePzErGP1mUGqLBPXYY60
 /CPK+gl
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221025235006.7215-3-philmd@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/s390x/tcg/{insn-data.def => insn-data.h.inc}    |  2 +-
 .../s390x/tcg/{insn-format.def => insn-format.h.inc}   |  0
 target/s390x/tcg/translate.c                           | 10 +++++-----
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename target/s390x/tcg/{insn-data.def => insn-data.h.inc} (99%)
 rename target/s390x/tcg/{insn-format.def => insn-format.h.inc} (100%)

diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.h.inc
similarity index 99%
rename from target/s390x/tcg/insn-data.def
rename to target/s390x/tcg/insn-data.h.inc
index 6382ceabfcfa..7e952bdfc828 100644
--- a/target/s390x/tcg/insn-data.def
+++ b/target/s390x/tcg/insn-data.h.inc
@@ -8,7 +8,7 @@
  *
  *  OPC  = (op << 8) | op2 where op is the major, op2 the minor opcode
  *  NAME = name of the opcode, used internally
- *  FMT  = format of the opcode (defined in insn-format.def)
+ *  FMT  = format of the opcode (defined in insn-format.h.inc)
  *  FAC  = facility the opcode is available in (defined in DisasFacility)
  *  I1   = func in1_xx fills o->in1
  *  I2   = func in2_xx fills o->in2
diff --git a/target/s390x/tcg/insn-format.def b/target/s390x/tcg/insn-format.h.inc
similarity index 100%
rename from target/s390x/tcg/insn-format.def
rename to target/s390x/tcg/insn-format.h.inc
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 03efccdf9f92..2fbdab72523e 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1011,7 +1011,7 @@ static void free_compare(DisasCompare *c)
 #define F6(N, X1, X2, X3, X4, X5, X6) F0(N)
 
 typedef enum {
-#include "insn-format.def"
+#include "insn-format.h.inc"
 } DisasFormat;
 
 #undef F0
@@ -1076,7 +1076,7 @@ typedef struct DisasFormatInfo {
 #define F6(N, X1, X2, X3, X4, X5, X6)       { { X1, X2, X3, X4, X5, X6 } },
 
 static const DisasFormatInfo format_info[] = {
-#include "insn-format.def"
+#include "insn-format.h.inc"
 };
 
 #undef F0
@@ -6143,7 +6143,7 @@ static void in2_insn(DisasContext *s, DisasOps *o)
 #define E(OPC, NM, FT, FC, I1, I2, P, W, OP, CC, D, FL) insn_ ## NM,
 
 enum DisasInsnEnum {
-#include "insn-data.def"
+#include "insn-data.h.inc"
 };
 
 #undef E
@@ -6223,7 +6223,7 @@ enum DisasInsnEnum {
 #define FAC_MIE3        S390_FEAT_MISC_INSTRUCTION_EXT3 /* miscellaneous-instruction-extensions facility 3 */
 
 static const DisasInsn insn_info[] = {
-#include "insn-data.def"
+#include "insn-data.h.inc"
 };
 
 #undef E
@@ -6233,7 +6233,7 @@ static const DisasInsn insn_info[] = {
 static const DisasInsn *lookup_opc(uint16_t opc)
 {
     switch (opc) {
-#include "insn-data.def"
+#include "insn-data.h.inc"
     default:
         return NULL;
     }
-- 
2.37.3


