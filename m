Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1B369A211
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 00:04:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSnGP-0001qz-M3; Thu, 16 Feb 2023 18:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pSnGM-0001q3-KK
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:02:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pSnGH-0005UB-Mx
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:02:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676588516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TGoqsa+5OemKB4kcJ8ad7oYLtiqPxsyrQ6UGpJ1lEGE=;
 b=MvGIDZ8f8vJapxgX6faiqlY1+eb02tMP1gRNHsmeewRjppG3zagAD6vxnmoqqORmI3N3fL
 B9OJCnZIf6yNZqPwOnuf5MQflb0MOoJ1xOuP3W719lOwJ3bsqTU5Jh3WHvrfNJjr0sIz6U
 BHlWAmgouFQM+phja6TBciaAiiKbs4c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-TtCdVtp8PfSRfpuLTFkhsw-1; Thu, 16 Feb 2023 18:01:55 -0500
X-MC-Unique: TtCdVtp8PfSRfpuLTFkhsw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 141AC29324AC;
 Thu, 16 Feb 2023 23:01:55 +0000 (UTC)
Received: from [172.30.41.16] (unknown [10.22.32.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91CD0C15BA0;
 Thu, 16 Feb 2023 23:01:54 +0000 (UTC)
Subject: [PULL 01/12] linux-headers: Update to v6.2-rc8
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, avihaih@nvidia.com, clg@redhat.com
Date: Thu, 16 Feb 2023 16:01:54 -0700
Message-ID: <167658851416.932837.215079719476685304.stgit@omen>
In-Reply-To: <167658846945.932837.1420176491103357684.stgit@omen>
References: <167658846945.932837.1420176491103357684.stgit@omen>
User-Agent: StGit/1.5.dev2+g9ce680a52bd9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Avihai Horon <avihaih@nvidia.com>

Update to commit ceaa837f96ad ("Linux 6.2-rc8").

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Link: https://lore.kernel.org/r/20230216143630.25610-2-avihaih@nvidia.com
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 include/standard-headers/drm/drm_fourcc.h          |   29 ++++
 include/standard-headers/linux/ethtool.h           |   18 ++-
 include/standard-headers/linux/fuse.h              |   16 ++
 include/standard-headers/linux/input-event-codes.h |    3 
 include/standard-headers/linux/pci_regs.h          |    2 
 include/standard-headers/linux/virtio_bt.h         |    8 +
 include/standard-headers/linux/virtio_net.h        |    4 +
 linux-headers/asm-arm64/kvm.h                      |    1 
 linux-headers/asm-riscv/kvm.h                      |    3 
 linux-headers/asm-x86/kvm.h                        |   11 --
 linux-headers/linux/kvm.h                          |   34 +++--
 linux-headers/linux/psci.h                         |    4 -
 linux-headers/linux/vfio.h                         |  136 +++++++++++++++++++-
 13 files changed, 230 insertions(+), 39 deletions(-)

diff --git a/include/standard-headers/drm/drm_fourcc.h b/include/standard-headers/drm/drm_fourcc.h
index b868488f93e1..69cab17b383f 100644
--- a/include/standard-headers/drm/drm_fourcc.h
+++ b/include/standard-headers/drm/drm_fourcc.h
@@ -743,6 +743,35 @@ extern "C" {
  */
 #define DRM_FORMAT_MOD_VIVANTE_SPLIT_SUPER_TILED fourcc_mod_code(VIVANTE, 4)
 
+/*
+ * Vivante TS (tile-status) buffer modifiers. They can be combined with all of
+ * the color buffer tiling modifiers defined above. When TS is present it's a
+ * separate buffer containing the clear/compression status of each tile. The
+ * modifiers are defined as VIVANTE_MOD_TS_c_s, where c is the color buffer
+ * tile size in bytes covered by one entry in the status buffer and s is the
+ * number of status bits per entry.
+ * We reserve the top 8 bits of the Vivante modifier space for tile status
+ * clear/compression modifiers, as future cores might add some more TS layout
+ * variations.
+ */
+#define VIVANTE_MOD_TS_64_4               (1ULL << 48)
+#define VIVANTE_MOD_TS_64_2               (2ULL << 48)
+#define VIVANTE_MOD_TS_128_4              (3ULL << 48)
+#define VIVANTE_MOD_TS_256_4              (4ULL << 48)
+#define VIVANTE_MOD_TS_MASK               (0xfULL << 48)
+
+/*
+ * Vivante compression modifiers. Those depend on a TS modifier being present
+ * as the TS bits get reinterpreted as compression tags instead of simple
+ * clear markers when compression is enabled.
+ */
+#define VIVANTE_MOD_COMP_DEC400           (1ULL << 52)
+#define VIVANTE_MOD_COMP_MASK             (0xfULL << 52)
+
+/* Masking out the extension bits will yield the base modifier. */
+#define VIVANTE_MOD_EXT_MASK              (VIVANTE_MOD_TS_MASK | \
+                                           VIVANTE_MOD_COMP_MASK)
+
 /* NVIDIA frame buffer modifiers */
 
 /*
diff --git a/include/standard-headers/linux/ethtool.h b/include/standard-headers/linux/ethtool.h
index 1dc56cdc0a07..87176ab075d2 100644
--- a/include/standard-headers/linux/ethtool.h
+++ b/include/standard-headers/linux/ethtool.h
@@ -159,8 +159,10 @@ static inline uint32_t ethtool_cmd_speed(const struct ethtool_cmd *ep)
  *	in its bus driver structure (e.g. pci_driver::name).  Must
  *	not be an empty string.
  * @version: Driver version string; may be an empty string
- * @fw_version: Firmware version string; may be an empty string
- * @erom_version: Expansion ROM version string; may be an empty string
+ * @fw_version: Firmware version string; driver defined; may be an
+ *	empty string
+ * @erom_version: Expansion ROM version string; driver defined; may be
+ *	an empty string
  * @bus_info: Device bus address.  This should match the dev_name()
  *	string for the underlying bus device, if there is one.  May be
  *	an empty string.
@@ -179,10 +181,6 @@ static inline uint32_t ethtool_cmd_speed(const struct ethtool_cmd *ep)
  *
  * Users can use the %ETHTOOL_GSSET_INFO command to get the number of
  * strings in any string set (from Linux 2.6.34).
- *
- * Drivers should set at most @driver, @version, @fw_version and
- * @bus_info in their get_drvinfo() implementation.  The ethtool
- * core fills in the other fields using other driver operations.
  */
 struct ethtool_drvinfo {
 	uint32_t	cmd;
@@ -1737,6 +1735,13 @@ enum ethtool_link_mode_bit_indices {
 	ETHTOOL_LINK_MODE_100baseFX_Half_BIT		 = 90,
 	ETHTOOL_LINK_MODE_100baseFX_Full_BIT		 = 91,
 	ETHTOOL_LINK_MODE_10baseT1L_Full_BIT		 = 92,
+	ETHTOOL_LINK_MODE_800000baseCR8_Full_BIT	 = 93,
+	ETHTOOL_LINK_MODE_800000baseKR8_Full_BIT	 = 94,
+	ETHTOOL_LINK_MODE_800000baseDR8_Full_BIT	 = 95,
+	ETHTOOL_LINK_MODE_800000baseDR8_2_Full_BIT	 = 96,
+	ETHTOOL_LINK_MODE_800000baseSR8_Full_BIT	 = 97,
+	ETHTOOL_LINK_MODE_800000baseVR8_Full_BIT	 = 98,
+
 	/* must be last entry */
 	__ETHTOOL_LINK_MODE_MASK_NBITS
 };
@@ -1848,6 +1853,7 @@ enum ethtool_link_mode_bit_indices {
 #define SPEED_100000		100000
 #define SPEED_200000		200000
 #define SPEED_400000		400000
+#define SPEED_800000		800000
 
 #define SPEED_UNKNOWN		-1
 
diff --git a/include/standard-headers/linux/fuse.h b/include/standard-headers/linux/fuse.h
index 713d2597685f..a1af78d9894e 100644
--- a/include/standard-headers/linux/fuse.h
+++ b/include/standard-headers/linux/fuse.h
@@ -197,6 +197,10 @@
  *
  *  7.37
  *  - add FUSE_TMPFILE
+ *
+ *  7.38
+ *  - add FUSE_EXPIRE_ONLY flag to fuse_notify_inval_entry
+ *  - add FOPEN_PARALLEL_DIRECT_WRITES
  */
 
 #ifndef _LINUX_FUSE_H
@@ -228,7 +232,7 @@
 #define FUSE_KERNEL_VERSION 7
 
 /** Minor version number of this interface */
-#define FUSE_KERNEL_MINOR_VERSION 37
+#define FUSE_KERNEL_MINOR_VERSION 38
 
 /** The node ID of the root inode */
 #define FUSE_ROOT_ID 1
@@ -300,6 +304,7 @@ struct fuse_file_lock {
  * FOPEN_CACHE_DIR: allow caching this directory
  * FOPEN_STREAM: the file is stream-like (no file position at all)
  * FOPEN_NOFLUSH: don't flush data cache on close (unless FUSE_WRITEBACK_CACHE)
+ * FOPEN_PARALLEL_DIRECT_WRITES: Allow concurrent direct writes on the same inode
  */
 #define FOPEN_DIRECT_IO		(1 << 0)
 #define FOPEN_KEEP_CACHE	(1 << 1)
@@ -307,6 +312,7 @@ struct fuse_file_lock {
 #define FOPEN_CACHE_DIR		(1 << 3)
 #define FOPEN_STREAM		(1 << 4)
 #define FOPEN_NOFLUSH		(1 << 5)
+#define FOPEN_PARALLEL_DIRECT_WRITES	(1 << 6)
 
 /**
  * INIT request/reply flags
@@ -487,6 +493,12 @@ struct fuse_file_lock {
  */
 #define FUSE_SETXATTR_ACL_KILL_SGID	(1 << 0)
 
+/**
+ * notify_inval_entry flags
+ * FUSE_EXPIRE_ONLY
+ */
+#define FUSE_EXPIRE_ONLY		(1 << 0)
+
 enum fuse_opcode {
 	FUSE_LOOKUP		= 1,
 	FUSE_FORGET		= 2,  /* no reply */
@@ -915,7 +927,7 @@ struct fuse_notify_inval_inode_out {
 struct fuse_notify_inval_entry_out {
 	uint64_t	parent;
 	uint32_t	namelen;
-	uint32_t	padding;
+	uint32_t	flags;
 };
 
 struct fuse_notify_delete_out {
diff --git a/include/standard-headers/linux/input-event-codes.h b/include/standard-headers/linux/input-event-codes.h
index 815f7a1dff73..f6bab08540d8 100644
--- a/include/standard-headers/linux/input-event-codes.h
+++ b/include/standard-headers/linux/input-event-codes.h
@@ -614,6 +614,9 @@
 #define KEY_KBD_LAYOUT_NEXT	0x248	/* AC Next Keyboard Layout Select */
 #define KEY_EMOJI_PICKER	0x249	/* Show/hide emoji picker (HUTRR101) */
 #define KEY_DICTATE		0x24a	/* Start or Stop Voice Dictation Session (HUTRR99) */
+#define KEY_CAMERA_ACCESS_ENABLE	0x24b	/* Enables programmatic access to camera devices. (HUTRR72) */
+#define KEY_CAMERA_ACCESS_DISABLE	0x24c	/* Disables programmatic access to camera devices. (HUTRR72) */
+#define KEY_CAMERA_ACCESS_TOGGLE	0x24d	/* Toggles the current state of the camera access control. (HUTRR72) */
 
 #define KEY_BRIGHTNESS_MIN		0x250	/* Set Brightness to Minimum */
 #define KEY_BRIGHTNESS_MAX		0x251	/* Set Brightness to Maximum */
diff --git a/include/standard-headers/linux/pci_regs.h b/include/standard-headers/linux/pci_regs.h
index 57b8e2ffb1dd..85ab1278811e 100644
--- a/include/standard-headers/linux/pci_regs.h
+++ b/include/standard-headers/linux/pci_regs.h
@@ -1058,6 +1058,7 @@
 /* Precision Time Measurement */
 #define PCI_PTM_CAP			0x04	    /* PTM Capability */
 #define  PCI_PTM_CAP_REQ		0x00000001  /* Requester capable */
+#define  PCI_PTM_CAP_RES		0x00000002  /* Responder capable */
 #define  PCI_PTM_CAP_ROOT		0x00000004  /* Root capable */
 #define  PCI_PTM_GRANULARITY_MASK	0x0000FF00  /* Clock granularity */
 #define PCI_PTM_CTRL			0x08	    /* PTM Control */
@@ -1119,6 +1120,7 @@
 #define  PCI_DOE_STATUS_DATA_OBJECT_READY	0x80000000  /* Data Object Ready */
 #define PCI_DOE_WRITE		0x10    /* DOE Write Data Mailbox Register */
 #define PCI_DOE_READ		0x14    /* DOE Read Data Mailbox Register */
+#define PCI_DOE_CAP_SIZEOF	0x18	/* Size of DOE register block */
 
 /* DOE Data Object - note not actually registers */
 #define PCI_DOE_DATA_OBJECT_HEADER_1_VID		0x0000ffff
diff --git a/include/standard-headers/linux/virtio_bt.h b/include/standard-headers/linux/virtio_bt.h
index 245e1eff4b9d..a11ecc3f92df 100644
--- a/include/standard-headers/linux/virtio_bt.h
+++ b/include/standard-headers/linux/virtio_bt.h
@@ -9,6 +9,7 @@
 #define VIRTIO_BT_F_VND_HCI	0	/* Indicates vendor command support */
 #define VIRTIO_BT_F_MSFT_EXT	1	/* Indicates MSFT vendor support */
 #define VIRTIO_BT_F_AOSP_EXT	2	/* Indicates AOSP vendor support */
+#define VIRTIO_BT_F_CONFIG_V2	3	/* Use second version configuration */
 
 enum virtio_bt_config_type {
 	VIRTIO_BT_CONFIG_TYPE_PRIMARY	= 0,
@@ -28,4 +29,11 @@ struct virtio_bt_config {
 	uint16_t msft_opcode;
 } QEMU_PACKED;
 
+struct virtio_bt_config_v2 {
+	uint8_t  type;
+	uint8_t  alignment;
+	uint16_t vendor;
+	uint16_t msft_opcode;
+};
+
 #endif /* _LINUX_VIRTIO_BT_H */
diff --git a/include/standard-headers/linux/virtio_net.h b/include/standard-headers/linux/virtio_net.h
index 42c68caf719d..c0e797067aae 100644
--- a/include/standard-headers/linux/virtio_net.h
+++ b/include/standard-headers/linux/virtio_net.h
@@ -57,6 +57,9 @@
 					 * Steering */
 #define VIRTIO_NET_F_CTRL_MAC_ADDR 23	/* Set MAC address */
 #define VIRTIO_NET_F_NOTF_COAL	53	/* Device supports notifications coalescing */
+#define VIRTIO_NET_F_GUEST_USO4	54	/* Guest can handle USOv4 in. */
+#define VIRTIO_NET_F_GUEST_USO6	55	/* Guest can handle USOv6 in. */
+#define VIRTIO_NET_F_HOST_USO	56	/* Host can handle USO in. */
 #define VIRTIO_NET_F_HASH_REPORT  57	/* Supports hash report */
 #define VIRTIO_NET_F_RSS	  60	/* Supports RSS RX steering */
 #define VIRTIO_NET_F_RSC_EXT	  61	/* extended coalescing info */
@@ -130,6 +133,7 @@ struct virtio_net_hdr_v1 {
 #define VIRTIO_NET_HDR_GSO_TCPV4	1	/* GSO frame, IPv4 TCP (TSO) */
 #define VIRTIO_NET_HDR_GSO_UDP		3	/* GSO frame, IPv4 UDP (UFO) */
 #define VIRTIO_NET_HDR_GSO_TCPV6	4	/* GSO frame, IPv6 TCP */
+#define VIRTIO_NET_HDR_GSO_UDP_L4	5	/* GSO frame, IPv4& IPv6 UDP (USO) */
 #define VIRTIO_NET_HDR_GSO_ECN		0x80	/* TCP has ECN set */
 	uint8_t gso_type;
 	__virtio16 hdr_len;	/* Ethernet + IP + tcp/udp hdrs */
diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index 4bf2d7246e5c..a7cfefb3a809 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -43,6 +43,7 @@
 #define __KVM_HAVE_VCPU_EVENTS
 
 #define KVM_COALESCED_MMIO_PAGE_OFFSET 1
+#define KVM_DIRTY_LOG_PAGE_OFFSET 64
 
 #define KVM_REG_SIZE(id)						\
 	(1U << (((id) & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT))
diff --git a/linux-headers/asm-riscv/kvm.h b/linux-headers/asm-riscv/kvm.h
index 8985ff234c01..92af6f3f057c 100644
--- a/linux-headers/asm-riscv/kvm.h
+++ b/linux-headers/asm-riscv/kvm.h
@@ -49,6 +49,9 @@ struct kvm_sregs {
 struct kvm_riscv_config {
 	unsigned long isa;
 	unsigned long zicbom_block_size;
+	unsigned long mvendorid;
+	unsigned long marchid;
+	unsigned long mimpid;
 };
 
 /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
diff --git a/linux-headers/asm-x86/kvm.h b/linux-headers/asm-x86/kvm.h
index 46de10a809ec..2747d2ce14fb 100644
--- a/linux-headers/asm-x86/kvm.h
+++ b/linux-headers/asm-x86/kvm.h
@@ -53,14 +53,6 @@
 /* Architectural interrupt line count. */
 #define KVM_NR_INTERRUPTS 256
 
-struct kvm_memory_alias {
-	__u32 slot;  /* this has a different namespace than memory slots */
-	__u32 flags;
-	__u64 guest_phys_addr;
-	__u64 memory_size;
-	__u64 target_phys_addr;
-};
-
 /* for KVM_GET_IRQCHIP and KVM_SET_IRQCHIP */
 struct kvm_pic_state {
 	__u8 last_irr;	/* edge detection */
@@ -214,6 +206,8 @@ struct kvm_msr_list {
 struct kvm_msr_filter_range {
 #define KVM_MSR_FILTER_READ  (1 << 0)
 #define KVM_MSR_FILTER_WRITE (1 << 1)
+#define KVM_MSR_FILTER_RANGE_VALID_MASK (KVM_MSR_FILTER_READ | \
+					 KVM_MSR_FILTER_WRITE)
 	__u32 flags;
 	__u32 nmsrs; /* number of msrs in bitmap */
 	__u32 base;  /* MSR index the bitmap starts at */
@@ -224,6 +218,7 @@ struct kvm_msr_filter_range {
 struct kvm_msr_filter {
 #define KVM_MSR_FILTER_DEFAULT_ALLOW (0 << 0)
 #define KVM_MSR_FILTER_DEFAULT_DENY  (1 << 0)
+#define KVM_MSR_FILTER_VALID_MASK (KVM_MSR_FILTER_DEFAULT_DENY)
 	__u32 flags;
 	struct kvm_msr_filter_range ranges[KVM_MSR_FILTER_MAX_RANGES];
 };
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index b2783c520264..1e2c16cfe303 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -86,14 +86,6 @@ struct kvm_debug_guest {
 /* *** End of deprecated interfaces *** */
 
 
-/* for KVM_CREATE_MEMORY_REGION */
-struct kvm_memory_region {
-	__u32 slot;
-	__u32 flags;
-	__u64 guest_phys_addr;
-	__u64 memory_size; /* bytes */
-};
-
 /* for KVM_SET_USER_MEMORY_REGION */
 struct kvm_userspace_memory_region {
 	__u32 slot;
@@ -104,9 +96,9 @@ struct kvm_userspace_memory_region {
 };
 
 /*
- * The bit 0 ~ bit 15 of kvm_memory_region::flags are visible for userspace,
- * other bits are reserved for kvm internal use which are defined in
- * include/linux/kvm_host.h.
+ * The bit 0 ~ bit 15 of kvm_userspace_memory_region::flags are visible for
+ * userspace, other bits are reserved for kvm internal use which are defined
+ * in include/linux/kvm_host.h.
  */
 #define KVM_MEM_LOG_DIRTY_PAGES	(1UL << 0)
 #define KVM_MEM_READONLY	(1UL << 1)
@@ -483,6 +475,9 @@ struct kvm_run {
 #define KVM_MSR_EXIT_REASON_INVAL	(1 << 0)
 #define KVM_MSR_EXIT_REASON_UNKNOWN	(1 << 1)
 #define KVM_MSR_EXIT_REASON_FILTER	(1 << 2)
+#define KVM_MSR_EXIT_REASON_VALID_MASK	(KVM_MSR_EXIT_REASON_INVAL   |	\
+					 KVM_MSR_EXIT_REASON_UNKNOWN |	\
+					 KVM_MSR_EXIT_REASON_FILTER)
 			__u32 reason; /* kernel -> user */
 			__u32 index; /* kernel -> user */
 			__u64 data; /* kernel <-> user */
@@ -1176,6 +1171,8 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_S390_ZPCI_OP 221
 #define KVM_CAP_S390_CPU_TOPOLOGY 222
 #define KVM_CAP_DIRTY_LOG_RING_ACQ_REL 223
+#define KVM_CAP_S390_PROTECTED_ASYNC_DISABLE 224
+#define KVM_CAP_DIRTY_LOG_RING_WITH_BITMAP 225
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -1265,6 +1262,7 @@ struct kvm_x86_mce {
 #define KVM_XEN_HVM_CONFIG_RUNSTATE		(1 << 3)
 #define KVM_XEN_HVM_CONFIG_EVTCHN_2LEVEL	(1 << 4)
 #define KVM_XEN_HVM_CONFIG_EVTCHN_SEND		(1 << 5)
+#define KVM_XEN_HVM_CONFIG_RUNSTATE_UPDATE_FLAG	(1 << 6)
 
 struct kvm_xen_hvm_config {
 	__u32 flags;
@@ -1435,18 +1433,12 @@ struct kvm_vfio_spapr_tce {
 	__s32	tablefd;
 };
 
-/*
- * ioctls for VM fds
- */
-#define KVM_SET_MEMORY_REGION     _IOW(KVMIO,  0x40, struct kvm_memory_region)
 /*
  * KVM_CREATE_VCPU receives as a parameter the vcpu slot, and returns
  * a vcpu fd.
  */
 #define KVM_CREATE_VCPU           _IO(KVMIO,   0x41)
 #define KVM_GET_DIRTY_LOG         _IOW(KVMIO,  0x42, struct kvm_dirty_log)
-/* KVM_SET_MEMORY_ALIAS is obsolete: */
-#define KVM_SET_MEMORY_ALIAS      _IOW(KVMIO,  0x43, struct kvm_memory_alias)
 #define KVM_SET_NR_MMU_PAGES      _IO(KVMIO,   0x44)
 #define KVM_GET_NR_MMU_PAGES      _IO(KVMIO,   0x45)
 #define KVM_SET_USER_MEMORY_REGION _IOW(KVMIO, 0x46, \
@@ -1738,6 +1730,8 @@ enum pv_cmd_id {
 	KVM_PV_UNSHARE_ALL,
 	KVM_PV_INFO,
 	KVM_PV_DUMP,
+	KVM_PV_ASYNC_CLEANUP_PREPARE,
+	KVM_PV_ASYNC_CLEANUP_PERFORM,
 };
 
 struct kvm_pv_cmd {
@@ -1768,8 +1762,10 @@ struct kvm_xen_hvm_attr {
 	union {
 		__u8 long_mode;
 		__u8 vector;
+		__u8 runstate_update_flag;
 		struct {
 			__u64 gfn;
+#define KVM_XEN_INVALID_GFN ((__u64)-1)
 		} shared_info;
 		struct {
 			__u32 send_port;
@@ -1801,6 +1797,7 @@ struct kvm_xen_hvm_attr {
 	} u;
 };
 
+
 /* Available with KVM_CAP_XEN_HVM / KVM_XEN_HVM_CONFIG_SHARED_INFO */
 #define KVM_XEN_ATTR_TYPE_LONG_MODE		0x0
 #define KVM_XEN_ATTR_TYPE_SHARED_INFO		0x1
@@ -1808,6 +1805,8 @@ struct kvm_xen_hvm_attr {
 /* Available with KVM_CAP_XEN_HVM / KVM_XEN_HVM_CONFIG_EVTCHN_SEND */
 #define KVM_XEN_ATTR_TYPE_EVTCHN		0x3
 #define KVM_XEN_ATTR_TYPE_XEN_VERSION		0x4
+/* Available with KVM_CAP_XEN_HVM / KVM_XEN_HVM_CONFIG_RUNSTATE_UPDATE_FLAG */
+#define KVM_XEN_ATTR_TYPE_RUNSTATE_UPDATE_FLAG	0x5
 
 /* Per-vCPU Xen attributes */
 #define KVM_XEN_VCPU_GET_ATTR	_IOWR(KVMIO, 0xca, struct kvm_xen_vcpu_attr)
@@ -1824,6 +1823,7 @@ struct kvm_xen_vcpu_attr {
 	__u16 pad[3];
 	union {
 		__u64 gpa;
+#define KVM_XEN_INVALID_GPA ((__u64)-1)
 		__u64 pad[8];
 		struct {
 			__u64 state;
diff --git a/linux-headers/linux/psci.h b/linux-headers/linux/psci.h
index e60dfd890755..74f3cb5007c9 100644
--- a/linux-headers/linux/psci.h
+++ b/linux-headers/linux/psci.h
@@ -58,7 +58,7 @@
 
 #define PSCI_1_1_FN_SYSTEM_RESET2		PSCI_0_2_FN(18)
 #define PSCI_1_1_FN_MEM_PROTECT			PSCI_0_2_FN(19)
-#define PSCI_1_1_FN_MEM_PROTECT_CHECK_RANGE	PSCI_0_2_FN(19)
+#define PSCI_1_1_FN_MEM_PROTECT_CHECK_RANGE	PSCI_0_2_FN(20)
 
 #define PSCI_1_0_FN64_CPU_DEFAULT_SUSPEND	PSCI_0_2_FN64(12)
 #define PSCI_1_0_FN64_NODE_HW_STATE		PSCI_0_2_FN64(13)
@@ -67,7 +67,7 @@
 #define PSCI_1_0_FN64_STAT_COUNT		PSCI_0_2_FN64(17)
 
 #define PSCI_1_1_FN64_SYSTEM_RESET2		PSCI_0_2_FN64(18)
-#define PSCI_1_1_FN64_MEM_PROTECT_CHECK_RANGE	PSCI_0_2_FN64(19)
+#define PSCI_1_1_FN64_MEM_PROTECT_CHECK_RANGE	PSCI_0_2_FN64(20)
 
 /* PSCI v0.2 power state encoding for CPU_SUSPEND function */
 #define PSCI_0_2_POWER_STATE_ID_MASK		0xffff
diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h
index bee7e42198f3..c59692ce0bce 100644
--- a/linux-headers/linux/vfio.h
+++ b/linux-headers/linux/vfio.h
@@ -819,12 +819,20 @@ struct vfio_device_feature {
  * VFIO_MIGRATION_STOP_COPY | VFIO_MIGRATION_P2P means that RUNNING_P2P
  * is supported in addition to the STOP_COPY states.
  *
+ * VFIO_MIGRATION_STOP_COPY | VFIO_MIGRATION_PRE_COPY means that
+ * PRE_COPY is supported in addition to the STOP_COPY states.
+ *
+ * VFIO_MIGRATION_STOP_COPY | VFIO_MIGRATION_P2P | VFIO_MIGRATION_PRE_COPY
+ * means that RUNNING_P2P, PRE_COPY and PRE_COPY_P2P are supported
+ * in addition to the STOP_COPY states.
+ *
  * Other combinations of flags have behavior to be defined in the future.
  */
 struct vfio_device_feature_migration {
 	__aligned_u64 flags;
 #define VFIO_MIGRATION_STOP_COPY	(1 << 0)
 #define VFIO_MIGRATION_P2P		(1 << 1)
+#define VFIO_MIGRATION_PRE_COPY		(1 << 2)
 };
 #define VFIO_DEVICE_FEATURE_MIGRATION 1
 
@@ -875,8 +883,13 @@ struct vfio_device_feature_mig_state {
  *  RESUMING - The device is stopped and is loading a new internal state
  *  ERROR - The device has failed and must be reset
  *
- * And 1 optional state to support VFIO_MIGRATION_P2P:
+ * And optional states to support VFIO_MIGRATION_P2P:
  *  RUNNING_P2P - RUNNING, except the device cannot do peer to peer DMA
+ * And VFIO_MIGRATION_PRE_COPY:
+ *  PRE_COPY - The device is running normally but tracking internal state
+ *             changes
+ * And VFIO_MIGRATION_P2P | VFIO_MIGRATION_PRE_COPY:
+ *  PRE_COPY_P2P - PRE_COPY, except the device cannot do peer to peer DMA
  *
  * The FSM takes actions on the arcs between FSM states. The driver implements
  * the following behavior for the FSM arcs:
@@ -908,20 +921,48 @@ struct vfio_device_feature_mig_state {
  *
  *   To abort a RESUMING session the device must be reset.
  *
+ * PRE_COPY -> RUNNING
  * RUNNING_P2P -> RUNNING
  *   While in RUNNING the device is fully operational, the device may generate
  *   interrupts, DMA, respond to MMIO, all vfio device regions are functional,
  *   and the device may advance its internal state.
  *
+ *   The PRE_COPY arc will terminate a data transfer session.
+ *
+ * PRE_COPY_P2P -> RUNNING_P2P
  * RUNNING -> RUNNING_P2P
  * STOP -> RUNNING_P2P
  *   While in RUNNING_P2P the device is partially running in the P2P quiescent
  *   state defined below.
  *
+ *   The PRE_COPY_P2P arc will terminate a data transfer session.
+ *
+ * RUNNING -> PRE_COPY
+ * RUNNING_P2P -> PRE_COPY_P2P
  * STOP -> STOP_COPY
- *   This arc begin the process of saving the device state and will return a
- *   new data_fd.
+ *   PRE_COPY, PRE_COPY_P2P and STOP_COPY form the "saving group" of states
+ *   which share a data transfer session. Moving between these states alters
+ *   what is streamed in session, but does not terminate or otherwise affect
+ *   the associated fd.
+ *
+ *   These arcs begin the process of saving the device state and will return a
+ *   new data_fd. The migration driver may perform actions such as enabling
+ *   dirty logging of device state when entering PRE_COPY or PER_COPY_P2P.
+ *
+ *   Each arc does not change the device operation, the device remains
+ *   RUNNING, P2P quiesced or in STOP. The STOP_COPY state is described below
+ *   in PRE_COPY_P2P -> STOP_COPY.
  *
+ * PRE_COPY -> PRE_COPY_P2P
+ *   Entering PRE_COPY_P2P continues all the behaviors of PRE_COPY above.
+ *   However, while in the PRE_COPY_P2P state, the device is partially running
+ *   in the P2P quiescent state defined below, like RUNNING_P2P.
+ *
+ * PRE_COPY_P2P -> PRE_COPY
+ *   This arc allows returning the device to a full RUNNING behavior while
+ *   continuing all the behaviors of PRE_COPY.
+ *
+ * PRE_COPY_P2P -> STOP_COPY
  *   While in the STOP_COPY state the device has the same behavior as STOP
  *   with the addition that the data transfers session continues to stream the
  *   migration state. End of stream on the FD indicates the entire device
@@ -939,6 +980,13 @@ struct vfio_device_feature_mig_state {
  *   device state for this arc if required to prepare the device to receive the
  *   migration data.
  *
+ * STOP_COPY -> PRE_COPY
+ * STOP_COPY -> PRE_COPY_P2P
+ *   These arcs are not permitted and return error if requested. Future
+ *   revisions of this API may define behaviors for these arcs, in this case
+ *   support will be discoverable by a new flag in
+ *   VFIO_DEVICE_FEATURE_MIGRATION.
+ *
  * any -> ERROR
  *   ERROR cannot be specified as a device state, however any transition request
  *   can be failed with an errno return and may then move the device_state into
@@ -950,7 +998,7 @@ struct vfio_device_feature_mig_state {
  * The optional peer to peer (P2P) quiescent state is intended to be a quiescent
  * state for the device for the purposes of managing multiple devices within a
  * user context where peer-to-peer DMA between devices may be active. The
- * RUNNING_P2P states must prevent the device from initiating
+ * RUNNING_P2P and PRE_COPY_P2P states must prevent the device from initiating
  * any new P2P DMA transactions. If the device can identify P2P transactions
  * then it can stop only P2P DMA, otherwise it must stop all DMA. The migration
  * driver must complete any such outstanding operations prior to completing the
@@ -963,6 +1011,8 @@ struct vfio_device_feature_mig_state {
  * above FSM arcs. As there are multiple paths through the FSM arcs the path
  * should be selected based on the following rules:
  *   - Select the shortest path.
+ *   - The path cannot have saving group states as interior arcs, only
+ *     starting/end states.
  * Refer to vfio_mig_get_next_state() for the result of the algorithm.
  *
  * The automatic transit through the FSM arcs that make up the combination
@@ -976,6 +1026,9 @@ struct vfio_device_feature_mig_state {
  * support them. The user can discover if these states are supported by using
  * VFIO_DEVICE_FEATURE_MIGRATION. By using combination transitions the user can
  * avoid knowing about these optional states if the kernel driver supports them.
+ *
+ * Arcs touching PRE_COPY and PRE_COPY_P2P are removed if support for PRE_COPY
+ * is not present.
  */
 enum vfio_device_mig_state {
 	VFIO_DEVICE_STATE_ERROR = 0,
@@ -984,8 +1037,70 @@ enum vfio_device_mig_state {
 	VFIO_DEVICE_STATE_STOP_COPY = 3,
 	VFIO_DEVICE_STATE_RESUMING = 4,
 	VFIO_DEVICE_STATE_RUNNING_P2P = 5,
+	VFIO_DEVICE_STATE_PRE_COPY = 6,
+	VFIO_DEVICE_STATE_PRE_COPY_P2P = 7,
+};
+
+/**
+ * VFIO_MIG_GET_PRECOPY_INFO - _IO(VFIO_TYPE, VFIO_BASE + 21)
+ *
+ * This ioctl is used on the migration data FD in the precopy phase of the
+ * migration data transfer. It returns an estimate of the current data sizes
+ * remaining to be transferred. It allows the user to judge when it is
+ * appropriate to leave PRE_COPY for STOP_COPY.
+ *
+ * This ioctl is valid only in PRE_COPY states and kernel driver should
+ * return -EINVAL from any other migration state.
+ *
+ * The vfio_precopy_info data structure returned by this ioctl provides
+ * estimates of data available from the device during the PRE_COPY states.
+ * This estimate is split into two categories, initial_bytes and
+ * dirty_bytes.
+ *
+ * The initial_bytes field indicates the amount of initial precopy
+ * data available from the device. This field should have a non-zero initial
+ * value and decrease as migration data is read from the device.
+ * It is recommended to leave PRE_COPY for STOP_COPY only after this field
+ * reaches zero. Leaving PRE_COPY earlier might make things slower.
+ *
+ * The dirty_bytes field tracks device state changes relative to data
+ * previously retrieved.  This field starts at zero and may increase as
+ * the internal device state is modified or decrease as that modified
+ * state is read from the device.
+ *
+ * Userspace may use the combination of these fields to estimate the
+ * potential data size available during the PRE_COPY phases, as well as
+ * trends relative to the rate the device is dirtying its internal
+ * state, but these fields are not required to have any bearing relative
+ * to the data size available during the STOP_COPY phase.
+ *
+ * Drivers have a lot of flexibility in when and what they transfer during the
+ * PRE_COPY phase, and how they report this from VFIO_MIG_GET_PRECOPY_INFO.
+ *
+ * During pre-copy the migration data FD has a temporary "end of stream" that is
+ * reached when both initial_bytes and dirty_byte are zero. For instance, this
+ * may indicate that the device is idle and not currently dirtying any internal
+ * state. When read() is done on this temporary end of stream the kernel driver
+ * should return ENOMSG from read(). Userspace can wait for more data (which may
+ * never come) by using poll.
+ *
+ * Once in STOP_COPY the migration data FD has a permanent end of stream
+ * signaled in the usual way by read() always returning 0 and poll always
+ * returning readable. ENOMSG may not be returned in STOP_COPY.
+ * Support for this ioctl is mandatory if a driver claims to support
+ * VFIO_MIGRATION_PRE_COPY.
+ *
+ * Return: 0 on success, -1 and errno set on failure.
+ */
+struct vfio_precopy_info {
+	__u32 argsz;
+	__u32 flags;
+	__aligned_u64 initial_bytes;
+	__aligned_u64 dirty_bytes;
 };
 
+#define VFIO_MIG_GET_PRECOPY_INFO _IO(VFIO_TYPE, VFIO_BASE + 21)
+
 /*
  * Upon VFIO_DEVICE_FEATURE_SET, allow the device to be moved into a low power
  * state with the platform-based power management.  Device use of lower power
@@ -1128,6 +1243,19 @@ struct vfio_device_feature_dma_logging_report {
 
 #define VFIO_DEVICE_FEATURE_DMA_LOGGING_REPORT 8
 
+/*
+ * Upon VFIO_DEVICE_FEATURE_GET read back the estimated data length that will
+ * be required to complete stop copy.
+ *
+ * Note: Can be called on each device state.
+ */
+
+struct vfio_device_feature_mig_data_size {
+	__aligned_u64 stop_copy_length;
+};
+
+#define VFIO_DEVICE_FEATURE_MIG_DATA_SIZE 9
+
 /* -------- API for Type1 VFIO IOMMU -------- */
 
 /**



