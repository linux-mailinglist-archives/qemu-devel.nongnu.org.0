Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBC749EF27
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 01:16:37 +0100 (CET)
Received: from localhost ([::1]:38816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDEwO-0007f7-Mw
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 19:16:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>) id 1nDEt6-0003X6-Eh
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:13:12 -0500
Received: from rn-mailsvcp-ppex-lapp34.rno.apple.com ([17.179.253.43]:52574
 helo=rn-mailsvcp-ppex-lapp34.apple.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>) id 1nDEsp-0007j6-U6
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:13:10 -0500
Received: from pps.filterd (rn-mailsvcp-ppex-lapp34.rno.apple.com [127.0.0.1])
 by rn-mailsvcp-ppex-lapp34.rno.apple.com (8.16.1.2/8.16.1.2) with
 SMTP id 20S00eAN000924; Thu, 27 Jan 2022 16:12:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=20180706; bh=F0ZnFbUb2LOwwgsfVTdJPfevtoJz63FaiZCbXuD49Zk=;
 b=CCVvGRrpx6aHK3pCSo2k5O3PSIC05tZzuYjPLFoAcyWLWTro7udoWneADxbTBSBKlQ7R
 UVDDfnb7yHigB1a2aqVkFA95kFncJ9ThKi3siQy3p57cLpB6Seh8tnoZmvp0yDkrU4Vf
 2XZoOrFvG2rT2ElrNcNgPLdpYkaVc66wzORTK2EIDQYcCumZIAhyET/9CJniiuHYUsiE
 DSqiNX2cmOyKWUXZgAagwhTIYSu/kT1dC9GeL7nhXOELekEZ62UDCAPF1B/pqkgufr7d
 zyxy8eZvFlenioP+N2x9+FcTO6+ftjAw9E5YDvHrLlVi9oeArZfQXLyloNpOJGyy6vwx eg== 
Received: from rn-mailsvcp-mta-lapp01.rno.apple.com
 (rn-mailsvcp-mta-lapp01.rno.apple.com [10.225.203.149])
 by rn-mailsvcp-ppex-lapp34.rno.apple.com with ESMTP id 3dren5t448-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Thu, 27 Jan 2022 16:12:52 -0800
Received: from rn-mailsvcp-mmp-lapp02.rno.apple.com
 (rn-mailsvcp-mmp-lapp02.rno.apple.com [17.179.253.15])
 by rn-mailsvcp-mta-lapp01.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021)) with ESMTPS id <0R6E00ZTW8LGJ840@rn-mailsvcp-mta-lapp01.rno.apple.com>; 
 Thu, 27 Jan 2022 16:12:52 -0800 (PST)
Received: from process_milters-daemon.rn-mailsvcp-mmp-lapp02.rno.apple.com by
 rn-mailsvcp-mmp-lapp02.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021)) id <0R6E002008CRL400@rn-mailsvcp-mmp-lapp02.rno.apple.com>; Thu,
 27 Jan 2022 16:12:52 -0800 (PST)
X-Va-A: 
X-Va-T-CD: 51115aee971724d6ddf329fb28aa7ad5
X-Va-E-CD: ab22f6faa0a3897cbee4c6ff6708ca71
X-Va-R-CD: e7df06cd3a6e483d0c57e0986e00ca1c
X-Va-CD: 0
X-Va-ID: 39d74cef-94d6-4415-a834-0421f044b982
X-V-A: 
X-V-T-CD: 51115aee971724d6ddf329fb28aa7ad5
X-V-E-CD: ab22f6faa0a3897cbee4c6ff6708ca71
X-V-R-CD: e7df06cd3a6e483d0c57e0986e00ca1c
X-V-CD: 0
X-V-ID: a8e4d46f-1391-493e-9539-31d85484ad8e
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.816
 definitions=2022-01-27_06:2022-01-27,
 2022-01-27 signatures=0
Received: from rn-mailsvcp-relay-lapp03.rno.apple.com
 (unknown [17.150.218.164]) by rn-mailsvcp-mmp-lapp02.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021))
 with ESMTPSA id <0R6E009M98LFYM00@rn-mailsvcp-mmp-lapp02.rno.apple.com>; Thu,
 27 Jan 2022 16:12:52 -0800 (PST)
From: Cameron Esfahani <dirty@apple.com>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v3] linux-user: Implement starttime field in self stat
 emulation
Date: Thu, 27 Jan 2022 16:12:51 -0800
Message-id: <20220128001251.45165-1-dirty@apple.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-131)
MIME-version: 1.0
Content-transfer-encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.816
 definitions=2022-01-27_06:2022-01-27,
 2022-01-27 signatures=0
Received-SPF: pass client-ip=17.179.253.43; envelope-from=dirty@apple.com;
 helo=rn-mailsvcp-ppex-lapp34.apple.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

v3: Fix formatting issues
v2: Use clock_gettime() instead of scanning /proc/self/stat

Signed-off-by: Cameron Esfahani <dirty@apple.com>
---
 linux-user/main.c    | 14 ++++++++++++++
 linux-user/qemu.h    |  3 +++
 linux-user/syscall.c |  3 +++
 3 files changed, 20 insertions(+)

diff --git a/linux-user/main.c b/linux-user/main.c
index 16def5215d..fbc9bcfd5f 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -190,12 +190,26 @@ void stop_all_tasks(void)
 /* Assumes contents are already zeroed.  */
 void init_task_state(TaskState *ts)
 {
+    long ticks_per_sec;
+    struct timespec bt;
+
     ts->used = 1;
     ts->sigaltstack_used = (struct target_sigaltstack) {
         .ss_sp = 0,
         .ss_size = 0,
         .ss_flags = TARGET_SS_DISABLE,
     };
+
+    /* Capture task start time relative to system boot */
+
+    ticks_per_sec = sysconf(_SC_CLK_TCK);
+
+    if ((ticks_per_sec > 0) && !clock_gettime(CLOCK_BOOTTIME, &bt)) {
+        /* start_boottime is expressed in clock ticks */
+        ts->start_boottime = bt.tv_sec * (uint64_t) ticks_per_sec;
+        ts->start_boottime += bt.tv_nsec * (uint64_t) ticks_per_sec /
+                              NANOSECONDS_PER_SECOND;
+    }
 }
 
 CPUArchState *cpu_copy(CPUArchState *env)
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 7910ce59cc..106175406a 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -158,6 +158,9 @@ typedef struct TaskState {
 
     /* This thread's sigaltstack, if it has one */
     struct target_sigaltstack sigaltstack_used;
+
+    /* Start time of task after system boot in clock ticks */
+    uint64_t start_boottime;
 } __attribute__((aligned(16))) TaskState;
 
 abi_long do_brk(abi_ulong new_brk);
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 5950222a77..7b3dbc72d4 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8107,6 +8107,9 @@ static int open_self_stat(void *cpu_env, int fd)
         } else if (i == 3) {
             /* ppid */
             g_string_printf(buf, FMT_pid " ", getppid());
+        } else if (i == 21) {
+            /* starttime */
+            g_string_printf(buf, "%" PRIu64 " ", ts->start_boottime);
         } else if (i == 27) {
             /* stack bottom */
             g_string_printf(buf, TARGET_ABI_FMT_ld " ", ts->info->start_stack);
-- 
2.32.0 (Apple Git-131)


