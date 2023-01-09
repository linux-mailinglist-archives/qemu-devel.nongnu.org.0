Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EC56626BA
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 14:18:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pErVC-0002o7-Gc; Mon, 09 Jan 2023 07:43:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pErV9-0002l0-BT
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:43:43 -0500
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pErV6-0004Zq-TI
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:43:43 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.109])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 25A742DB47;
 Mon,  9 Jan 2023 12:43:36 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 9 Jan
 2023 13:43:34 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S0017be52ec2-6029-4f50-a753-930488869cd5,
 1F76CF3ACB56F17C32A409AA235EFAF7B7A61927) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <52c0f681-7e78-b6e6-b1c9-329673c12e04@kaod.org>
Date: Mon, 9 Jan 2023 13:43:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 09/14] vfio/migration: Rename functions/structs related
 to v1 protocol
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>, <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>, Ilya
 Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, Juan
 Quintela <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, Eric Blake
 <eblake@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, John Snow <jsnow@redhat.com>,
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20221229110345.12480-1-avihaih@nvidia.com>
 <20221229110345.12480-10-avihaih@nvidia.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221229110345.12480-10-avihaih@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 5f2807e5-f69b-42db-bedd-f8ec7b3d3a72
X-Ovh-Tracer-Id: 862439332536552232
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrkeeigdefkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegrvhhihhgrihhhsehnvhhiughirgdrtghomhdpkhifrghnkhhhvgguvgesnhhvihguihgrrdgtohhmpdhmrghorhhgsehnvhhiughirgdrtghomhdpjhhgghesnhhvihguihgrrdgtohhmpdihihhshhgrihhhsehnvhhiughirgdrtghomhdpqhgvmhhuqdgslhhotghksehnohhnghhnuhdrohhrghdpqhgvmhhuqdhsfeeltdigsehnohhnghhnuhdrohhrghdpjhhsnhhofiesrhgvughhrghtrdgtohhmpdhvshgvmhgvnhhtshhovheshigrnhguvgigqdhtvggrmhdrrhhupdgvsghlrg
 hkvgesrhgvughhrghtrdgtohhmpdhfrghmsegvuhhphhhonhdrnhgvthdpshhtvghfrghnhhgrsehrvgguhhgrthdrtghomhdpphgsohhniihinhhisehrvgguhhgrthdrtghomhdptghohhhutghksehrvgguhhgrthdrtghomhdpmhhsthesrhgvughhrghtrdgtohhmpdgughhilhgsvghrthesrhgvughhrghtrdgtohhmpdhquhhinhhtvghlrgesrhgvughhrghtrdgtohhmpdhthhhuthhhsehrvgguhhgrthdrtghomhdpihhiiheslhhinhhugidrihgsmhdrtghomhdpuggrvhhiugesrhgvughhrghtrdgtohhmpdhrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdpfhgrrhhmrghnsehlihhnuhigrdhisghmrdgtohhmpdgsohhrnhhtrhgrvghgvghrsehlihhnuhigrdhisghmrdgtohhmpdhprghsihgtsehlihhnuhigrdhisghmrdgtohhmpdgrlhgvgidrfihilhhlihgrmhhsohhnsehrvgguhhgrthdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpthgrrhhguhhpthgrsehnvhhiughirgdrtghomhdpjhhorghordhmrdhmrghrthhinhhssehorhgrtghlvgdrtghomhdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/29/22 12:03, Avihai Horon wrote:
> To avoid name collisions, rename functions and structs related to VFIO
> migration protocol v1. This will allow the two protocols to co-exist
> when v2 protocol is added, until v1 is removed. No functional changes
> intended.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.



