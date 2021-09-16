Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2B440DDE8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:22:30 +0200 (CEST)
Received: from localhost ([::1]:49112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtDZ-0000Sh-St
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mQt4L-00030y-Sh
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:12:57 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:56961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mQt4I-0004GF-MT
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:12:57 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N5FMB-1msD2f36rF-0116tm; Thu, 16
 Sep 2021 17:12:44 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 09/10] linux-user: Drop unneeded includes from qemu.h
Date: Thu, 16 Sep 2021 17:12:36 +0200
Message-Id: <20210916151237.1188301-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916151237.1188301-1-laurent@vivier.eu>
References: <20210916151237.1188301-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ne4y8ERRDaP4aq1EtLqQPN1JC1/Ly987RYcTJ0ConyA9aBlqTsU
 NZteHGI44I8xFIt3KUbjEHMkh/f4Um8sqC1SvCYv8uHQSYO/ZNtrQibo7Ur99mtEkloEZSL
 6VOcQ/ssNHOZwcGD9Va1DnseRO84SfhR/018JsrxmstVIlq66viW+IICS1ESeZ2hYfV3Bdz
 5NodkHg2TZ1hsH3aABOXw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:77sm8Cb5qBE=:7PWukU9TjrhMpuShtKS2R2
 WQ/5utgZjINAm38NZDGb3kRRLNTgICF2nz03YmWQb0Wi42VyxvOCUBjtcOVQmAUNEbHHQCNQH
 +KnXQ8l8uoeVyrfIbYBRmSRMZzTxTckTyHb+He2vK754UxN+M/O5iYNJm81czlomAqv+V0M+V
 WL0kb6e3vA1pdq2y6y00yIDn79BVaBg1bR0jx/imd7DOVmTbA186M0E0JoMgor4HF8WrfrsjM
 STsYtcPkzg5J4p6tz+TmURMyRjlxi/zEP5Vh+GPkEMpzBgVx8Vgj4cL1Eu7ZQJH8eY+wecUVZ
 HH9we4lbJluEfiLXspbsOOPcy3mcgw7aLtfsKVmPXsSfCeKWESgr0jeO0ArYtX8g4afhJEBFQ
 lLTNVQTA0mc2lksBp20nf5onFa572NXHyqb/rRtn7aLdrh9GG/C0hsslS6Nf+6aKwr3QT9YXv
 ceGOHl6LhXhlmd2rxMpThezqFKwD8VDdJZqakvP7jd+il01T7I8xdH9Juk7vwTFFL9rkUop1j
 lb2sKMbwRExEhZxU1I8cAsIsEwQz7p0R+/MiF3G6OvjoGjPCPBs97mDGvfPO1wmmEod9wOvl5
 s9gdg1eAohLwmAYyf5sGUDXjssaztbvQPv3ETm4hImqDQRl0RPYgkB4MXdUKDqApBy1XMjGPe
 Z31gkBX+iDvGhNGDbKnAkQZe4rhbqrw/11zZUyAz7QrouLuTcRg5C66/VVcxtltWcytK1RBN+
 DOK5kizXL74RZhtT+hFi6yXOZL8eB6o9qe8kBA==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Trim down the #includes in qemu.h where we can, either by
dropping unneeded headers or by moving them to user-internals.h.

This includes deleting a couple of #includes that appear at
weird points midway through the header file.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210908154405.15417-10-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/qemu.h           | 4 ----
 linux-user/user-internals.h | 2 ++
 thunk.c                     | 1 +
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index fda90fc28d68..5c713fa8ab26 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -2,7 +2,6 @@
 #define QEMU_H
 
 #include "cpu.h"
-#include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 
 #undef DEBUG_REMAP
@@ -163,8 +162,6 @@ typedef struct TaskState {
     struct target_sigaltstack sigaltstack_used;
 } __attribute__((aligned(16))) TaskState;
 
-#include "qemu/log.h"
-
 abi_long do_brk(abi_ulong new_brk);
 
 /* user access */
@@ -349,5 +346,4 @@ void *lock_user_string(abi_ulong guest_addr);
 #define unlock_user_struct(host_ptr, guest_addr, copy)		\
     unlock_user(host_ptr, guest_addr, (copy) ? sizeof(*host_ptr) : 0)
 
-#include <pthread.h>
 #endif /* QEMU_H */
diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index 1729a8b62e18..661612a088b5 100644
--- a/linux-user/user-internals.h
+++ b/linux-user/user-internals.h
@@ -20,6 +20,8 @@
 
 #include "hostdep.h"
 #include "exec/user/thunk.h"
+#include "exec/exec-all.h"
+#include "qemu/log.h"
 
 extern char *exec_path;
 void init_task_state(TaskState *ts);
diff --git a/thunk.c b/thunk.c
index fc5be1a502e7..dac4bf11c65b 100644
--- a/thunk.c
+++ b/thunk.c
@@ -17,6 +17,7 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 
 #include "qemu.h"
 #include "exec/user/thunk.h"
-- 
2.31.1


