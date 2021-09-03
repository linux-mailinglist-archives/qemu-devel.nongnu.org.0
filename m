Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9A83FFCFD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:23:24 +0200 (CEST)
Received: from localhost ([::1]:32882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5Pv-0001jW-F2
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM57K-0006YM-PJ
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:04:12 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM57E-0005lJ-MU
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:04:07 -0400
Received: by mail-wr1-x42d.google.com with SMTP id q14so7180426wrp.3
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 02:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rctBFtmR+dPbwtBUWAW00cSmCz1yMMhGQfbKWbQXJww=;
 b=Fr1STz58etTag+mpOkNieMCu+pUwUCdb8jGtW68Nis66iws5MyW+UOBwaYN4Y17Juv
 gsdSyGNP/dC15kRpYGJnVCgfMkTK2poVzMYuWld7lg5pSkwEJra8Z3J3+QItCocn+ZwT
 QPSMZrwPCYeKLLsCIYQNTltDazE5hHiqSnJHmj2gntxg0F/2uFEK92hL30v1fNVtguQa
 Vs/QO1rZutvE9B+Y2/uewuXmlxQhanC3KbCANFQTGPVjP+14jotA3S/aNyCmtXwAM/bc
 pdmu2IoywYavqMQOg+wUej7BKbFEeLkNpvCb0y4VaFg10uzu4EqqM0wUtfSNi8ocQvmM
 IWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rctBFtmR+dPbwtBUWAW00cSmCz1yMMhGQfbKWbQXJww=;
 b=YIoNWW5TcCL0kUKTSKPQ7r1AveBovaoooPwzoL77XNENzv5sKNk3hYsfP/sZK5uOPs
 Rx2O3PgaEYMUpggTLUXV4KIuk/tjaj/h6yXZ3EwnGkCkL2v6oXdhB9yXoRiDvC3UeLMu
 WyBaos2CxNke4egXu6Dnce0je4NA7rbbWTZIvub9faAZ0YZf6zfih/DQ2WgMgreciS9J
 GZyO1NheNLeHhmvIZFjR34dTmbXl9GxbFlXTL5uwHOkSDSMtLdpn75Boy1rwgOr5QrZR
 P1vAA8BiGaUpgB5zD9WwrHnq5bnC62dJBJfCoEbLiioi1PrC/IK+cEbgVoyPw8LXblqq
 XsTQ==
X-Gm-Message-State: AOAM5329GxBOIGS4Z863ZukR9FhlhYhbRLeVbSdCF8IAr3e9jsT/eKxa
 w+Rh1BI5bAv9xtFTWgYTJPxaGA==
X-Google-Smtp-Source: ABdhPJz88OXfpPNIO6GeLmsGf6N+XujA3XtQtJoH0qz1vbdRRy05u3YGa1CBwSV7YcGG2miUlfkQdA==
X-Received: by 2002:adf:a2c4:: with SMTP id t4mr2832210wra.258.1630659843258; 
 Fri, 03 Sep 2021 02:04:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k14sm4124243wri.46.2021.09.03.02.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 02:03:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 732981FFB5;
 Fri,  3 Sep 2021 10:03:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 20/22] tests/plugins/syscalls: adhere to new arg-passing scheme
Date: Fri,  3 Sep 2021 10:03:37 +0100
Message-Id: <20210903090339.1074887-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903090339.1074887-1-alex.bennee@linaro.org>
References: <20210903090339.1074887-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Message-Id: <20210730135817.17816-13-ma.mandourr@gmail.com>

diff --git a/tests/plugin/syscall.c b/tests/plugin/syscall.c
index 6dd71092e1..484b48de49 100644
--- a/tests/plugin/syscall.c
+++ b/tests/plugin/syscall.c
@@ -119,17 +119,26 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                                            const qemu_info_t *info,
                                            int argc, char **argv)
 {
-    if (argc == 0) {
-        statistics = g_hash_table_new_full(NULL, g_direct_equal, NULL, g_free);
-    } else {
-        for (int i = 0; i < argc; i++) {
-            if (g_strcmp0(argv[i], "print") != 0) {
-                fprintf(stderr, "unsupported argument: %s\n", argv[i]);
-                return -1;
+    bool do_print = false;
+
+    for (int i = 0; i < argc; i++) {
+        char *opt = argv[i];
+        g_autofree char **tokens = g_strsplit(opt, "=", 2);
+
+        if (g_strcmp0(tokens[0], "print") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_print)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
             }
+        } else {
+            fprintf(stderr, "unsupported argument: %s\n", argv[i]);
+            return -1;
         }
     }
 
+    if (!do_print) {
+        statistics = g_hash_table_new_full(NULL, g_direct_equal, NULL, g_free);
+    }
+
     qemu_plugin_register_vcpu_syscall_cb(id, vcpu_syscall);
     qemu_plugin_register_vcpu_syscall_ret_cb(id, vcpu_syscall_ret);
     qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
-- 
2.30.2


