Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8B63BD03D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 13:30:56 +0200 (CEST)
Received: from localhost ([::1]:45894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0jHz-0006zP-DF
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 07:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bharata@linux.ibm.com>)
 id 1m0jCI-0005OQ-BW; Tue, 06 Jul 2021 07:25:02 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:2188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bharata@linux.ibm.com>)
 id 1m0jCD-0001BD-U9; Tue, 06 Jul 2021 07:25:02 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166B2pPQ021918; Tue, 6 Jul 2021 07:24:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=C4cxTDQPXvoRfwWggwyOp+wZlBlyReFjHbOMOi1GiqI=;
 b=nCZ67neOMhnoDYsSPw+1Bc+P0+DNiai93UGg1RK+gjUGMi5NxvOu1IN2TktiV4ISm8Wp
 j+UQ8lqcSRALOFf7iNOARiNCvq6CfdY8ttZ6A6MvUjRkCiVyR2rujihE5HYGZJ/VX2Xz
 yAgOkxxTgorcWNEeG/qAHIGembJa5+Nz2xHSLWZV2LzEKXaI3CH6UQh5Ct4y26y5FNuz
 AxnYCtC5ZPI8G44DoICQyQesd/3VsC59aUFm0y8F/twy/NUGgIWUZOXBf1+BdRpTjY3b
 FE1UOdoC/eti27iAxQqjxQGcmHZ+vUsk3EGh/o/9fBTeUqOf4TuOrnu5c46lmvqL+16C EA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39m5q1psh0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jul 2021 07:24:52 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 166BHhCR017988;
 Tue, 6 Jul 2021 11:24:49 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 39jfh88nes-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Jul 2021 11:24:49 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 166BMvw136438478
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Jul 2021 11:22:58 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E4AF42049;
 Tue,  6 Jul 2021 11:24:47 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 044EE42045;
 Tue,  6 Jul 2021 11:24:46 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.199.34.138])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  6 Jul 2021 11:24:45 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/2] linux-headers: Update
Date: Tue,  6 Jul 2021 16:54:39 +0530
Message-Id: <20210706112440.1449562-2-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706112440.1449562-1-bharata@linux.ibm.com>
References: <20210706112440.1449562-1-bharata@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1yXtrswKfBplIcsWxclF10kdyyaiQAqs
X-Proofpoint-GUID: 1yXtrswKfBplIcsWxclF10kdyyaiQAqs
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-06_06:2021-07-02,
 2021-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107060054
