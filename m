Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A80519A8E3
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Apr 2020 11:51:06 +0200 (CEST)
Received: from localhost ([::1]:57266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJa1Y-0000uQ-Tw
	for lists+qemu-devel@lfdr.de; Wed, 01 Apr 2020 05:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38489)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jJZyo-0004SA-VG
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 05:48:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jJZyn-0002FK-E0
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 05:48:14 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:50713)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jJZyn-0002EI-6X
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 05:48:13 -0400
Received: by mail-wm1-x342.google.com with SMTP id t128so5875542wma.0
 for <qemu-devel@nongnu.org>; Wed, 01 Apr 2020 02:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a5n4+mCgHjpSYN+9AuOFcTGtUw1azSmiJDpjSXdf7Wc=;
 b=aZ0z0rc/9+8dM3ZkrGfOa9o/29ZpKvZfV9m6USTQ0NMEhY1w0K9+5AARPKSpjr6Poj
 f5fXTJDdbK9bpna/NzbkCZ7CFezRNnB7myByt0snEQaLhrtCMfFv8TsHz/85Mpaxi6Lx
 VYonRWHoLRgXAThAFVyxRLoe2yDHH4NOOSVPGReKzOHbqEPNO0GsVvddDpMrPqmbBwFE
 rpLKCF6JR3nbNfnubD+r5SXuoDSUjd67wH2Arb6XBQHk9CTcbQQ8BFqMNc3LD/fJR15R
 hayOM8w9HneoM3VcE4KFcyXev1doeLBsPUR3YIdizQDrk5SeqB60m0w8gq2Fg1byJYYk
 JO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a5n4+mCgHjpSYN+9AuOFcTGtUw1azSmiJDpjSXdf7Wc=;
 b=gSo+/7DR56ksqGmu9B+ZtKtcCt/wuu3SVuC5IHE+aQtUnUUYaYZhea56gWaaOWRLR4
 FWOHeAv8OEQfYguhgSLKSlJ58jZFTBfaBsENMP2sV7ZkGsUmwjaeNNwAp7M+0s58BPt9
 YDPT97Nrrlnh+YSUnMSmWIoME7Gl++HpDcXSWBIucw+x/kPptQEIdsNom6s42e1KbU05
 BIN97aDCWmy6z7GgNa3yKgbulTfumhvMlRAjNUxud0v9uvpFrThXyVwSduqmzwoBk1F3
 xpyVo2+VZhhZbBQXgZLXs8fRSRJUZCrajYQDZ47PbOJpAG0Xf8TEgi6CbE4XLm3UMtI4
 /Rrg==
X-Gm-Message-State: AGi0Pub0sW38NpPiz2mMvPiNaNljpv1HXHRFe2xn2oKZj98J2UeMA5l2
 gTmjPC4eMnxIaC1GfVbwSBmRHw==
X-Google-Smtp-Source: APiQypLn83cBHAUgHLqKie7d1j0B/cliC3qfVv6pl9iAB9WfHDQsdBQf35ewDQ20PapGommnFScTHA==
X-Received: by 2002:a1c:4684:: with SMTP id t126mr3375000wma.128.1585734492046; 
 Wed, 01 Apr 2020 02:48:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n6sm2314114wrp.30.2020.04.01.02.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 02:48:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8DC061FF96;
 Wed,  1 Apr 2020 10:48:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 08/10] linux-user: factor out reading of /proc/self/maps
Date: Wed,  1 Apr 2020 10:47:57 +0100
Message-Id: <20200401094759.5835-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200401094759.5835-1-alex.bennee@linaro.org>
References: <20200401094759.5835-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: Riku Voipio <riku.voipio@iki.fi>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unfortunately reading /proc/self/maps is still considered the gold
standard for a process finding out about it's own memory layout. As we
will want this data in other contexts soon factor out the code to read
and parse the data. Rather than just blindly copying the existing
sscanf based code we use a more modern glib version of the parsing
code to make a more general purpose map structure.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/selfmap.h | 44 +++++++++++++++++++++++++
 linux-user/syscall.c   | 58 ++++++++++++++++-----------------
 util/selfmap.c         | 74 ++++++++++++++++++++++++++++++++++++++++++
 util/Makefile.objs     |  1 +
 4 files changed, 147 insertions(+), 30 deletions(-)
 create mode 100644 include/qemu/selfmap.h
 create mode 100644 util/selfmap.c

