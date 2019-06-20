Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 874DE4D1F1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 17:19:23 +0200 (CEST)
Received: from localhost ([::1]:49078 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdyqQ-0005ib-LM
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 11:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37934)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwankhede@nvidia.com>) id 1hdyKF-00061c-GQ
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 10:46:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwankhede@nvidia.com>) id 1hdyKD-0005mK-5C
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 10:46:07 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:13252)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwankhede@nvidia.com>)
 id 1hdyKC-0005kJ-S4
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 10:46:05 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d0b9afa0000>; Thu, 20 Jun 2019 07:40:58 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 20 Jun 2019 07:40:58 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 20 Jun 2019 07:40:58 -0700
Received: from HQMAIL112.nvidia.com (172.18.146.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 20 Jun
 2019 14:40:58 +0000
Received: from HQMAIL106.nvidia.com (172.18.146.12) by HQMAIL112.nvidia.com
 (172.18.146.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 20 Jun
 2019 14:40:58 +0000
Received: from kwankhede-dev.nvidia.com (172.20.13.39) by HQMAIL.nvidia.com
 (172.18.146.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 20 Jun 2019 14:40:51 +0000
From: Kirti Wankhede <kwankhede@nvidia.com>
To: <alex.williamson@redhat.com>, <cjia@nvidia.com>
Date: Thu, 20 Jun 2019 20:07:37 +0530
Message-ID: <1561041461-22326-10-git-send-email-kwankhede@nvidia.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1561041461-22326-1-git-send-email-kwankhede@nvidia.com>
References: <1561041461-22326-1-git-send-email-kwankhede@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1561041658; bh=8hz/KBF+f4hKDwTOMIRwStk2ND+CbU1c/DAfrF19Fl8=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=GbAk5a3UrJmRWROOARo2hYK1i+DawdbEQUX/IGs4veiavd7k9qvkUWTb/3HzlMV5F
 4zgqcCptbqOW8vBh/gIt27eCcllwQuv0ExiDW//qrQgtSJ87Sp5iF2eZksFwam00Mp
 jHxWKAu/G8AeZTt4FYy+yVFGsA/vQHIDHDEPekT1LWJY9+C3VkOwI8j5bLj6NFfPwG
 27qN60TV+bBfhV/SqcfRMCHrXKaYnqNUnhzth/fmiYkISjdm7qaC6FJnEUVZbR2FrK
 clqpYHnLQHtERfhTC5Yglrb4ytjbb1Q31Nb1xQblDP0TfH7I4xWmOQY4RO620hrXp0
 1/5QrzhoeuHGQ==
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 216.228.121.143
Subject: [Qemu-devel] [PATCH v4 09/13] vfio: Add load state functions to
 SaveVMHandlers
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
Cc: Kirti Wankhede <kwankhede@nvidia.com>, Zhengxiao.zx@Alibaba-inc.com,
 kevin.tian@intel.com, yi.l.liu@intel.com, yan.y.zhao@intel.com,
 eskultet@redhat.com, ziye.yang@intel.com, qemu-devel@nongnu.org,
 cohuck@redhat.com, shuangtai.tst@alibaba-inc.com, dgilbert@redhat.com,
 zhi.a.wang@intel.com, mlevitsk@redhat.com, pasic@linux.ibm.com, aik@ozlabs.ru,
 yulei.zhang@intel.com, eauger@redhat.com, felipe@nutanix.com,
 jonathan.davies@nutanix.com, changpeng.liu@intel.com, Ken.Xue@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

During _RESUMING device state:
- If Vendor driver defines mappable region, mmap migration region.
- Load config state.
- For data packet, till VFIO_MIG_FLAG_END_OF_STATE is not reached
    - read data_size from packet, read buffer of data_size
    - read data_offset from where QEMU should write data.
        if region is mmaped, write data of data_size to mmaped region.
    - write data_size.
        In case of mmapped region, write to data_size indicates kernel
        driver that data is written in staging buffer.
    - if region is trapped, pwrite() data of data_size from data_offset.
- Repeat above until VFIO_MIG_FLAG_END_OF_STATE.
- Unmap migration region.

Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
Reviewed-by: Neo Jia <cjia@nvidia.com>
---
 hw/vfio/migration.c | 153 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 0a2f30872316..e4895f91761d 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -212,6 +212,22 @@ static int vfio_save_device_config_state(QEMUFile *f, void *opaque)
     return qemu_file_get_error(f);
 }
 
+static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+
+    if (vbasedev->type == VFIO_DEVICE_TYPE_PCI) {
+        vfio_pci_load_config(vbasedev, f);
+    }
+
+    if (qemu_get_be64(f) != VFIO_MIG_FLAG_END_OF_STATE) {
+        error_report("Wrong end of block while loading device config space");
+        return -EINVAL;
+    }
+
+    return qemu_file_get_error(f);
+}
+
 /* ---------------------------------------------------------------------- */
 
 static int vfio_save_setup(QEMUFile *f, void *opaque)
@@ -372,12 +388,149 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
     return ret;
 }
 
