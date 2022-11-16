Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECC162C7A8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 19:31:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovNAZ-0001DV-RB; Wed, 16 Nov 2022 13:29:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ovNAW-0001C6-Ov
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 13:29:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ovNAL-0004N3-WE
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 13:29:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668623381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1dnsmoGhzDNbtszBCRTc+zNSPTgnUYayU9M22Zm8ToI=;
 b=MmjjI0w+z26yiJ04QMI4TMIQ1ram819Vcpe7jCQh1LVX0syUGoMJKRHSu5eCM2xHTxpTLK
 BuDI1oXJVFHaMsl+t8ft6FhCOK6K6sKLZe30SwEZ/nGo6kqTKzLJjLV+s3rYZKzyrF3fEg
 rUAjYNNmGfB4RziFCYVI9GkXBRjRMMs=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-116-c_Maono4NOKXw6WnYxBh6A-1; Wed, 16 Nov 2022 13:29:39 -0500
X-MC-Unique: c_Maono4NOKXw6WnYxBh6A-1
Received: by mail-io1-f71.google.com with SMTP id
 f2-20020a5ec602000000b006dc67829888so9133344iok.3
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 10:29:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1dnsmoGhzDNbtszBCRTc+zNSPTgnUYayU9M22Zm8ToI=;
 b=sj4lwAr2LDsxROfjDzdyKNcztGxm+lelq8iHQHqMUvIA07CkTJYBIbh//XA6EvpyrZ
 7p1hgT0hFC/5F0yMRaTNKNj07C8uPpp429daZQSbTmBiaA2C+9qxPxtH0uRRI+jgMP4F
 R9GiFfWim4a12FbTRwe4JqQMzGU9bsyXhxmyXDfLLjYAqNXA0u7sFldLjtSK2wQqqfmU
 AV/eUvu+fuc8iCUcWo2+AuYzwPqqpQ11lKPo6ZvISjOjYwuQ2NRMQbv+rd17/NMEvRDg
 cqiMNGU4/R+V1Cm3nSvoAn6ifz5GKyW3Pn9EpbO5I3UrqgsGwRIS7t63+IOcBEf9iW1g
 MKQQ==
X-Gm-Message-State: ANoB5pmaL4PrldaIXwAZ6PJgAbhDny+RfxTG6qtmPZoVKjxlbSqHxN3Y
 kgSFUPNBJlXDaDDKMFK6FFKdNvhACxyhU42hR2w/xAns4DVRsSlc++dVHW5bofvir8m8bJIozvD
 x/DwiJU1GJDO4mwU=
X-Received: by 2002:a92:d247:0:b0:302:4981:64b with SMTP id
 v7-20020a92d247000000b003024981064bmr10116293ilg.200.1668623378669; 
 Wed, 16 Nov 2022 10:29:38 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6H3MBoEh5v9IZNyvmcsujMM3kg3dMHW6qNtZtOaLEvfgjph5/4qBu40B6RbEtrOV/fmu8Q4w==
X-Received: by 2002:a92:d247:0:b0:302:4981:64b with SMTP id
 v7-20020a92d247000000b003024981064bmr10116254ilg.200.1668623378161; 
 Wed, 16 Nov 2022 10:29:38 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 f42-20020a02242a000000b00375a885f908sm5843061jaa.36.2022.11.16.10.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 10:29:37 -0800 (PST)
Date: Wed, 16 Nov 2022 11:29:35 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, "Ilya Leoshkevich"
 <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, "Juan Quintela"
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>, Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, John Snow
 <jsnow@redhat.com>, <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>,
 Kunkun Jiang <jiangkunkun@huawei.com>, "Zhang, Chen"
 <chen.zhang@intel.com>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Shay Drory
 <shayd@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v3 12/17] vfio/migration: Implement VFIO migration
 protocol v2
Message-ID: <20221116112935.23118a30.alex.williamson@redhat.com>
In-Reply-To: <20221103161620.13120-13-avihaih@nvidia.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
 <20221103161620.13120-13-avihaih@nvidia.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 3 Nov 2022 18:16:15 +0200
