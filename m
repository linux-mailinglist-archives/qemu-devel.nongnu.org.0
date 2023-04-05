Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC176D7DA2
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 15:22:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk352-0007Di-5e; Wed, 05 Apr 2023 09:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3uXAtZAUKCngZecepckkcha.Ykimaiq-Zarahjkjcjq.knc@flex--digit.bounces.google.com>)
 id 1pk2jl-0000pF-Dr
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 08:59:41 -0400
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3uXAtZAUKCngZecepckkcha.Ykimaiq-Zarahjkjcjq.knc@flex--digit.bounces.google.com>)
 id 1pk2jj-00040g-Be
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 08:59:41 -0400
Received: by mail-ed1-x54a.google.com with SMTP id
 b1-20020aa7dc01000000b004ad062fee5eso49418836edu.17
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 05:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680699577;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=z+qYeSX4l7O8hZGGs9t74ERbnWF1jBBTFgG8EqOkpA0=;
 b=njc9kKsNbzFNcGHrKNi17GvSDTMFIZ+YynkFexMrLqndsq786pkxzbq0d6lxr30h1w
 cdA5JsWjmvkatVU3bBqztunZwL8Iyvb7zRFwdebB1SwvHZwSZxSp4BIiuCiQZZN5tpnr
 Q7efjixxIyLpyE7Bwkd94V9auTFQWzsmy2hTaxRDYZRdWyp1Tp7GeRnVlz4lI7/0kaTa
 Mb/eF4x2ystUy4hpiqNrPHs9wgI83Qk6tIDzkFvXu8pxS4GBuPmSLpl7NEg6pvv12ao2
 ue4Tn2nV0kvy5yR1eGTj3qHt0x7u5M6svJ6o4DPW/iOUWvAQjb12OOuaYw9cHtgInPX/
 MxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680699577;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z+qYeSX4l7O8hZGGs9t74ERbnWF1jBBTFgG8EqOkpA0=;
 b=A3GAbji9qs+7XeFCizVGfdSXKADJKYJEt8deaisbt6HkEbUSc1/aMWdSWG3WcCQ085
 UdNR4Mn6rHu7EKUcEY9Z3HqRFYd+DP+Xm0JSlqVSxowPJOGlYyRPZBP5eXBjQQjshBf9
 vNPCN9zk3YOXpDILN+6P65QbEftDMHJd9MIODQnAgnT+9UqJQSFLU1J1DAX4r3Qkt77V
 iqB/8ZfOzdCP7459mnlMbx5ZGfVtUnFrCvryUgPfvx/2OfcL+FBfSIrG1UU6NpqPfeYZ
 9JH3tRVWbuazeA9TpoAD39eQ10JhqWv/yhiiVjlKFPbL13v3uDDpQ41ftTWWz92+zjFc
 yJzA==
X-Gm-Message-State: AAQBX9eqpHzOEvgTKSKSJa7w21+1p/kWjSUuf+bQEm2NrDtT/q56ClYa
 XzF46HpL8pBtBbnwwR8rKvmIyn7SeaRlH62KlHE6IFYW4f2qbcNp8uQVhUbVcEVjXx9Jfio9g21
 T+KigjMtB9JGM2oTe9hpJRk5+rqcQQk3ThlNZN3NpebCTt4eAn3AOs2JBhQ==
X-Google-Smtp-Source: AKy350bs7jXH0DsLlKNcuxOj6XT85ZdCtjDXMQ+8AZHEByGcSF+pxVRecVc8Z6EruPxLUFAOrCS12tQOgA==
X-Received: from digit-linux-eng.par.corp.google.com
 ([2a00:79e0:a0:1:d1d4:d452:da86:5ee0])
 (user=digit job=sendgmr) by 2002:a17:906:c099:b0:931:cac0:60ff with SMTP id
 f25-20020a170906c09900b00931cac060ffmr1418754ejz.13.1680699577510; Wed, 05
 Apr 2023 05:59:37 -0700 (PDT)
