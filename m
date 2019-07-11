Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E7A65057
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 05:02:47 +0200 (CEST)
Received: from localhost ([::1]:38218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlPM6-0005jA-6T
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 23:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35327)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <yan.y.zhao@intel.com>) id 1hlPL3-0004yh-2Z
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 23:01:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yan.y.zhao@intel.com>) id 1hlPL1-0005al-EL
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 23:01:41 -0400
Received: from mga02.intel.com ([134.134.136.20]:35474)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
 id 1hlPL1-0005QI-3M
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 23:01:39 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jul 2019 20:01:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,476,1557212400"; d="scan'208";a="166264134"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by fmsmga008.fm.intel.com with ESMTP; 10 Jul 2019 20:01:24 -0700
Date: Wed, 10 Jul 2019 22:55:24 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <20190711025524.GB9176@joy-OptiPlex-7040>
References: <1562665760-26158-1-git-send-email-kwankhede@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562665760-26158-1-git-send-email-kwankhede@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.20
Subject: Re: [Qemu-devel] [PATCH v7 00/13] Add migration support for VFIO
 device
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

Hi Kirti,
There are still unaddressed comments to your patches v4.
Would you mind addressing them?

1. should we register two migration interfaces simultaneously
(https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg04750.html)
2. in each save iteration, how much data is to be saved
(https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg04683.html)
3. do we need extra interface to get data for device state only
(https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg04812.html)
4. definition of dirty page copied_pfn
(https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg05592.html)

Also, I'm glad to see that you updated code by following my comments below,
but please don't forget to reply my comments next time:)
https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg05357.html
https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg06454.html

Thanks
Yan

