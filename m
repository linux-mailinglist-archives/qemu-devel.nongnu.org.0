Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D066434B49C
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Mar 2021 07:06:40 +0100 (CET)
Received: from localhost ([::1]:45190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQ25n-0000if-Ca
	for lists+qemu-devel@lfdr.de; Sat, 27 Mar 2021 02:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lQ24E-0000Gc-Le
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 02:05:02 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lQ24B-0001PO-4q
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 02:05:02 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F6pCh36Qsz1BFrH;
 Sat, 27 Mar 2021 14:02:40 +0800 (CST)
Received: from [10.174.184.135] (10.174.184.135) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Sat, 27 Mar 2021 14:04:39 +0800
Subject: Re: [PATCH v3 1/1] docs/devel: Add VFIO device migration documentation
To: Tarun Gupta <targupta@nvidia.com>, <qemu-devel@nongnu.org>,
 <kwankhede@nvidia.com>, <alex.williamson@redhat.com>, <cohuck@redhat.com>,
 <kevin.tian@intel.com>
References: <20210326131850.149337-1-targupta@nvidia.com>
From: Shenming Lu <lushenming@huawei.com>
Message-ID: <f9e5076b-ada5-88fc-c738-db51330e96b4@huawei.com>
Date: Sat, 27 Mar 2021 14:04:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20210326131850.149337-1-targupta@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.135]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=lushenming@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yan.y.zhao@intel.com, quintela@redhat.com, berrange@redhat.com,
 dgilbert@redhat.com, dnigam@nvidia.com, cjia@nvidia.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/3/26 21:18, Tarun Gupta wrote:
