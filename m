Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBDC3396A9
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:34:05 +0100 (CET)
Received: from localhost ([::1]:60166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmbs-00030A-C6
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:34:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlah-00049e-H7
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:47 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:35419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlaV-0002DA-D8
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:47 -0500
Received: by mail-ej1-x62b.google.com with SMTP id dx17so54855240ejb.2
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 09:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/pMpGpLT9W1qrJCRw98saFflQK12KM24W0ofyXVsY7Q=;
 b=OGkDWIiDe+j+SqQDaj4KVbLJ4PneKy9xx9z91VNkZLRkCkxoZUns2FP3ULhJ72sxWp
 7oAejT8Q8PNStBlgmuNsj2OMJDPlPRoIk7LoLAnNeOuMOKW0rlQiFHfhBduxx4FcF7y3
 HXx0V9r0I1KDTL6VSxmRakrK192NPTeRLViwscJDOm7bEnGYELANHZNCSTX4XG3lcxt5
 BgzxMBUmuHEIl7EohqVqAR/vVU0hcfLaqj0uq5rsoUKV0iRYTDmBtxKl1zI+nFhS4dkF
 UFKT2cZcYf0iEC3KyrMU8i3HJKJuEkCmA7Ldhld5QAyAZZQ5GjCpZWai4SMkPKITq2lf
 Xp1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/pMpGpLT9W1qrJCRw98saFflQK12KM24W0ofyXVsY7Q=;
 b=Bif2NNU8PwXOqr443EYQxF0NHshiCoRwuyy7Hd7TdubzXZnLIixWiz20wOfywbOHFS
 zM1Ds0EHe3d7roKpOwAM3QBKUxXjzeW8G+w5j8pYRay3oUZloPUELayF7Xd2RzJUCSK0
 bjraeTjltF5iAn1CRIUxNSRd3d71RgqxhlamNiKnFQNYIKGmZInFKQkAa46/u/C9nT5f
 6pmqX3BZwavIIAxsBoKwGis+rW/9vqN6F0kQq2ArvTJv8dyXVfAUeUDJ1MbSERcmLtaW
 1blWGe/0rlRmX+Ps/Vbe0uSKFyl//D5iFK0syhrcaYnWqQi9wGRXvk51qEa8JipdqraJ
 u+KA==
X-Gm-Message-State: AOAM533A+j0t7yLpwFucBDEt82E9aPdB8OTnXO7CvM76N3qNueOOfphu
 cJSmuxjW5yy7HpIWTJB43vNw4A==
X-Google-Smtp-Source: ABdhPJwlYdKlGIsCXupDQw1wKydOs+ZCfXmH3NFhfM/Y75OFfcfHiPHUsP+t4c0UlRJfICXVl1qdnA==
X-Received: by 2002:a17:906:7102:: with SMTP id
 x2mr9842502ejj.355.1615570114031; 
 Fri, 12 Mar 2021 09:28:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id fw3sm3055570ejb.82.2021.03.12.09.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 09:28:28 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A00E31FF99;
 Fri, 12 Mar 2021 17:28:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 10/14] plugins: expand inline exec kernel-doc documentation.
Date: Fri, 12 Mar 2021 17:28:17 +0000
Message-Id: <20210312172821.31647-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312172821.31647-1-alex.bennee@linaro.org>
References: <20210312172821.31647-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
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

Remove the extraneous @cb parameter and document the non-atomic nature
of the INLINE_ADD_U64 operation.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/qemu/qemu-plugin.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 5ac6fe5f02..dc05fc1932 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -269,6 +269,14 @@ void qemu_plugin_register_vcpu_tb_exec_cb(struct qemu_plugin_tb *tb,
                                           enum qemu_plugin_cb_flags flags,
                                           void *userdata);
 
+/**
+ * enum qemu_plugin_op - describes an inline op
+ *
+ * @QEMU_PLUGIN_INLINE_ADD_U64: add an immediate value uint64_t
+ *
+ * Note: currently only a single inline op is supported.
+ */
+
 enum qemu_plugin_op {
     QEMU_PLUGIN_INLINE_ADD_U64,
 };
@@ -283,6 +291,9 @@ enum qemu_plugin_op {
  * Insert an inline op to every time a translated unit executes.
  * Useful if you just want to increment a single counter somewhere in
  * memory.
+ *
+ * Note: ops are not atomic so in multi-threaded/multi-smp situations
+ * you will get inexact results.
  */
 void qemu_plugin_register_vcpu_tb_exec_inline(struct qemu_plugin_tb *tb,
                                               enum qemu_plugin_op op,
@@ -305,7 +316,6 @@ void qemu_plugin_register_vcpu_insn_exec_cb(struct qemu_plugin_insn *insn,
 /**
  * qemu_plugin_register_vcpu_insn_exec_inline() - insn execution inline op
  * @insn: the opaque qemu_plugin_insn handle for an instruction
- * @cb: callback function
  * @op: the type of qemu_plugin_op (e.g. ADD_U64)
  * @ptr: the target memory location for the op
  * @imm: the op data (e.g. 1)
-- 
2.20.1