Date: Wed,  5 Apr 2023 14:59:20 +0200
In-Reply-To: <20230405125920.2951721-1-digit@google.com>
Mime-Version: 1.0
References: <20230405125920.2951721-1-digit@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230405125920.2951721-3-digit@google.com>
Subject: [PATCH 2/2] Add missing Linux kernel headers.
From: "David 'Digit' Turner" <digit@google.com>
To: qemu-devel@nongnu.org
Cc: "David 'Digit' Turner" <digit@google.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::54a;
 envelope-from=3uXAtZAUKCngZecepckkcha.Ykimaiq-Zarahjkjcjq.knc@flex--digit.bounces.google.com;
 helo=mail-ed1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 05 Apr 2023 09:21:30 -0400
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

Add <linux/memfd.h>, used by hw/display/virtio-gpu-udmabuf.c
Add <linux/nvme_ioctl.h>, used by qga/commands-posix.c
Add <linux/const.h> used by kvm-all.c, which requires
the _BITUL() macro definition to be available.

Without these, QEMU will not compile on Debian 10 systems.

The script has then been run against the official
6.2.8 kernel source tree (current stable release),
which explains why comments in <linux/vfio.h>
have been updated too.

Signed-off-by: David 'Digit' Turner <digit@google.com>
---
 linux-headers/linux/const.h      |  36 ++++++++++
 linux-headers/linux/memfd.h      |  35 ++++++++++
 linux-headers/linux/nvme_ioctl.h | 114 +++++++++++++++++++++++++++++++
 linux-headers/linux/vfio.h       |  15 ++--
 scripts/update-linux-headers.sh  |   4 +-
 5 files changed, 196 insertions(+), 8 deletions(-)
 create mode 100644 linux-headers/linux/const.h
 create mode 100644 linux-headers/linux/memfd.h
 create mode 100644 linux-headers/linux/nvme_ioctl.h

