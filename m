Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 853CA33EA84
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 08:27:40 +0100 (CET)
Received: from localhost ([::1]:44358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMQah-0002z4-Iw
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 03:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQVo-0003pk-Cx
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:22:36 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:39011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQVm-0007ye-Kt
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:22:36 -0400
Received: by mail-ej1-x62a.google.com with SMTP id p7so925350eju.6
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 00:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R7lizkJGrEEFe1N4Cl40O7ejnX+xPKrdbbOuYdIm6D8=;
 b=lDnaYUdHTckIdUm09Ly+CVcaUZPb8AeaLbbcVN0FrExOZn45nJpXcYxZC9S4IcVoQW
 agr1/0jDkul7SSJonFCx50L8ITLvvfil/aq3V5qbtL75QdMwPiC+eOyCJXokhIGpM12A
 ww2/nHIr1REeaWMhmij5+Z2vewc0FNnn6ta/aL1LtFjbqVAqrQ1anvvNLutTxv3eNSpC
 zS7qjJE7bPzkq6Llz/U0B0QtCX2G9cOaCqzvxEFGwjO9VfkcBfahP3neOYSwSlzqQj/E
 boVIp2cdwa0zMcbhe0zbgBaffjiGx3lK/7UeCDncEaXRlGqFjojDJ/gI4/SV537byH/p
 /Q2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R7lizkJGrEEFe1N4Cl40O7ejnX+xPKrdbbOuYdIm6D8=;
 b=KHPMlA7+cJnEvwwUTWgUjdj70MvqNMxO5Z4eX8kbGkdp3iGTTSobcWeg6RM7GIRWoF
 1DrGf/wZiF6nfOqIZ/T96Ud8WYs8vNH80oSwWn53iTYOnJoe034lXSZTj/tFwe/qgZR8
 JxTa+OZIKAKDWT7KSvYd+Eh52Xe6J0eRIj5F/Mdcpjtv+2izJTIlObq30w0PfmazvAl3
 4PC8jakez+icxocdBKpNEy2ziNA3R+sU6OQRWmMxoE3snRoOSGCQwW6up7EAgazM7tng
 0pmR/lpqeTUs5Mk1Bo+N6F3URxx9QYiARotRuU+lA1uDCDFdY4kAsPzU3t4m3hAd3/CW
 qBfA==
X-Gm-Message-State: AOAM530zrlF+0xeNrYKjMwHnymNntRP06c5fGYCNQ/+g4BvsQ9wUheqZ
 Pg0uDfp1/8kukSpzYDquRr+oyQ==
X-Google-Smtp-Source: ABdhPJyFTsGpL4sjt9jUEkuwv+FkqQl+ER1qxTF/io/UtWJNF7UJcLBOudCQSs/09qFCfdbjqQhDQw==
X-Received: by 2002:a17:906:4410:: with SMTP id
 x16mr34070802ejo.446.1615965753355; 
 Wed, 17 Mar 2021 00:22:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s11sm11792072edt.27.2021.03.17.00.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 00:22:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B53A11FF9B;
 Wed, 17 Mar 2021 07:22:17 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 12/15] plugins: expand kernel-doc for memory query and
 instrumentation
Date: Wed, 17 Mar 2021 07:22:13 +0000
Message-Id: <20210317072216.16316-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317072216.16316-1-alex.bennee@linaro.org>
References: <20210317072216.16316-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
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
Message-Id: <20210312172821.31647-13-alex.bennee@linaro.org>

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index ad9dc4b69d..9e67ab1aa2 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -393,24 +393,48 @@ uint64_t qemu_plugin_insn_vaddr(const struct qemu_plugin_insn *insn);
  */
 void *qemu_plugin_insn_haddr(const struct qemu_plugin_insn *insn);
 
-/*
- * Memory Instrumentation
+/**
+ * typedef qemu_plugin_meminfo_t - opaque memory transaction handle
  *
- * The anonymous qemu_plugin_meminfo_t and qemu_plugin_hwaddr types
- * can be used in queries to QEMU to get more information about a
- * given memory access.
+ * This can be further queried using the qemu_plugin_mem_* query
+ * functions.
  */
 typedef uint32_t qemu_plugin_meminfo_t;
+/** struct qemu_plugin_hwaddr - opaque hw address handle */
 struct qemu_plugin_hwaddr;
 
-/* meminfo queries */
+/**
+ * qemu_plugin_mem_size_shift() - get size of access
+ * @info: opaque memory transaction handle
+ *
+ * Returns: size of access in ^2 (0=byte, 1=16bit, 2=32bit etc...)
+ */
 unsigned int qemu_plugin_mem_size_shift(qemu_plugin_meminfo_t info);
+/**
+ * qemu_plugin_mem_is_sign_extended() - was the access sign extended
+ * @info: opaque memory transaction handle
+ *
+ * Returns: true if it was, otherwise false
+ */
 bool qemu_plugin_mem_is_sign_extended(qemu_plugin_meminfo_t info);
+/**
+ * qemu_plugin_mem_is_big_endian() - was the access big endian
+ * @info: opaque memory transaction handle
+ *
+ * Returns: true if it was, otherwise false
+ */
 bool qemu_plugin_mem_is_big_endian(qemu_plugin_meminfo_t info);
+/**
+ * qemu_plugin_mem_is_store() - was the access a store
+ * @info: opaque memory transaction handle
+ *
+ * Returns: true if it was, otherwise false
+ */
 bool qemu_plugin_mem_is_store(qemu_plugin_meminfo_t info);
 
 /**
  * qemu_plugin_get_hwaddr() - return handle for memory operation
+ * @info: opaque memory info structure
  * @vaddr: the virtual address of the memory operation
  *
  * For system emulation returns a qemu_plugin_hwaddr handle to query
-- 
2.20.1


