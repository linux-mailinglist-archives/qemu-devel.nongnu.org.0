Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DB1297E77
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Oct 2020 22:36:54 +0200 (CEST)
Received: from localhost ([::1]:46526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kWQHV-0005Rs-55
	for lists+qemu-devel@lfdr.de; Sat, 24 Oct 2020 16:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kWQGd-0004zH-DD
 for qemu-devel@nongnu.org; Sat, 24 Oct 2020 16:35:59 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:13118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kWQGb-0004oH-5i
 for qemu-devel@nongnu.org; Sat, 24 Oct 2020 16:35:59 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f9490160000>; Sat, 24 Oct 2020 13:35:34 -0700
Received: from [10.40.102.184] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 24 Oct
 2020 20:35:40 +0000
Subject: Re: [PATCH v28 07/17] vfio: Register SaveVMHandlers for VFIO device
To: Yan Zhao <yan.y.zhao@intel.com>
References: <1603449643-12851-1-git-send-email-kwankhede@nvidia.com>
 <1603449643-12851-8-git-send-email-kwankhede@nvidia.com>
 <20201024112609.GA11598@yzhao56-desk>
From: Kirti Wankhede <kwankhede@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <704a8e63-19ec-8653-9cd7-7bfced1084f8@nvidia.com>
Date: Sun, 25 Oct 2020 02:05:36 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201024112609.GA11598@yzhao56-desk>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1603571734; bh=fXB4GxKYhLV+qpsqWqSmQEu4QVm6qO8Msq4lIiCAnYE=;
 h=Subject:To:CC:References:From:X-Nvconfidentiality:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=gR9jCymmF+7ZS6M47XzbVlVUs6VcOMgb0lMZ3MmJ5eDozdM4SfJCEhgTdlQyvekvb
 8c9OrHlvzd9VNoXUVP7h3hAKlUbQ+5optmW6bjxA0UuJnivlwf40Y+xiu4dLoF22Z6
 MigXcQxbNIwvF5j2V54dxSD7WOwesDtqKLnzFLAwH199YEcN31A0ePprRyApJUYFKA
 f6VplWG1OBLCAdSiikS14lXJlfAJd2IoLhLnaeKnk852/96Z8BS4hsRNkGxBWilI3t
 nX/OieiEN45/rQNdP6PGHyfqm/idFw427oW4phv+1xT+5EgCYzWLm2bgW2rygZ1PO+
 M6nCxu2UGLfYw==
Received-SPF: pass client-ip=216.228.121.65; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate26.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/24 15:48:59
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.107, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: cohuck@redhat.com, cjia@nvidia.com, zhi.wang.linux@gmail.com, aik@ozlabs.ru,
 Zhengxiao.zx@Alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, peterx@redhat.com, eauger@redhat.com, artemp@nvidia.com,
 yi.l.liu@intel.com, quintela@redhat.com, ziye.yang@intel.com,
 armbru@redhat.com, mlevitsk@redhat.com, pasic@linux.ibm.com,
 felipe@nutanix.com, zhi.a.wang@intel.com, mcrossley@nvidia.com,
 kevin.tian@intel.com, dgilbert@redhat.com, alex.williamson@redhat.com,
 changpeng.liu@intel.com, eskultet@redhat.com, Ken.Xue@amd.com,
 jonathan.davies@nutanix.com, pbonzini@redhat.com, dnigam@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/24/2020 4:56 PM, Yan Zhao wrote:
> On Fri, Oct 23, 2020 at 04:10:33PM +0530, Kirti Wankhede wrote:
>> Define flags to be used as delimiter in migration stream for VFIO devices.
>> Added .save_setup and .save_cleanup functions. Map & unmap migration
>> region from these functions at source during saving or pre-copy phase.
>>
>> Set VFIO device state depending on VM's state. During live migration, VM is
>> running when .save_setup is called, _SAVING | _RUNNING state is set for VFIO
>> device. During save-restore, VM is paused, _SAVING state is set for VFIO device.
>>
>> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
>> Reviewed-by: Neo Jia <cjia@nvidia.com>
>> ---
>>   hw/vfio/migration.c  | 102 +++++++++++++++++++++++++++++++++++++++++++++++++++
>>   hw/vfio/trace-events |   2 +
>>   2 files changed, 104 insertions(+)
>>
>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>> index a0f0e79b9b73..94d2bdae5c54 100644
>> --- a/hw/vfio/migration.c
>> +++ b/hw/vfio/migration.c
>> @@ -8,12 +8,15 @@
>>    */
>>   
>>   #include "qemu/osdep.h"
>> +#include "qemu/main-loop.h"
>> +#include "qemu/cutils.h"
>>   #include <linux/vfio.h>
>>   
>>   #include "sysemu/runstate.h"
>>   #include "hw/vfio/vfio-common.h"
>>   #include "cpu.h"
>>   #include "migration/migration.h"
>> +#include "migration/vmstate.h"
>>   #include "migration/qemu-file.h"
>>   #include "migration/register.h"
>>   #include "migration/blocker.h"
>> @@ -25,6 +28,22 @@
>>   #include "trace.h"
>>   #include "hw/hw.h"
>>   
>> +/*
>> + * Flags to be used as unique delimiters for VFIO devices in the migration
>> + * stream. These flags are composed as:
>> + * 0xffffffff => MSB 32-bit all 1s
>> + * 0xef10     => Magic ID, represents emulated (virtual) function IO
>> + * 0x0000     => 16-bits reserved for flags
>> + *
>> + * The beginning of state information is marked by _DEV_CONFIG_STATE,
>> + * _DEV_SETUP_STATE, or _DEV_DATA_STATE, respectively. The end of a
>> + * certain state information is marked by _END_OF_STATE.
>> + */
>> +#define VFIO_MIG_FLAG_END_OF_STATE      (0xffffffffef100001ULL)
>> +#define VFIO_MIG_FLAG_DEV_CONFIG_STATE  (0xffffffffef100002ULL)
>> +#define VFIO_MIG_FLAG_DEV_SETUP_STATE   (0xffffffffef100003ULL)
>> +#define VFIO_MIG_FLAG_DEV_DATA_STATE    (0xffffffffef100004ULL)
>> +
>>   static inline int vfio_mig_access(VFIODevice *vbasedev, void *val, int count,
>>                                     off_t off, bool iswrite)
>>   {
>> @@ -129,6 +148,75 @@ static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t mask,
>>       return 0;
>>   }
>>   
>> +static void vfio_migration_cleanup(VFIODevice *vbasedev)
>> +{
>> +    VFIOMigration *migration = vbasedev->migration;
>> +
>> +    if (migration->region.mmaps) {
>> +        vfio_region_unmap(&migration->region);
>> +    }
>> +}
>> +
>> +/* ---------------------------------------------------------------------- */
>> +
>> +static int vfio_save_setup(QEMUFile *f, void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +    VFIOMigration *migration = vbasedev->migration;
>> +    int ret;
>> +
>> +    trace_vfio_save_setup(vbasedev->name);
>> +
>> +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
>> +
>> +    if (migration->region.mmaps) {
>> +        /*
>> +         * Calling vfio_region_mmap() from migration thread. Memory API called
>> +         * from this function require locking the iothread when called from
>> +         * outside the main loop thread.
>> +         */
>> +        qemu_mutex_lock_iothread();
>> +        ret = vfio_region_mmap(&migration->region);
>> +        qemu_mutex_unlock_iothread();
>> +        if (ret) {
>> +            error_report("%s: Failed to mmap VFIO migration region: %s",
>> +                         vbasedev->name, strerror(-ret));
>> +            error_report("%s: Falling back to slow path", vbasedev->name);
>> +        }
>> +    }
>> +
>> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_MASK,
>> +                                   VFIO_DEVICE_STATE_SAVING);
>> +    if (ret) {
>> +        error_report("%s: Failed to set state SAVING", vbasedev->name);
>> +        return ret;
>> +    }
>> +
> 
> is it possible to call vfio_update_pending() and vfio_save_buffer() here?
> so that vendor driver has a chance to hook compatibility checking string
> early in save_setup stage and can avoid to hook the string in both
> precopy iteration stage and stop and copy stage.

I would says its not about which stage, very first string irrespective 
of migration stage, it should be version compatibility check.
I don't think that needed in setup.

> 
> But I think it's ok if we agree to add this later.
> 
> Besides that,
> Reviewed-by: Yan Zhao <yan.y.zhao@intel.com>
> 

Thanks.

Kirti


>> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
>> +
>> +    ret = qemu_file_get_error(f);
>> +    if (ret) {
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static void vfio_save_cleanup(void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +
>> +    vfio_migration_cleanup(vbasedev);
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
>>   static void vfio_vmstate_change(void *opaque, int running, RunState state)
>>   {
>>       VFIODevice *vbasedev = opaque;
>> @@ -217,6 +305,8 @@ static int vfio_migration_init(VFIODevice *vbasedev,
>>       int ret;
>>       Object *obj;
>>       VFIOMigration *migration;
>> +    char id[256] = "";
>> +    g_autofree char *path = NULL, *oid = NULL;
>>   
>>       if (!vbasedev->ops->vfio_get_object) {
>>           return -EINVAL;
>> @@ -247,6 +337,18 @@ static int vfio_migration_init(VFIODevice *vbasedev,
>>       }
>>   
>>       migration->vbasedev = vbasedev;
>> +
>> +    oid = vmstate_if_get_id(VMSTATE_IF(DEVICE(obj)));
>> +    if (oid) {
>> +        path = g_strdup_printf("%s/vfio", oid);
>> +    } else {
>> +        path = g_strdup("vfio");
>> +    }
>> +    strpadcpy(id, sizeof(id), path, '\0');
>> +
>> +    register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1, &savevm_vfio_handlers,
>> +                         vbasedev);
>> +
>>       migration->vm_state = qemu_add_vm_change_state_handler(vfio_vmstate_change,
>>                                                              vbasedev);
>>       migration->migration_state.notify = vfio_migration_state_notifier;
>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>> index 78d7d83b5ef8..f148b5e828c1 100644
>> --- a/hw/vfio/trace-events
>> +++ b/hw/vfio/trace-events
>> @@ -151,3 +151,5 @@ vfio_migration_probe(const char *name, uint32_t index) " (%s) Region %d"
>>   vfio_migration_set_state(const char *name, uint32_t state) " (%s) state %d"
>>   vfio_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
>>   vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"
>> +vfio_save_setup(const char *name) " (%s)"
>> +vfio_save_cleanup(const char *name) " (%s)"
>> -- 
>> 2.7.0
>>

