Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B4D33EA70
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 08:23:44 +0100 (CET)
Received: from localhost ([::1]:57172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMQWt-0005Ar-UI
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 03:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQVe-0003W9-Qb
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:22:26 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:40136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQVd-0007tD-AB
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:22:26 -0400
Received: by mail-ej1-x62f.google.com with SMTP id ci14so912230ejc.7
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 00:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z/GsiICGeaT2/Why33IGYP3Vu7Bpn+W4JV5DMBIlNpM=;
 b=A4CeZukubX6Yq7d7NiYXfsDHyPgGgxjGn57BYQ1gwkX3XuN7FWHaFs9zbqgGGfv3ze
 AR4Tan3xrivTQkUCGUvo7SFzD0K636lozGfI3qUs19wKg7oif0ZemEppnuj1HG332FvC
 QNk+Nb9FIb379G+VN9D3C1kIkHZ3wHlD2LOhofDJIjHOzJ2+q5cDed4wqpQou5ohus6h
 yHnf02522hkOK45rMPF6XI8JILXvAHdltzw0cCxDv0KQl/rpzkTav/KM90udKIEJL2zb
 7MzdHB+kfmGihZ2CIl8kICG4TqArf9bsdwerhiPPgvegOPES818GHMp2oIynNgXkMSA4
 +8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z/GsiICGeaT2/Why33IGYP3Vu7Bpn+W4JV5DMBIlNpM=;
 b=Vua72NZGZieSZW6/90oM7mOkVOmfwjHE0UJQBZipiFGh9xzfAd6tmQFsZ4wNOvtJe/
 r1mE3CojncQgnV6blzvESw4CJC8Ku4uUGR5qbDZvqikKg/hDydJ0z2lFE/zd7tXDq6Li
 VsjHgN122A96OiFqR7mM+JIQdtgDzvu43NGrmOPa0ORlCZB1lXgyCjLABmj/usIuas/p
 ZmW8Dr8Q19hRU+G19IezwEZIwc7LU2d1uS8hWe2XHxXAcj7u+M1cvwsjIPyqYRr81LZ4
 vEuLMb5Kvvx3ewo2cslsw3GcTFuDzuh+Knn7RPA7D5yJoymZlm+b/zgbpSmxuwfI+rjr
 oaeQ==
X-Gm-Message-State: AOAM531mb44UueV31pX0WEuCMmCdTh2lmCCYZgw8rWKp6C++ZKIXwhCe
 flK7+i7RadyPAZfHOaL2P4fLRQ==
X-Google-Smtp-Source: ABdhPJxKw2wqGpRXe1fLvV/79Sl1uAED6JKjJzU/P927OAlQ/HHK1yWh6eQQNXPPwCr5bzHBz4sJdg==
X-Received: by 2002:a17:906:2dda:: with SMTP id
 h26mr33465820eji.163.1615965744072; 
 Wed, 17 Mar 2021 00:22:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id hd37sm10401176ejc.114.2021.03.17.00.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 00:22:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 128C51FF90;
 Wed, 17 Mar 2021 07:22:17 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 04/15] plugins: expand kernel-doc for qemu_info_t
Date: Wed, 17 Mar 2021 07:22:05 +0000
Message-Id: <20210317072216.16316-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317072216.16316-1-alex.bennee@linaro.org>
References: <20210317072216.16316-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
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

It seems kernel-doc struggles a bit with typedef structs but with
enough encouragement we can get something out of it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210312172821.31647-5-alex.bennee@linaro.org>

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 3303dce862..4b84c6c293 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -49,22 +49,30 @@ extern QEMU_PLUGIN_EXPORT int qemu_plugin_version;
 
 #define QEMU_PLUGIN_VERSION 1
 
-typedef struct {
-    /* string describing architecture */
+/**
+ * struct qemu_info_t - system information for plugins
+ *
+ * This structure provides for some limited information about the
+ * system to allow the plugin to make decisions on how to proceed. For
+ * example it might only be suitable for running on some guest
+ * architectures or when under full system emulation.
+ */
+typedef struct qemu_info_t {
+    /** @target_name: string describing architecture */
     const char *target_name;
+    /** @version: minimum and current plugin API level */
     struct {
         int min;
         int cur;
     } version;
-    /* is this a full system emulation? */
+    /** @system_emulation: is this a full system emulation? */
     bool system_emulation;
     union {
-        /*
-         * smp_vcpus may change if vCPUs can be hot-plugged, max_vcpus
-         * is the system-wide limit.
-         */
+        /** @system: information relevant to system emulation */
         struct {
+            /** @system.smp_vcpus: initial number of vCPUs */
             int smp_vcpus;
+            /** @system.max_vcpus: maximum possible number of vCPUs */
             int max_vcpus;
         } system;
     };
-- 
2.20.1


