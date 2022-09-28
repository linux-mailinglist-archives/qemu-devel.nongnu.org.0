Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B15E25ED872
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 11:10:14 +0200 (CEST)
Received: from localhost ([::1]:42806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odT53-0003g7-Qj
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 05:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE7-000893-7P
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:33 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:36299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE5-0008Aa-F3
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:30 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MIdaF-1oPUGS3p6D-00EbO6; Wed, 28
 Sep 2022 10:15:22 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 06/38] linux-user: Log failing executable in EXCP_DUMP()
Date: Wed, 28 Sep 2022 10:14:45 +0200
Message-Id: <20220928081517.734954-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wZbqebJkWTWdpG5fB3c1lZG7gH2IX05p7dI0bk4pYO6PaX4GpD8
 rwJwSeoQiX1jLRQ7RSqQARtVeCZs5+0JMl17KSHjvCeuxbdyA9TlwsaKga58BVLW03Fjfvi
 rW7MpGkYqEXsnV9WFs1l8gYtY0W9wO7fIphikNTokddYvfDPqm7iMWvUAdaqq5JNnk4EjCX
 md+FPuzchaH6mJ0s/g8bQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jCxnW7UMzKY=:HjgOSwqvRxuhCwBdaHXM7n
 bfZ98ElRwJxnMsWO2NDZ1+vTp95uJ+GoHZYnjE1vCisuDmas4gbQv9Ca4Quv0RBlutR5JfEz8
 L2ZcpyUBwFJoZ0ORZnzwLa/bTDgf6kNEQb0jXPILNBuuO78OXTzgW0+bD7HldafNg3TglS50i
 oj+X7YSE6OrBlq8cVUyKgHxyFvoCRgoN14+NxxkZVxRRoNx3XTpSB+0uiBqPToHOi18y6AxBV
 xRPu5mjEdudMar1aExxY7aMs29XF5O5uVYurHsgjED+Om8CZ9PRkPFAbWx2nebR3Wo1KpLZyi
 oKOZAt1l956UCS4JUBbgJNruFTWty0QMDx2tpuMIVYOZwUOE5YT6QWuxr3/IW+Ev0AaoEN8Nk
 UiIBJ5sHm2Fcmw4mIeHA2gvewDVU+he9XFgn9qVKgW+MPWW6kuzKH3nElWsIp+YPvpeW5UhQw
 r+/Bng5ym1M/UW+/8g/FmYFx63LZFLdly+6THwJsseh0uDc/iFd5l5l013evLK/VC16SA+CSR
 t1SFvIJN2rv5m0ZJDoB1qBqLt78wAWmvlO6LLkRg3qZFro236xSLJ4Y5F0HjlN0sg1YYfCQIf
 Hq4ZMuR5w4cXN3pcn+fUoo0VK8+YIiidliU4FVBlztXgtDj3w5zgk1UkBeGwm9g+aIVVun6wB
 13BeIxqtNwA34n3ykiz2vMiaC/HYsfmm5T1qGnUcYSAREdoH9/jVG2coPGCl1OG7NTE6MjVl/
 hsO/MXGFFKrP+RB3TtH/eE3ePEb26zPN+ttoehmMWjdNuWOUN04vY6uAHVM/y7W/KVLG3pdLI
 4NSdvhj
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

From: Helge Deller <deller@gmx.de>

Enhance the EXCP_DUMP() macro to print out the failing program too.
During debugging it's sometimes hard to track down the actual failing
program if you are e.g. building a whole debian package.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220918194555.83535-5-deller@gmx.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/cpu_loop-common.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/cpu_loop-common.h b/linux-user/cpu_loop-common.h
index dc0042e4de35..36ff5b14f2a7 100644
--- a/linux-user/cpu_loop-common.h
+++ b/linux-user/cpu_loop-common.h
@@ -27,9 +27,11 @@
 do {                                                                    \
     CPUState *cs = env_cpu(env);                                        \
     fprintf(stderr, fmt , ## __VA_ARGS__);                              \
+    fprintf(stderr, "Failing executable: %s\n", exec_path);             \
     cpu_dump_state(cs, stderr, 0);                                      \
     if (qemu_log_separate()) {                                          \
         qemu_log(fmt, ## __VA_ARGS__);                                  \
+        qemu_log("Failing executable: %s\n", exec_path);                \
         log_cpu_state(cs, 0);                                           \
     }                                                                   \
 } while (0)
-- 
2.37.3


