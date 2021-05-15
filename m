Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CF8381780
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 12:13:07 +0200 (CEST)
Received: from localhost ([::1]:41934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhrI9-0004HF-AQ
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 06:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr9T-00066l-Bg; Sat, 15 May 2021 06:04:07 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:58307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr9P-0006Ym-Og; Sat, 15 May 2021 06:04:07 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mzz6m-1lK7T12Lhe-00x3SJ; Sat, 15
 May 2021 12:03:49 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 14/16] target/sh4: Return error if
 CPUClass::get_phys_page_debug() fails
Date: Sat, 15 May 2021 12:03:33 +0200
Message-Id: <20210515100335.1245468-15-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515100335.1245468-1-laurent@vivier.eu>
References: <20210515100335.1245468-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:G2RRtHqXg2nfmeg0dzZCcikoI1mLa1mvwB2QWIkX5JJ8ZvBRyzJ
 sk1p2m5V3TIPb8GvG2vGWKcV/oMufR41JmS+0BuV/y9Pp5a6Ss76FevqeibhZ+GExzq+Q2Q
 09sw8GnNp9UGtBmV+1OG1ucO5AbRUJPDvF8FYT34q0SvT06GPcbHKPplpl+0tYxLpOYDruV
 aI5HSWDxOKWcR5b2s8W8w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TjMyK4ziKYs=:S7GPmj1WEUY8OKkuJG6/jD
 r/X90ApzOG7dTtiOi5Loui6uKMvRxc+upbmJma4LQWtArGme7Go7xr1e3QAyG17e6+niB0/6+
 0lGLkrorYCtt6675O5DujNx+zk2/ykbOWy7UrSqp1L9clNoGehb8J5DH2olneKin0KNLUH+eh
 HxFRws54qiyqCBJ9UCmlEDeKyQ+sZ88fACsnppQFvBn9hVnIwlFayJTiTCmDvYmMBuHeP1XkD
 2z4cnmsfBcYc1/S+NH/w2ht3nMgJjjfDftk1UXFLv035lOyMByNERVAZhoXAgJvQykbNbIdoT
 5pMRhB7s9KDCzolVofL8mlQ8HlF8XZ3++DgEAr/5BRl2fdPS/BFrCg98ZeAiaxl3yIJU0AQ2F
 RiB9UdDKX9L/oTkTwmiJNbInmOwacL/bsW9Zv7SS9aL7tfbVkvOXRtE3+vboD/40DQ6K4Ny8F
 TvM4YDHi9gLE6JdkquLvkAFKBZ9ULXlHorGS9vHqwIObpZDVXK8E5oyRIikIelR4XPraVAGW3
 K0mwhdK0AlQPA6rlRDrKF4=
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

If the get_physical_address() call fails, the SH4 get_phys_page_debug()
handler returns an uninitialized address. Instead return -1, which
correspond to "no page found" (see cpu_get_phys_page_debug() doc
string).

This fixes a warning emitted when building with CFLAGS=-O3
(using GCC 10.2.1 20201125):

  target/sh4/helper.c: In function ‘superh_cpu_get_phys_page_debug’:
  target/sh4/helper.c:446:12: warning: ‘physical’ may be used uninitialized in this function [-Wmaybe-uninitialized]
    446 |     return physical;
        |            ^~~~~~~~

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Message-Id: <20210505161046.1397608-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/sh4/helper.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index bd8e034f174d..2d622081e85a 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -441,9 +441,12 @@ hwaddr superh_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     target_ulong physical;
     int prot;
 
-    get_physical_address(&cpu->env, &physical, &prot, addr, MMU_DATA_LOAD);
+    if (get_physical_address(&cpu->env, &physical, &prot, addr, MMU_DATA_LOAD)
+            == MMU_OK) {
+        return physical;
+    }
 
-    return physical;
+    return -1;
 }
 
 void cpu_load_tlb(CPUSH4State * env)
-- 
2.31.1