> ---
>   include/hw/vfio/vfio-common.h |   2 +-
>   hw/vfio/common.c              |   6 +-
>   hw/vfio/migration.c           | 106 +++++++++++++++++-----------------
>   hw/vfio/trace-events          |  12 ++--
>   4 files changed, 63 insertions(+), 63 deletions(-)
> 
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index e573f5a9f1..bbaf72ba00 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -62,7 +62,7 @@ typedef struct VFIOMigration {
>       struct VFIODevice *vbasedev;
>       VMChangeStateEntry *vm_state;
>       VFIORegion region;
> -    uint32_t device_state;
> +    uint32_t device_state_v1;
>       int vm_running;
>       Notifier migration_state;
>       uint64_t pending_bytes;
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 7a35edb0e9..6f0157c848 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -355,8 +355,8 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
>                   return false;
>               }
>   
> -            if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF)
> -                && (migration->device_state & VFIO_DEVICE_STATE_V1_RUNNING)) {
> +            if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
> +                (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING)) {
>                   return false;
>               }
>           }
> @@ -385,7 +385,7 @@ static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
>                   return false;
>               }
>   
> -            if (migration->device_state & VFIO_DEVICE_STATE_V1_RUNNING) {
> +            if (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING) {
>                   continue;
>               } else {
>                   return false;
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 977da64411..9df859f4d3 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -107,8 +107,8 @@ static int vfio_mig_rw(VFIODevice *vbasedev, __u8 *buf, size_t count,
>    * an error is returned.
>    */
>   
> -static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t mask,
> -                                    uint32_t value)
> +static int vfio_migration_v1_set_state(VFIODevice *vbasedev, uint32_t mask,
> +                                       uint32_t value)
>   {
>       VFIOMigration *migration = vbasedev->migration;
>       VFIORegion *region = &migration->region;
> @@ -145,8 +145,8 @@ static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t mask,
>           return ret;
>       }
>   
> -    migration->device_state = device_state;
> -    trace_vfio_migration_set_state(vbasedev->name, device_state);
> +    migration->device_state_v1 = device_state;
> +    trace_vfio_migration_v1_set_state(vbasedev->name, device_state);
>       return 0;
>   }
>   
> @@ -260,8 +260,8 @@ static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
>       return ret;
>   }
>   
> -static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
> -                            uint64_t data_size)
> +static int vfio_v1_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
> +                               uint64_t data_size)
>   {
>       VFIORegion *region = &vbasedev->migration->region;
>       uint64_t data_offset = 0, size, report_size;
> @@ -288,7 +288,7 @@ static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
>               data_size = 0;
>           }
>   
> -        trace_vfio_load_state_device_data(vbasedev->name, data_offset, size);
> +        trace_vfio_v1_load_state_device_data(vbasedev->name, data_offset, size);
>   
>           while (size) {
>               void *buf;
> @@ -394,7 +394,7 @@ static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
>       return qemu_file_get_error(f);
>   }
>   
> -static void vfio_migration_cleanup(VFIODevice *vbasedev)
> +static void vfio_migration_v1_cleanup(VFIODevice *vbasedev)
>   {
>       VFIOMigration *migration = vbasedev->migration;
>   
> @@ -405,13 +405,13 @@ static void vfio_migration_cleanup(VFIODevice *vbasedev)
>   
>   /* ---------------------------------------------------------------------- */
>   
> -static int vfio_save_setup(QEMUFile *f, void *opaque)
> +static int vfio_v1_save_setup(QEMUFile *f, void *opaque)
>   {
>       VFIODevice *vbasedev = opaque;
>       VFIOMigration *migration = vbasedev->migration;
>       int ret;
>   
> -    trace_vfio_save_setup(vbasedev->name);
> +    trace_vfio_v1_save_setup(vbasedev->name);
>   
>       qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
>   
> @@ -431,8 +431,8 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
>           }
>       }
>   
> -    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_MASK,
> -                                   VFIO_DEVICE_STATE_V1_SAVING);
> +    ret = vfio_migration_v1_set_state(vbasedev, VFIO_DEVICE_STATE_MASK,
> +                                      VFIO_DEVICE_STATE_V1_SAVING);
>       if (ret) {
>           error_report("%s: Failed to set state SAVING", vbasedev->name);
>           return ret;
> @@ -448,18 +448,18 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
>       return 0;
>   }
>   
> -static void vfio_save_cleanup(void *opaque)
> +static void vfio_v1_save_cleanup(void *opaque)
>   {
>       VFIODevice *vbasedev = opaque;
>   
> -    vfio_migration_cleanup(vbasedev);
> +    vfio_migration_v1_cleanup(vbasedev);
>       trace_vfio_save_cleanup(vbasedev->name);
>   }
>   
> -static void vfio_save_pending(void *opaque, uint64_t threshold_size,
> -                              uint64_t *res_precopy_only,
> -                              uint64_t *res_compatible,
> -                              uint64_t *res_postcopy_only)
> +static void vfio_v1_save_pending(void *opaque, uint64_t threshold_size,
> +                                 uint64_t *res_precopy_only,
> +                                 uint64_t *res_compatible,
> +                                 uint64_t *res_postcopy_only)
>   {
>       VFIODevice *vbasedev = opaque;
>       VFIOMigration *migration = vbasedev->migration;
> @@ -472,8 +472,8 @@ static void vfio_save_pending(void *opaque, uint64_t threshold_size,
>   
>       *res_precopy_only += migration->pending_bytes;
>   
> -    trace_vfio_save_pending(vbasedev->name, *res_precopy_only,
> -                            *res_postcopy_only, *res_compatible);
> +    trace_vfio_v1_save_pending(vbasedev->name, *res_precopy_only,
> +                               *res_postcopy_only, *res_compatible);
>   }
>   
>   static int vfio_save_iterate(QEMUFile *f, void *opaque)
> @@ -523,15 +523,15 @@ static int vfio_save_iterate(QEMUFile *f, void *opaque)
>       return 0;
>   }
>   
> -static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
> +static int vfio_v1_save_complete_precopy(QEMUFile *f, void *opaque)
>   {
>       VFIODevice *vbasedev = opaque;
>       VFIOMigration *migration = vbasedev->migration;
>       uint64_t data_size;
>       int ret;
>   
> -    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_RUNNING,
> -                                   VFIO_DEVICE_STATE_V1_SAVING);
> +    ret = vfio_migration_v1_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_RUNNING,
> +                                      VFIO_DEVICE_STATE_V1_SAVING);
>       if (ret) {
>           error_report("%s: Failed to set state STOP and SAVING",
>                        vbasedev->name);
> @@ -568,13 +568,14 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
>           return ret;
>       }
>   
> -    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_SAVING, 0);
> +    ret = vfio_migration_v1_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_SAVING,
> +                                      0);
>       if (ret) {
>           error_report("%s: Failed to set state STOPPED", vbasedev->name);
>           return ret;
>       }
>   
> -    trace_vfio_save_complete_precopy(vbasedev->name);
> +    trace_vfio_v1_save_complete_precopy(vbasedev->name);
>       return ret;
>   }
>   
> @@ -591,7 +592,7 @@ static void vfio_save_state(QEMUFile *f, void *opaque)
>       }
>   }
>   
> -static int vfio_load_setup(QEMUFile *f, void *opaque)
> +static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
>   {
>       VFIODevice *vbasedev = opaque;
>       VFIOMigration *migration = vbasedev->migration;
> @@ -607,8 +608,8 @@ static int vfio_load_setup(QEMUFile *f, void *opaque)
>           }
>       }
>   
> -    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_MASK,
> -                                   VFIO_DEVICE_STATE_V1_RESUMING);
> +    ret = vfio_migration_v1_set_state(vbasedev, ~VFIO_DEVICE_STATE_MASK,
> +                                      VFIO_DEVICE_STATE_V1_RESUMING);
>       if (ret) {
>           error_report("%s: Failed to set state RESUMING", vbasedev->name);
>           if (migration->region.mmaps) {
> @@ -618,11 +619,11 @@ static int vfio_load_setup(QEMUFile *f, void *opaque)
>       return ret;
>   }
>   
> -static int vfio_load_cleanup(void *opaque)
> +static int vfio_v1_load_cleanup(void *opaque)
>   {
>       VFIODevice *vbasedev = opaque;
>   
> -    vfio_migration_cleanup(vbasedev);
> +    vfio_migration_v1_cleanup(vbasedev);
>       trace_vfio_load_cleanup(vbasedev->name);
>       return 0;
>   }
> @@ -660,7 +661,7 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>               uint64_t data_size = qemu_get_be64(f);
>   
>               if (data_size) {
> -                ret = vfio_load_buffer(f, vbasedev, data_size);
> +                ret = vfio_v1_load_buffer(f, vbasedev, data_size);
>                   if (ret < 0) {
>                       return ret;
>                   }
> @@ -681,21 +682,21 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>       return ret;
>   }
>   
> -static SaveVMHandlers savevm_vfio_handlers = {
> -    .save_setup = vfio_save_setup,
> -    .save_cleanup = vfio_save_cleanup,
> -    .save_live_pending = vfio_save_pending,
> +static SaveVMHandlers savevm_vfio_v1_handlers = {
> +    .save_setup = vfio_v1_save_setup,
> +    .save_cleanup = vfio_v1_save_cleanup,
> +    .save_live_pending = vfio_v1_save_pending,
>       .save_live_iterate = vfio_save_iterate,
> -    .save_live_complete_precopy = vfio_save_complete_precopy,
> +    .save_live_complete_precopy = vfio_v1_save_complete_precopy,
>       .save_state = vfio_save_state,
> -    .load_setup = vfio_load_setup,
> -    .load_cleanup = vfio_load_cleanup,
> +    .load_setup = vfio_v1_load_setup,
> +    .load_cleanup = vfio_v1_load_cleanup,
>       .load_state = vfio_load_state,
>   };
>   
>   /* ---------------------------------------------------------------------- */
>   
> -static void vfio_vmstate_change(void *opaque, bool running, RunState state)
> +static void vfio_v1_vmstate_change(void *opaque, bool running, RunState state)
>   {
>       VFIODevice *vbasedev = opaque;
>       VFIOMigration *migration = vbasedev->migration;
> @@ -735,21 +736,21 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
>           }
>       }
>   
> -    ret = vfio_migration_set_state(vbasedev, mask, value);
> +    ret = vfio_migration_v1_set_state(vbasedev, mask, value);
>       if (ret) {
>           /*
>            * Migration should be aborted in this case, but vm_state_notify()
>            * currently does not support reporting failures.
>            */
>           error_report("%s: Failed to set device state 0x%x", vbasedev->name,
> -                     (migration->device_state & mask) | value);
> +                     (migration->device_state_v1 & mask) | value);
>           if (migrate_get_current()->to_dst_file) {
>               qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
>           }
>       }
>       vbasedev->migration->vm_running = running;
> -    trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
> -            (migration->device_state & mask) | value);
> +    trace_vfio_v1_vmstate_change(vbasedev->name, running, RunState_str(state),
> +            (migration->device_state_v1 & mask) | value);
>   }
>   
>   static void vfio_migration_state_notifier(Notifier *notifier, void *data)
> @@ -768,10 +769,10 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
>       case MIGRATION_STATUS_CANCELLED:
>       case MIGRATION_STATUS_FAILED:
>           bytes_transferred = 0;
> -        ret = vfio_migration_set_state(vbasedev,
> -                                       ~(VFIO_DEVICE_STATE_V1_SAVING |
> -                                         VFIO_DEVICE_STATE_V1_RESUMING),
> -                                       VFIO_DEVICE_STATE_V1_RUNNING);
> +        ret = vfio_migration_v1_set_state(vbasedev,
> +                                          ~(VFIO_DEVICE_STATE_V1_SAVING |
> +                                            VFIO_DEVICE_STATE_V1_RESUMING),
> +                                          VFIO_DEVICE_STATE_V1_RUNNING);
>           if (ret) {
>               error_report("%s: Failed to set state RUNNING", vbasedev->name);
>           }
> @@ -815,7 +816,7 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>       }
>   
>       vbasedev->migration = g_new0(VFIOMigration, 1);
> -    vbasedev->migration->device_state = VFIO_DEVICE_STATE_V1_RUNNING;
> +    vbasedev->migration->device_state_v1 = VFIO_DEVICE_STATE_V1_RUNNING;
>       vbasedev->migration->vm_running = runstate_is_running();
>   
>       ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
> @@ -846,12 +847,11 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>       }
>       strpadcpy(id, sizeof(id), path, '\0');
>   
> -    register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1, &savevm_vfio_handlers,
> -                         vbasedev);
> +    register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
> +                         &savevm_vfio_v1_handlers, vbasedev);
>   
> -    migration->vm_state = qdev_add_vm_change_state_handler(vbasedev->dev,
> -                                                           vfio_vmstate_change,
> -                                                           vbasedev);
> +    migration->vm_state = qdev_add_vm_change_state_handler(
> +        vbasedev->dev, vfio_v1_vmstate_change, vbasedev);
>       migration->migration_state.notify = vfio_migration_state_notifier;
>       add_migration_state_change_notifier(&migration->migration_state);
>       return 0;
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index b259dcc644..9eb9aff295 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -149,20 +149,20 @@ vfio_display_edid_write_error(void) ""
>   
>   # migration.c
>   vfio_migration_probe(const char *name) " (%s)"
> -vfio_migration_set_state(const char *name, uint32_t state) " (%s) state %d"
> -vfio_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
> +vfio_migration_v1_set_state(const char *name, uint32_t state) " (%s) state %d"
> +vfio_v1_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
>   vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"
> -vfio_save_setup(const char *name) " (%s)"
> +vfio_v1_save_setup(const char *name) " (%s)"
>   vfio_save_cleanup(const char *name) " (%s)"
>   vfio_save_buffer(const char *name, uint64_t data_offset, uint64_t data_size, uint64_t pending) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64" pending 0x%"PRIx64
>   vfio_update_pending(const char *name, uint64_t pending) " (%s) pending 0x%"PRIx64
>   vfio_save_device_config_state(const char *name) " (%s)"
> -vfio_save_pending(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t compatible) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" compatible 0x%"PRIx64
> +vfio_v1_save_pending(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t compatible) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" compatible 0x%"PRIx64
>   vfio_save_iterate(const char *name, int data_size) " (%s) data_size %d"
> -vfio_save_complete_precopy(const char *name) " (%s)"
> +vfio_v1_save_complete_precopy(const char *name) " (%s)"
>   vfio_load_device_config_state(const char *name) " (%s)"
>   vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
> -vfio_load_state_device_data(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
> +vfio_v1_load_state_device_data(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
>   vfio_load_cleanup(const char *name) " (%s)"
>   vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
>   vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64


