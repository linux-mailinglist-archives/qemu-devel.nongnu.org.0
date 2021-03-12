Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 891F8339667
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:27:25 +0100 (CET)
Received: from localhost ([::1]:40882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmVQ-0001ZW-G4
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:27:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlah-0004AU-SO
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:47 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:42860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlaS-0002D0-Ts
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:47 -0500
Received: by mail-ej1-x634.google.com with SMTP id c10so54731650ejx.9
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 09:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q9/ElEVS0uWbAzDSa5Cd31/3lKlIWsCn+W2Fat9oTvc=;
 b=oQGsSwc1fMZdP4qpV2hPiStXtl4iaHwRQ6/s20wNb8VojAghQSnMwn9aD5NzdzCgrI
 vRIylJHijPmo8nluMFE9aEXXd3aoQgxK6ajsQUh6b4BrhEConjc64w7jLocwClvBwcWb
 XKy2i6sx+pP7NqRE/6OOFTpH24J52ULvKhF9AxYOQOF5iUmmU64DRIW0HQc/yT0IzSwv
 KzFZkFPo4jkHlrF39dSK769Q614oJNCRJs2csxTF5GV1YBnf4rwOS9oqUfpkmqOnyaNt
 l3hPvvXtI4RrZa62SbjG27yY6WqPQDLFcXaEOoH3iXVVsPkqAA78kCWODAIS2pleTiDQ
 ppFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q9/ElEVS0uWbAzDSa5Cd31/3lKlIWsCn+W2Fat9oTvc=;
 b=bgZJgx9O85aAJRiaE8s2eDcl5KMXLO0Kip/CW/g/kq5GNcm4Mv0RpsGZ57aL8equ89
 FNAFengto86LdN3jvyc06Ds/pMp2vXc1o4Vydc3eljQ10KURQShKKmm01KEaQhSrnM1f
 nsJAYNVyLKVPeedirHOyO9wYIhrx9f255nMBFYhi/jnjB/Mz7yV77+Bx2gLARI4Uaw1l
 k8kZmKDjzkbtCaG6ak7EUydC4WhHpSb6KyKwz0efjSIE6k86CTvvjKDCdE/KmnN14GzC
 nRjw/O7BHMJ/2NL6+6E9eabm6ze+ZAmZgRgA6IobaoSf3E4t09x47pQzzz3N8SXSYlPK
 m+0Q==
X-Gm-Message-State: AOAM533IDI/cWS8I1hk70QOdPKj6ba59Xq80W2qANhbvu5KErXwjxT/r
 a+oAUu0KOjbbwYhQ07JRwoOV4A==
X-Google-Smtp-Source: ABdhPJyBDFJRreQhKO43KI7YiOOvMYPVHL/hU5ytYrE5aijkdrItgWkpefJuZ3IkBl11tpE/c9JJsA==
X-Received: by 2002:a17:906:c102:: with SMTP id
 do2mr9781486ejc.305.1615570111607; 
 Fri, 12 Mar 2021 09:28:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id ha5sm3135594ejb.39.2021.03.12.09.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 09:28:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5DD4D1FF93;
 Fri, 12 Mar 2021 17:28:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 07/14] plugins: expand the typedef kernel-docs for
 translation
Date: Fri, 12 Mar 2021 17:28:14 +0000
Message-Id: <20210312172821.31647-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312172821.31647-1-alex.bennee@linaro.org>
References: <20210312172821.31647-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/qemu-plugin.h | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 09b235f0b4..9ae3940d89 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -202,11 +202,9 @@ void qemu_plugin_register_vcpu_idle_cb(qemu_plugin_id_t id,
 void qemu_plugin_register_vcpu_resume_cb(qemu_plugin_id_t id,
                                          qemu_plugin_vcpu_simple_cb_t cb);
 
-/*
- * Opaque types that the plugin is given during the translation and
- * instrumentation phase.
- */
+/** struct qemu_plugin_tb - Opaque handle for a translation block */
 struct qemu_plugin_tb;
+/** struct qemu_plugin_insn - Opaque handle for a translated instruction */
 struct qemu_plugin_insn;
 
 enum qemu_plugin_cb_flags {
@@ -221,6 +219,14 @@ enum qemu_plugin_mem_rw {
     QEMU_PLUGIN_MEM_RW,
 };
 
+/**
+ * typedef qemu_plugin_vcpu_tb_trans_cb_t - translation callback
+ * @id: unique plugin id
+ * @tb: opaque handle used for querying and instrumenting a block.
+ */
+typedef void (*qemu_plugin_vcpu_tb_trans_cb_t)(qemu_plugin_id_t id,
+                                               struct qemu_plugin_tb *tb);
+
 /**
  * qemu_plugin_register_vcpu_tb_trans_cb() - register a translate cb
  * @id: plugin ID
@@ -233,9 +239,6 @@ enum qemu_plugin_mem_rw {
  * callbacks to be triggered when the block or individual instruction
  * executes.
  */
-typedef void (*qemu_plugin_vcpu_tb_trans_cb_t)(qemu_plugin_id_t id,
-                                               struct qemu_plugin_tb *tb);
-
 void qemu_plugin_register_vcpu_tb_trans_cb(qemu_plugin_id_t id,
                                            qemu_plugin_vcpu_tb_trans_cb_t cb);
 
-- 
2.20.1


