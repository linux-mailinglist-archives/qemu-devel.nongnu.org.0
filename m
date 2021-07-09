Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 426623C2A72
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 22:38:43 +0200 (CEST)
Received: from localhost ([::1]:39564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1xGk-0005OT-Bi
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 16:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1x77-0006Zq-TI; Fri, 09 Jul 2021 16:28:45 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:60251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1x75-0007ZC-Q9; Fri, 09 Jul 2021 16:28:45 -0400
Received: from quad ([82.142.13.34]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MLR5h-1llFRG2Ijb-00ISQK; Fri, 09
 Jul 2021 22:28:29 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/9] misc: Fix "havn't" typo
Date: Fri,  9 Jul 2021 22:28:18 +0200
Message-Id: <20210709202824.578187-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709202824.578187-1-laurent@vivier.eu>
References: <20210709202824.578187-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fiji7J95S0VPK22FvbcrUoEtqfg2bHGGldJ4mXbCkcnKOud9wHH
 Hwown/70qQir91+ZBO9CHZ7CMSExUPD2EnlZsHh0G4qBak1Uc5S7MDlq4VPkn24rI8g5xKe
 UzVuce2+EMYKcaQwpky5nc1dYsHlBXFsR6seWCsjhA+wGilFNgJcL+VA3+v6LcUV/uThHXC
 ZRg5sbVRiY4WlKnPHWwhw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4Fbirk5JePc=:1nSig/NJeYwQ/z1A5aTaAY
 Y0pAei8v3ZKkSY6bBPOUAhEbuabWIfCBaPeQbBp2wQv/WZOnhNQ9UpewRqDfsV3AvmuXLkLML
 A0UHqdKvmdIkEUxxggofMt/KUYoMh3ReIaUidbK4s2MkNsFHgLSYPIp7GmxIMA8IhSY1Wb1HP
 S5jsn7d98hHjExZq7oYtv37826w1jDPZ8ZimlUAsa3XbE60ir89UtOwLn/30xyaFEs8/KlwdT
 WGVVP/rtSL/QcqHPgJMWdOIfbAYmo8lNzZf58+2XCodOp1DO5bTcL3S7tKhkV2QFa+BtcAw+H
 U+RyzoAJV9N6/+VLzCepoMcVftr23tDSpr0SP1Ev5qGonzFAw5GjO73yZ54kM4Nuk2A45vZUj
 oCJLIThWfUE2RLgMe69ZRc4D+vH4YOhELMaJsI53UDg5+IkpSpNuQQJRcjFsZmB5DYv4VTo6r
 qX3q/vyMJlwNkWAxkVne/8AbCUf/XjcMyiDhEoaCq55mTLNnwZsbgh6kaxCBTNSMpVpc/eCH6
 cXG6I3SfWBAlYbSrkbfuUNgrcbpAEb0/f8R5NH/Kcrq3hSldRn3a5JYtpHrXNT3TkIUMlOEgm
 aoemFoZ/TXaoW9zu99rvm4tAJEJh7wqa9VgZIYabaJC0hxphefPxHp3LShP1hvGoEgTrqpgAd
 EkPK6fMOax1RajYNx5JGoTwAeGxBFGSZJRbQrkIhQQPxnuLwCOKH4T3YBYBy9890KqxWtaB89
 GAfawmZp/HFehTmhwgT6MAlSot+X5kF5oq+ypuvxjc1ZO0R8JB7MID+qn5KcAJIOz16AWIH93
 FyBCuOrWSsNkWqDFGL7e8wKzqAfFmTWrU9KVjV7Ru0y5dVQ/92Tw88S/ijL/DSpr260duWL
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Fix "havn't (make)" -> "haven't (made)" typo.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210629051400.2573253-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/usb/desc-msos.c         | 2 +-
 target/s390x/translate.c   | 6 ++++--
 tcg/arm/tcg-target.c.inc   | 6 ++++--
 tcg/sparc/tcg-target.c.inc | 6 ++++--
 tcg/tcg-op.c               | 2 +-
 5 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/hw/usb/desc-msos.c b/hw/usb/desc-msos.c
index 3a5ad7c8d0f8..836e38c67e1e 100644
--- a/hw/usb/desc-msos.c
+++ b/hw/usb/desc-msos.c
@@ -181,7 +181,7 @@ static int usb_desc_msos_prop(const USBDesc *desc, uint8_t *dest)
 
     if (desc->msos->Label) {
         /*
-         * Given as example in the specs.  Havn't figured yet where
+         * Given as example in the specs.  Haven't figured yet where
          * this label shows up in the windows gui.
          */
         length += usb_desc_msos_prop_str(dest+length, MSOS_REG_SZ,
diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index 03dab9f3507a..8822603a6e7d 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -6270,8 +6270,10 @@ static void extract_field(DisasFields *o, const DisasField *f, uint64_t insn)
         abort();
     }
 
-    /* Validate that the "compressed" encoding we selected above is valid.
-       I.e. we havn't make two different original fields overlap.  */
+    /*
+     * Validate that the "compressed" encoding we selected above is valid.
+     * I.e. we haven't made two different original fields overlap.
+     */
     assert(((o->presentC >> f->indexC) & 1) == 0);
     o->presentC |= 1 << f->indexC;
     o->presentO |= 1 << f->indexO;
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 7a761a602e2c..007ceee68e23 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -2407,8 +2407,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
 static void tcg_target_init(TCGContext *s)
 {
-    /* Only probe for the platform and capabilities if we havn't already
-       determined maximum values at compile time.  */
+    /*
+     * Only probe for the platform and capabilities if we haven't already
+     * determined maximum values at compile time.
+     */
 #if !defined(use_idiv_instructions) || !defined(use_neon_instructions)
     {
         unsigned long hwcap = qemu_getauxval(AT_HWCAP);
diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index a6ec94a094fa..688827968b02 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -1690,8 +1690,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
 static void tcg_target_init(TCGContext *s)
 {
-    /* Only probe for the platform and capabilities if we havn't already
-       determined maximum values at compile time.  */
+    /*
+     * Only probe for the platform and capabilities if we haven't already
+     * determined maximum values at compile time.
+     */
 #ifndef use_vis3_instructions
     {
         unsigned long hwcap = qemu_getauxval(AT_HWCAP);
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 44d711c0fc4a..58a34b5147b5 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2741,7 +2741,7 @@ void tcg_gen_goto_tb(unsigned idx)
     /* We only support two chained exits.  */
     tcg_debug_assert(idx <= TB_EXIT_IDXMAX);
 #ifdef CONFIG_DEBUG_TCG
-    /* Verify that we havn't seen this numbered exit before.  */
+    /* Verify that we haven't seen this numbered exit before.  */
     tcg_debug_assert((tcg_ctx->goto_tb_issue_mask & (1 << idx)) == 0);
     tcg_ctx->goto_tb_issue_mask |= 1 << idx;
 #endif
-- 
2.31.1