Avihai Horon <avihaih@nvidia.com> wrote:

> Add implementation of VFIO migration protocol v2. The two protocols, v1
> and v2, will co-exist and in next patch v1 protocol will be removed.
> 
> There are several main differences between v1 and v2 protocols:
> - VFIO device state is now represented as a finite state machine instead
>   of a bitmap.
> 
> - Migration interface with kernel is now done using VFIO_DEVICE_FEATURE
>   ioctl and normal read() and write() instead of the migration region.
> 
> - VFIO migration protocol v2 currently doesn't support the pre-copy
>   phase of migration.
> 
> Detailed information about VFIO migration protocol v2 and difference
> compared to v1 can be found here [1].
> 
> [1]
> https://lore.kernel.org/all/20220224142024.147653-10-yishaih@nvidia.com/
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> ---
>  hw/vfio/common.c              |  19 +-
>  hw/vfio/migration.c           | 386 ++++++++++++++++++++++++++++++----
>  hw/vfio/trace-events          |   4 +
>  include/hw/vfio/vfio-common.h |   5 +
>  4 files changed, 375 insertions(+), 39 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 617e6cd901..0bdbd1586b 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -355,10 +355,18 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
>                  return false;
>              }
>  
> -            if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
> +            if (!migration->v2 &&
> +                (vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
>                  (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING)) {
>                  return false;
>              }
> +
> +            if (migration->v2 &&
> +                (vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
> +                (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
> +                 migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P)) {
> +                return false;
> +            }
>          }
>      }
>      return true;
> @@ -385,7 +393,14 @@ static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
>                  return false;
>              }
>  
> -            if (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING) {
> +            if (!migration->v2 &&
> +                migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING) {
> +                continue;
> +            }
> +
> +            if (migration->v2 &&
> +                (migration->device_state == VFIO_DEVICE_STATE_RUNNING ||
> +                 migration->device_state == VFIO_DEVICE_STATE_RUNNING_P2P)) {
>                  continue;
>              } else {
>                  return false;
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index e784374453..62afc23a8c 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -44,8 +44,84 @@
>  #define VFIO_MIG_FLAG_DEV_SETUP_STATE   (0xffffffffef100003ULL)
>  #define VFIO_MIG_FLAG_DEV_DATA_STATE    (0xffffffffef100004ULL)
>  
> +#define VFIO_MIG_DATA_BUFFER_SIZE (1024 * 1024)

Add comment explaining heuristic of this size.

> +
>  static int64_t bytes_transferred;
>  
> +static const char *mig_state_to_str(enum vfio_device_mig_state state)
> +{
> +    switch (state) {
> +    case VFIO_DEVICE_STATE_ERROR:
> +        return "ERROR";
> +    case VFIO_DEVICE_STATE_STOP:
> +        return "STOP";
> +    case VFIO_DEVICE_STATE_RUNNING:
> +        return "RUNNING";
> +    case VFIO_DEVICE_STATE_STOP_COPY:
> +        return "STOP_COPY";
> +    case VFIO_DEVICE_STATE_RESUMING:
> +        return "RESUMING";
> +    case VFIO_DEVICE_STATE_RUNNING_P2P:
> +        return "RUNNING_P2P";
> +    default:
> +        return "UNKNOWN STATE";
> +    }
> +}
> +
> +static int vfio_migration_set_state(VFIODevice *vbasedev,
> +                                    enum vfio_device_mig_state new_state,
> +                                    enum vfio_device_mig_state recover_state)
> +{
> +    VFIOMigration *migration = vbasedev->migration;
> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
> +                              sizeof(struct vfio_device_feature_mig_state),
> +                              sizeof(uint64_t))] = {};
> +    struct vfio_device_feature *feature = (void *)buf;
> +    struct vfio_device_feature_mig_state *mig_state = (void *)feature->data;

We can cast to the actual types rather than void* here.

> +
> +    feature->argsz = sizeof(buf);
> +    feature->flags =
> +        VFIO_DEVICE_FEATURE_SET | VFIO_DEVICE_FEATURE_MIG_DEVICE_STATE;
> +    mig_state->device_state = new_state;
> +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
> +        /* Try to set the device in some good state */
> +        error_report(
> +            "%s: Failed setting device state to %s, err: %s. Setting device in recover state %s",
> +                     vbasedev->name, mig_state_to_str(new_state),
> +                     strerror(errno), mig_state_to_str(recover_state));
> +
> +        mig_state->device_state = recover_state;
> +        if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
> +            hw_error("%s: Failed setting device in recover state, err: %s",
> +                     vbasedev->name, strerror(errno));
> +        }
> +
> +        migration->device_state = recover_state;
> +
> +        return -1;

