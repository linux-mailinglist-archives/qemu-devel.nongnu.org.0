Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A14296AC5
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 22:40:02 +0200 (CEST)
Received: from localhost ([::1]:41260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0AvB-0005Gd-CV
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 16:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48873)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwankhede@nvidia.com>) id 1i0Aok-0000XX-LY
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 16:33:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwankhede@nvidia.com>) id 1i0Aoj-0003IS-8Y
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 16:33:22 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:13829)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwankhede@nvidia.com>)
 id 1i0Aoi-0003I7-VE
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 16:33:21 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d5c590f0000>; Tue, 20 Aug 2019 13:33:20 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 20 Aug 2019 13:33:19 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 20 Aug 2019 13:33:19 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Aug
 2019 20:33:19 +0000
Received: from [10.24.71.106] (172.20.13.39) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Aug
 2019 20:33:11 +0000
To: Yan Zhao <yan.y.zhao@intel.com>
References: <1562665760-26158-1-git-send-email-kwankhede@nvidia.com>
 <1562665760-26158-9-git-send-email-kwankhede@nvidia.com>
 <20190722083449.GM8912@joy-OptiPlex-7040>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <91bc4137-4306-928c-56ff-9a388d82f026@nvidia.com>
Date: Wed, 21 Aug 2019 02:03:06 +0530
MIME-Version: 1.0
In-Reply-To: <20190722083449.GM8912@joy-OptiPlex-7040>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1566333200; bh=W6aXUCidpp1jEt3Bc29LBTqg3hH11b6qyF1SkMOFOM8=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=jhh7OeR5rHD3rdZOQbZcO1WKcgJcpfBeAnEpaGvh3QF/m+JGUuqWhetCLuzPDwJd8
 MW4/8A0emxFSj094aFdg0xVh0o4dNrMKQsq4rrW2dewBKUAcXu/c0jIXuDDQnfjflm
 pk37iN7i6SkE+upeGEFMdg9LDhUDMvcuMmlkaLZkRSSvrxQ90McIQRgMqFoeN2jGfX
 32BTiREAZRjxb8SjStsRmH363KrnuyRvAqkEy8RuTQbvqkjbWHlmaEJT+rt3hnnIM9
 WvxiUt0OmGZvAdmdZzRk/uAmCOXgMkUKKZ9bpCzqrbu0QYs7r3tlpTqERF90dMpSil
 SLOy7qVeqKzUw==
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 216.228.121.65
Subject: Re: [Qemu-devel] [PATCH v7 08/13] vfio: Register SaveVMHandlers for
 VFIO device
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