> Document interfaces used for VFIO device migration. Added flow of state changes
> during live migration with VFIO device. Tested by building docs with the new
> vfio-migration.rst file.
> 
> v3:
> - Add introductory line about VM migration in general.
> - Remove occurcences of vfio_pin_pages() to describe pinning.
> - Incorporated comments from v2
> 
> v2:
> - Included the new vfio-migration.rst file in index.rst
> - Updated dirty page tracking section, also added details about
>   'pre-copy-dirty-page-tracking' opt-out option.
> - Incorporated comments around wording of doc.
> 
> Signed-off-by: Tarun Gupta <targupta@nvidia.com>
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> ---
>  MAINTAINERS                   |   1 +
>  docs/devel/index.rst          |   1 +
>  docs/devel/vfio-migration.rst | 143 ++++++++++++++++++++++++++++++++++
>  3 files changed, 145 insertions(+)
>  create mode 100644 docs/devel/vfio-migration.rst
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 738786146d..a2a80eee59 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1801,6 +1801,7 @@ M: Alex Williamson <alex.williamson@redhat.com>
>  S: Supported
>  F: hw/vfio/*
>  F: include/hw/vfio/
> +F: docs/devel/vfio-migration.rst
>  
>  vfio-ccw
>  M: Cornelia Huck <cohuck@redhat.com>
> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> index ae664da00c..5330f1ca1d 100644
> --- a/docs/devel/index.rst
> +++ b/docs/devel/index.rst
> @@ -39,3 +39,4 @@ Contents:
>     qom
>     block-coroutine-wrapper
>     multi-process
> +   vfio-migration
> diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
> new file mode 100644
> index 0000000000..24cb55991a
> --- /dev/null
> +++ b/docs/devel/vfio-migration.rst
> @@ -0,0 +1,143 @@
> +=====================
> +VFIO device Migration
> +=====================
> +
> +Migration of virtual machine involves saving the state for each device that
> +the guest is running on source host and restoring this saved state on the
> +destination host. This document details how saving and restoring of VFIO
> +devices is done in QEMU.
> +
> +Migration of VFIO devices consists of two phases: the optional pre-copy phase,
> +and the stop-and-copy phase. The pre-copy phase is iterative and allows to
> +accommodate VFIO devices that have a large amount of data that needs to be
> +transferred. The iterative pre-copy phase of migration allows for the guest to
> +continue whilst the VFIO device state is transferred to the destination, this
> +helps to reduce the total downtime of the VM. VFIO devices can choose to skip
> +the pre-copy phase of migration by returning pending_bytes as zero during the
> +pre-copy phase.
> +
> +A detailed description of the UAPI for VFIO device migration can be found in
> +the comment for the ``vfio_device_migration_info`` structure in the header
> +file linux-headers/linux/vfio.h.
> +
> +VFIO device hooks for iterative approach:
> +
> +* A ``save_setup`` function that sets up the migration region, sets _SAVING
> +  flag in the VFIO device state and informs the VFIO IOMMU module to start
> +  dirty page tracking.
> +
> +* A ``load_setup`` function that sets up the migration region on the
> +  destination and sets _RESUMING flag in the VFIO device state.
> +
> +* A ``save_live_pending`` function that reads pending_bytes from the vendor
> +  driver, which indicates the amount of data that the vendor driver has yet to
> +  save for the VFIO device.
> +
> +* A ``save_live_iterate`` function that reads the VFIO device's data from the
> +  vendor driver through the migration region during iterative phase.
> +
> +* A ``save_live_complete_precopy`` function that resets _RUNNING flag from the
> +  VFIO device state, saves the device config space, if any, and iteratively
> +  copies the remaining data for the VFIO device until the vendor driver
> +  indicates that no data remains (pending bytes is zero).

Hi Tarun,

We have moved the saving of the config space to the ``save_state`` function
added in commit d329f5032e1, do we need to add this change here? :-)

Thanks,
Shenming

> +
> +* A ``load_state`` function that loads the config section and the data
> +  sections that are generated by the save functions above
> +
> +* ``cleanup`` functions for both save and load that perform any migration
> +  related cleanup, including unmapping the migration region
> +
> +A VM state change handler is registered to change the VFIO device state when
> +the VM state changes.
> +
> +Similarly, a migration state change notifier is registered to get a
> +notification on migration state change. These states are translated to the
> +corresponding VFIO device state and conveyed to the vendor driver.
> +
> +System memory dirty pages tracking
> +----------------------------------
> +
> +A ``log_sync`` memory listener callback marks those system memory pages
> +as dirty which are used for DMA by the VFIO device. The dirty pages bitmap is
> +queried per container. All pages pinned by the vendor driver through external
> +APIs have to be marked as dirty during migration. When there are CPU writes,
> +CPU dirty page tracking can identify dirtied pages, but any page pinned by the
> +vendor driver can also be written by device. There is currently no device or
> +IOMMU support for dirty page tracking in hardware.
> +
> +By default, dirty pages are tracked when the device is in pre-copy as well as
> +stop-and-copy phase. So, a page pinned by vendor driver will be copied to
> +destination in both the phases. Copying dirty pages in pre-copy phase helps
> +QEMU to predict if it can achieve its downtime tolerances. If QEMU during
> +pre-copy phase keeps finding dirty pages continuously, then it understands
> +that even in stop-and-copy phase, it is likely to find dirty pages and can
> +predict the downtime accordingly
> +
> +QEMU also provides per device opt-out option ``pre-copy-dirty-page-tracking``
> +which disables querying dirty bitmap during pre-copy phase. If it is set to
> +off, all dirty pages will be copied to destination in stop-and-copy phase only
> +
> +System memory dirty pages tracking when vIOMMU is enabled
> +---------------------------------------------------------
> +
> +With vIOMMU, an IO virtual address range can get unmapped while in pre-copy
> +phase of migration. In that case, the unmap ioctl returns any dirty pages in
> +that range and QEMU reports corresponding guest physical pages dirty. During
> +stop-and-copy phase, an IOMMU notifier is used to get a callback for mapped
> +pages and then dirty pages bitmap is fetched from VFIO IOMMU modules for those
> +mapped ranges.
> +
> +Flow of state changes during Live migration
> +===========================================
> +
> +Below is the flow of state change during live migration.
> +The values in the brackets represent the VM state, the migration state, and
> +the VFIO device state, respectively.
> +
> +Live migration save path
> +------------------------
> +
> +::
> +
> +                        QEMU normal running state
> +                        (RUNNING, _NONE, _RUNNING)
> +                                  |
> +                     migrate_init spawns migration_thread
> +                Migration thread then calls each device's .save_setup()
> +                    (RUNNING, _SETUP, _RUNNING|_SAVING)
> +                                  |
> +                    (RUNNING, _ACTIVE, _RUNNING|_SAVING)
> +             If device is active, get pending_bytes by .save_live_pending()
> +          If total pending_bytes >= threshold_size, call .save_live_iterate()
> +                  Data of VFIO device for pre-copy phase is copied
> +        Iterate till total pending bytes converge and are less than threshold
> +                                  |
> +  On migration completion, vCPU stops and calls .save_live_complete_precopy for
> +   each active device. The VFIO device is then transitioned into _SAVING state
> +                   (FINISH_MIGRATE, _DEVICE, _SAVING)
> +                                  |
> +     For the VFIO device, iterate in .save_live_complete_precopy until
> +                         pending data is 0
> +                   (FINISH_MIGRATE, _DEVICE, _STOPPED)
> +                                  |
> +                 (FINISH_MIGRATE, _COMPLETED, _STOPPED)
> +             Migraton thread schedules cleanup bottom half and exits
> +
> +Live migration resume path
> +--------------------------
> +
> +::
> +
> +              Incoming migration calls .load_setup for each device
> +                       (RESTORE_VM, _ACTIVE, _STOPPED)
> +                                 |
> +       For each device, .load_state is called for that device section data
> +                       (RESTORE_VM, _ACTIVE, _RESUMING)
> +                                 |
> +    At the end, .load_cleanup is called for each device and vCPUs are started
> +                       (RUNNING, _NONE, _RUNNING)
> +
> +Postcopy
> +========
> +
> +Postcopy migration is currently not supported for VFIO devices.
> 

