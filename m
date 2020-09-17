Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A265926D202
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 06:03:00 +0200 (CEST)
Received: from localhost ([::1]:58844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIl8N-0004rE-Jx
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 00:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaolichang@huawei.com>)
 id 1kIl6O-00038K-Ec; Thu, 17 Sep 2020 00:00:56 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:33756 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhaolichang@huawei.com>)
 id 1kIl6K-0001EA-NT; Thu, 17 Sep 2020 00:00:56 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id F3C294D8A3EE0E8CFEEB;
 Thu, 17 Sep 2020 11:56:08 +0800 (CST)
Received: from localhost (10.174.187.87) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Thu, 17 Sep 2020
 11:55:58 +0800
From: zhaolichang <zhaolichang@huawei.com>
To: <qemu-trivial@nongnu.org>
Subject: [PATCH V2 06/10] linux-user/: fix some comment spelling errors
Date: Thu, 17 Sep 2020 11:54:09 +0800
Message-ID: <20200917035413.701-7-zhaolichang@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20200917035413.701-1-zhaolichang@huawei.com>
References: <20200917035413.701-1-zhaolichang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.87]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=zhaolichang@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 23:20:51
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: zhaolichang <zhaolichang@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I found that there are many spelling errors in the comments of qemu,
so I used the spellcheck tool to check the spelling errors
and finally found some spelling errors in the linux-user folder.

Signed-off-by: zhaolichang <zhaolichang@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 linux-user/aarch64/signal.c              | 2 +-
 linux-user/cris/target_syscall.h         | 4 ++--
 linux-user/flat.h                        | 2 +-
 linux-user/flatload.c                    | 4 ++--
 linux-user/host/ppc64/safe-syscall.inc.S | 2 +-
 linux-user/syscall.c                     | 4 ++--
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index cd521ee42d..d50c1ae583 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -78,7 +78,7 @@ struct target_sve_context {
     struct target_aarch64_ctx head;
     uint16_t vl;
     uint16_t reserved[3];
-    /* The actual SVE data immediately follows.  It is layed out
+    /* The actual SVE data immediately follows.  It is laid out
      * according to TARGET_SVE_SIG_{Z,P}REG_OFFSET, based off of
      * the original struct pointer.
      */
diff --git a/linux-user/cris/target_syscall.h b/linux-user/cris/target_syscall.h
index d109a6b42a..19e1281403 100644
--- a/linux-user/cris/target_syscall.h
+++ b/linux-user/cris/target_syscall.h
@@ -4,7 +4,7 @@
 #define UNAME_MACHINE "cris"
 #define UNAME_MINIMUM_RELEASE "2.6.32"
 
-/* pt_regs not only specifices the format in the user-struct during
+/* pt_regs not only specifies the format in the user-struct during
  * ptrace but is also the frame format used in the kernel prologue/epilogues
  * themselves
  */
@@ -32,7 +32,7 @@ struct target_pt_regs {
         unsigned long spc;
         unsigned long ccs;
         unsigned long srp;
-        unsigned long erp; /* This is actually the debugged process' PC */
+        unsigned long erp; /* This is actually the debugged process's PC */
         /* For debugging purposes; saved only when needed. */
         unsigned long exs;
         unsigned long eda;
diff --git a/linux-user/flat.h b/linux-user/flat.h
index 1e44b33443..ed518e2013 100644
--- a/linux-user/flat.h
+++ b/linux-user/flat.h
@@ -43,7 +43,7 @@ struct flat_hdr {
 	abi_ulong reloc_count;  /* Number of relocation records */
 	abi_ulong flags;
 	abi_ulong build_date;   /* When the program/library was built */
-	abi_ulong filler[5];    /* Reservered, set to zero */
+	abi_ulong filler[5];    /* Reserved, set to zero */
 };
 
 #define FLAT_FLAG_RAM    0x0001 /* load program entirely into RAM */
diff --git a/linux-user/flatload.c b/linux-user/flatload.c
index 8fb448f0bf..14d2999d15 100644
--- a/linux-user/flatload.c
+++ b/linux-user/flatload.c
@@ -442,7 +442,7 @@ static int load_flat_file(struct linux_binprm * bprm,
     indx_len = (indx_len + 15) & ~(abi_ulong)15;
 
     /*
-     * Alloate the address space.
+     * Allocate the address space.
      */
     probe_guest_base(bprm->filename, 0,
                      text_len + data_len + extra + indx_len);
@@ -794,7 +794,7 @@ int load_flt_binary(struct linux_binprm *bprm, struct image_info *info)
 #error here
     for (i = MAX_SHARED_LIBS-1; i>0; i--) {
             if (libinfo[i].loaded) {
-                    /* Push previos first to call address */
+                    /* Push previous first to call address */
                     --sp;
                     if (put_user_ual(start_addr, sp))
                         return -EFAULT;
diff --git a/linux-user/host/ppc64/safe-syscall.inc.S b/linux-user/host/ppc64/safe-syscall.inc.S
index 8ed73a5b86..875133173b 100644
--- a/linux-user/host/ppc64/safe-syscall.inc.S
+++ b/linux-user/host/ppc64/safe-syscall.inc.S
@@ -84,7 +84,7 @@ safe_syscall_end:
 
 	/* code path when we didn't execute the syscall */
 0:	addi	3, 0, -TARGET_ERESTARTSYS
-	ld 14, 16(1) /* restore r14 to its orginal value */
+	ld 14, 16(1) /* restore r14 to its original value */
 	blr
 	.cfi_endproc
 
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 55ac5c3208..897d20c076 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -481,7 +481,7 @@ _syscall4(int, sys_prlimit64, pid_t, pid, int, resource,
 
 
 #if defined(TARGET_NR_timer_create)
-/* Maxiumum of 32 active POSIX timers allowed at any one time. */
+/* Maximum of 32 active POSIX timers allowed at any one time. */
 static timer_t g_posix_timers[32] = { 0, } ;
 
 static inline int next_free_host_timer(void)
@@ -8180,7 +8180,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
     switch(num) {
     case TARGET_NR_exit:
         /* In old applications this may be used to implement _exit(2).
-           However in threaded applictions it is used for thread termination,
+           However in threaded applications it is used for thread termination,
            and _exit_group is used for application termination.
            Do thread termination if we have more then one thread.  */
 
-- 
2.26.2.windows.1


