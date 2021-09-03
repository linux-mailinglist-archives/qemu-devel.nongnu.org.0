Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B1C3FFCB8
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:07:57 +0200 (CEST)
Received: from localhost ([::1]:40092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5Ay-0001Z4-9v
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM57A-0006Bz-Dv
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:04:00 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM577-0005f9-D0
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:04:00 -0400
Received: by mail-wr1-x42b.google.com with SMTP id n5so7155472wro.12
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 02:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5/N/ygGGEO4FJCbA3u79534rctxSYi1cLOVSuXy4QtY=;
 b=VZX6eXB8I2KChGZTeudU9P1NzKcHm1PgXW+LBNoqq7XY2MH+ZjgUvmAa+tsV60iv0l
 30z7ZePXtWH8BOuDfERXqOrza8UtWDekGMRfPKv3jil7qrGTMB8ng1CgLhGkXU0N1udK
 dj6SatNSZmyxJMaMfXNby6tAdvUlJvuXtUx/3Wfx5xn8tBcEWIVkcU8z0gtvkKg3EnQQ
 p/qX7LAx2zv+LiP6NAmjxyczFEPEFUS1TDTJRwLmtlIWu98oRAFKcczjitE+3uZF6eDN
 cn32Cu0am4nOITYcVZrNRrf4thWtuG/lIxkWjha1edCp4Bde9fcT/bp79U19ERGt3rFU
 B1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5/N/ygGGEO4FJCbA3u79534rctxSYi1cLOVSuXy4QtY=;
 b=b3tIYQdhikH0sw4ry43cMv1A1rGnYRgWMLI+iH3a+C9Uh/Zs4T5UR6gmRwcG5koB/S
 S20ctQQP97/ntMjqI5529mXsziCYbPgsY19hePV1ELeUYwda9VUOsJ3TfbIiwizz5RD1
 tTRQ6to9dRgyBOhiJFM8q9x6nPNhWNTxlmBlBECgCyqdw828EKoz77T4QlWwWp1VbyBX
 gS1UuapouDa5+CzA1Y9nFtLY5F/enUG8raaqVgj5dWKw6A2JoCaRJj5E2AkeU6LVXWx+
 cjTPsbPHx7fbU0tCAdUUSCjczBv5rrNH2eC/Oxjxjc8zWCkEA2ktWP4ovwD4zfQ/eYXx
 gJHQ==
X-Gm-Message-State: AOAM532AH1yv83iiNfFAaykzETd7bTu9+FUL6r5iPT5P0I0JQ5381lzW
 Y3/WeSkgLmq3+iIkUIlSNPj+JA==
X-Google-Smtp-Source: ABdhPJwMQZJbIfW/1XN2KUNeh/MuDy+dGIzrP5QeHcAW4FFVmroNdz4vF4MEduNWpA985YD2vpaFGA==
X-Received: by 2002:adf:e449:: with SMTP id t9mr2704370wrm.135.1630659835119; 
 Fri, 03 Sep 2021 02:03:55 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y15sm4062044wrw.64.2021.09.03.02.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 02:03:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9641E1FFA5;
 Fri,  3 Sep 2021 10:03:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 09/22] plugins: allow plugin arguments to be passed directly
Date: Fri,  3 Sep 2021 10:03:26 +0100
Message-Id: <20210903090339.1074887-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903090339.1074887-1-alex.bennee@linaro.org>
References: <20210903090339.1074887-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Passing arguments to plugins had to be done through "arg=<argname>".
This is redundant and introduces confusion especially when the argument
has a name and value (e.g. `-plugin plugin_name,arg="argname=argvalue"`).

This allows passing plugin arguments directly e.g:

    `-plugin plugin_name,argname=argvalue`

For now, passing arguments through "arg=" is still supports but outputs
a deprecation warning.

Also, this commit makes boolean arguments passed to plugins in the
`argname=on|off` form instead of the deprecated short-boolean form.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210730135817.17816-2-ma.mandourr@gmail.com>

diff --git a/linux-user/main.c b/linux-user/main.c
index 37ed50d98e..a6094563b6 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -463,7 +463,7 @@ static const struct qemu_argument arg_table[] = {
      "",           "[[enable=]<pattern>][,events=<file>][,file=<file>]"},
 #ifdef CONFIG_PLUGIN
     {"plugin",     "QEMU_PLUGIN",      true,  handle_arg_plugin,
-     "",           "[file=]<file>[,arg=<string>]"},
+     "",           "[file=]<file>[,<argname>=<argvalue>]"},
 #endif
     {"version",    "QEMU_VERSION",     false, handle_arg_version,
      "",           "display version information and exit"},
diff --git a/plugins/loader.c b/plugins/loader.c
index 05df40398d..a4ec281692 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -94,6 +94,8 @@ static int plugin_add(void *opaque, const char *name, const char *value,
 {
     struct qemu_plugin_parse_arg *arg = opaque;
     struct qemu_plugin_desc *p;
+    bool is_on;
+    char *fullarg;
 
     if (strcmp(name, "file") == 0) {
         if (strcmp(value, "") == 0) {
@@ -107,18 +109,32 @@ static int plugin_add(void *opaque, const char *name, const char *value,
             QTAILQ_INSERT_TAIL(arg->head, p, entry);
         }
         arg->curr = p;
-    } else if (strcmp(name, "arg") == 0) {
+    } else {
         if (arg->curr == NULL) {
             error_setg(errp, "missing earlier '-plugin file=' option");
             return 1;
         }
+
+        if (g_strcmp0(name, "arg") == 0 &&
+                !qapi_bool_parse(name, value, &is_on, NULL)) {
+            if (strchr(value, '=') == NULL) {
+                /* Will treat arg="argname" as "argname=on" */
+                fullarg = g_strdup_printf("%s=%s", value, "on");
+            } else {
+                fullarg = g_strdup_printf("%s", value);
+            }
+            warn_report("using 'arg=%s' is deprecated", value);
+            error_printf("Please use '%s' directly\n", fullarg);
+        } else {
+            fullarg = g_strdup_printf("%s=%s", name, value);
+        }
+
         p = arg->curr;
         p->argc++;
         p->argv = g_realloc_n(p->argv, p->argc, sizeof(char *));
-        p->argv[p->argc - 1] = g_strdup(value);
-    } else {
-        error_setg(errp, "-plugin: unexpected parameter '%s'; ignored", name);
+        p->argv[p->argc - 1] = fullarg;
     }
+
     return 0;
 }
 
diff --git a/qemu-options.hx b/qemu-options.hx
index 83aa59a920..4a9ee722c9 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4532,19 +4532,18 @@ SRST
 
 ERST
 DEF("plugin", HAS_ARG, QEMU_OPTION_plugin,
-    "-plugin [file=]<file>[,arg=<string>]\n"
+    "-plugin [file=]<file>[,<argname>=<argvalue>]\n"
     "                load a plugin\n",
     QEMU_ARCH_ALL)
 SRST
-``-plugin file=file[,arg=string]``
+``-plugin file=file[,argname=argvalue]``
     Load a plugin.
 
     ``file=file``
         Load the given plugin from a shared library file.
 
-    ``arg=string``
-        Argument string passed to the plugin. (Can be given multiple
-        times.)
+    ``argname=argvalue``
+        Argument passed to the plugin. (Can be given multiple times.)
 ERST
 
 HXCOMM Internal use
-- 
2.30.2


