Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E64574C607C
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 01:59:22 +0100 (CET)
Received: from localhost ([::1]:48530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOUNl-0007bs-V6
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 19:59:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nOUMD-0005Rf-4j
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 19:57:45 -0500
Received: from [2607:f8b0:4864:20::433] (port=36833
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nOUM3-0004eQ-Pi
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 19:57:44 -0500
Received: by mail-pf1-x433.google.com with SMTP id z16so9600864pfh.3
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 16:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jqOyJs8JXB+RFi0kH0Q1rdJYocA7grqj4zcYRIDA1W8=;
 b=iEqJ4YZ3sQS8RVCz/iRFKtfCH1RV/FS0igCxyZcm6uRRGHixnlqFaO2ZYdFBy1SAdY
 nl5VGmb2pRYLhpNZMSQhLk5w3PSIo+i73S+FkR0R7zH6QpJDAVT6yQ4rrbNrGG9JsTws
 N6SW5FCPClPYoEEl6o2D/EOHi+togHO/ZjoX/MFWk8JCc5LHBBJ/nnk3qX+oloUiegsB
 4PyWCzpP+e/J6VBcjpjMF0XHdNch2JNpM2nekb6+Rb/O/NLEoRydntg0WO+ay9qbE7zf
 eXyfUQ+LDqeg0iYKkw45Y5kdxEiJLxuzXDoRTvNbLOLHENgpMX/sozdBgih4vSBX0rNr
 QAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jqOyJs8JXB+RFi0kH0Q1rdJYocA7grqj4zcYRIDA1W8=;
 b=6QLR11UfTLri7Z1nSQ2PMFDY8hxORVFsbtF4jUNNsL68Cdhv10GWYqnSYCLb1RSkjN
 yYEdUhDptee4m5tF/3QJEfbqrwfWrYde+qdJNk0AAq2NuqeeJEBgmuilA+fFHb31d+pO
 WhMocMlH3PUPoizZxg/tjOuOIkNvNbXLLnVtzJnzKSoUe1o6/RqIucwKftFfuoqsTExY
 u3kvYcMQ5ZkDdHKQgZ0nZ3lW1CNtlDy/gy4iYIs5Y5u25OAUxLMHB9BNs/HHYfXlRD8k
 IZHpU83lQTaZ7QMFnqgjSEGAex0sLwJ+eW19ntPcWU1ZRZT2Cpn5cB+YhkU92dsbfKq2
 jCuQ==
X-Gm-Message-State: AOAM530GJhp4HnhCKiHlPZ6AdFwUTDnPOt3a8Y0X45WlupYw9Y0dGNN9
 SfHWWcwTWFeSUv+x1uYeoaN44ZvGrQ4=
X-Google-Smtp-Source: ABdhPJww7vaIKDYP5jUveR012AX7qrrQgnlIN9mT1xn2quDN7Hjtfq8lJL1VL5W65gBE7Ec+N/UyVw==
X-Received: by 2002:a05:6a00:1251:b0:4f1:2a1:3073 with SMTP id
 u17-20020a056a00125100b004f102a13073mr18671168pfi.72.1646009854132; 
 Sun, 27 Feb 2022 16:57:34 -0800 (PST)
Received: from localhost.localdomain ([2400:4050:c360:8200:6839:3c6:46aa:5d85])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a056a00130100b004df82ad0498sm10634610pfu.82.2022.02.27.16.57.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 27 Feb 2022 16:57:33 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v3 2/4] datadir: Use bundle mechanism
Date: Mon, 28 Feb 2022 09:57:08 +0900
Message-Id: <20220228005710.10442-4-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220228005710.10442-1-akihiko.odaki@gmail.com>
References: <20220228005710.10442-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

softmmu/datadir.c had its own implementation to find files in the
build tree, but now bundle mechanism provides the unified
implementation which works for datadir and the other files.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 configure         |  2 ++
 meson.build       |  2 +-
 softmmu/datadir.c | 35 ++++++++++++-----------------------
 3 files changed, 15 insertions(+), 24 deletions(-)

diff --git a/configure b/configure
index c56ed53ee36..fda1a35cbc0 100755
--- a/configure
+++ b/configure
@@ -3089,6 +3089,8 @@ for f in $LINKS ; do
     fi
 done
 
+symlink ../../pc-bios qemu-bundle/share/qemu
+
 (for i in $cross_cc_vars; do
   export $i
 done
diff --git a/meson.build b/meson.build
index 8df40bfac4d..a2c987b41d6 100644
--- a/meson.build
+++ b/meson.build
@@ -1469,7 +1469,7 @@ endif
 config_host_data.set_quoted('CONFIG_BINDIR', get_option('prefix') / get_option('bindir'))
 config_host_data.set_quoted('CONFIG_PREFIX', get_option('prefix'))
 config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', get_option('prefix') / qemu_confdir)
-config_host_data.set_quoted('CONFIG_QEMU_DATADIR', get_option('prefix') / qemu_datadir)
+config_host_data.set_quoted('CONFIG_QEMU_BUNDLE_DATADIR', qemu_datadir)
 config_host_data.set_quoted('CONFIG_QEMU_DESKTOPDIR', get_option('prefix') / qemu_desktopdir)
 config_host_data.set_quoted('CONFIG_QEMU_FIRMWAREPATH', get_option('qemu_firmwarepath'))
 config_host_data.set_quoted('CONFIG_QEMU_HELPERDIR', get_option('prefix') / get_option('libexecdir'))
diff --git a/softmmu/datadir.c b/softmmu/datadir.c
index 504c4665bed..2d8366039d9 100644
--- a/softmmu/datadir.c
+++ b/softmmu/datadir.c
@@ -36,6 +36,7 @@ char *qemu_find_file(int type, const char *name)
     int i;
     const char *subdir;
     char *buf;
+    char *bundle;
 
     /* Try the name as a straight path first */
     if (access(name, R_OK) == 0) {
@@ -62,6 +63,16 @@ char *qemu_find_file(int type, const char *name)
         }
         g_free(buf);
     }
+
+    bundle = g_strdup_printf("%s/%s%s",
+                             CONFIG_QEMU_BUNDLE_DATADIR, subdir, name);
+    buf = find_bundle(bundle);
+    g_free(bundle);
+    if (buf) {
+        trace_load_file(name, buf);
+        return buf;
+    }
+
     return NULL;
 }
 
