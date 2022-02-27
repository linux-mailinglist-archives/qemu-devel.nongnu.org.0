Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CBE4C5F7C
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 23:40:33 +0100 (CET)
Received: from localhost ([::1]:53640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOSDQ-0005iv-SK
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 17:40:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nOS8s-000648-C2
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:35:50 -0500
Received: from [2607:f8b0:4864:20::832] (port=37524
 helo=mail-qt1-x832.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nOS8o-00032T-RQ
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:35:50 -0500
Received: by mail-qt1-x832.google.com with SMTP id q10so7498802qtw.4
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 14:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tA46xifQb/Ew3SN4Orf7Q7oKzCRYfHaaqw12116qxJA=;
 b=JPIyqyeJlK7F5z6CJQ0kHxfKuUGr5rZDcnbehVVrK+Dg/v/+VdoOD7I88kQpD8ER/W
 q/DPHo7M1tjRpgksCEpUHd9HZEZ7MEgMcc+GniY4iuWzdjbKbXe5tBJmQlKvibwvEyVp
 VRlSOS1zOOgt4JZsHEzqkdhw1W2uSvLu3iJdfjnlKCQCpvOjouVFyYnOjt3huKZT/sg4
 BCSAxOlgX/k4v9ia8moLksnLShk0Pw6qcR98ahB2OslAQwOxOJ8H5snuFBMzMKpzj00X
 vKlN58+oioDWeHodVS/3u2DSaGQdC2VRp2zziP7A1zDUAijszCGTqx49sLRSdcX0ZDVd
 iMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tA46xifQb/Ew3SN4Orf7Q7oKzCRYfHaaqw12116qxJA=;
 b=djg1c4VYPldTNE27dlTstDha1XMN5g3xsY/r6oe5emtIZGCfns7AzuNNIXyqHgE3aV
 poCSmQWiNYBFz/tlw0JviXyWLFWb9RCWzjAbXU6E/8hNoZ9gar6FlO/tt78jb9g61ksV
 wgpeXUN//H0FuJI1W7ALYpb51gh1F1Nagp+Y/y325KzScbNo3KvcrZIVw05jtBEbBsYc
 b9XkZttJjYz7fGgXmpBuN3Z1MsVBPB0asadPqVSO7VszJZjfdvB6xPCO01T4PN1ILxlb
 U1c4jQ8PnJVUdvUKFQn1kxuk+rPkfBMYCczPiwHlbu5y9eTlFPEDo2PfF7gknOomyLiE
 AdaA==
X-Gm-Message-State: AOAM533pNuWX13QLtfIg4z9MUEgLwthy+3rfZiG1159e7teJBN7USsT+
 zHkwZUzVU66tysHcstzv+Zx7etoGgGUvlA==
X-Google-Smtp-Source: ABdhPJyVqQUgmkQsIb6gM+Xjbo4HwJodbmfCjM4KUj8wdWqTiFJys8XFwNT+SKHbkdzCjI59GrWEMg==
X-Received: by 2002:a05:622a:1a22:b0:2dd:e0ff:f5e6 with SMTP id
 f34-20020a05622a1a2200b002dde0fff5e6mr14255732qtb.371.1646001345542; 
 Sun, 27 Feb 2022 14:35:45 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219]) by smtp.gmail.com with ESMTPSA id
 85-20020a370758000000b00648b7e3b8a4sm4206485qkh.111.2022.02.27.14.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 14:35:45 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 04/11] 9p: darwin: Handle struct dirent differences
Date: Sun, 27 Feb 2022 17:35:15 -0500
Message-Id: <20220227223522.91937-5-wwcohen@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220227223522.91937-1-wwcohen@gmail.com>
References: <20220227223522.91937-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::832
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x832.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fabian Franz <fabianfranz.oss@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

On darwin d_seekoff exists, but is optional and does not seem to
be commonly used by file systems. Use `telldir` instead to obtain
the seek offset and inject it into d_seekoff, and create a
qemu_dirent_off helper to call it appropriately when appropriate.

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
[Michael Roitzsch: - Rebase for NixOS]
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
[Will Cohen: - Adjust to pass testing
             - Ensure that d_seekoff is filled using telldir
               on darwin, and create qemu_dirent_off helper
               to decide which to access]
[Fabian Franz: - Add telldir error handling for darwin]
Signed-off-by: Fabian Franz <fabianfranz.oss@gmail.com>
[Will Cohen: - Ensure that telldir error handling uses
               signed int
             - Cleanup of telldir error handling
             - Remove superfluous error handling for
               qemu_dirent_off
             - Adjust formatting
             - Use qemu_dirent_off in codir.c
             - Declare qemu_dirent_off as static to prevent
               linker error
             - Move qemu_dirent_off above the end-of-file
               endif to fix compilation]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 hw/9pfs/9p-local.c |  9 +++++++++
 hw/9pfs/9p-proxy.c | 16 +++++++++++++++-
 hw/9pfs/9p-synth.c |  4 ++++
 hw/9pfs/9p-util.h  | 16 ++++++++++++++++
 hw/9pfs/9p.c       |  7 +++++--
 hw/9pfs/codir.c    |  4 +++-
 6 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index 1a5e3eed73..f3272f0b43 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -562,6 +562,15 @@ again:
     if (!entry) {
         return NULL;
     }
