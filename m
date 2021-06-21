Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DC93AE7E8
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 13:09:04 +0200 (CEST)
Received: from localhost ([::1]:51006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHnb-00035w-2R
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 07:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lvHjY-0002o9-FE
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:04:53 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:53975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lvHjV-0003uQ-Sc
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:04:51 -0400
Received: from quad ([82.142.1.74]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MIMOy-1m0jn82TFk-00EPFp; Mon, 21
 Jun 2021 13:04:46 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/9] linux-user: Set CF_PARALLEL when mapping shared memory
Date: Mon, 21 Jun 2021 13:04:37 +0200
Message-Id: <20210621110445.231771-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210621110445.231771-1-laurent@vivier.eu>
References: <20210621110445.231771-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UFy6xt4K53iFDMglBPtNG7ol1kK5/42StTASrSex5sojzRu7qj8
 mG4rI7zJFwLktBXqHCK54Ru/9lw1ZKB1b1WtGnezZWExFG3v4lnw1PmlJn7yVToO0bZ+9Oo
 wN5d7jxzu/mdKrRlIFKrMdU7yrlBaIF2rnFEzN69xmBBq0w8tFGbGn7MQCbvso8riGXeoHg
 yHr60vSFjctrzZWkzvgyw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uREM49oludY=:Jgjm4IxxxbKlgMKN/S2go0
 azoiuC/5kE0npg7Ew+5M1m9mBNwtcWNwTjrz8V6uYE2NiI2ek9S8ItEg5/5uIbaLcmUu64B8L
 T3tPzURYVKjmAtSk8C3I1Ufe2J8aDyF288g0hhEeRqiIjPmz7FbGdsOU+AshFaT/HbSWH+NfE
 Jzyus/Ggh4kHGRcYgnEJey1PA5IgdDQC0/EdEiLtKljxLRLgGyR+yqlb6BcadrSckZx04V6Yz
 KEL41DqSLrIE/DE55wBJrwcggemmbVN+SDBhJtQFGGFOfUlGi1XUNsq4f3cY3ds27il8wkh6A
 C/AkaahK+sbXiHgQWBm2fKiPbHfEaiVTbgXrXbSNhquy3y39tGIgF52YnjBvoYW2occ+wJ4le
 3JnLKzh0vpTMLG5VZfvFQe7XjvZYNgs2ivG7pMSCRJxLhjzT+akRts5aXViidgRm1aRRFir5m
 jUX2/w2oMUJcQHGyQcbOKuxkDCdBt4YyxAlshnx5ABuKav6ZrNm/WA5U/++XZ6n0XXCJKy7LD
 tzT2rQrHVWYd/6WUMrMHb0=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signal the translator to use host atomic instructions for
guest operations, insofar as it is possible.  This is the
best we can do to allow the guest to interact atomically
with other processes.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/121
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210612060828.695332-1-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/mmap.c    | 14 ++++++++++++++
 linux-user/syscall.c | 12 ++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 7e3b2450368a..0e103859fed8 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -451,6 +451,20 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
         goto fail;
     }
 
+    /*
+     * If we're mapping shared memory, ensure we generate code for parallel
+     * execution and flush old translations.  This will work up to the level
+     * supported by the host -- anything that requires EXCP_ATOMIC will not
+     * be atomic with respect to an external process.
+     */
+    if (flags & MAP_SHARED) {
+        CPUState *cpu = thread_cpu;
+        if (!(cpu->tcg_cflags & CF_PARALLEL)) {
+            cpu->tcg_cflags |= CF_PARALLEL;
+            tb_flush(cpu);
+        }
+    }
+
     real_start = start & qemu_host_page_mask;
     host_offset = offset & qemu_host_page_mask;
 
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 974dd46c9a17..54037db8d66d 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -4603,6 +4603,7 @@ static inline abi_ulong target_shmlba(CPUArchState *cpu_env)
 static inline abi_ulong do_shmat(CPUArchState *cpu_env,
                                  int shmid, abi_ulong shmaddr, int shmflg)
 {
+    CPUState *cpu = env_cpu(cpu_env);
     abi_long raddr;
     void *host_raddr;
     struct shmid_ds shm_info;
@@ -4633,6 +4634,17 @@ static inline abi_ulong do_shmat(CPUArchState *cpu_env,
 
     mmap_lock();
 
+    /*
+     * We're mapping shared memory, so ensure we generate code for parallel
+     * execution and flush old translations.  This will work up to the level
+     * supported by the host -- anything that requires EXCP_ATOMIC will not
+     * be atomic with respect to an external process.
+     */
+    if (!(cpu->tcg_cflags & CF_PARALLEL)) {
+        cpu->tcg_cflags |= CF_PARALLEL;
+        tb_flush(cpu);
+    }
+
     if (shmaddr)
         host_raddr = shmat(shmid, (void *)g2h_untagged(shmaddr), shmflg);
     else {
-- 
2.31.1


