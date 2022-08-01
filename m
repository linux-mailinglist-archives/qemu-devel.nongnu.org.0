Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B44C2586E82
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 18:25:30 +0200 (CEST)
Received: from localhost ([::1]:42676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIYET-0007L3-Fe
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 12:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oIXlY-0003B7-VX
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 11:55:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oIXlU-0001ON-Ro
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 11:55:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659369330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5NXkPQijaJ9fjZJsoCTAbfhji4zkLGLdytEXQF4WA9E=;
 b=MWPzYf7RfHgFUgzwU941kXD+/WbChZhAOR8o5iQxv7YTfyQ6Z10SfgzRu/fNWWuuI5F/XJ
 x59Xztt+HsK3100LtUG+y4k1W1sNWC9J6SCCkpg2Kll17luyObT1lPTycT05R1JTDJiiaG
 fHXaT+JjD109d7FG3x58Jl/u1hAsPLw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-a3YkFEDEO-yLqyv8nMCTEA-1; Mon, 01 Aug 2022 11:55:26 -0400
X-MC-Unique: a3YkFEDEO-yLqyv8nMCTEA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8878E1C006AB;
 Mon,  1 Aug 2022 15:55:26 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A47D518EA8;
 Mon,  1 Aug 2022 15:55:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 berrange@redhat.com
Subject: [PULL 5/7] misc: fix commonly doubled up words
Date: Mon,  1 Aug 2022 17:55:04 +0200
Message-Id: <20220801155506.254316-6-thuth@redhat.com>
In-Reply-To: <20220801155506.254316-1-thuth@redhat.com>
References: <20220801155506.254316-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Daniel P. Berrangé <berrange@redhat.com>

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220707163720.1421716-5-berrange@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/devel/qom.rst                     | 4 ++--
 docs/interop/live-block-operations.rst | 4 ++--
 docs/system/arm/cpu-features.rst       | 2 +-
 docs/system/devices/cxl.rst            | 2 +-
 docs/system/s390x/bootdevices.rst      | 2 +-
 docs/system/tls.rst                    | 2 +-
 docs/tools/qemu-pr-helper.rst          | 4 ++--
 hw/usb/u2f.h                           | 2 +-
 include/hw/qdev-core.h                 | 2 +-
 include/user/safe-syscall.h            | 2 +-
 block/linux-aio.c                      | 2 +-
 block/qcow2-bitmap.c                   | 8 ++++----
 contrib/plugins/cache.c                | 2 +-
 hw/core/clock.c                        | 2 +-
 hw/intc/arm_gicv3_redist.c             | 2 +-
 hw/misc/iotkit-secctl.c                | 2 +-
 hw/misc/iotkit-sysctl.c                | 4 ++--
 hw/s390x/s390-ccw.c                    | 2 +-
 linux-user/i386/cpu_loop.c             | 2 +-
 pc-bios/s390-ccw/virtio-scsi.c         | 2 +-
 target/arm/translate.c                 | 2 +-
 target/i386/cpu.c                      | 2 +-
 tests/qtest/microbit-test.c            | 6 +++---
 tools/virtiofsd/fuse_virtio.c          | 2 +-
 tcg/i386/tcg-target.c.inc              | 2 +-
 python/Makefile                        | 2 +-
 python/qemu/utils/__init__.py          | 2 +-
 27 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
index 0cf9a714f0..3e34b07c98 100644
--- a/docs/devel/qom.rst
+++ b/docs/devel/qom.rst
@@ -371,8 +371,8 @@ This accepts an array of interface type names.
                                       { TYPE_USER_CREATABLE },
                                       { NULL })
 
-If the type is not intended to be instantiated, then then
-the OBJECT_DEFINE_ABSTRACT_TYPE() macro can be used instead:
+If the type is not intended to be instantiated, then the
+OBJECT_DEFINE_ABSTRACT_TYPE() macro can be used instead:
 
 .. code-block:: c
    :caption: Defining a simple abstract type
diff --git a/docs/interop/live-block-operations.rst b/docs/interop/live-block-operations.rst
index 39e62c9915..135784ab33 100644
--- a/docs/interop/live-block-operations.rst
+++ b/docs/interop/live-block-operations.rst
@@ -53,7 +53,7 @@ files in a disk image backing chain:
 
 (1) Directional: 'base' and 'top'.  Given the simple disk image chain
     above, image [A] can be referred to as 'base', and image [B] as
