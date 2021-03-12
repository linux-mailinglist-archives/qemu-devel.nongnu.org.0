Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2598339681
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:29:51 +0100 (CET)
Received: from localhost ([::1]:49452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmXm-0005zH-TO
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:29:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlai-0004Cn-QD
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:48 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:39756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlaT-0002D3-IT
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:48 -0500
Received: by mail-ed1-x533.google.com with SMTP id bf3so9046458edb.6
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 09:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YVUJJy2xlHw8BI+XuObyfKh7efsezZH+aMO25WODlwg=;
 b=QvFntIfZ1XxtI9NoPD4fAdJI7JPE7rk/U1ZXxHuDm9qIz5I9wr90J/HVH3qhijv7+Y
 sVUIHHk5+LMaZi2OFtOLZB3nMaJhLvDFIvzL41nlXxq11gvimX9l/NLXVjaAK45H1dEe
 tQc5Etj7koz6qptEO2gR/LhpPElG7bpI+IrEYtAEWEZyizi2y/Mn6N1ZPF9F05jgdzqB
 eydjlDMCUFaE4VWEHdnQms5QY7uFABGu6U3MtrmrOBQR8ueLWDMfuJbRxnuaShYFVAjB
 eTe/3izquMbq8XSz00lQNAum3xcGwcVXUVIjRHgoLxisCI/vyr1CQR6f7yXU8ilYilqh
 nskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YVUJJy2xlHw8BI+XuObyfKh7efsezZH+aMO25WODlwg=;
 b=YP+AvobBO12lSB3ShQrVMVRL8MV9XXxdQXshPtdXDwJs1wQCCJV6PVBrmkUyX4y7uY
 FBAaU+9QJHUDvd8D8TT7HJMmRQVVAu+6PZCBi4qLK3mW74U1JFfNrs5j57ZbzTCms9f9
 KQG7XZIqgcDMWPQQgiXmj/6RE5hLcW7RicN3dLw+0EG/PUB6t4PxbarsCh56Zan4fT1l
 ht0fdQPrXZtnczp3b1uoF+VkiuIET+Rt7Z/Xgk1zHTVSYLMYy+37de3oj0ID+i40LYmv
 aNuGT6GY+DGXGAJmkCiUdoKy2tIgUaA5n5Gpa0oF8cokg7OGMdC9PgaX4j4/A8lRrOgd
 qLRw==
X-Gm-Message-State: AOAM531fT0NDxJ2py7/wsjZtbRIIIppphUttTNUtHiDcwtnXF4DD22vh
 UPD1Y8ahwhhemvneZOxlTEHwkg==
X-Google-Smtp-Source: ABdhPJyitOvvr4P4unZYTw0KbwRbeqRXPqM0GIFHXScw5czfOlIrCkH40bayyH8aMSe91SDMI/XbiQ==
X-Received: by 2002:a05:6402:5189:: with SMTP id
 q9mr15320645edd.168.1615570112273; 
 Fri, 12 Mar 2021 09:28:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r17sm3274241edt.70.2021.03.12.09.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 09:28:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 478811FF92;
 Fri, 12 Mar 2021 17:28:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 06/14] plugins: expand the callback typedef kernel-docs
Date: Fri, 12 Mar 2021 17:28:13 +0000
Message-Id: <20210312172821.31647-7-alex.bennee@linaro.org>
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/qemu-plugin.h | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index ac1bb318da..09b235f0b4 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -99,17 +99,36 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                                            const qemu_info_t *info,
                                            int argc, char **argv);
 
-/*
- * Prototypes for the various callback styles we will be registering
- * in the following functions.
+/**
+ * typedef qemu_plugin_simple_cb_t - simple callback
+ * @id: the unique qemu_plugin_id_t
+ *
+ * This call-back passes no information aside from the unique @id.
  */
 typedef void (*qemu_plugin_simple_cb_t)(qemu_plugin_id_t id);
 
+/**
+ * typedef qemu_plugin_udata_cb_t - callback with user data
+ * @id: the unique qemu_plugin_id_t
+ * @userdata: a pointer to some user data supplied when the call-back
+ * was registered.
+ */
 typedef void (*qemu_plugin_udata_cb_t)(qemu_plugin_id_t id, void *userdata);
 
+/**
+ * typedef qemu_plugin_vcpu_simple_cb_t - vcpu callback
+ * @id: the unique qemu_plugin_id_t
+ * @vcpu_index: the current vcpu context
+ */
 typedef void (*qemu_plugin_vcpu_simple_cb_t)(qemu_plugin_id_t id,
                                              unsigned int vcpu_index);
 
+/**
+ * typedef qemu_plugin_vcpu_udata_cb_t - vcpu callback
+ * @vcpu_index: the current vcpu context
+ * @userdata: a pointer to some user data supplied when the call-back
+ * was registered.
+ */
 typedef void (*qemu_plugin_vcpu_udata_cb_t)(unsigned int vcpu_index,
                                             void *userdata);
 
-- 
2.20.1


