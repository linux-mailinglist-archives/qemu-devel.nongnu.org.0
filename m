Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD39358623A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 03:38:07 +0200 (CEST)
Received: from localhost ([::1]:52330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIKNi-0008HO-JG
	for lists+qemu-devel@lfdr.de; Sun, 31 Jul 2022 21:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oIKI6-0002mT-1a; Sun, 31 Jul 2022 21:32:18 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:33767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oIKI4-0000U9-7l; Sun, 31 Jul 2022 21:32:17 -0400
Received: by mail-pg1-x536.google.com with SMTP id 206so4940437pgb.0;
 Sun, 31 Jul 2022 18:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=7r9o2/Lajx4dUVD8qjBdmsKEFctZywj1Bn7/2TsaI8A=;
 b=l2eYnqtHy5Da7EV8ndjULRoQoWSBUyBm1zqOmyPOw9MZdrXVnVjuPaMmurlZsTQIK2
 sVdP2HGrV5agvaRmvIoAz28T2pd8+9pDQeCFPiOU5jII84zqt5Ua8QAZ5iMsJKDBns7p
 tsF2OSFFoXi5LRtxyPSAiiTMPqjGcX+V1NL1MGVlwBxrto5hN8GgrjFc791kLKfF6Mhg
 9YF4U/RJAGh1/70YLg9xXkpiHx0cUvX/Y/BY8uQm+2+s80Mcb3cyqDhrK/jhTFAiKDbk
 ZMhnge3rm4C8Qw6cf5wiychHwYbYH35NRnO2+Ll0Qii0HAhLrYY4swG1YzYWWjYNseuN
 IL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=7r9o2/Lajx4dUVD8qjBdmsKEFctZywj1Bn7/2TsaI8A=;
 b=Xm2qjvrnWVo+ogHRXeqIxzSZ9+qxxJ4uWbiN2mTeq9lbXB9PVGYv5rAhcPBUnIAvZH
 uyx/tfgC9oQBicWiUVysG9kjYHfcNuwoYI0GjUERD6jCh7e+fKnSSELtfIX/YqJUtvZ4
 131QhEwcoqfaalePeDIiEML3utdHARht5LvzB6k34qkt950MyR8+i8hLTfytEYL3tIUP
 R/QTcAZvxjUMDBOHg48neriwkf/ZqIm3j+DD5z3245gj4tDwQW64CKd5zjcDw3TjFBOr
 sbfvzXT5NifTkYqPZROsMRHL1aITRmp3lmVkoB9WpcqNjkyAG8z728DNAA5EcnbRMH6U
 P+HA==
X-Gm-Message-State: AJIora8+6VAdNE9e6kfJaT7FRfoCaEkwAX8noHZchz4Psv7SknTkokq4
 5WX/81Ri5e9DK3jbw271/IL2fvwTbA61G1v2
X-Google-Smtp-Source: AGRyM1sz+IwJEqBMFRhvGsUUr7TVVbP6TRolcYcX71ld7g6lNM6NXTYNHosOPfpN3U8pWicejhR/jg==
X-Received: by 2002:a63:5325:0:b0:41b:59f1:79d2 with SMTP id
 h37-20020a635325000000b0041b59f179d2mr11933827pgb.52.1659317534372; 
 Sun, 31 Jul 2022 18:32:14 -0700 (PDT)
Received: from roots.. ([106.84.131.7]) by smtp.gmail.com with ESMTPSA id
 v10-20020a1709028d8a00b0016bfbd99f64sm8069813plo.118.2022.07.31.18.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 18:32:14 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, dmitry.fomichev@wdc.com, hare@suse.de,
 stefanha@redhat.com, mst@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, fam@euphon.net, kwolf@redhat.com, hreitz@redhat.com,
 eblake@redhat.com, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v5 02/11] include: import virtio_blk headers from linux with
 zoned storage support
Date: Mon,  1 Aug 2022 09:32:05 +0800
Message-Id: <20220801013205.10371-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add file from Dmitry's "virtio-blk:add support for zoned block devices"
linux patch using scripts/update-linux-headers.sh. There is a link for
more information: https://github.com/dmitry-fomichev/virtblk-zbd

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 include/standard-headers/linux/virtio_blk.h | 118 ++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/include/standard-headers/linux/virtio_blk.h b/include/standard-headers/linux/virtio_blk.h
index 2dcc90826a..5c6856aec3 100644
--- a/include/standard-headers/linux/virtio_blk.h
+++ b/include/standard-headers/linux/virtio_blk.h
@@ -40,6 +40,7 @@
 #define VIRTIO_BLK_F_MQ		12	/* support more than one vq */
 #define VIRTIO_BLK_F_DISCARD	13	/* DISCARD is supported */
 #define VIRTIO_BLK_F_WRITE_ZEROES	14	/* WRITE ZEROES is supported */
+#define VIRTIO_BLK_F_ZONED		17	/* Zoned block device */
 
 /* Legacy feature bits */
 #ifndef VIRTIO_BLK_NO_LEGACY
