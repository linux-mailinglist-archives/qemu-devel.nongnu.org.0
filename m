Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9D140014F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 16:34:28 +0200 (CEST)
Received: from localhost ([::1]:56734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMAGx-00071q-9p
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 10:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFF-0004EH-GV
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 10:32:41 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFD-0005aA-3v
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 10:32:41 -0400
Received: by mail-wr1-x436.google.com with SMTP id z4so8523022wrr.6
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 07:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nocKA961ViPzNqbUH/x+1dP7BZ4tC2NX/d0OA0oqeeI=;
 b=Z72J+lyA6EN0MFsMVh4ZMhzgY+KUuESJt3g/37stB11n6NNveCgVVPoJa3K4479imH
 WEanpDXkzlPZarmh0apMsoc9TtzHsd9R4lKE8Iz2g+D5+5q6LYMSjHIpwYQ/MHxxiqz4
 Bpj/X5FoVYYH2TxJuitt38pTRk+gSkIW9+ZS69M4IoygN0yLCJWV/lvkJlm4m3KPjbVF
 HhCd646l3SXsbQJIMWvgRb4yNO3f5/zBeX7k3aAcVAR9k/QUxSw4WTdRFplY5rbqw0tL
 6dMeFSC5BEhXj+Og4nP7rrLRS5CBJrr/jB8KEsOYQKufn/5jHfWvVIllDESEbwvv3Zj5
 9U3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nocKA961ViPzNqbUH/x+1dP7BZ4tC2NX/d0OA0oqeeI=;
 b=IRGGVLnArmrqB6UV3/U6ZjGsEr8poidfmRU+d5LZkZXm74Sd8xrON0LQq570t2R8Wi
 ksJNHm4FI5z52yw/5pykZaP5PbxtRmmczaitRYm8ft18CCcu/w9diQhvWYm+xAT1r/Td
 cEepbgsUwd1nHglOtVfbcV73Ww8J2EtTMVQMQiF+eP07m/MQGzTuvEoUWJduglh1WFzZ
 laczibi/uIric4aS5TKGeCiC0WHr1XGREIHrMx5KAVBQjXIRO9De48cUexAuGEHZgJal
 aAmVVVQtfPhM4TbEqIQVxSel8uBiW0FHY75lTlCY7s+9cCNxXNWf1mreku5qINyMtMWh
 UgJw==
X-Gm-Message-State: AOAM530Cg5WTTNIY5jHrVb9L9YaHEYFr7WabDVsOyEubX/ErXNNJNBGA
 3Vf5lHHgbA4nxWqcnSp8xWKDYg==
X-Google-Smtp-Source: ABdhPJxCblxCVgZ2pNaN4/EQReepAVo7qk9OGkh+21KV1wNYT+Sq6XeLzuda42EBWwfiOP/76dBCsg==
X-Received: by 2002:adf:cc92:: with SMTP id p18mr4650699wrj.98.1630679556696; 
 Fri, 03 Sep 2021 07:32:36 -0700 (PDT)
Received: from localhost.localdomain (19.11.114.78.rev.sfr.net. [78.114.11.19])
 by smtp.gmail.com with ESMTPSA id z2sm4314843wma.45.2021.09.03.07.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 07:32:36 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v2 1/8] acpi: Add VIOT structure definitions
Date: Fri,  3 Sep 2021 16:32:02 +0200
Message-Id: <20210903143208.2434284-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903143208.2434284-1-jean-philippe@linaro.org>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ACPI Virtual I/O Translation table (VIOT) table describes I/O
topology for paravirtual devices. At the moment it describes the
relation between virtio-iommu devices and their endpoints. Add the
structure definitions for VIOT.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
Following the latest spec draft, and related acpica change
https://jpbrucker.net/virtio-iommu/viot/viot-v9.pdf
https://github.com/acpica/acpica/commit/fc4e33319c1ee08f20f5c44853dd8426643f6dfd
---
 include/hw/acpi/acpi-defs.h | 60 +++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index cf9f44299c..adbf7d7b77 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -618,4 +618,64 @@ struct AcpiIortRC {
 } QEMU_PACKED;
 typedef struct AcpiIortRC AcpiIortRC;
 
+/*
+ * Virtual I/O Translation Table
+ */
+struct AcpiViot {
+    ACPI_TABLE_HEADER_DEF
+    uint16_t node_count;
+    uint16_t node_offset;
+    uint8_t reserved[8];
+} QEMU_PACKED;
+typedef struct AcpiViot AcpiViot;
+
+#define ACPI_VIOT_NODE_HEADER_DEF   /* Fields common to all nodes */ \
+    uint8_t type;          \
+    uint8_t reserved;      \
+    uint16_t length;
+
+/* Values for node Type above */
+enum {
+    ACPI_VIOT_NODE_PCI_RANGE = 0x01,
+    ACPI_VIOT_NODE_MMIO = 0x02,
+    ACPI_VIOT_NODE_VIRTIO_IOMMU_PCI = 0x03,
+    ACPI_VIOT_NODE_VIRTIO_IOMMU_MMIO = 0x04,
+};
+
+struct AcpiViotPciRange {
+    ACPI_VIOT_NODE_HEADER_DEF
+    uint32_t endpoint_start;
+    uint16_t segment_start;
+    uint16_t segment_end;
+    uint16_t bdf_start;
+    uint16_t bdf_end;
+    uint16_t output_node;
+    uint8_t reserved1[6];
+} QEMU_PACKED;
+typedef struct AcpiViotPciRange AcpiViotPciRange;
+
+struct AcpiViotMmio {
+    ACPI_VIOT_NODE_HEADER_DEF
+    uint32_t endpoint;
+    uint64_t base_address;
+    uint16_t output_node;
+    uint8_t reserved1[6];
+} QEMU_PACKED;
+typedef struct AcpiViotMmio AcpiViotMmio;
+
+struct AcpiViotVirtioIommuPci {
+    ACPI_VIOT_NODE_HEADER_DEF
+    uint16_t segment;
+    uint16_t bdf;
+    uint8_t reserved1[8];
+} QEMU_PACKED;
+typedef struct AcpiViotVirtioIommuPci AcpiViotVirtioIommuPci;
+
+struct AcpiViotVirtioIommuMmio {
+    ACPI_VIOT_NODE_HEADER_DEF
+    uint8_t reserved1[4];
+    uint64_t base_address;
+} QEMU_PACKED;
+typedef struct AcpiViotVirtioIommuMmio AcpiViotVirtioIommuMmio;
+
 #endif
-- 
2.33.0


