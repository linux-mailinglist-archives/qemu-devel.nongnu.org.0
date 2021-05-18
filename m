Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F23387173
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 07:51:30 +0200 (CEST)
Received: from localhost ([::1]:38376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lisdd-00026D-Lf
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 01:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKY-00074U-J2
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:46 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:57357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lisKV-000703-HA
 for qemu-devel@nongnu.org; Tue, 18 May 2021 01:31:46 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MxEYY-1lXw9E3mTg-00xeb3; Tue, 18
 May 2021 07:31:33 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 01/59] linux-user: Remove dead code
Date: Tue, 18 May 2021 07:30:33 +0200
Message-Id: <20210518053131.87212-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
References: <20210518053131.87212-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Ip1ZvOtP7xYEkSpHNWbooJeYLch8ubTt5WoARl2WMWJghYvkco4
 Ls9GjwxUlH9AgHTrbgTm/0KXy8CF63VuxxS/Jw4nbaWU84aQYPoqCGC6ParS6hLI+e3X0vN
 GMsdLDpY0G23mdLXHSiZ444Aqbvl86e0xcqfxISmK1voKgiPkt4M6PbiBo3dS6BHdtRnmdB
 EXJOhj+7nRhMicYc9VyJQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hoKxoXimWq0=:HAfNzhPDDPW0JssiBVNDXV
 t6LtbipFMDrGe5AwjcE14jtKN4RWq51AOOMqc5SXFd6NvUjNNSQfvAZQJy+QbqBARSvvLRgqC
 7J4dwAVzocw6A+AcrcMImqfGRpHpzEYLZQ1sNSWX7ZSa/7joQzQrSm2jgjm/ynxZcIv0uoer+
 M54qEC2DTZkMoziot/zd59hBmYT8+mOqdHy1djYeJqAyOsNEfsaPBzRlSThtF0CQ/DfpLCHrU
 A5kZvdfAU2ApRFcJwX+qwaFv8eCz9bymJSlBbqvm7H7E4G4S4d9Zx2Sln08GgKm1BY4g4ztZC
 gzCVnzqAJ802UHt3R4Cr9UagX+CkQzUgf9SKcDsrPOfrzEm/KfZ1B4t7Pb6fj0LLYMLEzYgcD
 pJp8uvWQgoZPe21RQDTCMN6Y32GpKwvsxFir8TOTS9pVkuRP5DSD6+vL0EhFp6jRvThflL2LA
 tR5pWAZOEaXY4cqQNC2QXquoSnGeEWytutC73F6/H7zDdHhFxF11hEqNktx1E3jRhwzw8l/eE
 ASWKulNMh30BYldN64yo30=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We can not use watchpoints in user-mode emulation because we
need the softmmu slow path to detect accesses to watchpointed
memory. This code is expanded as empty stub in "hw/core/cpu.h"
anyway, so we can drop it.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210303214708.1727801-18-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/main.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 7995b6e7a6de..4dfc47ad3b63 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -205,7 +205,6 @@ CPUArchState *cpu_copy(CPUArchState *env)
     CPUState *new_cpu = cpu_create(cpu_type);
     CPUArchState *new_env = new_cpu->env_ptr;
     CPUBreakpoint *bp;
-    CPUWatchpoint *wp;
 
     /* Reset non arch specific state */
     cpu_reset(new_cpu);
@@ -217,13 +216,9 @@ CPUArchState *cpu_copy(CPUArchState *env)
        Note: Once we support ptrace with hw-debug register access, make sure
        BP_CPU break/watchpoints are handled correctly on clone. */
     QTAILQ_INIT(&new_cpu->breakpoints);
-    QTAILQ_INIT(&new_cpu->watchpoints);
     QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
         cpu_breakpoint_insert(new_cpu, bp->pc, bp->flags, NULL);
     }
-    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
-        cpu_watchpoint_insert(new_cpu, wp->vaddr, wp->len, wp->flags, NULL);
-    }
 
     return new_env;
 }
-- 
2.31.1


