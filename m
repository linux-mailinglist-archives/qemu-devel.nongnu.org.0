Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B666B4E0AE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 08:57:07 +0200 (CEST)
Received: from localhost ([::1]:55118 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heDTu-0006D5-U9
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 02:57:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56672)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwankhede@nvidia.com>) id 1heDLN-0008Eu-2f
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 02:48:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwankhede@nvidia.com>) id 1heDCC-0004LP-UK
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 02:38:50 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:17152)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwankhede@nvidia.com>)
 id 1heDCC-0004JC-14
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 02:38:48 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d0c7b740000>; Thu, 20 Jun 2019 23:38:44 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 20 Jun 2019 23:38:42 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 20 Jun 2019 23:38:42 -0700
Received: from [10.24.71.210] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 21 Jun
 2019 06:38:32 +0000
To: Alex Williamson <alex.williamson@redhat.com>
References: <1561041461-22326-1-git-send-email-kwankhede@nvidia.com>
 <1561041461-22326-9-git-send-email-kwankhede@nvidia.com>
 <20190620132505.1cf64ac5@x1.home>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <9256515a-f815-58e1-c9ca-81d64bac6db1@nvidia.com>
Date: Fri, 21 Jun 2019 12:08:26 +0530
MIME-Version: 1.0
In-Reply-To: <20190620132505.1cf64ac5@x1.home>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1561099124; bh=Eexj3FijL5GRfasXvd/K2eVD0H6Q5w3bzGmMbqGkbx4=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=m5PgaNpBD9rqM3FTeB7HaFl23k+6V0q/vOfhdggKWcIkpGsl5uM2jz0VPHI3vBGFW
 PXrQkRu2xhX23mqJtaH9cSWPjLlZMbqJNmRso9N5wiL2fF5Z3/fHLVODRHrr6gzwq6
 etzf0MReNuWwFbTd/Qal1DByj87WAqr3g3YFpFBn0Tk4DXoEn+slgneWYIwfdm/fuh
 hZ3R7cB0/dZQnbnkTbM8l7Ee8hpFwONDyI/4vXo6bETjeFagILxs204LBwlOwgpxSg
 wJryZqxUBkRQg/Hhrq+ToRTCwW+F8v5qklIuE2BmJ1oji/ACHUb9vXZjhhXaJQZWQD
 EJCNv6+TMKNgg==
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 216.228.121.64
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
Cc: Zhengxiao.zx@Alibaba-inc.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 cjia@nvidia.com, eskultet@redhat.com, ziye.yang@intel.com,
 qemu-devel@nongnu.org, cohuck@redhat.com, shuangtai.tst@alibaba-inc.com,
 dgilbert@redhat.com, zhi.a.wang@intel.com, mlevitsk@redhat.com,
 pasic@linux.ibm.com, aik@ozlabs.ru, yulei.zhang@intel.com, eauger@redhat.com,
 felipe@nutanix.com, jonathan.davies@nutanix.com, yan.y.zhao@intel.com,
 changpeng.liu@intel.com, Ken.Xue@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/21/2019 12:55 AM, Alex Williamson wrote:
> On Thu, 20 Jun 2019 20:07:36 +0530
> Kirti Wankhede <kwankhede@nvidia.com> wrote:
> 
>> Added .save_live_pending, .save_live_iterate and .save_live_complete_precopy
>> functions. These functions handles pre-copy and stop-and-copy phase.
>>
>> In _SAVING|_RUNNING device state or pre-copy phase:
>> - read pending_bytes
>> - read data_offset - indicates kernel driver to write data to staging
>>   buffer which is mmapped.
> 
> Why is data_offset the trigger rather than data_size?  It seems that
> data_offset can't really change dynamically since it might be mmap'd,
> so it seems unnatural to bother re-reading it.
> 

Vendor driver can change data_offset, he can have different data_offset
for device data and dirty pages bitmap.

>> - read data_size - amount of data in bytes written by vendor driver in migration
>>   region.
>> - if data section is trapped, pread() number of bytes in data_size, from
>>   data_offset.
>> - if data section is mmaped, read mmaped buffer of size data_size.
>> - Write data packet to file stream as below:
>> {VFIO_MIG_FLAG_DEV_DATA_STATE, data_size, actual data,
>> VFIO_MIG_FLAG_END_OF_STATE }
>>
>> In _SAVING device state or stop-and-copy phase
>> a. read config space of device and save to migration file stream. This
>>    doesn't need to be from vendor driver. Any other special config state
>>    from driver can be saved as data in following iteration.
>> b. read pending_bytes - indicates kernel driver to write data to staging
>>    buffer which is mmapped.
> 
> Is it pending_bytes or data_offset that triggers the write out of
> data?  Why pending_bytes vs data_size?  I was interpreting
> pending_bytes as the total data size while data_size is the size
> available to read now, so assumed data_size would be more closely
> aligned to making the data available.
> 

Sorry, that's my mistake while editing, its read data_offset as in above
case.