We could preserve -errno to return here.

> +    }
> +
> +    if (mig_state->data_fd != -1) {
> +        if (migration->data_fd != -1) {
> +            /*
> +             * This can happen if the device is asynchronously reset and
> +             * terminates a data transfer.
> +             */
> +            error_report("%s: data_fd out of sync", vbasedev->name);
> +            close(mig_state->data_fd);
> +
> +            return -1;

Should we go to recover_state here?  Is migration->device_state
invalid?  -EBADF?

> +        }
> +
> +        migration->data_fd = mig_state->data_fd;
> +    }
> +    migration->device_state = new_state;
> +
> +    trace_vfio_migration_set_state(vbasedev->name, mig_state_to_str(new_state));
> +
> +    return 0;
> +}
> +
>  static inline int vfio_mig_access(VFIODevice *vbasedev, void *val, int count,
>                                    off_t off, bool iswrite)
>  {
> @@ -260,6 +336,20 @@ static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
>      return ret;
>  }
>  
> +static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
> +                            uint64_t data_size)
> +{
> +    VFIOMigration *migration = vbasedev->migration;
> +    int ret;
> +
> +    ret = qemu_file_get_to_fd(f, migration->data_fd, data_size);
> +    if (!ret) {
> +        trace_vfio_load_state_device_data(vbasedev->name, data_size);
> +    }
> +
> +    return ret;
> +}
> +
>  static int vfio_v1_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
>                                 uint64_t data_size)
>  {
> @@ -394,6 +484,14 @@ static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
>      return qemu_file_get_error(f);
>  }
>  
> +static void vfio_migration_cleanup(VFIODevice *vbasedev)
> +{
> +    VFIOMigration *migration = vbasedev->migration;
> +
> +    close(migration->data_fd);
> +    migration->data_fd = -1;
> +}
> +
>  static void vfio_migration_v1_cleanup(VFIODevice *vbasedev)
>  {
>      VFIOMigration *migration = vbasedev->migration;
> @@ -405,6 +503,18 @@ static void vfio_migration_v1_cleanup(VFIODevice *vbasedev)
>  
>  /* ---------------------------------------------------------------------- */
>  
> +static int vfio_save_setup(QEMUFile *f, void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +
> +    trace_vfio_save_setup(vbasedev->name);
> +
> +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
> +
> +    return qemu_file_get_error(f);
> +}
> +
>  static int vfio_v1_save_setup(QEMUFile *f, void *opaque)
>  {
>      VFIODevice *vbasedev = opaque;
> @@ -448,6 +558,14 @@ static int vfio_v1_save_setup(QEMUFile *f, void *opaque)
>      return 0;
>  }
>  
> +static void vfio_save_cleanup(void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +
> +    vfio_migration_cleanup(vbasedev);
> +    trace_vfio_save_cleanup(vbasedev->name);
> +}
> +
>  static void vfio_v1_save_cleanup(void *opaque)
>  {
>      VFIODevice *vbasedev = opaque;
> @@ -456,6 +574,23 @@ static void vfio_v1_save_cleanup(void *opaque)
>      trace_vfio_save_cleanup(vbasedev->name);
>  }
>  
> +#define VFIO_MIG_PENDING_SIZE (512 * 1024 * 1024)

There's a comment below, but that gets deleted in a later patch while
we still use this as a fallback size.  Some explanation of how this
size is derived would be useful.  Is this an estimate for mlx5?  It
seems muchtoo small for a GPU.  For a fallback, should we set something
here so large that we don't risk failing any SLA, ex. 100G?

> +static void vfio_save_pending(void *opaque, uint64_t threshold_size,
> +                              uint64_t *res_precopy, uint64_t *res_postcopy)
> +{
> +    VFIODevice *vbasedev = opaque;
> +
> +    /*
> +     * VFIO migration protocol v2 currently doesn't have an API to get pending
> +     * device state size. Until such API is introduced, report some big
> +     * arbitrary pending size so the device will be taken into account for
> +     * downtime limit calculations.
> +     */
> +    *res_postcopy += VFIO_MIG_PENDING_SIZE;
> +
> +    trace_vfio_save_pending(vbasedev->name, *res_precopy, *res_postcopy);
> +}
> +
>  static void vfio_v1_save_pending(void *opaque, uint64_t threshold_size,
>                                   uint64_t *res_precopy, uint64_t *res_postcopy)
>  {
> @@ -520,6 +655,67 @@ static int vfio_save_iterate(QEMUFile *f, void *opaque)
>      return 0;
>  }
>  
> +/* Returns 1 if end-of-stream is reached, 0 if more data and -1 if error */
> +static int vfio_save_block(QEMUFile *f, VFIOMigration *migration)
> +{
> +    ssize_t data_size;
> +
> +    data_size = read(migration->data_fd, migration->data_buffer,
> +                     migration->data_buffer_size);
> +    if (data_size < 0) {
> +        return -1;

Appears this could return -errno, granted it'll get swallowed in
qemu_savevm_state_complete_precopy_iterable(), but it seems a bit
cleaner here.

> +    }
> +    if (data_size == 0) {
> +        return 1;
> +    }
> +
> +    qemu_put_be64(f, VFIO_MIG_FLAG_DEV_DATA_STATE);
> +    qemu_put_be64(f, data_size);
> +    qemu_put_buffer(f, migration->data_buffer, data_size);
> +    bytes_transferred += data_size;
> +
> +    trace_vfio_save_block(migration->vbasedev->name, data_size);
> +
> +    return qemu_file_get_error(f);
> +}
> +
> +static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +    enum vfio_device_mig_state recover_state;
> +    int ret;
> +
> +    /* We reach here with device state STOP only */
> +    recover_state = VFIO_DEVICE_STATE_STOP;
> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP_COPY,
> +                                   recover_state);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    do {
> +        ret = vfio_save_block(f, vbasedev->migration);
> +        if (ret < 0) {
> +            return ret;
> +        }
> +    } while (!ret);
> +
> +    qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
> +    ret = qemu_file_get_error(f);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    recover_state = VFIO_DEVICE_STATE_ERROR;
> +    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_STOP,
> +                                   recover_state);
> +    if (!ret) {
> +        trace_vfio_save_complete_precopy(vbasedev->name);
> +    }
> +
> +    return ret;
> +}
> +
>  static int vfio_v1_save_complete_precopy(QEMUFile *f, void *opaque)
>  {
>      VFIODevice *vbasedev = opaque;
> @@ -589,6 +785,14 @@ static void vfio_save_state(QEMUFile *f, void *opaque)
>      }
>  }
>  
> +static int vfio_load_setup(QEMUFile *f, void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +
> +    return vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RESUMING,
> +                                   vbasedev->migration->device_state);
> +}
> +
>  static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
>  {
>      VFIODevice *vbasedev = opaque;
> @@ -616,6 +820,16 @@ static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
>      return ret;
>  }
>  
> +static int vfio_load_cleanup(void *opaque)
> +{
> +    VFIODevice *vbasedev = opaque;
> +
> +    vfio_migration_cleanup(vbasedev);
> +    trace_vfio_load_cleanup(vbasedev->name);
> +
> +    return 0;
> +}
> +
>  static int vfio_v1_load_cleanup(void *opaque)
>  {
>      VFIODevice *vbasedev = opaque;
> @@ -658,7 +872,11 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>              uint64_t data_size = qemu_get_be64(f);
>  
>              if (data_size) {
> -                ret = vfio_v1_load_buffer(f, vbasedev, data_size);
> +                if (vbasedev->migration->v2) {
> +                    ret = vfio_load_buffer(f, vbasedev, data_size);
> +                } else {
> +                    ret = vfio_v1_load_buffer(f, vbasedev, data_size);
> +                }
>                  if (ret < 0) {
>                      return ret;
>                  }
> @@ -679,6 +897,17 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>      return ret;
>  }
>  
> +static const SaveVMHandlers savevm_vfio_handlers = {
> +    .save_setup = vfio_save_setup,
> +    .save_cleanup = vfio_save_cleanup,
> +    .save_live_pending = vfio_save_pending,
> +    .save_live_complete_precopy = vfio_save_complete_precopy,
> +    .save_state = vfio_save_state,
> +    .load_setup = vfio_load_setup,
> +    .load_cleanup = vfio_load_cleanup,
> +    .load_state = vfio_load_state,
> +};
> +
>  static SaveVMHandlers savevm_vfio_v1_handlers = {
>      .save_setup = vfio_v1_save_setup,
>      .save_cleanup = vfio_v1_save_cleanup,
> @@ -693,6 +922,34 @@ static SaveVMHandlers savevm_vfio_v1_handlers = {
>  
>  /* ---------------------------------------------------------------------- */
>  
> +static void vfio_vmstate_change(void *opaque, bool running, RunState state)
> +{
> +    VFIODevice *vbasedev = opaque;
> +    enum vfio_device_mig_state new_state;
> +    int ret;
> +
> +    if (running) {
> +        new_state = VFIO_DEVICE_STATE_RUNNING;
> +    } else {
> +        new_state = VFIO_DEVICE_STATE_STOP;
> +    }
> +
> +    ret = vfio_migration_set_state(vbasedev, new_state,
> +                                   VFIO_DEVICE_STATE_ERROR);
> +    if (ret) {
> +        /*
> +         * Migration should be aborted in this case, but vm_state_notify()
> +         * currently does not support reporting failures.
> +         */
> +        if (migrate_get_current()->to_dst_file) {
> +            qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
> +        }
> +    }
> +
> +    trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
> +                              mig_state_to_str(new_state));
> +}
> +
>  static void vfio_v1_vmstate_change(void *opaque, bool running, RunState state)
>  {
>      VFIODevice *vbasedev = opaque;
> @@ -766,12 +1023,17 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
>      case MIGRATION_STATUS_CANCELLED:
>      case MIGRATION_STATUS_FAILED:
>          bytes_transferred = 0;
> -        ret = vfio_migration_v1_set_state(vbasedev,
> -                                          ~(VFIO_DEVICE_STATE_V1_SAVING |
> -                                            VFIO_DEVICE_STATE_V1_RESUMING),
> -                                          VFIO_DEVICE_STATE_V1_RUNNING);
> -        if (ret) {
> -            error_report("%s: Failed to set state RUNNING", vbasedev->name);
> +        if (migration->v2) {
> +            vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_RUNNING,
> +                                     VFIO_DEVICE_STATE_ERROR);
> +        } else {
> +            ret = vfio_migration_v1_set_state(vbasedev,
> +                                              ~(VFIO_DEVICE_STATE_V1_SAVING |
> +                                                VFIO_DEVICE_STATE_V1_RESUMING),
> +                                              VFIO_DEVICE_STATE_V1_RUNNING);
> +            if (ret) {
> +                error_report("%s: Failed to set state RUNNING", vbasedev->name);
> +            }
>          }
>      }
>  }
> @@ -780,12 +1042,35 @@ static void vfio_migration_exit(VFIODevice *vbasedev)
>  {
>      VFIOMigration *migration = vbasedev->migration;
>  
> -    vfio_region_exit(&migration->region);
> -    vfio_region_finalize(&migration->region);
> +    if (migration->v2) {
> +        g_free(migration->data_buffer);
> +    } else {
> +        vfio_region_exit(&migration->region);
> +        vfio_region_finalize(&migration->region);
> +    }
>      g_free(vbasedev->migration);
>      vbasedev->migration = NULL;
>  }
>  
> +static int vfio_migration_query_flags(VFIODevice *vbasedev, uint64_t *mig_flags)
> +{
> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature) +
> +                                  sizeof(struct vfio_device_feature_migration),
> +                              sizeof(uint64_t))] = {};
> +    struct vfio_device_feature *feature = (void *)buf;
> +    struct vfio_device_feature_migration *mig = (void *)feature->data;
> +
> +    feature->argsz = sizeof(buf);
> +    feature->flags = VFIO_DEVICE_FEATURE_GET | VFIO_DEVICE_FEATURE_MIGRATION;
> +    if (ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature)) {
> +        return -EOPNOTSUPP;
> +    }
> +
> +    *mig_flags = mig->flags;
> +
> +    return 0;
> +}
> +
>  static int vfio_migration_init(VFIODevice *vbasedev)
>  {
>      int ret;
> @@ -794,6 +1079,7 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>      char id[256] = "";
>      g_autofree char *path = NULL, *oid = NULL;
>      struct vfio_region_info *info = NULL;
> +    uint64_t mig_flags;
>  
>      if (!vbasedev->ops->vfio_get_object) {
>          return -EINVAL;
> @@ -804,34 +1090,51 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>          return -EINVAL;
>      }
>  
> -    ret = vfio_get_dev_region_info(vbasedev,
> -                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
> -                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
> -                                   &info);
> -    if (ret) {
> -        return ret;
> -    }
> +    ret = vfio_migration_query_flags(vbasedev, &mig_flags);
> +    if (!ret) {
> +        /* Migration v2 */
> +        /* Basic migration functionality must be supported */
> +        if (!(mig_flags & VFIO_MIGRATION_STOP_COPY)) {
> +            return -EOPNOTSUPP;
> +        }
> +        vbasedev->migration = g_new0(VFIOMigration, 1);
> +        vbasedev->migration->device_state = VFIO_DEVICE_STATE_RUNNING;
> +        vbasedev->migration->data_buffer_size = VFIO_MIG_DATA_BUFFER_SIZE;
> +        vbasedev->migration->data_buffer =
> +            g_malloc0(vbasedev->migration->data_buffer_size);

So VFIO_MIG_DATA_BUFFER_SIZE is our chunk size, but why doesn't the
later addition of estimated device data size make any changes here?
I'd think we'd want to scale the buffer to the minimum of the reported
data size and some well documented heuristic for an upper bound.

> +        vbasedev->migration->data_fd = -1;
> +        vbasedev->migration->v2 = true;
> +    } else {
> +        /* Migration v1 */
> +        ret = vfio_get_dev_region_info(vbasedev,
> +                                       VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
> +                                       VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
> +                                       &info);
> +        if (ret) {
> +            return ret;
> +        }
>  
> -    vbasedev->migration = g_new0(VFIOMigration, 1);
> -    vbasedev->migration->device_state_v1 = VFIO_DEVICE_STATE_V1_RUNNING;
> -    vbasedev->migration->vm_running = runstate_is_running();
> +        vbasedev->migration = g_new0(VFIOMigration, 1);
> +        vbasedev->migration->device_state_v1 = VFIO_DEVICE_STATE_V1_RUNNING;
> +        vbasedev->migration->vm_running = runstate_is_running();
>  
> -    ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
> -                            info->index, "migration");
> -    if (ret) {
> -        error_report("%s: Failed to setup VFIO migration region %d: %s",
> -                     vbasedev->name, info->index, strerror(-ret));
> -        goto err;
> -    }
> +        ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
> +                                info->index, "migration");
> +        if (ret) {
> +            error_report("%s: Failed to setup VFIO migration region %d: %s",
> +                         vbasedev->name, info->index, strerror(-ret));
> +            goto err;
> +        }
>  
> -    if (!vbasedev->migration->region.size) {
> -        error_report("%s: Invalid zero-sized VFIO migration region %d",
> -                     vbasedev->name, info->index);
> -        ret = -EINVAL;
> -        goto err;
> -    }
> +        if (!vbasedev->migration->region.size) {
> +            error_report("%s: Invalid zero-sized VFIO migration region %d",
> +                         vbasedev->name, info->index);
> +            ret = -EINVAL;
> +            goto err;
> +        }
>  
> -    g_free(info);
> +        g_free(info);


