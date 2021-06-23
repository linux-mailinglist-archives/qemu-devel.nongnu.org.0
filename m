Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC263B1E2A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 17:57:10 +0200 (CEST)
Received: from localhost ([::1]:38898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw5FV-0003Cl-6p
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 11:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lw5EV-0002U3-DY
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:56:07 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lw5ET-0005VD-Jn
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:56:07 -0400
Received: by mail-wr1-x429.google.com with SMTP id b3so3214529wrm.6
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 08:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uXGN0cpV3Gpof1WpgLXj/iSpt68g2IUYatXeahWbpps=;
 b=MOK+l568X2KrlpqHdDBMHStvcMI9doxnGuYleTliIbml7jr6Pjqppb+UkgJ8EbLZ90
 +pL3ZBkzPhfZ0GXQIilO4f+w0laWinpMjOMSb1cneO9W35LJNMJkAufjWbUkST8FwF/5
 XuGDH2njGj1hll2sHRIyh3wm883x69a6VOgFKyo0oR0YPsaHqXYZDUAMeXm7mel/0dK5
 7cmcIKtgaUr4a6Nu8E4qkDv1hEseg0QccAe/hJrQ6Qoh5JSrtptAquRqJLlnJEGggSz+
 EwKcdSwVgj03wAApsjyAjP9cMwoAYdhLEdnxjzHOzRSY/RmEGivD/covemGbg8GJxtET
 +GTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uXGN0cpV3Gpof1WpgLXj/iSpt68g2IUYatXeahWbpps=;
 b=AIF8YcZqGNJdhoj7FtuaCp28KLkx7AoZ8JWTiwujNKmhOpnMDK2EdvCU0uLRE4S2NV
 g/lrLyqj+A/vKrtB9GlDwhNcXpvr2rpgjV6c5ZQG2VO4tUSjQfEO1ZKacPt0NV/z1uH6
 JtTxm3B9a/RpqVGH+FJN4/8QxKR0z6fF9B2dUAWF4gOCDvzrwzW7vd/hX1BTfOG2kWOZ
 krxo2NskgoBJpuvyqSJ6++F99xjxqQL3e1J6IfN7+uwHwV9J0Mi+ppYsWKhRqhEPPM6G
 2W7IM9yAaMg1YTQY6H9dvsbLKuwAJg4gnp3hF6l04c/ZDixKMmecAs7UHrvH5SEO+9f3
 FIKw==
X-Gm-Message-State: AOAM531xZexhRNzAZAgQ306dDZCjsboDFvLgADfQ4fW/FkIRjadeQ1mf
 WBrfXvbO0ibrA74+zBFfSPgUeiWPAwuKWw==
X-Google-Smtp-Source: ABdhPJywsrf7VJmzYr00hd+dx+zI4ZcE91JLRZyEih4KKZZiE8zU9QWSNlWaLf6H9Rb+z6esJL2QkQ==
X-Received: by 2002:a05:6000:4b:: with SMTP id
 k11mr863701wrx.192.1624463763741; 
 Wed, 23 Jun 2021 08:56:03 -0700 (PDT)
Received: from localhost.localdomain ([197.61.84.15])
 by smtp.gmail.com with ESMTPSA id s62sm6325210wms.13.2021.06.23.08.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 08:56:03 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] Subject: [RFC PATCH] plugins: Passed the parsed arguments
 directly to plugins
Date: Wed, 23 Jun 2021 17:55:53 +0200
Message-Id: <20210623155553.481099-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x429.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Arguments were passed to plugins in the following form:
    -plugin path/to/plugin,arg="positional_arg=value",arg="second_arg"

This patch removes the need for "arg" so that the argument name itself
is now expected and passed directly to the plugin.

Now options can be passed in the following manner:
    -plugin path/to/plugin,positional_arg=value,second_arg

Since short boolean arguments are deprecated, passing an argument that
takes no value will trigger a warning saying that the user should use a
full "arg_name=on" instead of just "arg_name". In either case, the
argument is passed to the plugin as only the name, omitting the "=on"
part.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 plugins/loader.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/plugins/loader.c b/plugins/loader.c
index 05df40398d..7f32b8c8bd 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -94,6 +94,7 @@ static int plugin_add(void *opaque, const char *name, const char *value,
 {
     struct qemu_plugin_parse_arg *arg = opaque;
     struct qemu_plugin_desc *p;
+    char *full_arg;
 
     if (strcmp(name, "file") == 0) {
         if (strcmp(value, "") == 0) {
@@ -107,7 +108,7 @@ static int plugin_add(void *opaque, const char *name, const char *value,
             QTAILQ_INSERT_TAIL(arg->head, p, entry);
         }
         arg->curr = p;
-    } else if (strcmp(name, "arg") == 0) {
+    } else {
         if (arg->curr == NULL) {
             error_setg(errp, "missing earlier '-plugin file=' option");
             return 1;
@@ -115,9 +116,12 @@ static int plugin_add(void *opaque, const char *name, const char *value,
         p = arg->curr;
         p->argc++;
         p->argv = g_realloc_n(p->argv, p->argc, sizeof(char *));
-        p->argv[p->argc - 1] = g_strdup(value);
-    } else {
-        error_setg(errp, "-plugin: unexpected parameter '%s'; ignored", name);
+        if (strcmp(value, "on")) {
+            full_arg = g_strdup_printf("%s=%s", name, value);
+        } else {
+            full_arg = g_strdup(name);
+        }
+        p->argv[p->argc - 1] = full_arg;
     }
     return 0;
 }
-- 
2.25.1


