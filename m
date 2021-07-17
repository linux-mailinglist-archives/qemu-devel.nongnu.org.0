Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B433CC26D
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 12:14:22 +0200 (CEST)
Received: from localhost ([::1]:41192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4hKv-0007Zv-Bk
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 06:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4hH1-0007hR-PU
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:19 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4hGv-0007Rs-Kf
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:19 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso9662304wmh.4
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 03:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JANcPX6qN4kluZ0AAfHgg+gmdeQLyrKh5r/cIUARSqU=;
 b=MdnhDqzYfsbRjLozoI2ALbM0QFarYfBEBbxy/dcvBeEJQ9FcgoosF7vz3wAqmEm0FP
 AMXc4KDKxxqR3Q7BpyWgYxiffPKeRbm9vySgZB1ohmyJAk5YnL5DnZShgcF4RHj17p38
 fdcPph0GqmQ3/Q+nuuaEj6tDnayVd6ChBXsgPINmiruZnmJbsmfFCIRfhmCQY8By8JFh
 jcoEcud9Qevak7ChLnfX+2mJtO69arlAtwjUnzcRE7rs9Eo+G6riZ9fjeVMqcgs5aNuh
 jmcCLbUKe5c/hn9eqeGotDjdJQ8yiU48gETSxvcZVfuDCTLjH2zkYl3szuTi5qSqppW0
 HzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JANcPX6qN4kluZ0AAfHgg+gmdeQLyrKh5r/cIUARSqU=;
 b=Yh9X3hxL3ORa4bjUB5I+WpXWjrBWv1eoTquYtvUzweejuODuFQSWBx1Pd1jeTGU0P6
 rLHLEjWvhBE2sDt7NVk3cehoeS+cPMbb627p3fJ7WeM7rVPqyb1g4T2QLtxoK5iHZ3Z4
 HBy8+Y9gbcJ0wgd8bixGFxNL/+ETD08GSTI53CfUzap1MNQuHL3AiGceAkPGaocldYPk
 G4qyMSLXlDr9GqR7drFymeVu+Ni7lMoTeT4reUUEdNDnZES6g4Yoh2Ch4exkhkz7BYeZ
 ADxFVPs93P+liPLYLF13fwd6lassnxXqCTwyxQFFsgarfC1Muvuh2Krc7/uy+O9y6b4p
 vZhw==
X-Gm-Message-State: AOAM5301axQ/ZOeinjpuYejoNIbao/yrrjK/RRUPDVQAhstmNZiqhfyE
 FNNDE0XXkPDhwNSqoeJWgT3Aq8dEKOY=
X-Google-Smtp-Source: ABdhPJxda4B+L7ZlHjcRayXNMAe/CYT8qjzTODEDP1MTWjWn59/unF5XwPvNrMy+IDEAd0aSVNprqA==
X-Received: by 2002:a05:600c:5106:: with SMTP id
 o6mr21271152wms.18.1626516611580; 
 Sat, 17 Jul 2021 03:10:11 -0700 (PDT)
Received: from localhost.localdomain ([41.34.125.69])
 by smtp.gmail.com with ESMTPSA id 11sm13846923wmo.10.2021.07.17.03.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 03:10:11 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/13] plugins/api: added a boolean parsing plugin api
Date: Sat, 17 Jul 2021 12:09:09 +0200
Message-Id: <20210717100920.240793-3-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717100920.240793-1-ma.mandourr@gmail.com>
References: <20210717100920.240793-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x332.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This call will help boolean argument parsing since arguments are now
passed to plugins as a name and value.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 include/qemu/qemu-plugin.h | 13 +++++++++++++
 plugins/api.c              |  5 +++++
 2 files changed, 18 insertions(+)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index dc3496f36c..7d0b23c659 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -564,4 +564,17 @@ int qemu_plugin_n_max_vcpus(void);
  */
 void qemu_plugin_outs(const char *string);
 
+/**
+ * qemu_plugin_bool_parse() - parses a boolean argument in the form of
+ * "<argname>=[on|yes|true|off|no|false]"
+ *
+ * @name: argument name, the part before the equals sign
+ * @val: argument value, what's after the equals sign
+ * @ret: output return value
+ *
+ * returns true if the combination @name=@val parses correctly to a boolean
+ * argument, and false otherwise
+ */
+bool qemu_plugin_bool_parse(const char *name, const char *val, bool *ret);
+
 #endif /* QEMU_PLUGIN_API_H */
diff --git a/plugins/api.c b/plugins/api.c
index 332e2c60e2..43e239f377 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -383,3 +383,8 @@ void qemu_plugin_outs(const char *string)
 {
     qemu_log_mask(CPU_LOG_PLUGIN, "%s", string);
 }
+
+bool qemu_plugin_bool_parse(const char *name, const char *value, bool *ret)
+{
+    return qapi_bool_parse(name, value, ret, NULL);
+}
-- 
2.25.1