It would probably make sense to scope info within this branch, but it
goes away in the next patch anyway, so this is fine.  Thanks,

Alex

> +    }
>  
>      migration = vbasedev->migration;
>      migration->vbasedev = vbasedev;
> @@ -844,11 +1147,20 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>      }
>      strpadcpy(id, sizeof(id), path, '\0');
>  
> -    register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
> -                         &savevm_vfio_v1_handlers, vbasedev);
> +    if (migration->v2) {
> +        register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
> +                             &savevm_vfio_handlers, vbasedev);
> +
> +        migration->vm_state = qdev_add_vm_change_state_handler(
> +            vbasedev->dev, vfio_vmstate_change, vbasedev);
> +    } else {
> +        register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
> +                             &savevm_vfio_v1_handlers, vbasedev);
> +
> +        migration->vm_state = qdev_add_vm_change_state_handler(
> +            vbasedev->dev, vfio_v1_vmstate_change, vbasedev);
> +    }
>  
> -    migration->vm_state = qdev_add_vm_change_state_handler(
> -        vbasedev->dev, vfio_v1_vmstate_change, vbasedev);
>      migration->migration_state.notify = vfio_migration_state_notifier;
>      add_migration_state_change_notifier(&migration->migration_state);
>      return 0;
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index d88d2b4053..9ef84e24b2 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -149,7 +149,9 @@ vfio_display_edid_write_error(void) ""
>  
>  # migration.c
>  vfio_migration_probe(const char *name) " (%s)"
> +vfio_migration_set_state(const char *name, const char *state) " (%s) state %s"
>  vfio_migration_v1_set_state(const char *name, uint32_t state) " (%s) state %d"
> +vfio_vmstate_change(const char *name, int running, const char *reason, const char *dev_state) " (%s) running %d reason %s device state %s"
>  vfio_v1_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
>  vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"
>  vfio_save_setup(const char *name) " (%s)"
> @@ -163,6 +165,8 @@ vfio_save_complete_precopy(const char *name) " (%s)"
>  vfio_load_device_config_state(const char *name) " (%s)"
>  vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
>  vfio_v1_load_state_device_data(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
> +vfio_load_state_device_data(const char *name, uint64_t data_size) " (%s) size 0x%"PRIx64
>  vfio_load_cleanup(const char *name) " (%s)"
>  vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
>  vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
> +vfio_save_block(const char *name, int data_size) " (%s) data_size %d"
> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
> index bbaf72ba00..2ec3346fea 100644
> --- a/include/hw/vfio/vfio-common.h
> +++ b/include/hw/vfio/vfio-common.h
> @@ -66,6 +66,11 @@ typedef struct VFIOMigration {
>      int vm_running;
>      Notifier migration_state;
>      uint64_t pending_bytes;
> +    enum vfio_device_mig_state device_state;
> +    int data_fd;
> +    void *data_buffer;
> +    size_t data_buffer_size;
> +    bool v2;
>  } VFIOMigration;
>  
>  typedef struct VFIOAddressSpace {