diff --git a/linux-headers/linux/const.h b/linux-headers/linux/const.h
new file mode 100644
index 0000000000..5e48987251
--- /dev/null
+++ b/linux-headers/linux/const.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/* const.h: Macros for dealing with constants.  */
+
+#ifndef _LINUX_CONST_H
+#define _LINUX_CONST_H
+
+/* Some constant macros are used in both assembler and
+ * C code.  Therefore we cannot annotate them always with
+ * 'UL' and other type specifiers unilaterally.  We
+ * use the following macros to deal with this.
+ *
+ * Similarly, _AT() will cast an expression with a type in C, but
+ * leave it unchanged in asm.
+ */
+
+#ifdef __ASSEMBLY__
+#define _AC(X,Y)	X
+#define _AT(T,X)	X
+#else
+#define __AC(X,Y)	(X##Y)
+#define _AC(X,Y)	__AC(X,Y)
+#define _AT(T,X)	((T)(X))
+#endif
+
+#define _UL(x)		(_AC(x, UL))
+#define _ULL(x)		(_AC(x, ULL))
+
+#define _BITUL(x)	(_UL(1) << (x))
+#define _BITULL(x)	(_ULL(1) << (x))
+
+#define __ALIGN_KERNEL(x, a)		__ALIGN_KERNEL_MASK(x, (typeof(x))(a) - 1)
+#define __ALIGN_KERNEL_MASK(x, mask)	(((x) + (mask)) & ~(mask))
+
+#define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
+
+#endif /* _LINUX_CONST_H */
diff --git a/linux-headers/linux/memfd.h b/linux-headers/linux/memfd.h
new file mode 100644
index 0000000000..39ed783fac
--- /dev/null
+++ b/linux-headers/linux/memfd.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _LINUX_MEMFD_H
+#define _LINUX_MEMFD_H
+
+#include <asm-generic/hugetlb_encode.h>
+
+/* flags for memfd_create(2) (unsigned int) */
+#define MFD_CLOEXEC		0x0001U
+#define MFD_ALLOW_SEALING	0x0002U
+#define MFD_HUGETLB		0x0004U
+
+/*
+ * Huge page size encoding when MFD_HUGETLB is specified, and a huge page
+ * size other than the default is desired.  See hugetlb_encode.h.
+ * All known huge page size encodings are provided here.  It is the
+ * responsibility of the application to know which sizes are supported on
+ * the running system.  See mmap(2) man page for details.
+ */
+#define MFD_HUGE_SHIFT	HUGETLB_FLAG_ENCODE_SHIFT
+#define MFD_HUGE_MASK	HUGETLB_FLAG_ENCODE_MASK
+
+#define MFD_HUGE_64KB	HUGETLB_FLAG_ENCODE_64KB
+#define MFD_HUGE_512KB	HUGETLB_FLAG_ENCODE_512KB
+#define MFD_HUGE_1MB	HUGETLB_FLAG_ENCODE_1MB
+#define MFD_HUGE_2MB	HUGETLB_FLAG_ENCODE_2MB
+#define MFD_HUGE_8MB	HUGETLB_FLAG_ENCODE_8MB
+#define MFD_HUGE_16MB	HUGETLB_FLAG_ENCODE_16MB
+#define MFD_HUGE_32MB	HUGETLB_FLAG_ENCODE_32MB
+#define MFD_HUGE_256MB	HUGETLB_FLAG_ENCODE_256MB
+#define MFD_HUGE_512MB	HUGETLB_FLAG_ENCODE_512MB
+#define MFD_HUGE_1GB	HUGETLB_FLAG_ENCODE_1GB
+#define MFD_HUGE_2GB	HUGETLB_FLAG_ENCODE_2GB
+#define MFD_HUGE_16GB	HUGETLB_FLAG_ENCODE_16GB
+
+#endif /* _LINUX_MEMFD_H */
diff --git a/linux-headers/linux/nvme_ioctl.h b/linux-headers/linux/nvme_ioctl.h
new file mode 100644
index 0000000000..f8df31dbc4
--- /dev/null
+++ b/linux-headers/linux/nvme_ioctl.h
@@ -0,0 +1,114 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Definitions for the NVM Express ioctl interface
+ * Copyright (c) 2011-2014, Intel Corporation.
+ */
+
+#ifndef _LINUX_NVME_IOCTL_H
+#define _LINUX_NVME_IOCTL_H
+
+#include <linux/types.h>
+
+struct nvme_user_io {
+	__u8	opcode;
+	__u8	flags;
+	__u16	control;
+	__u16	nblocks;
+	__u16	rsvd;
+	__u64	metadata;
+	__u64	addr;
+	__u64	slba;
+	__u32	dsmgmt;
+	__u32	reftag;
+	__u16	apptag;
+	__u16	appmask;
+};
+
+struct nvme_passthru_cmd {
+	__u8	opcode;
+	__u8	flags;
+	__u16	rsvd1;
+	__u32	nsid;
+	__u32	cdw2;
+	__u32	cdw3;
+	__u64	metadata;
+	__u64	addr;
+	__u32	metadata_len;
+	__u32	data_len;
+	__u32	cdw10;
+	__u32	cdw11;
+	__u32	cdw12;
+	__u32	cdw13;
+	__u32	cdw14;
+	__u32	cdw15;
+	__u32	timeout_ms;
+	__u32	result;
+};
+
+struct nvme_passthru_cmd64 {
+	__u8	opcode;
+	__u8	flags;
+	__u16	rsvd1;
+	__u32	nsid;
+	__u32	cdw2;
+	__u32	cdw3;
+	__u64	metadata;
+	__u64	addr;
+	__u32	metadata_len;
+	union {
+		__u32	data_len; /* for non-vectored io */
+		__u32	vec_cnt; /* for vectored io */
+	};
+	__u32	cdw10;
+	__u32	cdw11;
+	__u32	cdw12;
+	__u32	cdw13;
+	__u32	cdw14;
+	__u32	cdw15;
+	__u32	timeout_ms;
+	__u32   rsvd2;
+	__u64	result;
+};
+
+/* same as struct nvme_passthru_cmd64, minus the 8b result field */
+struct nvme_uring_cmd {
+	__u8	opcode;
+	__u8	flags;
+	__u16	rsvd1;
+	__u32	nsid;
+	__u32	cdw2;
+	__u32	cdw3;
+	__u64	metadata;
+	__u64	addr;
+	__u32	metadata_len;
+	__u32	data_len;
+	__u32	cdw10;
+	__u32	cdw11;
+	__u32	cdw12;
+	__u32	cdw13;
+	__u32	cdw14;
+	__u32	cdw15;
+	__u32	timeout_ms;
+	__u32   rsvd2;
+};
+
+#define nvme_admin_cmd nvme_passthru_cmd
+
+#define NVME_IOCTL_ID		_IO('N', 0x40)
+#define NVME_IOCTL_ADMIN_CMD	_IOWR('N', 0x41, struct nvme_admin_cmd)
+#define NVME_IOCTL_SUBMIT_IO	_IOW('N', 0x42, struct nvme_user_io)
+#define NVME_IOCTL_IO_CMD	_IOWR('N', 0x43, struct nvme_passthru_cmd)
+#define NVME_IOCTL_RESET	_IO('N', 0x44)
+#define NVME_IOCTL_SUBSYS_RESET	_IO('N', 0x45)
+#define NVME_IOCTL_RESCAN	_IO('N', 0x46)
+#define NVME_IOCTL_ADMIN64_CMD	_IOWR('N', 0x47, struct nvme_passthru_cmd64)
+#define NVME_IOCTL_IO64_CMD	_IOWR('N', 0x48, struct nvme_passthru_cmd64)
+#define NVME_IOCTL_IO64_CMD_VEC	_IOWR('N', 0x49, struct nvme_passthru_cmd64)
+
+/* io_uring async commands: */
+#define NVME_URING_CMD_IO	_IOWR('N', 0x80, struct nvme_uring_cmd)
+#define NVME_URING_CMD_IO_VEC	_IOWR('N', 0x81, struct nvme_uring_cmd)
+#define NVME_URING_CMD_ADMIN	_IOWR('N', 0x82, struct nvme_uring_cmd)
+#define NVME_URING_CMD_ADMIN_VEC _IOWR('N', 0x83, struct nvme_uring_cmd)
+
+#endif /* _LINUX_NVME_IOCTL_H */
diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h
index c59692ce0b..4a534edbdc 100644
--- a/linux-headers/linux/vfio.h
+++ b/linux-headers/linux/vfio.h
@@ -49,7 +49,11 @@
 /* Supports VFIO_DMA_UNMAP_FLAG_ALL */
 #define VFIO_UNMAP_ALL			9
 
