Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0313F2964ED
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Oct 2020 21:00:18 +0200 (CEST)
Received: from localhost ([::1]:50252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVfov-0002YM-2V
	for lists+qemu-devel@lfdr.de; Thu, 22 Oct 2020 15:00:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kVfgK-0006a7-Ha
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 14:51:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kVfgH-0006l5-Jd
 for qemu-devel@nongnu.org; Thu, 22 Oct 2020 14:51:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603392681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mqSdji05VzyezNfyvMtPfPWDBtwjtehJD9JR0yKy8kc=;
 b=djzj0hUnjsLqhc2cTBJD+jCvqF7UnSdVRZfijCcs/anGG007kaqsolgI5HzBz0M73FJNoo
 IONo2DCb8ucQe7OR+uspFZlbuF9a24DsjeIMhlhVwezWWase/hrtoG970SonWMmeuUybT8
 YFCQIfGAll7oBvRkJv4D+ChKw9x+vwU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-Y2_iOSI5NNeRx_ner3P9kA-1; Thu, 22 Oct 2020 14:51:17 -0400
X-MC-Unique: Y2_iOSI5NNeRx_ner3P9kA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 519D987505D;
 Thu, 22 Oct 2020 18:51:14 +0000 (UTC)
Received: from w520.home (ovpn-112-213.phx2.redhat.com [10.3.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 962D919D61;
 Thu, 22 Oct 2020 18:51:08 +0000 (UTC)
Date: Thu, 22 Oct 2020 12:51:08 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH v27 07/17] vfio: Register SaveVMHandlers for VFIO device
Message-ID: <20201022125108.6137e462@w520.home>
In-Reply-To: <1603365127-14202-8-git-send-email-kwankhede@nvidia.com>
References: <1603365127-14202-1-git-send-email-kwankhede@nvidia.com>
 <1603365127-14202-8-git-send-email-kwankhede@nvidia.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/22 08:33:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: cohuck@redhat.com, cjia@nvidia.com, zhi.wang.linux@gmail.com, aik@ozlabs.ru,
 Zhengxiao.zx@Alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, peterx@redhat.com, eauger@redhat.com,
 yi.l.liu@intel.com, quintela@redhat.com, ziye.yang@intel.com,
 armbru@redhat.com, mlevitsk@redhat.com, pasic@linux.ibm.com,
 felipe@nutanix.com, zhi.a.wang@intel.com, mcrossley@nvidia.com,
 kevin.tian@intel.com, yan.y.zhao@intel.com, dgilbert@redhat.com,
 changpeng.liu@intel.com, eskultet@redhat.com, Ken.Xue@amd.com,
 jonathan.davies@nutanix.com, pbonzini@redhat.com, dnigam@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 22 Oct 2020 16:41:57 +0530
Kirti Wankhede <kwankhede@nvidia.com> wrote:

> Define flags to be used as delimiter in migration stream for VFIO devices.
> Added .save_setup and .save_cleanup functions. Map & unmap migration
> region from these functions at source during saving or pre-copy phase.
> 
> Set VFIO device state depending on VM's state. During live migration, VM is
> running when .save_setup is called, _SAVING | _RUNNING state is set for VFIO
> device. During save-restore, VM is paused, _SAVING state is set for VFIO device.
> 
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> Reviewed-by: Neo Jia <cjia@nvidia.com>
> ---
>  hw/vfio/migration.c  | 96 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  hw/vfio/trace-events |  2 ++
>  2 files changed, 98 insertions(+)
> 
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 7c4fa0d08ea6..2e1054bf7f43 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -8,12 +8,15 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/main-loop.h"
> +#include "qemu/cutils.h"
>  #include <linux/vfio.h>
>  
>  #include "sysemu/runstate.h"
>  #include "hw/vfio/vfio-common.h"
>  #include "cpu.h"
>  #include "migration/migration.h"
> +#include "migration/vmstate.h"
>  #include "migration/qemu-file.h"
>  #include "migration/register.h"
>  #include "migration/blocker.h"
> @@ -25,6 +28,22 @@
>  #include "trace.h"
>  #include "hw/hw.h"
>  
> +/*
> + * Flags to be used as unique delimiters for VFIO devices in the migration
> + * stream. These flags are composed as:
> + * 0xffffffff => MSB 32-bit all 1s
> + * 0xef10     => Magic ID, represents emulated (virtual) function IO
> + * 0x0000     => 16-bits reserved for flags
> + *
> + * The beginning of state information is marked by _DEV_CONFIG_STATE,
> + * _DEV_SETUP_STATE, or _DEV_DATA_STATE, respectively. The end of a
> + * certain state information is marked by _END_OF_STATE.
> + */
> +#define VFIO_MIG_FLAG_END_OF_STATE      (0xffffffffef100001ULL)
> +#define VFIO_MIG_FLAG_DEV_CONFIG_STATE  (0xffffffffef100002ULL)
> +#define VFIO_MIG_FLAG_DEV_SETUP_STATE   (0xffffffffef100003ULL)
> +#define VFIO_MIG_FLAG_DEV_DATA_STATE    (0xffffffffef100004ULL)
> +
>  static inline int vfio_mig_access(VFIODevice *vbasedev, void *val, int count,
>                                    off_t off, bool iswrite)
>  {
> @@ -129,6 +148,69 @@ static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t mask,
>      return 0;
>  }
>  
> +/* ---------------------------------------------------------------------- */
> +
> +static int vfio_save_setup(QEMUFile *f, void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +    VFIOMigration *migration = vbasedev->migration;
> +    int ret;
> +
> +    trace_vfio_save_setup(vbasedev->name);
> +
> +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
> +
> +    if (migration->region.mmaps) {
> +        /*
> +         * vfio_region_mmap() called from migration thread. Memory API called
> +         * from vfio_regio_mmap() need it when called from outdide the main loop
> +         * thread.
> +         */

Thanks for adding this detail, maybe refine slightly as:

  Calling vfio_region_mmap() from migration thread.  Memory APIs called
  from this function require locking the iothread when called from
  outside the main loop thread.

Does that capture the intent?

> +        qemu_mutex_lock_iothread();
> +        ret = vfio_region_mmap(&migration->region);
> +        qemu_mutex_unlock_iothread();
> +        if (ret) {
> +            error_report("%s: Failed to mmap VFIO migration region: %s",
> +                         vbasedev->name, strerror(-ret));
> +            error_report("%s: Falling back to slow path", vbasedev->name);
> +        }
> +    }
> +
> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_MASK,
> +                                   VFIO_DEVICE_STATE_SAVING);
> +    if (ret) {
> +        error_report("%s: Failed to set state SAVING", vbasedev->name);
> +        return ret;
> +    }
> +
> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
> +
> +    ret = qemu_file_get_error(f);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    return 0;
> +}
> +
> +static void vfio_save_cleanup(void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +    VFIOMigration *migration = vbasedev->migration;
> +
> +    if (migration->region.mmaps) {
> +        vfio_region_unmap(&migration->region);
> +    }


Are we in a different thread context here that we don't need that same
iothread locking?


> +    trace_vfio_save_cleanup(vbasedev->name);
> +}
> +
> +static SaveVMHandlers savevm_vfio_handlers = {
> +    .save_setup = vfio_save_setup,
> +    .save_cleanup = vfio_save_cleanup,
> +};
> +
> +/* ---------------------------------------------------------------------- */
> +
>  static void vfio_vmstate_change(void *opaque, int running, RunState state)
>  {
>      VFIODevice *vbasedev = opaque;
> @@ -219,6 +301,8 @@ static int vfio_migration_init(VFIODevice *vbasedev,
>      int ret;
>      Object *obj;
>      VFIOMigration *migration;
> +    char id[256] = "";
> +    g_autofree char *path = NULL, *oid;


AIUI, oid must also be initialized as a g_autofree variable.

>  
>      if (!vbasedev->ops->vfio_get_object) {
>          return -EINVAL;
> @@ -248,6 +332,18 @@ static int vfio_migration_init(VFIODevice *vbasedev,
>  
>      vbasedev->migration = migration;
>      migration->vbasedev = vbasedev;
> +
> +    oid = vmstate_if_get_id(VMSTATE_IF(DEVICE(obj)));
> +    if (oid) {
> +        path = g_strdup_printf("%s/vfio", oid);
> +    } else {
> +        path = g_strdup("vfio");


If we get here then all vfio devices have the same id string.  Isn't
that a problem?  Thanks,

Alex


> +    }
> +    strpadcpy(id, sizeof(id), path, '\0');
> +
> +    register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1, &savevm_vfio_handlers,
> +                         vbasedev);
> +
>      migration->vm_state = qemu_add_vm_change_state_handler(vfio_vmstate_change,
>                                                            vbasedev);
>      migration->migration_state.notify = vfio_migration_state_notifier;
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index 78d7d83b5ef8..f148b5e828c1 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -151,3 +151,5 @@ vfio_migration_probe(const char *name, uint32_t index) " (%s) Region %d"
>  vfio_migration_set_state(const char *name, uint32_t state) " (%s) state %d"
>  vfio_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
>  vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"
> +vfio_save_setup(const char *name) " (%s)"
> +vfio_save_cleanup(const char *name) " (%s)"


