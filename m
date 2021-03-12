Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 573C433963D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:23:57 +0100 (CET)
Received: from localhost ([::1]:56700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmS4-0004GD-Ao
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:23:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlaf-00045e-Uj
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:46 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:36884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlaP-0002Ce-2P
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:45 -0500
Received: by mail-ej1-x629.google.com with SMTP id bm21so54815132ejb.4
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 09:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X3N5gVRhyarUQz1NRBF4TPxPeA10Pzo0G2TS+ipcJTo=;
 b=EpKsXWwdTHxRJX4zFNRHSP2F709wUDbLQkqczRjz0A8PxnSvjK73QvCaaYQpwReWF0
 a7tQg/PVTLfG27aG65avnIuw+dWhyOnw6quB6q6fPaMqp2kaSYRLu49qszU6yKln621r
 r9tjZZO+WzysQoJtNLHY3ZYHOichRr05eZvko/SVyZx1cv1TqmMeI2epoK58nWj4VvtC
 kdulqHSOF1TMDnyZOXvDwSLr3XXDEC67jXMciAjM49pAG8Up9M7XNJlQQxL0Zmv6wSle
 yLBvKVoIIc/X+SrxvsONb8S2UOjAL2xjrQIukUeobDADf8YZK6rmzbQwk5JVqdZkkQl0
 ahDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X3N5gVRhyarUQz1NRBF4TPxPeA10Pzo0G2TS+ipcJTo=;
 b=qxfAwd67kNmrKG44UANFwtAX25MDBZ3vs/HhI3xo1nSJopit8qSW1ZIcFbYoivAmAr
 1zwuSbzL7iREgPOJrhf2AcXj291YBc38NKrtYfnfnFfWQ8vgcSlM+EBzK0kYhdJZ7VJ6
 A2YHu7HIoulA48xFJzNia85HtnxuXMhgC2q6QmB4GoXetY/cJkpO0KCyNC+9vWBJYtRM
 M++okki30NRjvUxg1YOfziw7yVNQfXDznS/05utvVx2PCsxmguOO1qtLW3l/7utLZaem
 wqiRsVTACMJRzJJmOg2Cr7M5puqg91Ej3fuHRCnQb7VB5Q+iI/PNMuYTjPX2SfkWE7o7
 pjNg==
X-Gm-Message-State: AOAM532b+s5VRj71/KL9iZ6KOskiPo8qGmJ3jCu7OiftigbGYfxrg4sa
 8wf1ZGckvfMr6Hl+Kea50VTXbA==
X-Google-Smtp-Source: ABdhPJyorgJmPkzH3Dgmrx3FwhVYaWyoPUVDdrksKmDes1OYZtTPA5BUCebJTDEOXuVknm7wJPEYwQ==
X-Received: by 2002:a17:906:1c98:: with SMTP id
 g24mr9787381ejh.51.1615570107818; 
 Fri, 12 Mar 2021 09:28:27 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j25sm3387101edy.9.2021.03.12.09.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 09:28:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 732A01FF96;
 Fri, 12 Mar 2021 17:28:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 08/14] plugins: add qemu_plugin_cb_flags to kernel-doc
Date: Fri, 12 Mar 2021 17:28:15 +0000
Message-Id: <20210312172821.31647-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312172821.31647-1-alex.bennee@linaro.org>
References: <20210312172821.31647-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x629.google.com
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

Also add a note to explain currently they are unused.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/qemu-plugin.h | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 9ae3940d89..c98866a637 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -207,10 +207,20 @@ struct qemu_plugin_tb;
 /** struct qemu_plugin_insn - Opaque handle for a translated instruction */
 struct qemu_plugin_insn;
 
+/**
+ * enum qemu_plugin_cb_flags - type of callback
+ *
+ * @QEMU_PLUGIN_CB_NO_REGS: callback does not access the CPU's regs
+ * @QEMU_PLUGIN_CB_R_REGS: callback reads the CPU's regs
+ * @QEMU_PLUGIN_CB_RW_REGS: callback reads and writes the CPU's regs
+ *
+ * Note: currently unused, plugins cannot read or change system
+ * register state.
+ */
 enum qemu_plugin_cb_flags {
-    QEMU_PLUGIN_CB_NO_REGS, /* callback does not access the CPU's regs */
-    QEMU_PLUGIN_CB_R_REGS,  /* callback reads the CPU's regs */
-    QEMU_PLUGIN_CB_RW_REGS, /* callback reads and writes the CPU's regs */
+    QEMU_PLUGIN_CB_NO_REGS,
+    QEMU_PLUGIN_CB_R_REGS,
+    QEMU_PLUGIN_CB_RW_REGS,
 };
 
 enum qemu_plugin_mem_rw {
-- 
2.20.1


