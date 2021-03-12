Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F8A3396CB
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:42:39 +0100 (CET)
Received: from localhost ([::1]:49196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmkA-000485-2k
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:42:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlam-0004LJ-57
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:52 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:41595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlaX-0002DV-TJ
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:51 -0500
Received: by mail-ed1-x52d.google.com with SMTP id z1so9066516edb.8
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 09:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D25/pl4BFCseo4QTY1mxuXFeITzdlqswyd6ddGYq3qQ=;
 b=Bshb7rtn95O/oN+mT2xU7Lv1ZxHBd1ouOhS/ffBzYqM0jdyJ/8GjmnwoTFYlZrpYwn
 fhS2eI7YDzy7Rzbi1wMLb2WOriiMdHV/3qb/A6qg19Gj52LX5SGrCRYCeow6xuhznrpi
 JqV58bcQ7wsY8NJe9geFsEMdGfOzYZhJi14pu6QF+0yJAf7IjUAF+rXo2Zzxel70Xo7v
 Z1yFsfVfc2vaDZTRgEYk4RF1Rx9k/mE+DHxW2+quFpm5wQOe+hFyQQJyHSydcZjeWf35
 +40PmiDr3pVunt1VXIYZOqanV/YggpApxWwQsu7ANYl/R1UNsA2+yn9BSR5WfF78gZwq
 gj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D25/pl4BFCseo4QTY1mxuXFeITzdlqswyd6ddGYq3qQ=;
 b=qchaDBWbc+Uns1Rd642PBkhWNSQlm9bTtRA36zhhz07zCHiaN0M5xsz6NmxFLZBg4N
 VJhoMf/1dT3WoBQs8nXkca6I8XMkgDH8srwjmSnehXSTzRsyY+mpOkLCH1YYSN2Vs/Rb
 KgFwOxMYyPD77+nruXW9pcfyyBRCnO4uwPILYHWPmicNLT2oTx0BQuUHeP/IbC/PFuqF
 Xi0NPINBrOzVmF0FSEShGgNstLsUwmdd3oDUOdk1Lwp4l0a1BcWasxGwkTpp3v8GS3my
 wlG36+3Y8IKEN2Ne/kN/5rYbCjLzsi8RtN9IB/dPg366pXb3fNiv3Iyd8tqDKdKmctgL
 L89w==
X-Gm-Message-State: AOAM530MQZAv1otCewLebAjiz3SY0PTxBcr+G+j4l1DwqbzmkVnw0OH/
 axTDRxiC5FUDLE6mSA3e9dumyg==
X-Google-Smtp-Source: ABdhPJxmMwpKxGJEbnzdUb4aTbTY4bxj1NAFSx7I3nNDjcpVQjoJsc2AG9FMs7LB8UdtdJOG8XYt5Q==
X-Received: by 2002:aa7:db0c:: with SMTP id t12mr15181022eds.34.1615570116571; 
 Fri, 12 Mar 2021 09:28:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r17sm3274316edt.70.2021.03.12.09.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 09:28:28 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B84C51FF9A;
 Fri, 12 Mar 2021 17:28:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 11/14] plugins: expand kernel-doc for instruction query and
 instrumentation
Date: Fri, 12 Mar 2021 17:28:18 +0000
Message-Id: <20210312172821.31647-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312172821.31647-1-alex.bennee@linaro.org>
References: <20210312172821.31647-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52d.google.com
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
 include/qemu/qemu-plugin.h | 52 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index dc05fc1932..d4adce730a 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -327,21 +327,69 @@ void qemu_plugin_register_vcpu_insn_exec_inline(struct qemu_plugin_insn *insn,
                                                 enum qemu_plugin_op op,
                                                 void *ptr, uint64_t imm);
 
-/*
- * Helpers to query information about the instructions in a block
+/**
+ * qemu_plugin_tb_n_insns() - query helper for number of insns in TB
+ * @tb: opaque handle to TB passed to callback
+ *
+ * Returns: number of instructions in this block
  */
 size_t qemu_plugin_tb_n_insns(const struct qemu_plugin_tb *tb);
 
+/**
+ * qemu_plugin_tb_vaddr() - query helper for vaddr of TB start
+ * @tb: opaque handle to TB passed to callback
+ *
+ * Returns: virtual address of block start
+ */
 uint64_t qemu_plugin_tb_vaddr(const struct qemu_plugin_tb *tb);
 
+/**
+ * qemu_plugin_tb_get_insn() - retrieve handle for instruction
+ * @tb: opaque handle to TB passed to callback
+ * @idx: instruction number, 0 indexed
+ *
+ * The returned handle can be used in follow up helper queries as well
+ * as when instrumenting an instruction. It is only valid for the
+ * lifetime of the callback.
+ *
+ * Returns: opaque handle to instruction
+ */
 struct qemu_plugin_insn *
 qemu_plugin_tb_get_insn(const struct qemu_plugin_tb *tb, size_t idx);
 
+/**
+ * qemu_plugin_insn_data() - return ptr to instruction data
+ * @insn: opaque instruction handle from qemu_plugin_tb_get_insn()
+ *
+ * Note: data is only valid for duration of callback. See
+ * qemu_plugin_insn_size() to calculate size of stream.
+ *
+ * Returns: pointer to a stream of bytes
+ */
 const void *qemu_plugin_insn_data(const struct qemu_plugin_insn *insn);
 
+/**
+ * qemu_plugin_insn_size() - return size of instruction
+ * @insn: opaque instruction handle from qemu_plugin_tb_get_insn()
+ *
+ * Returns: size of instruction
+ */
 size_t qemu_plugin_insn_size(const struct qemu_plugin_insn *insn);
 
+/**
+ * qemu_plugin_insn_vaddr() - return vaddr of instruction
+ * @insn: opaque instruction handle from qemu_plugin_tb_get_insn()
+ *
+ * Returns: virtual address of instruction
+ */
 uint64_t qemu_plugin_insn_vaddr(const struct qemu_plugin_insn *insn);
+
+/**
+ * qemu_plugin_insn_haddr() - return vaddr of instruction
+ * @insn: opaque instruction handle from qemu_plugin_tb_get_insn()
+ *
+ * Returns: hardware (physical) address of instruction
+ */
 void *qemu_plugin_insn_haddr(const struct qemu_plugin_insn *insn);
 
 /*
-- 
2.20.1


