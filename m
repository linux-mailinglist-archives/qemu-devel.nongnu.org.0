Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5905661DDEA
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 20:54:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orPDg-0008HB-8V; Sat, 05 Nov 2022 15:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1orPDe-0008Fs-JI; Sat, 05 Nov 2022 15:52:42 -0400
Received: from mout.kundenserver.de ([217.72.192.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1orPDd-0003bY-0C; Sat, 05 Nov 2022 15:52:42 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MowbA-1pMYBi2FR8-00qTk1; Sat, 05
 Nov 2022 20:52:32 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 5/7] target/s390x: Rename insn-data/format.def ->
 insn-data/format.h.inc
Date: Sat,  5 Nov 2022 20:52:25 +0100
Message-Id: <20221105195227.354769-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221105195227.354769-1-laurent@vivier.eu>
References: <20221105195227.354769-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4QjrSxt+6zm8KAvWJtUazKJToJ0b15YRusHzLmi4JHDPYMhl0Bv
 pPYJyg/Hp4QGPfxASGXWi/Oec26Ei4ulU1imbTl+T0VU4a3u/+kiMMawZcuC93dQgEA5Yqv
 cUEXVzx1ALV4Z0t292uI8GOLo2FGK0z0Ou72B07o55wer0IuqtrV63zp/q92zUKsLUqFFXe
 let9SD6EFM/3uLVIJ6Rjg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WnVf/7A3ocE=:4TiXxhbJgrttymcKWPgTEY
 8rgqx3RDijYCnRGS3HaU9zgxD4vSVExTrXe01Yhk8CtaxPFcKt+WPPkrNmMDjkNwAJZGJWjm/
 2Pio1FR9UUYiF9win7QHAZaEbE70xJKzIbcfEiw7XU9viWkORO1R9uaNStwS7npWpDfr4XfZh
 JLgMZnEDwLlkFbd+Zvx98f9gd5HxlukimxjOh58MreHA4DxLYYoycIoBMOxSm4AP29Qq3p44U
 r3awSG7lUcmJduv6UZOKmkMT7iUaghRmONtuBbCLHGlj68WGy9Fa4TYKnRmwUsYgiagFmdxPS
 5cYa0gQNsFOoTVEf/CI/ofIpoAYiALU/MfIWRALkxv1BrIChmgXJ2WKPsWViaHu2EGLugzteC
 B2pgItt2VnrG4oY4v2mFbtfn0kwv38EmdtJjxLR2aLJUReTt/4VuiSRN1pTbyv+qvR0HWfIOM
 LIpGGuU9aTTah6JZWVsuLBncK7t7OFgVfY/9Pro30tmz2UNpwsnQr+KpWrDfzHsyDR4BAqMJA
 F7m9xCgLUKWY0s5VKe5cfsG4OLry8UiJO40A1qQaFlBbAtdQtt3XvUXj6VX9et/a+M/WetUj3
 TxVGVP9OWZ40btm4lWKFQh9Yv+zp45cdrGBjcBBc86x8hMKdMsmikTEt6MHlSYeYnKUbu0Omk
 ioQgSBoBRA+TxR3K+0NBsCTKIkJfZ8Mtg5PlWxc7ajrXG7h7mEcvGS9FHVoDUH52kxjoScvxW
 MgVOi0cS9Ie1Db2U8yiUmq9OARnYO/dVnQFnXVQculEHWNeUKC1/zX4HC9qClzez+5JT59bGw
 8Zt67DY
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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


