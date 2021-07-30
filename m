Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E743DBA01
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 16:05:58 +0200 (CEST)
Received: from localhost ([::1]:53852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9T9B-0007zf-GP
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 10:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m9T2a-0004Nv-RM
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:59:08 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m9T2Y-0006bn-Sh
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:59:08 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 o7-20020a05600c5107b0290257f956e02dso2843547wms.1
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 06:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YM9lSqkX/63SYJ35GkzH3H6NlxnAItXlDoJMddZrrag=;
 b=ag9XoMuZ18MJafN2tGZyI+ytcUITu22gjl2a5tYGEBw9BR5B02pcypl0YxOeXX7skV
 G+MJUkv/gUrf1jbmBB8LCQLI5HIOOgxadFxRoDN7ojtq8DNbDvtjm8NDs7luHGcr1cI0
 QmaBl5KevRU1dz9aCK5qYSKVG9jbV1itC8k/fP8P6eG89OGnaGB5xsuuuNiO+BKwdAHh
 i7ctto0nkecwOR0bPlU3N81lgM7rSGsKpJLBbxa/D6RrbXxcmGx8DtuyfJZ7Gp1lTMjh
 GXiu0vf1FHzjI63FbRno1YjFOnIFHWVtiRx9jt4ZzOEiw8VpkATZRVTk7s7uentaDj/A
 iY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YM9lSqkX/63SYJ35GkzH3H6NlxnAItXlDoJMddZrrag=;
 b=ZrB6+oIcIwXVfSOXAQnY6HydfMRhpP1dWsU6vN8v3XF7QMZN7H8766ISLTyHD9kcGb
 DMoRqCjzl2tG7WvykreUp8IpJFBBIyVqG6NkNY3RRxLLxj04lYRT8Srz8E06JRQ0nlOK
 h9URCo0W2CQM4Y7vWl7vp1M4fLLa70nTi282gCs27sVJi9jp1u0P06hWMKfvsY2xBfbh
 W2UJ73wL9P5D37ZCc/MFLN4ndm3VM1NuareOi3l5D8nPPFsj4BY+PoJd7xOPfb/VRafN
 nuSlseVflZXi+NRi6vrwXVUGG9nv7gLj1Nsb2BztrWTtt2cGKl2ZLkWHd2DBPQPZoddy
 lu3w==
X-Gm-Message-State: AOAM532Lye0HEP4gCgumH5C+pMn2aZUHaRiv9+OgfkUl1CweJGDyn5mU
 bxjiHH94z2oqzlIqKTDLCaESQA2odBc=
X-Google-Smtp-Source: ABdhPJzitF4nbNqV+2qjvjj2EyJDVMaPNCAgHOaEBryaiN3Vc2NxzHFfJfT5trQxEFIBcT1NuYgNQw==
X-Received: by 2002:a05:600c:354e:: with SMTP id
 i14mr3071937wmq.96.1627653545193; 
 Fri, 30 Jul 2021 06:59:05 -0700 (PDT)
Received: from localhost.localdomain ([102.44.217.242])
 by smtp.gmail.com with ESMTPSA id h9sm1770277wrw.38.2021.07.30.06.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 06:59:04 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/13] plugins/hwprofile: adapt to the new plugin arguments
 scheme
Date: Fri, 30 Jul 2021 15:58:10 +0200
Message-Id: <20210730135817.17816-7-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730135817.17816-1-ma.mandourr@gmail.com>
References: <20210730135817.17816-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, cota@braap.org,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Parsing boolean arguments correctly (e.g. pattern=on or source=false).
Introduced a new "track" argument that takes a [read|write] value. This
substitutes passing read or write to "arg=" that is deprecated.

Also, matches are now taken one by one through the "match" argument.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 contrib/plugins/hwprofile.c | 39 +++++++++++++++++++++++++------------
 docs/devel/tcg-plugins.rst  |  8 ++++----
 2 files changed, 31 insertions(+), 16 deletions(-)

diff --git a/contrib/plugins/hwprofile.c b/contrib/plugins/hwprofile.c
index faf216ac00..691d4edb0c 100644
--- a/contrib/plugins/hwprofile.c
+++ b/contrib/plugins/hwprofile.c
@@ -259,27 +259,42 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
                         int argc, char **argv)
 {
     int i;
+    g_autoptr(GString) matches_raw = g_string_new("");
 
     for (i = 0; i < argc; i++) {
         char *opt = argv[i];
-        if (g_strcmp0(opt, "read") == 0) {
-            rw = QEMU_PLUGIN_MEM_R;
-        } else if (g_strcmp0(opt, "write") == 0) {
-            rw = QEMU_PLUGIN_MEM_W;
-        } else if (g_strcmp0(opt, "pattern") == 0) {
-            pattern = true;
-        } else if (g_strcmp0(opt, "source") == 0) {
-            source = true;
-        } else if (g_str_has_prefix(opt, "match")) {
-            gchar **parts = g_strsplit(opt, "=", 2);
+        g_autofree char **tokens = g_strsplit(opt, "=", 2);
+
+        if (g_strcmp0(tokens[0], "track") == 0) {
+            if (g_strcmp0(tokens[1], "read") == 0) {
+                rw = QEMU_PLUGIN_MEM_R;
+            } else if (g_strcmp0(tokens[1], "write") == 0) {
+                rw = QEMU_PLUGIN_MEM_W;
+            } else {
+                fprintf(stderr, "invalid value for track: %s\n", tokens[1]);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "pattern") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &pattern)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "source") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &source)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "match") == 0) {
             check_match = true;
-            matches = g_strsplit(parts[1], ",", -1);
-            g_strfreev(parts);
+            g_string_append_printf(matches_raw, "%s,", tokens[1]);
         } else {
             fprintf(stderr, "option parsing failed: %s\n", opt);
             return -1;
         }
     }
+    if (check_match) {
+        matches = g_strsplit(matches_raw->str, ",", -1);
+    }
 
     if (source && pattern) {
         fprintf(stderr, "can only currently track either source or pattern.\n");
diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 1cb8dee240..b7148abef5 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -305,22 +305,22 @@ which will eventually report::
 The hwprofile tool can only be used with system emulation and allows
 the user to see what hardware is accessed how often. It has a number of options:
 
- * arg=read or arg=write
+ * track=read or track=write
 
  By default the plugin tracks both reads and writes. You can use one
  of these options to limit the tracking to just one class of accesses.
 
- * arg=source
+ * source
 
  Will include a detailed break down of what the guest PC that made the
- access was. Not compatible with arg=pattern. Example output::
+ access was. Not compatible with the pattern option. Example output::
 
    cirrus-low-memory @ 0xfffffd00000a0000
     pc:fffffc0000005cdc, 1, 256
     pc:fffffc0000005ce8, 1, 256
     pc:fffffc0000005cec, 1, 256
 
- * arg=pattern
+ * pattern
 
  Instead break down the accesses based on the offset into the HW
  region. This can be useful for seeing the most used registers of a
-- 
2.25.1


