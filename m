Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7F03FFD12
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:28:19 +0200 (CEST)
Received: from localhost ([::1]:50972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5Ug-0005Up-OC
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM5F4-0003hZ-N6
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:12:10 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:43588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM5F2-0003vJ-RM
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:12:10 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 o39-20020a05600c512700b002e74638b567so3111995wms.2
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 02:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5M7LN/rhrQ/tByfAjAq1zS6Dlqe4MPUhzqfn+rf9SCw=;
 b=xNXZwStzUDdNbJ7ueWslUc8Su7Fs8m77d5SdoKYa2QB/7XbIYDdVcRKkY2EW184xfp
 TpG0vqN68kUKlX51cn/3u4NWfEFUv0RI6Xh8DJwVnS0ffRMCYBf2RCFj/OfHhhpa52Ov
 SjLqQbKefGM+vpdgl627r9IQqHayWUX66okQBOAUojq4EmYdnYob0WvPDajoGXXiIKZP
 wCe4QENKmXCug66kgm5NEgdK6bfFZD4ATnrpRf6kZSfVT3v/dPbfNVbTJ0W8x03fnjMA
 sCM+qDPbb5D25zq2UUJ4V6W3wDawi+jBcMJlrzapRfmDBXFuh2a/Fm5SFjLq0y9egI8G
 zd4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5M7LN/rhrQ/tByfAjAq1zS6Dlqe4MPUhzqfn+rf9SCw=;
 b=cuFwwG/udG/8eFv7LtJqcDqQSLqSOcp7xD2vAaUxadw34MnxWcuQn8Oe7A3suYeomG
 MxTzDz0t4nsPiWDB32xf0fI03Oyqt1rX+AMS7UEYHGB6OAZ4eXqfUEY77d/sr6o5+Zq5
 gKReetYIACVZ+FyyhsrffsYl/otCTY+tJpKGoS24gysLlu38vOeIIjgJpCPy1kAyurvX
 lyQl3403f3VFI5cGM1Khly0WPqyrvCW4EEn+TBchVOglIRU1rNXqffmrfXw7NLhK9kGd
 EJ0HDYZVjr/0C/Y0AU0i9pJzF4K15uQT1In+LwC48Tl87uzKJFiOvix1kPukGZ9uIsI7
 +Ehg==
X-Gm-Message-State: AOAM532VIVIJSBs3jpp0rZ2jQBn3NopT391YxNg3i6dxNKPJUiD372mT
 AEoxJOf2nl86JthCcX7GmKHQWKuWFhmEeg==
X-Google-Smtp-Source: ABdhPJyQ4UQxxDWb0fqmoAUOgwzb9RwWH6k6p9VUi7XLvzW3CxPrmk3GIl0ZJ60ZrZsggGLS4A6oEg==
X-Received: by 2002:a1c:a9ce:: with SMTP id s197mr7120120wme.173.1630660327381; 
 Fri, 03 Sep 2021 02:12:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d7sm4140205wrs.39.2021.09.03.02.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 02:12:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F18C61FFAC;
 Fri,  3 Sep 2021 10:03:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 14/22] plugins/hwprofile: adapt to the new plugin arguments
 scheme
Date: Fri,  3 Sep 2021 10:03:31 +0100
Message-Id: <20210903090339.1074887-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903090339.1074887-1-alex.bennee@linaro.org>
References: <20210903090339.1074887-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Parsing boolean arguments correctly (e.g. pattern=on or source=false).
Introduced a new "track" argument that takes a [read|write] value. This
substitutes passing read or write to "arg=" that is deprecated.

Also, matches are now taken one by one through the "match" argument.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210730135817.17816-7-ma.mandourr@gmail.com>

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 5cddf31c70..e1f9eff587 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -306,22 +306,22 @@ which will eventually report::
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
-- 
2.30.2


