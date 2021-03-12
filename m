Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F20E33967C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:29:12 +0100 (CET)
Received: from localhost ([::1]:45628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmX9-0003Zo-7b
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:29:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlan-0004NY-0j
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:53 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:36050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKlaa-0002F1-7b
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:28:52 -0500
Received: by mail-ej1-x629.google.com with SMTP id e19so54916422ejt.3
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 09:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rQlXVzvhTGn5oQRAxN3PtvRgZpaSyD2V/Kc/eZauuUk=;
 b=I3ZTiDXdf9gf0/tsKPfA8sySqIxY/H25ASyNxiLPGyxYehT4n5naIkqCBdHymfSYn5
 pmCb9pcRTXMh0UXfBbHm7UCNikcF6NGrefjG0p/uByeiLHJqjJl+KcUAdxgb7mCGTa+W
 yHa42M2mXzYjKGd7o1mUGyyh2puVwr23ETeHVXydDVpmcyzJKD+RbvPojjxtgQotDu2y
 cxVtUwDPlCqr+DZATWMSwE42stXJ80WD4CXAkJHV4qZzUNUAOn68IM0oo7LdybPDr56m
 9iDvSC0qQMRlerJcd0faqQpD6jkpGjCPE5FZ5sS+F9pUBrkcCP/ws8Qx8TRI6BPcw1jc
 ubKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rQlXVzvhTGn5oQRAxN3PtvRgZpaSyD2V/Kc/eZauuUk=;
 b=JWh030yb07eSyveR0llQ+b/sN5FNGiFj6Ktu/7WGISngQqapNRfTYpikQfYxam3X3i
 77ByK6MyqsZS7+Z3abJdrhEK964wj+B7J+g5+1Ftg1jYuUVfO6Xqk6/mQA4wgdEiDh2r
 0aJFFiuAC5yV7GO4MIR+rzme71zQckbxO0Afj9Hh9bMz50Aq5qwg4CyXcTdye2WHYmGF
 B/v0lajgqZrqLaXxa65Zybtb2cFe3No+thkonaXDnPMsxNtOBDTBt4KUNJ0yz8Wq/xwp
 8SPSjHCtw8uOcSc3b0kkRFcgxfUKJXGCoJc/f/Ill03lJWAEKWFOglaLc/NndBMvpUEZ
 phFg==
X-Gm-Message-State: AOAM531SbsE9aETYuMPNlrrpwKpxgx8Zh0bgTXJwonoYbBVox84xpr6K
 JbxvZ1acI/vxsTm9ivR6/gLGymI5XgyLXQ==
X-Google-Smtp-Source: ABdhPJxO9acPOaagelidzELS+cHxP2oqeBG/jNDyxVo/Ch4SpNkp0aS4ZVd0FqfT2odn6joex/FkgA==
X-Received: by 2002:a17:906:8147:: with SMTP id
 z7mr9291380ejw.436.1615570118876; 
 Fri, 12 Mar 2021 09:28:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id sb4sm3038732ejb.71.2021.03.12.09.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 09:28:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E28701FF9C;
 Fri, 12 Mar 2021 17:28:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 13/14] plugins: getting qemu_plugin_get_hwaddr only expose
 one function prototype
Date: Fri, 12 Mar 2021 17:28:20 +0000
Message-Id: <20210312172821.31647-14-alex.bennee@linaro.org>
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
Cc: Yonggang Luo <luoyonggang@gmail.com>, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yonggang Luo <luoyonggang@gmail.com>

This is used for counting how much function are export to qemu plugin.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20201013002806.1447-2-luoyonggang@gmail.com>
---
 plugins/api.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

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


