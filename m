Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD1B664C2
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 04:58:45 +0200 (CEST)
Received: from localhost ([::1]:46342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlllk-00029h-CU
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 22:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50939)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <yan.y.zhao@intel.com>) id 1hlllX-0001ke-04
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 22:58:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yan.y.zhao@intel.com>) id 1hlllV-0003ta-Gs
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 22:58:30 -0400
Received: from mga03.intel.com ([134.134.136.65]:14592)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
 id 1hlllV-0003rX-6c
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 22:58:29 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jul 2019 19:58:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,480,1557212400"; d="scan'208";a="186512139"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2019 19:58:14 -0700
Date: Thu, 11 Jul 2019 22:52:13 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <20190712025213.GH9176@joy-OptiPlex-7040>
References: <1562665760-26158-1-git-send-email-kwankhede@nvidia.com>
 <1562665760-26158-11-git-send-email-kwankhede@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562665760-26158-11-git-send-email-kwankhede@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
Subject: Re: [Qemu-devel] [PATCH v7 10/13] vfio: Add load state functions to
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
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
Cc: "Zhengxiao.zx@Alibaba-inc.com" <Zhengxiao.zx@Alibaba-inc.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "cjia@nvidia.com" <cjia@nvidia.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "eauger@redhat.com" <eauger@redhat.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>, "Liu,
 Changpeng" <changpeng.liu@intel.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 09, 2019 at 05:49:17PM +0800, Kirti Wankhede wrote:
