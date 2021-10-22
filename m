Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5570437AA5
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 18:12:45 +0200 (CEST)
Received: from localhost ([::1]:35418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdx9x-0000s1-09
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 12:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1mdx4n-00036o-6J
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 12:07:26 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:34338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1mdx4l-0004q6-2u
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 12:07:24 -0400
Received: by mail-lj1-x230.google.com with SMTP id 145so1655031ljj.1
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 09:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=Za/D2UN9Z9+XEWh61kGs3HCg0PZ2jhxOM6dupbpj9N8=;
 b=JSbVHyFd6lw79tIxn2xe6gqhf6LrpBG4rlCEnu3JNyRYZ/jJrRUuQ2GbTYhbt/vg+1
 Wxm6VpbI405+dB2l+uakmVNbGD0ojcITIK3bhdSqdgsNmmdY74ukcw0qZ/Asw/LQ1Had
 TxwKK8uwPDDqrp3isp0lsIDWQPiEUiSK9gLBir94DvQMXjs3jz//0FVtuISNvXPIZTcv
 C7czeUnbrczBSvE2FIJIoBrgkRHBqXTFZEapaFxqWKBmZgMVaRRnaddjVrOUhwJG2+PM
 5T9uja+loA7C8lNVTx/ybC+8XaM9mVM2axTWIZ1PyNPNhZxZrnRQzMUnaYU7oqysptPl
 Or3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=Za/D2UN9Z9+XEWh61kGs3HCg0PZ2jhxOM6dupbpj9N8=;
 b=BBCbJqfs7bBplXukFjDdKFao0HtMtkk2sBznuu5Iuk1D6hljlNQZ8ecrgiVLddUkRg
 eFj6Am41zG7j+5XVw2bua5ccIipF2G+ix58/3jRAG2HqzQcgTu0SJ5tY94QyzVaBqtxI
 4Lf4J0U6tZ4av7oRRV9SlO2GKQSwgal9O1+8UNbC84sDB+PLjawsBxCJ4FS3yzWAGFxh
 fclTKJVhfAs7EJY4lao8b2LKu8+9H7FkPNJrdJarygKXNfPGKnxRa03nysma3u3FOPOq
 OWNW6O2NmRKgeyW8DFq6JWJ7fWl8ubN8vfscPOV9IE7OmpDZ41r2Yh6AW/5hjec+xWgQ
 fh8A==
X-Gm-Message-State: AOAM532HOcBWn552UnC3NitbwVgSAc8BffBZHUJ8a55TB9iy5n+cvXLp
 BmAR3NMCFOktHKkCvcGBNFDyigPsbyQfTQ==
X-Google-Smtp-Source: ABdhPJw21VgPQXlFT8c1RZcjjG3MRnX+bSAQlmkZrk4ZWJPO5Fan6c0kA0jHmxoRA6IM1iQUDIFr4g==
X-Received: by 2002:a2e:b5db:: with SMTP id g27mr767705ljn.531.1634918840405; 
 Fri, 22 Oct 2021 09:07:20 -0700 (PDT)
Received: from pc-System-Product-Name.intra.ispras.ru ([85.142.117.226])
 by smtp.gmail.com with ESMTPSA id v13sm1006551ljk.72.2021.10.22.09.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 09:07:20 -0700 (PDT)
From: NDNF <arkaisp2021@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] This patch adds helper functions to the drcov plugin.
Date: Fri, 22 Oct 2021 19:07:14 +0300
Message-Id: <163491883461.304355.8210754161847179432.stgit@pc-System-Product-Name>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <163491872706.304355.11795681036780988723.stgit@pc-System-Product-Name>
References: <163491872706.304355.11795681036780988723.stgit@pc-System-Product-Name>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=arkaisp2021@gmail.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: arkadiy.ivanov@ispras.ru, alex.bennee@linaro.org, pavel.dovgaluk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Which provide information about:
- start_code.
- end_code.
- entry.
- path to the executable binary.

