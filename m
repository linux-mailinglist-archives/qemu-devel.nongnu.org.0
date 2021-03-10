Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5750334A3A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 23:00:36 +0100 (CET)
Received: from localhost ([::1]:59852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK6sd-0005xx-8F
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 17:00:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6e6-0003Bp-Vj; Wed, 10 Mar 2021 16:45:35 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:59397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6dz-0004Ss-GH; Wed, 10 Mar 2021 16:45:34 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MpDa5-1m5ket1eTX-00qhPj; Wed, 10 Mar 2021 22:45:12 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 04/22] target/hexagon/gen_tcg_funcs: Fix a typo
Date: Wed, 10 Mar 2021 22:44:46 +0100
Message-Id: <20210310214504.1183162-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310214504.1183162-1-laurent@vivier.eu>
References: <20210310214504.1183162-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1HzP3T3i5x3/c3U0QIy+yUdr7gwAjaZFljgqVcu9j1yJDZqXcfS
 tL899QeJcbu4IqFP/8Hyhh3z1mcOYc70xagT4BaMDqt3AFpSkDAVRdJuRPQKkRpJ1c5b8yL
 rVHGY+3Zl0ByfUlnpZgc+4ASitvzW1QzfqPMbi2iKsBJPlJPXEkk19iIByoZVBZDoTW/fsn
 YcgU8xuS+W71wVjqIdCNg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eiFzHUNU1rk=:s2IUdHCKg3+qW6nToRsJ2C
 eI+5epYVxfoeI2meTcF5X1RQRXzwebfB4FwTGNXsvf7eXvK5tBgFQSVYPYKiGt4H73jDVo5ud
 CnpiUdqTL+aC0T9Pz7Cd94Dk5tmtzlzYpa9QyDzSobhdwxvwIgT5DHjzLYSnEJuITx6E3PJ1b
 HuKkSASMLGh+RizUmHAYU79JczqOe2qv/eZI8uxYhLr/idc4Pj2+3GdmumaqN+dNO4Z8ncnN6
 VgJAQexnn0MH2JGsQtsz8n0Gkmxd0lb4e2MwdhvDcSQRvRm1POksFvrwPZGQk1EKK5D99b8W0
 4B5ZT8nRZ8l+i08Uzrlqis1O4js9NLzTQg2lZeFsoUzGN3yWM/HEEUyR8dtxbXtP2IfplCILx
 f931dLEBTPiznB6MEMptKE2m0WrPQjX0h0LgnmxD272Z7O4uACnMi0z3ueA7DGMxA46Qmqino
 6Nc+BIHf4A==
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
Cc: qemu-trivial@nongnu.org, Taylor Simpson <tsimpson@quicinc.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Message-Id: <20210225181507.3624509-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/hexagon/gen_tcg_funcs.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/hexagon/gen_tcg_funcs.py b/target/hexagon/gen_tcg_funcs.py
index fe4d8e57303a..db9f663a778e 100755
--- a/target/hexagon/gen_tcg_funcs.py
+++ b/target/hexagon/gen_tcg_funcs.py
@@ -35,7 +35,7 @@ def gen_decl_ea_tcg(f, tag):
 def gen_free_ea_tcg(f):
     f.write("    tcg_temp_free(EA);\n")
 
-def genptr_decl_pair_writeble(f, tag, regtype, regid, regno):
+def genptr_decl_pair_writable(f, tag, regtype, regid, regno):
     regN="%s%sN" % (regtype,regid)
     f.write("    TCGv_i64 %s%sV = tcg_temp_local_new_i64();\n" % \
         (regtype, regid))
@@ -54,7 +54,7 @@ def genptr_decl_pair_writeble(f, tag, regtype, regid, regno):
                              (regN, regN))
         f.write("    }\n")
 
-def genptr_decl_writeble(f, tag, regtype, regid, regno):
+def genptr_decl_writable(f, tag, regtype, regid, regno):
     regN="%s%sN" % (regtype,regid)
     f.write("    TCGv %s%sV = tcg_temp_local_new();\n" % \
         (regtype, regid))
@@ -78,12 +78,12 @@ def genptr_decl(f, tag, regtype, regid, regno):
             f.write("    const int %s = insn->regno[%d];\n" % \
                 (regN, regno))
         elif (regid in {"dd", "ee", "xx", "yy"}):
-            genptr_decl_pair_writeble(f, tag, regtype, regid, regno)
+            genptr_decl_pair_writable(f, tag, regtype, regid, regno)
         elif (regid in {"s", "t", "u", "v"}):
             f.write("    TCGv %s%sV = hex_gpr[insn->regno[%d]];\n" % \
                 (regtype, regid, regno))
         elif (regid in {"d", "e", "x", "y"}):
-            genptr_decl_writeble(f, tag, regtype, regid, regno)
+            genptr_decl_writable(f, tag, regtype, regid, regno)
         else:
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "P"):
@@ -91,7 +91,7 @@ def genptr_decl(f, tag, regtype, regid, regno):
             f.write("    TCGv %s%sV = hex_pred[insn->regno[%d]];\n" % \
                 (regtype, regid, regno))
         elif (regid in {"d", "e", "x"}):
-            genptr_decl_writeble(f, tag, regtype, regid, regno)
+            genptr_decl_writable(f, tag, regtype, regid, regno)
         else:
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "C"):
@@ -101,14 +101,14 @@ def genptr_decl(f, tag, regtype, regid, regno):
             f.write("    const int %s = insn->regno[%d] + HEX_REG_SA0;\n" % \
                 (regN, regno))
         elif (regid == "dd"):
-            genptr_decl_pair_writeble(f, tag, regtype, regid, regno)
+            genptr_decl_pair_writable(f, tag, regtype, regid, regno)
         elif (regid == "s"):
             f.write("    TCGv %s%sV = tcg_temp_local_new();\n" % \
                 (regtype, regid))
             f.write("    const int %s%sN = insn->regno[%d] + HEX_REG_SA0;\n" % \
                 (regtype, regid, regno))
         elif (regid == "d"):
-            genptr_decl_writeble(f, tag, regtype, regid, regno)
+            genptr_decl_writable(f, tag, regtype, regid, regno)
         else:
             print("Bad register parse: ", regtype, regid)
     elif (regtype == "M"):
-- 
2.29.2


