Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD953FFCE3
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:18:05 +0200 (CEST)
Received: from localhost ([::1]:42712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5Km-0005vF-VV
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM57F-0006Tg-GT
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:04:05 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:47045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM57C-0005ik-Oq
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:04:05 -0400
Received: by mail-wr1-x42c.google.com with SMTP id x6so7159840wrv.13
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 02:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GrGtDf2HVWGiASARI4Tm+w/Zub0VNBXRgvn0lkzCIm0=;
 b=OG2tUEas94EA+PZenVwSYKyRMEePFJ9bXvJPqtm6jmojAxN3WgHun2fzCQ1YmtWJNd
 kwds8m94eJGa+JJkkqtlw9Hy1zZF4xGG9gXDRrEUzx6viNchx9M5ZhTGGjhlthy0VRQ2
 LXbNEilk7UX+QCQMSPonehEnTTBF1+LPckcue1ShAzuxzslvdDwQMru8o4g9lp/QTzKk
 Rg3G5d7rnsZeeEiQJd0nb6x/u+ezYPF+uvqNSt4UgfX5AR2GaHR/VfhwuUMagVl1jZUW
 YPJJGnR+r/79BePj2nQ98JMQfO2hPkylSVacreM2YwmnP/egJHuEfjGOOnNRsUJXuIee
 diGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GrGtDf2HVWGiASARI4Tm+w/Zub0VNBXRgvn0lkzCIm0=;
 b=jYZouceeBxmnidcJ/1nmkU37CFsUNXXuhzpSXCAJ7DTUWrnvwErKJnlVbYl+wq9C/e
 QY9R5wMyX6akyHl6Q6o4RhJnWPHZwj8pKCRjt5PZIN5UYzERo5u8anKAAubSATLWbIJY
 X5bMwdZseK/P+GPa6Dvwy3l7GYu8XN/SdvrusCM0xMvVtAsHpl1vJC++0fqoCboxPfnV
 UTDxwWG/7x3kG+clMXzFZqeepkR9dtI3oS2rNopoyWjFhdejGAb4I/I6GozCboYqPxPA
 1hYT5OGGqPCwgnFuWhZOm+SDjDgDsb0LnrYIOr0pgMHF/vmp4o1c8Mr6BK7o7dn7H2Lb
 AGbA==
X-Gm-Message-State: AOAM531JwJI6gWY1TSAAO9sCygtaGyYaLXrfAgUslgUK7Muv7YVrIgTP
 UWltj1mjpExXiGAuIFoKZMkulg==
X-Google-Smtp-Source: ABdhPJzfIe3VfzBV1+mHa0c4I0Zh/5dHEYeCBkv6+/cMkjpTrmyNxH07dotVW3595jCQlw2TkMu44g==
X-Received: by 2002:adf:f490:: with SMTP id l16mr2749048wro.136.1630659841315; 
 Fri, 03 Sep 2021 02:04:01 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f17sm4829325wrt.63.2021.09.03.02.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 02:03:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 683511FFB4;
 Fri,  3 Sep 2021 10:03:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 19/22] tests/plugins/mem: introduce "track" arg and make args
 not positional
Date: Fri,  3 Sep 2021 10:03:36 +0100
Message-Id: <20210903090339.1074887-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903090339.1074887-1-alex.bennee@linaro.org>
References: <20210903090339.1074887-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This commit makes the plugin adhere to the new plugins arg-passing
scheme by expecting full-form boolean args instead of short-form
booleans. This necessitates that we introduce a new argument, here
"track", to accept "r", "w", or "rw".

Also, it makes arguments not positional and we only care about the last
value specified for a certain argument.

callback/inline args are now supplied separately as bool arguments so
that both can be enabled individually.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210730135817.17816-12-ma.mandourr@gmail.com>

diff --git a/tests/plugin/mem.c b/tests/plugin/mem.c
index afd1d27e5c..4570f7d815 100644
--- a/tests/plugin/mem.c
+++ b/tests/plugin/mem.c
@@ -80,29 +80,40 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                                            const qemu_info_t *info,
                                            int argc, char **argv)
 {
-    if (argc) {
-        if (argc >= 3) {
-            if (!strcmp(argv[2], "haddr")) {
-                do_haddr = true;
-            }
-        }
-        if (argc >= 2) {
-            const char *str = argv[1];
 
-            if (!strcmp(str, "r")) {
+    for (int i = 0; i < argc; i++) {
+        char *opt = argv[i];
+        g_autofree char **tokens = g_strsplit(opt, "=", 2);
+
+        if (g_strcmp0(tokens[0], "haddr") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_haddr)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "track") == 0) {
+            if (g_strcmp0(tokens[1], "r") == 0) {
                 rw = QEMU_PLUGIN_MEM_R;
-            } else if (!strcmp(str, "w")) {
+            } else if (g_strcmp0(tokens[1], "w") == 0) {
                 rw = QEMU_PLUGIN_MEM_W;
+            } else if (g_strcmp0(tokens[1], "rw") == 0) {
+                rw = QEMU_PLUGIN_MEM_RW;
+            } else {
+                fprintf(stderr, "invaild value for argument track: %s\n", opt);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "inline") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_inline)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "callback") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_callback)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
             }
-        }
-        if (!strcmp(argv[0], "inline")) {
-            do_inline = true;
-            do_callback = false;
-        } else if (!strcmp(argv[0], "both")) {
-            do_inline = true;
-            do_callback = true;
         } else {
-            do_callback = true;
+            fprintf(stderr, "option parsing failed: %s\n", opt);
+            return -1;
         }
     }
 
-- 
2.30.2