> Flow during _RESUMING device state:
> - If Vendor driver defines mappable region, mmap migration region.
> - Load config state.
> - For data packet, till VFIO_MIG_FLAG_END_OF_STATE is not reached
>     - read data_size from packet, read buffer of data_size
>     - read data_offset from where QEMU should write data.
>         if region is mmaped, write data of data_size to mmaped region.
>     - write data_size.
>         In case of mmapped region, write to data_size indicates kernel
>         driver that data is written in staging buffer.
>     - if region is trapped, pwrite() data of data_size from data_offset.
> - Repeat above until VFIO_MIG_FLAG_END_OF_STATE.
> - Unmap migration region.
> 
> For user, data is opaque. User should write data in the same order as
> received.
> 
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> Reviewed-by: Neo Jia <cjia@nvidia.com>
> ---
>  hw/vfio/migration.c  | 162 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  hw/vfio/trace-events |   3 +
>  2 files changed, 165 insertions(+)
> 
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 4e9b4cce230b..5fb4c5329ede 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -249,6 +249,26 @@ static int vfio_save_device_config_state(QEMUFile *f, void *opaque)
>      return qemu_file_get_error(f);
>  }
>  
> +static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +    uint64_t data;
> +
> +    if (vbasedev->ops && vbasedev->ops->vfio_load_config) {
> +        vbasedev->ops->vfio_load_config(vbasedev, f);
> +    }
> +
> +    data = qemu_get_be64(f);
> +    if (data != VFIO_MIG_FLAG_END_OF_STATE) {
> +        error_report("%s: Failed loading device config space, "
> +                     "end flag incorrect 0x%"PRIx64, vbasedev->name, data);
> +        return -EINVAL;
> +    }
> +
> +    trace_vfio_load_device_config_state(vbasedev->name);
> +    return qemu_file_get_error(f);
> +}
> +
>  /* ---------------------------------------------------------------------- */
>  
>  static int vfio_save_setup(QEMUFile *f, void *opaque)
> @@ -421,12 +441,154 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>      return ret;
>  }
>  
> +static int vfio_load_setup(QEMUFile *f, void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +    VFIOMigration *migration = vbasedev->migration;
> +    int ret = 0;
> +
> +    if (migration->region.buffer.mmaps) {
> +        ret = vfio_region_mmap(&migration->region.buffer);
> +        if (ret) {
> +            error_report("%s: Failed to mmap VFIO migration region %d: %s",
> +                         vbasedev->name, migration->region.index,
> +                         strerror(-ret));
> +            return ret;
> +        }
> +    }
> +
> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RESUMING);
> +    if (ret) {
> +        error_report("%s: Failed to set state RESUMING", vbasedev->name);
> +    }
> +    return ret;
> +}
> +
> +static int vfio_load_cleanup(void *opaque)
> +{
> +    vfio_save_cleanup(opaque);
> +    return 0;
> +}
> +
> +static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
> +{
> +    VFIODevice *vbasedev = opaque;
> +    VFIOMigration *migration = vbasedev->migration;
> +    int ret = 0;
> +    uint64_t data, data_size;
> +
I think checking of version_id is still needed.

Thanks
Yan

> +    data = qemu_get_be64(f);
> +    while (data != VFIO_MIG_FLAG_END_OF_STATE) {
> +
> +        trace_vfio_load_state(vbasedev->name, data);
> +
> +        switch (data) {
> +        case VFIO_MIG_FLAG_DEV_CONFIG_STATE:
> +        {
> +            ret = vfio_load_device_config_state(f, opaque);
> +            if (ret) {
> +                return ret;
> +            }
> +            break;
> +        }
> +        case VFIO_MIG_FLAG_DEV_SETUP_STATE:
> +        {
> +            data = qemu_get_be64(f);
> +            if (data == VFIO_MIG_FLAG_END_OF_STATE) {
> +                return ret;
> +            } else {
> +                error_report("%s: SETUP STATE: EOS not found 0x%"PRIx64,
> +                             vbasedev->name, data);
> +                return -EINVAL;
> +            }
> +            break;
> +        }
> +        case VFIO_MIG_FLAG_DEV_DATA_STATE:
> +        {
> +            VFIORegion *region = &migration->region.buffer;
> +            void *buf = NULL;
> +            bool buffer_mmaped = false;
> +            uint64_t data_offset = 0;
> +
> +            data_size = qemu_get_be64(f);
> +            if (data_size == 0) {
> +                break;
> +            }
> +
> +            ret = pread(vbasedev->fd, &data_offset, sizeof(data_offset),
> +                        region->fd_offset +
> +                        offsetof(struct vfio_device_migration_info,
> +                        data_offset));
> +            if (ret != sizeof(data_offset)) {
> +                error_report("%s:Failed to get migration buffer data offset %d",
> +                             vbasedev->name, ret);
> +                return -EINVAL;
> +            }
> +
> +            if (region->mmaps) {
> +                buf = find_data_region(region, data_offset, data_size);
> +            }
> +
> +            buffer_mmaped = (buf != NULL) ? true : false;
> +
> +            if (!buffer_mmaped) {
> +                buf = g_try_malloc0(data_size);
> +                if (!buf) {
> +                    error_report("%s: Error allocating buffer ", __func__);
> +                    return -ENOMEM;
> +                }
> +            }
> +
> +            qemu_get_buffer(f, buf, data_size);
> +
> +            ret = pwrite(vbasedev->fd, &data_size, sizeof(data_size),
> +                         region->fd_offset +
> +                       offsetof(struct vfio_device_migration_info, data_size));
> +            if (ret != sizeof(data_size)) {
> +                error_report("%s: Failed to set migration buffer data size %d",
> +                             vbasedev->name, ret);
> +                if (!buffer_mmaped) {
> +                    g_free(buf);
> +                }
> +                return -EINVAL;
> +            }
> +
> +            if (!buffer_mmaped) {
> +                ret = pwrite(vbasedev->fd, buf, data_size,
> +                             region->fd_offset + data_offset);
> +                g_free(buf);
> +
> +                if (ret != data_size) {
> +                    error_report("%s: Failed to set migration buffer %d",
> +                                 vbasedev->name, ret);
> +                    return -EINVAL;
> +                }
> +            }
> +            trace_vfio_load_state_device_data(vbasedev->name, data_offset,
> +                                              data_size);
> +            break;
> +        }
> +        }
> +
> +        ret = qemu_file_get_error(f);
> +        if (ret) {
> +            return ret;
> +        }
> +        data = qemu_get_be64(f);
> +    }
> +
> +    return ret;
> +}
> +
>  static SaveVMHandlers savevm_vfio_handlers = {
>      .save_setup = vfio_save_setup,
>      .save_cleanup = vfio_save_cleanup,
>      .save_live_pending = vfio_save_pending,
>      .save_live_iterate = vfio_save_iterate,
>      .save_live_complete_precopy = vfio_save_complete_precopy,
> +    .load_setup = vfio_load_setup,
> +    .load_cleanup = vfio_load_cleanup,
> +    .load_state = vfio_load_state,
>  };
>  
>  /* ---------------------------------------------------------------------- */
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index bdf40ba368c7..ac065b559f4e 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -157,3 +157,6 @@ vfio_save_device_config_state(char *name) " (%s)"
>  vfio_save_pending(char *name, uint64_t precopy, uint64_t postcopy, uint64_t compatible) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" compatible 0x%"PRIx64
>  vfio_save_iterate(char *name, int data_size) " (%s) data_size %d"
>  vfio_save_complete_precopy(char *name) " (%s)"
> +vfio_load_device_config_state(char *name) " (%s)"
> +vfio_load_state(char *name, uint64_t data) " (%s) data 0x%"PRIx64
> +vfio_load_state_device_data(char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
> -- 
> 2.7.0
> 

