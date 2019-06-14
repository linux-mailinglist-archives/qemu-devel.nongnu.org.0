Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3743746768
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 20:18:25 +0200 (CEST)
Received: from localhost ([::1]:54042 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbqmO-0000Cd-DT
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 14:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34006)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hbq0F-00075Z-Ba
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:28:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hbq0B-0003th-Tc
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:28:37 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:37209)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hbq0A-0003qE-Ik
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:28:35 -0400
Received: by mail-wr1-x443.google.com with SMTP id v14so3367951wrr.4
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 10:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/qvBNA83di35y4TZUh+6AvSJoV82skhcUTraghkKk3o=;
 b=wr8LBQY9J71aFkmJqUY1TG3Dnlkt6xg1FiMMSvZuK8QDfSCGxdMxcXQivlSxWae0v6
 1n9uaFelgawk2sK2+kldHcbs08eQOD9U8LyVh1ZaHRQb+jtqt6BvxXEGPyDBLKwQzTgo
 jaDWd0JsLBEqM+OnufpZ4MdiSKwrH8uHyyR2D4W0qKECGWjIoVQX7kQHqWuVUs2hmv9a
 vlz1Ua+cHLdu8Ci/l8ZoG/Qb+5iEu1G2x95aFUUiLUSMbBwnRQgEbV6V+zj4bu1bcEk4
 rca0Rw06GjSupOL8R9yHS7sNDwchVFEPKG6GiQkn2+rMRHU1ovsbBNbXLTKEOnF1MIjP
 e/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/qvBNA83di35y4TZUh+6AvSJoV82skhcUTraghkKk3o=;
 b=JXY6eIdfsmVWUFT6eCBeOVxiqLxLYQD0TzmdAfNcM/MdCIoHyjIBv1gnmMe6Cu1v5D
 +UpYcpoG9EZhakRG/0vJu+4vZ1XcsWgD00EgSEWcvbUdF7TVkGWi7qxvP0sihADkkOT4
 +1sUMvXyEhc75XKQK5Wv+ZAohSlnwrgOTzaBX9qZn109U0IBb36P87ygF9DxRydHWf74
 +VhDlbPhpCMc/6Q86aL7zTuaETSPBmSAfcMlv2RINlTcO9Vf9ySsOeCwo+uiSS/FeyQQ
 N5ynvzpghtCWgkaGr5VXCovHb1ZLrG2TMh2AXqBkwLdEcwRKab01G+O02UdapLbdLKfR
 MRwg==
X-Gm-Message-State: APjAAAVTuSESRVVX2JDJ5E85CnwkbgOWHWo+tyFILtgjKd1P/er0MX3p
 d94ylaJWqjDvjQloYzhHa5N7QQ==
X-Google-Smtp-Source: APXvYqywQjJoGsY3i0aGL8CTmgU6BHffN2Jap7gZz86sU/O0N8avlhA6ki7Z4nSBR3MYLaX4PzON7A==
X-Received: by 2002:a5d:4a0e:: with SMTP id m14mr18674602wrq.91.1560533313452; 
 Fri, 14 Jun 2019 10:28:33 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id v15sm3707043wrt.25.2019.06.14.10.28.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 10:28:30 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A9F851FFAC;
 Fri, 14 Jun 2019 18:12:02 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 14 Jun 2019 18:11:34 +0100
Message-Id: <20190614171200.21078-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614171200.21078-1-alex.bennee@linaro.org>
References: <20190614171200.21078-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PATCH  v3 24/50] plugin-gen: add plugin_insn_append
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Emilio G. Cota" <cota@braap.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

By adding it to plugin-gen's header file, we can export is as
an inline, since tcg.h is included in the header (we need tcg_ctx).

Signed-off-by: Emilio G. Cota <cota@braap.org>

---
v3
  - use g_byte_array
---
 accel/tcg/plugin-gen.c    | 10 +++++++++-
 include/exec/plugin-gen.h | 23 ++++++++++++++---------
 2 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 9d9ec29765..758fc5d099 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -60,9 +60,17 @@
 /*
  * plugin_cb_start TCG op args[]:
  * 0: enum plugin_gen_from
- * 1: enum plugin_gen_cb (defined below)
+ * 1: enum plugin_gen_cb
  * 2: set to 1 if it's a mem callback and it's a write, 0 otherwise.
  */
+enum plugin_gen_from {
+    PLUGIN_GEN_FROM_TB,
+    PLUGIN_GEN_FROM_INSN,
+    PLUGIN_GEN_FROM_MEM,
+    PLUGIN_GEN_AFTER_INSN,
+    PLUGIN_GEN_N_FROMS,
+};
+
 enum plugin_gen_cb {
     PLUGIN_GEN_CB_UDATA,
     PLUGIN_GEN_CB_INLINE,
diff --git a/include/exec/plugin-gen.h b/include/exec/plugin-gen.h
index 449ea16034..316638c736 100644
--- a/include/exec/plugin-gen.h
+++ b/include/exec/plugin-gen.h
@@ -15,15 +15,6 @@
 #include "qemu/plugin.h"
 #include "tcg/tcg.h"
 
-/* used by plugin_callback_start and plugin_callback_end TCG ops */
-enum plugin_gen_from {
-    PLUGIN_GEN_FROM_TB,
-    PLUGIN_GEN_FROM_INSN,
-    PLUGIN_GEN_FROM_MEM,
-    PLUGIN_GEN_AFTER_INSN,
-    PLUGIN_GEN_N_FROMS,
-};
-
 struct DisasContextBase;
 
 #ifdef CONFIG_PLUGIN
@@ -36,6 +27,17 @@ void plugin_gen_insn_end(void);
 void plugin_gen_disable_mem_helpers(void);
 void plugin_gen_empty_mem_callback(TCGv addr, uint8_t info);
 
+static inline void plugin_insn_append(const void *from, size_t size)
+{
+    struct qemu_plugin_insn *insn = tcg_ctx->plugin_insn;
+
+    if (insn == NULL) {
+        return;
+    }
+
+    insn->data = g_byte_array_append(insn->data, from, size);
+}
+
 #else /* !CONFIG_PLUGIN */
 
 static inline
@@ -60,6 +62,9 @@ static inline void plugin_gen_disable_mem_helpers(void)
 static inline void plugin_gen_empty_mem_callback(TCGv addr, uint8_t info)
 { }
 
+static inline void plugin_insn_append(const void *from, size_t size)
+{ }
+
 #endif /* CONFIG_PLUGIN */
 
 #endif /* QEMU_PLUGIN_GEN_H */
-- 
2.20.1


