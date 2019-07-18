Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0F86D44A
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 21:00:49 +0200 (CEST)
Received: from localhost ([::1]:40525 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoBe3-0000yb-Gc
	for lists+qemu-devel@lfdr.de; Thu, 18 Jul 2019 15:00:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55560)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwankhede@nvidia.com>) id 1hoBdk-0000Lk-Ma
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 15:00:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwankhede@nvidia.com>) id 1hoBdj-0004JM-FI
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 15:00:28 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:6807)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwankhede@nvidia.com>)
 id 1hoBdj-0004FX-5x
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 15:00:27 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d30c1d00000>; Thu, 18 Jul 2019 12:00:32 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 18 Jul 2019 12:00:25 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 18 Jul 2019 12:00:25 -0700
Received: from [10.24.71.22] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 18 Jul
 2019 19:00:17 +0000
To: Yan Zhao <yan.y.zhao@intel.com>
References: <1562665760-26158-1-git-send-email-kwankhede@nvidia.com>
 <1562665760-26158-11-git-send-email-kwankhede@nvidia.com>
 <20190712025213.GH9176@joy-OptiPlex-7040>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <a8f67428-0f42-4b18-0cfd-02a21c3d4343@nvidia.com>
Date: Fri, 19 Jul 2019 00:30:13 +0530
MIME-Version: 1.0
In-Reply-To: <20190712025213.GH9176@joy-OptiPlex-7040>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1563476432; bh=/xdCrlyQ7vvZvZoU1NQD7S/mnU2h8+GIbgQ4CqwKTMg=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=qgB8uXUZZHPIcNhxkIsT4bbOP6nZCawYr/SU0we8+68reO/agHBbz3hNINbCNgB+1
 OFgse9mjtOmp34hTDGRs4xuvqtw16ELYE6R+MusnPQ3RpctIjH/rxwo5u98VYn3J5v
 8h2hnG9Q+2JbsIhRMdaBrSTDit0g89KsBc3U4f4t2MpCyl1x/EP8HlH3S7jQ0aGYiz
 tM/AwgyhBYSoEOT9Bm0E3S9OO0z/3Uog/Ln1N04wcraUbPYHQ3M9FdmKbHQh1jwB3J
 L+wR0c+TCwmpwjUA91uwKQFWVU7y9aKre8KJP2M/DkCpHXvmN+OAjPwf+k9PbUaIkA
 tc/1QEjgwIHSQ==
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 216.228.121.64
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "cjia@nvidia.com" <cjia@nvidia.com>,
 "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Zhengxiao.zx@Alibaba-inc.com" <Zhengxiao.zx@Alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "eauger@redhat.com" <eauger@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>,
 "mlevitsk@redhat.com" <mlevitsk@redhat.com>, "Liu,
 Changpeng" <changpeng.liu@intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/12/2019 8:22 AM, Yan Zhao wrote:
> On Tue, Jul 09, 2019 at 05:49:17PM +0800, Kirti Wankhede wrote:
>> Flow during _RESUMING device state:
>> - If Vendor driver defines mappable region, mmap migration region.
>> - Load config state.
>> - For data packet, till VFIO_MIG_FLAG_END_OF_STATE is not reached
>>     - read data_size from packet, read buffer of data_size
>>     - read data_offset from where QEMU should write data.
>>         if region is mmaped, write data of data_size to mmaped region.
>>     - write data_size.
>>         In case of mmapped region, write to data_size indicates kernel
>>         driver that data is written in staging buffer.
>>     - if region is trapped, pwrite() data of data_size from data_offset.
>> - Repeat above until VFIO_MIG_FLAG_END_OF_STATE.
>> - Unmap migration region.
>>
>> For user, data is opaque. User should write data in the same order as
>> received.
>>
>> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
>> Reviewed-by: Neo Jia <cjia@nvidia.com>
>> ---
>>  hw/vfio/migration.c  | 162 +++++++++++++++++++++++++++++++++++++++++++++++++++
>>  hw/vfio/trace-events |   3 +
>>  2 files changed, 165 insertions(+)
>>
>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>> index 4e9b4cce230b..5fb4c5329ede 100644
>> --- a/hw/vfio/migration.c
>> +++ b/hw/vfio/migration.c
>> @@ -249,6 +249,26 @@ static int vfio_save_device_config_state(QEMUFile *f, void *opaque)
>>      return qemu_file_get_error(f);
>>  }
>>  
>> +static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +    uint64_t data;
>> +
>> +    if (vbasedev->ops && vbasedev->ops->vfio_load_config) {
>> +        vbasedev->ops->vfio_load_config(vbasedev, f);
>> +    }
>> +
>> +    data = qemu_get_be64(f);
>> +    if (data != VFIO_MIG_FLAG_END_OF_STATE) {
>> +        error_report("%s: Failed loading device config space, "
>> +                     "end flag incorrect 0x%"PRIx64, vbasedev->name, data);
>> +        return -EINVAL;
>> +    }
>> +
>> +    trace_vfio_load_device_config_state(vbasedev->name);
>> +    return qemu_file_get_error(f);
>> +}
>> +
>>  /* ---------------------------------------------------------------------- */
>>  
>>  static int vfio_save_setup(QEMUFile *f, void *opaque)
>> @@ -421,12 +441,154 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>>      return ret;
>>  }
>>  
>> +static int vfio_load_setup(QEMUFile *f, void *opaque)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +    VFIOMigration *migration = vbasedev->migration;
>> +    int ret = 0;
>> +
>> +    if (migration->region.buffer.mmaps) {
>> +        ret = vfio_region_mmap(&migration->region.buffer);
>> +        if (ret) {
>> +            error_report("%s: Failed to mmap VFIO migration region %d: %s",
>> +                         vbasedev->name, migration->region.index,
>> +                         strerror(-ret));
>> +            return ret;
>> +        }
>> +    }
>> +
>> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RESUMING);
>> +    if (ret) {
>> +        error_report("%s: Failed to set state RESUMING", vbasedev->name);
>> +    }
>> +    return ret;
>> +}
>> +
>> +static int vfio_load_cleanup(void *opaque)
>> +{
>> +    vfio_save_cleanup(opaque);
>> +    return 0;
>> +}
>> +
>> +static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>> +{
>> +    VFIODevice *vbasedev = opaque;
>> +    VFIOMigration *migration = vbasedev->migration;
>> +    int ret = 0;
>> +    uint64_t data, data_size;
>> +
> I think checking of version_id is still needed.
> 

Checking version_id with what value?

Thanks,
Kirti

