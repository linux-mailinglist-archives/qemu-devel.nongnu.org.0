Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BC733EA7E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 08:26:27 +0100 (CET)
Received: from localhost ([::1]:37492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMQZW-00009O-W7
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 03:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQVi-0003bh-Hf
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:22:30 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:43762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQVg-0007vZ-RM
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:22:30 -0400
Received: by mail-ed1-x536.google.com with SMTP id e7so964297edu.10
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 00:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WwdIc1nYUBWZsiYa6eZD17PeQKNBn/C2DU9VKz8Ljaw=;
 b=N18RdG9755grdkkzGNAk0y68rAsroFK588yDpenODp9Pd5COmfewhiXYVyB6TJCV8r
 c2oyd0V+XzzjBnDgsCJT6aUC00WxvY/WT7TFiSttpIF0LCEuiJ5YlJjGZNWUf/JAT9y5
 xT31jxRtaB8JrwywJ0+mLaXMJV0hXFYfcbXwcLlo3qqjT5gde6GfrzsI3sNp5Oh1SZmA
 M4v7dvaRb52QpHFtfqv3nBlJJjhpZzWaSxR9WLm3+nEePDygsHAbBUOXshQL4QpNVTnl
 WqgJrwE0hTp7EJhNKBfxzmA+dd67KLZ4qcIIBeOCzITTGsR4loSxkyJzySK8EfgdiT1o
 pUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WwdIc1nYUBWZsiYa6eZD17PeQKNBn/C2DU9VKz8Ljaw=;
 b=ojfmVaTKMSfwh1QwbbsssHz8TPpWFPoIz2dJzqw/imS7mpeg6leruCuMYKSZR0/QKC
 coDMeCl2sYekcZ08ew9LpxF8tTDEAWSd6GoK9QQ6KmAh2LoDOmNaRfuanl4GOFavXgiq
 xHL0E9et8rya3L39pVj0nX/S1ZayyW/N8jTMtOUYrdt3VAC6Wz2Y/o4DXtBxCXT1DwhV
 kkKaQ0l4MtAVWaLUxQmlYGirygbzZJ7WcJ7jHUNoOPRhfZ7sbrLvSrJ2BGre3ZNq4y/h
 Uv1UXG05gfq9I87pl1fLE5RVeSivui2EgnbXJcQUTbAg4QXGjFZdlXJGx3C/NVIIpfqi
 PiSA==
X-Gm-Message-State: AOAM5304fh12AjC3ZUtTDXBa5KriRuTAZ/0zI2e3HVuTXCBMxN/94FL4
 xC5Wkm1TOLpiUZUtRHyRPGHv2g==
X-Google-Smtp-Source: ABdhPJyISPsPvQc3hN+YCjZs7X/BF/IPUbKQFu+ZsLYBK8jsL7ann4FhWSXm6zTbT5eLl8N7iktdNg==
X-Received: by 2002:a50:ed83:: with SMTP id h3mr41597550edr.140.1615965747515; 
 Wed, 17 Mar 2021 00:22:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e16sm2977649ejc.63.2021.03.17.00.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 00:22:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5101C1FF93;
 Wed, 17 Mar 2021 07:22:17 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 07/15] plugins: expand the typedef kernel-docs for
 translation
Date: Wed, 17 Mar 2021 07:22:08 +0000
Message-Id: <20210317072216.16316-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317072216.16316-1-alex.bennee@linaro.org>
References: <20210317072216.16316-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210312172821.31647-8-alex.bennee@linaro.org>

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 09b235f0b4..529fe3e16b 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -103,14 +103,14 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
  * typedef qemu_plugin_simple_cb_t - simple callback
  * @id: the unique qemu_plugin_id_t
  *
- * This call-back passes no information aside from the unique @id.
+ * This callback passes no information aside from the unique @id.
  */
 typedef void (*qemu_plugin_simple_cb_t)(qemu_plugin_id_t id);
 
 /**
  * typedef qemu_plugin_udata_cb_t - callback with user data
  * @id: the unique qemu_plugin_id_t
- * @userdata: a pointer to some user data supplied when the call-back
+ * @userdata: a pointer to some user data supplied when the callback
  * was registered.
  */
 typedef void (*qemu_plugin_udata_cb_t)(qemu_plugin_id_t id, void *userdata);
@@ -126,7 +126,7 @@ typedef void (*qemu_plugin_vcpu_simple_cb_t)(qemu_plugin_id_t id,
 /**
  * typedef qemu_plugin_vcpu_udata_cb_t - vcpu callback
  * @vcpu_index: the current vcpu context
- * @userdata: a pointer to some user data supplied when the call-back
+ * @userdata: a pointer to some user data supplied when the callback
  * was registered.
  */
 typedef void (*qemu_plugin_vcpu_udata_cb_t)(unsigned int vcpu_index,
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


