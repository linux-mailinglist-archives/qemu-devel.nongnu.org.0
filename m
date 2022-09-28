Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA9B5EE6DE
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 22:55:34 +0200 (CEST)
Received: from localhost ([::1]:44982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ode5d-0001Bj-MM
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 16:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odden-00083z-JL
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:49 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:59753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddek-0006OR-De
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:49 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mo73N-1p2Uw237Nb-00pa8B; Wed, 28
 Sep 2022 22:27:41 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 06/37] linux-user: Log failing executable in EXCP_DUMP()
Date: Wed, 28 Sep 2022 22:27:06 +0200
Message-Id: <20220928202737.793171-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QKz51L2dLExlrD4+UolF2jfX3cQlIVLYiM6BW3rURTH7pyrI0P1
 pLe7m94cJGbj65rLd0xfM8xAHyL6nalSztk6Mcg44yexOiUPlWtHaNRDYGQM4ncd0rAKnSM
 dR9uOFuPZWf2ywvO/5SwXptbQ7frOD2Ezr1IOKYDIqAClYvMj7DndMnpYJkb1OAMHp7A7Om
 vXEaBpQML+jzPajwj7Waw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jORduZTM7Bc=:CzXuDWFUWrNDok1SUZbNb0
 EOH5HKiwAWD7h2rhKbNN4I3VsFIszGSAh0na3uwTMGxc2g23jlbY8YTmXnbhN9D6CV/yCF29f
 FFB/5zOIFQZZW6p1luTFMdzkOj/7eX/nLCrj7YV1cxq23Rev4p49Lm3SEbmmctxdqqlZ3hWFw
 EzWTCsDbL5ssMvJOaUrQYwepjJsRdMqlP/B3SrhsCWg697+VGKBcPdiTJAR5JQOF0tyvBOj95
 nQjBDrXZVfVh2YVjloUkw9mJI3ZVPlg8iAMnC3Yj+Nqo3maOdVo9DtIl8rh0x6RCOTMAKqnoP
 Yni8isnXZIyBqiONqsmskbrmSXmkJ6n1TEJPhPz/oMt4RGyp/rCacR+kObrbgXVFSFrOS7cTH
 V0TlVo9BTF/YrZGT13Xpyzn7Ncs8tesyEd2QEDtoGtWtWU8oMDWj2rZsYHHy9m+jk2TCBtv6X
 yFayoUuWNAqVr/MEP9/catYLx76r5AclNPAZxFXiQBnqOnL6MHZ8y4rQI4ZU65WO2DmspsTlu
 UydoYpxbpFk65D5Uxe1kQ6l9hlu/AD+r7zM08ALDC48j8OYw3qXgKpFSom2Z5ZWsLwdwAmCMO
 jjnLO8La0Gi/KN5ekHKaYuOY5U7yuxzlQrwtE/swWYq8RnEXW5WdwnE8eReA6cB1uySaFQmxP
 t1urOLM0vEOkKHmE89fAIi+Lv4bHBe1iLYjhqRsaiB2yNBnqd1BgNI85WMaeCa1oPOqkPCuj1
 T3dDT8H2OYssSrc5g09wx0vWvXzKVY6Foj0c/GMlUhkXPDJenVzPJ9brP0negcsy5J4kWSGiS
 erfCmPu
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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


