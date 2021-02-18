Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B8931E826
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 10:55:28 +0100 (CET)
Received: from localhost ([::1]:50818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCg1v-00072P-FJ
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 04:55:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfu6-0006hq-CE
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:22 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfu2-0007Ck-2Z
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:22 -0500
Received: by mail-wr1-x42e.google.com with SMTP id v14so2182369wro.7
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 01:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pcSt1P/BVEiZ2RhZX9D0H6PtOh3Enb5UUvgBwhX22fo=;
 b=a48abLElBHl5CcnqcFCdCWSeaeNVp4LBQFGFIpc3zLyY3+kr++MuaWEacw3sauI+yy
 RnNn2kKRPcfLImn6Ov1/9jazMZ3itSKcBnk978mup79wl1fwXM8dy6gmQE8Xtm168V83
 L++iXZlcNXvuEbgs1j5lkcFcvYqp9mlQNu/Spxofa9PskSfuuCH8uJMLebgfSY3uZ9D7
 vMKYYZ9Rroig6NDoRFNfTJ0omHTGNoYtREOCYCcjPji7leN3oHNQvf97HTLHgoNkdCe8
 0InPWGxuWJIapKyEMQ78z2mn8wmFZrk/r9j3DbxHj2Ok9yhd3LTB095w6HKebH1JTK57
 DXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pcSt1P/BVEiZ2RhZX9D0H6PtOh3Enb5UUvgBwhX22fo=;
 b=op3iRvQ02DQu+bxiKs6WYg0Iz1r4Piutx9QMHt8ofj6EjomwT41JQPEofruHm8KYCp
 y9E94NJsPwuM0KkS+upnrkJNiutbqAIxz4KMCIAFULgHLarQvz6pN6Kt9RalQK0htZx7
 yziy+CZNB7GRF2gm3Uwx8yQgxALsc7qoHOd0dkrGO9W2E6FJGJ7UzHZ+dSo4i5ErViG8
 hm1mqIWvMhdA8jnHfqLkG+YDq7kkTU1PFtoAKSVQ+rK4Q7UjBu6uMWn8u6Qeh5iLa90/
 8w3a6KhtwFnHUZUl9cARTtCw2X8rdO1H5IWB3DlVzcIsJJx/7YHYXg/NJF0GJiRDPi3a
 Sj0g==
X-Gm-Message-State: AOAM531K9mL8woByh+ZwDiaC9rskz1mRgO8Vb5b+EKQDtjCybxursmW9
 qHrtEZt70+BwvH9eCxhGHy+0z4s8GdFgug==
X-Google-Smtp-Source: ABdhPJy3LBfV9A1QxpIM+XC7rthpUz+KZTZosaXWEseUJMMR6twxSwVRXES1mysJAz1DktGxEjsETA==
X-Received: by 2002:adf:fe0d:: with SMTP id n13mr3464492wrr.258.1613641633097; 
 Thu, 18 Feb 2021 01:47:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p9sm6160445wma.14.2021.02.18.01.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 01:47:07 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1B1051FF8C;
 Thu, 18 Feb 2021 09:47:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 02/23] plugins: add API to return a name for a IO device
Date: Thu, 18 Feb 2021 09:46:45 +0000
Message-Id: <20210218094706.23038-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210218094706.23038-1-alex.bennee@linaro.org>
References: <20210218094706.23038-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Clement Deschamps <clement.deschamps@greensocs.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This may well end up being anonymous but it should always be unique.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Clement Deschamps <clement.deschamps@greensocs.com>
Reviewed-by: Emilio G. Cota <cota@braap.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210213130325.14781-3-alex.bennee@linaro.org>

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 5775e82c4e..c66507fe8f 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -330,6 +330,12 @@ struct qemu_plugin_hwaddr *qemu_plugin_get_hwaddr(qemu_plugin_meminfo_t info,
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
index bbdc5a4eb4..5dc8e6f934 100644
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
+        return g_intern_static_string("RAM");
+    }
+#else
+    return g_intern_static_string("Invalid");
+#endif
+}
+
 /*
  * Queries to the number and potential maximum number of vCPUs there
  * will be. This helps the plugin dimension per-vcpu arrays.
-- 
2.20.1


