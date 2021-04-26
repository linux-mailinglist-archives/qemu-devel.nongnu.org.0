Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB4D36B5BB
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 17:25:22 +0200 (CEST)
Received: from localhost ([::1]:44256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb36v-0007ET-Mf
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 11:25:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lb33q-0004u3-Aw
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 11:22:10 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:47061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lb33l-0008Cr-J7
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 11:22:10 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-wo_7cLM3NjiCwiIjsK-fyA-1; Mon, 26 Apr 2021 11:21:52 -0400
X-MC-Unique: wo_7cLM3NjiCwiIjsK-fyA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26C04871377;
 Mon, 26 Apr 2021 15:21:51 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-148.ams2.redhat.com [10.36.113.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99564610F0;
 Mon, 26 Apr 2021 15:21:48 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [for-6.1 v2 1/2] Update linux headers to 5.12-rc8 + FUSE_SYNCFS
Date: Mon, 26 Apr 2021 17:21:34 +0200
Message-Id: <20210426152135.842037-2-groug@kaod.org>
In-Reply-To: <20210426152135.842037-1-groug@kaod.org>
References: <20210426152135.842037-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: kvm@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 virtio-fs@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

NOT YET IN UPSTREAM LINUX. DO NOT MERGE.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/standard-headers/drm/drm_fourcc.h     | 23 ++++-
 include/standard-headers/linux/ethtool.h      | 54 ++++++-----
 include/standard-headers/linux/fuse.h         | 13 ++-
 include/standard-headers/linux/input.h        |  2 +-
 .../standard-headers/rdma/vmw_pvrdma-abi.h    |  7 ++
 linux-headers/asm-generic/unistd.h            |  4 +-
 linux-headers/asm-mips/unistd_n32.h           |  1 +
 linux-headers/asm-mips/unistd_n64.h           |  1 +
 linux-headers/asm-mips/unistd_o32.h           |  1 +
 linux-headers/asm-powerpc/kvm.h               |  2 +
 linux-headers/asm-powerpc/unistd_32.h         |  1 +
 linux-headers/asm-powerpc/unistd_64.h         |  1 +
 linux-headers/asm-s390/unistd_32.h            |  1 +
 linux-headers/asm-s390/unistd_64.h            |  1 +
 linux-headers/asm-x86/kvm.h                   |  1 +
 linux-headers/asm-x86/unistd_32.h             |  1 +
 linux-headers/asm-x86/unistd_64.h             |  1 +
 linux-headers/asm-x86/unistd_x32.h            |  1 +
 linux-headers/linux/kvm.h                     | 89 +++++++++++++++++++
 linux-headers/linux/vfio.h                    | 27 ++++++
 20 files changed, 205 insertions(+), 27 deletions(-)

diff --git a/include/standard-headers/drm/drm_fourcc.h b/include/standard-h=
eaders/drm/drm_fourcc.h
index c47e19810c05..a61ae520c2db 100644
--- a/include/standard-headers/drm/drm_fourcc.h
+++ b/include/standard-headers/drm/drm_fourcc.h
@@ -526,6 +526,25 @@ extern "C" {
  */
 #define I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS fourcc_mod_code(INTEL, 7)
=20
+/*
+ * Intel Color Control Surface with Clear Color (CCS) for Gen-12 render
+ * compression.
+ *
+ * The main surface is Y-tiled and is at plane index 0 whereas CCS is line=
ar
+ * and at index 1. The clear color is stored at index 2, and the pitch sho=
uld
+ * be ignored. The clear color structure is 256 bits. The first 128 bits
+ * represents Raw Clear Color Red, Green, Blue and Alpha color each repres=
ented
+ * by 32 bits. The raw clear color is consumed by the 3d engine and genera=
tes
+ * the converted clear color of size 64 bits. The first 32 bits store the =
Lower
+ * Converted Clear Color value and the next 32 bits store the Higher Conve=
rted
+ * Clear Color value when applicable. The Converted Clear Color values are
+ * consumed by the DE. The last 64 bits are used to store Color Discard En=
able
+ * and Depth Clear Value Valid which are ignored by the DE. A CCS cache li=
ne
+ * corresponds to an area of 4x1 tiles in the main surface. The main surfa=
ce
+ * pitch is required to be a multiple of 4 tile widths.
+ */
+#define I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC fourcc_mod_code(INTEL, 8)
+
 /*
  * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
  *
@@ -1035,9 +1054,9 @@ drm_fourcc_canonicalize_nvidia_format_mod(uint64_t mo=
difier)
  * Not all combinations are valid, and different SoCs may support differen=
t
  * combinations of layout and options.
  */
-#define __fourcc_mod_amlogic_layout_mask 0xf
+#define __fourcc_mod_amlogic_layout_mask 0xff
 #define __fourcc_mod_amlogic_options_shift 8
-#define __fourcc_mod_amlogic_options_mask 0xf
+#define __fourcc_mod_amlogic_options_mask 0xff
=20
 #define DRM_FORMAT_MOD_AMLOGIC_FBC(__layout, __options) \
 =09fourcc_mod_code(AMLOGIC, \
diff --git a/include/standard-headers/linux/ethtool.h b/include/standard-he=
aders/linux/ethtool.h
index 8bfd01d230da..8e166b3c49dd 100644
--- a/include/standard-headers/linux/ethtool.h
+++ b/include/standard-headers/linux/ethtool.h
@@ -26,6 +26,14 @@
  * have the same layout for 32-bit and 64-bit userland.
  */
=20
+/* Note on reserved space.
+ * Reserved fields must not be accessed directly by user space because
+ * they may be replaced by a different field in the future. They must
+ * be initialized to zero before making the request, e.g. via memset
+ * of the entire structure or implicitly by not being set in a structure
+ * initializer.
+ */
+
 /**
  * struct ethtool_cmd - DEPRECATED, link control and status
  * This structure is DEPRECATED, please use struct ethtool_link_settings.
@@ -67,6 +75,7 @@
  *=09and other link features that the link partner advertised
  *=09through autonegotiation; 0 if unknown or not applicable.
  *=09Read-only.
+ * @reserved: Reserved for future use; see the note on reserved space.
  *
  * The link speed in Mbps is split between @speed and @speed_hi.  Use
  * the ethtool_cmd_speed() and ethtool_cmd_speed_set() functions to
@@ -155,6 +164,7 @@ static inline uint32_t ethtool_cmd_speed(const struct e=
thtool_cmd *ep)
  * @bus_info: Device bus address.  This should match the dev_name()
  *=09string for the underlying bus device, if there is one.  May be
  *=09an empty string.
+ * @reserved2: Reserved for future use; see the note on reserved space.
  * @n_priv_flags: Number of flags valid for %ETHTOOL_GPFLAGS and
  *=09%ETHTOOL_SPFLAGS commands; also the number of strings in the
  *=09%ETH_SS_PRIV_FLAGS set
@@ -356,6 +366,7 @@ struct ethtool_eeprom {
  * @tx_lpi_timer: Time in microseconds the interface delays prior to asser=
ting
  *=09its tx lpi (after reaching 'idle' state). Effective only when eee
  *=09was negotiated and tx_lpi_enabled was set.
+ * @reserved: Reserved for future use; see the note on reserved space.
  */
 struct ethtool_eee {
 =09uint32_t=09cmd;
@@ -374,6 +385,7 @@ struct ethtool_eee {
  * @cmd: %ETHTOOL_GMODULEINFO
  * @type: Standard the module information conforms to %ETH_MODULE_SFF_xxxx
  * @eeprom_len: Length of the eeprom
+ * @reserved: Reserved for future use; see the note on reserved space.
  *
  * This structure is used to return the information to
  * properly size memory for a subsequent call to %ETHTOOL_GMODULEEEPROM.
@@ -579,9 +591,7 @@ struct ethtool_pauseparam {
 =09uint32_t=09tx_pause;
 };
=20
-/**
- * enum ethtool_link_ext_state - link extended state
- */
+/* Link extended state */
 enum ethtool_link_ext_state {
 =09ETHTOOL_LINK_EXT_STATE_AUTONEG,
 =09ETHTOOL_LINK_EXT_STATE_LINK_TRAINING_FAILURE,
@@ -595,10 +605,7 @@ enum ethtool_link_ext_state {
 =09ETHTOOL_LINK_EXT_STATE_OVERHEAT,
 };
=20
-/**
- * enum ethtool_link_ext_substate_autoneg - more information in addition t=
o
- * ETHTOOL_LINK_EXT_STATE_AUTONEG.
- */
+/* More information in addition to ETHTOOL_LINK_EXT_STATE_AUTONEG. */
 enum ethtool_link_ext_substate_autoneg {
 =09ETHTOOL_LINK_EXT_SUBSTATE_AN_NO_PARTNER_DETECTED =3D 1,
 =09ETHTOOL_LINK_EXT_SUBSTATE_AN_ACK_NOT_RECEIVED,
@@ -608,9 +615,7 @@ enum ethtool_link_ext_substate_autoneg {
 =09ETHTOOL_LINK_EXT_SUBSTATE_AN_NO_HCD,
 };
=20
-/**
- * enum ethtool_link_ext_substate_link_training - more information in addi=
tion to
- * ETHTOOL_LINK_EXT_STATE_LINK_TRAINING_FAILURE.
+/* More information in addition to ETHTOOL_LINK_EXT_STATE_LINK_TRAINING_FA=
ILURE.
  */
 enum ethtool_link_ext_substate_link_training {
 =09ETHTOOL_LINK_EXT_SUBSTATE_LT_KR_FRAME_LOCK_NOT_ACQUIRED =3D 1,
@@ -619,9 +624,7 @@ enum ethtool_link_ext_substate_link_training {
 =09ETHTOOL_LINK_EXT_SUBSTATE_LT_REMOTE_FAULT,
 };
=20
-/**
- * enum ethtool_link_ext_substate_logical_mismatch - more information in a=
ddition
- * to ETHTOOL_LINK_EXT_STATE_LINK_LOGICAL_MISMATCH.
+/* More information in addition to ETHTOOL_LINK_EXT_STATE_LINK_LOGICAL_MIS=
MATCH.
  */
 enum ethtool_link_ext_substate_link_logical_mismatch {
 =09ETHTOOL_LINK_EXT_SUBSTATE_LLM_PCS_DID_NOT_ACQUIRE_BLOCK_LOCK =3D 1,
@@ -631,19 +634,14 @@ enum ethtool_link_ext_substate_link_logical_mismatch =
{
 =09ETHTOOL_LINK_EXT_SUBSTATE_LLM_RS_FEC_IS_NOT_LOCKED,
 };
=20
-/**
- * enum ethtool_link_ext_substate_bad_signal_integrity - more information =
in
- * addition to ETHTOOL_LINK_EXT_STATE_BAD_SIGNAL_INTEGRITY.
+/* More information in addition to ETHTOOL_LINK_EXT_STATE_BAD_SIGNAL_INTEG=
RITY.
  */
 enum ethtool_link_ext_substate_bad_signal_integrity {
 =09ETHTOOL_LINK_EXT_SUBSTATE_BSI_LARGE_NUMBER_OF_PHYSICAL_ERRORS =3D 1,
 =09ETHTOOL_LINK_EXT_SUBSTATE_BSI_UNSUPPORTED_RATE,
 };
=20
-/**
- * enum ethtool_link_ext_substate_cable_issue - more information in
- * addition to ETHTOOL_LINK_EXT_STATE_CABLE_ISSUE.
- */
+/* More information in addition to ETHTOOL_LINK_EXT_STATE_CABLE_ISSUE. */
 enum ethtool_link_ext_substate_cable_issue {
 =09ETHTOOL_LINK_EXT_SUBSTATE_CI_UNSUPPORTED_CABLE =3D 1,
 =09ETHTOOL_LINK_EXT_SUBSTATE_CI_CABLE_TEST_FAILURE,
@@ -661,6 +659,7 @@ enum ethtool_link_ext_substate_cable_issue {
  *=09now deprecated
  * @ETH_SS_FEATURES: Device feature names
  * @ETH_SS_RSS_HASH_FUNCS: RSS hush function names
+ * @ETH_SS_TUNABLES: tunable names
  * @ETH_SS_PHY_STATS: Statistic names, for use with %ETHTOOL_GPHYSTATS
  * @ETH_SS_PHY_TUNABLES: PHY tunable names
  * @ETH_SS_LINK_MODES: link mode names
@@ -670,6 +669,8 @@ enum ethtool_link_ext_substate_cable_issue {
  * @ETH_SS_TS_TX_TYPES: timestamping Tx types
  * @ETH_SS_TS_RX_FILTERS: timestamping Rx filters
  * @ETH_SS_UDP_TUNNEL_TYPES: UDP tunnel types
+ *
+ * @ETH_SS_COUNT: number of defined string sets
  */
 enum ethtool_stringset {
 =09ETH_SS_TEST=09=09=3D 0,
@@ -715,6 +716,7 @@ struct ethtool_gstrings {
 /**
  * struct ethtool_sset_info - string set information
  * @cmd: Command number =3D %ETHTOOL_GSSET_INFO
+ * @reserved: Reserved for future use; see the note on reserved space.
  * @sset_mask: On entry, a bitmask of string sets to query, with bits
  *=09numbered according to &enum ethtool_stringset.  On return, a
  *=09bitmask of those string sets queried that are supported.
@@ -759,6 +761,7 @@ enum ethtool_test_flags {
  * @flags: A bitmask of flags from &enum ethtool_test_flags.  Some
  *=09flags may be set by the user on entry; others may be set by
  *=09the driver on return.
+ * @reserved: Reserved for future use; see the note on reserved space.
  * @len: On return, the number of test results
  * @data: Array of test results
  *
@@ -959,6 +962,7 @@ union ethtool_flow_union {
  * @vlan_etype: VLAN EtherType
  * @vlan_tci: VLAN tag control information
  * @data: user defined data
+ * @padding: Reserved for future use; see the note on reserved space.
  *
  * Note, @vlan_etype, @vlan_tci, and @data are only valid if %FLOW_EXT
  * is set in &struct ethtool_rx_flow_spec @flow_type.
@@ -1134,7 +1138,8 @@ struct ethtool_rxfh_indir {
  *=09hardware hash key.
  * @hfunc: Defines the current RSS hash function used by HW (or to be set =
to).
  *=09Valid values are one of the %ETH_RSS_HASH_*.
- * @rsvd:=09Reserved for future extensions.
+ * @rsvd8: Reserved for future use; see the note on reserved space.
+ * @rsvd32: Reserved for future use; see the note on reserved space.
  * @rss_config: RX ring/queue index for each hash value i.e., indirection =
table
  *=09of @indir_size uint32_t elements, followed by hash key of @key_size
  *=09bytes.
@@ -1302,7 +1307,9 @@ struct ethtool_sfeatures {
  * @so_timestamping: bit mask of the sum of the supported SO_TIMESTAMPING =
flags
  * @phc_index: device index of the associated PHC, or -1 if there is none
  * @tx_types: bit mask of the supported hwtstamp_tx_types enumeration valu=
es
+ * @tx_reserved: Reserved for future use; see the note on reserved space.
  * @rx_filters: bit mask of the supported hwtstamp_rx_filters enumeration =
values
+ * @rx_reserved: Reserved for future use; see the note on reserved space.
  *
  * The bits in the 'tx_types' and 'rx_filters' fields correspond to
  * the 'hwtstamp_tx_types' and 'hwtstamp_rx_filters' enumeration values,
@@ -1958,6 +1965,11 @@ enum ethtool_reset_flags {
  *=09autonegotiation; 0 if unknown or not applicable.  Read-only.
  * @transceiver: Used to distinguish different possible PHY types,
  *=09reported consistently by PHYLIB.  Read-only.
+ * @master_slave_cfg: Master/slave port mode.
+ * @master_slave_state: Master/slave port state.
+ * @reserved: Reserved for future use; see the note on reserved space.
+ * @reserved1: Reserved for future use; see the note on reserved space.
+ * @link_mode_masks: Variable length bitmaps.
  *
  * If autonegotiation is disabled, the speed and @duplex represent the
  * fixed link mode and are writable if the driver supports multiple
diff --git a/include/standard-headers/linux/fuse.h b/include/standard-heade=
rs/linux/fuse.h
index 950d7edb7ef6..572f48646dca 100644
--- a/include/standard-headers/linux/fuse.h
+++ b/include/standard-headers/linux/fuse.h
@@ -179,6 +179,9 @@
  *  7.33
  *  - add FUSE_HANDLE_KILLPRIV_V2, FUSE_WRITE_KILL_SUIDGID, FATTR_KILL_SUI=
DGID
  *  - add FUSE_OPEN_KILL_SUIDGID
+ *
+ *  7.34
+ *  - add FUSE_SYNCFS
  */
=20
 #ifndef _LINUX_FUSE_H
@@ -210,7 +213,7 @@
 #define FUSE_KERNEL_VERSION 7
=20
 /** Minor version number of this interface */
-#define FUSE_KERNEL_MINOR_VERSION 33
+#define FUSE_KERNEL_MINOR_VERSION 34
=20
 /** The node ID of the root inode */
 #define FUSE_ROOT_ID 1
@@ -495,6 +498,7 @@ enum fuse_opcode {
 =09FUSE_COPY_FILE_RANGE=09=3D 47,
 =09FUSE_SETUPMAPPING=09=3D 48,
 =09FUSE_REMOVEMAPPING=09=3D 49,
+=09FUSE_SYNCFS=09=09=3D 50,
=20
 =09/* CUSE specific operations */
 =09CUSE_INIT=09=09=3D 4096,
@@ -899,7 +903,8 @@ struct fuse_notify_retrieve_in {
 };
=20
 /* Device ioctls: */
-#define FUSE_DEV_IOC_CLONE=09_IOR(229, 0, uint32_t)
+#define FUSE_DEV_IOC_MAGIC=09=09229
+#define FUSE_DEV_IOC_CLONE=09=09_IOR(FUSE_DEV_IOC_MAGIC, 0, uint32_t)
=20
 struct fuse_lseek_in {
 =09uint64_t=09fh;
@@ -952,4 +957,8 @@ struct fuse_removemapping_one {
 #define FUSE_REMOVEMAPPING_MAX_ENTRY   \
 =09=09(PAGE_SIZE / sizeof(struct fuse_removemapping_one))
=20
+struct fuse_syncfs_in {
+=09uint64_t flags;
+};
+
 #endif /* _LINUX_FUSE_H */
diff --git a/include/standard-headers/linux/input.h b/include/standard-head=
ers/linux/input.h
index f89c986190de..7822c2417849 100644
--- a/include/standard-headers/linux/input.h
+++ b/include/standard-headers/linux/input.h
@@ -81,7 +81,7 @@ struct input_id {
  * in units per radian.
  * When INPUT_PROP_ACCELEROMETER is set the resolution changes.
  * The main axes (ABS_X, ABS_Y, ABS_Z) are then reported in
- * in units per g (units/g) and in units per degree per second
+ * units per g (units/g) and in units per degree per second
  * (units/deg/s) for rotational axes (ABS_RX, ABS_RY, ABS_RZ).
  */
 struct input_absinfo {
diff --git a/include/standard-headers/rdma/vmw_pvrdma-abi.h b/include/stand=
ard-headers/rdma/vmw_pvrdma-abi.h
index 0989426a3f52..c30182a7ae7e 100644
--- a/include/standard-headers/rdma/vmw_pvrdma-abi.h
+++ b/include/standard-headers/rdma/vmw_pvrdma-abi.h
@@ -133,6 +133,13 @@ enum pvrdma_wc_flags {
 =09PVRDMA_WC_FLAGS_MAX=09=09=3D PVRDMA_WC_WITH_NETWORK_HDR_TYPE,
 };
=20
+enum pvrdma_network_type {
+=09PVRDMA_NETWORK_IB,
+=09PVRDMA_NETWORK_ROCE_V1 =3D PVRDMA_NETWORK_IB,
+=09PVRDMA_NETWORK_IPV4,
+=09PVRDMA_NETWORK_IPV6
+};
+
 struct pvrdma_alloc_ucontext_resp {
 =09uint32_t qp_tab_size;
 =09uint32_t reserved;
diff --git a/linux-headers/asm-generic/unistd.h b/linux-headers/asm-generic=
/unistd.h
index 728752917785..ce58cff99b66 100644
--- a/linux-headers/asm-generic/unistd.h
+++ b/linux-headers/asm-generic/unistd.h
@@ -861,9 +861,11 @@ __SYSCALL(__NR_faccessat2, sys_faccessat2)
 __SYSCALL(__NR_process_madvise, sys_process_madvise)
 #define __NR_epoll_pwait2 441
 __SC_COMP(__NR_epoll_pwait2, sys_epoll_pwait2, compat_sys_epoll_pwait2)
+#define __NR_mount_setattr 442
+__SYSCALL(__NR_mount_setattr, sys_mount_setattr)
=20
 #undef __NR_syscalls
-#define __NR_syscalls 442
+#define __NR_syscalls 443
=20
 /*
  * 32 bit systems traditionally used different
diff --git a/linux-headers/asm-mips/unistd_n32.h b/linux-headers/asm-mips/u=
nistd_n32.h
index 59e53b6e076f..2ca45a01225b 100644
--- a/linux-headers/asm-mips/unistd_n32.h
+++ b/linux-headers/asm-mips/unistd_n32.h
@@ -371,6 +371,7 @@
 #define __NR_faccessat2=09(__NR_Linux + 439)
 #define __NR_process_madvise=09(__NR_Linux + 440)
 #define __NR_epoll_pwait2=09(__NR_Linux + 441)
+#define __NR_mount_setattr=09(__NR_Linux + 442)
=20
=20
 #endif /* _ASM_MIPS_UNISTD_N32_H */
diff --git a/linux-headers/asm-mips/unistd_n64.h b/linux-headers/asm-mips/u=
nistd_n64.h
index 683558a7f8ad..c8df45e69cbb 100644
--- a/linux-headers/asm-mips/unistd_n64.h
+++ b/linux-headers/asm-mips/unistd_n64.h
@@ -347,6 +347,7 @@
 #define __NR_faccessat2=09(__NR_Linux + 439)
 #define __NR_process_madvise=09(__NR_Linux + 440)
 #define __NR_epoll_pwait2=09(__NR_Linux + 441)
+#define __NR_mount_setattr=09(__NR_Linux + 442)
=20
=20
 #endif /* _ASM_MIPS_UNISTD_N64_H */
diff --git a/linux-headers/asm-mips/unistd_o32.h b/linux-headers/asm-mips/u=
nistd_o32.h
index ca6a7e5c0b91..10ba4cf9f579 100644
--- a/linux-headers/asm-mips/unistd_o32.h
+++ b/linux-headers/asm-mips/unistd_o32.h
@@ -417,6 +417,7 @@
 #define __NR_faccessat2=09(__NR_Linux + 439)
 #define __NR_process_madvise=09(__NR_Linux + 440)
 #define __NR_epoll_pwait2=09(__NR_Linux + 441)
+#define __NR_mount_setattr=09(__NR_Linux + 442)
=20
=20
 #endif /* _ASM_MIPS_UNISTD_O32_H */
diff --git a/linux-headers/asm-powerpc/kvm.h b/linux-headers/asm-powerpc/kv=
m.h
index c3af3f324c5a..9f18fa090f1f 100644
--- a/linux-headers/asm-powerpc/kvm.h
+++ b/linux-headers/asm-powerpc/kvm.h
@@ -644,6 +644,8 @@ struct kvm_ppc_cpu_char {
 #define KVM_REG_PPC_MMCR3=09(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc1)
 #define KVM_REG_PPC_SIER2=09(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc2)
 #define KVM_REG_PPC_SIER3=09(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc3)
+#define KVM_REG_PPC_DAWR1=09(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc4)
+#define KVM_REG_PPC_DAWRX1=09(KVM_REG_PPC | KVM_REG_SIZE_U64 | 0xc5)
=20
 /* Transactional Memory checkpointed state:
  * This is all GPRs, all VSX regs and a subset of SPRs
diff --git a/linux-headers/asm-powerpc/unistd_32.h b/linux-headers/asm-powe=
rpc/unistd_32.h
index 4624c9004368..1d63e42fc4ec 100644
--- a/linux-headers/asm-powerpc/unistd_32.h
+++ b/linux-headers/asm-powerpc/unistd_32.h
@@ -424,6 +424,7 @@
 #define __NR_faccessat2=09439
 #define __NR_process_madvise=09440
 #define __NR_epoll_pwait2=09441
+#define __NR_mount_setattr=09442
=20
=20
 #endif /* _ASM_POWERPC_UNISTD_32_H */
diff --git a/linux-headers/asm-powerpc/unistd_64.h b/linux-headers/asm-powe=
rpc/unistd_64.h
index 7e851b30bb13..6a8708c0c53d 100644
--- a/linux-headers/asm-powerpc/unistd_64.h
+++ b/linux-headers/asm-powerpc/unistd_64.h
@@ -396,6 +396,7 @@
 #define __NR_faccessat2=09439
 #define __NR_process_madvise=09440
 #define __NR_epoll_pwait2=09441
+#define __NR_mount_setattr=09442
=20
=20
 #endif /* _ASM_POWERPC_UNISTD_64_H */
diff --git a/linux-headers/asm-s390/unistd_32.h b/linux-headers/asm-s390/un=
istd_32.h
index c94d2c3a22d6..e5efe406e3d9 100644
--- a/linux-headers/asm-s390/unistd_32.h
+++ b/linux-headers/asm-s390/unistd_32.h
@@ -414,5 +414,6 @@
 #define __NR_faccessat2 439
 #define __NR_process_madvise 440
 #define __NR_epoll_pwait2 441
+#define __NR_mount_setattr 442
=20
 #endif /* _ASM_S390_UNISTD_32_H */
diff --git a/linux-headers/asm-s390/unistd_64.h b/linux-headers/asm-s390/un=
istd_64.h
index 984a06b7ebe4..f0392fc6c771 100644
--- a/linux-headers/asm-s390/unistd_64.h
+++ b/linux-headers/asm-s390/unistd_64.h
@@ -362,5 +362,6 @@
 #define __NR_faccessat2 439
 #define __NR_process_madvise 440
 #define __NR_epoll_pwait2 441
+#define __NR_mount_setattr 442
=20
 #endif /* _ASM_S390_UNISTD_64_H */
diff --git a/linux-headers/asm-x86/kvm.h b/linux-headers/asm-x86/kvm.h
index 8e76d3701db3..5a3022c8af82 100644
--- a/linux-headers/asm-x86/kvm.h
+++ b/linux-headers/asm-x86/kvm.h
@@ -112,6 +112,7 @@ struct kvm_ioapic_state {
 #define KVM_NR_IRQCHIPS          3
=20
 #define KVM_RUN_X86_SMM=09=09 (1 << 0)
+#define KVM_RUN_X86_BUS_LOCK     (1 << 1)
=20
 /* for KVM_GET_REGS and KVM_SET_REGS */
 struct kvm_regs {
diff --git a/linux-headers/asm-x86/unistd_32.h b/linux-headers/asm-x86/unis=
td_32.h
index 18fb99dfa287..1374427c66fe 100644
--- a/linux-headers/asm-x86/unistd_32.h
+++ b/linux-headers/asm-x86/unistd_32.h
@@ -432,6 +432,7 @@
 #define __NR_faccessat2 439
 #define __NR_process_madvise 440
 #define __NR_epoll_pwait2 441
+#define __NR_mount_setattr 442
=20
=20
 #endif /* _ASM_X86_UNISTD_32_H */
diff --git a/linux-headers/asm-x86/unistd_64.h b/linux-headers/asm-x86/unis=
td_64.h
index bde959328d65..e9d0707bc37f 100644
--- a/linux-headers/asm-x86/unistd_64.h
+++ b/linux-headers/asm-x86/unistd_64.h
@@ -354,6 +354,7 @@
 #define __NR_faccessat2 439
 #define __NR_process_madvise 440
 #define __NR_epoll_pwait2 441
+#define __NR_mount_setattr 442
=20
=20
 #endif /* _ASM_X86_UNISTD_64_H */
diff --git a/linux-headers/asm-x86/unistd_x32.h b/linux-headers/asm-x86/uni=
std_x32.h
index 4ff6b17d3bb4..107aee76f2b1 100644
--- a/linux-headers/asm-x86/unistd_x32.h
+++ b/linux-headers/asm-x86/unistd_x32.h
@@ -307,6 +307,7 @@
 #define __NR_faccessat2 (__X32_SYSCALL_BIT + 439)
 #define __NR_process_madvise (__X32_SYSCALL_BIT + 440)
 #define __NR_epoll_pwait2 (__X32_SYSCALL_BIT + 441)
+#define __NR_mount_setattr (__X32_SYSCALL_BIT + 442)
 #define __NR_rt_sigaction (__X32_SYSCALL_BIT + 512)
 #define __NR_rt_sigreturn (__X32_SYSCALL_BIT + 513)
 #define __NR_ioctl (__X32_SYSCALL_BIT + 514)
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 020b62a619a7..238c6c584725 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -216,6 +216,20 @@ struct kvm_hyperv_exit {
 =09} u;
 };
=20
+struct kvm_xen_exit {
+#define KVM_EXIT_XEN_HCALL          1
+=09__u32 type;
+=09union {
+=09=09struct {
+=09=09=09__u32 longmode;
+=09=09=09__u32 cpl;
+=09=09=09__u64 input;
+=09=09=09__u64 result;
+=09=09=09__u64 params[6];
+=09=09} hcall;
+=09} u;
+};
+
 #define KVM_S390_GET_SKEYS_NONE   1
 #define KVM_S390_SKEYS_MAX        1048576
=20
@@ -251,6 +265,9 @@ struct kvm_hyperv_exit {
 #define KVM_EXIT_X86_RDMSR        29
 #define KVM_EXIT_X86_WRMSR        30
 #define KVM_EXIT_DIRTY_RING_FULL  31
+#define KVM_EXIT_AP_RESET_HOLD    32
+#define KVM_EXIT_X86_BUS_LOCK     33
+#define KVM_EXIT_XEN              34
=20
 /* For KVM_EXIT_INTERNAL_ERROR */
 /* Emulate instruction failed. */
@@ -427,6 +444,8 @@ struct kvm_run {
 =09=09=09__u32 index; /* kernel -> user */
 =09=09=09__u64 data; /* kernel <-> user */
 =09=09} msr;
+=09=09/* KVM_EXIT_XEN */
+=09=09struct kvm_xen_exit xen;
 =09=09/* Fix the size of the union. */
 =09=09char padding[256];
 =09};
@@ -573,6 +592,7 @@ struct kvm_vapic_addr {
 #define KVM_MP_STATE_CHECK_STOP        6
 #define KVM_MP_STATE_OPERATING         7
 #define KVM_MP_STATE_LOAD              8
+#define KVM_MP_STATE_AP_RESET_HOLD     9
=20
 struct kvm_mp_state {
 =09__u32 mp_state;
@@ -1056,6 +1076,8 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_ENFORCE_PV_FEATURE_CPUID 190
 #define KVM_CAP_SYS_HYPERV_CPUID 191
 #define KVM_CAP_DIRTY_LOG_RING 192
+#define KVM_CAP_X86_BUS_LOCK_EXIT 193
+#define KVM_CAP_PPC_DAWR1 194
=20
 #ifdef KVM_CAP_IRQ_ROUTING
=20
@@ -1129,6 +1151,11 @@ struct kvm_x86_mce {
 #endif
=20
 #ifdef KVM_CAP_XEN_HVM
+#define KVM_XEN_HVM_CONFIG_HYPERCALL_MSR=09(1 << 0)
+#define KVM_XEN_HVM_CONFIG_INTERCEPT_HCALL=09(1 << 1)
+#define KVM_XEN_HVM_CONFIG_SHARED_INFO=09=09(1 << 2)
+#define KVM_XEN_HVM_CONFIG_RUNSTATE=09=09(1 << 3)
+
 struct kvm_xen_hvm_config {
 =09__u32 flags;
 =09__u32 msr;
@@ -1563,6 +1590,57 @@ struct kvm_pv_cmd {
 /* Available with KVM_CAP_DIRTY_LOG_RING */
 #define KVM_RESET_DIRTY_RINGS=09=09_IO(KVMIO, 0xc7)
=20
+/* Per-VM Xen attributes */
+#define KVM_XEN_HVM_GET_ATTR=09_IOWR(KVMIO, 0xc8, struct kvm_xen_hvm_attr)
+#define KVM_XEN_HVM_SET_ATTR=09_IOW(KVMIO,  0xc9, struct kvm_xen_hvm_attr)
+
+struct kvm_xen_hvm_attr {
+=09__u16 type;
+=09__u16 pad[3];
+=09union {
+=09=09__u8 long_mode;
+=09=09__u8 vector;
+=09=09struct {
+=09=09=09__u64 gfn;
+=09=09} shared_info;
+=09=09__u64 pad[8];
+=09} u;
+};
+
+/* Available with KVM_CAP_XEN_HVM / KVM_XEN_HVM_CONFIG_SHARED_INFO */
+#define KVM_XEN_ATTR_TYPE_LONG_MODE=09=090x0
+#define KVM_XEN_ATTR_TYPE_SHARED_INFO=09=090x1
+#define KVM_XEN_ATTR_TYPE_UPCALL_VECTOR=09=090x2
+
+/* Per-vCPU Xen attributes */
+#define KVM_XEN_VCPU_GET_ATTR=09_IOWR(KVMIO, 0xca, struct kvm_xen_vcpu_att=
r)
+#define KVM_XEN_VCPU_SET_ATTR=09_IOW(KVMIO,  0xcb, struct kvm_xen_vcpu_att=
r)
+
+struct kvm_xen_vcpu_attr {
+=09__u16 type;
+=09__u16 pad[3];
+=09union {
+=09=09__u64 gpa;
+=09=09__u64 pad[8];
+=09=09struct {
+=09=09=09__u64 state;
+=09=09=09__u64 state_entry_time;
+=09=09=09__u64 time_running;
+=09=09=09__u64 time_runnable;
+=09=09=09__u64 time_blocked;
+=09=09=09__u64 time_offline;
+=09=09} runstate;
+=09} u;
+};
+
+/* Available with KVM_CAP_XEN_HVM / KVM_XEN_HVM_CONFIG_SHARED_INFO */
+#define KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO=090x0
+#define KVM_XEN_VCPU_ATTR_TYPE_VCPU_TIME_INFO=090x1
+#define KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_ADDR=090x2
+#define KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_CURRENT=090x3
+#define KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_DATA=090x4
+#define KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_ADJUST=090x5
+
 /* Secure Encrypted Virtualization command */
 enum sev_cmd_id {
 =09/* Guest initialization commands */
@@ -1591,6 +1669,8 @@ enum sev_cmd_id {
 =09KVM_SEV_DBG_ENCRYPT,
 =09/* Guest certificates commands */
 =09KVM_SEV_CERT_EXPORT,
+=09/* Attestation report */
+=09KVM_SEV_GET_ATTESTATION_REPORT,
=20
 =09KVM_SEV_NR_MAX,
 };
@@ -1643,6 +1723,12 @@ struct kvm_sev_dbg {
 =09__u32 len;
 };
=20
+struct kvm_sev_attestation_report {
+=09__u8 mnonce[16];
+=09__u64 uaddr;
+=09__u32 len;
+};
+
 #define KVM_DEV_ASSIGN_ENABLE_IOMMU=09(1 << 0)
 #define KVM_DEV_ASSIGN_PCI_2_3=09=09(1 << 1)
 #define KVM_DEV_ASSIGN_MASK_INTX=09(1 << 2)
@@ -1764,4 +1850,7 @@ struct kvm_dirty_gfn {
 =09__u64 offset;
 };
=20
+#define KVM_BUS_LOCK_DETECTION_OFF             (1 << 0)
+#define KVM_BUS_LOCK_DETECTION_EXIT            (1 << 1)
+
 #endif /* __LINUX_KVM_H */
diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h
index 609099e455cd..e38a48840306 100644
--- a/linux-headers/linux/vfio.h
+++ b/linux-headers/linux/vfio.h
@@ -46,6 +46,12 @@
  */
 #define VFIO_NOIOMMU_IOMMU=09=098
=20
+/* Supports VFIO_DMA_UNMAP_FLAG_ALL */
+#define VFIO_UNMAP_ALL=09=09=099
+
+/* Supports the vaddr flag for DMA map and unmap */
+#define VFIO_UPDATE_VADDR=09=0910
+
 /*
  * The IOCTL interface is designed for extensibility by embedding the
  * structure length (argsz) and flags into structures passed between
@@ -1074,12 +1080,22 @@ struct vfio_iommu_type1_info_dma_avail {
  *
  * Map process virtual addresses to IO virtual addresses using the
  * provided struct vfio_dma_map. Caller sets argsz. READ &/ WRITE required=
.
+ *
+ * If flags & VFIO_DMA_MAP_FLAG_VADDR, update the base vaddr for iova, and
+ * unblock translation of host virtual addresses in the iova range.  The v=
addr
+ * must have previously been invalidated with VFIO_DMA_UNMAP_FLAG_VADDR.  =
To
+ * maintain memory consistency within the user application, the updated va=
ddr
+ * must address the same memory object as originally mapped.  Failure to d=
o so
+ * will result in user memory corruption and/or device misbehavior.  iova =
and
+ * size must match those in the original MAP_DMA call.  Protection is not
+ * changed, and the READ & WRITE flags must be 0.
  */
 struct vfio_iommu_type1_dma_map {
 =09__u32=09argsz;
 =09__u32=09flags;
 #define VFIO_DMA_MAP_FLAG_READ (1 << 0)=09=09/* readable from device */
 #define VFIO_DMA_MAP_FLAG_WRITE (1 << 1)=09/* writable from device */
+#define VFIO_DMA_MAP_FLAG_VADDR (1 << 2)
 =09__u64=09vaddr;=09=09=09=09/* Process virtual address */
 =09__u64=09iova;=09=09=09=09/* IO virtual address */
 =09__u64=09size;=09=09=09=09/* Size of mapping (bytes) */
@@ -1102,6 +1118,7 @@ struct vfio_bitmap {
  * field.  No guarantee is made to the user that arbitrary unmaps of iova
  * or size different from those used in the original mapping call will
  * succeed.
+ *
  * VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP should be set to get the dirty bit=
map
  * before unmapping IO virtual addresses. When this flag is set, the user =
must
  * provide a struct vfio_bitmap in data[]. User must provide zero-allocate=
d
@@ -1111,11 +1128,21 @@ struct vfio_bitmap {
  * indicates that the page at that offset from iova is dirty. A Bitmap of =
the
  * pages in the range of unmapped size is returned in the user-provided
  * vfio_bitmap.data.
+ *
+ * If flags & VFIO_DMA_UNMAP_FLAG_ALL, unmap all addresses.  iova and size
+ * must be 0.  This cannot be combined with the get-dirty-bitmap flag.
+ *
+ * If flags & VFIO_DMA_UNMAP_FLAG_VADDR, do not unmap, but invalidate host
+ * virtual addresses in the iova range.  Tasks that attempt to translate a=
n
+ * iova's vaddr will block.  DMA to already-mapped pages continues.  This
+ * cannot be combined with the get-dirty-bitmap flag.
  */
 struct vfio_iommu_type1_dma_unmap {
 =09__u32=09argsz;
 =09__u32=09flags;
 #define VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP (1 << 0)
+#define VFIO_DMA_UNMAP_FLAG_ALL=09=09     (1 << 1)
+#define VFIO_DMA_UNMAP_FLAG_VADDR=09     (1 << 2)
 =09__u64=09iova;=09=09=09=09/* IO virtual address */
 =09__u64=09size;=09=09=09=09/* Size of mapping (bytes) */
 =09__u8    data[];
--=20
2.26.3


