Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A953EF386
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 22:23:00 +0200 (CEST)
Received: from localhost ([::1]:42644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG5bv-0005Qo-El
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 16:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1mG5af-0004ba-T7
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 16:21:41 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:33527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1mG5aa-0003dy-Ma
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 16:21:40 -0400
Received: by mail-lf1-x133.google.com with SMTP id p38so43903296lfa.0
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 13:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i8TghbAcE8h2Fg6KJh7I87Ii2ieHvqsHc9xw+sPl8FM=;
 b=XRI9tg5iXR0laH0Z4hEkzgaElF2gdsfCsUSScqWomCycHRn5LVosfD5zK6GFyhrQme
 m8Uf6iIHJTBncM4NihikEm+94KwFuZNHOLfV4uoS3T3MDa3tMKG+N4ePr/jffJ/vsQhK
 owsXK165C+dmkfAww642URaU9OL5NTvDZQnqRe4cAm2CYSyYD1HNgpGhxgHky27S7zlB
 hvSeh4X2z6ztPTYnha4fRtEJCnyL3qq3xGVVMp5/jF4YFD5oQqkmMGPTJ3FmqeXTLE8Y
 chlkfAKeXLRlcNvmWpKjtFgCIZHzgbt3xP4LWywDc9UhdSsXr5rMa+AKPIlo684kBNXt
 4QCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i8TghbAcE8h2Fg6KJh7I87Ii2ieHvqsHc9xw+sPl8FM=;
 b=X7fX1pBzonCeHsLOaQuOw+VU7n8lWCjeTBBMsh9N7VCSNgK6bpqSgTG9sI2rhna88z
 F7m6z8BlQFJwNmLHY2llxkQtxwjBXSylrwQH/0rnTmT0JfviCml58g112JqkCGgTazxd
 uMJ85vmXHi10FLV9My6z2yS4HEDWccmyiUw3aFsPrMC6N8+9oOjumg9EYhkAf3Lblkbm
 KikqZHOviUAgyvGwp8ac8Cg3HAq8t7NfNepQ+Y4DciFD2yPLWI8AtfmCe2W658EECtf3
 DyD3BHVWHae02mZGCFZY/WuOqHRGxPKLCeZzYo/+PQRaHLgEPlkJfOuqoLnKR5zHjFm7
 tZ0Q==
X-Gm-Message-State: AOAM533CZ44qVBcswmgvPCea3yUZFgo+CjPV+dYpQXbLj23aPwhNr7mR
 RgZsTGYCg6+CVhsp5axo/RvFoA==
X-Google-Smtp-Source: ABdhPJyMTludIfjhzIyppCZM15wPEOdqR03kk5+/1tUusR0wne8h9jMQMeYbYI0S7y5EvZBQ2qsbVw==
X-Received: by 2002:a05:6512:3e0b:: with SMTP id
 i11mr3590086lfv.45.1629231694612; 
 Tue, 17 Aug 2021 13:21:34 -0700 (PDT)
Received: from 192.168.1.2 ([2a00:1370:810e:b7ea:7e3d:4f4b:921e:b1ff])
 by smtp.gmail.com with ESMTPSA id y17sm280971lfh.246.2021.08.17.13.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 13:21:34 -0700 (PDT)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: philmd@redhat.com, kwolf@redhat.com, hreitz@redhat.com, sw@weilnetz.de,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3] block/file-win32: add reopen handlers
Date: Tue, 17 Aug 2021 23:21:15 +0300
Message-Id: <20210817202115.16771-1-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=viktor.prutyanov@phystech.edu; helo=mail-lf1-x133.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make 'qemu-img commit' work on Windows.

Command 'commit' requires reopening backing file in RW mode. So,
add reopen prepare/commit/abort handlers and change dwShareMode
for CreateFile call in order to allow further read/write reopening.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/418
Suggested-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
---
 v2:
    - fix indentation in raw_reopen_prepare
    - free rs if raw_reopen_prepare fails
 v3:
    - restore suggested-by field missed in v2

 block/file-win32.c | 90 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 89 insertions(+), 1 deletion(-)