@@ -84,26 +95,6 @@ void qemu_add_data_dir(char *path)
     data_dir[data_dir_idx++] = path;
 }
 
-/*
- * Find a likely location for support files using the location of the binary.
- * When running from the build tree this will be "$bindir/pc-bios".
- * Otherwise, this is CONFIG_QEMU_DATADIR (possibly relocated).
- *
- * The caller must use g_free() to free the returned data when it is
- * no longer required.
- */
-static char *find_datadir(void)
-{
-    g_autofree char *dir = NULL;
-
-    dir = g_build_filename(qemu_get_exec_dir(), "pc-bios", NULL);
-    if (g_file_test(dir, G_FILE_TEST_IS_DIR)) {
-        return g_steal_pointer(&dir);
-    }
-
-    return get_relocated_path(CONFIG_QEMU_DATADIR);
-}
-
 void qemu_add_default_firmwarepath(void)
 {
     char **dirs;
@@ -115,9 +106,6 @@ void qemu_add_default_firmwarepath(void)
         qemu_add_data_dir(get_relocated_path(dirs[i]));
     }
     g_strfreev(dirs);
-
-    /* try to find datadir relative to the executable path */
-    qemu_add_data_dir(find_datadir());
 }
 
 void qemu_list_data_dirs(void)
@@ -126,4 +114,5 @@ void qemu_list_data_dirs(void)
     for (i = 0; i < data_dir_idx; i++) {
         printf("%s\n", data_dir[i]);
     }
+    list_bundle_candidates(CONFIG_QEMU_BUNDLE_DATADIR);
 }
-- 
2.32.0 (Apple Git-132)