@@ -119,6 +120,20 @@ struct virtio_blk_config {
 	uint8_t write_zeroes_may_unmap;
 
 	uint8_t unused1[3];
+
+	/* Secure erase fields that are defined in the virtio spec */
+	uint8_t sec_erase[12];
+
+	/* Zoned block device characteristics (if VIRTIO_BLK_F_ZONED) */
+	struct virtio_blk_zoned_characteristics {
+		__virtio32 zone_sectors;
+		__virtio32 max_open_zones;
+		__virtio32 max_active_zones;
+		__virtio32 max_append_sectors;
+		__virtio32 write_granularity;
+		uint8_t model;
+		uint8_t unused2[3];
+	} zoned;
 } QEMU_PACKED;
 
 /*
@@ -153,6 +168,24 @@ struct virtio_blk_config {
 /* Write zeroes command */
 #define VIRTIO_BLK_T_WRITE_ZEROES	13
 
+/* Zone append command */
+#define VIRTIO_BLK_T_ZONE_APPEND    15
+
+/* Report zones command */
+#define VIRTIO_BLK_T_ZONE_REPORT    16
+
+/* Open zone command */
+#define VIRTIO_BLK_T_ZONE_OPEN      18
+
+/* Close zone command */
+#define VIRTIO_BLK_T_ZONE_CLOSE     20
+
+/* Finish zone command */
+#define VIRTIO_BLK_T_ZONE_FINISH    22
+
+/* Reset zone command */
+#define VIRTIO_BLK_T_ZONE_RESET     24
+
 #ifndef VIRTIO_BLK_NO_LEGACY
 /* Barrier before this op. */
 #define VIRTIO_BLK_T_BARRIER	0x80000000
@@ -172,6 +205,84 @@ struct virtio_blk_outhdr {
 	__virtio64 sector;
 };
 
+/*
+ * Supported zoned device models.
+ */
+
+/* Regular block device */
+#define VIRTIO_BLK_Z_NONE      0
+/* Host-managed zoned device */
+#define VIRTIO_BLK_Z_HM        1
+/* Host-aware zoned device */
+#define VIRTIO_BLK_Z_HA        2
+
+/* ZBD Management Out ALL flag */
+#define VIRTIO_BLK_ZONED_FLAG_ALL	(1 << 0)
+
+/*
+ * Header for VIRTIO_BLK_T_ZONE_OPEN, VIRTIO_BLK_T_ZONE_CLOSE,
+ * VIRTIO_BLK_T_ZONE_RESET, VIRTIO_BLK_T_ZONE_FINISH requests.
+ */
+struct virtio_blk_zone_mgmt_outhdr {
+	/* Zoned request flags */
+	__virtio32 flags;
+};
+
+/*
+ * Zone descriptor. A part of VIRTIO_BLK_T_ZONE_REPORT command reply.
+ */
+struct virtio_blk_zone_descriptor {
+	/* Zone capacity */
+	__virtio64 z_cap;
+	/* The starting sector of the zone */
+	__virtio64 z_start;
+	/* Zone write pointer position in sectors */
+	__virtio64 z_wp;
+	/* Zone type */
+	uint8_t z_type;
+	/* Zone state */
+	uint8_t z_state;
+	uint8_t reserved[38];
+};
+
+struct virtio_blk_zone_report {
+	__virtio64 nr_zones;
+	uint8_t reserved[56];
+	struct virtio_blk_zone_descriptor zones[];
+};
+
+/*
+ * Supported zone types.
+ */
+
+/* Conventional zone */
+#define VIRTIO_BLK_ZT_CONV         1
+/* Sequential Write Required zone */
+#define VIRTIO_BLK_ZT_SWR          2
+/* Sequential Write Preferred zone */
+#define VIRTIO_BLK_ZT_SWP          3
+
+/*
+ * Zone states that are available for zones of all types.
+ */
+
+/* Not a write pointer (conventional zones only) */
+#define VIRTIO_BLK_ZS_NOT_WP       0
+/* Empty */
+#define VIRTIO_BLK_ZS_EMPTY        1
+/* Implicitly Open */
+#define VIRTIO_BLK_ZS_IOPEN        2
+/* Explicitly Open */
+#define VIRTIO_BLK_ZS_EOPEN        3
+/* Closed */
+#define VIRTIO_BLK_ZS_CLOSED       4
+/* Read-Only */
+#define VIRTIO_BLK_ZS_RDONLY       13
+/* Full */
+#define VIRTIO_BLK_ZS_FULL         14
+/* Offline */
+#define VIRTIO_BLK_ZS_OFFLINE      15
+
 /* Unmap this range (only valid for write zeroes command) */
 #define VIRTIO_BLK_WRITE_ZEROES_FLAG_UNMAP	0x00000001
 
@@ -198,4 +309,11 @@ struct virtio_scsi_inhdr {
 #define VIRTIO_BLK_S_OK		0
 #define VIRTIO_BLK_S_IOERR	1
 #define VIRTIO_BLK_S_UNSUPP	2
+
+/* Error codes that are specific to zoned block devices */
+#define VIRTIO_BLK_S_ZONE_INVALID_CMD     3
+#define VIRTIO_BLK_S_ZONE_UNALIGNED_WP    4
+#define VIRTIO_BLK_S_ZONE_OPEN_RESOURCE   5
+#define VIRTIO_BLK_S_ZONE_ACTIVE_RESOURCE 6
+
 #endif /* _LINUX_VIRTIO_BLK_H */
-- 
2.37.1