-    'top'.  (This terminology can be seen in in QAPI schema file,
+    'top'.  (This terminology can be seen in the QAPI schema file,
     block-core.json.)
 
 (2) Relational: 'backing file' and 'overlay'.  Again, taking the same
@@ -825,7 +825,7 @@ entire disk image chain, to a target, using ``blockdev-mirror`` would be:
     job ready to be completed
 
 (5) Gracefully complete the 'mirror' block device job, and notice the
-    the event ``BLOCK_JOB_COMPLETED``
+    event ``BLOCK_JOB_COMPLETED``
 
 (6) Shutdown the guest by issuing the QMP ``quit`` command so that
     caches are flushed
diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index 3fd76fa0b4..c2c01ec7d2 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -284,7 +284,7 @@ SVE CPU Property Parsing Semantics
      CPU Property Dependencies and Constraints").
 
   4) If one or more vector lengths have been explicitly enabled and at
-     at least one of the dependency lengths of the maximum enabled length
+     least one of the dependency lengths of the maximum enabled length
      has been explicitly disabled, then an error is generated (see
      constraint (2) of "SVE CPU Property Dependencies and Constraints").
 
diff --git a/docs/system/devices/cxl.rst b/docs/system/devices/cxl.rst
index a57e4c4e5c..36031325cc 100644
--- a/docs/system/devices/cxl.rst
+++ b/docs/system/devices/cxl.rst
@@ -15,7 +15,7 @@ with CXL Host Bridges, which have CXL Root Ports which may be directly
 attached to CXL or PCI End Points. Alternatively there may be CXL Switches
 with CXL and PCI Endpoints attached below them.  In many cases additional
 control and capabilities are exposed via PCI Express interfaces.
-This sharing of interfaces and hence emulation code is is reflected
+This sharing of interfaces and hence emulation code is reflected
 in how the devices are emulated in QEMU. In most cases the various
 CXL elements are built upon an equivalent PCIe devices.
 
diff --git a/docs/system/s390x/bootdevices.rst b/docs/system/s390x/bootdevices.rst
index 9e591cb9dc..b5950133e8 100644
--- a/docs/system/s390x/bootdevices.rst
+++ b/docs/system/s390x/bootdevices.rst
@@ -65,7 +65,7 @@ you can specify it via the ``-global s390-ipl.netboot_fw=filename``
 command line option.
 
 The ``bootindex`` property is especially important for booting via the network.
-If you don't specify the the ``bootindex`` property here, the network bootloader
+If you don't specify the ``bootindex`` property here, the network bootloader
 firmware code won't get loaded into the guest memory so that the network boot
 will fail. For a successful network boot, try something like this::
 
diff --git a/docs/system/tls.rst b/docs/system/tls.rst
index 1a04674362..e284c82801 100644
--- a/docs/system/tls.rst
+++ b/docs/system/tls.rst
@@ -182,7 +182,7 @@ certificates.
               --template client-hostNNN.info \
               --outfile client-hostNNN-cert.pem
 
-The subject alt name extension data is not required for clients, so the
+The subject alt name extension data is not required for clients, so
 the ``dns_name`` and ``ip_address`` fields are not included. The
 ``tls_www_client`` keyword is the key purpose extension to indicate this
 certificate is intended for usage in a web client. Although QEMU network
diff --git a/docs/tools/qemu-pr-helper.rst b/docs/tools/qemu-pr-helper.rst
index eaebe40da0..c32867cfc6 100644
--- a/docs/tools/qemu-pr-helper.rst
+++ b/docs/tools/qemu-pr-helper.rst
@@ -21,8 +21,8 @@ programs because incorrect usage can disrupt regular operation of the
 storage fabric. QEMU's SCSI passthrough devices ``scsi-block``
 and ``scsi-generic`` support passing guest persistent reservation
 requests to a privileged external helper program. :program:`qemu-pr-helper`
-is that external helper; it creates a socket which QEMU can
-connect to to communicate with it.
+is that external helper; it creates a listener socket which will
+accept incoming connections for communication with QEMU.
 
 If you want to run VMs in a setup like this, this helper should be
 started as a system service, and you should read the QEMU manual
