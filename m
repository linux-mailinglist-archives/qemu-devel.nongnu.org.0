Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C83B383CD4
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:00:15 +0200 (CEST)
Received: from localhost ([::1]:42598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liiTO-00026I-6S
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:00:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihm2-0006vK-8T
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:26 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:50405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lihlZ-0004ZC-CG
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:15:25 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MA4ja-1lbWli0kpO-00Bb6h; Mon, 17
 May 2021 20:14:52 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 50/59] linux-user: use GDateTime for formatting timestamp for
 core file
Date: Mon, 17 May 2021 20:14:15 +0200
Message-Id: <20210517181424.8093-51-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517181424.8093-1-laurent@vivier.eu>
References: <20210517181424.8093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Zxw0boUnxh5+ng4nNOSdKKbFctpENZNV9N3UauPfRCsGKoySs26
 VvBzGDtXfAV91nFP+9YNAm3zxwKizw3B71pJHm2OD8DmMKl0PX+29mgXlPRr130lfK14Age
 L5XKV+506YHVANR+77DNY2AU/TayO6A1WtKxZ1TlRFLvVvlR5DQs7UxXfS6rW4MovxTGp7D
 LV7/drUiN/BciZMdnmPIQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fzCQ9HzHeko=:s8039GZ8/uaXLeM9MgfmO/
 qU/H8+eepOTx/CSDSiWZ6XGUrZ2rrbq4Zs2Zrx6kwkt3dE3XukZ82WD8G/QP5KgeqFPDBY5H9
 trlCrTdjg1RBkWVpq/8Eh+BiTlbHr0yRPRnKAv8B8s7Xmz0kd/LtdQMgKRVHwJqsfrWQy2tJL
 LYYLq7E83sJepOrIK54OSuB5uEGp4KmlDHMfO34wsjmhbeznfimIqQJ1XXsICI5OKJKcGWxG9
 DMS9N/uqYg1PylPI6DZMjB1QmSGelYgyaPmsDYzK6IwfkqiEKqX4ZIAdpsyG9q5zhRMTb2+sa
 t7P/8oebhvzhogt+9rH3YBKbbUKlgCz9Vr4QkrTxADK69fnG1V/BjuUk0Grzcoc4+4e3q7LKp
 5z5wmMFJPulGQt9myxh+CVU+3W6ySjYG9e+gbD/tUW9rZJ1Iph/FxAyclB6Pdsf6OC4ciFOoj
 c68Y9YC5T3bbk6ONhv8xqtAPXKYbrLWYzA6bmyyRc+DR7eTRRNz8qCJhxD+0Jzw85ib0FN7TG
 3px4JaArO3WsgVjwm0n05Y=
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The GDateTime APIs provided by GLib avoid portability pitfalls, such
as some platforms where 'struct timeval.tv_sec' field is still 'long'
instead of 'time_t'. When combined with automatic cleanup, GDateTime
often results in simpler code too.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210505103702.521457-7-berrange@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c | 36 +++++++++---------------------------
 1 file changed, 9 insertions(+), 27 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index ffc03d72f935..015eed1a27b4 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -3376,7 +3376,6 @@ static size_t note_size(const struct memelfnote *);
 static void free_note_info(struct elf_note_info *);
 static int fill_note_info(struct elf_note_info *, long, const CPUArchState *);
 static void fill_thread_info(struct elf_note_info *, const CPUArchState *);
-static int core_dump_filename(const TaskState *, char *, size_t);
 
 static int dump_write(int, const void *, size_t);
 static int write_note(struct memelfnote *, int);
@@ -3675,32 +3674,16 @@ static void fill_auxv_note(struct memelfnote *note, const TaskState *ts)
  * for the name:
  *     qemu_<basename-of-target-binary>_<date>-<time>_<pid>.core
  *
- * Returns 0 in case of success, -1 otherwise (errno is set).
+ * Returns the filename
  */
-static int core_dump_filename(const TaskState *ts, char *buf,
-                              size_t bufsize)
+static char *core_dump_filename(const TaskState *ts)
 {
-    char timestamp[64];
-    char *base_filename = NULL;
-    struct timeval tv;
-    struct tm tm;
+    g_autoptr(GDateTime) now = g_date_time_new_now_local();
+    g_autofree char *nowstr = g_date_time_format(now, "%Y%m%d-%H%M%S");
+    g_autofree char *base_filename = g_path_get_basename(ts->bprm->filename);
 
-    assert(bufsize >= PATH_MAX);
-
-    if (gettimeofday(&tv, NULL) < 0) {
-        (void) fprintf(stderr, "unable to get current timestamp: %s",
-                       strerror(errno));
-        return (-1);
-    }
-
-    base_filename = g_path_get_basename(ts->bprm->filename);
-    (void) strftime(timestamp, sizeof (timestamp), "%Y%m%d-%H%M%S",
-                    localtime_r(&tv.tv_sec, &tm));
-    (void) snprintf(buf, bufsize, "qemu_%s_%s_%d.core",
-                    base_filename, timestamp, (int)getpid());
-    g_free(base_filename);
-
-    return (0);
+    return g_strdup_printf("qemu_%s_%s_%d.core",
+                           base_filename, nowstr, (int)getpid());
 }
 
 static int dump_write(int fd, const void *ptr, size_t size)
@@ -3928,7 +3911,7 @@ static int elf_core_dump(int signr, const CPUArchState *env)
     const CPUState *cpu = env_cpu((CPUArchState *)env);
     const TaskState *ts = (const TaskState *)cpu->opaque;
     struct vm_area_struct *vma = NULL;
-    char corefile[PATH_MAX];
+    g_autofree char *corefile = NULL;
     struct elf_note_info info;
     struct elfhdr elf;
     struct elf_phdr phdr;
@@ -3945,8 +3928,7 @@ static int elf_core_dump(int signr, const CPUArchState *env)
     if (dumpsize.rlim_cur == 0)
         return 0;
 
-    if (core_dump_filename(ts, corefile, sizeof (corefile)) < 0)
-        return (-errno);
+    corefile = core_dump_filename(ts);
 
     if ((fd = open(corefile, O_WRONLY | O_CREAT,
                    S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH)) < 0)
-- 
2.31.1


