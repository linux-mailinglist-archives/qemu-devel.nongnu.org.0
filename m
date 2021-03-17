Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B96B833EA80
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 08:26:30 +0100 (CET)
Received: from localhost ([::1]:37572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMQZZ-0000Bd-OC
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 03:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQVs-00040k-Oe
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:22:40 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:37085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQVr-00080o-2W
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:22:40 -0400
Received: by mail-ej1-x635.google.com with SMTP id bm21so932253ejb.4
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 00:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ni0Dyqm715Q2j3M0if5MLO5cU8ZgOph+rmN9Yhbc+iM=;
 b=pwaG5Vb09w3p/a7dC4xADrDJqsRiouLACkBVOKwLfGF3zyDxM7+EYEPWmxHQzhW30h
 Zjn44hKsRPgKsAabfyRpfdV1NODS9SFW8ittDCIwA4Id0vCSjGsiM955SNpGjqdP9aIG
 aMcgTzMToGkYICLuonPsx1hcHk9mo7K5P6it+rsND34HLC5hBoKJIa3j0jC6m7VaAYva
 rN3HnCx1OmxS3OP7b46sCNB4wIM/yh1lLzJW4ZCyrF38kJ0uUNxv4QF54Yxmmr40SbPx
 RLSmP4YqqpJgSYX+hHGVthFYfBYixvq08BhAspUmTpvaed1uBpK5KUAFj6FUpa3ND76D
 43XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ni0Dyqm715Q2j3M0if5MLO5cU8ZgOph+rmN9Yhbc+iM=;
 b=QLbH6s0oPvP9WHOizxY0LMtOTcBh9NXIlTxZBuXYC2R9+k4g2ycliQ20ySyTV28tb3
 JfK2vtvq3ceEajAewJEQi424SInTy1R6CSaKBaXB1/5O4+K75MTZJ7OPN8pin6JWQtrc
 2O4GTAlHFPepR8eWbtq/tiQ/3CtuVYNlmIhgfgUbxjh8C3GUfIBZ3pvJNyaSYOM8+W8a
 /zAn/QjXtSwuoh4csx1vXpv8PYgQgzUw41pCD1VbOpMolcZQtkvup6KkNfJFTcNGcUBB
 UoVn+ZQMrkcWozQmxkZI2DwtwCALcsG+7iP7oetJHUy1bhGldwf1OdHn2O4eUpQh2RIh
 7afA==
X-Gm-Message-State: AOAM531wDgI0chgZvMQqY8vxcDYeCpraaSR8AnBYCJgKCZOugNjJO5oP
 2LvGdUbY1DdukrGDDIbcJdOoRQ==
X-Google-Smtp-Source: ABdhPJw26j6TXQFkecawjYQWb89R8Mr7gp241uztJfYPPu9r2nPRyMwRWRP3gwIvTF379u3tBZ7AxA==
X-Received: by 2002:a17:906:68c5:: with SMTP id
 y5mr34197545ejr.371.1615965757737; 
 Wed, 17 Mar 2021 00:22:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s20sm10826891ejj.38.2021.03.17.00.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 00:22:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C9E511FF9C;
 Wed, 17 Mar 2021 07:22:17 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 13/15] plugins: getting qemu_plugin_get_hwaddr only expose
 one function prototype
Date: Wed, 17 Mar 2021 07:22:14 +0000
Message-Id: <20210317072216.16316-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317072216.16316-1-alex.bennee@linaro.org>
References: <20210317072216.16316-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yonggang Luo <luoyonggang@gmail.com>

This is used for counting how much function are export to qemu plugin.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20201013002806.1447-2-luoyonggang@gmail.com>
Message-Id: <20210312172821.31647-14-alex.bennee@linaro.org>

diff --git a/plugins/api.c b/plugins/api.c
index 3c7dc406e3..b22998cd7c 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -266,10 +266,12 @@ bool qemu_plugin_mem_is_store(qemu_plugin_meminfo_t info)
 
 #ifdef CONFIG_SOFTMMU
 static __thread struct qemu_plugin_hwaddr hwaddr_info;
+#endif
 
 struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
                                                   uint64_t vaddr)
 {
+#ifdef CONFIG_SOFTMMU
     CPUState *cpu = current_cpu;
     unsigned int mmu_idx = info >> TRACE_MEM_MMU_SHIFT;
     hwaddr_info.is_store = info & TRACE_MEM_ST;
@@ -281,14 +283,10 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
     }
 
     return &hwaddr_info;
-}
 #else
-struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
-                                                  uint64_t vaddr)
-{
     return NULL;
-}
 #endif
+}
 
 bool qemu_plugin_hwaddr_is_io(const struct qemu_plugin_hwaddr *haddr)
 {
-- 
2.20.1


