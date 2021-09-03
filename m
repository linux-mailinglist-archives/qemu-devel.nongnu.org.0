Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F233FFD29
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:32:55 +0200 (CEST)
Received: from localhost ([::1]:34502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5Z4-0005AP-V8
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM5F6-0003mw-IX
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:12:12 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:38532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM5F4-0003xR-Uh
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:12:12 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso3287412wms.3
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 02:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZXuwxkhWA08Lj53nliSBduusJq0bDFXFFfvFTQKmSYs=;
 b=HwZ+apV9EWg5qfya3blYaNtAAdb5nUfb9OEjD1UA1Y8Mr2qpuR8MNo4T3PGXmXPl32
 Zefk+e/q5YLRJvx2THXRepvoLVIOHcbCBxZ3QXtpdtPylKu7QByN2BlAIbyjysVLEAmx
 zZk4qfWGqvnuuOMy6P9C5c8FWygtVEms+SwsCseaanpVSOa10mdmQdzDfsXM3mjILVLJ
 NABn1aL0ivQUXovX+YKswW9boQXDeh0mct+581GMqzt3Pz8lMU6R62/dvgxVMwK4o1WV
 IZ25bbuZyjGnob2HUxgeXcppCLinojQBRa5/yMKHZqPHxHbKA0A6SIGXH26V7sd5WHrb
 Hygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZXuwxkhWA08Lj53nliSBduusJq0bDFXFFfvFTQKmSYs=;
 b=qOPoDLR18792QEXyAgsH6fP9/sjKluRKJEAckoDBk1upPvRZ2m/ERubW2MKJTN7k+c
 sPbIfFQrnqqNa18kw2K09JkvfPy9JPjZGqcHRmmdvKAhCJI9wAoZ+cArwcUsOEcg93fG
 JIfEDbbE0st7QM+AaD/R/I80fAYSUovNfPEMe39G80lh7R90yKgP2bR9vCuXW8HAqlMv
 DNpJ/S8UpYkPsD3OxyWbNOgGqu8/vklGPyV7gLnlJRWVv/Zik21OIvEF38MM6pmSqzte
 3IpJEq9CXBa1V8+HTYZ5UiTRk9N3EuVCrHBoPkdqYQkMBwQz6xCr+PfWfYB9f5teHrAr
 HBoA==
X-Gm-Message-State: AOAM531oYamjYKc1sadtTXCpwuWdZY7Xh9SjlmuLDWiusaSq1f9tpUab
 gMdmnBpCMk8M7m28gJ+O4XhOSA==
X-Google-Smtp-Source: ABdhPJwlAMregxW8BLxvWkszPgEW7XN7KKodw9ZYTaCfq9G2ejRFMsz2WmGp+Fzjq2ag702/l1Fihw==
X-Received: by 2002:a1c:98d5:: with SMTP id a204mr7200184wme.52.1630660329625; 
 Fri, 03 Sep 2021 02:12:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q14sm4136468wrc.31.2021.09.03.02.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 02:12:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E41361FFAB;
 Fri,  3 Sep 2021 10:03:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 13/22] plugins/lockstep: make socket path not positional &
 parse bool arg
Date: Fri,  3 Sep 2021 10:03:30 +0100
Message-Id: <20210903090339.1074887-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903090339.1074887-1-alex.bennee@linaro.org>
References: <20210903090339.1074887-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210730135817.17816-6-ma.mandourr@gmail.com>

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index aa75b390b1..5cddf31c70 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -286,7 +286,7 @@ communicate over::
 
   ./sparc-softmmu/qemu-system-sparc -monitor none -parallel none \
     -net none -M SS-20 -m 256 -kernel day11/zImage.elf \
-    -plugin ./contrib/plugins/liblockstep.so,arg=lockstep-sparc.sock \
+    -plugin ./contrib/plugins/liblockstep.so,sockpath=lockstep-sparc.sock \
   -d plugin,nochain
 
 which will eventually report::
diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
index 7fd35eb669..a41ffe83fa 100644
--- a/contrib/plugins/lockstep.c
+++ b/contrib/plugins/lockstep.c
@@ -319,22 +319,35 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                                            int argc, char **argv)
 {
     int i;
-
-    if (!argc || !argv[0]) {
-        qemu_plugin_outs("Need a socket path to talk to other instance.");
-        return -1;
-    }
+    g_autofree char *sock_path = NULL;
 
     for (i = 0; i < argc; i++) {
         char *p = argv[i];
-        if (strcmp(p, "verbose") == 0) {
-            verbose = true;
-        } else if (!setup_unix_socket(argv[0])) {
-            qemu_plugin_outs("Failed to setup socket for communications.");
+        g_autofree char **tokens = g_strsplit(p, "=", 2);
+
+        if (g_strcmp0(tokens[0], "verbose") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &verbose)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", p);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "sockpath") == 0) {
+            sock_path = tokens[1];
+        } else {
+            fprintf(stderr, "option parsing failed: %s\n", p);
             return -1;
         }
     }
 
+    if (sock_path == NULL) {
+        fprintf(stderr, "Need a socket path to talk to other instance.\n");
+        return -1;
+    }
+
+    if (!setup_unix_socket(sock_path)) {
+        fprintf(stderr, "Failed to setup socket for communications.\n");
+        return -1;
+    }
+
     our_id = id;
 
     qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
-- 
2.30.2


