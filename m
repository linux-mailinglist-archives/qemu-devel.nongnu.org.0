Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7B83514BD
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 14:16:14 +0200 (CEST)
Received: from localhost ([::1]:47658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRwFB-0001lL-An
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 08:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lRwCH-0000Vw-6N
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:13:13 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:35686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lRwCC-0004N0-VM
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:13:12 -0400
Received: by mail-pl1-x62d.google.com with SMTP id e14so932354plj.2
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 05:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qpna+j/iGaaxi0QXVwjA+9BLwCSZkAAM2isUXvU5/SM=;
 b=RPTqm4gmEKBwNg5UZdc2f8DZKLN+49ch7L0+yU03gzKBfdFeFzG/Duzf/JW6uCzWHl
 nd9TC+mJzgPBANg1pm+KOH+gt+um+PzMKDz1l6ec+VHc3vGncMyw/toxu8KF1HvvFQMj
 lIXF1a9znryVEfsVoX95Z3QyEx+bLg5bckNyWIyqI8KYbPKFS7qeL2VFjHpqLm+W6ONC
 rzrzZ78ZG1l8NKiWOSSvWonG9izlMpjyKcXlPSwMbWTyDUKViMp880UlsL+0idWTQ6Js
 TwwmFPLie8luZAof0nInIFw+Nl6/lsH2m3y0SVg8I3JbnyK1dFcqDNFvA/JEQ3lHI26Q
 yLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qpna+j/iGaaxi0QXVwjA+9BLwCSZkAAM2isUXvU5/SM=;
 b=HulQnT/NYa+bXdnzLcRmsHxsdEgVMKGV0q0nZj/74uhgIQ7D3SQK8ZlTG/iymk+WY0
 A1HvtBEnTTCma8eawzwrgFv0PhegJZgUyUvVgTaryWY30/JPjUcKjLpDdsN4vhqKuXmk
 hDZ4byQH7X4fbSr2j+jQgXfEpJY5zvRP2QM9NsxDSwA9UPo64lbHhbJIz+tJ52s9KEze
 xjy/3u0fEeqTjX5DXOztfrExowcprxMnhLcaLYb71PA5D5Sa+0z8XsgZlWVjAH2XCbFY
 9GAPKU1RST0PWAMGcirfQQTXi5M0kPuKL2BizB8xCFb4PmxBJXxftD8pAThPBhXUBL4F
 vyMA==
X-Gm-Message-State: AOAM530UiF/72rlzUjfTbPelRHm/G/uSI060FxXtjcmii+GY0J1ZEn2+
 wyG8nGPscL5DjUs2oRPZb+zzn4ZNHFkDNA==
X-Google-Smtp-Source: ABdhPJwEY2bAHpmShPRBRupFxa2N6OCWSxf1QTXHWB8LKwq5YS7OfXLNXs4hzSHllZ4x8kmEPzFO3A==
X-Received: by 2002:a17:903:4106:b029:e7:49bd:4266 with SMTP id
 r6-20020a1709034106b02900e749bd4266mr7745634pld.56.1617279187619; 
 Thu, 01 Apr 2021 05:13:07 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id b3sm5535575pjg.41.2021.04.01.05.13.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Apr 2021 05:13:07 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH V2 1/6] !Merge: Update virtio headers from kernel
Date: Thu,  1 Apr 2021 17:42:30 +0530
Message-Id: <fe46b36ea7050dc2dec441bb4e770342ab6f0071.1617278395.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1617278395.git.viresh.kumar@linaro.org>
References: <cover.1617278395.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Jie Deng <jie.deng@intel.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Bill Mills <bill.mills@linaro.org>,
 Arnd Bergmann <arnd.bergmann@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DO NOT MERGE

Update Linux virtio headers with help of

  ./scripts/update-linux-headers.sh ~/lsrc/linux.git

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/standard-headers/linux/virtio_i2c.h | 40 +++++++++++++++++++++
 include/standard-headers/linux/virtio_ids.h |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 include/standard-headers/linux/virtio_i2c.h

diff --git a/include/standard-headers/linux/virtio_i2c.h b/include/standard-headers/linux/virtio_i2c.h
new file mode 100644
index 000000000000..378d31c4a527
--- /dev/null
+++ b/include/standard-headers/linux/virtio_i2c.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later WITH Linux-syscall-note */
+/*
+ * Definitions for virtio I2C Adpter
+ *
+ * Copyright (c) 2021 Intel Corporation. All rights reserved.
+ */
+
+#ifndef _LINUX_VIRTIO_I2C_H
+#define _LINUX_VIRTIO_I2C_H
+
+#include "standard-headers/linux/types.h"
+
+/* The bit 0 of the @virtio_i2c_out_hdr.@flags, used to group the requests */
+#define VIRTIO_I2C_FLAGS_FAIL_NEXT	0x00000001
+
+/**
+ * struct virtio_i2c_out_hdr - the virtio I2C message OUT header
+ * @addr: the controlled device address
+ * @padding: used to pad to full dword
+ * @flags: used for feature extensibility
+ */
+struct virtio_i2c_out_hdr {
+	uint16_t addr;
+	uint16_t padding;
+	uint32_t flags;
+};
+
+/**
+ * struct virtio_i2c_in_hdr - the virtio I2C message IN header
+ * @status: the processing result from the backend
+ */
+struct virtio_i2c_in_hdr {
+	uint8_t status;
+};
+
+/* The final status written by the device */
+#define VIRTIO_I2C_MSG_OK	0
+#define VIRTIO_I2C_MSG_ERR	1
+
+#endif /* _LINUX_VIRTIO_I2C_H */
diff --git a/include/standard-headers/linux/virtio_ids.h b/include/standard-headers/linux/virtio_ids.h
index bc1c0621f5ed..b89391dff6c9 100644
--- a/include/standard-headers/linux/virtio_ids.h
+++ b/include/standard-headers/linux/virtio_ids.h
@@ -54,5 +54,6 @@
 #define VIRTIO_ID_FS			26 /* virtio filesystem */
 #define VIRTIO_ID_PMEM			27 /* virtio pmem */
 #define VIRTIO_ID_MAC80211_HWSIM	29 /* virtio mac80211-hwsim */
+#define VIRTIO_ID_I2C_ADAPTER		34 /* virtio i2c adapter */
 
 #endif /* _LINUX_VIRTIO_IDS_H */
-- 
2.25.0.rc1.19.g042ed3e048af


