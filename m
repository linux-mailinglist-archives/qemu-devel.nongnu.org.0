Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5233E6D755
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 01:41:17 +0200 (CEST)
Received: from localhost ([::1]:41476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoG1U-0006cP-8k
	for lists+qemu-devel@lfdr.de; Thu, 18 Jul 2019 19:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51585)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwankhede@nvidia.com>) id 1hoG1F-0006B4-Py
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 19:41:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwankhede@nvidia.com>) id 1hoG1C-0006Cc-Si
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 19:41:01 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:11485)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwankhede@nvidia.com>)
 id 1hoG1C-0006AU-B7
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 19:40:58 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d30d4560000>; Thu, 18 Jul 2019 13:19:34 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 18 Jul 2019 13:19:34 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 18 Jul 2019 13:19:34 -0700
Received: from [10.24.71.22] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 18 Jul
 2019 20:19:24 +0000
To: Alex Williamson <alex.williamson@redhat.com>
References: <1562665760-26158-1-git-send-email-kwankhede@nvidia.com>
 <1562665760-26158-6-git-send-email-kwankhede@nvidia.com>
 <20190716153705.599be852@x1.home>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <5403ecd8-ac46-7097-d0d8-1b414e79166a@nvidia.com>
Date: Fri, 19 Jul 2019 01:49:19 +0530
MIME-Version: 1.0
In-Reply-To: <20190716153705.599be852@x1.home>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1563481174; bh=h3Qp+4ajtRU9VDgaBKCREqAf3KtmhHXjWYaMk5bFhgk=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=aIEvMsbOafHMAA8TjEQUqi64krUkREMHE3JABhhQPUS1mK8KqnH7dvJaKMV4/ndrN
 jje6sG6u4bt2Vvr2nwL1HQ9TNIVzzjgC72oqvhveWhVZxBHY+3cjzZwN3uqTj//BH6
 z7a/PzdUzf+TpIjGRvlFys5W6qIFu9DAiIuVDnMXE6ydkbiFQiKPyK3+zuWqnVIrhu
 BoMDJodwdWFetUiZX7uq2zTVyqAsEmAS4dbBd0ZzSdbSFC1nA47GAubxB0THmCwEOm
 06ISoUrjqRo/PCIsoc6KoYEKR2Qpn95ovWVr9BJU9EEsLNJMAhXBRiQg18BNU7x0qF
 6e9JQiMdHoOxg==
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 216.228.121.143
Subject: Re: [Qemu-devel] [PATCH v7 05/13] vfio: Add migration region
 initialization and finalize function
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
Cc: kevin.tian@intel.com, yi.l.liu@intel.com, cjia@nvidia.com,
 eskultet@redhat.com, ziye.yang@intel.com, Ken.Xue@amd.com,
 Zhengxiao.zx@Alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com, pasic@linux.ibm.com, aik@ozlabs.ru,
 eauger@redhat.com, cohuck@redhat.com, jonathan.davies@nutanix.com,
 felipe@nutanix.com, mlevitsk@redhat.com, changpeng.liu@intel.com,
 zhi.a.wang@intel.com, yan.y.zhao@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/17/2019 3:07 AM, Alex Williamson wrote:
