Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F9E4C5F7A
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 23:37:56 +0100 (CET)
Received: from localhost ([::1]:46198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOSAt-0000m2-Sr
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 17:37:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nOS8y-0006LC-4Q
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:35:56 -0500
Received: from [2607:f8b0:4864:20::82d] (port=46878
 helo=mail-qt1-x82d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nOS8w-00033l-Kr
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:35:55 -0500
Received: by mail-qt1-x82d.google.com with SMTP id a1so2961125qta.13
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 14:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cx3IAbAYk/hoLahf3lvx5zska0Zq3/ImEX6yhSjTN6Y=;
 b=E3hXSU0M8viXiaI/GurE10VQs2MrXJLdoT/9kBB45Rbt5Qr42G3MY9RpNv7V3kqMGA
 pjhdlnfCAg5L4Dbe4wt4UoQHM2xBNStk90b5Pg9u0TY4LOv1x4xKXSFC3zUwPoPGNMIr
 498/JaCmd9wMiOnVPe3IKDmSCzP2WHg0OTuu4Sh57VL26qX3U+ciZpxtGYghDYL0/MZZ
 63Gy7MXugm6mgvlRfSk9tvwWegeAuR3zBcG8T9XH4Y5YdY4lipJmHpXKie9fzKfDtIEz
 YdJbqkfG5OVrrN5MF/VOOqrh7TnSh+rZC7dtRmNITkLLABWNx5bG0A5LsaQ4U+5WGKKP
 VESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cx3IAbAYk/hoLahf3lvx5zska0Zq3/ImEX6yhSjTN6Y=;
 b=XCcs7QnzOw4b+OAOrHpNIcxJ7GfR0p8yutNVjHTfK2b8mzWYjUxYfrMUQEnHM7TeH3
 w6A0Bak37m28OLNRqc9zYrcxFSgw0a8KLqzNpBukRZ3RCQUJvYcNjvbJ2SR++mwfDDMw
 nIdigWYJuY7KFZBMPQIPNPK2bN0pMMPYsfz9Ce986AMQw/8jOPhEemDMpWx7HU1chK3K
 688Smicw2jR+A7jG//2WQCEgNeqfHqOUuq/wE2xJyZUyY/Sn1xB1nk19WJnvEIPuJ7YZ
 l44zSr2L7gZljTk7Xq2i5i8sNL4eD5YYFcJzoWESRbqCda5saObVFknWOcgO3BJORh3e
 Zj+w==
X-Gm-Message-State: AOAM531/aep19kAsada3eMEwSnQJQ6nl8DIi8304ndmtXAks+NLWjcGT
 zE8KSpLn8BQ4o7+np7ZJBNHm518f/n1DbA==
X-Google-Smtp-Source: ABdhPJyEIC9+anhdeXrHNNI3V74YO8rQRnJ4E9gTaSRaGRAziNmUm6b9JOw4BfFwJz8iJ9Z7ahFBpA==
X-Received: by 2002:a05:622a:1452:b0:2de:6ed5:6230 with SMTP id
 v18-20020a05622a145200b002de6ed56230mr14552393qtx.619.1646001353416; 
 Sun, 27 Feb 2022 14:35:53 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219]) by smtp.gmail.com with ESMTPSA id
 85-20020a370758000000b00648b7e3b8a4sm4206485qkh.111.2022.02.27.14.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 14:35:52 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 08/11] 9p: darwin: Compatibility for f/l*xattr
Date: Sun, 27 Feb 2022 17:35:19 -0500
Message-Id: <20220227223522.91937-9-wwcohen@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220227223522.91937-1-wwcohen@gmail.com>
References: <20220227223522.91937-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x82d.google.com
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

On darwin `fgetxattr` takes two extra optional arguments,
and the l* variants are not defined (in favor of an extra
flag to the regular variants.

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
[Michael Roitzsch: - Rebase for NixOS]
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 hw/9pfs/9p-local.c | 12 ++++++++----
 hw/9pfs/9p-util.h  | 17 +++++++++++++++++
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
index f3272f0b43..a0d08e5216 100644
--- a/hw/9pfs/9p-local.c
+++ b/hw/9pfs/9p-local.c
@@ -790,16 +790,20 @@ static int local_fstat(FsContext *fs_ctx, int fid_type,
         mode_t tmp_mode;
         dev_t tmp_dev;
 
-        if (fgetxattr(fd, "user.virtfs.uid", &tmp_uid, sizeof(uid_t)) > 0) {
+        if (qemu_fgetxattr(fd, "user.virtfs.uid",
+                           &tmp_uid, sizeof(uid_t)) > 0) {
             stbuf->st_uid = le32_to_cpu(tmp_uid);
         }
-        if (fgetxattr(fd, "user.virtfs.gid", &tmp_gid, sizeof(gid_t)) > 0) {
+        if (qemu_fgetxattr(fd, "user.virtfs.gid",
+                           &tmp_gid, sizeof(gid_t)) > 0) {
             stbuf->st_gid = le32_to_cpu(tmp_gid);
         }
-        if (fgetxattr(fd, "user.virtfs.mode", &tmp_mode, sizeof(mode_t)) > 0) {
+        if (qemu_fgetxattr(fd, "user.virtfs.mode",
+                           &tmp_mode, sizeof(mode_t)) > 0) {
             stbuf->st_mode = le32_to_cpu(tmp_mode);
         }
-        if (fgetxattr(fd, "user.virtfs.rdev", &tmp_dev, sizeof(dev_t)) > 0) {
+        if (qemu_fgetxattr(fd, "user.virtfs.rdev",
+                           &tmp_dev, sizeof(dev_t)) > 0) {
             stbuf->st_rdev = le64_to_cpu(tmp_dev);
         }
     } else if (fs_ctx->export_flags & V9FS_SM_MAPPED_FILE) {
diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 2b9ac74291..9abff79884 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -19,6 +19,23 @@
 #define O_PATH_9P_UTIL 0
 #endif
 
+#ifdef CONFIG_DARWIN
+#define qemu_fgetxattr(...) fgetxattr(__VA_ARGS__, 0, 0)
+#define qemu_lgetxattr(...) getxattr(__VA_ARGS__, 0, XATTR_NOFOLLOW)
+#define qemu_llistxattr(...) listxattr(__VA_ARGS__, XATTR_NOFOLLOW)
+#define qemu_lremovexattr(...) removexattr(__VA_ARGS__, XATTR_NOFOLLOW)
+static inline int qemu_lsetxattr(const char *path, const char *name,
+                                 const void *value, size_t size, int flags) {
+    return setxattr(path, name, value, size, 0, flags | XATTR_NOFOLLOW);
+}
+#else
+#define qemu_fgetxattr fgetxattr
+#define qemu_lgetxattr lgetxattr
+#define qemu_llistxattr llistxattr
+#define qemu_lremovexattr lremovexattr
+#define qemu_lsetxattr lsetxattr
+#endif
+
 static inline void close_preserve_errno(int fd)
 {
     int serrno = errno;
-- 
2.35.1


