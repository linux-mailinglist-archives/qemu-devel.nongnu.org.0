Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E53DF3E55D3
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 10:48:22 +0200 (CEST)
Received: from localhost ([::1]:40396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDNQr-0000qV-St
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 04:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mDNPK-0006VF-9T
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:46:46 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:44625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mDNPG-00082J-NH
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:46:46 -0400
Received: by mail-ej1-x62e.google.com with SMTP id yk17so33984123ejb.11
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 01:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tM+6Q/09BSPbSVODH5fu80QY1gdHUNNnA2XQdyRcxCo=;
 b=bgg2g5BGFBkOFVC6Pv98IBy8W6IbIxAefJihsfII+k01QsEIB1idH8G1Ap/jqapThX
 fouGHHZ/9eBuucRXIXxN0iPqWqA08+xEQaQQxSXqW/Y3B+AHIzCBsKJrpirbQ6hZB8Qx
 EJh2LCnXNSvnKYnC8xvuV4ZqFeDG4u1LID+vvH6ImqpXOuHU8ZSjh0xxl/DHKothLgg5
 b6ZbitvO42PDBB9YuzWLhWNiaMVhkT1kdV1zBkYSJFOBDgzMrfRw3mgNkq05xOCJfqCc
 3u6fXMAfVYgt4pYBBiWFz3PjkOQvlgrgFZAtBk9RZAHp2dwQ9GrIPtJi1UzIif4r625A
 56vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tM+6Q/09BSPbSVODH5fu80QY1gdHUNNnA2XQdyRcxCo=;
 b=SmVPBMja1eQjeg9IZmehHYPggfVzLx4x4IkggsgVYuyJNxGivMEejcZjarQ925QvUj
 4m+39ZOL1ETbcATQEJTwMhyCPAebWtUozNBHTtqe2jxRLC31deUpySJ9f2maxbbRxequ
 eF/BuxWASw2Rk3bodV7uq38M52EbhbKtZbyVr+F1/LdLm8NSgG/VbX9dOVBPC5AFQbzj
 Cz2BgPM0mnU4O54KZD/6uTg+YRC1h9Uj/keLksXIrE63NrtpvK6geGXetPebWtNFaYzX
 lrucFahBCJ3/lhj/vobnM9Wn8uVnslhgGTuo+ccxOyDG/KMDuTED3O8r89OfU/ZhTjv8
 cu5g==
X-Gm-Message-State: AOAM532l8uPGagmszAwypsaSVNI+CfDyWjqEb/NIzr/rZZ3eOq4VFp/v
 iaPGfE5q9qzLeYK2ukoqI9sfEg==
X-Google-Smtp-Source: ABdhPJynOMIFbkh2evNpYVG36xC3WaixnyaUIV1E05ed1ZnljsyOTAKn+OPYhXluH5n/QUuNSW0WpA==
X-Received: by 2002:a17:906:2d51:: with SMTP id
 e17mr26408407eji.500.1628585200703; 
 Tue, 10 Aug 2021 01:46:40 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-111-173.adslplus.ch.
 [84.226.111.173])
 by smtp.gmail.com with ESMTPSA id fl2sm1533516ejc.114.2021.08.10.01.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 01:46:40 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH 1/6] acpi: Add VIOT structure definitions
Date: Tue, 10 Aug 2021 10:45:01 +0200
Message-Id: <20210810084505.2257983-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210810084505.2257983-1-jean-philippe@linaro.org>
References: <20210810084505.2257983-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=jean-philippe@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
2.32.0