> On Tue, 9 Jul 2019 15:19:12 +0530
> Kirti Wankhede <kwankhede@nvidia.com> wrote:
> 
>> - Migration functions are implemented for VFIO_DEVICE_TYPE_PCI device in this
>>   patch series.
>> - VFIO device supports migration or not is decided based of migration region
>>   query. If migration region query is successful and migration region
>>   initialization is successful then migration is supported else migration is
>>   blocked.
>>
>> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
>> Reviewed-by: Neo Jia <cjia@nvidia.com>
>> ---
>>  hw/vfio/Makefile.objs         |   2 +-
>>  hw/vfio/migration.c           | 145 ++++++++++++++++++++++++++++++++++++++++++
>>  hw/vfio/trace-events          |   3 +
>>  include/hw/vfio/vfio-common.h |  14 ++++
>>  4 files changed, 163 insertions(+), 1 deletion(-)
>>  create mode 100644 hw/vfio/migration.c
>>
>> diff --git a/hw/vfio/Makefile.objs b/hw/vfio/Makefile.objs
>> index abad8b818c9b..36033d1437c5 100644
>> --- a/hw/vfio/Makefile.objs
>> +++ b/hw/vfio/Makefile.objs
>> @@ -1,4 +1,4 @@
>> -obj-y += common.o spapr.o
>> +obj-y += common.o spapr.o migration.o
>>  obj-$(CONFIG_VFIO_PCI) += pci.o pci-quirks.o display.o
>>  obj-$(CONFIG_VFIO_CCW) += ccw.o
>>  obj-$(CONFIG_VFIO_PLATFORM) += platform.o
>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>> new file mode 100644
>> index 000000000000..a2cfbd5af2e1
>> --- /dev/null
>> +++ b/hw/vfio/migration.c
>> @@ -0,0 +1,145 @@
>> +/*
>> + * Migration support for VFIO devices
>> + *
>> + * Copyright NVIDIA, Inc. 2019
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2. See
>> + * the COPYING file in the top-level directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include <linux/vfio.h>
>> +
>> +#include "hw/vfio/vfio-common.h"
>> +#include "cpu.h"
>> +#include "migration/migration.h"
>> +#include "migration/qemu-file.h"
>> +#include "migration/register.h"
>> +#include "migration/blocker.h"
>> +#include "migration/misc.h"
>> +#include "qapi/error.h"
>> +#include "exec/ramlist.h"
>> +#include "exec/ram_addr.h"
>> +#include "pci.h"
>> +#include "trace.h"
>> +
>> +static void vfio_migration_region_exit(VFIODevice *vbasedev)
>> +{
>> +    VFIOMigration *migration = vbasedev->migration;
>> +
>> +    if (!migration) {
>> +        return;
>> +    }
>> +
>> +    if (migration->region.buffer.size) {
> 
> Having a VFIORegion named buffer within a struct named region is
> unnecessarily confusing.  Please fix.
> 

Adding this fix in next version.

>> +        vfio_region_exit(&migration->region.buffer);
>> +        vfio_region_finalize(&migration->region.buffer);
>> +    }
>> +}
>> +
>> +static int vfio_migration_region_init(VFIODevice *vbasedev)
>> +{
>> +    VFIOMigration *migration = vbasedev->migration;
>> +    Object *obj = NULL;
>> +    int ret = -EINVAL;
>> +
>> +    if (!migration) {
>> +        return ret;
>> +    }
>> +
>> +    if (!vbasedev->ops || !vbasedev->ops->vfio_get_object) {
>> +        return ret;
>> +    }
>> +
>> +    obj = vbasedev->ops->vfio_get_object(vbasedev);
>> +    if (!obj) {
>> +        return ret;
>> +    }
>> +
>> +    ret = vfio_region_setup(obj, vbasedev, &migration->region.buffer,
>> +                            migration->region.index, "migration");
>> +    if (ret) {
>> +        error_report("%s: Failed to setup VFIO migration region %d: %s",
>> +                     vbasedev->name, migration->region.index, strerror(-ret));
>> +        goto err;
>> +    }
>> +
>> +    if (!migration->region.buffer.size) {
>> +        ret = -EINVAL;
>> +        error_report("%s: Invalid region size of VFIO migration region %d: %s",
>> +                     vbasedev->name, migration->region.index, strerror(-ret));
>> +        goto err;
>> +    }
>> +
>> +    return 0;
>> +
>> +err:
>> +    vfio_migration_region_exit(vbasedev);
>> +    return ret;
>> +}
>> +
>> +static int vfio_migration_init(VFIODevice *vbasedev,
>> +                               struct vfio_region_info *info)
>> +{
>> +    int ret;
>> +
>> +    vbasedev->migration = g_new0(VFIOMigration, 1);
>> +    vbasedev->migration->region.index = info->index;
> 
> VFIORegion already caches the region index, VFIORegion.nr.
> 
>> +
>> +    ret = vfio_migration_region_init(vbasedev);
>> +    if (ret) {
>> +        error_report("%s: Failed to initialise migration region",
>> +                     vbasedev->name);
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +/* ---------------------------------------------------------------------- */
>> +
>> +int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
>> +{
>> +    struct vfio_region_info *info;
>> +    Error *local_err = NULL;
>> +    int ret;
>> +
>> +    ret = vfio_get_dev_region_info(vbasedev, VFIO_REGION_TYPE_MIGRATION,
>> +                                   VFIO_REGION_SUBTYPE_MIGRATION, &info);
>> +    if (ret) {
>> +        goto add_blocker;
>> +    }
>> +
>> +    ret = vfio_migration_init(vbasedev, info);
>> +    if (ret) {
>> +        goto add_blocker;
>> +    }
>> +
>> +    trace_vfio_migration_probe(vbasedev->name, info->index);
>> +    return 0;
>> +
>> +add_blocker:
>> +    error_setg(&vbasedev->migration_blocker,
>> +               "VFIO device doesn't support migration"); 
>> +    ret = migrate_add_blocker(vbasedev->migration_blocker, &local_err);
>> +    if (local_err) {
>> +        error_propagate(errp, local_err);
>> +        error_free(vbasedev->migration_blocker);
>> +    }
>> +    return ret;
>> +}
>> +
>> +void vfio_migration_finalize(VFIODevice *vbasedev)
>> +{
>> +    if (!vbasedev->migration) {
>> +        return;
> 
> Don't we allocate migration_blocker even for this case?  Thanks,
> 

Right. Fixing this is next version.

Thanks,
Kirti

> Alex
> 
>> +    }
>> +
>> +    if (vbasedev->migration_blocker) {
>> +        migrate_del_blocker(vbasedev->migration_blocker);
>> +        error_free(vbasedev->migration_blocker);
>> +    }
>> +
>> +    vfio_migration_region_exit(vbasedev);
>> +    g_free(vbasedev->migration);
>> +}
>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>> index 8cdc27946cb8..191a726a1312 100644
>> --- a/hw/vfio/trace-events
>> +++ b/hw/vfio/trace-events
>> @@ -143,3 +143,6 @@ vfio_display_edid_link_up(void) ""
>>  vfio_display_edid_link_down(void) ""
>>  vfio_display_edid_update(uint32_t prefx, uint32_t prefy) "%ux%u"
>>  vfio_display_edid_write_error(void) ""
>> +
>> +# migration.c
>> +vfio_migration_probe(char *name, uint32_t index) " (%s) Region %d"
>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>> index ee72bd984a36..152da3f8d6f3 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -57,6 +57,15 @@ typedef struct VFIORegion {
>>      uint8_t nr; /* cache the region number for debug */
>>  } VFIORegion;
>>  
>> +typedef struct VFIOMigration {
>> +    struct {
>> +        VFIORegion buffer;
>> +        uint32_t index;
>> +    } region;
>> +    uint64_t pending_bytes;
>> +    QemuMutex lock;
>> +} VFIOMigration;
>> +
>>  typedef struct VFIOAddressSpace {
>>      AddressSpace *as;
>>      QLIST_HEAD(, VFIOContainer) containers;
>> @@ -113,6 +122,8 @@ typedef struct VFIODevice {
>>      unsigned int num_irqs;
>>      unsigned int num_regions;
>>      unsigned int flags;
>> +    VFIOMigration *migration;
>> +    Error *migration_blocker;
>>  } VFIODevice;
>>  
>>  struct VFIODeviceOps {
>> @@ -204,4 +215,7 @@ int vfio_spapr_create_window(VFIOContainer *container,
>>  int vfio_spapr_remove_window(VFIOContainer *container,
>>                               hwaddr offset_within_address_space);
>>  
>> +int vfio_migration_probe(VFIODevice *vbasedev, Error **errp);
>> +void vfio_migration_finalize(VFIODevice *vbasedev);
>> +
>>  #endif /* HW_VFIO_VFIO_COMMON_H */
> 
> 