-/* Supports the vaddr flag for DMA map and unmap */
+/*
+ * Supports the vaddr flag for DMA map and unmap.  Not supported for mediated
+ * devices, so this capability is subject to change as groups are added or
+ * removed.
+ */
 #define VFIO_UPDATE_VADDR		10
 
 /*
@@ -1343,8 +1347,7 @@ struct vfio_iommu_type1_info_dma_avail {
  * Map process virtual addresses to IO virtual addresses using the
  * provided struct vfio_dma_map. Caller sets argsz. READ &/ WRITE required.
  *
- * If flags & VFIO_DMA_MAP_FLAG_VADDR, update the base vaddr for iova, and
- * unblock translation of host virtual addresses in the iova range.  The vaddr
+ * If flags & VFIO_DMA_MAP_FLAG_VADDR, update the base vaddr for iova. The vaddr
  * must have previously been invalidated with VFIO_DMA_UNMAP_FLAG_VADDR.  To
  * maintain memory consistency within the user application, the updated vaddr
  * must address the same memory object as originally mapped.  Failure to do so
@@ -1395,9 +1398,9 @@ struct vfio_bitmap {
  * must be 0.  This cannot be combined with the get-dirty-bitmap flag.
  *
  * If flags & VFIO_DMA_UNMAP_FLAG_VADDR, do not unmap, but invalidate host
- * virtual addresses in the iova range.  Tasks that attempt to translate an
- * iova's vaddr will block.  DMA to already-mapped pages continues.  This
- * cannot be combined with the get-dirty-bitmap flag.
+ * virtual addresses in the iova range.  DMA to already-mapped pages continues.
+ * Groups may not be added to the container while any addresses are invalid.
+ * This cannot be combined with the get-dirty-bitmap flag.
  */
 struct vfio_iommu_type1_dma_unmap {
 	__u32	argsz;
diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
index b1ad99cba8..e21225baf3 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -160,8 +160,8 @@ done
 
 rm -rf "$output/linux-headers/linux"
 mkdir -p "$output/linux-headers/linux"
-for header in kvm.h vfio.h vfio_ccw.h vfio_zdev.h vhost.h \
-              psci.h psp-sev.h userfaultfd.h mman.h vduse.h; do
+for header in const.h kvm.h vfio.h vfio_ccw.h vfio_zdev.h vhost.h \
+              psci.h psp-sev.h userfaultfd.h memfd.h mman.h nvme_ioctl.h vduse.h; do
     cp "$tmpdir/include/linux/$header" "$output/linux-headers/linux"
 done
 
-- 
2.40.0.348.gf938b09366-goog


