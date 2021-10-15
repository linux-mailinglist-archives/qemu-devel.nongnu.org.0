Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC4042EE4C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 12:01:22 +0200 (CEST)
Received: from localhost ([::1]:48372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbK1h-0000iL-Pg
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 06:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1mbJvx-00033h-SX
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:55:26 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:33356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1mbJvw-0005VN-BF
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:55:25 -0400
Received: by mail-lf1-x131.google.com with SMTP id j21so39821858lfe.0
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 02:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=37IIrG3CP7WtvnIT1tpjSOBrnhxIDoe6tnGmofgKBK4=;
 b=Ew9Mk+cUJHR+lr+wzPKV1xgawRL2j+zwqJVru6KAJ922ZaJra9/xE7HNaPEMs7cRdl
 HhGnys6aKU7PCFgFq7Uz0UQQF6Ty9+e8LDraNXdJiPQf+klmhb8WwVxnNi3yo5KS8Hjt
 JguLLo+nnVQAeZUq0PWHnh03YfMz+5VO/W4SsBzdoBI+FV6t09ahGmLNh65MsjhXHki7
 2s2i4E0drlhzUJiFZaktNnxQk5a4jGA+dKpVpDE/wUY5lKW0XSCznLGbjeZz3CqFaoKo
 qgBWlu33+MKuqb2YkET9ACVOnrMhwYyvJNizVzIRNUL8hdBohzDBy5ZdosDU1/IZA81W
 ZksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=37IIrG3CP7WtvnIT1tpjSOBrnhxIDoe6tnGmofgKBK4=;
 b=WOffLBMhFq3x7BRjtpKDr5unFtbOmj/AausHaPuHL98rccD/2ZlvJKDYlSPD4XGHad
 ccJqKLqgQIhxLEKTKKDnT/5csZUPyB2xY70RNz1Y1ZJ4bwoSEZnDMaeXv8dBou87c9d7
 1TNboJzW8EgGi28+/k82X06CYqO3qFERmyriK3yqy0UU09flswKUa7YU6fTVzGLzKRHD
 xOXrGK0NveC1UjmvQJICdT2b03slMOnwgPbROTGh0sE3ruzRMF9Okee/79fr8iShbLwx
 F/Di+Rt2oxZUrsOIFDKMzKoQxTeeGujPJJ6E8/YWqNl0L4mxf5VrEzgKmDhW5HRHDNP5
 QUUg==
X-Gm-Message-State: AOAM533ioeDafbWrGZodqjvocwziWDDr7vO9rF/8gvSjRHq3MqORY1Bn
 mOCVu9WRzsSZmqpcNs56mSnUk3Td/bKR2A==
X-Google-Smtp-Source: ABdhPJyNQhxEkvyfZPly/Uvv1tqvfu2vB5V+ARrSetB1CnxEvadEL4HpySww77F2SxRpN6jfN8N3DA==
X-Received: by 2002:a2e:5858:: with SMTP id x24mr11572363ljd.50.1634291720823; 
 Fri, 15 Oct 2021 02:55:20 -0700 (PDT)
Received: from pc-System-Product-Name.intra.ispras.ru ([85.142.117.226])
 by smtp.gmail.com with ESMTPSA id r128sm456515lff.284.2021.10.15.02.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 02:55:20 -0700 (PDT)
From: NDNF <arkaisp2021@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] src/plugins: add helper functions for drcov
Date: Fri, 15 Oct 2021 12:55:16 +0300
Message-Id: <163429171602.439576.8875867021199772041.stgit@pc-System-Product-Name>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <163429165642.439576.16356288759891202632.stgit@pc-System-Product-Name>
References: <163429165642.439576.16356288759891202632.stgit@pc-System-Product-Name>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=arkaisp2021@gmail.com; helo=mail-lf1-x131.google.com
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
Cc: alex.bennee@linaro.org, pavel.dovgaluk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds helper functions to the drcov plugin.
Which provide information about:
- start_code.
- end_code.
- entry.
- path to the executable binary.

Signed-off-by: Ivanov Arkady <arkadiy.ivanov@ispras.ru>
---
 include/qemu/qemu-plugin.h   |    5 +++++
 plugins/api.c                |   27 +++++++++++++++++++++++++++
 plugins/qemu-plugins.symbols |    4 ++++
 3 files changed, 36 insertions(+)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 5775e82c4e..807d932e02 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -405,4 +405,9 @@ int qemu_plugin_n_max_vcpus(void);
  */
 void qemu_plugin_outs(const char *string);
 
+QEMU_PLUGIN_EXPORT const char *qemu_plugin_path_to_binary(void);
+QEMU_PLUGIN_EXPORT uint64_t qemu_plugin_start_code(void);
+QEMU_PLUGIN_EXPORT uint64_t qemu_plugin_end_code(void);
+QEMU_PLUGIN_EXPORT uint64_t qemu_plugin_entry_code(void);
+
 #endif /* QEMU_PLUGIN_API_H */
diff --git a/plugins/api.c b/plugins/api.c
index bbdc5a4eb4..4e8a582d58 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -340,3 +340,30 @@ void qemu_plugin_outs(const char *string)
 {
     qemu_log_mask(CPU_LOG_PLUGIN, "%s", string);
 }
+
+#ifdef CONFIG_USER_ONLY
+#include "qemu.h"
+const char *qemu_plugin_path_to_binary(void)
+{
+    TaskState *ts = (TaskState *) current_cpu->opaque;
+    return ts->bprm->filename;
+}
+
+uint64_t qemu_plugin_start_code(void)
+{
+    TaskState *ts = (TaskState *) current_cpu->opaque;
+    return ts->info->start_code;
+}
+
+uint64_t qemu_plugin_end_code(void)
+{
+    TaskState *ts = (TaskState *) current_cpu->opaque;
+    return ts->info->end_code;
+}
+
+uint64_t qemu_plugin_entry_code(void)
+{
+    TaskState *ts = (TaskState *) current_cpu->opaque;
+    return ts->info->entry;
+}
+#endif
diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
index 4bdb381f48..021851fb7d 100644
--- a/plugins/qemu-plugins.symbols
+++ b/plugins/qemu-plugins.symbols
@@ -37,4 +37,8 @@
   qemu_plugin_n_vcpus;
   qemu_plugin_n_max_vcpus;
   qemu_plugin_outs;
+  qemu_plugin_path_to_binary;
+  qemu_plugin_start_code;
+  qemu_plugin_end_code;
+  qemu_plugin_entry_code;
 };