diff --git a/include/qemu/selfmap.h b/include/qemu/selfmap.h
new file mode 100644
index 00000000000..3bc96feb055
--- /dev/null
+++ b/include/qemu/selfmap.h
@@ -0,0 +1,44 @@
+/*
+ * Utility functions to read our own memory map
+ *
+ * Copyright (c) 2020 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef _SELFMAP_H_
+#define _SELFMAP_H_
+
+typedef struct {
+    uint64_t start;
+    uint64_t end;
+
+    /* flags */
+    bool is_read;
+    bool is_write;
+    bool is_exec;
+    bool is_priv;
+
+    uint64_t offset;
+    gchar *dev;
+    int   inode;
+    gchar *path;
+} MapInfo;
+
+
+/**
+ * read_self_maps:
+ *
+ * Read /proc/self/maps and return a list of MapInfo structures.
+ */
+GSList *read_self_maps(void);
+
+/**
+ * free_self_maps:
+ * @info: a GSlist
+ *
+ * Free a list of MapInfo structures.
+ */
+void free_self_maps(GSList *info);
+
+#endif /* _SELFMAP_H_ */
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index b679bc6b136..0246df01573 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -117,6 +117,7 @@
 
 #include "qemu.h"
 #include "qemu/guest-random.h"
+#include "qemu/selfmap.h"
 #include "user/syscall-trace.h"
 #include "qapi/error.h"
 #include "fd-trans.h"