On 7/22/2019 2:04 PM, Yan Zhao wrote:
> On Tue, Jul 09, 2019 at 05:49:15PM +0800, Kirti Wankhede wrote:
>> Define flags to be used as delimeter in migration file stream.
>> Added .save_setup and .save_cleanup functions. Mapped & unmapped migration
>> region from these functions at source during saving or pre-copy phase.
>> Set VFIO device state depending on VM's state. During live migration, VM is
>> running when .save_setup is called, _SAVING | _RUNNING state is set for VFIO
>> device. During save-restore, VM is paused, _SAVING state is set for VFIO device.
>>
>> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
>> Reviewed-by: Neo Jia <cjia@nvidia.com>
>> ---
>>  hw/vfio/migration.c  | 82 +++++++++++++++++++++++++++++++++++++++++++++++++++-
>>  hw/vfio/trace-events |  2 ++
>>  2 files changed, 83 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>> index e4a89a6f9bc7..0597a45fda2d 100644
>> --- a/hw/vfio/migration.c
>> +++ b/hw/vfio/migration.c
>> @@ -23,6 +23,17 @@
>>  #include "pci.h"
>>  #include "trace.h"
>>  
>> +/*
>> + * Flags used as delimiter:
>> + * 0xffffffff => MSB 32-bit all 1s
>> + * 0xef10     => emulated (virtual) function IO
>> + * 0x0000     => 16-bits reserved for flags
>> + */
>> +#define VFIO_MIG_FLAG_END_OF_STATE      (0xffffffffef100001ULL)
>> +#define VFIO_MIG_FLAG_DEV_CONFIG_STATE  (0xffffffffef100002ULL)
>> +#define VFIO_MIG_FLAG_DEV_SETUP_STATE   (0xffffffffef100003ULL)
>> +#define VFIO_MIG_FLAG_DEV_DATA_STATE    (0xffffffffef100004ULL)
>> +
>>  static void vfio_migration_region_exit(VFIODevice *vbasedev)
>>  {
>>      VFIOMigration *migration = vbasedev->migration;
>> @@ -106,6 +117,74 @@ static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t state)
>>      return 0;
>>  }
>>  
>> +/* ---------------------------------------------------------------------- */
>> +
>> +static int vfio_save_setup(QEMUFile *f, void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +    VFIOMigration *migration = vbasedev->migration;
>> +    int ret;
>> +
>> +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
>> +
>> +    if (migration->region.buffer.mmaps) {
>> +        qemu_mutex_lock_iothread();
>> +        ret = vfio_region_mmap(&migration->region.buffer);
>> +        qemu_mutex_unlock_iothread();
>> +        if (ret) {
>> +            error_report("%s: Failed to mmap VFIO migration region %d: %s",
>> +                         vbasedev->name, migration->region.index,
>> +                         strerror(-ret));
>> +            return ret;
>> +        }
>> +    }
>> +
>> +    if (vbasedev->vm_running) {
>> +        ret = vfio_migration_set_state(vbasedev,
>> +                         VFIO_DEVICE_STATE_RUNNING | VFIO_DEVICE_STATE_SAVING);
>> +        if (ret) {
>> +            error_report("%s: Failed to set state RUNNING and SAVING",
>> +                         vbasedev->name);
>> +            return ret;
>> +        }
>> +    } else {
> hi Kirti
> May I know in which condition will this "else" case happen?
> 

This can happen in savevm case.

Thanks,
Kirti

> Thanks
> Yan
> 
>> +        ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_SAVING);
>> +        if (ret) {
>> +            error_report("%s: Failed to set state STOP and SAVING",
>> +                         vbasedev->name);
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
>> +    trace_vfio_save_setup(vbasedev->name);
>> +    return 0;
>> +}
>> +
>> +static void vfio_save_cleanup(void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +    VFIOMigration *migration = vbasedev->migration;
>> +
>> +    if (migration->region.buffer.mmaps) {
>> +        vfio_region_unmap(&migration->region.buffer);
>> +    }
>> +    trace_vfio_save_cleanup(vbasedev->name);
>> +}
>> +
>> +static SaveVMHandlers savevm_vfio_handlers = {
>> +    .save_setup = vfio_save_setup,
>> +    .save_cleanup = vfio_save_cleanup,
>> +};
>> +
>> +/* ---------------------------------------------------------------------- */
>> +
>>  static void vfio_vmstate_change(void *opaque, int running, RunState state)
>>  {
>>      VFIODevice *vbasedev = opaque;
>> @@ -195,7 +274,8 @@ static int vfio_migration_init(VFIODevice *vbasedev,
>>      }
>>  
>>      qemu_mutex_init(&vbasedev->migration->lock);
>> -
>> +    register_savevm_live(vbasedev->dev, "vfio", -1, 1, &savevm_vfio_handlers,
>> +                         vbasedev);
>>      vbasedev->vm_state = qemu_add_vm_change_state_handler(vfio_vmstate_change,
>>                                                            vbasedev);
>>  
>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>> index 69503228f20e..4bb43f18f315 100644
>> --- a/hw/vfio/trace-events
>> +++ b/hw/vfio/trace-events
>> @@ -149,3 +149,5 @@ vfio_migration_probe(char *name, uint32_t index) " (%s) Region %d"
>>  vfio_migration_set_state(char *name, uint32_t state) " (%s) state %d"
>>  vfio_vmstate_change(char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
>>  vfio_migration_state_notifier(char *name, int state) " (%s) state %d"
>> +vfio_save_setup(char *name) " (%s)"
>> +vfio_save_cleanup(char *name) " (%s)"
>> -- 
>> 2.7.0
>>