diff --git a/block/file-win32.c b/block/file-win32.c
index 2642088bd6..9dcbb2b53b 100644
--- a/block/file-win32.c
+++ b/block/file-win32.c
@@ -58,6 +58,10 @@ typedef struct BDRVRawState {
     QEMUWin32AIOState *aio;
 } BDRVRawState;
 
+typedef struct BDRVRawReopenState {
+    HANDLE hfile;
+} BDRVRawReopenState;
+
 /*
  * Read/writes the data to/from a given linear buffer.
  *
@@ -392,7 +396,7 @@ static int raw_open(BlockDriverState *bs, QDict *options, int flags,
     }
 
     s->hfile = CreateFile(filename, access_flags,
-                          FILE_SHARE_READ, NULL,
+                          FILE_SHARE_READ | FILE_SHARE_WRITE, NULL,
                           OPEN_EXISTING, overlapped, NULL);
     if (s->hfile == INVALID_HANDLE_VALUE) {
         int err = GetLastError();
@@ -634,6 +638,86 @@ static int coroutine_fn raw_co_create_opts(BlockDriver *drv,
     return raw_co_create(&options, errp);
 }
 
+static int raw_reopen_prepare(BDRVReopenState *state,
+                              BlockReopenQueue *queue, Error **errp)
+{
+    BDRVRawState *s = state->bs->opaque;
+    BDRVRawReopenState *rs;
+    int access_flags;
+    DWORD overlapped;
+    int ret = 0;
+
+    rs = g_new0(BDRVRawReopenState, 1);
+
+    raw_parse_flags(state->flags, s->aio != NULL, &access_flags, &overlapped);
+    rs->hfile = CreateFile(state->bs->filename, access_flags,
+                           FILE_SHARE_READ | FILE_SHARE_WRITE, NULL,
+                           OPEN_EXISTING, overlapped, NULL);
+
+    if (rs->hfile == INVALID_HANDLE_VALUE) {
+        int err = GetLastError();
+
+        error_setg_win32(errp, err, "Could not reopen '%s'",
+                         state->bs->filename);
+        if (err == ERROR_ACCESS_DENIED) {
+            ret = -EACCES;
+        } else {
+            ret = -EINVAL;
+        }
+        goto fail;
+    }
+
+    if (s->aio) {
+        ret = win32_aio_attach(s->aio, rs->hfile);
+        if (ret < 0) {
+            error_setg_errno(errp, -ret, "Could not enable AIO");
+            goto fail;
+        }
+    }
+
+    state->opaque = rs;
+
+    return 0;
+
+fail:
+    g_free(rs);
+    state->opaque = NULL;
+
+    return ret;
+}
+
+static void raw_reopen_commit(BDRVReopenState *state)
+{
+    BDRVRawState *s = state->bs->opaque;
+    BDRVRawReopenState *rs = state->opaque;
+
+    if (!rs) {
+        return;
+    }
+
+    CloseHandle(s->hfile);
+    s->hfile = rs->hfile;
+
+    g_free(rs);
+    state->opaque = NULL;
+}
+
+static void raw_reopen_abort(BDRVReopenState *state)
+{
+    BDRVRawReopenState *rs = state->opaque;
+
+    if (!rs) {
+        return;
+    }
+
+    if (rs->hfile != INVALID_HANDLE_VALUE) {
+        CloseHandle(rs->hfile);
+    }
+
+    g_free(rs);
+    state->opaque = NULL;
+}
+
 static QemuOptsList raw_create_opts = {
     .name = "raw-create-opts",
     .head = QTAILQ_HEAD_INITIALIZER(raw_create_opts.head),
@@ -659,6 +743,10 @@ BlockDriver bdrv_file = {
     .bdrv_co_create_opts = raw_co_create_opts,
     .bdrv_has_zero_init = bdrv_has_zero_init_1,
 
+    .bdrv_reopen_prepare = raw_reopen_prepare,
+    .bdrv_reopen_commit  = raw_reopen_commit,
+    .bdrv_reopen_abort   = raw_reopen_abort,
+
     .bdrv_aio_preadv    = raw_aio_preadv,
     .bdrv_aio_pwritev   = raw_aio_pwritev,
     .bdrv_aio_flush     = raw_aio_flush,
-- 
2.21.0


