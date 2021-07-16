Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2EE3CB3BD
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 10:07:17 +0200 (CEST)
Received: from localhost ([::1]:47290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4IsO-0003fn-HC
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 04:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4IpP-0007AE-EX
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:04:11 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:33424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4IpN-0005Ip-PY
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:04:11 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso6573347wme.0
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 01:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JANcPX6qN4kluZ0AAfHgg+gmdeQLyrKh5r/cIUARSqU=;
 b=gUN5RibiyBj867rmFyWRnVv07wyqoflURxMuDP7mYGs0EiIblD2cV3vD7tuSJFInve
 HYmoWZbp8uAJo+UnslWo8lGn7FoLmNUdOxn4NxHYSI2DvvfZ/CNF5DmacAzcp/M6aZqS
 wlLhoJeMEEj27nZ6AEvwQaYAu58/bJdpqqOiHbTJ+5tSqeTImBpaLs0uf0rdQLOq+TTT
 SvEaYXM95fthDVw5K31y5OjXmnjVCyjbFcvEVY/stqAiA1QcraKu/FHEyGnzZFUFcHsv
 8GsvDgYh5HnOTakz+b65MKrqwHVzu0zB3ZXWJykECM57SOgkVF/9wUOHaA5cUEc7CGiC
 Y6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JANcPX6qN4kluZ0AAfHgg+gmdeQLyrKh5r/cIUARSqU=;
 b=c2W366Z1DPcx89L2D4pDN+Q7l5C1Qju46Q/rV0IytQMEjdi7IBx7stzyoDxG1oATeB
 HxQX1KoynfpWZZAWt9yX4+4Brzip7GhnvGbuekZRDMXE1DIo3lGoFfpO/lD4FKncPIUn
 7JBAjk24MMeGYOiSvlD3ucLZC13enVmCVdxSQkTIFf/V9N7iHU8KsNei2e/oP5YCppVv
 savafkoUf8Bcijdvsx8W+Pm1flbtEZxnJJ1rElIRcevnaJ4MqJQijLCIrvU6W6wBHBvp
 lwh9kcTsX602eg8sxDZZr/G5+fNxUX3mxIRzoR8HkD1A6g0GOHaGOjJ6GdIjlrGk0Nsf
 GO1g==
X-Gm-Message-State: AOAM532ZzzdfmNRaqRNap36NfWB9GgPcdePu4ElyVbC29LtfGjLafvIK
 SkqRZO6oJfu1sg/j1iolm+4hhHtSYndozg==
X-Google-Smtp-Source: ABdhPJxQ+VwpBzMkOHHBkG/dOfLfoPGz1DyOTwDz6/DyI7fZpevIIXUr/kZYNZfle04kPvx5Xt69xw==
X-Received: by 2002:a1c:f203:: with SMTP id s3mr14657064wmc.138.1626422648302; 
 Fri, 16 Jul 2021 01:04:08 -0700 (PDT)
Received: from localhost.localdomain ([41.34.125.69])
 by smtp.gmail.com with ESMTPSA id p12sm6558046wma.19.2021.07.16.01.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 01:04:07 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/9] plugins/api: added a boolean parsing plugin api
Date: Fri, 16 Jul 2021 10:03:38 +0200
Message-Id: <20210716080345.136784-3-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210716080345.136784-1-ma.mandourr@gmail.com>
References: <20210716080345.136784-1-ma.mandourr@gmail.com>
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