Received-SPF: pass client-ip=148.163.156.1; envelope-from=bharata@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Bharata B Rao <bharata@linux.ibm.com>, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update to mainline commit: 79160a603bdb ("Merge tag 'usb-5.14-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb"

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 include/standard-headers/asm-x86/kvm_para.h   |  13 +++
 include/standard-headers/drm/drm_fourcc.h     |   7 ++
 include/standard-headers/linux/ethtool.h      |   4 +-
 .../linux/input-event-codes.h                 |   1 +
 include/standard-headers/linux/virtio_ids.h   |   2 +-
 include/standard-headers/linux/virtio_vsock.h |   9 ++
 linux-headers/asm-arm64/kvm.h                 |  11 ++
 linux-headers/asm-generic/mman-common.h       |   3 +
 linux-headers/asm-generic/unistd.h            |   4 +-
 linux-headers/asm-mips/mman.h                 |   3 +
 linux-headers/asm-mips/unistd_n32.h           |   1 +
 linux-headers/asm-mips/unistd_n64.h           |   1 +
 linux-headers/asm-mips/unistd_o32.h           |   1 +
 linux-headers/asm-powerpc/unistd_32.h         |   1 +
 linux-headers/asm-powerpc/unistd_64.h         |   1 +
 linux-headers/asm-s390/unistd_32.h            |   1 +
 linux-headers/asm-s390/unistd_64.h            |   1 +
 linux-headers/asm-x86/kvm.h                   |  13 +++
 linux-headers/asm-x86/unistd_32.h             |   7 +-
 linux-headers/asm-x86/unistd_64.h             |   7 +-
 linux-headers/asm-x86/unistd_x32.h            |   7 +-
 linux-headers/linux/kvm.h                     | 105 ++++++++++++++++++
 linux-headers/linux/userfaultfd.h             |  11 +-
 23 files changed, 197 insertions(+), 17 deletions(-)

diff --git a/include/standard-headers/asm-x86/kvm_para.h b/include/standard-headers/asm-x86/kvm_para.h
index 215d01b4ec..204cfb8640 100644
--- a/include/standard-headers/asm-x86/kvm_para.h
+++ b/include/standard-headers/asm-x86/kvm_para.h
@@ -33,6 +33,8 @@
 #define KVM_FEATURE_PV_SCHED_YIELD	13
 #define KVM_FEATURE_ASYNC_PF_INT	14
 #define KVM_FEATURE_MSI_EXT_DEST_ID	15
+#define KVM_FEATURE_HC_MAP_GPA_RANGE	16
+#define KVM_FEATURE_MIGRATION_CONTROL	17
 
 #define KVM_HINTS_REALTIME      0
 
@@ -54,6 +56,7 @@
 #define MSR_KVM_POLL_CONTROL	0x4b564d05
 #define MSR_KVM_ASYNC_PF_INT	0x4b564d06
 #define MSR_KVM_ASYNC_PF_ACK	0x4b564d07
+#define MSR_KVM_MIGRATION_CONTROL	0x4b564d08
 
 struct kvm_steal_time {
 	uint64_t steal;
@@ -90,6 +93,16 @@ struct kvm_clock_pairing {
 /* MSR_KVM_ASYNC_PF_INT */
 #define KVM_ASYNC_PF_VEC_MASK			GENMASK(7, 0)
 
+/* MSR_KVM_MIGRATION_CONTROL */
+#define KVM_MIGRATION_READY		(1 << 0)
+
+/* KVM_HC_MAP_GPA_RANGE */
+#define KVM_MAP_GPA_RANGE_PAGE_SZ_4K	0
+#define KVM_MAP_GPA_RANGE_PAGE_SZ_2M	(1 << 0)
+#define KVM_MAP_GPA_RANGE_PAGE_SZ_1G	(1 << 1)
+#define KVM_MAP_GPA_RANGE_ENC_STAT(n)	(n << 4)
+#define KVM_MAP_GPA_RANGE_ENCRYPTED	KVM_MAP_GPA_RANGE_ENC_STAT(1)
+#define KVM_MAP_GPA_RANGE_DECRYPTED	KVM_MAP_GPA_RANGE_ENC_STAT(0)
 
 /* Operations for KVM_HC_MMU_OP */
 #define KVM_MMU_OP_WRITE_PTE            1
diff --git a/include/standard-headers/drm/drm_fourcc.h b/include/standard-headers/drm/drm_fourcc.h
index a61ae520c2..352b51fd0a 100644
--- a/include/standard-headers/drm/drm_fourcc.h
+++ b/include/standard-headers/drm/drm_fourcc.h
@@ -167,6 +167,13 @@ extern "C" {
 #define DRM_FORMAT_RGBA1010102	fourcc_code('R', 'A', '3', '0') /* [31:0] R:G:B:A 10:10:10:2 little endian */
 #define DRM_FORMAT_BGRA1010102	fourcc_code('B', 'A', '3', '0') /* [31:0] B:G:R:A 10:10:10:2 little endian */
 
+/* 64 bpp RGB */
+#define DRM_FORMAT_XRGB16161616	fourcc_code('X', 'R', '4', '8') /* [63:0] x:R:G:B 16:16:16:16 little endian */
+#define DRM_FORMAT_XBGR16161616	fourcc_code('X', 'B', '4', '8') /* [63:0] x:B:G:R 16:16:16:16 little endian */
+
+#define DRM_FORMAT_ARGB16161616	fourcc_code('A', 'R', '4', '8') /* [63:0] A:R:G:B 16:16:16:16 little endian */
+#define DRM_FORMAT_ABGR16161616	fourcc_code('A', 'B', '4', '8') /* [63:0] A:B:G:R 16:16:16:16 little endian */
+
 /*
  * Floating point 64bpp RGB
  * IEEE 754-2008 binary16 half-precision float
diff --git a/include/standard-headers/linux/ethtool.h b/include/standard-headers/linux/ethtool.h
index 218d944a17..053d3fafdf 100644
--- a/include/standard-headers/linux/ethtool.h
+++ b/include/standard-headers/linux/ethtool.h
@@ -233,7 +233,7 @@ enum tunable_id {
 	ETHTOOL_PFC_PREVENTION_TOUT, /* timeout in msecs */
 	/*
 	 * Add your fresh new tunable attribute above and remember to update
-	 * tunable_strings[] in net/core/ethtool.c
+	 * tunable_strings[] in net/ethtool/common.c
 	 */
 	__ETHTOOL_TUNABLE_COUNT,
 };
@@ -297,7 +297,7 @@ enum phy_tunable_id {
 	ETHTOOL_PHY_EDPD,
 	/*
 	 * Add your fresh new phy tunable attribute above and remember to update
-	 * phy_tunable_strings[] in net/core/ethtool.c
+	 * phy_tunable_strings[] in net/ethtool/common.c
 	 */
 	__ETHTOOL_PHY_TUNABLE_COUNT,
 };
diff --git a/include/standard-headers/linux/input-event-codes.h b/include/standard-headers/linux/input-event-codes.h
index c403b9cb0d..b5e86b40ab 100644
--- a/include/standard-headers/linux/input-event-codes.h
+++ b/include/standard-headers/linux/input-event-codes.h
@@ -611,6 +611,7 @@
 #define KEY_VOICECOMMAND		0x246	/* Listening Voice Command */
 #define KEY_ASSISTANT		0x247	/* AL Context-aware desktop assistant */
 #define KEY_KBD_LAYOUT_NEXT	0x248	/* AC Next Keyboard Layout Select */
+#define KEY_EMOJI_PICKER	0x249	/* Show/hide emoji picker (HUTRR101) */
 
 #define KEY_BRIGHTNESS_MIN		0x250	/* Set Brightness to Minimum */
 #define KEY_BRIGHTNESS_MAX		0x251	/* Set Brightness to Maximum */
diff --git a/include/standard-headers/linux/virtio_ids.h b/include/standard-headers/linux/virtio_ids.h
index f0c35ce862..4fe842c3a3 100644
--- a/include/standard-headers/linux/virtio_ids.h
+++ b/include/standard-headers/linux/virtio_ids.h
@@ -54,7 +54,7 @@
 #define VIRTIO_ID_SOUND			25 /* virtio sound */
 #define VIRTIO_ID_FS			26 /* virtio filesystem */
 #define VIRTIO_ID_PMEM			27 /* virtio pmem */
-#define VIRTIO_ID_BT			28 /* virtio bluetooth */
 #define VIRTIO_ID_MAC80211_HWSIM	29 /* virtio mac80211-hwsim */
+#define VIRTIO_ID_BT			40 /* virtio bluetooth */
 
 #endif /* _LINUX_VIRTIO_IDS_H */
diff --git a/include/standard-headers/linux/virtio_vsock.h b/include/standard-headers/linux/virtio_vsock.h
index be443211ce..3a23488e42 100644
--- a/include/standard-headers/linux/virtio_vsock.h
+++ b/include/standard-headers/linux/virtio_vsock.h
@@ -38,6 +38,9 @@
 #include "standard-headers/linux/virtio_ids.h"
 #include "standard-headers/linux/virtio_config.h"
 
+/* The feature bitmap for virtio vsock */
+#define VIRTIO_VSOCK_F_SEQPACKET	1	/* SOCK_SEQPACKET supported */
+
 struct virtio_vsock_config {
 	uint64_t guest_cid;
 } QEMU_PACKED;
@@ -65,6 +68,7 @@ struct virtio_vsock_hdr {
 
 enum virtio_vsock_type {
 	VIRTIO_VSOCK_TYPE_STREAM = 1,
+	VIRTIO_VSOCK_TYPE_SEQPACKET = 2,
 };
 
 enum virtio_vsock_op {
@@ -91,4 +95,9 @@ enum virtio_vsock_shutdown {
 	VIRTIO_VSOCK_SHUTDOWN_SEND = 2,
 };
 
+/* VIRTIO_VSOCK_OP_RW flags values */
+enum virtio_vsock_rw {
+	VIRTIO_VSOCK_SEQ_EOR = 1,
+};
+
 #endif /* _LINUX_VIRTIO_VSOCK_H */
diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index b6a0eaa32a..3d2ce9912d 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -184,6 +184,17 @@ struct kvm_vcpu_events {
 	__u32 reserved[12];
 };
 
+struct kvm_arm_copy_mte_tags {
+	__u64 guest_ipa;
+	__u64 length;
+	void *addr;
+	__u64 flags;
+	__u64 reserved[2];
+};
+
+#define KVM_ARM_TAGS_TO_GUEST		0
+#define KVM_ARM_TAGS_FROM_GUEST		1
+
 /* If you need to interpret the index values, here is the key: */
 #define KVM_REG_ARM_COPROC_MASK		0x000000000FFF0000
 #define KVM_REG_ARM_COPROC_SHIFT	16
diff --git a/linux-headers/asm-generic/mman-common.h b/linux-headers/asm-generic/mman-common.h
index f94f65d429..1567a3294c 100644
--- a/linux-headers/asm-generic/mman-common.h
+++ b/linux-headers/asm-generic/mman-common.h
@@ -72,6 +72,9 @@
 #define MADV_COLD	20		/* deactivate these pages */
 #define MADV_PAGEOUT	21		/* reclaim these pages */
 
+#define MADV_POPULATE_READ	22	/* populate (prefault) page tables readable */
+#define MADV_POPULATE_WRITE	23	/* populate (prefault) page tables writable */
+
 /* compatibility flags */
 #define MAP_FILE	0
 
diff --git a/linux-headers/asm-generic/unistd.h b/linux-headers/asm-generic/unistd.h
index 6de5a7fc06..f211961ce1 100644
--- a/linux-headers/asm-generic/unistd.h
+++ b/linux-headers/asm-generic/unistd.h
@@ -863,8 +863,8 @@ __SYSCALL(__NR_process_madvise, sys_process_madvise)
 __SC_COMP(__NR_epoll_pwait2, sys_epoll_pwait2, compat_sys_epoll_pwait2)
 #define __NR_mount_setattr 442
 __SYSCALL(__NR_mount_setattr, sys_mount_setattr)
-#define __NR_quotactl_path 443
-__SYSCALL(__NR_quotactl_path, sys_quotactl_path)
+#define __NR_quotactl_fd 443
+__SYSCALL(__NR_quotactl_fd, sys_quotactl_fd)
 
 #define __NR_landlock_create_ruleset 444
 __SYSCALL(__NR_landlock_create_ruleset, sys_landlock_create_ruleset)
diff --git a/linux-headers/asm-mips/mman.h b/linux-headers/asm-mips/mman.h
index 57dc2ac4f8..40b210c65a 100644
--- a/linux-headers/asm-mips/mman.h
+++ b/linux-headers/asm-mips/mman.h
@@ -98,6 +98,9 @@
 #define MADV_COLD	20		/* deactivate these pages */
 #define MADV_PAGEOUT	21		/* reclaim these pages */
 
+#define MADV_POPULATE_READ	22	/* populate (prefault) page tables readable */
+#define MADV_POPULATE_WRITE	23	/* populate (prefault) page tables writable */
+
 /* compatibility flags */
 #define MAP_FILE	0
 
diff --git a/linux-headers/asm-mips/unistd_n32.h b/linux-headers/asm-mips/unistd_n32.h
index fce51fee09..09cd297698 100644
--- a/linux-headers/asm-mips/unistd_n32.h
+++ b/linux-headers/asm-mips/unistd_n32.h
@@ -372,6 +372,7 @@
 #define __NR_process_madvise (__NR_Linux + 440)
 #define __NR_epoll_pwait2 (__NR_Linux + 441)
 #define __NR_mount_setattr (__NR_Linux + 442)
+#define __NR_quotactl_fd (__NR_Linux + 443)
 #define __NR_landlock_create_ruleset (__NR_Linux + 444)
 #define __NR_landlock_add_rule (__NR_Linux + 445)
 #define __NR_landlock_restrict_self (__NR_Linux + 446)
diff --git a/linux-headers/asm-mips/unistd_n64.h b/linux-headers/asm-mips/unistd_n64.h
index 0996001802..780e0cead6 100644
--- a/linux-headers/asm-mips/unistd_n64.h
+++ b/linux-headers/asm-mips/unistd_n64.h
@@ -348,6 +348,7 @@
 #define __NR_process_madvise (__NR_Linux + 440)
 #define __NR_epoll_pwait2 (__NR_Linux + 441)
 #define __NR_mount_setattr (__NR_Linux + 442)
+#define __NR_quotactl_fd (__NR_Linux + 443)
 #define __NR_landlock_create_ruleset (__NR_Linux + 444)
 #define __NR_landlock_add_rule (__NR_Linux + 445)
 #define __NR_landlock_restrict_self (__NR_Linux + 446)
diff --git a/linux-headers/asm-mips/unistd_o32.h b/linux-headers/asm-mips/unistd_o32.h
index 954303ad69..06a2b3b55e 100644
--- a/linux-headers/asm-mips/unistd_o32.h
+++ b/linux-headers/asm-mips/unistd_o32.h
@@ -418,6 +418,7 @@
 #define __NR_process_madvise (__NR_Linux + 440)
 #define __NR_epoll_pwait2 (__NR_Linux + 441)
 #define __NR_mount_setattr (__NR_Linux + 442)
+#define __NR_quotactl_fd (__NR_Linux + 443)
 #define __NR_landlock_create_ruleset (__NR_Linux + 444)
 #define __NR_landlock_add_rule (__NR_Linux + 445)
 #define __NR_landlock_restrict_self (__NR_Linux + 446)
diff --git a/linux-headers/asm-powerpc/unistd_32.h b/linux-headers/asm-powerpc/unistd_32.h
index 9155778c19..cd5a8a41b2 100644
--- a/linux-headers/asm-powerpc/unistd_32.h
+++ b/linux-headers/asm-powerpc/unistd_32.h
@@ -425,6 +425,7 @@
 #define __NR_process_madvise 440
 #define __NR_epoll_pwait2 441
 #define __NR_mount_setattr 442
+#define __NR_quotactl_fd 443
 #define __NR_landlock_create_ruleset 444
 #define __NR_landlock_add_rule 445
 #define __NR_landlock_restrict_self 446
diff --git a/linux-headers/asm-powerpc/unistd_64.h b/linux-headers/asm-powerpc/unistd_64.h
index 3cefa88932..8458effa8d 100644
--- a/linux-headers/asm-powerpc/unistd_64.h
+++ b/linux-headers/asm-powerpc/unistd_64.h
@@ -397,6 +397,7 @@
 #define __NR_process_madvise 440
 #define __NR_epoll_pwait2 441
 #define __NR_mount_setattr 442
+#define __NR_quotactl_fd 443
 #define __NR_landlock_create_ruleset 444
 #define __NR_landlock_add_rule 445
 #define __NR_landlock_restrict_self 446
diff --git a/linux-headers/asm-s390/unistd_32.h b/linux-headers/asm-s390/unistd_32.h
index e8cd34334f..0c3cd299e4 100644
--- a/linux-headers/asm-s390/unistd_32.h
+++ b/linux-headers/asm-s390/unistd_32.h
@@ -415,6 +415,7 @@
 #define __NR_process_madvise 440
 #define __NR_epoll_pwait2 441
 #define __NR_mount_setattr 442
+#define __NR_quotactl_fd 443
 #define __NR_landlock_create_ruleset 444
 #define __NR_landlock_add_rule 445
 #define __NR_landlock_restrict_self 446
diff --git a/linux-headers/asm-s390/unistd_64.h b/linux-headers/asm-s390/unistd_64.h
index 86830e1e83..8dfc08b5e6 100644
--- a/linux-headers/asm-s390/unistd_64.h
+++ b/linux-headers/asm-s390/unistd_64.h
@@ -363,6 +363,7 @@
 #define __NR_process_madvise 440
 #define __NR_epoll_pwait2 441
 #define __NR_mount_setattr 442
+#define __NR_quotactl_fd 443
 #define __NR_landlock_create_ruleset 444
 #define __NR_landlock_add_rule 445
 #define __NR_landlock_restrict_self 446
diff --git a/linux-headers/asm-x86/kvm.h b/linux-headers/asm-x86/kvm.h
index 0662f644aa..a6c327f8ad 100644
--- a/linux-headers/asm-x86/kvm.h
+++ b/linux-headers/asm-x86/kvm.h
@@ -159,6 +159,19 @@ struct kvm_sregs {
 	__u64 interrupt_bitmap[(KVM_NR_INTERRUPTS + 63) / 64];
 };
 
+struct kvm_sregs2 {
+	/* out (KVM_GET_SREGS2) / in (KVM_SET_SREGS2) */
+	struct kvm_segment cs, ds, es, fs, gs, ss;
+	struct kvm_segment tr, ldt;
+	struct kvm_dtable gdt, idt;
+	__u64 cr0, cr2, cr3, cr4, cr8;
+	__u64 efer;
+	__u64 apic_base;
+	__u64 flags;
+	__u64 pdptrs[4];
+};
+#define KVM_SREGS2_FLAGS_PDPTRS_VALID 1
+
 /* for KVM_GET_FPU and KVM_SET_FPU */
 struct kvm_fpu {
 	__u8  fpr[8][16];
diff --git a/linux-headers/asm-x86/unistd_32.h b/linux-headers/asm-x86/unistd_32.h
index 8f6ac8c19f..66e96c0c68 100644
--- a/linux-headers/asm-x86/unistd_32.h
+++ b/linux-headers/asm-x86/unistd_32.h
@@ -1,5 +1,5 @@
-#ifndef _ASM_X86_UNISTD_32_H
-#define _ASM_X86_UNISTD_32_H 1
+#ifndef _ASM_UNISTD_32_H
+#define _ASM_UNISTD_32_H
 
 #define __NR_restart_syscall 0
 #define __NR_exit 1
@@ -433,9 +433,10 @@
 #define __NR_process_madvise 440
 #define __NR_epoll_pwait2 441
 #define __NR_mount_setattr 442
+#define __NR_quotactl_fd 443
 #define __NR_landlock_create_ruleset 444
 #define __NR_landlock_add_rule 445
 #define __NR_landlock_restrict_self 446
 
 
-#endif /* _ASM_X86_UNISTD_32_H */
+#endif /* _ASM_UNISTD_32_H */
diff --git a/linux-headers/asm-x86/unistd_64.h b/linux-headers/asm-x86/unistd_64.h
index bb187a9268..b8ff6f14ee 100644
--- a/linux-headers/asm-x86/unistd_64.h
+++ b/linux-headers/asm-x86/unistd_64.h
@@ -1,5 +1,5 @@
-#ifndef _ASM_X86_UNISTD_64_H
-#define _ASM_X86_UNISTD_64_H 1
+#ifndef _ASM_UNISTD_64_H
+#define _ASM_UNISTD_64_H
 
 #define __NR_read 0
 #define __NR_write 1
@@ -355,9 +355,10 @@
 #define __NR_process_madvise 440
 #define __NR_epoll_pwait2 441
 #define __NR_mount_setattr 442
+#define __NR_quotactl_fd 443
 #define __NR_landlock_create_ruleset 444
 #define __NR_landlock_add_rule 445
 #define __NR_landlock_restrict_self 446
 
 
-#endif /* _ASM_X86_UNISTD_64_H */
+#endif /* _ASM_UNISTD_64_H */
diff --git a/linux-headers/asm-x86/unistd_x32.h b/linux-headers/asm-x86/unistd_x32.h
index 4edd0103ac..06a1097c15 100644
--- a/linux-headers/asm-x86/unistd_x32.h
+++ b/linux-headers/asm-x86/unistd_x32.h
@@ -1,5 +1,5 @@
-#ifndef _ASM_X86_UNISTD_X32_H
-#define _ASM_X86_UNISTD_X32_H 1
+#ifndef _ASM_UNISTD_X32_H
+#define _ASM_UNISTD_X32_H
 
 #define __NR_read (__X32_SYSCALL_BIT + 0)
 #define __NR_write (__X32_SYSCALL_BIT + 1)
@@ -308,6 +308,7 @@
 #define __NR_process_madvise (__X32_SYSCALL_BIT + 440)
 #define __NR_epoll_pwait2 (__X32_SYSCALL_BIT + 441)
 #define __NR_mount_setattr (__X32_SYSCALL_BIT + 442)
+#define __NR_quotactl_fd (__X32_SYSCALL_BIT + 443)
 #define __NR_landlock_create_ruleset (__X32_SYSCALL_BIT + 444)
 #define __NR_landlock_add_rule (__X32_SYSCALL_BIT + 445)
 #define __NR_landlock_restrict_self (__X32_SYSCALL_BIT + 446)
@@ -349,4 +350,4 @@
 #define __NR_pwritev2 (__X32_SYSCALL_BIT + 547)
 
 
-#endif /* _ASM_X86_UNISTD_X32_H */
+#endif /* _ASM_UNISTD_X32_H */
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 20d6a263bb..bcaf66cc4d 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -280,6 +280,9 @@ struct kvm_xen_exit {
 /* Encounter unexpected vm-exit reason */
 #define KVM_INTERNAL_ERROR_UNEXPECTED_EXIT_REASON	4
 
+/* Flags that describe what fields in emulation_failure hold valid data. */
+#define KVM_INTERNAL_ERROR_EMULATION_FLAG_INSTRUCTION_BYTES (1ULL << 0)
+
 /* for KVM_RUN, returned by mmap(vcpu_fd, offset=0) */
 struct kvm_run {
 	/* in */
@@ -383,6 +386,25 @@ struct kvm_run {
 			__u32 ndata;
 			__u64 data[16];
 		} internal;
+		/*
+		 * KVM_INTERNAL_ERROR_EMULATION
+		 *
+		 * "struct emulation_failure" is an overlay of "struct internal"
+		 * that is used for the KVM_INTERNAL_ERROR_EMULATION sub-type of
+		 * KVM_EXIT_INTERNAL_ERROR.  Note, unlike other internal error
+		 * sub-types, this struct is ABI!  It also needs to be backwards
+		 * compatible with "struct internal".  Take special care that
+		 * "ndata" is correct, that new fields are enumerated in "flags",
+		 * and that each flag enumerates fields that are 64-bit aligned
+		 * and sized (so that ndata+internal.data[] is valid/accurate).
+		 */
+		struct {
+			__u32 suberror;
+			__u32 ndata;
+			__u64 flags;
+			__u8  insn_size;
+			__u8  insn_bytes[15];
+		} emulation_failure;
 		/* KVM_EXIT_OSI */
 		struct {
 			__u64 gprs[32];
@@ -1083,6 +1105,13 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_SGX_ATTRIBUTE 196
 #define KVM_CAP_VM_COPY_ENC_CONTEXT_FROM 197
 #define KVM_CAP_PTP_KVM 198
+#define KVM_CAP_HYPERV_ENFORCE_CPUID 199
+#define KVM_CAP_SREGS2 200
+#define KVM_CAP_EXIT_HYPERCALL 201
+#define KVM_CAP_PPC_RPT_INVALIDATE 202
+#define KVM_CAP_BINARY_STATS_FD 203
+#define KVM_CAP_EXIT_ON_EMULATION_FAILURE 204
+#define KVM_CAP_ARM_MTE 205
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -1428,6 +1457,7 @@ struct kvm_s390_ucas_mapping {
 /* Available with KVM_CAP_PMU_EVENT_FILTER */
 #define KVM_SET_PMU_EVENT_FILTER  _IOW(KVMIO,  0xb2, struct kvm_pmu_event_filter)
 #define KVM_PPC_SVM_OFF		  _IO(KVMIO,  0xb3)
+#define KVM_ARM_MTE_COPY_TAGS	  _IOR(KVMIO,  0xb4, struct kvm_arm_copy_mte_tags)
 
 /* ioctl for vm fd */
 #define KVM_CREATE_DEVICE	  _IOWR(KVMIO,  0xe0, struct kvm_create_device)
@@ -1621,6 +1651,9 @@ struct kvm_xen_hvm_attr {
 #define KVM_XEN_VCPU_GET_ATTR	_IOWR(KVMIO, 0xca, struct kvm_xen_vcpu_attr)
 #define KVM_XEN_VCPU_SET_ATTR	_IOW(KVMIO,  0xcb, struct kvm_xen_vcpu_attr)
 
+#define KVM_GET_SREGS2             _IOR(KVMIO,  0xcc, struct kvm_sregs2)
+#define KVM_SET_SREGS2             _IOW(KVMIO,  0xcd, struct kvm_sregs2)
+
 struct kvm_xen_vcpu_attr {
 	__u16 type;
 	__u16 pad[3];
@@ -1899,4 +1932,76 @@ struct kvm_dirty_gfn {
 #define KVM_BUS_LOCK_DETECTION_OFF             (1 << 0)
 #define KVM_BUS_LOCK_DETECTION_EXIT            (1 << 1)
 
+/**
+ * struct kvm_stats_header - Header of per vm/vcpu binary statistics data.
+ * @flags: Some extra information for header, always 0 for now.
+ * @name_size: The size in bytes of the memory which contains statistics
+ *             name string including trailing '\0'. The memory is allocated
+ *             at the send of statistics descriptor.
+ * @num_desc: The number of statistics the vm or vcpu has.
+ * @id_offset: The offset of the vm/vcpu stats' id string in the file pointed
+ *             by vm/vcpu stats fd.
+ * @desc_offset: The offset of the vm/vcpu stats' descriptor block in the file
+ *               pointd by vm/vcpu stats fd.
+ * @data_offset: The offset of the vm/vcpu stats' data block in the file
+ *               pointed by vm/vcpu stats fd.
+ *
+ * This is the header userspace needs to read from stats fd before any other
+ * readings. It is used by userspace to discover all the information about the
+ * vm/vcpu's binary statistics.
+ * Userspace reads this header from the start of the vm/vcpu's stats fd.
+ */
+struct kvm_stats_header {
+	__u32 flags;
+	__u32 name_size;
+	__u32 num_desc;
+	__u32 id_offset;
+	__u32 desc_offset;
+	__u32 data_offset;
+};
+
+#define KVM_STATS_TYPE_SHIFT		0
+#define KVM_STATS_TYPE_MASK		(0xF << KVM_STATS_TYPE_SHIFT)
+#define KVM_STATS_TYPE_CUMULATIVE	(0x0 << KVM_STATS_TYPE_SHIFT)
+#define KVM_STATS_TYPE_INSTANT		(0x1 << KVM_STATS_TYPE_SHIFT)
+#define KVM_STATS_TYPE_PEAK		(0x2 << KVM_STATS_TYPE_SHIFT)
+#define KVM_STATS_TYPE_MAX		KVM_STATS_TYPE_PEAK
+
+#define KVM_STATS_UNIT_SHIFT		4
+#define KVM_STATS_UNIT_MASK		(0xF << KVM_STATS_UNIT_SHIFT)
+#define KVM_STATS_UNIT_NONE		(0x0 << KVM_STATS_UNIT_SHIFT)
+#define KVM_STATS_UNIT_BYTES		(0x1 << KVM_STATS_UNIT_SHIFT)
+#define KVM_STATS_UNIT_SECONDS		(0x2 << KVM_STATS_UNIT_SHIFT)
+#define KVM_STATS_UNIT_CYCLES		(0x3 << KVM_STATS_UNIT_SHIFT)
+#define KVM_STATS_UNIT_MAX		KVM_STATS_UNIT_CYCLES
+
+#define KVM_STATS_BASE_SHIFT		8
+#define KVM_STATS_BASE_MASK		(0xF << KVM_STATS_BASE_SHIFT)
+#define KVM_STATS_BASE_POW10		(0x0 << KVM_STATS_BASE_SHIFT)
+#define KVM_STATS_BASE_POW2		(0x1 << KVM_STATS_BASE_SHIFT)
+#define KVM_STATS_BASE_MAX		KVM_STATS_BASE_POW2
+
+/**
+ * struct kvm_stats_desc - Descriptor of a KVM statistics.
+ * @flags: Annotations of the stats, like type, unit, etc.
+ * @exponent: Used together with @flags to determine the unit.
+ * @size: The number of data items for this stats.
+ *        Every data item is of type __u64.
+ * @offset: The offset of the stats to the start of stat structure in
+ *          struture kvm or kvm_vcpu.
+ * @unused: Unused field for future usage. Always 0 for now.
+ * @name: The name string for the stats. Its size is indicated by the
+ *        &kvm_stats_header->name_size.
+ */
+struct kvm_stats_desc {
+	__u32 flags;
+	__s16 exponent;
+	__u16 size;
+	__u32 offset;
+	__u32 unused;
+	char name[];
+};
+
+#define KVM_GET_STATS_FD  _IO(KVMIO,  0xce)
+
 #endif /* __LINUX_KVM_H */
diff --git a/linux-headers/linux/userfaultfd.h b/linux-headers/linux/userfaultfd.h
index b9ac97b70f..8479af5f4c 100644
--- a/linux-headers/linux/userfaultfd.h
+++ b/linux-headers/linux/userfaultfd.h
@@ -31,7 +31,8 @@
 			   UFFD_FEATURE_MISSING_SHMEM |		\
 			   UFFD_FEATURE_SIGBUS |		\
 			   UFFD_FEATURE_THREAD_ID |		\
-			   UFFD_FEATURE_MINOR_HUGETLBFS)
+			   UFFD_FEATURE_MINOR_HUGETLBFS |	\
+			   UFFD_FEATURE_MINOR_SHMEM)
 #define UFFD_API_IOCTLS				\
 	((__u64)1 << _UFFDIO_REGISTER |		\
 	 (__u64)1 << _UFFDIO_UNREGISTER |	\
@@ -80,8 +81,8 @@
 				      struct uffdio_zeropage)
 #define UFFDIO_WRITEPROTECT	_IOWR(UFFDIO, _UFFDIO_WRITEPROTECT, \
 				      struct uffdio_writeprotect)
-#define UFFDIO_CONTINUE		_IOR(UFFDIO, _UFFDIO_CONTINUE,	\
-				     struct uffdio_continue)
+#define UFFDIO_CONTINUE		_IOWR(UFFDIO, _UFFDIO_CONTINUE,	\
+				      struct uffdio_continue)
 
 /* read() structure */
 struct uffd_msg {
@@ -185,6 +186,9 @@ struct uffdio_api {
 	 * UFFD_FEATURE_MINOR_HUGETLBFS indicates that minor faults
 	 * can be intercepted (via REGISTER_MODE_MINOR) for
 	 * hugetlbfs-backed pages.
+	 *
+	 * UFFD_FEATURE_MINOR_SHMEM indicates the same support as
+	 * UFFD_FEATURE_MINOR_HUGETLBFS, but for shmem-backed pages instead.
 	 */
 #define UFFD_FEATURE_PAGEFAULT_FLAG_WP		(1<<0)
 #define UFFD_FEATURE_EVENT_FORK			(1<<1)
@@ -196,6 +200,7 @@ struct uffdio_api {
 #define UFFD_FEATURE_SIGBUS			(1<<7)
 #define UFFD_FEATURE_THREAD_ID			(1<<8)
 #define UFFD_FEATURE_MINOR_HUGETLBFS		(1<<9)
+#define UFFD_FEATURE_MINOR_SHMEM		(1<<10)
 	__u64 features;
 
 	__u64 ioctls;
-- 
2.31.1


