Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F43552147
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 05:37:50 +0200 (CEST)
Received: from localhost ([::1]:56214 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfcHF-0006D8-Dy
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 23:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42978)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <yan.y.zhao@intel.com>) id 1hfcG7-0005nD-IO
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 23:36:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yan.y.zhao@intel.com>) id 1hfcG5-0007RN-3F
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 23:36:39 -0400
Received: from mga02.intel.com ([134.134.136.20]:13922)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
 id 1hfcG1-0007A3-4C
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 23:36:34 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jun 2019 20:36:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,413,1557212400"; d="scan'208";a="155374195"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by orsmga008.jf.intel.com with ESMTP; 24 Jun 2019 20:36:23 -0700
Date: Mon, 24 Jun 2019 23:30:29 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <20190625033029.GC6971@joy-OptiPlex-7040>
References: <1561041461-22326-1-git-send-email-kwankhede@nvidia.com>
 <1561041461-22326-9-git-send-email-kwankhede@nvidia.com>
 <20190621003153.GG9303@joy-OptiPlex-7040>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621003153.GG9303@joy-OptiPlex-7040>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.20
Subject: Re: [Qemu-devel] [PATCH v4 08/13] vfio: Add save state functions to
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
Cc: "pasic@linux.ibm.com" <pasic@linux.ibm.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "cjia@nvidia.com" <cjia@nvidia.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Zhengxiao.zx@Alibaba-inc.com" <Zhengxiao.zx@Alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "yulei.zhang@intel.com" <yulei.zhang@intel.com>,
 "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "eauger@redhat.com" <eauger@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Liu,
 Changpeng" <changpeng.liu@intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 21, 2019 at 08:31:53AM +0800, Yan Zhao wrote:
> On Thu, Jun 20, 2019 at 10:37:36PM +0800, Kirti Wankhede wrote:
> > Added .save_live_pending, .save_live_iterate and .save_live_complete_precopy
> > functions. These functions handles pre-copy and stop-and-copy phase.
> > 
> > In _SAVING|_RUNNING device state or pre-copy phase:
> > - read pending_bytes
> > - read data_offset - indicates kernel driver to write data to staging
> >   buffer which is mmapped.
> > - read data_size - amount of data in bytes written by vendor driver in migration
> >   region.
> > - if data section is trapped, pread() number of bytes in data_size, from
> >   data_offset.
> > - if data section is mmaped, read mmaped buffer of size data_size.
> > - Write data packet to file stream as below:
> > {VFIO_MIG_FLAG_DEV_DATA_STATE, data_size, actual data,
> > VFIO_MIG_FLAG_END_OF_STATE }
> > 
> > In _SAVING device state or stop-and-copy phase
> > a. read config space of device and save to migration file stream. This
> >    doesn't need to be from vendor driver. Any other special config state
> >    from driver can be saved as data in following iteration.
> > b. read pending_bytes - indicates kernel driver to write data to staging
> >    buffer which is mmapped.
> > c. read data_size - amount of data in bytes written by vendor driver in
> >    migration region.
> > d. if data section is trapped, pread() from data_offset of size data_size.
> > e. if data section is mmaped, read mmaped buffer of size data_size.
> > f. Write data packet as below:
> >    {VFIO_MIG_FLAG_DEV_DATA_STATE, data_size, actual data}
> > g. iterate through steps b to f until (pending_bytes > 0)
> > h. Write {VFIO_MIG_FLAG_END_OF_STATE}
> > 
> > .save_live_iterate runs outside the iothread lock in the migration case, which
> > could race with asynchronous call to get dirty page list causing data corruption
> > in mapped migration region. Mutex added here to serial migration buffer read
> > operation.
> > 
> > Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> > Reviewed-by: Neo Jia <cjia@nvidia.com>
> > ---
> >  hw/vfio/migration.c | 212 ++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 212 insertions(+)
> > 
> > diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> > index fe0887c27664..0a2f30872316 100644
> > --- a/hw/vfio/migration.c
> > +++ b/hw/vfio/migration.c
> > @@ -107,6 +107,111 @@ static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t state)
> >      return 0;
> >  }
> >  
> > +static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev)
> > +{
> > +    VFIOMigration *migration = vbasedev->migration;
> > +    VFIORegion *region = &migration->region.buffer;
> > +    uint64_t data_offset = 0, data_size = 0;
> > +    int ret;
> > +
> > +    ret = pread(vbasedev->fd, &data_offset, sizeof(data_offset),
> > +                region->fd_offset + offsetof(struct vfio_device_migration_info,
> > +                                             data_offset));
> > +    if (ret != sizeof(data_offset)) {
> > +        error_report("Failed to get migration buffer data offset %d",
> > +                     ret);
> > +        return -EINVAL;
> > +    }
> > +
> > +    ret = pread(vbasedev->fd, &data_size, sizeof(data_size),
> > +                region->fd_offset + offsetof(struct vfio_device_migration_info,
> > +                                             data_size));
> > +    if (ret != sizeof(data_size)) {
> > +        error_report("Failed to get migration buffer data size %d",
> > +                     ret);
> > +        return -EINVAL;
> > +    }
> > +
> how big is the data_size ? 
> if this size is too big, it may take too much time and block others.
> 
> > +    if (data_size > 0) {
> > +        void *buf = NULL;
> > +        bool buffer_mmaped = false;
> > +
> > +        if (region->mmaps) {
> > +            int i;
> > +
> > +            for (i = 0; i < region->nr_mmaps; i++) {
> > +                if ((data_offset >= region->mmaps[i].offset) &&
> > +                    (data_offset < region->mmaps[i].offset +
> > +                                   region->mmaps[i].size)) {
> > +                    buf = region->mmaps[i].mmap + (data_offset -
> > +                                                   region->mmaps[i].offset);
> > +                    buffer_mmaped = true;
> > +                    break;
> > +                }
> > +            }
> > +        }
> > +
> > +        if (!buffer_mmaped) {
> > +            buf = g_malloc0(data_size);
> > +            ret = pread(vbasedev->fd, buf, data_size,
> > +                        region->fd_offset + data_offset);
> > +            if (ret != data_size) {
> > +                error_report("Failed to get migration data %d", ret);
> > +                g_free(buf);
> > +                return -EINVAL;
> > +            }
> > +        }
> > +
> > +        qemu_put_be64(f, data_size);
> > +        qemu_put_buffer(f, buf, data_size);
> > +
> > +        if (!buffer_mmaped) {
> > +            g_free(buf);
> > +        }
> > +        migration->pending_bytes -= data_size;
> > +    } else {
> > +        qemu_put_be64(f, data_size);
> > +    }
> > +
> > +    ret = qemu_file_get_error(f);
> > +
> > +    return data_size;
> > +}
> > +
> > +static int vfio_update_pending(VFIODevice *vbasedev)
> > +{
> > +    VFIOMigration *migration = vbasedev->migration;
> > +    VFIORegion *region = &migration->region.buffer;
> > +    uint64_t pending_bytes = 0;
> > +    int ret;
> > +
> > +    ret = pread(vbasedev->fd, &pending_bytes, sizeof(pending_bytes),
> > +                region->fd_offset + offsetof(struct vfio_device_migration_info,
> > +                                             pending_bytes));
> > +    if ((ret < 0) || (ret != sizeof(pending_bytes))) {
> > +        error_report("Failed to get pending bytes %d", ret);
> > +        migration->pending_bytes = 0;
> > +        return (ret < 0) ? ret : -EINVAL;
> > +    }
> > +
> > +    migration->pending_bytes = pending_bytes;
> > +    return 0;
> > +}
> > +
> > +static int vfio_save_device_config_state(QEMUFile *f, void *opaque)
> > +{
> > +    VFIODevice *vbasedev = opaque;
> > +
> > +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_CONFIG_STATE);
> > +
> > +    if (vbasedev->type == VFIO_DEVICE_TYPE_PCI) {
> > +        vfio_pci_save_config(vbasedev, f);
> > +    }
> > +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
> > +
> > +    return qemu_file_get_error(f);
> > +}
> > +
> >  /* ---------------------------------------------------------------------- */
> >  
> >  static int vfio_save_setup(QEMUFile *f, void *opaque)
> > @@ -163,9 +268,116 @@ static void vfio_save_cleanup(void *opaque)
> >      }
> >  }
> >  
> > +static void vfio_save_pending(QEMUFile *f, void *opaque,
> > +                              uint64_t threshold_size,
> > +                              uint64_t *res_precopy_only,
> > +                              uint64_t *res_compatible,
> > +                              uint64_t *res_postcopy_only)
> > +{
> > +    VFIODevice *vbasedev = opaque;
> > +    VFIOMigration *migration = vbasedev->migration;
> > +    int ret;
> > +
> > +    ret = vfio_update_pending(vbasedev);
> > +    if (ret) {
> > +        return;
> > +    }
> > +
> > +    if (vbasedev->device_state & VFIO_DEVICE_STATE_RUNNING) {
> > +        *res_precopy_only += migration->pending_bytes;
> > +    } else {
> > +        *res_postcopy_only += migration->pending_bytes;
> > +    }
by definition,
- res_precopy_only is for data which must be migrated in precopy phase
   or in stopped state, in other words - before target vm start
- res_postcopy_only is for data which must be migrated in postcopy phase
  or in stopped state, in other words - after source vm stop
So, we can only determining data type by the nature of the data. i.e.
if it is device state data which must be copied after source vm stop and
before target vm start, it belongs to res_precopy_only.

It is not right to determining data type by current device state.

Thanks
Yan

> > +    *res_compatible += 0;
> > +}
> > +
> > +static int vfio_save_iterate(QEMUFile *f, void *opaque)
> > +{
> > +    VFIODevice *vbasedev = opaque;
> > +    VFIOMigration *migration = vbasedev->migration;
> > +    int ret;
> > +
> > +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
> > +
> > +    qemu_mutex_lock(&migration->lock);
> > +    ret = vfio_save_buffer(f, vbasedev);
> > +    qemu_mutex_unlock(&migration->lock);
> > +
> > +    if (ret < 0) {
> > +        error_report("vfio_save_buffer failed %s",
> > +                     strerror(errno));
> > +        return ret;
> > +    }
> > +
> > +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
> > +
> > +    ret = qemu_file_get_error(f);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> > +static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
> > +{
> > +    VFIODevice *vbasedev = opaque;
> > +    VFIOMigration *migration = vbasedev->migration;
> > +    int ret;
> > +
> > +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_SAVING);
> > +    if (ret) {
> > +        error_report("Failed to set state STOP and SAVING");
> > +        return ret;
> > +    }
> > +
> > +    ret = vfio_save_device_config_state(f, opaque);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +
> > +    ret = vfio_update_pending(vbasedev);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +
> > +    while (migration->pending_bytes > 0) {
> > +        qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
> > +        ret = vfio_save_buffer(f, vbasedev);
> > +        if (ret < 0) {
> > +            error_report("Failed to save buffer");
> > +            return ret;
> > +        } else if (ret == 0) {
> > +            break;
> > +        }
> > +
> > +        ret = vfio_update_pending(vbasedev);
> > +        if (ret) {
> > +            return ret;
> > +        }
> > +    }
> > +
> > +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
> > +
> > +    ret = qemu_file_get_error(f);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +
> > +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOPPED);
> > +    if (ret) {
> > +        error_report("Failed to set state STOPPED");
> > +        return ret;
> > +    }
> > +    return ret;
> > +}
> > +
> >  static SaveVMHandlers savevm_vfio_handlers = {
> >      .save_setup = vfio_save_setup,
> >      .save_cleanup = vfio_save_cleanup,
> > +    .save_live_pending = vfio_save_pending,
> > +    .save_live_iterate = vfio_save_iterate,
> > +    .save_live_complete_precopy = vfio_save_complete_precopy,
> >  };
> >  
> >  /* ---------------------------------------------------------------------- */
> > -- 
> > 2.7.0
> > 
> 