diff --git a/hw/usb/u2f.h b/hw/usb/u2f.h
index db30f3586b..a408a82927 100644
--- a/hw/usb/u2f.h
+++ b/hw/usb/u2f.h
@@ -74,7 +74,7 @@ typedef struct U2FKeyState {
 
 /*
  * API to be used by the U2F key device variants (i.e. hw/u2f-*.c)
- * to interact with the the U2F key base device (i.e. hw/u2f.c)
+ * to interact with the U2F key base device (i.e. hw/u2f.c)
  */
 void u2f_send_to_guest(U2FKeyState *key,
                        const uint8_t packet[U2FHID_PACKET_SIZE]);
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 98774e2835..785dd5a56e 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -386,7 +386,7 @@ bool qdev_realize_and_unref(DeviceState *dev, BusState *bus, Error **errp);
  *
  *  - unrealize any child buses by calling qbus_unrealize()
  *    (this will recursively unrealize any devices on those buses)
- *  - call the the unrealize method of @dev
+ *  - call the unrealize method of @dev
  *
  * The device can then be freed by causing its reference count to go
  * to zero.
diff --git a/include/user/safe-syscall.h b/include/user/safe-syscall.h
index 61a04e2b5a..ddceef12e2 100644
--- a/include/user/safe-syscall.h
+++ b/include/user/safe-syscall.h
@@ -70,7 +70,7 @@
  * If the host libc is used then the implementation will appear to work
  * most of the time, but there will be a race condition where a
  * signal could arrive just before we make the host syscall inside libc,
- * and then then guest syscall will not correctly be interrupted.
+ * and then the guest syscall will not correctly be interrupted.
  * Instead the implementation of the guest syscall can use the safe_syscall
  * function but otherwise just return the result or errno in the usual
  * way; the main loop code will take care of restarting the syscall
diff --git a/block/linux-aio.c b/block/linux-aio.c
index 9c2393a2f7..d2cfb7f523 100644
--- a/block/linux-aio.c
+++ b/block/linux-aio.c
@@ -461,7 +461,7 @@ LinuxAioState *laio_init(Error **errp)
     s = g_malloc0(sizeof(*s));
     rc = event_notifier_init(&s->e, false);
     if (rc < 0) {
-        error_setg_errno(errp, -rc, "failed to to initialize event notifier");
+        error_setg_errno(errp, -rc, "failed to initialize event notifier");
         goto out_free_state;
     }
 
diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index e98bafe0f4..ff3309846c 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -787,10 +787,10 @@ static int bitmap_list_store(BlockDriverState *bs, Qcow2BitmapList *bm_list,
         }
     }
 
-    /* Actually, even in in-place case ignoring QCOW2_OL_BITMAP_DIRECTORY is not
-     * necessary, because we drop QCOW2_AUTOCLEAR_BITMAPS when updating bitmap
-     * directory in-place (actually, turn-off the extension), which is checked
-     * in qcow2_check_metadata_overlap() */
+    /* Actually, even in the in-place case ignoring QCOW2_OL_BITMAP_DIRECTORY
+     * is not necessary, because we drop QCOW2_AUTOCLEAR_BITMAPS when updating
+     * bitmap directory in-place (actually, turn-off the extension), which is
+     * checked in qcow2_check_metadata_overlap() */
     ret = qcow2_pre_write_overlap_check(
             bs, in_place ? QCOW2_OL_BITMAP_DIRECTORY : 0, dir_offset, dir_size,
             false);
diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index b9226e7c40..ac1510aaa1 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -38,7 +38,7 @@ enum EvictionPolicy policy;
  * put in any of the blocks inside the set. The number of block per set is
  * called the associativity (assoc).
  *
- * Each block contains the the stored tag and a valid bit. Since this is not
+ * Each block contains the stored tag and a valid bit. Since this is not
  * a functional simulator, the data itself is not stored. We only identify
  * whether a block is in the cache or not by searching for its tag.
  *
