Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0676B488
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 04:31:40 +0200 (CEST)
Received: from localhost ([::1]:53606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnZjH-0007s6-Dq
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 22:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52407)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <yan.y.zhao@intel.com>) id 1hnZj4-0007Ti-HY
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 22:31:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yan.y.zhao@intel.com>) id 1hnZj3-0004YF-Ak
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 22:31:26 -0400
Received: from mga02.intel.com ([134.134.136.20]:15309)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yan.y.zhao@intel.com>)
 id 1hnZj3-0004Vn-13
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 22:31:25 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jul 2019 19:31:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,272,1559545200"; d="scan'208";a="170114774"
Received: from joy-optiplex-7040.sh.intel.com (HELO joy-OptiPlex-7040)
 ([10.239.13.9])
 by orsmga003.jf.intel.com with ESMTP; 16 Jul 2019 19:31:15 -0700
Date: Tue, 16 Jul 2019 22:25:13 -0400
From: Yan Zhao <yan.y.zhao@intel.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <20190717022513.GD8912@joy-OptiPlex-7040>
References: <1562665760-26158-1-git-send-email-kwankhede@nvidia.com>
 <1562665760-26158-8-git-send-email-kwankhede@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562665760-26158-8-git-send-email-kwankhede@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.20
Subject: Re: [Qemu-devel] [PATCH v7 07/13] vfio: Add migration state change
 notifier
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

On Tue, Jul 09, 2019 at 05:49:14PM +0800, Kirti Wankhede wrote:
> Added migration state change notifier to get notification on migration state
> change. These states are translated to VFIO device state and conveyed to vendor
> driver.
> 
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> Reviewed-by: Neo Jia <cjia@nvidia.com>
> ---
>  hw/vfio/migration.c           | 54 +++++++++++++++++++++++++++++++++++++++++++
>  hw/vfio/trace-events          |  1 +
>  include/hw/vfio/vfio-common.h |  1 +
>  3 files changed, 56 insertions(+)
> 
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index c01f08b659d0..e4a89a6f9bc7 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -132,6 +132,53 @@ static void vfio_vmstate_change(void *opaque, int running, RunState state)
>      }
>  }
>  
> +static void vfio_migration_state_notifier(Notifier *notifier, void *data)
> +{
> +    MigrationState *s = data;
> +    VFIODevice *vbasedev = container_of(notifier, VFIODevice, migration_state);
> +    int ret;
> +
> +    trace_vfio_migration_state_notifier(vbasedev->name, s->state);
> +
> +    switch (s->state) {
> +    case MIGRATION_STATUS_ACTIVE:
> +        if (vbasedev->device_state & VFIO_DEVICE_STATE_RUNNING) {
> +            if (vbasedev->vm_running) {
> +                ret = vfio_migration_set_state(vbasedev,
> +                          VFIO_DEVICE_STATE_RUNNING | VFIO_DEVICE_STATE_SAVING);
> +                if (ret) {
> +                    error_report("%s: Failed to set state RUNNING and SAVING",
> +                                  vbasedev->name);
> +                }
> +            } else {
> +                ret = vfio_migration_set_state(vbasedev,
> +                                               VFIO_DEVICE_STATE_SAVING);
> +                if (ret) {
> +                    error_report("%s: Failed to set state STOP and SAVING",
> +                                 vbasedev->name);
> +                }
> +            }
> +        } else {
> +            ret = vfio_migration_set_state(vbasedev,
> +                                           VFIO_DEVICE_STATE_RESUMING);
> +            if (ret) {
> +                error_report("%s: Failed to set state RESUMING",
> +                             vbasedev->name);
> +            }
> +        }
> +        return;
> +
hi Kirti
currently, migration state notifiers are only notified in below 3 interfaces:
migrate_fd_connect, migrate_fd_cleanup, postcopy_start, where
MIGRATION_STATUS_ACTIVE is not an valid state.
Have you tested the above code? what's the purpose of the code?

Thanks
Yan

> +    case MIGRATION_STATUS_CANCELLING:
> +    case MIGRATION_STATUS_CANCELLED:
> +    case MIGRATION_STATUS_FAILED:
> +        ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING);
> +        if (ret) {
> +            error_report("%s: Failed to set state RUNNING", vbasedev->name);
> +        }
> +        return;
> +    }
> +}
> +
>  static int vfio_migration_init(VFIODevice *vbasedev,
>                                 struct vfio_region_info *info)
>  {
> @@ -152,6 +199,9 @@ static int vfio_migration_init(VFIODevice *vbasedev,
>      vbasedev->vm_state = qemu_add_vm_change_state_handler(vfio_vmstate_change,
>                                                            vbasedev);
>  
> +    vbasedev->migration_state.notify = vfio_migration_state_notifier;
> +    add_migration_state_change_notifier(&vbasedev->migration_state);
> +
>      return 0;
>  }
>  
> @@ -194,6 +244,10 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
>          return;
>      }
>  
> +    if (vbasedev->migration_state.notify) {
> +        remove_migration_state_change_notifier(&vbasedev->migration_state);
> +    }
> +
>      if (vbasedev->vm_state) {
>          qemu_del_vm_change_state_handler(vbasedev->vm_state);
>      }
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index 3d15bacd031a..69503228f20e 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -148,3 +148,4 @@ vfio_display_edid_write_error(void) ""
>  vfio_migration_probe(char *name, uint32_t index) " (%s) Region %d"
>  vfio_migration_set_state(char *name, uint32_t state) " (%s) state %d"
>  vfio_vmstate_change(char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
> +vfio_migration_state_notifier(char *name, int state) " (%s) state %d"
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index f6c70db3a9c1..a022484d2636 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -128,6 +128,7 @@ typedef struct VFIODevice {
>      uint32_t device_state;
>      VMChangeStateEntry *vm_state;
>      int vm_running;
> +    Notifier migration_state;
>  } VFIODevice;
>  
>  struct VFIODeviceOps {
> -- 
> 2.7.0
> 

