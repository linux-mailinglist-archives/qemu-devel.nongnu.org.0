Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E152925DC84
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 16:56:57 +0200 (CEST)
Received: from localhost ([::1]:36506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kED96-0001Yz-VN
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 10:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kED7z-0000MX-6T
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 10:55:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kED7w-0007Cn-5u
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 10:55:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599231343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WMu73wym0Gow5akvjboCGHRUYvigv/8DgHoM/En3UyE=;
 b=J+raaqGjU6jG6i6uur6S6MAfEuVeyN5emwQ6KJSDalmJg2fGUFOi+2bDl02fEyu9bupEIr
 ZhG2mDfr5pJuKW9axgrzwt97EhB8D2PjYA2BEp60k6m2I3OFjskwBCR9ajExx8YYLp87SL
 9yfLzCrCiZhhXDG+gmw4xRtkgsnOhLo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-N1oH3JCiN2uSWX-VzwL3cA-1; Fri, 04 Sep 2020 10:54:36 -0400
X-MC-Unique: N1oH3JCiN2uSWX-VzwL3cA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D45706408E
 for <qemu-devel@nongnu.org>; Fri,  4 Sep 2020 14:54:35 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 792307A1F4;
 Fri,  4 Sep 2020 14:54:34 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 01/22] WIP: update linux/headers
Date: Fri,  4 Sep 2020 16:54:10 +0200
Message-Id: <20200904145431.196885-2-vkuznets@redhat.com>
In-Reply-To: <20200904145431.196885-1-vkuznets@redhat.com>
References: <20200904145431.196885-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 06:46:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

KVM_CAP_SYS_HYPERV_CPUID definition is needed for this series.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 include/standard-headers/drm/drm_fourcc.h     | 140 ++++++++++++++++++
 include/standard-headers/linux/ethtool.h      |  87 +++++++++++
 .../linux/input-event-codes.h                 |   3 +-
 linux-headers/asm-generic/unistd.h            |   6 +-
 linux-headers/asm-mips/unistd_n32.h           |   1 +
 linux-headers/asm-mips/unistd_n64.h           |   1 +
 linux-headers/asm-mips/unistd_o32.h           |   1 +
 linux-headers/asm-powerpc/kvm.h               |   5 +
 linux-headers/asm-powerpc/mman.h              |   2 +-
 linux-headers/asm-powerpc/unistd_32.h         |   1 +
 linux-headers/asm-powerpc/unistd_64.h         |   1 +
 linux-headers/asm-s390/kvm.h                  |   7 +-
 linux-headers/asm-s390/unistd_32.h            |   1 +
 linux-headers/asm-s390/unistd_64.h            |   1 +
 linux-headers/asm-x86/unistd_32.h             |   1 +
 linux-headers/asm-x86/unistd_64.h             |   1 +
 linux-headers/asm-x86/unistd_x32.h            |   1 +
 linux-headers/linux/kvm.h                     |   7 +-
 linux-headers/linux/vfio.h                    |   2 +-
 19 files changed, 261 insertions(+), 8 deletions(-)