@@ -7232,45 +7233,45 @@ static int open_self_maps(void *cpu_env, int fd)
 {
     CPUState *cpu = env_cpu((CPUArchState *)cpu_env);
     TaskState *ts = cpu->opaque;
-    FILE *fp;
-    char *line = NULL;
-    size_t len = 0;
-    ssize_t read;
+    GSList *map_info = read_self_maps();
+    GSList *s;
 
-    fp = fopen("/proc/self/maps", "r");
-    if (fp == NULL) {
-        return -1;
-    }
+    for (s = map_info; s; s = g_slist_next(s)) {
+        MapInfo *e = (MapInfo *) s->data;
 
-    while ((read = getline(&line, &len, fp)) != -1) {
-        int fields, dev_maj, dev_min, inode;
-        uint64_t min, max, offset;
-        char flag_r, flag_w, flag_x, flag_p;
-        char path[512] = "";
-        fields = sscanf(line, "%"PRIx64"-%"PRIx64" %c%c%c%c %"PRIx64" %x:%x %d"
-                        " %512s", &min, &max, &flag_r, &flag_w, &flag_x,
-                        &flag_p, &offset, &dev_maj, &dev_min, &inode, path);
-
-        if ((fields < 10) || (fields > 11)) {
-            continue;
-        }
-        if (h2g_valid(min)) {
+        if (h2g_valid(e->start)) {
+            uint64_t min = e->start;
+            uint64_t max = e->end;
             int flags = page_get_flags(h2g(min));
-            max = h2g_valid(max - 1) ? max : (uintptr_t)g2h(GUEST_ADDR_MAX) + 1;
+            const char *path;
+
+            max = h2g_valid(max - 1) ?
+                max : (uintptr_t) g2h(GUEST_ADDR_MAX) + 1;
+
             if (page_check_range(h2g(min), max - min, flags) == -1) {
                 continue;
             }
+
             if (h2g(min) == ts->info->stack_limit) {
-                pstrcpy(path, sizeof(path), "      [stack]");
+                path = "      [stack]";
+            } else {
+                path = e->path;
             }
+
             dprintf(fd, TARGET_ABI_FMT_ptr "-" TARGET_ABI_FMT_ptr
-                    " %c%c%c%c %08" PRIx64 " %02x:%02x %d %s%s\n",
-                    h2g(min), h2g(max - 1) + 1, flag_r, flag_w,
-                    flag_x, flag_p, offset, dev_maj, dev_min, inode,
-                    path[0] ? "         " : "", path);
+                    " %c%c%c%c %08" PRIx64 " %s %d %s%s\n",
+                    h2g(min), h2g(max - 1) + 1,
+                    e->is_read ? 'r' : '-',
+                    e->is_write ? 'w' : '-',
+                    e->is_exec ? 'x' : '-',
+                    e->is_priv ? 'p' : '-',
+                    e->offset, e->dev, e->inode,
+                    path ? "         " : "", path ? path : "");
         }
     }
 
+    free_self_maps(map_info);
+
 #ifdef TARGET_VSYSCALL_PAGE
     /*
      * We only support execution from the vsyscall page.
@@ -7281,9 +7282,6 @@ static int open_self_maps(void *cpu_env, int fd)
             TARGET_VSYSCALL_PAGE, TARGET_VSYSCALL_PAGE + TARGET_PAGE_SIZE);
 #endif
 
-    free(line);
-    fclose(fp);
-
     return 0;
 }
 
diff --git a/util/selfmap.c b/util/selfmap.c
new file mode 100644
index 00000000000..d72b2c32f07
--- /dev/null
+++ b/util/selfmap.c
@@ -0,0 +1,74 @@
+/*
+ * Utility function to get QEMU's own process map
+ *
+ * Copyright (c) 2020 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/cutils.h"
+#include "qemu/selfmap.h"
+
+GSList *read_self_maps(void)
+{
+    gchar *maps;
+    GSList *map_info = NULL;
+
+    if (g_file_get_contents("/proc/self/maps", &maps, NULL, NULL)) {
+        gchar **lines = g_strsplit(maps, "\n", 0);
+        int i, entries = g_strv_length(lines);
+
+        for (i = 0; i < entries; i++) {
+            gchar **fields = g_strsplit(lines[i], " ", 0);
+            if (g_strv_length(fields) > 4) {
+                MapInfo *e = g_new0(MapInfo, 1);
+                int errors;
+                const char *end;
+
+                errors  = qemu_strtoul(fields[0], &end, 16, &e->start);
+                errors += qemu_strtoul(end + 1, NULL, 16, &e->end);
+
+                e->is_read  = fields[1][0] == 'r' ? true : false;
+                e->is_write = fields[1][1] == 'w' ? true : false;
+                e->is_exec  = fields[1][2] == 'x' ? true : false;
+                e->is_priv  = fields[1][3] == 'p' ? true : false;
+
+                errors += qemu_strtoul(fields[2], NULL, 16, &e->offset);
+                e->dev = g_strdup(fields[3]);
+                errors += qemu_strtoi(fields[4], NULL, 10, &e->inode);
+
+                /* A bit ugly as strsplit doesn't skip multiple separators */
+                if (g_strv_length(fields) > 6) {
+                    e->path = g_strdup(fields[g_strv_length(fields) - 1]);
+                }
+                map_info = g_slist_prepend(map_info, e);
+            }
+
+            g_strfreev(fields);
+        }
+        g_strfreev(lines);
+        g_free(maps);
+    }
+
+    /* ensure the map data is in the same order we collected it */
+    return g_slist_reverse(map_info);
+}
+
+/**
+ * free_self_maps:
+ * @info: a GSlist
+ *
+ * Free a list of MapInfo structures.
+ */
+static void free_info(gpointer data)
+{
+    MapInfo *e = (MapInfo *) data;
+    g_free(e->dev);
+    g_free(e->path);
+}
+
+void free_self_maps(GSList *info)
+{
+    g_slist_free_full(info, &free_info);
+}
diff --git a/util/Makefile.objs b/util/Makefile.objs
index 6718a38b616..fe339c2636b 100644
--- a/util/Makefile.objs
+++ b/util/Makefile.objs
@@ -63,3 +63,4 @@ util-obj-y += guest-random.o
 util-obj-$(CONFIG_GIO) += dbus.o
 dbus.o-cflags = $(GIO_CFLAGS)
 dbus.o-libs = $(GIO_LIBS)
+util-obj-$(CONFIG_USER_ONLY) += selfmap.o
-- 
2.20.1


