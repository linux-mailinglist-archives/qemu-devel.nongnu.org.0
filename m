Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B55B431ABE5
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 14:37:14 +0100 (CET)
Received: from localhost ([::1]:32880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAv6n-0005RY-3Y
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 08:37:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaZ-00027z-N5
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:55 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaU-00068h-7k
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:55 -0500
Received: by mail-wr1-x432.google.com with SMTP id r21so2879579wrr.9
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 05:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QEn7ZTjEXlpnK6Z5LFmEhB86Z0e6vdn3sbf2j1XVMa4=;
 b=rkgVNFU2eZwxQNd9FzsJwxRyRqWiSvaPT6aWBtJkJHl9FMrqu+SD9rWywcNSYwjnD1
 54KtjbjVhBnT1rf7vCZ6a9e+nz2AjRWh5FvpbY9bFJ9y4JCnjjCD7g1Kwhe7b8jge1Mk
 iu/Gjxivaww6bL4aOQD7Z7+vBeCCk362MsQqADpgKpnUvCztqMwk3CXkTiUHrRQ0mJV4
 cei1iwJfu8BWGvnaffE854H6AUz+5ax/o+NQr1S/KztfdsNZCM+CDilBWRKdbqVJ+CeG
 b3F22MPMmTQHD4rPdzuffjP76wXqXZWi17Gl1UVVf6jY81V2/SmoRebSOMh3GYj+HMr8
 A8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QEn7ZTjEXlpnK6Z5LFmEhB86Z0e6vdn3sbf2j1XVMa4=;
 b=IxyBO0+vJfT27K6nP6dTHsGibLjs847FDzuXD9zBFUmwNyGkkIB9qB9n1XGJYHGqIi
 pZqqF0ZhpTPaM2hfZ0uk6n9LxqsbtubvMgCVkbLCqOR+91Ish5Mkze7vHPqs1bB0eCNM
 UIuklcsDQQ6d8EAt0Tot8ivUieJHiHgzqAP4dwYwtYYsz0kTE4nvywhsAs6o/OVSoqSn
 31wSyf2f+bXP44zUGZpE43JAu4tORDvx/Tucv6trSQtzOA9nqVCjAeSiaLk5MUK6fAe7
 kZIO95dJUCDJCs06Hlc6SGiyV0Fcpu7br6vAqn4C5UiLci70wwFlg+ONinHRlr4aQkWn
 GFLg==
X-Gm-Message-State: AOAM5318nvjGbm2bf9bqdbmoeMSUSaP9bZcESn2UL4FBQtWGFQJwRLKu
 O7HD5+J8AfYkrejUjAVQZ9DZUg==
X-Google-Smtp-Source: ABdhPJxsDwGxLd106h5KwQvI89lExi87bMUYIg4VOJpRVLqkxWHmRBeaScj0YWE0rnMopD7axYOzhw==
X-Received: by 2002:adf:8545:: with SMTP id 63mr6554632wrh.128.1613221429016; 
 Sat, 13 Feb 2021 05:03:49 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y2sm16641178wmg.13.2021.02.13.05.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 05:03:41 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9E71A1FFAC;
 Sat, 13 Feb 2021 13:03:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 22/23] tests/plugin: allow memory plugin to do both inline
 and callbacks
Date: Sat, 13 Feb 2021 13:03:24 +0000
Message-Id: <20210213130325.14781-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210213130325.14781-1-alex.bennee@linaro.org>
References: <20210213130325.14781-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is going to be useful for acceptance tests that check both types
are being called the same number of times, especially when icount is
enabled.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/plugin/mem.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/tests/plugin/mem.c b/tests/plugin/mem.c
index 4725bd851d..afd1d27e5c 100644
--- a/tests/plugin/mem.c
+++ b/tests/plugin/mem.c
@@ -16,9 +16,10 @@
 
 QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
 
-static uint64_t mem_count;
+static uint64_t inline_mem_count;
+static uint64_t cb_mem_count;
 static uint64_t io_count;
-static bool do_inline;
+static bool do_inline, do_callback;
 static bool do_haddr;
 static enum qemu_plugin_mem_rw rw = QEMU_PLUGIN_MEM_RW;
 
@@ -26,7 +27,12 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
 {
     g_autoptr(GString) out = g_string_new("");
 
-    g_string_printf(out, "mem accesses: %" PRIu64 "\n", mem_count);
+    if (do_inline) {
+        g_string_printf(out, "inline mem accesses: %" PRIu64 "\n", inline_mem_count);
+    }
+    if (do_callback) {
+        g_string_append_printf(out, "callback mem accesses: %" PRIu64 "\n", cb_mem_count);
+    }
     if (do_haddr) {
         g_string_append_printf(out, "io accesses: %" PRIu64 "\n", io_count);
     }
@@ -42,10 +48,10 @@ static void vcpu_mem(unsigned int cpu_index, qemu_plugin_meminfo_t meminfo,
         if (qemu_plugin_hwaddr_is_io(hwaddr)) {
             io_count++;
         } else {
-            mem_count++;
+            cb_mem_count++;
         }
     } else {
-        mem_count++;
+        cb_mem_count++;
     }
 }
 
@@ -60,8 +66,9 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
         if (do_inline) {
             qemu_plugin_register_vcpu_mem_inline(insn, rw,
                                                  QEMU_PLUGIN_INLINE_ADD_U64,
-                                                 &mem_count, 1);
-        } else {
+                                                 &inline_mem_count, 1);
+        }
+        if (do_callback) {
             qemu_plugin_register_vcpu_mem_cb(insn, vcpu_mem,
                                              QEMU_PLUGIN_CB_NO_REGS,
                                              rw, NULL);
@@ -90,6 +97,12 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
         }
         if (!strcmp(argv[0], "inline")) {
             do_inline = true;
+            do_callback = false;
+        } else if (!strcmp(argv[0], "both")) {
+            do_inline = true;
+            do_callback = true;
+        } else {
+            do_callback = true;
         }
     }
 
-- 
2.20.1


