Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3230125DA3E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 15:45:17 +0200 (CEST)
Received: from localhost ([::1]:34174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEC1k-0003v8-91
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 09:45:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kEBwu-0004zS-NP
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 09:40:16 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kEBws-0005gh-47
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 09:40:16 -0400
Received: by mail-wr1-x429.google.com with SMTP id a17so6780730wrn.6
 for <qemu-devel@nongnu.org>; Fri, 04 Sep 2020 06:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5tQ4ZXGvdfdBTzlqZAhvWucrTP7Qmtc8hcYRkk0NrFQ=;
 b=n8Z9ul2wtO97Pg9kJ6tfUwtMZiWCH7NTHwxRPx2z2FLGkdYBhbYXXuIaGeu+GCmZSY
 bSgLX/ehJlL8KqaEx3+RUC39J3ZVZnIBRk28DbMyKHPCrKHweavj1YPX43RnS1EdQd2j
 wsUASGtqFsic+CvSPImFeywCPXYewdJG/z+q87pTxQsjcD/y73/joPMEduzDSV8mRVTW
 at1HVmRWtTcSzeXyv7rAclVbOrrkmqxLeBeyTTOaPKs+aUI0MnGic9odqjGim0XZ3JrG
 n/qYJFNDnNne2GeZ5M6OFd84qmb6aIdJVHcYAAyquM6EUU5UJ/5aGOOIp1OwzlGXq9PA
 w1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5tQ4ZXGvdfdBTzlqZAhvWucrTP7Qmtc8hcYRkk0NrFQ=;
 b=miUWWdzFbGK3BhHXBxiskMvnGmY4kO5vCtLCrnp967dM5HuTXsGy8jWq6TJLqTuTU7
 Z7+q3CysFwSNChrlK9hsvjGLaorcQoM8EHzgiaBcpV3RUidtAZ0aes83M9Q8hCXP8Sjs
 thCea7xHxdDPXeIJqi6H29PBGQyjXbu1y/hTz5lUBus7OOKbCgViMxqN116PDU0HjPO5
 I2RPEowo9a1VmSo3dZyvIkyip3Y+k/GDyVrN7FlIABJHQMATjEsViqyIFsAxcg04k5ar
 xYAMl4+bne5a/kNilHlCdPRYkoA5kDN56uTzJz+6mJfY+KwRbTNEEoLmsEvJGOLt+ZV4
 WbPw==
X-Gm-Message-State: AOAM532fMBV9r4QLaWRFBndU1olPBoOuXWB/m0dDo13YzRs9veY5VZ25
 vQi2kBjMRYmeCQaYMVq28072dQ==
X-Google-Smtp-Source: ABdhPJz9PYghRMSgIa4EODs7pyrusNg+TdqSpivUsE/C2zggQs+ZEPkn5Hl5qxUe3ZAEYYL3JrQnNQ==
X-Received: by 2002:adf:ff83:: with SMTP id j3mr7973000wrr.135.1599226812600; 
 Fri, 04 Sep 2020 06:40:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l126sm10845098wmf.39.2020.09.04.06.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 06:40:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EF9E71FF8C;
 Fri,  4 Sep 2020 14:40:07 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 2/4] plugins: add API to return a name for a IO device
Date: Fri,  4 Sep 2020 14:40:05 +0100
Message-Id: <20200904134007.4175-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200904134007.4175-1-alex.bennee@linaro.org>
References: <20200904134007.4175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: robert.foley@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 robhenry@microsoft.com, aaron@os.amperecomputing.com, cota@braap.org,
 kuhn.chenqun@huawei.com, peter.puhov@linaro.org,
 Clement Deschamps <clement.deschamps@greensocs.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This may well end up being anonymous but it should always be unique.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
[r-b provisional given change to g_intern_string]
Reviewed-by: Clement Deschamps <clement.deschamps@greensocs.com>
Reviewed-by: Emilio G. Cota <cota@braap.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Message-Id: <20200713200415.26214-11-alex.bennee@linaro.org>
---
 include/qemu/qemu-plugin.h |  6 ++++++
 plugins/api.c              | 20 ++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index bab8b0d4b3a..c98c18d6b05 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -335,6 +335,12 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
 bool qemu_plugin_hwaddr_is_io(const struct qemu_plugin_hwaddr *haddr);
 uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr);
 
+/*
+ * Returns a string representing the device. The string is valid for
+ * the lifetime of the plugin.
+ */
+const char *qemu_plugin_hwaddr_device_name(const struct qemu_plugin_hwaddr *h);
+
 typedef void
 (*qemu_plugin_vcpu_mem_cb_t)(unsigned int vcpu_index,
                              qemu_plugin_meminfo_t info, uint64_t vaddr,
diff --git a/plugins/api.c b/plugins/api.c
index bbdc5a4eb46..4304e63f0cf 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -303,6 +303,26 @@ uint64_t qemu_plugin_hwaddr_device_offset(const struct qemu_plugin_hwaddr *haddr
     return 0;
 }
 
+const char *qemu_plugin_hwaddr_device_name(const struct qemu_plugin_hwaddr *h)
+{
+#ifdef CONFIG_SOFTMMU
+    if (h && h->is_io) {
+        MemoryRegionSection *mrs = h->v.io.section;
+        if (!mrs->mr->name) {
+            unsigned long maddr = 0xffffffff & (uintptr_t) mrs->mr;
+            g_autofree char *temp = g_strdup_printf("anon%08lx", maddr);
+            return g_intern_string(temp);
+        } else {
+            return g_intern_string(mrs->mr->name);
+        }
+    } else {
+        return g_intern_string("RAM");
+    }
+#else
+    return g_intern_string("Invalid");
+#endif
+}
+
 /*
  * Queries to the number and potential maximum number of vCPUs there
  * will be. This helps the plugin dimension per-vcpu arrays.
-- 
2.20.1