+#ifdef CONFIG_DARWIN
+    int off;
+    off = telldir(fs->dir.stream);
+    /* If telldir fails, fail the entire readdir call */
+    if (off < 0) {
+        return NULL;
+    }
+    entry->d_seekoff = off;
+#endif
 
     if (ctx->export_flags & V9FS_SM_MAPPED) {
         entry->d_type = DT_UNKNOWN;
diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
index b1664080d8..8b4b5cf7dc 100644
--- a/hw/9pfs/9p-proxy.c
+++ b/hw/9pfs/9p-proxy.c
@@ -706,7 +706,21 @@ static off_t proxy_telldir(FsContext *ctx, V9fsFidOpenState *fs)
 
 static struct dirent *proxy_readdir(FsContext *ctx, V9fsFidOpenState *fs)
 {
-    return readdir(fs->dir.stream);
+    struct dirent *entry;
+    entry = readdir(fs->dir.stream);
+#ifdef CONFIG_DARWIN
+    if (!entry) {
+        return NULL;
+    }
+    int td;
+    td = telldir(fs->dir.stream);
+    /* If telldir fails, fail the entire readdir call */
+    if (td < 0) {
+        return NULL;
+    }
+    entry->d_seekoff = td;
+#endif
+    return entry;
 }
 
 static void proxy_seekdir(FsContext *ctx, V9fsFidOpenState *fs, off_t off)
diff --git a/hw/9pfs/9p-synth.c b/hw/9pfs/9p-synth.c
index bf9b0c5ddd..b3080e415b 100644
--- a/hw/9pfs/9p-synth.c
+++ b/hw/9pfs/9p-synth.c
@@ -234,7 +234,11 @@ static void synth_direntry(V9fsSynthNode *node,
              offsetof(struct dirent, d_name) + sz);
     memcpy(entry->d_name, node->name, sz);
     entry->d_ino = node->attr->inode;
+#ifdef CONFIG_DARWIN
+    entry->d_seekoff = off + 1;
+#else
     entry->d_off = off + 1;
+#endif
 }
 
 static struct dirent *synth_get_dentry(V9fsSynthNode *dir,
diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 546f46dc7d..7449733c15 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -78,4 +78,20 @@ ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
 ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
                                 const char *name);
 
+/**
+ * Darwin has d_seekoff, which appears to function similarly to d_off.
+ * However, it does not appear to be supported on all file systems,
+ * so ensure it is manually injected earlier and call here when
+ * needed.
+ */
+static inline off_t qemu_dirent_off(struct dirent *dent)
+{
+#ifdef CONFIG_DARWIN
+    return dent->d_seekoff;
+#else
+    return dent->d_off;
+#endif
+}
+
+
 #endif
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 1563d7b7c6..caf3b240fe 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -27,6 +27,7 @@
 #include "virtio-9p.h"
 #include "fsdev/qemu-fsdev.h"
 #include "9p-xattr.h"
+#include "9p-util.h"
 #include "coth.h"
 #include "trace.h"
 #include "migration/blocker.h"
@@ -2281,7 +2282,7 @@ static int coroutine_fn v9fs_do_readdir_with_stat(V9fsPDU *pdu,
         count += len;
         v9fs_stat_free(&v9stat);
         v9fs_path_free(&path);
-        saved_dir_pos = dent->d_off;
+        saved_dir_pos = qemu_dirent_off(dent);
     }
 
     v9fs_readdir_unlock(&fidp->fs.dir);
@@ -2420,6 +2421,7 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
     V9fsString name;
     int len, err = 0;
     int32_t count = 0;
+    off_t off;
     struct dirent *dent;
     struct stat *st;
     struct V9fsDirEnt *entries = NULL;
@@ -2480,12 +2482,13 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
             qid.version = 0;
         }
 
+        off = qemu_dirent_off(dent);
         v9fs_string_init(&name);
         v9fs_string_sprintf(&name, "%s", dent->d_name);
 
         /* 11 = 7 + 4 (7 = start offset, 4 = space for storing count) */
         len = pdu_marshal(pdu, 11 + count, "Qqbs",
-                          &qid, dent->d_off,
+                          &qid, off,
                           dent->d_type, &name);
 
         v9fs_string_free(&name);
diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
index c0873bde16..f96d8ac4e6 100644
--- a/hw/9pfs/codir.c
+++ b/hw/9pfs/codir.c
@@ -22,6 +22,8 @@
 #include "qemu/coroutine.h"
 #include "qemu/main-loop.h"
 #include "coth.h"
+#include "9p-xattr.h"
+#include "9p-util.h"
 
 /*
  * Intended to be called from bottom-half (e.g. background I/O thread)
@@ -166,7 +168,7 @@ static int do_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
         }
 
         size += len;
-        saved_dir_pos = dent->d_off;
+        saved_dir_pos = qemu_dirent_off(dent);
     }
 
     /* restore (last) saved position */
-- 
2.35.1


