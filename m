Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DD04E675
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 12:52:41 +0200 (CEST)
Received: from localhost ([::1]:59106 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heH9s-00009W-IW
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 06:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39516)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <yan.y.zhao@intel.com>) id 1heH8k-0007m4-Jh
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 06:51:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yan.y.zhao@intel.com>) id 1heH8h-0008RV-BL
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 06:51:30 -0400
Received: from mga14.intel.com ([192.55.52.115]:23202)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
 id 1heH8f-00082s-Ft
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 06:51:26 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jun 2019 03:51:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,400,1557212400"; d="scan'208";a="311957454"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by orsmga004.jf.intel.com with ESMTP; 21 Jun 2019 03:51:02 -0700
Date: Fri, 21 Jun 2019 06:45:09 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <20190621104509.GD4304@joy-OptiPlex-7040>
References: <1561041461-22326-1-git-send-email-kwankhede@nvidia.com>
 <20190621002518.GF9303@joy-OptiPlex-7040>
 <20190621012404.GA4173@joy-OptiPlex-7040>
 <67726e08-f159-7054-57a7-36b08f691756@nvidia.com>
 <20190621084627.GC4304@joy-OptiPlex-7040>
 <583faf0d-55e7-0611-3e1c-b4925ca7e533@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <583faf0d-55e7-0611-3e1c-b4925ca7e533@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.115
Subject: Re: [Qemu-devel] [PATCH v4 00/13] Add migration support for VFIO
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

On Fri, Jun 21, 2019 at 05:22:37PM +0800, Kirti Wankhede wrote:
> 
> 
> On 6/21/2019 2:16 PM, Yan Zhao wrote:
> > On Fri, Jun 21, 2019 at 04:02:50PM +0800, Kirti Wankhede wrote:
> >>
> >>
> >> On 6/21/2019 6:54 AM, Yan Zhao wrote:
> >>> On Fri, Jun 21, 2019 at 08:25:18AM +0800, Yan Zhao wrote:
> >>>> On Thu, Jun 20, 2019 at 10:37:28PM +0800, Kirti Wankhede wrote:
> >>>>> Add migration support for VFIO device
> >>>>>
> >>>>> This Patch set include patches as below:
> >>>>> - Define KABI for VFIO device for migration support.
> >>>>> - Added save and restore functions for PCI configuration space
> >>>>> - Generic migration functionality for VFIO device.
> >>>>>   * This patch set adds functionality only for PCI devices, but can be
> >>>>>     extended to other VFIO devices.
> >>>>>   * Added all the basic functions required for pre-copy, stop-and-copy and
> >>>>>     resume phases of migration.
> >>>>>   * Added state change notifier and from that notifier function, VFIO
> >>>>>     device's state changed is conveyed to VFIO device driver.
> >>>>>   * During save setup phase and resume/load setup phase, migration region
> >>>>>     is queried and is used to read/write VFIO device data.
> >>>>>   * .save_live_pending and .save_live_iterate are implemented to use QEMU's
> >>>>>     functionality of iteration during pre-copy phase.
> >>>>>   * In .save_live_complete_precopy, that is in stop-and-copy phase,
> >>>>>     iteration to read data from VFIO device driver is implemented till pending
> >>>>>     bytes returned by driver are not zero.
> >>>>>   * Added function to get dirty pages bitmap for the pages which are used by
> >>>>>     driver.
> >>>>> - Add vfio_listerner_log_sync to mark dirty pages.
> >>>>> - Make VFIO PCI device migration capable. If migration region is not provided by
> >>>>>   driver, migration is blocked.
> >>>>>
> >>>>> Below is the flow of state change for live migration where states in brackets
> >>>>> represent VM state, migration state and VFIO device state as:
> >>>>>     (VM state, MIGRATION_STATUS, VFIO_DEVICE_STATE)
> >>>>>
> >>>>> Live migration save path:
> >>>>>         QEMU normal running state
> >>>>>         (RUNNING, _NONE, _RUNNING)
> >>>>>                         |
> >>>>>     migrate_init spawns migration_thread.
> >>>>>     (RUNNING, _SETUP, _RUNNING|_SAVING)
> >>>>>     Migration thread then calls each device's .save_setup()
> >>>>>                         |
> >>>>>     (RUNNING, _ACTIVE, _RUNNING|_SAVING)
> >>>>>     If device is active, get pending bytes by .save_live_pending()
> >>>>>     if pending bytes >= threshold_size,  call save_live_iterate()
> >>>>>     Data of VFIO device for pre-copy phase is copied.
> >>>>>     Iterate till pending bytes converge and are less than threshold
> >>>>>                         |
> >>>>>     On migration completion, vCPUs stops and calls .save_live_complete_precopy
> >>>>>     for each active device. VFIO device is then transitioned in
> >>>>>      _SAVING state.
> >>>>>     (FINISH_MIGRATE, _DEVICE, _SAVING)
> >>>>>     For VFIO device, iterate in  .save_live_complete_precopy  until
> >>>>>     pending data is 0.
> >>>>>     (FINISH_MIGRATE, _DEVICE, _STOPPED)
> >>>>
> >>>> I suggest we also register to VMStateDescription, whose .pre_save
> >>>> handler would get called after .save_live_complete_precopy in pre-copy
> >>>> only case, and will called before .save_live_iterate in post-copy
> >>>> enabled case.
> >>>> In the .pre_save handler, we can save all device state which must be
> >>>> copied after device stop in source vm and before device start in target vm.
> >>>>
> >>> hi
> >>> to better describe this idea:
> >>>
> >>> in pre-copy only case, the flow is
> >>>
> >>> start migration --> .save_live_iterate (several round) -> stop source vm
> >>> --> .save_live_complete_precopy --> .pre_save  -->start target vm
> >>> -->migration complete
> >>>
> >>>
> >>> in post-copy enabled case, the flow is
> >>>
> >>> start migration --> .save_live_iterate (several round) --> start post copy --> 
> >>> stop source vm --> .pre_save --> start target vm --> .save_live_iterate (several round) 
> >>> -->migration complete
> >>>
> >>> Therefore, we should put saving of device state in .pre_save interface
> >>> rather than in .save_live_complete_precopy. 
> >>> The device state includes pci config data, page tables, register state, etc.
> >>>
> >>> The .save_live_iterate and .save_live_complete_precopy should only deal
> >>> with saving dirty memory.
> >>>
> >>
> >> Vendor driver can decide when to save device state depending on the VFIO
> >> device state set by user. Vendor driver doesn't have to depend on which
> >> callback function QEMU or user application calls. In pre-copy case,
> >> save_live_complete_precopy sets VFIO device state to
> >> VFIO_DEVICE_STATE_SAVING which means vCPUs are stopped and vendor driver
> >> should save all device state.
> >>
> > when post copy stops vCPUs and vfio device, vendor driver only needs to
> > provide device state. but how vendor driver knows that, if no extra
> > interface or no extra device state is provides?
> > 
> 
> .save_live_complete_postcopy interface for post-copy will get called,
> right?
>
yes, but it's too late after postcopy completion

> Thanks,
> Kirti
> 
> >>>
> >>> I know current implementation does not support post-copy. but at least
> >>> it should not require huge change when we decide to enable it in future.
> >>>
> >>
> >> .has_postcopy and .save_live_complete_postcopy need to be implemented to
> >> support post-copy. I think .save_live_complete_postcopy should be
> >> similar to vfio_save_complete_precopy.
> >>
> >> Thanks,
> >> Kirti
> >>
> >>> Thanks
> >>> Yan
> >>>

