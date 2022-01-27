Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A5649ED1C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 22:10:58 +0100 (CET)
Received: from localhost ([::1]:53486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDC2j-0006tV-On
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 16:10:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>) id 1nDBqg-0003MT-7P
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 15:58:30 -0500
Received: from rn-mailsvcp-ppex-lapp24.rno.apple.com ([17.179.253.38]:40778
 helo=rn-mailsvcp-ppex-lapp24.apple.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>) id 1nDBqe-0005dU-K8
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 15:58:29 -0500
Received: from pps.filterd (rn-mailsvcp-ppex-lapp24.rno.apple.com [127.0.0.1])
 by rn-mailsvcp-ppex-lapp24.rno.apple.com (8.16.1.2/8.16.1.2) with
 SMTP id 20RKsJx2006866; Thu, 27 Jan 2022 12:58:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=20180706; bh=XOhvgokQ39pCznVuG1b0062/D8cUCmMiPazgGEmsruk=;
 b=iS/J0Inc0Cg84uyQ6E1FVFQ2JoRt3QAIc3oRMfQM+8wtr/Of7knD7sn5pm/nB21YV4fp
 mwaHUoR4D+zLcpU1BOo83VrBHjjyLWCETIc+MgZJcCHRzuYto4Ot8n4J+q0on+pFhYpQ
 dwPmRxjvBk+BZmqsEA/Kk0cn30VpkyROaT8rC4NV8MGklEwR67srvtjkXK7DaIVX9oGH
 RjsG8P9af3t/jB2Mgwo4xSAukC+2oRoQMPO+A4YVrjJa6sO2ektTlj/UDN4teBUMMiiW
 aWbIQCjAXSsNxmuwfyBuKxUaC021Bh2qINuyV3qg93uNMqRg2KGGUzBnpncOGyVbf8gZ TQ== 
Received: from rn-mailsvcp-mta-lapp01.rno.apple.com
 (rn-mailsvcp-mta-lapp01.rno.apple.com [10.225.203.149])
 by rn-mailsvcp-ppex-lapp24.rno.apple.com with ESMTP id 3drgddfbju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Thu, 27 Jan 2022 12:58:25 -0800
Received: from rn-mailsvcp-mmp-lapp04.rno.apple.com
 (rn-mailsvcp-mmp-lapp04.rno.apple.com [17.179.253.17])
 by rn-mailsvcp-mta-lapp01.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021)) with ESMTPS id <0R6D00IO2ZLDWUI0@rn-mailsvcp-mta-lapp01.rno.apple.com>; 
 Thu, 27 Jan 2022 12:58:25 -0800 (PST)
Received: from process_milters-daemon.rn-mailsvcp-mmp-lapp04.rno.apple.com by
 rn-mailsvcp-mmp-lapp04.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021)) id <0R6D00W00ZHQ6O00@rn-mailsvcp-mmp-lapp04.rno.apple.com>; Thu,
 27 Jan 2022 12:58:25 -0800 (PST)
X-Va-A: 
X-Va-T-CD: 51115aee971724d6ddf329fb28aa7ad5
X-Va-E-CD: 120ef7c1e3e295130a85bde8ba98443e
X-Va-R-CD: c492b5a21f513dd970c5019bf23301db
X-Va-CD: 0
X-Va-ID: 172ef4da-aab5-4512-a236-3fca26138911
X-V-A: 
X-V-T-CD: 51115aee971724d6ddf329fb28aa7ad5
X-V-E-CD: 120ef7c1e3e295130a85bde8ba98443e
X-V-R-CD: c492b5a21f513dd970c5019bf23301db
X-V-CD: 0
X-V-ID: ab6a65ac-c75f-4bac-bd20-054f262cfe0a
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.816
 definitions=2022-01-27_03:2022-01-27,
 2022-01-27 signatures=0
Received: from rn-mailsvcp-relay-lapp01.rno.apple.com
 (unknown [17.150.218.164]) by rn-mailsvcp-mmp-lapp04.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021))
 with ESMTPSA id <0R6D00ZKZZLCHV00@rn-mailsvcp-mmp-lapp04.rno.apple.com>; Thu,
 27 Jan 2022 12:58:25 -0800 (PST)
From: Cameron Esfahani <dirty@apple.com>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v2] linux-user: Implement starttime field in self stat
 emulation
Date: Thu, 27 Jan 2022 12:58:24 -0800
Message-id: <20220127205824.40626-1-dirty@apple.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-131)
MIME-version: 1.0
Content-transfer-encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.816
 definitions=2022-01-27_03:2022-01-27,
 2022-01-27 signatures=0
Received-SPF: pass client-ip=17.179.253.38; envelope-from=dirty@apple.com;
 helo=rn-mailsvcp-ppex-lapp24.apple.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Instead of always returning 0, return actual starttime.

v2: Use clock_gettime() instead of scanning /proc/self/stat

Signed-off-by: Cameron Esfahani <dirty@apple.com>
---
 linux-user/main.c    | 11 +++++++++++
 linux-user/qemu.h    |  3 +++
 linux-user/syscall.c |  3 +++
 3 files changed, 17 insertions(+)

diff --git a/linux-user/main.c b/linux-user/main.c
index 16def5215d..2e5e0e886b 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -196,6 +196,17 @@ void init_task_state(TaskState *ts)
         .ss_size = 0,
         .ss_flags = TARGET_SS_DISABLE,
     };
+
+    /* Capture task start time relative to system boot */
+
+    long long ticksPerSec = sysconf(_SC_CLK_TCK);
+    struct timespec bt;
+
+    if ((ticksPerSec > 0) && !clock_gettime(CLOCK_BOOTTIME, &bt)) {
+        /* start_boottime is expressed in clock ticks */
+        ts->start_boottime = bt.tv_sec * ticksPerSec;
+        ts->start_boottime += bt.tv_nsec * ticksPerSec / 1000000000L;
+    }
 }
 
 CPUArchState *cpu_copy(CPUArchState *env)
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 7910ce59cc..86bc169e72 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -158,6 +158,9 @@ typedef struct TaskState {
 
     /* This thread's sigaltstack, if it has one */
     struct target_sigaltstack sigaltstack_used;
+
+    /* Start time of task after system boot in clock ticks */
+    unsigned long long start_boottime;
 } __attribute__((aligned(16))) TaskState;
 
 abi_long do_brk(abi_ulong new_brk);
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 5950222a77..2f77dbdda7 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8107,6 +8107,9 @@ static int open_self_stat(void *cpu_env, int fd)
         } else if (i == 3) {
             /* ppid */
             g_string_printf(buf, FMT_pid " ", getppid());
+        } else if (i == 21) {
+            /* starttime */
+            g_string_printf(buf, "%llu ", ts->start_boottime);
         } else if (i == 27) {
             /* stack bottom */
             g_string_printf(buf, TARGET_ABI_FMT_ld " ", ts->info->start_stack);
-- 
2.32.0 (Apple Git-131)