On Tue, Jul 09, 2019 at 05:49:07PM +0800, Kirti Wankhede wrote:
> Add migration support for VFIO device
> 
> This Patch set include patches as below:
> - Define KABI for VFIO device for migration support.
> - Added save and restore functions for PCI configuration space
> - Generic migration functionality for VFIO device.
>   * This patch set adds functionality only for PCI devices, but can be
>     extended to other VFIO devices.
>   * Added all the basic functions required for pre-copy, stop-and-copy and
>     resume phases of migration.
>   * Added state change notifier and from that notifier function, VFIO
>     device's state changed is conveyed to VFIO device driver.
>   * During save setup phase and resume/load setup phase, migration region
>     is queried and is used to read/write VFIO device data.
>   * .save_live_pending and .save_live_iterate are implemented to use QEMU's
>     functionality of iteration during pre-copy phase.
>   * In .save_live_complete_precopy, that is in stop-and-copy phase,
>     iteration to read data from VFIO device driver is implemented till pending
>     bytes returned by driver are not zero.
>   * Added function to get dirty pages bitmap for the pages which are used by
>     driver.
> - Add vfio_listerner_log_sync to mark dirty pages.
> - Make VFIO PCI device migration capable. If migration region is not provided by
>   driver, migration is blocked.
> 
> Below is the flow of state change for live migration where states in brackets
> represent VM state, migration state and VFIO device state as:
>     (VM state, MIGRATION_STATUS, VFIO_DEVICE_STATE)
> 
> Live migration save path:
>         QEMU normal running state
>         (RUNNING, _NONE, _RUNNING)
>                         |
>     migrate_init spawns migration_thread.
>     (RUNNING, _SETUP, _RUNNING|_SAVING)
>     Migration thread then calls each device's .save_setup()
>                         |
>     (RUNNING, _ACTIVE, _RUNNING|_SAVING)
>     If device is active, get pending bytes by .save_live_pending()
>     if pending bytes >= threshold_size,  call save_live_iterate()
>     Data of VFIO device for pre-copy phase is copied.
>     Iterate till pending bytes converge and are less than threshold
>                         |
>     On migration completion, vCPUs stops and calls .save_live_complete_precopy
>     for each active device. VFIO device is then transitioned in
>      _SAVING state.
>     (FINISH_MIGRATE, _DEVICE, _SAVING)
>     For VFIO device, iterate in  .save_live_complete_precopy  until
>     pending data is 0.
>     (FINISH_MIGRATE, _DEVICE, _STOPPED)
>                         |
>     (FINISH_MIGRATE, _COMPLETED, STOPPED)
>     Migraton thread schedule cleanup bottom half and exit
> 
> Live migration resume path:
>     Incomming migration calls .load_setup for each device
>     (RESTORE_VM, _ACTIVE, STOPPED)
>                         |
>     For each device, .load_state is called for that device section data
>                         |
>     At the end, called .load_cleanup for each device and vCPUs are started.
>                         |
>         (RUNNING, _NONE, _RUNNING)
> 
> Note that:
> - Migration post copy is not supported.
> 
> v6 -> v7:
> - Fix build failures.
> 
> v5 -> v6:
> - Fix build failure.
> 
> v4 -> v5:
> - Added decriptive comment about the sequence of access of members of structure
>   vfio_device_migration_info to be followed based on Alex's suggestion
> - Updated get dirty pages sequence.
> - As per Cornelia Huck's suggestion, added callbacks to VFIODeviceOps to
>   get_object, save_config and load_config.
> - Fixed multiple nit picks.
> - Tested live migration with multiple vfio device assigned to a VM.
> 
> v3 -> v4:
> - Added one more bit for _RESUMING flag to be set explicitly.
> - data_offset field is read-only for user space application.
> - data_size is read for every iteration before reading data from migration, that
>   is removed assumption that data will be till end of migration region.
> - If vendor driver supports mappable sparsed region, map those region during
>   setup state of save/load, similarly unmap those from cleanup routines.
> - Handles race condition that causes data corruption in migration region during
>   save device state by adding mutex and serialiaing save_buffer and
>   get_dirty_pages routines.
> - Skip called get_dirty_pages routine for mapped MMIO region of device.
> - Added trace events.
> - Splitted into multiple functional patches.
> 
> v2 -> v3:
> - Removed enum of VFIO device states. Defined VFIO device state with 2 bits.
> - Re-structured vfio_device_migration_info to keep it minimal and defined action
>   on read and write access on its members.
> 
> v1 -> v2:
> - Defined MIGRATION region type and sub-type which should be used with region
>   type capability.
> - Re-structured vfio_device_migration_info. This structure will be placed at 0th
>   offset of migration region.
> - Replaced ioctl with read/write for trapped part of migration region.
> - Added both type of access support, trapped or mmapped, for data section of the
>   region.
> - Moved PCI device functions to pci file.
> - Added iteration to get dirty page bitmap until bitmap for all requested pages
>   are copied.
> 
> Thanks,
> Kirti
> 
> Kirti Wankhede (13):
>   vfio: KABI for migration interface
>   vfio: Add function to unmap VFIO region
>   vfio: Add vfio_get_object callback to VFIODeviceOps
>   vfio: Add save and load functions for VFIO PCI devices
>   vfio: Add migration region initialization and finalize function
>   vfio: Add VM state change handler to know state of VM
>   vfio: Add migration state change notifier
>   vfio: Register SaveVMHandlers for VFIO device
>   vfio: Add save state functions to SaveVMHandlers
>   vfio: Add load state functions to SaveVMHandlers
>   vfio: Add function to get dirty page list
>   vfio: Add vfio_listerner_log_sync to mark dirty pages
>   vfio: Make vfio-pci device migration capable.
> 
>  hw/vfio/Makefile.objs         |   2 +-
>  hw/vfio/common.c              |  55 +++
>  hw/vfio/migration.c           | 874 ++++++++++++++++++++++++++++++++++++++++++
>  hw/vfio/pci.c                 | 137 ++++++-
>  hw/vfio/trace-events          |  19 +
>  include/hw/vfio/vfio-common.h |  25 ++
>  linux-headers/linux/vfio.h    | 166 ++++++++
>  7 files changed, 1271 insertions(+), 7 deletions(-)
>  create mode 100644 hw/vfio/migration.c
> 
> -- 
> 2.7.0
> 

