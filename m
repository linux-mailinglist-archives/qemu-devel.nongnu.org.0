Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCD533EA89
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 08:29:24 +0100 (CET)
Received: from localhost ([::1]:48360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMQcN-0004aa-TA
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 03:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQVf-0003XD-TX
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:22:27 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:40929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQVe-0007tQ-Bs
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:22:27 -0400
Received: by mail-ed1-x532.google.com with SMTP id b16so977426eds.7
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 00:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RWi98yBYxFr5e8I4Wn7WdxDUPeaj7H5bHss1HaZsEQE=;
 b=OnzRCfFhmmG9h0GYKqx2kuurRjBXeL9PlzpNeMxvaYp40gt5/NpZLMeuDVCilhhJ7Q
 nWO8uJAHMg8T70CS/Oa3ajof+E5LbpAI2MnpYeKR1uuFZegTnShkC4CPv8/IkVaQggJX
 9b+g+0mNACxk5D/0WpmXCP4uTrCFCiEnt1OYMNLDB7JdgQ7aBdx6kmoI44I58Cw1YS2S
 uF00zLJjV7kD97SoXX3ZMiKJDgWfSQSigwdJCik8lyOVfOFE7MtJnPcchmvu/FsKfkqa
 yZZbOTBFJHW/fhs++LJ/5wo69QFv1rYcG55rkfxjffElqmGyQ8jJZOUWJQq9fr0c0x4I
 aSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RWi98yBYxFr5e8I4Wn7WdxDUPeaj7H5bHss1HaZsEQE=;
 b=aVfTHK26nzJrWJl6vbLepLlqLeu9f1UrrSQwXu8VW+zlfWT15sAwRNfLzCg/qaoxBt
 uydjyiJexfeo08UBErUf3AjQbd2z+qqpsKDNRADtgBKcQB8YXeyeAiSgZRVsBcW4hV//
 fqSt0yAIkweb3/LkJRcHU38Va0oQEaBy32WJRSGpWxtz0kSpX/95Rkl5+9Os7lGixKVC
 kLbdcWk72ChKfgI8oelJc/gMAA0l/J7aosHLJbY75IrW/ev1sRIZFU7PnrDhDwJBlyOC
 TTr3cb/iDqDQOVa3r4m5pyzyLk32laRLJEfVicMMh6FCaenUGgf1haoKwgOp6GkDeE32
 iDdQ==
X-Gm-Message-State: AOAM531qdwE/WjeTOnTlCyifY2YJvjJcW2m0gjQjDFSBbnfqgYUjTCAn
 wBOgkl4mCe650te36R7NkqNVGg==
X-Google-Smtp-Source: ABdhPJxf1FjsWuDyea39uIBquZwtVXu6WuCgfZhy5EzxwEvAn0xhTxMYw1pD+clU0fLfMqtLJoL6Gg==
X-Received: by 2002:aa7:c550:: with SMTP id s16mr40404500edr.98.1615965745027; 
 Wed, 17 Mar 2021 00:22:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q26sm10743054eja.45.2021.03.17.00.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 00:22:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 658F51FF96;
 Wed, 17 Mar 2021 07:22:17 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 08/15] plugins: add qemu_plugin_cb_flags to kernel-doc
Date: Wed, 17 Mar 2021 07:22:09 +0000
Message-Id: <20210317072216.16316-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317072216.16316-1-alex.bennee@linaro.org>
References: <20210317072216.16316-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
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

Also add a note to explain currently they are unused.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210312172821.31647-9-alex.bennee@linaro.org>

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 529fe3e16b..e4d782b628 100644
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