+static int vfio_load_setup(QEMUFile *f, void *opaque)
+{
+    VFIODevice *vbasedev = opaque;
+    VFIOMigration *migration = vbasedev->migration;
+    int ret = 0;
+
+    if (migration->region.buffer.mmaps) {
+        ret = vfio_region_mmap(&migration->region.buffer);
+        if (ret) {
+            error_report("Failed to mmap VFIO migration region %d: %s",
+                         migration->region.index, strerror(-ret));
+            return ret;
+        }
+    }
+
+    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RESUMING);
+    if (ret) {
+        error_report("Failed to set state RESUMING");
+    }
+    return ret;
+}
+
+static int vfio_load_cleanup(void *opaque)
+{
+    vfio_save_cleanup(opaque);
+    return 0;
+}
+
+static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
+{
+    VFIODevice *vbasedev = opaque;
+    VFIOMigration *migration = vbasedev->migration;
+    int ret = 0;
+    uint64_t data, data_size;
+
+    data = qemu_get_be64(f);
+    while (data != VFIO_MIG_FLAG_END_OF_STATE) {
+        switch (data) {
+        case VFIO_MIG_FLAG_DEV_CONFIG_STATE:
+        {
+            ret = vfio_load_device_config_state(f, opaque);
+            if (ret) {
+                return ret;
+            }
+            break;
+        }
+        case VFIO_MIG_FLAG_DEV_SETUP_STATE:
+        {
+            data = qemu_get_be64(f);
+            if (data == VFIO_MIG_FLAG_END_OF_STATE) {
+                return ret;
+            } else {
+                error_report("SETUP STATE: EOS not found 0x%lx", data);
+                return -EINVAL;
+            }
+            break;
+        }
+        case VFIO_MIG_FLAG_DEV_DATA_STATE:
+        {
+            VFIORegion *region = &migration->region.buffer;
+            void *buf = NULL;
+            bool buffer_mmaped = false;
+            uint64_t data_offset = 0;
+
+            data_size = qemu_get_be64(f);
+            if (data_size == 0) {
+                break;
+            }
+
+            ret = pread(vbasedev->fd, &data_offset, sizeof(data_offset),
+                        region->fd_offset +
+                        offsetof(struct vfio_device_migration_info,
+                        data_offset));
+            if (ret != sizeof(data_offset)) {
+                error_report("Failed to get migration buffer data offset %d",
+                              ret);
+                return -EINVAL;
+            }
+
+            if (region->mmaps) {
+                int i;
+
+                for (i = 0; i < region->nr_mmaps; i++) {
+                    if (region->mmaps[i].mmap &&
+                        (data_offset >= region->mmaps[i].offset) &&
+                        (data_offset < region->mmaps[i].offset +
+                                       region->mmaps[i].size)) {
+                        buf = region->mmaps[i].mmap + (data_offset -
+                                                      region->mmaps[i].offset);
+                        buffer_mmaped = true;
+                        break;
+                    }
+                }
+            }
+
+            if (!buffer_mmaped) {
+                buf = g_malloc0(data_size);
+            }
+
+            qemu_get_buffer(f, buf, data_size);
+
+            ret = pwrite(vbasedev->fd, &data_size, sizeof(data_size),
+                         region->fd_offset +
+                       offsetof(struct vfio_device_migration_info, data_size));
+            if (ret != sizeof(data_size)) {
+                error_report("Failed to set migration buffer data size %d",
+                             ret);
+                return -EINVAL;
+            }
+
+            if (!buffer_mmaped) {
+                ret = pwrite(vbasedev->fd, buf, data_size,
+                             region->fd_offset + data_offset);
+                g_free(buf);
+
+                if (ret != data_size) {
+                    error_report("Failed to set migration buffer %d", ret);
+                    return -EINVAL;
+                }
+            }
+            break;
+        }
+        }
+
+        ret = qemu_file_get_error(f);
+        if (ret) {
+            return ret;
+        }
+        data = qemu_get_be64(f);
+    }
+
+    return ret;
+}
+
 static SaveVMHandlers savevm_vfio_handlers = {
     .save_setup = vfio_save_setup,
     .save_cleanup = vfio_save_cleanup,
     .save_live_pending = vfio_save_pending,
     .save_live_iterate = vfio_save_iterate,
     .save_live_complete_precopy = vfio_save_complete_precopy,
+    .load_setup = vfio_load_setup,
+    .load_cleanup = vfio_load_cleanup,
+    .load_state = vfio_load_state,
 };
 
 /* ---------------------------------------------------------------------- */
-- 
2.7.0


