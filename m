Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 086373396BB
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:37:23 +0100 (CET)
Received: from localhost ([::1]:40620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmf3-0007Yr-Ux
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:37:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlak-0004Hm-MR
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:50 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:46841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlaQ-0002Cm-6t
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:50 -0500
Received: by mail-ed1-x533.google.com with SMTP id h10so9043654edt.13
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 09:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gxzdJY5GtdkEi5yLqsd1wrt/9eSlH3NwjXudTzLe0d8=;
 b=QCnMUO1d4RM9McroQ6nZRuJIkmEK80fVQGRb1rAnLSnee6ANXF/e7SjJaZ91p3Gm5B
 MZEcOhjIe/4HmVhAADoZyGI7MnTRe9fEiFEYeVQmWFaMqrWoM13+EMrAbEm4tGo3nYmE
 buthkhzJw7b/npo0XYGLchdo1/pu9P1ZRl28jNc+6QsD72FADH/dMdTTgF+4cMWH6mMh
 KFR07Y5qvJ+lPb0TTk4oU36HmD4ab/50MUufD7aH+Y/+90S8H/cBZTSRTsLvMC+1IuCH
 A06dL2ZWX7J1S7BeQz2dLJ7MtE9UufOR1FjLgziDZcRlAg3Q0Zh2duHVjdN05Ok+7+ro
 8zzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gxzdJY5GtdkEi5yLqsd1wrt/9eSlH3NwjXudTzLe0d8=;
 b=MEPTHS/npSu3tSSg4cVIaKrSHd1ewb6DirO4a3cs27LA7TGzW7iuoTkE3NVhPTXmeC
 7V3qABloniub08F62jMzfsBxeUyxboMQ7RV9WhbJGo6eLADazZSUCiNSdq3cYpXZYKic
 4HZzEN0UYKHv7MK6GmdiN+NMZF7Tj6RE4uh0hQ33g0IrlnmVY4+6c03qs7ChF4jbRmNQ
 TXxBYVrFN/NhjzKercagoQWy1IX0zFj1zDWxRm5DOOc3VlG9r9mLWoc7A6HrCVF3KzMe
 5b/BhabOLHV1IYTaAi9w9iSvWvmDk3wwYVBQnzpf+CbtaypMba5FfjVd/OAM4HSbLPvE
 a2jQ==
X-Gm-Message-State: AOAM531s9uloGUg3XuftvwUeSI2emPl31E43XjbJ1Z3PDQJ71o/nJdjN
 4u9Yux0KzoBcz9GFRTg+HY67XQ==
X-Google-Smtp-Source: ABdhPJz/5QAaJBccKOsOTsdbB7hzHpIzut/+GJl/WYZ/0PPNbdhjEE/pqTd0HJXckNvZ65o9q8kBAQ==
X-Received: by 2002:a05:6402:84b:: with SMTP id
 b11mr15270597edz.56.1615570108849; 
 Fri, 12 Mar 2021 09:28:28 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id kj3sm3103716ejc.117.2021.03.12.09.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 09:28:25 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1CDC31FF90;
 Fri, 12 Mar 2021 17:28:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 04/14] plugins: expand kernel-doc for qemu_info_t
Date: Fri, 12 Mar 2021 17:28:11 +0000
Message-Id: <20210312172821.31647-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312172821.31647-1-alex.bennee@linaro.org>
References: <20210312172821.31647-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x533.google.com
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

It seems kernel-doc struggles a bit with typedef structs but with
enough encouragement we can get something out of it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/qemu-plugin.h | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 3303dce862..4b84c6c293 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -49,22 +49,30 @@ extern QEMU_PLUGIN_EXPORT int qemu_plugin_version;
 
 #define QEMU_PLUGIN_VERSION 1
 
-typedef struct {
-    /* string describing architecture */
+/**
+ * struct qemu_info_t - system information for plugins
+ *
+ * This structure provides for some limited information about the
+ * system to allow the plugin to make decisions on how to proceed. For
+ * example it might only be suitable for running on some guest
+ * architectures or when under full system emulation.
+ */
+typedef struct qemu_info_t {
+    /** @target_name: string describing architecture */
     const char *target_name;
+    /** @version: minimum and current plugin API level */
     struct {
         int min;
         int cur;
     } version;
-    /* is this a full system emulation? */
+    /** @system_emulation: is this a full system emulation? */
     bool system_emulation;
     union {
-        /*
-         * smp_vcpus may change if vCPUs can be hot-plugged, max_vcpus
-         * is the system-wide limit.
-         */
+        /** @system: information relevant to system emulation */
         struct {
+            /** @system.smp_vcpus: initial number of vCPUs */
             int smp_vcpus;
+            /** @system.max_vcpus: maximum possible number of vCPUs */
             int max_vcpus;
         } system;
     };
-- 
2.20.1


