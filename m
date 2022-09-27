Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79325EBB09
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 08:56:55 +0200 (CEST)
Received: from localhost ([::1]:35066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od4WU-000899-Qz
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 02:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od43L-0001w5-33
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:26:47 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:54375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od43J-0000Zp-Az
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:26:46 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MsIbU-1pVRqr40C2-00tmNj; Tue, 27
 Sep 2022 08:26:36 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PULL 3/3] m68k: align bootinfo strings and data to 4 bytes
Date: Tue, 27 Sep 2022 08:26:33 +0200
Message-Id: <20220927062633.618677-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927062633.618677-1-laurent@vivier.eu>
References: <20220927062633.618677-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3ErU7WZ+VCtw2Nrh78zJjF00pjkF9lhcFj3/H4Nt5gHwv5PmokS
 HcKLJwiIRFLLIqSsHugL0WaR/ML3oZYGrmVDWiocSJohbTJkjG+Y/SWEqBL5Xh5XZzEg+zk
 GdT9eiM7JIpRk//HmZjYOebbPpsqGFOw5XjzjV5MvjoZ3iInFhCXJJ7MI+euipo6nXE8BHJ
 w68YeW81I4csB01pCyDEw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zepAkP3MoQ8=:t7v1204TtVkQ7ZLEXIi6uO
 NGz6IosjTP0ObSMMg/hGRLH8cCUiWDwUf0YkiH9GJxXMiML1XqmFCFdYFeN080HrH4NmjDEZc
 0kP3x2cCRN1n0Io45FxGutrwms3Z7qGOyuYv9Tcmth/LknOyJaFml59MexX5js78jva1io7BZ
 8kgawUpCAylXhe+kov/UWUHjUSzcqIAyllllA/MPac9KwVNqsn55/WH5Z3KKjMJa59Ng1tfBs
 WLEioOJLRH8XVFmRGslfMPeuLruUXu5r2S939cBTmrUD2cz5Qgvg+dMwMhl5+5Ag8B20Eoszb
 139hgL18kiZS/LRp0Ye8eF43uooA8WQ7OWvfW0SyVn4cje46Vq6y1erWe6x0qxlNEDuonOLl2
 zwD5aG78k598OMfiGX3A5pjPgd31bFuJlSBgG2+oR4dyuv8B1ptVVTK7HyzBEFEnIv85MYjq7
 YdmWCZIjEObEDO3HXtsseBgRwTH2Wnxsyj8I9msJKFQ8QKDDfbI8KVT5TxlxiUZG2NMzTp6AD
 5c4mxnwnyhxdz25pqJcJw3JPmnuqDyRjjLUjpHDo79TxNMAA6cTrR98ZEt2z9JBpNiPppNB3C
 9Oeb+T2sxvMejZ0kmX9PzXDk8nkCNtWJfv8ry3QOAcZi+e+tjySwCzxhr45PRMv7oR5zdilb3
 /6L907ka3VYMiIg2mKwnoDG+3FonFqmSDs3cVH10TXu60X2y7UcyGQNFU4UYLR5Vtv0Srf7he
 4lmhTIEC3DKnlyCEo2XZlApHE/jOU5rALHCTO5+WYRM6FiA4mnjXyAJ2Sk34t9A50SZ4sWQ7o
 qwuLXyI
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

Various tools, such as kexec-tools and m68k-bootinfo, expect each
bootinfo entry to be aligned to 4 bytes, not 2 bytes. So adjust the
padding to fill this out as such.

Also, break apart the padding additions from the other field length
additions, so that it's more clear why these magic numbers are being
added, and comment them too.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220926113900.1256630-2-Jason@zx2c4.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/bootinfo.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/m68k/bootinfo.h b/hw/m68k/bootinfo.h
index bd8b212fd35c..897162b8189c 100644
--- a/hw/m68k/bootinfo.h
+++ b/hw/m68k/bootinfo.h
@@ -48,13 +48,14 @@
         stw_phys(as, base, id); \
         base += 2; \
         stw_phys(as, base, \
-                 (sizeof(struct bi_record) + strlen(string) + 2) & ~1); \
+                 (sizeof(struct bi_record) + strlen(string) + \
+                  1 /* null termination */ + 3 /* padding */) & ~3); \
         base += 2; \
         for (i = 0; string[i]; i++) { \
             stb_phys(as, base++, string[i]); \
         } \
         stb_phys(as, base++, 0); \
-        base = (base + 1) & ~1; \
+        base = (base + 3) & ~3; \
     } while (0)
 
 #define BOOTINFODATA(as, base, id, data, len) \
@@ -63,13 +64,14 @@
         stw_phys(as, base, id); \
         base += 2; \
         stw_phys(as, base, \
-                 (sizeof(struct bi_record) + len + 3) & ~1); \
+                 (sizeof(struct bi_record) + len + \
+                  2 /* length field */ + 3 /* padding */) & ~3); \
         base += 2; \
         stw_phys(as, base, len); \
         base += 2; \
         for (i = 0; i < len; ++i) { \
             stb_phys(as, base++, data[i]); \
         } \
-        base = (base + 1) & ~1; \
+        base = (base + 3) & ~3; \
     } while (0)
 #endif
-- 
2.37.3