>> c. read data_size - amount of data in bytes written by vendor driver in
>>    migration region.
>> d. if data section is trapped, pread() from data_offset of size data_size.
>> e. if data section is mmaped, read mmaped buffer of size data_size.
> 
> Should this read as "pread() from data_offset of data_size, or
> optionally if mmap is supported on the data area, read data_size from
> start of mapped buffer"?  IOW, pread should always work.  Same in
> previous section.
> 

ok. I'll update.

>> f. Write data packet as below:
>>    {VFIO_MIG_FLAG_DEV_DATA_STATE, data_size, actual data}
>> g. iterate through steps b to f until (pending_bytes > 0)
> 
> s/until/while/

Ok.

> 
>> h. Write {VFIO_MIG_FLAG_END_OF_STATE}
>>
>> .save_live_iterate runs outside the iothread lock in the migration case, which
>> could race with asynchronous call to get dirty page list causing data corruption
>> in mapped migration region. Mutex added here to serial migration buffer read
>> operation.
> 
> Would we be ahead to use different offsets within the region for device
> data vs dirty bitmap to avoid this?
>

Lock will still be required to serialize the read/write operations on
vfio_device_migration_info structure in the region.


>> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
>> Reviewed-by: Neo Jia <cjia@nvidia.com>
>> ---
>>  hw/vfio/migration.c | 212 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 212 insertions(+)
>>
>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>> index fe0887c27664..0a2f30872316 100644
>> --- a/hw/vfio/migration.c
>> +++ b/hw/vfio/migration.c
>> @@ -107,6 +107,111 @@ static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t state)
>>      return 0;
>>  }
>>  
>> +static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev)
>> +{
>> +    VFIOMigration *migration = vbasedev->migration;
>> +    VFIORegion *region = &migration->region.buffer;
>> +    uint64_t data_offset = 0, data_size = 0;
>> +    int ret;
>> +
>> +    ret = pread(vbasedev->fd, &data_offset, sizeof(data_offset),
>> +                region->fd_offset + offsetof(struct vfio_device_migration_info,
>> +                                             data_offset));
>> +    if (ret != sizeof(data_offset)) {
>> +        error_report("Failed to get migration buffer data offset %d",
>> +                     ret);
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret = pread(vbasedev->fd, &data_size, sizeof(data_size),
>> +                region->fd_offset + offsetof(struct vfio_device_migration_info,
>> +                                             data_size));
>> +    if (ret != sizeof(data_size)) {
>> +        error_report("Failed to get migration buffer data size %d",
>> +                     ret);
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (data_size > 0) {
>> +        void *buf = NULL;
>> +        bool buffer_mmaped = false;
>> +
>> +        if (region->mmaps) {
>> +            int i;
>> +
>> +            for (i = 0; i < region->nr_mmaps; i++) {
>> +                if ((data_offset >= region->mmaps[i].offset) &&
>> +                    (data_offset < region->mmaps[i].offset +
>> +                                   region->mmaps[i].size)) {
>> +                    buf = region->mmaps[i].mmap + (data_offset -
>> +                                                   region->mmaps[i].offset);
> 
> So you're expecting that data_offset is somewhere within the data
> area.  Why doesn't the data always simply start at the beginning of the
> data area?  ie. data_offset would coincide with the beginning of the
> mmap'able area (if supported) and be static.  Does this enable some
> functionality in the vendor driver?

Do you want to enforce that to vendor driver?
From the feedback on previous version I thought vendor driver should
define data_offset within the region
"I'd suggest that the vendor driver expose a read-only
data_offset that matches a sparse mmap capability entry should the
driver support mmap.  The use should always read or write data from the
vendor defined data_offset"

This also adds flexibility to vendor driver such that vendor driver can
define different data_offset for device data and dirty page bitmap
within same mmaped region.

>  Does resume data need to be
> written from the same offset where it's read?

No, resume data should be written from the data_offset that vendor
driver provided during resume.

> 
>> +                    buffer_mmaped = true;
>> +                    break;
>> +                }
>> +            }
>> +        }
>> +
>> +        if (!buffer_mmaped) {
>> +            buf = g_malloc0(data_size);
>> +            ret = pread(vbasedev->fd, buf, data_size,
>> +                        region->fd_offset + data_offset);
>> +            if (ret != data_size) {
>> +                error_report("Failed to get migration data %d", ret);
>> +                g_free(buf);
>> +                return -EINVAL;
>> +            }
>> +        }
>> +
>> +        qemu_put_be64(f, data_size);
>> +        qemu_put_buffer(f, buf, data_size);
>> +
>> +        if (!buffer_mmaped) {
>> +            g_free(buf);
>> +        }
>> +        migration->pending_bytes -= data_size;
>> +    } else {
>> +        qemu_put_be64(f, data_size);
>> +    }
>> +
>> +    ret = qemu_file_get_error(f);
>> +
>> +    return data_size;
>> +}
>> +
>> +static int vfio_update_pending(VFIODevice *vbasedev)
>> +{
>> +    VFIOMigration *migration = vbasedev->migration;
>> +    VFIORegion *region = &migration->region.buffer;
>> +    uint64_t pending_bytes = 0;
>> +    int ret;
>> +
>> +    ret = pread(vbasedev->fd, &pending_bytes, sizeof(pending_bytes),
>> +                region->fd_offset + offsetof(struct vfio_device_migration_info,
>> +                                             pending_bytes));
> 
> Did this trigger the vendor driver to write out to the data area when
> we don't need it to?
> 

No, as I mentioned above, I'll update the description.

Thanks,
Kirti

>> +    if ((ret < 0) || (ret != sizeof(pending_bytes))) {
>> +        error_report("Failed to get pending bytes %d", ret);
>> +        migration->pending_bytes = 0;
>> +        return (ret < 0) ? ret : -EINVAL;
>> +    }
>> +
>> +    migration->pending_bytes = pending_bytes;
>> +    return 0;
>> +}
>> +
>> +static int vfio_save_device_config_state(QEMUFile *f, void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +
>> +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_CONFIG_STATE);
>> +
>> +    if (vbasedev->type == VFIO_DEVICE_TYPE_PCI) {
>> +        vfio_pci_save_config(vbasedev, f);
>> +    }
>> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
>> +
>> +    return qemu_file_get_error(f);
>> +}
>> +
>>  /* ---------------------------------------------------------------------- */
>>  
>>  static int vfio_save_setup(QEMUFile *f, void *opaque)
>> @@ -163,9 +268,116 @@ static void vfio_save_cleanup(void *opaque)
>>      }
>>  }
>>  
>> +static void vfio_save_pending(QEMUFile *f, void *opaque,
>> +                              uint64_t threshold_size,
>> +                              uint64_t *res_precopy_only,
>> +                              uint64_t *res_compatible,
>> +                              uint64_t *res_postcopy_only)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +    VFIOMigration *migration = vbasedev->migration;
>> +    int ret;
>> +
>> +    ret = vfio_update_pending(vbasedev);
>> +    if (ret) {
>> +        return;
>> +    }
>> +
>> +    if (vbasedev->device_state & VFIO_DEVICE_STATE_RUNNING) {
>> +        *res_precopy_only += migration->pending_bytes;
>> +    } else {
>> +        *res_postcopy_only += migration->pending_bytes;
>> +    }
>> +    *res_compatible += 0;
>> +}
>> +
>> +static int vfio_save_iterate(QEMUFile *f, void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +    VFIOMigration *migration = vbasedev->migration;
>> +    int ret;
>> +
>> +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
>> +
>> +    qemu_mutex_lock(&migration->lock);
>> +    ret = vfio_save_buffer(f, vbasedev);
>> +    qemu_mutex_unlock(&migration->lock);
>> +
>> +    if (ret < 0) {
>> +        error_report("vfio_save_buffer failed %s",
>> +                     strerror(errno));
>> +        return ret;
>> +    }
>> +
>> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
>> +
>> +    ret = qemu_file_get_error(f);
>> +    if (ret) {
>> +        return ret;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +    VFIOMigration *migration = vbasedev->migration;
>> +    int ret;
>> +
>> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_SAVING);
>> +    if (ret) {
>> +        error_report("Failed to set state STOP and SAVING");
>> +        return ret;
>> +    }
>> +
>> +    ret = vfio_save_device_config_state(f, opaque);
>> +    if (ret) {
>> +        return ret;
>> +    }
>> +
>> +    ret = vfio_update_pending(vbasedev);
>> +    if (ret) {
>> +        return ret;
>> +    }
>> +
>> +    while (migration->pending_bytes > 0) {
>> +        qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
>> +        ret = vfio_save_buffer(f, vbasedev);
>> +        if (ret < 0) {
>> +            error_report("Failed to save buffer");
>> +            return ret;
>> +        } else if (ret == 0) {
>> +            break;
>> +        }
>> +
>> +        ret = vfio_update_pending(vbasedev);
>> +        if (ret) {
>> +            return ret;
>> +        }
>> +    }
>> +
>> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
>> +
>> +    ret = qemu_file_get_error(f);
>> +    if (ret) {
>> +        return ret;
>> +    }
>> +
>> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOPPED);
>> +    if (ret) {
>> +        error_report("Failed to set state STOPPED");
>> +        return ret;
>> +    }
>> +    return ret;
>> +}
>> +
>>  static SaveVMHandlers savevm_vfio_handlers = {
>>      .save_setup = vfio_save_setup,
>>      .save_cleanup = vfio_save_cleanup,
>> +    .save_live_pending = vfio_save_pending,
>> +    .save_live_iterate = vfio_save_iterate,
>> +    .save_live_complete_precopy = vfio_save_complete_precopy,
>>  };
>>  
>>  /* ---------------------------------------------------------------------- */
> 

