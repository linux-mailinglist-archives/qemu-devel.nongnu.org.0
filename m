Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5203C6F7F2
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 05:27:01 +0200 (CEST)
Received: from localhost ([::1]:58528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpOya-0006PG-FW
	for lists+qemu-devel@lfdr.de; Sun, 21 Jul 2019 23:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38543)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <yan.y.zhao@intel.com>) id 1hpOyL-00060m-VZ
 for qemu-devel@nongnu.org; Sun, 21 Jul 2019 23:26:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yan.y.zhao@intel.com>) id 1hpOyK-0007CR-PI
 for qemu-devel@nongnu.org; Sun, 21 Jul 2019 23:26:45 -0400
Received: from mga09.intel.com ([134.134.136.24]:10429)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
 id 1hpOyK-000745-FX
 for qemu-devel@nongnu.org; Sun, 21 Jul 2019 23:26:44 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jul 2019 20:26:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,293,1559545200"; d="scan'208";a="344289424"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by orsmga005.jf.intel.com with ESMTP; 21 Jul 2019 20:26:32 -0700
Date: Sun, 21 Jul 2019 23:20:28 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <20190722032028.GJ8912@joy-OptiPlex-7040>
References: <1562665760-26158-1-git-send-email-kwankhede@nvidia.com>
 <1562665760-26158-11-git-send-email-kwankhede@nvidia.com>
 <20190712025213.GH9176@joy-OptiPlex-7040>
 <a8f67428-0f42-4b18-0cfd-02a21c3d4343@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8f67428-0f42-4b18-0cfd-02a21c3d4343@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.24
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

On Fri, Jul 19, 2019 at 03:00:13AM +0800, Kirti Wankhede wrote:
> 
> 
> On 7/12/2019 8:22 AM, Yan Zhao wrote:
> > On Tue, Jul 09, 2019 at 05:49:17PM +0800, Kirti Wankhede wrote:
> >> Flow during _RESUMING device state:
> >> - If Vendor driver defines mappable region, mmap migration region.
> >> - Load config state.
> >> - For data packet, till VFIO_MIG_FLAG_END_OF_STATE is not reached
> >>     - read data_size from packet, read buffer of data_size
> >>     - read data_offset from where QEMU should write data.
> >>         if region is mmaped, write data of data_size to mmaped region.
> >>     - write data_size.
> >>         In case of mmapped region, write to data_size indicates kernel
> >>         driver that data is written in staging buffer.
> >>     - if region is trapped, pwrite() data of data_size from data_offset.
> >> - Repeat above until VFIO_MIG_FLAG_END_OF_STATE.
> >> - Unmap migration region.
> >>
> >> For user, data is opaque. User should write data in the same order as
> >> received.
> >>
> >> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> >> Reviewed-by: Neo Jia <cjia@nvidia.com>
> >> ---
> >>  hw/vfio/migration.c  | 162 +++++++++++++++++++++++++++++++++++++++++++++++++++
> >>  hw/vfio/trace-events |   3 +
> >>  2 files changed, 165 insertions(+)
> >>
> >> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> >> index 4e9b4cce230b..5fb4c5329ede 100644
> >> --- a/hw/vfio/migration.c
> >> +++ b/hw/vfio/migration.c
> >> @@ -249,6 +249,26 @@ static int vfio_save_device_config_state(QEMUFile *f, void *opaque)
> >>      return qemu_file_get_error(f);
> >>  }
> >>  
> >> +static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
> >> +{
> >> +    VFIODevice *vbasedev = opaque;
> >> +    uint64_t data;
> >> +
> >> +    if (vbasedev->ops && vbasedev->ops->vfio_load_config) {
> >> +        vbasedev->ops->vfio_load_config(vbasedev, f);
> >> +    }
> >> +
> >> +    data = qemu_get_be64(f);
> >> +    if (data != VFIO_MIG_FLAG_END_OF_STATE) {
> >> +        error_report("%s: Failed loading device config space, "
> >> +                     "end flag incorrect 0x%"PRIx64, vbasedev->name, data);
> >> +        return -EINVAL;
> >> +    }
> >> +
> >> +    trace_vfio_load_device_config_state(vbasedev->name);
> >> +    return qemu_file_get_error(f);
> >> +}
> >> +
> >>  /* ---------------------------------------------------------------------- */
> >>  
> >>  static int vfio_save_setup(QEMUFile *f, void *opaque)
> >> @@ -421,12 +441,154 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
> >>      return ret;
> >>  }
> >>  
> >> +static int vfio_load_setup(QEMUFile *f, void *opaque)
> >> +{
> >> +    VFIODevice *vbasedev = opaque;
> >> +    VFIOMigration *migration = vbasedev->migration;
> >> +    int ret = 0;
> >> +
> >> +    if (migration->region.buffer.mmaps) {
> >> +        ret = vfio_region_mmap(&migration->region.buffer);
> >> +        if (ret) {
> >> +            error_report("%s: Failed to mmap VFIO migration region %d: %s",
> >> +                         vbasedev->name, migration->region.index,
> >> +                         strerror(-ret));
> >> +            return ret;
> >> +        }
> >> +    }
> >> +
> >> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RESUMING);
> >> +    if (ret) {
> >> +        error_report("%s: Failed to set state RESUMING", vbasedev->name);
> >> +    }
> >> +    return ret;
> >> +}
> >> +
> >> +static int vfio_load_cleanup(void *opaque)
> >> +{
> >> +    vfio_save_cleanup(opaque);
> >> +    return 0;
> >> +}
> >> +
> >> +static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
> >> +{
> >> +    VFIODevice *vbasedev = opaque;
> >> +    VFIOMigration *migration = vbasedev->migration;
> >> +    int ret = 0;
> >> +    uint64_t data, data_size;
> >> +
> > I think checking of version_id is still needed.
> > 
> 
> Checking version_id with what value?
>
this version_id passed-in is the source VFIO software interface id.
need to check it with the value in target side, right?

Though we previously discussed the sysfs node interface to check live
migration version even before launching live migration, I think we still
need this runtime software version check in qemu to ensure software
interfaces in QEMU VFIO are compatible.

Thanks
Yan