diff --git a/include/standard-headers/drm/drm_fourcc.h b/include/standard-headers/drm/drm_fourcc.h
index 909a66753c03..2757bdf6fa70 100644
--- a/include/standard-headers/drm/drm_fourcc.h
+++ b/include/standard-headers/drm/drm_fourcc.h
@@ -235,6 +235,12 @@ extern "C" {
 #define DRM_FORMAT_NV61		fourcc_code('N', 'V', '6', '1') /* 2x1 subsampled Cb:Cr plane */
 #define DRM_FORMAT_NV24		fourcc_code('N', 'V', '2', '4') /* non-subsampled Cr:Cb plane */
 #define DRM_FORMAT_NV42		fourcc_code('N', 'V', '4', '2') /* non-subsampled Cb:Cr plane */
+/*
+ * 2 plane YCbCr
+ * index 0 = Y plane, [39:0] Y3:Y2:Y1:Y0 little endian
+ * index 1 = Cr:Cb plane, [39:0] Cr1:Cb1:Cr0:Cb0 little endian
+ */
+#define DRM_FORMAT_NV15		fourcc_code('N', 'V', '1', '5') /* 2x2 subsampled Cr:Cb plane */
 
 /*
  * 2 plane YCbCr MSB aligned
@@ -264,6 +270,22 @@ extern "C" {
  */
 #define DRM_FORMAT_P016		fourcc_code('P', '0', '1', '6') /* 2x2 subsampled Cr:Cb plane 16 bits per channel */
 
+/* 3 plane non-subsampled (444) YCbCr
+ * 16 bits per component, but only 10 bits are used and 6 bits are padded
+ * index 0: Y plane, [15:0] Y:x [10:6] little endian
+ * index 1: Cb plane, [15:0] Cb:x [10:6] little endian
+ * index 2: Cr plane, [15:0] Cr:x [10:6] little endian
+ */
+#define DRM_FORMAT_Q410		fourcc_code('Q', '4', '1', '0')
+
+/* 3 plane non-subsampled (444) YCrCb
+ * 16 bits per component, but only 10 bits are used and 6 bits are padded
+ * index 0: Y plane, [15:0] Y:x [10:6] little endian
+ * index 1: Cr plane, [15:0] Cr:x [10:6] little endian
+ * index 2: Cb plane, [15:0] Cb:x [10:6] little endian
+ */
+#define DRM_FORMAT_Q401		fourcc_code('Q', '4', '0', '1')
+
 /*
  * 3 plane YCbCr
  * index 0: Y plane, [7:0] Y
@@ -308,6 +330,7 @@ extern "C" {
 #define DRM_FORMAT_MOD_VENDOR_BROADCOM 0x07
 #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
 #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
+#define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
 
 /* add more to the end as needed */
 
@@ -322,8 +345,33 @@ extern "C" {
  * When adding a new token please document the layout with a code comment,
  * similar to the fourcc codes above. drm_fourcc.h is considered the
  * authoritative source for all of these.
+ *
+ * Generic modifier names:
+ *
+ * DRM_FORMAT_MOD_GENERIC_* definitions are used to provide vendor-neutral names
+ * for layouts which are common across multiple vendors. To preserve
+ * compatibility, in cases where a vendor-specific definition already exists and
+ * a generic name for it is desired, the common name is a purely symbolic alias
+ * and must use the same numerical value as the original definition.
+ *
+ * Note that generic names should only be used for modifiers which describe
+ * generic layouts (such as pixel re-ordering), which may have
+ * independently-developed support across multiple vendors.
+ *
+ * In future cases where a generic layout is identified before merging with a
+ * vendor-specific modifier, a new 'GENERIC' vendor or modifier using vendor
+ * 'NONE' could be considered. This should only be for obvious, exceptional
+ * cases to avoid polluting the 'GENERIC' namespace with modifiers which only
+ * apply to a single vendor.
+ *
+ * Generic names should not be used for cases where multiple hardware vendors
+ * have implementations of the same standardised compression scheme (such as
+ * AFBC). In those cases, all implementations should use the same format
+ * modifier(s), reflecting the vendor of the standard.
  */
 
+#define DRM_FORMAT_MOD_GENERIC_16_16_TILE DRM_FORMAT_MOD_SAMSUNG_16_16_TILE
+
 /*
  * Invalid Modifier
  *
@@ -891,6 +939,18 @@ drm_fourcc_canonicalize_nvidia_format_mod(uint64_t modifier)
  */
 #define AFBC_FORMAT_MOD_BCH     (1ULL << 11)
 
+/* AFBC uncompressed storage mode
+ *
+ * Indicates that the buffer is using AFBC uncompressed storage mode.
+ * In this mode all superblock payloads in the buffer use the uncompressed
+ * storage mode, which is usually only used for data which cannot be compressed.
+ * The buffer layout is the same as for AFBC buffers without USM set, this only
+ * affects the storage mode of the individual superblocks. Note that even a
+ * buffer without USM set may use uncompressed storage mode for some or all
+ * superblocks, USM just guarantees it for all.
+ */
+#define AFBC_FORMAT_MOD_USM	(1ULL << 12)
+
 /*
  * Arm 16x16 Block U-Interleaved modifier
  *
@@ -915,6 +975,86 @@ drm_fourcc_canonicalize_nvidia_format_mod(uint64_t modifier)
  */
 #define DRM_FORMAT_MOD_ALLWINNER_TILED fourcc_mod_code(ALLWINNER, 1)
 
+/*
+ * Amlogic Video Framebuffer Compression modifiers
+ *
+ * Amlogic uses a proprietary lossless image compression protocol and format
+ * for their hardware video codec accelerators, either video decoders or
+ * video input encoders.
+ *
+ * It considerably reduces memory bandwidth while writing and reading
+ * frames in memory.
+ *
+ * The underlying storage is considered to be 3 components, 8bit or 10-bit
+ * per component YCbCr 420, single plane :
+ * - DRM_FORMAT_YUV420_8BIT
+ * - DRM_FORMAT_YUV420_10BIT
+ *
+ * The first 8 bits of the mode defines the layout, then the following 8 bits
+ * defines the options changing the layout.
+ *
+ * Not all combinations are valid, and different SoCs may support different
+ * combinations of layout and options.
+ */
+#define __fourcc_mod_amlogic_layout_mask 0xf
+#define __fourcc_mod_amlogic_options_shift 8
+#define __fourcc_mod_amlogic_options_mask 0xf
+
+#define DRM_FORMAT_MOD_AMLOGIC_FBC(__layout, __options) \
+	fourcc_mod_code(AMLOGIC, \
+			((__layout) & __fourcc_mod_amlogic_layout_mask) | \
+			((__options) & __fourcc_mod_amlogic_options_mask \
+			 << __fourcc_mod_amlogic_options_shift))
+
+/* Amlogic FBC Layouts */
+
+/*
+ * Amlogic FBC Basic Layout
+ *
+ * The basic layout is composed of:
+ * - a body content organized in 64x32 superblocks with 4096 bytes per
+ *   superblock in default mode.
+ * - a 32 bytes per 128x64 header block
+ *
+ * This layout is transferrable between Amlogic SoCs supporting this modifier.
+ */
+#define AMLOGIC_FBC_LAYOUT_BASIC		(1ULL)
+
+/*
+ * Amlogic FBC Scatter Memory layout
+ *
+ * Indicates the header contains IOMMU references to the compressed
+ * frames content to optimize memory access and layout.
+ *
+ * In this mode, only the header memory address is needed, thus the
+ * content memory organization is tied to the current producer
+ * execution and cannot be saved/dumped neither transferrable between
+ * Amlogic SoCs supporting this modifier.
+ *
+ * Due to the nature of the layout, these buffers are not expected to
+ * be accessible by the user-space clients, but only accessible by the
+ * hardware producers and consumers.
+ *
+ * The user-space clients should expect a failure while trying to mmap
+ * the DMA-BUF handle returned by the producer.
+ */
+#define AMLOGIC_FBC_LAYOUT_SCATTER		(2ULL)
+
+/* Amlogic FBC Layout Options Bit Mask */
+
+/*
+ * Amlogic FBC Memory Saving mode
+ *
+ * Indicates the storage is packed when pixel size is multiple of word
+ * boudaries, i.e. 8bit should be stored in this mode to save allocation
+ * memory.
+ *
+ * This mode reduces body layout to 3072 bytes per 64x32 superblock with
+ * the basic layout and 3200 bytes per 64x32 superblock combined with
+ * the scatter layout.
+ */
+#define AMLOGIC_FBC_OPTION_MEM_SAVING		(1ULL << 0)
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/include/standard-headers/linux/ethtool.h b/include/standard-headers/linux/ethtool.h
index fd8d2cccfe89..e13eff44882d 100644
--- a/include/standard-headers/linux/ethtool.h
+++ b/include/standard-headers/linux/ethtool.h
@@ -579,6 +579,76 @@ struct ethtool_pauseparam {
 	uint32_t	tx_pause;
 };
 
+/**
+ * enum ethtool_link_ext_state - link extended state
+ */
+enum ethtool_link_ext_state {
+	ETHTOOL_LINK_EXT_STATE_AUTONEG,
+	ETHTOOL_LINK_EXT_STATE_LINK_TRAINING_FAILURE,
+	ETHTOOL_LINK_EXT_STATE_LINK_LOGICAL_MISMATCH,
+	ETHTOOL_LINK_EXT_STATE_BAD_SIGNAL_INTEGRITY,
+	ETHTOOL_LINK_EXT_STATE_NO_CABLE,
+	ETHTOOL_LINK_EXT_STATE_CABLE_ISSUE,
+	ETHTOOL_LINK_EXT_STATE_EEPROM_ISSUE,
+	ETHTOOL_LINK_EXT_STATE_CALIBRATION_FAILURE,
+	ETHTOOL_LINK_EXT_STATE_POWER_BUDGET_EXCEEDED,
+	ETHTOOL_LINK_EXT_STATE_OVERHEAT,
+};
+
+/**
+ * enum ethtool_link_ext_substate_autoneg - more information in addition to
+ * ETHTOOL_LINK_EXT_STATE_AUTONEG.
+ */
+enum ethtool_link_ext_substate_autoneg {
+	ETHTOOL_LINK_EXT_SUBSTATE_AN_NO_PARTNER_DETECTED = 1,
+	ETHTOOL_LINK_EXT_SUBSTATE_AN_ACK_NOT_RECEIVED,
+	ETHTOOL_LINK_EXT_SUBSTATE_AN_NEXT_PAGE_EXCHANGE_FAILED,
+	ETHTOOL_LINK_EXT_SUBSTATE_AN_NO_PARTNER_DETECTED_FORCE_MODE,
+	ETHTOOL_LINK_EXT_SUBSTATE_AN_FEC_MISMATCH_DURING_OVERRIDE,
+	ETHTOOL_LINK_EXT_SUBSTATE_AN_NO_HCD,
+};
+
+/**
+ * enum ethtool_link_ext_substate_link_training - more information in addition to
+ * ETHTOOL_LINK_EXT_STATE_LINK_TRAINING_FAILURE.
+ */
+enum ethtool_link_ext_substate_link_training {
+	ETHTOOL_LINK_EXT_SUBSTATE_LT_KR_FRAME_LOCK_NOT_ACQUIRED = 1,
+	ETHTOOL_LINK_EXT_SUBSTATE_LT_KR_LINK_INHIBIT_TIMEOUT,
+	ETHTOOL_LINK_EXT_SUBSTATE_LT_KR_LINK_PARTNER_DID_NOT_SET_RECEIVER_READY,
+	ETHTOOL_LINK_EXT_SUBSTATE_LT_REMOTE_FAULT,
+};
+
+/**
+ * enum ethtool_link_ext_substate_logical_mismatch - more information in addition
+ * to ETHTOOL_LINK_EXT_STATE_LINK_LOGICAL_MISMATCH.
+ */
+enum ethtool_link_ext_substate_link_logical_mismatch {
+	ETHTOOL_LINK_EXT_SUBSTATE_LLM_PCS_DID_NOT_ACQUIRE_BLOCK_LOCK = 1,
+	ETHTOOL_LINK_EXT_SUBSTATE_LLM_PCS_DID_NOT_ACQUIRE_AM_LOCK,
+	ETHTOOL_LINK_EXT_SUBSTATE_LLM_PCS_DID_NOT_GET_ALIGN_STATUS,
+	ETHTOOL_LINK_EXT_SUBSTATE_LLM_FC_FEC_IS_NOT_LOCKED,
+	ETHTOOL_LINK_EXT_SUBSTATE_LLM_RS_FEC_IS_NOT_LOCKED,
+};
+
+/**
+ * enum ethtool_link_ext_substate_bad_signal_integrity - more information in
+ * addition to ETHTOOL_LINK_EXT_STATE_BAD_SIGNAL_INTEGRITY.
+ */
+enum ethtool_link_ext_substate_bad_signal_integrity {
+	ETHTOOL_LINK_EXT_SUBSTATE_BSI_LARGE_NUMBER_OF_PHYSICAL_ERRORS = 1,
+	ETHTOOL_LINK_EXT_SUBSTATE_BSI_UNSUPPORTED_RATE,
+};
+
+/**
+ * enum ethtool_link_ext_substate_cable_issue - more information in
+ * addition to ETHTOOL_LINK_EXT_STATE_CABLE_ISSUE.
+ */
+enum ethtool_link_ext_substate_cable_issue {
+	ETHTOOL_LINK_EXT_SUBSTATE_CI_UNSUPPORTED_CABLE = 1,
+	ETHTOOL_LINK_EXT_SUBSTATE_CI_CABLE_TEST_FAILURE,
+};
+
 #define ETH_GSTRING_LEN		32
 
 /**
@@ -599,6 +669,7 @@ struct ethtool_pauseparam {
  * @ETH_SS_SOF_TIMESTAMPING: SOF_TIMESTAMPING_* flags
  * @ETH_SS_TS_TX_TYPES: timestamping Tx types
  * @ETH_SS_TS_RX_FILTERS: timestamping Rx filters
+ * @ETH_SS_UDP_TUNNEL_TYPES: UDP tunnel types
  */
 enum ethtool_stringset {
 	ETH_SS_TEST		= 0,
@@ -616,6 +687,7 @@ enum ethtool_stringset {
 	ETH_SS_SOF_TIMESTAMPING,
 	ETH_SS_TS_TX_TYPES,
 	ETH_SS_TS_RX_FILTERS,
+	ETH_SS_UDP_TUNNEL_TYPES,
 
 	/* add new constants above here */
 	ETH_SS_COUNT
@@ -1530,6 +1602,21 @@ enum ethtool_link_mode_bit_indices {
 	ETHTOOL_LINK_MODE_400000baseDR8_Full_BIT	 = 72,
 	ETHTOOL_LINK_MODE_400000baseCR8_Full_BIT	 = 73,
 	ETHTOOL_LINK_MODE_FEC_LLRS_BIT			 = 74,
+	ETHTOOL_LINK_MODE_100000baseKR_Full_BIT		 = 75,
+	ETHTOOL_LINK_MODE_100000baseSR_Full_BIT		 = 76,
+	ETHTOOL_LINK_MODE_100000baseLR_ER_FR_Full_BIT	 = 77,
+	ETHTOOL_LINK_MODE_100000baseCR_Full_BIT		 = 78,
+	ETHTOOL_LINK_MODE_100000baseDR_Full_BIT		 = 79,
+	ETHTOOL_LINK_MODE_200000baseKR2_Full_BIT	 = 80,
+	ETHTOOL_LINK_MODE_200000baseSR2_Full_BIT	 = 81,
+	ETHTOOL_LINK_MODE_200000baseLR2_ER2_FR2_Full_BIT = 82,
+	ETHTOOL_LINK_MODE_200000baseDR2_Full_BIT	 = 83,
+	ETHTOOL_LINK_MODE_200000baseCR2_Full_BIT	 = 84,
+	ETHTOOL_LINK_MODE_400000baseKR4_Full_BIT	 = 85,
+	ETHTOOL_LINK_MODE_400000baseSR4_Full_BIT	 = 86,
+	ETHTOOL_LINK_MODE_400000baseLR4_ER4_FR4_Full_BIT = 87,
+	ETHTOOL_LINK_MODE_400000baseDR4_Full_BIT	 = 88,
+	ETHTOOL_LINK_MODE_400000baseCR4_Full_BIT	 = 89,
 	/* must be last entry */
 	__ETHTOOL_LINK_MODE_MASK_NBITS
 };
diff --git a/include/standard-headers/linux/input-event-codes.h b/include/standard-headers/linux/input-event-codes.h
index ebf72c10317b..e740ad9f2e01 100644
--- a/include/standard-headers/linux/input-event-codes.h
+++ b/include/standard-headers/linux/input-event-codes.h
@@ -888,7 +888,8 @@
 #define SW_LINEIN_INSERT	0x0d  /* set = inserted */
 #define SW_MUTE_DEVICE		0x0e  /* set = device disabled */
 #define SW_PEN_INSERTED		0x0f  /* set = pen inserted */
-#define SW_MAX_			0x0f
+#define SW_MACHINE_COVER	0x10  /* set = cover closed */
+#define SW_MAX_			0x10
 #define SW_CNT			(SW_MAX_+1)
 
 /*
diff --git a/linux-headers/asm-generic/unistd.h b/linux-headers/asm-generic/unistd.h
index f4a01305d9a6..995b36c2ea7d 100644
--- a/linux-headers/asm-generic/unistd.h
+++ b/linux-headers/asm-generic/unistd.h
@@ -606,9 +606,9 @@ __SYSCALL(__NR_sendto, sys_sendto)
 #define __NR_recvfrom 207
 __SC_COMP(__NR_recvfrom, sys_recvfrom, compat_sys_recvfrom)
 #define __NR_setsockopt 208
-__SC_COMP(__NR_setsockopt, sys_setsockopt, compat_sys_setsockopt)
+__SC_COMP(__NR_setsockopt, sys_setsockopt, sys_setsockopt)
 #define __NR_getsockopt 209
-__SC_COMP(__NR_getsockopt, sys_getsockopt, compat_sys_getsockopt)
+__SC_COMP(__NR_getsockopt, sys_getsockopt, sys_getsockopt)
 #define __NR_shutdown 210
 __SYSCALL(__NR_shutdown, sys_shutdown)
 #define __NR_sendmsg 211
@@ -850,6 +850,8 @@ __SYSCALL(__NR_pidfd_open, sys_pidfd_open)
 #define __NR_clone3 435
 __SYSCALL(__NR_clone3, sys_clone3)
 #endif
+#define __NR_close_range 436
+__SYSCALL(__NR_close_range, sys_close_range)
 
 #define __NR_openat2 437
 __SYSCALL(__NR_openat2, sys_openat2)
diff --git a/linux-headers/asm-mips/unistd_n32.h b/linux-headers/asm-mips/unistd_n32.h
index 3b9eda7e7d8f..246fbb6a7885 100644
--- a/linux-headers/asm-mips/unistd_n32.h
+++ b/linux-headers/asm-mips/unistd_n32.h
@@ -365,6 +365,7 @@
 #define __NR_fspick	(__NR_Linux + 433)
 #define __NR_pidfd_open	(__NR_Linux + 434)
 #define __NR_clone3	(__NR_Linux + 435)
+#define __NR_close_range	(__NR_Linux + 436)
 #define __NR_openat2	(__NR_Linux + 437)
 #define __NR_pidfd_getfd	(__NR_Linux + 438)
 #define __NR_faccessat2	(__NR_Linux + 439)
diff --git a/linux-headers/asm-mips/unistd_n64.h b/linux-headers/asm-mips/unistd_n64.h
index 9cdf9b6c60df..194d777dfd42 100644
--- a/linux-headers/asm-mips/unistd_n64.h
+++ b/linux-headers/asm-mips/unistd_n64.h
@@ -341,6 +341,7 @@
 #define __NR_fspick	(__NR_Linux + 433)
 #define __NR_pidfd_open	(__NR_Linux + 434)
 #define __NR_clone3	(__NR_Linux + 435)
+#define __NR_close_range	(__NR_Linux + 436)
 #define __NR_openat2	(__NR_Linux + 437)
 #define __NR_pidfd_getfd	(__NR_Linux + 438)
 #define __NR_faccessat2	(__NR_Linux + 439)
diff --git a/linux-headers/asm-mips/unistd_o32.h b/linux-headers/asm-mips/unistd_o32.h
index e3e5e238f026..3e093dd9134d 100644
--- a/linux-headers/asm-mips/unistd_o32.h
+++ b/linux-headers/asm-mips/unistd_o32.h
@@ -411,6 +411,7 @@
 #define __NR_fspick	(__NR_Linux + 433)
 #define __NR_pidfd_open	(__NR_Linux + 434)
 #define __NR_clone3	(__NR_Linux + 435)
+#define __NR_close_range	(__NR_Linux + 436)
 #define __NR_openat2	(__NR_Linux + 437)
 #define __NR_pidfd_getfd	(__NR_Linux + 438)
 #define __NR_faccessat2	(__NR_Linux + 439)
diff --git a/linux-headers/asm-powerpc/kvm.h b/linux-headers/asm-powerpc/kvm.h
index 264e266a85bf..c3af3f324c5a 100644
--- a/linux-headers/asm-powerpc/kvm.h
+++ b/linux-headers/asm-powerpc/kvm.h
@@ -640,6 +640,11 @@ struct kvm_ppc_cpu_char {
 #define KVM_REG_PPC_ONLINE	(KVM_REG_PPC | KVM_REG_SIZE_U32 | 0xbf)
 #define KVM_REG_PPC_PTCR	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc0)
 
+/* POWER10 registers */
+#define KVM_REG_PPC_MMCR3	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc1)
+#define KVM_REG_PPC_SIER2	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc2)
+#define KVM_REG_PPC_SIER3	(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc3)
+
 /* Transactional Memory checkpointed state:
  * This is all GPRs, all VSX regs and a subset of SPRs
  */
diff --git a/linux-headers/asm-powerpc/mman.h b/linux-headers/asm-powerpc/mman.h
index 8db7c2a3be30..c16840d33bfd 100644
--- a/linux-headers/asm-powerpc/mman.h
+++ b/linux-headers/asm-powerpc/mman.h
@@ -11,7 +11,7 @@
 #include <asm-generic/mman-common.h>
 
 
-#define PROT_SAO	0x10		/* Strong Access Ordering */
+#define PROT_SAO	0x10		/* Unsupported since v5.9 */
 
 #define MAP_RENAME      MAP_ANONYMOUS   /* In SunOS terminology */
 #define MAP_NORESERVE   0x40            /* don't reserve swap pages */
diff --git a/linux-headers/asm-powerpc/unistd_32.h b/linux-headers/asm-powerpc/unistd_32.h
index 862edb7448c5..0db9481d4962 100644
--- a/linux-headers/asm-powerpc/unistd_32.h
+++ b/linux-headers/asm-powerpc/unistd_32.h
@@ -418,6 +418,7 @@
 #define __NR_fspick	433
 #define __NR_pidfd_open	434
 #define __NR_clone3	435
+#define __NR_close_range	436
 #define __NR_openat2	437
 #define __NR_pidfd_getfd	438
 #define __NR_faccessat2	439
diff --git a/linux-headers/asm-powerpc/unistd_64.h b/linux-headers/asm-powerpc/unistd_64.h
index f553224ce408..9f74310988e1 100644
--- a/linux-headers/asm-powerpc/unistd_64.h
+++ b/linux-headers/asm-powerpc/unistd_64.h
@@ -390,6 +390,7 @@
 #define __NR_fspick	433
 #define __NR_pidfd_open	434
 #define __NR_clone3	435
+#define __NR_close_range	436
 #define __NR_openat2	437
 #define __NR_pidfd_getfd	438
 #define __NR_faccessat2	439
diff --git a/linux-headers/asm-s390/kvm.h b/linux-headers/asm-s390/kvm.h
index 0138ccb0d892..f053b8304a85 100644
--- a/linux-headers/asm-s390/kvm.h
+++ b/linux-headers/asm-s390/kvm.h
@@ -231,11 +231,13 @@ struct kvm_guest_debug_arch {
 #define KVM_SYNC_GSCB   (1UL << 9)
 #define KVM_SYNC_BPBC   (1UL << 10)
 #define KVM_SYNC_ETOKEN (1UL << 11)
+#define KVM_SYNC_DIAG318 (1UL << 12)
 
 #define KVM_SYNC_S390_VALID_FIELDS \
 	(KVM_SYNC_PREFIX | KVM_SYNC_GPRS | KVM_SYNC_ACRS | KVM_SYNC_CRS | \
 	 KVM_SYNC_ARCH0 | KVM_SYNC_PFAULT | KVM_SYNC_VRS | KVM_SYNC_RICCB | \
-	 KVM_SYNC_FPRS | KVM_SYNC_GSCB | KVM_SYNC_BPBC | KVM_SYNC_ETOKEN)
+	 KVM_SYNC_FPRS | KVM_SYNC_GSCB | KVM_SYNC_BPBC | KVM_SYNC_ETOKEN | \
+	 KVM_SYNC_DIAG318)
 
 /* length and alignment of the sdnx as a power of two */
 #define SDNXC 8
@@ -264,7 +266,8 @@ struct kvm_sync_regs {
 	__u8 reserved2 : 7;
 	__u8 padding1[51];	/* riccb needs to be 64byte aligned */
 	__u8 riccb[64];		/* runtime instrumentation controls block */
-	__u8 padding2[192];	/* sdnx needs to be 256byte aligned */
+	__u64 diag318;		/* diagnose 0x318 info */
+	__u8 padding2[184];	/* sdnx needs to be 256byte aligned */
 	union {
 		__u8 sdnx[SDNXL];  /* state description annex */
 		struct {
diff --git a/linux-headers/asm-s390/unistd_32.h b/linux-headers/asm-s390/unistd_32.h
index e08233c0c377..1803cd0c3ba6 100644
--- a/linux-headers/asm-s390/unistd_32.h
+++ b/linux-headers/asm-s390/unistd_32.h
@@ -408,6 +408,7 @@
 #define __NR_fspick 433
 #define __NR_pidfd_open 434
 #define __NR_clone3 435
+#define __NR_close_range 436
 #define __NR_openat2 437
 #define __NR_pidfd_getfd 438
 #define __NR_faccessat2 439
diff --git a/linux-headers/asm-s390/unistd_64.h b/linux-headers/asm-s390/unistd_64.h
index 560e19ae2bb4..228d5004e5a8 100644
--- a/linux-headers/asm-s390/unistd_64.h
+++ b/linux-headers/asm-s390/unistd_64.h
@@ -356,6 +356,7 @@
 #define __NR_fspick 433
 #define __NR_pidfd_open 434
 #define __NR_clone3 435
+#define __NR_close_range 436
 #define __NR_openat2 437
 #define __NR_pidfd_getfd 438
 #define __NR_faccessat2 439
diff --git a/linux-headers/asm-x86/unistd_32.h b/linux-headers/asm-x86/unistd_32.h
index c727981d4a3a..356c12c2dbce 100644
--- a/linux-headers/asm-x86/unistd_32.h
+++ b/linux-headers/asm-x86/unistd_32.h
@@ -426,6 +426,7 @@
 #define __NR_fspick 433
 #define __NR_pidfd_open 434
 #define __NR_clone3 435
+#define __NR_close_range 436
 #define __NR_openat2 437
 #define __NR_pidfd_getfd 438
 #define __NR_faccessat2 439
diff --git a/linux-headers/asm-x86/unistd_64.h b/linux-headers/asm-x86/unistd_64.h
index 843fa6274584..ef70e1c7c93f 100644
--- a/linux-headers/asm-x86/unistd_64.h
+++ b/linux-headers/asm-x86/unistd_64.h
@@ -348,6 +348,7 @@
 #define __NR_fspick 433
 #define __NR_pidfd_open 434
 #define __NR_clone3 435
+#define __NR_close_range 436
 #define __NR_openat2 437
 #define __NR_pidfd_getfd 438
 #define __NR_faccessat2 439
diff --git a/linux-headers/asm-x86/unistd_x32.h b/linux-headers/asm-x86/unistd_x32.h
index 7d63d703cab4..84ae8e9f5fca 100644
--- a/linux-headers/asm-x86/unistd_x32.h
+++ b/linux-headers/asm-x86/unistd_x32.h
@@ -301,6 +301,7 @@
 #define __NR_fspick (__X32_SYSCALL_BIT + 433)
 #define __NR_pidfd_open (__X32_SYSCALL_BIT + 434)
 #define __NR_clone3 (__X32_SYSCALL_BIT + 435)
+#define __NR_close_range (__X32_SYSCALL_BIT + 436)
 #define __NR_openat2 (__X32_SYSCALL_BIT + 437)
 #define __NR_pidfd_getfd (__X32_SYSCALL_BIT + 438)
 #define __NR_faccessat2 (__X32_SYSCALL_BIT + 439)
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index a28c3667370b..b4bd05d09135 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -289,6 +289,7 @@ struct kvm_run {
 		/* KVM_EXIT_FAIL_ENTRY */
 		struct {
 			__u64 hardware_entry_failure_reason;
+			__u32 cpu;
 		} fail_entry;
 		/* KVM_EXIT_EXCEPTION */
 		struct {
@@ -1031,6 +1032,10 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_PPC_SECURE_GUEST 181
 #define KVM_CAP_HALT_POLL 182
 #define KVM_CAP_ASYNC_PF_INT 183
+#define KVM_CAP_LAST_CPU 184
+#define KVM_CAP_SMALLER_MAXPHYADDR 185
+#define KVM_CAP_S390_DIAG318 186
+#define KVM_CAP_SYS_HYPERV_CPUID 187
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -1489,7 +1494,7 @@ struct kvm_enc_region {
 /* Available with KVM_CAP_MANUAL_DIRTY_LOG_PROTECT_2 */
 #define KVM_CLEAR_DIRTY_LOG          _IOWR(KVMIO, 0xc0, struct kvm_clear_dirty_log)
 
-/* Available with KVM_CAP_HYPERV_CPUID */
+/* Available with KVM_CAP_HYPERV_CPUID (vcpu) / KVM_CAP_SYS_HYPERV_CPUID (system) */
 #define KVM_GET_SUPPORTED_HV_CPUID _IOWR(KVMIO, 0xc1, struct kvm_cpuid2)
 
 /* Available with KVM_CAP_ARM_SVE */
diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h
index f09df262c4b5..a90672494dc5 100644
--- a/linux-headers/linux/vfio.h
+++ b/linux-headers/linux/vfio.h
@@ -1030,7 +1030,7 @@ struct vfio_iommu_type1_info_cap_iova_range {
  * size in bytes that can be used by user applications when getting the dirty
  * bitmap.
  */
-#define VFIO_IOMMU_TYPE1_INFO_CAP_MIGRATION  1
+#define VFIO_IOMMU_TYPE1_INFO_CAP_MIGRATION  2
 
 struct vfio_iommu_type1_info_cap_migration {
 	struct	vfio_info_cap_header header;
-- 
2.25.4