Signed-off-by: Ivanov Arkady <arkadiy.ivanov@ispras.ru>
---
 include/qemu/qemu-plugin.h   |   17 ++++++++++++++++
 plugins/api.c                |   44 ++++++++++++++++++++++++++++++++++++++++++
 plugins/qemu-plugins.symbols |    4 ++++
 3 files changed, 65 insertions(+)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 5775e82c4e..68af67acf2 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -405,4 +405,21 @@ int qemu_plugin_n_max_vcpus(void);
  */
 void qemu_plugin_outs(const char *string);
 
+/**
+ * qemu_plugin_path_to_binary() - returns path to binary file being executed
+ */
+QEMU_PLUGIN_EXPORT const char *qemu_plugin_path_to_binary(void);
+/**
+ * qemu_plugin_start_code() - returns start of text segment
+ */
+QEMU_PLUGIN_EXPORT uint64_t qemu_plugin_start_code(void);
+/**
+ * qemu_plugin_end_code() - returns end of text segment
+ */
+QEMU_PLUGIN_EXPORT uint64_t qemu_plugin_end_code(void);
+/**
+ * qemu_plugin_entry_code() - returns start address for module
+ */
+QEMU_PLUGIN_EXPORT uint64_t qemu_plugin_entry_code(void);
+
 #endif /* QEMU_PLUGIN_API_H */
diff --git a/plugins/api.c b/plugins/api.c
index bbdc5a4eb4..064eebacd1 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -48,6 +48,10 @@
 #endif
 #include "trace/mem.h"
 
+#ifdef CONFIG_USER_ONLY
+#include "qemu.h"
+#endif
+
 /* Uninstall and Reset handlers */
 
 void qemu_plugin_uninstall(qemu_plugin_id_t id, qemu_plugin_simple_cb_t cb)
@@ -340,3 +344,43 @@ void qemu_plugin_outs(const char *string)
 {
     qemu_log_mask(CPU_LOG_PLUGIN, "%s", string);
 }
+
+const char *qemu_plugin_path_to_binary(void)
+{
+#ifdef CONFIG_USER_ONLY
+    TaskState *ts = (TaskState *) current_cpu->opaque;
+    return ts->bprm->filename;
+#else
+    return "path";
+#endif
+}
+
+uint64_t qemu_plugin_start_code(void)
+{
+#ifdef CONFIG_USER_ONLY
+    TaskState *ts = (TaskState *) current_cpu->opaque;
+    return ts->info->start_code;
+#else
+    return 0;
+#endif
+}
+
+uint64_t qemu_plugin_end_code(void)
+{
+#ifdef CONFIG_USER_ONLY
+    TaskState *ts = (TaskState *) current_cpu->opaque;
+    return ts->info->end_code;
+#else
+    return 0xFFFFFFFF;
+#endif
+}
+
+uint64_t qemu_plugin_entry_code(void)
+{
+#ifdef CONFIG_USER_ONLY
+    TaskState *ts = (TaskState *) current_cpu->opaque;
+    return ts->info->entry;
+#else
+    return 0;
+#endif
+}
diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
index 688db92773..d956888f67 100644
--- a/plugins/qemu-plugins.symbols
+++ b/plugins/qemu-plugins.symbols
@@ -1,4 +1,6 @@
 {
+  qemu_plugin_end_code;
+  qemu_plugin_entry_code;
   qemu_plugin_get_hwaddr;
   qemu_plugin_hwaddr_is_io;
   qemu_plugin_hwaddr_to_raddr;
@@ -14,6 +16,7 @@
   qemu_plugin_n_max_vcpus;
   qemu_plugin_n_vcpus;
   qemu_plugin_outs;
+  qemu_plugin_path_to_binary;
   qemu_plugin_ram_addr_from_host;
   qemu_plugin_register_atexit_cb;
   qemu_plugin_register_flush_cb;
@@ -32,6 +35,7 @@
   qemu_plugin_register_vcpu_tb_exec_inline;
   qemu_plugin_register_vcpu_tb_trans_cb;
   qemu_plugin_reset;
+  qemu_plugin_start_code;
   qemu_plugin_tb_get_insn;
   qemu_plugin_tb_n_insns;
   qemu_plugin_tb_vaddr;


