Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0B2383C2A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 20:24:18 +0200 (CEST)
Received: from localhost ([::1]:44928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lihub-0003W8-3y
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 14:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlH-0005vA-8O
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:44 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:37781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihl9-0004Kn-At
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:14:39 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MvKL3-1lRJSt1Vsv-00rF6c; Mon, 17
 May 2021 20:14:26 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 01/59] linux-user: Remove dead code
Date: Mon, 17 May 2021 20:13:26 +0200
Message-Id: <20210517181424.8093-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9WL4uLjztZNoIkO0BpBrPrm9yLAB/LUfdJKlvDpcNRDzpzJ5VRn
 wCaLSj8Ip0uXJudgMs9s8QLZkmodYZvB+wysiwpx0/k1d9aWehzUz1YFn5PYuMRuucb9Fez
 yRWwLiJLApZZcy6bp+JlEUtJqWvLX7ib8dB934Yda0MXGVAjtQNGEO140Sd+p0pQHMO1UG5
 6m0WIqsfslf7Rb/K/OJ3Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZtVk3Sk4ZkU=:7JUOJJmKej8T8JyEnD1BP9
 koP3hhRjgLUhIKSYFzopTxubLXoSUiIGRRNFzrLaW/XnudKXsj4D224W+ZQ5xiUNQ+7D/CyJ6
 N9Zv+XhYTgquAvA1snDfTUpphKZbSdMwyOi6LNFPtOieNKLlov8A8gyBTuB7e2DSTE1rAfwRV
 Zcqbnp/NaDtuSjSrRIKO0qpyWqQZ7szikxinsxCt7TVqi1Tqxbp5njc6SevYW4bU6Eebg8I6f
 QR33L8n+40yzemVVaPhNx6gGJJqPhJssYbJh+CeGG+bwvAc7DoHX/sZf6auVa/smkX/aY3k7U
 0eVTkvNCu6aod5J4oM1zB7/y6tvmv7ia/oLDfdZfca0R7E9uuH9uoLH7/lFdhb6v363zNHOiW
 powNpgSBPZof+DNtU9XIubtZ5Rqufqty3rFknFeI+yMfTRHM6gHPQgHK7I00aEW5EIXNPbS/c
 us8ysi5Jzdyu92dsWAdepVLEKs0LHX8O5EtFPyIO4RmKQMLkwvA11BU18kWcIshbEmFNPs+Og
 Y1XXtIUOTJjwscLAm9I2uM=
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


