Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA37C4BD00C
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Feb 2022 18:03:08 +0100 (CET)
Received: from localhost ([::1]:56016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLpc3-0008BX-Uz
	for lists+qemu-devel@lfdr.de; Sun, 20 Feb 2022 12:03:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nLpQg-0007mi-0c
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 11:51:22 -0500
Received: from [2607:f8b0:4864:20::730] (port=41763
 helo=mail-qk1-x730.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nLpQd-0000CT-0j
 for qemu-devel@nongnu.org; Sun, 20 Feb 2022 11:51:21 -0500
Received: by mail-qk1-x730.google.com with SMTP id d84so13593081qke.8
 for <qemu-devel@nongnu.org>; Sun, 20 Feb 2022 08:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tYoP77FurlvuwztILnvVHYI4CslvWCvB2NtO3LJB/QE=;
 b=pLMhsHPB9/+zdIK0lRKMlZyMG8uyQd2uRfnRCoZQo8mriLHEhy23wijyR6SF8C9w2Q
 ik7DO6xiahPFymFGurN7ghtNw2XTLZNvIPYAIzoqNcz7HtStkue3k55HEFa8FgUAmef3
 dPLDVMdfceGTCgn8sgLvQyUz4sta1A4YCRC/38xooWV9j0cqHz5Is4yAcaaV6/b4EXxQ
 rvwKZUfUz1n3+EC5jiF8p8J2GuBof+WUrMiPjWwBPE3rhiDvhyiuRLzUQ4U/fV1fWCz/
 FHIHk8AL2mXskGTFRTtwpP3qCJMt6z4sO3hmCTMy1wop73IWVONoBFHkPjDp4hJP05wo
 Hrhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tYoP77FurlvuwztILnvVHYI4CslvWCvB2NtO3LJB/QE=;
 b=vpoWTd0Ea4Dm/7uT0wUYrM4o25bNPjSQRyehjxlzQHbzBjHy1Lv4vvWavgdMVFIvXQ
 ERCQUKRI/W+GzuCRjrqFsxOAAYUEuXSc10ROyRxzoplnx73+CKC0xnTX0rTmxbFEl6B2
 06lmrWrodQMQkH1NLl7QxUaYU8LVTLpcNJanU3oYsTHEKO6Ue0wEzZciO23mxJY/niZK
 sJLsZjNmsbYGfp7m9bYuAhlv/5Yt22E7FfkmjE90spqyKOLUYiS8b67WJXlKSZPI2S+g
 vOX8pitLUDtqCQW8wL0/TL8oewR4/a8868Jsnsv3WqPV98QRbQ7+xlfm4CiH0gbo1W/i
 M5Xg==
X-Gm-Message-State: AOAM531c1Z/xJA4qqvjX4K2VnezsGNmJjCH2m9z4aKE5CrmnID6e6qBO
 cGmFKAlaUgm1alK2bIas1mqPje0xOHo7nA==
X-Google-Smtp-Source: ABdhPJygJZz/Q3TOwer5pcloCipH4+ukmW1VxQ6ICbAjMDtcYHloFmt2f2g7+tWA7qLvXxfEUj46ug==
X-Received: by 2002:a37:9146:0:b0:507:d59c:6059 with SMTP id
 t67-20020a379146000000b00507d59c6059mr9980011qkd.593.1645375877810; 
 Sun, 20 Feb 2022 08:51:17 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id n16sm3190995qkn.115.2022.02.20.08.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 08:51:17 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 04/11] 9p: darwin: Handle struct dirent differences
Date: Sun, 20 Feb 2022 11:50:49 -0500
Message-Id: <20220220165056.72289-5-wwcohen@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220220165056.72289-1-wwcohen@gmail.com>
References: <20220220165056.72289-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::730
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=wwcohen@gmail.com; helo=mail-qk1-x730.google.com
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is,
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
             - Use qemu_dirent_off in codir.c]
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
index 546f46dc7d..d41f37f085 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -79,3 +79,19 @@ ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
                                 const char *name);
 
 #endif
+
+
+/**
+ * Darwin has d_seekoff, which appears to function similarly to d_off.
+ * However, it does not appear to be supported on all file systems,
+ * so ensure it is manually injected earlier and call here when
+ * needed.
+ */
+inline off_t qemu_dirent_off(struct dirent *dent)
+{
+#ifdef CONFIG_DARWIN
+    return dent->d_seekoff;
+#else
+    return dent->d_off;
+#endif
+}
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