diff --git a/hw/core/clock.c b/hw/core/clock.c
index 916875e07a..d82e44cd1a 100644
--- a/hw/core/clock.c
+++ b/hw/core/clock.c
@@ -68,7 +68,7 @@ static uint64_t clock_get_child_period(Clock *clk)
 {
     /*
      * Return the period to be used for child clocks, which is the parent
-     * clock period adjusted for for multiplier and divider effects.
+     * clock period adjusted for multiplier and divider effects.
      */
     return muldiv64(clk->period, clk->multiplier, clk->divider);
 }
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index f1ecb2502b..c92ceecc16 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -492,7 +492,7 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
         return MEMTX_OK;
     case GICR_WAKER:
         /* Only the ProcessorSleep bit is writable. When the guest sets
-         * it it requests that we transition the channel between the
+         * it, it requests that we transition the channel between the
          * redistributor and the cpu interface to quiescent, and that
          * we set the ChildrenAsleep bit once the inteface has reached the
          * quiescent state.
diff --git a/hw/misc/iotkit-secctl.c b/hw/misc/iotkit-secctl.c
index 7b41cfa8fc..b5a9e30a2c 100644
--- a/hw/misc/iotkit-secctl.c
+++ b/hw/misc/iotkit-secctl.c
@@ -114,7 +114,7 @@ static const uint8_t iotkit_secctl_ns_sse300_idregs[] = {
  * AHB expansion, APB expansion) are all set up so that they are
  * in 16-aligned blocks so offsets 0xN0, 0xN4, 0xN8, 0xNC are PPCs
  * 0, 1, 2, 3 of that type, so we can convert a register address offset
- * into an an index into a PPC array easily.
+ * into an index into a PPC array easily.
  */
 static inline int offset_to_ppc_idx(uint32_t offset)
 {
diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c
index 9ee8fe8495..7147e2f84e 100644
--- a/hw/misc/iotkit-sysctl.c
+++ b/hw/misc/iotkit-sysctl.c
@@ -237,7 +237,7 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
             r = s->ewctrl;
             break;
         case ARMSSE_SSE300:
-            /* In SSE300 this offset is is NMI_ENABLE */
+            /* In SSE300 this offset is NMI_ENABLE */
             r = s->nmi_enable;
             break;
         default:
@@ -555,7 +555,7 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
             s->ewctrl = value;
             break;
         case ARMSSE_SSE300:
-            /* In SSE300 this offset is is NMI_ENABLE */
+            /* In SSE300 this offset is NMI_ENABLE */
             qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl NMI_ENABLE unimplemented\n");
             s->nmi_enable = value;
             break;
diff --git a/hw/s390x/s390-ccw.c b/hw/s390x/s390-ccw.c
index 2fc8bb9c23..e2d86d96e7 100644
--- a/hw/s390x/s390-ccw.c
+++ b/hw/s390x/s390-ccw.c
@@ -57,7 +57,7 @@ IOInstEnding s390_ccw_store(SubchDev *sch)
 
     /*
      * This code is called for both virtual and passthrough devices,
-     * but only applies to to the latter.  This ugly check makes that
+     * but only applies to the latter.  This ugly check makes that
      * distinction for us.
      */
     if (object_dynamic_cast(OBJECT(sch->driver_data), TYPE_S390_CCW)) {
diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index 492701dd9a..42837399bc 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -137,7 +137,7 @@ static void emulate_vsyscall(CPUX86State *env)
     }
 
     /*
-     * Validate the the pointer arguments.
+     * Validate the pointer arguments.
      */
     switch (syscall) {
     case TARGET_NR_gettimeofday:
diff --git a/pc-bios/s390-ccw/virtio-scsi.c b/pc-bios/s390-ccw/virtio-scsi.c
index 3b7069270c..dcce696a33 100644
--- a/pc-bios/s390-ccw/virtio-scsi.c
+++ b/pc-bios/s390-ccw/virtio-scsi.c
@@ -195,7 +195,7 @@ static bool scsi_read_capacity(VDev *vdev,
 /* virtio-scsi routines */
 
 /*
- * Tries to locate a SCSI device and and adds the information for the found
+ * Tries to locate a SCSI device and adds the information for the found
  * device to the vdev->scsi_device structure.
  * Returns 0 if SCSI device could be located, or a error code < 0 otherwise
  */
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4ffb095c73..ad617b9948 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8056,7 +8056,7 @@ static TCGv_i32 op_addr_block_pre(DisasContext *s, arg_ldst_block *a, int n)
          * If the writeback is incrementing SP rather than
          * decrementing it, and the initial SP is below the
          * stack limit but the final written-back SP would
-         * be above, then then we must not perform any memory
+         * be above, then we must not perform any memory
          * accesses, but it is IMPDEF whether we generate
          * an exception. We choose to do so in this case.
          * At this point 'addr' is the lowest address, so
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6a57ef13af..194b5a31af 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3632,7 +3632,7 @@ static const X86CPUDefinition builtin_x86_defs[] = {
             CPUID_7_0_EDX_CORE_CAPABILITY,
         .features[FEAT_CORE_CAPABILITY] =
             MSR_CORE_CAP_SPLIT_LOCK_DETECT,
-        /* XSAVES is is added in version 3 */
+        /* XSAVES is added in version 3 */
         .features[FEAT_XSAVE] =
             CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
             CPUID_XSAVE_XGETBV1,
diff --git a/tests/qtest/microbit-test.c b/tests/qtest/microbit-test.c
index 04e199ec33..b71daae9a9 100644
--- a/tests/qtest/microbit-test.c
+++ b/tests/qtest/microbit-test.c
@@ -447,11 +447,11 @@ static void test_nrf51_timer(void)
 
     timer_set_bitmode(qts, NRF51_TIMER_WIDTH_16); /* 16 MHz Timer */
     timer_set_prescaler(qts, 0);
-    /* Swept over in first step */
+    /* Swept over, during the first step */
     timer_set_cc(qts, 0, 2);
-    /* Barely miss on first step */
+    /* Barely miss, after the second step */
     timer_set_cc(qts, 1, 162);
-    /* Spot on on third step */
+    /* Spot on, after the third step */
     timer_set_cc(qts, 2, 480);
 
     timer_assert_events(qts, 0, 0, 0, 0);
diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index a52eacf82e..9368e292e4 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -379,7 +379,7 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
     copy_iov(iov, count, in_sg, in_num, iov_len);
 
     /*
-     * Build a copy of the the in_sg iov so we can skip bits in it,
+     * Build a copy of the in_sg iov so we can skip bits in it,
      * including changing the offsets
      */
     in_sg_cpy = g_new(struct iovec, in_num);
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index d52206ba4d..cb04e4b3ad 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1652,7 +1652,7 @@ static void tcg_out_branch(TCGContext *s, int call, const tcg_insn_unit *dest)
     } else {
         /* rip-relative addressing into the constant pool.
            This is 6 + 8 = 14 bytes, as compared to using an
-           an immediate load 10 + 6 = 16 bytes, plus we may
+           immediate load 10 + 6 = 16 bytes, plus we may
            be able to re-use the pool constant for more calls.  */
         tcg_out_opc(s, OPC_GRP5, 0, 0, 0);
         tcg_out8(s, (call ? EXT5_CALLN_Ev : EXT5_JMPN_Ev) << 3 | 5);
diff --git a/python/Makefile b/python/Makefile
index 3334311362..b170708398 100644
--- a/python/Makefile
+++ b/python/Makefile
@@ -29,7 +29,7 @@ help:
 	@echo "    Performs no environment setup of any kind."
 	@echo ""
 	@echo "make develop:"
-	@echo "    Install deps needed for for 'make check',"
+	@echo "    Install deps needed for 'make check',"
 	@echo "    and install the qemu package in editable mode."
 	@echo "    (Can be used in or outside of a venv.)"
 	@echo ""
diff --git a/python/qemu/utils/__init__.py b/python/qemu/utils/__init__.py
index 9fb273b13d..017cfdcda7 100644
--- a/python/qemu/utils/__init__.py
+++ b/python/qemu/utils/__init__.py
@@ -79,7 +79,7 @@ def add_visual_margin(
     :param content: The text to wrap and decorate.
     :param width:
         The number of columns to use, including for the decoration
-        itself. The default (None) uses the the available width of the
+        itself. The default (None) uses the available width of the
         current terminal, or a fallback of 72 lines. A negative number
         subtracts a fixed-width from the default size. The default obeys
         the COLUMNS environment variable, if set.
-- 
2.31.1


