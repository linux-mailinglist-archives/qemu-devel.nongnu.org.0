Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3689B65FE6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 21:14:36 +0200 (CEST)
Received: from localhost ([::1]:44794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hleWY-0008IP-VO
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 15:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38930)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwankhede@nvidia.com>) id 1hleWL-0007uK-0q
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 15:14:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwankhede@nvidia.com>) id 1hleWJ-0004Uy-Ij
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 15:14:20 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:5113)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwankhede@nvidia.com>)
 id 1hleWJ-0004SU-7R
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 15:14:19 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d278a830000>; Thu, 11 Jul 2019 12:14:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 11 Jul 2019 12:14:16 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 11 Jul 2019 12:14:16 -0700
Received: from [10.24.71.30] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 11 Jul
 2019 19:14:07 +0000
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1562665760-26158-1-git-send-email-kwankhede@nvidia.com>
 <1562665760-26158-7-git-send-email-kwankhede@nvidia.com>
 <20190711121323.GN3971@work-vm>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <9f570344-d5e3-e22b-52d9-cdfe40db3c15@nvidia.com>
Date: Fri, 12 Jul 2019 00:44:03 +0530
MIME-Version: 1.0
In-Reply-To: <20190711121323.GN3971@work-vm>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1562872451; bh=0Qxc1rCQMM+Gom1+U54LzXDIcp6qngPzw+Oix08Ias4=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=X1vuyC50v9dEEuLBYgBtD125cN692skZeNpnXm7lZ+k+9DIypnqnPNcyOEaSwtrYS
 4amBhKLn8MhgVd20aBdOfEN2RdY6jion3CT1PVLWdnPVXKQIkJw53RVVRHBLroXBWn
 jMQUvy8msfNfsF9MZe08cM4UiWDDWCY8nf0VcUIa3sOP7Wwmn8bDrKsqUkBIgH988j
 WerMjhJDTTXySJ7c51nq9li1cljecJl+TztUGvgxyjEOgwXQ3wXPdTp5uoHDLRb4OE
 WNSVdABGxT6DkFiLwzIfq4XcdCveaDO0mNA6wf50vLaXybq80A+DcSdgPsA7wMYr3x
 aOJ2MU4L3mk3Q==
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 216.228.121.143
Subject: Re: [Qemu-devel] [PATCH v7 06/13] vfio: Add VM state change handler
 to know state of VM
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
Cc: Zhengxiao.zx@alibaba-inc.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 cjia@nvidia.com, eskultet@redhat.com, ziye.yang@intel.com, cohuck@redhat.com,
 shuangtai.tst@alibaba-inc.com, qemu-devel@nongnu.org, zhi.a.wang@intel.com,
 mlevitsk@redhat.com, pasic@linux.ibm.com, aik@ozlabs.ru,
 alex.williamson@redhat.com, eauger@redhat.com, felipe@nutanix.com,
 jonathan.davies@nutanix.com, yan.y.zhao@intel.com, changpeng.liu@intel.com,
 Ken.Xue@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/11/2019 5:43 PM, Dr. David Alan Gilbert wrote:
> * Kirti Wankhede (kwankhede@nvidia.com) wrote:
>> VM state change handler gets called on change in VM's state. This is used to set
>> VFIO device state to _RUNNING.
>> VM state change handler, migration state change handler and log_sync listener
>> are called asynchronously, which sometimes lead to data corruption in migration
>> region. Initialised mutex that is used to serialize operations on migration data
>> region during saving state.
>>
>> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
>> Reviewed-by: Neo Jia <cjia@nvidia.com>
>> ---
>>  hw/vfio/migration.c           | 64 +++++++++++++++++++++++++++++++++++++++++++
>>  hw/vfio/trace-events          |  2 ++
>>  include/hw/vfio/vfio-common.h |  4 +++
>>  3 files changed, 70 insertions(+)
>>
>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>> index a2cfbd5af2e1..c01f08b659d0 100644
>> --- a/hw/vfio/migration.c
>> +++ b/hw/vfio/migration.c
>> @@ -78,6 +78,60 @@ err:
>>      return ret;
>>  }
>>  
>> +static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t state)
>> +{
>> +    VFIOMigration *migration = vbasedev->migration;
>> +    VFIORegion *region = &migration->region.buffer;
>> +    uint32_t device_state;
>> +    int ret = 0;
>> +
>> +    device_state = (state & VFIO_DEVICE_STATE_MASK) |
>> +                   (vbasedev->device_state & ~VFIO_DEVICE_STATE_MASK);
>> +
>> +    if ((device_state & VFIO_DEVICE_STATE_MASK) == VFIO_DEVICE_STATE_INVALID) {
>> +        return -EINVAL;
>> +    }
>> +
>> +    ret = pwrite(vbasedev->fd, &device_state, sizeof(device_state),
>> +                 region->fd_offset + offsetof(struct vfio_device_migration_info,
>> +                                              device_state));
>> +    if (ret < 0) {
>> +        error_report("%s: Failed to set device state %d %s",
>> +                     vbasedev->name, ret, strerror(errno));
>> +        return ret;
>> +    }
>> +
>> +    vbasedev->device_state = device_state;
>> +    trace_vfio_migration_set_state(vbasedev->name, device_state);
>> +    return 0;
>> +}
>> +
>> +static void vfio_vmstate_change(void *opaque, int running, RunState state)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +
>> +    if ((vbasedev->vm_running != running)) {
>> +        int ret;
>> +        uint32_t dev_state;
>> +
>> +        if (running) {
>> +            dev_state = VFIO_DEVICE_STATE_RUNNING;
>> +        } else {
>> +            dev_state = (vbasedev->device_state & VFIO_DEVICE_STATE_MASK) &
>> +                     ~VFIO_DEVICE_STATE_RUNNING;
>> +        }
>> +
>> +        ret = vfio_migration_set_state(vbasedev, dev_state);
>> +        if (ret) {
>> +            error_report("%s: Failed to set device state 0x%x",
>> +                         vbasedev->name, dev_state);
>> +        }
>> +        vbasedev->vm_running = running;
>> +        trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
>> +                                  dev_state);
>> +    }
>> +}
>> +
>>  static int vfio_migration_init(VFIODevice *vbasedev,
>>                                 struct vfio_region_info *info)
>>  {
>> @@ -93,6 +147,11 @@ static int vfio_migration_init(VFIODevice *vbasedev,
>>          return ret;
>>      }
>>  
>> +    qemu_mutex_init(&vbasedev->migration->lock);
> 
> Does this and it's friend below belong in this patch?  As far as I can
> tell you init/deinit the lock here but don't use it which is strange.
> 

This lock is used in
0009-vfio-Add-save-state-functions-to-SaveVMHandlers.patch and
0011-vfio-Add-function-to-get-dirty-page-list.patch

Hm. I'll move this init/deinit to patch 0009 in next iteration.

Thanks,
Kirti


> Dave
> 
>> +    vbasedev->vm_state = qemu_add_vm_change_state_handler(vfio_vmstate_change,
>> +                                                          vbasedev);
>> +
>>      return 0;
>>  }
>>  
>> @@ -135,11 +194,16 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
>>          return;
>>      }
>>  
>> +    if (vbasedev->vm_state) {
>> +        qemu_del_vm_change_state_handler(vbasedev->vm_state);
>> +    }
>> +
>>      if (vbasedev->migration_blocker) {
>>          migrate_del_blocker(vbasedev->migration_blocker);
>>          error_free(vbasedev->migration_blocker);
>>      }
>>  
>> +    qemu_mutex_destroy(&vbasedev->migration->lock);
>>      vfio_migration_region_exit(vbasedev);
>>      g_free(vbasedev->migration);
>>  }
>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>> index 191a726a1312..3d15bacd031a 100644
>> --- a/hw/vfio/trace-events
>> +++ b/hw/vfio/trace-events
>> @@ -146,3 +146,5 @@ vfio_display_edid_write_error(void) ""
>>  
>>  # migration.c
>>  vfio_migration_probe(char *name, uint32_t index) " (%s) Region %d"
>> +vfio_migration_set_state(char *name, uint32_t state) " (%s) state %d"
>> +vfio_vmstate_change(char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>> index 152da3f8d6f3..f6c70db3a9c1 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -29,6 +29,7 @@
>>  #ifdef CONFIG_LINUX
>>  #include <linux/vfio.h>
>>  #endif
>> +#include "sysemu/sysemu.h"
>>  
>>  #define VFIO_MSG_PREFIX "vfio %s: "
>>  
>> @@ -124,6 +125,9 @@ typedef struct VFIODevice {
>>      unsigned int flags;
>>      VFIOMigration *migration;
>>      Error *migration_blocker;
>> +    uint32_t device_state;
>> +    VMChangeStateEntry *vm_state;
>> +    int vm_running;
>>  } VFIODevice;
>>  
>>  struct VFIODeviceOps {
>> -- 
>> 2.7.0
>>
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 

