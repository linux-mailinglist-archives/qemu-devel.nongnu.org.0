Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 617F04CFD54
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:47:11 +0100 (CET)
Received: from localhost ([::1]:36960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBpW-0005r6-DO
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:47:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRBW0-0006Zy-9r
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:27:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRBVv-0007ov-0n
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:26:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646652403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i5eKSsUgdystLLm6hSMv+Y6+nVLeRK9CHwmIh9Sif9E=;
 b=M6zFbyVKcxzpyYXRt/b4aYGscl+8lVmAbx05vUQvvdtehOOwqGD4Hqp8l1CktjtEser3OK
 bID2glWnvMJXnZq6ohThpI0RH5eLpwExL5Pby4wAAtCQZQdKgoIYBoMTBNPXvlzddCLpG/
 YolfHfVqKH0iS4Yyz0Be955wjhZvrY0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-9VsCVBIhMkOoi6epOoDIjQ-1; Mon, 07 Mar 2022 06:26:40 -0500
X-MC-Unique: 9VsCVBIhMkOoi6epOoDIjQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 528AA1091DA0;
 Mon,  7 Mar 2022 11:26:38 +0000 (UTC)
Received: from localhost (unknown [10.39.193.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C5D578874;
 Mon,  7 Mar 2022 11:26:20 +0000 (UTC)
Date: Mon, 7 Mar 2022 11:26:19 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v6 17/19] vfio-user: register handlers to facilitate
 migration
Message-ID: <YiXr23ffiLrIDMQw@stefanha-x1.localdomain>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <2f2921668f8b3d05bb1ce1dcc10e90e61cd20405.1645079934.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KwmPQQewKxkzU0O4"
Content-Disposition: inline
In-Reply-To: <2f2921668f8b3d05bb1ce1dcc10e90e61cd20405.1645079934.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--KwmPQQewKxkzU0O4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 02:49:04AM -0500, Jagannathan Raman wrote:
> Store and load the device's state during migration. use libvfio-user's
> handlers for this purpose
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  include/block/block.h       |   1 +
>  include/migration/vmstate.h |   2 +
>  migration/savevm.h          |   2 +
>  block.c                     |   5 +
>  hw/remote/machine.c         |   7 +
>  hw/remote/vfio-user-obj.c   | 467 ++++++++++++++++++++++++++++++++++++
>  migration/savevm.c          |  89 +++++++
>  migration/vmstate.c         |  19 ++
>  8 files changed, 592 insertions(+)
>=20
> diff --git a/include/block/block.h b/include/block/block.h
> index e1713ee306..02b89e0668 100644
> --- a/include/block/block.h
> +++ b/include/block/block.h
> @@ -495,6 +495,7 @@ int generated_co_wrapper bdrv_invalidate_cache(BlockD=
riverState *bs,
>                                                 Error **errp);
>  void bdrv_invalidate_cache_all(Error **errp);
>  int bdrv_inactivate_all(void);
> +int bdrv_inactivate(BlockDriverState *bs);
> =20
>  /* Ensure contents are flushed to disk.  */
>  int generated_co_wrapper bdrv_flush(BlockDriverState *bs);
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index 017c03675c..68bea576ea 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -1165,6 +1165,8 @@ extern const VMStateInfo vmstate_info_qlist;
>  #define VMSTATE_END_OF_LIST()                                         \
>      {}
> =20
> +uint64_t vmstate_vmsd_size(PCIDevice *pci_dev);
> +
>  int vmstate_load_state(QEMUFile *f, const VMStateDescription *vmsd,
>                         void *opaque, int version_id);
>  int vmstate_save_state(QEMUFile *f, const VMStateDescription *vmsd,
> diff --git a/migration/savevm.h b/migration/savevm.h
> index 6461342cb4..8007064ff2 100644
> --- a/migration/savevm.h
> +++ b/migration/savevm.h
> @@ -67,5 +67,7 @@ int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomi=
ngState *mis);
>  int qemu_load_device_state(QEMUFile *f);
>  int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>          bool in_postcopy, bool inactivate_disks);
> +int qemu_remote_savevm(QEMUFile *f, DeviceState *dev);
> +int qemu_remote_loadvm(QEMUFile *f);
> =20
>  #endif
> diff --git a/block.c b/block.c
> index b54d59d1fa..e90aaee30c 100644
> --- a/block.c
> +++ b/block.c
> @@ -6565,6 +6565,11 @@ static int bdrv_inactivate_recurse(BlockDriverStat=
e *bs)
>      return 0;
>  }
> =20
> +int bdrv_inactivate(BlockDriverState *bs)
> +{
> +    return bdrv_inactivate_recurse(bs);
> +}
> +
>  int bdrv_inactivate_all(void)
>  {
>      BlockDriverState *bs =3D NULL;
> diff --git a/hw/remote/machine.c b/hw/remote/machine.c
> index a8b4a3aef3..31ef401e43 100644
> --- a/hw/remote/machine.c
> +++ b/hw/remote/machine.c
> @@ -24,6 +24,7 @@
>  #include "hw/qdev-core.h"
>  #include "hw/remote/iommu.h"
>  #include "hw/remote/vfio-user-obj.h"
> +#include "sysemu/sysemu.h"
> =20
>  static void remote_machine_init(MachineState *machine)
>  {
> @@ -86,6 +87,11 @@ static void remote_machine_set_vfio_user(Object *obj, =
bool value, Error **errp)
>      s->vfio_user =3D value;
>  }
> =20
> +static void remote_machine_instance_init(Object *obj)
> +{
> +    set_deferred_backend_init();
> +}
> +
>  static void remote_machine_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc =3D MACHINE_CLASS(oc);
> @@ -105,6 +111,7 @@ static const TypeInfo remote_machine =3D {
>      .name =3D TYPE_REMOTE_MACHINE,
>      .parent =3D TYPE_MACHINE,
>      .instance_size =3D sizeof(RemoteMachineState),
> +    .instance_init =3D remote_machine_instance_init,
>      .class_init =3D remote_machine_class_init,
>      .interfaces =3D (InterfaceInfo[]) {
>          { TYPE_HOTPLUG_HANDLER },
> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
> index d79bab87f1..2304643003 100644
> --- a/hw/remote/vfio-user-obj.c
> +++ b/hw/remote/vfio-user-obj.c
> @@ -57,6 +57,13 @@
>  #include "hw/pci/msi.h"
>  #include "hw/pci/msix.h"
>  #include "hw/remote/vfio-user-obj.h"
> +#include "migration/qemu-file.h"
> +#include "migration/savevm.h"
> +#include "migration/vmstate.h"
> +#include "migration/global_state.h"
> +#include "block/block.h"
> +#include "sysemu/block-backend.h"
> +#include "net/net.h"
> =20
>  #define TYPE_VFU_OBJECT "x-vfio-user-server"
>  OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
> @@ -108,12 +115,49 @@ struct VfuObject {
>      Error *unplug_blocker;
> =20
>      int vfu_poll_fd;
> +
> +    /*
> +     * vfu_mig_buf holds the migration data. In the remote server, this
> +     * buffer replaces the role of an IO channel which links the source
> +     * and the destination.
> +     *
> +     * Whenever the client QEMU process initiates migration, the remote
> +     * server gets notified via libvfio-user callbacks. The remote server
> +     * sets up a QEMUFile object using this buffer as backend. The remote
> +     * server passes this object to its migration subsystem, which slurps
> +     * the VMSD of the device ('devid' above) referenced by this object
> +     * and stores the VMSD in this buffer.
> +     *
> +     * The client subsequetly asks the remote server for any data that
> +     * needs to be moved over to the destination via libvfio-user
> +     * library's vfu_migration_callbacks_t callbacks. The remote hands
> +     * over this buffer as data at this time.
> +     *
> +     * A reverse of this process happens at the destination.
> +     */
> +    uint8_t *vfu_mig_buf;
> +
> +    uint64_t vfu_mig_buf_size;
> +
> +    uint64_t vfu_mig_buf_pending;
> +
> +    uint64_t vfu_mig_data_written;
> +
> +    uint64_t vfu_mig_section_offset;
> +
> +    QEMUFile *vfu_mig_file;
> +
> +    vfu_migr_state_t vfu_state;
>  };
> =20
>  static GHashTable *vfu_object_bdf_to_ctx_table;
> =20
>  #define INT2VOIDP(i) (void *)(uintptr_t)(i)
> =20
> +#define KB(x)    ((size_t) (x) << 10)
> +
> +#define VFU_OBJECT_MIG_WINDOW KB(64)

Please use "qemu/units.h":

  #include "qemu/units.h"
  ...
  #define VFU_OBJECT_MIG_WINDOW_SIZE (64 * KiB)

(Adding "_SIZE" to the name makes the purpose of the constant clearer.)

> +
>  static void vfu_object_init_ctx(VfuObject *o, Error **errp);
> =20
>  static void vfu_object_set_socket(Object *obj, Visitor *v, const char *n=
ame,
> @@ -163,6 +207,394 @@ static void vfu_object_set_device(Object *obj, cons=
t char *str, Error **errp)
>      vfu_object_init_ctx(o, errp);
>  }
> =20
> +/**
> + * Migration helper functions
> + *
> + * vfu_mig_buf_read & vfu_mig_buf_write are used by QEMU's migration
> + * subsystem - qemu_remote_loadvm & qemu_remote_savevm. loadvm/savevm
> + * call these functions via QEMUFileOps to load/save the VMSD of a
> + * device into vfu_mig_buf
> + *
> + */
> +static ssize_t vfu_mig_buf_read(void *opaque, uint8_t *buf, int64_t pos,
> +                                size_t size, Error **errp)
> +{
> +    VfuObject *o =3D opaque;
> +
> +    if (pos > o->vfu_mig_buf_size) {
> +        size =3D 0;
> +    } else if ((pos + size) > o->vfu_mig_buf_size) {
> +        size =3D o->vfu_mig_buf_size - pos;
> +    }
> +
> +    memcpy(buf, (o->vfu_mig_buf + pos), size);
> +
> +    return size;
> +}
> +
> +static ssize_t vfu_mig_buf_write(void *opaque, struct iovec *iov, int io=
vcnt,
> +                                 int64_t pos, Error **errp)
> +{
> +    ERRP_GUARD();
> +    VfuObject *o =3D opaque;
> +    uint64_t end =3D pos + iov_size(iov, iovcnt);
> +    int i;
> +
> +    if (o->vfu_mig_buf_pending) {
> +        error_setg(errp, "Migration is ongoing");
> +        return 0;
> +    }
> +
> +    if (end > o->vfu_mig_buf_size) {
> +        o->vfu_mig_buf =3D g_realloc(o->vfu_mig_buf, end);
> +    }
> +
> +    for (i =3D 0; i < iovcnt; i++) {
> +        memcpy((o->vfu_mig_buf + o->vfu_mig_buf_size), iov[i].iov_base,
> +               iov[i].iov_len);
> +        o->vfu_mig_buf_size +=3D iov[i].iov_len;
> +    }
> +
> +    return iov_size(iov, iovcnt);
> +}
> +
> +static int vfu_mig_buf_shutdown(void *opaque, bool rd, bool wr, Error **=
errp)
> +{
> +    VfuObject *o =3D opaque;
> +
> +    o->vfu_mig_buf_size =3D 0;
> +
> +    g_free(o->vfu_mig_buf);
> +
> +    o->vfu_mig_buf =3D NULL;
> +
> +    o->vfu_mig_buf_pending =3D 0;
> +
> +    o->vfu_mig_data_written =3D 0;
> +
> +    o->vfu_mig_section_offset =3D 0;
> +
> +    return 0;
> +}
> +
> +static const QEMUFileOps vfu_mig_fops_save =3D {
> +    .writev_buffer  =3D vfu_mig_buf_write,
> +    .shut_down      =3D vfu_mig_buf_shutdown,
> +};
> +
> +static const QEMUFileOps vfu_mig_fops_load =3D {
> +    .get_buffer     =3D vfu_mig_buf_read,
> +    .shut_down      =3D vfu_mig_buf_shutdown,
> +};
> +
> +static BlockDriverState *vfu_object_find_bs_by_dev(DeviceState *dev)
> +{
> +    BlockBackend *blk =3D blk_by_dev(dev);
> +
> +    if (!blk) {
> +        return NULL;
> +    }
> +
> +    return blk_bs(blk);
> +}
> +
> +static int vfu_object_bdrv_invalidate_cache_by_dev(DeviceState *dev)
> +{
> +    BlockDriverState *bs =3D NULL;
> +    Error *local_err =3D NULL;
> +
> +    bs =3D vfu_object_find_bs_by_dev(dev);
> +    if (!bs) {
> +        return 0;
> +    }
> +
> +    bdrv_invalidate_cache(bs, &local_err);
> +    if (local_err) {
> +        error_report_err(local_err);
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
> +static int vfu_object_bdrv_inactivate_by_dev(DeviceState *dev)
> +{
> +    BlockDriverState *bs =3D NULL;
> +
> +    bs =3D vfu_object_find_bs_by_dev(dev);
> +    if (!bs) {
> +        return 0;
> +    }
> +
> +    return bdrv_inactivate(bs);
> +}
> +
> +static void vfu_object_start_stop_netdev(DeviceState *dev, bool start)
> +{
> +    NetClientState *nc =3D NULL;
> +    Error *local_err =3D NULL;
> +    char *netdev =3D NULL;
> +
> +    netdev =3D object_property_get_str(OBJECT(dev), "netdev", &local_err=
);
> +    if (local_err) {
> +        /**
> +         * object_property_get_str() sets Error if netdev property is
> +         * not found, not necessarily an error in the context of
> +         * this function
> +         */
> +        error_free(local_err);
> +        return;
> +    }
> +
> +    if (!netdev) {
> +        return;
> +    }
> +
> +    nc =3D qemu_find_netdev(netdev);
> +
> +    if (!nc) {
> +        return;
> +    }
> +
> +    if (!start) {
> +        qemu_flush_or_purge_queued_packets(nc, true);
> +
> +        if (nc->info && nc->info->cleanup) {
> +            nc->info->cleanup(nc);
> +        }

I'm not sure if this is correct. Do we actually want to clean up the
NetClient (e.g. close the tap file descriptor)? If yes, why isn't the
NetClient removed from the net_clients tailq?

> +    } else if (nc->peer) {
> +        qemu_flush_or_purge_queued_packets(nc->peer, false);
> +    }
> +}
> +
> +static int vfu_object_start_devs(DeviceState *dev, void *opaque)
> +{
> +    int ret =3D vfu_object_bdrv_invalidate_cache_by_dev(dev);
> +
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    vfu_object_start_stop_netdev(dev, true);
> +
> +    return ret;
> +}
> +
> +static int vfu_object_stop_devs(DeviceState *dev, void *opaque)
> +{
> +    int ret =3D vfu_object_bdrv_inactivate_by_dev(dev);
> +
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    vfu_object_start_stop_netdev(dev, false);
> +
> +    return ret;
> +}
> +
> +/**
> + * handlers for vfu_migration_callbacks_t
> + *
> + * The libvfio-user library accesses these handlers to drive the migrati=
on
> + * at the remote end, and also to transport the data stored in vfu_mig_b=
uf
> + *
> + */
> +static void vfu_mig_state_stop_and_copy(vfu_ctx_t *vfu_ctx)
> +{
> +    VfuObject *o =3D vfu_get_private(vfu_ctx);
> +    int ret;
> +
> +    if (!o->vfu_mig_file) {
> +        o->vfu_mig_file =3D qemu_fopen_ops(o, &vfu_mig_fops_save, false);
> +    }
> +
> +    ret =3D qemu_remote_savevm(o->vfu_mig_file, DEVICE(o->pci_dev));
> +    if (ret) {
> +        qemu_file_shutdown(o->vfu_mig_file);
> +        o->vfu_mig_file =3D NULL;
> +        return;
> +    }
> +
> +    qemu_fflush(o->vfu_mig_file);
> +}
> +
> +static void vfu_mig_state_running(vfu_ctx_t *vfu_ctx)
> +{
> +    VfuObject *o =3D vfu_get_private(vfu_ctx);
> +    int ret;
> +
> +    if (o->vfu_state !=3D VFU_MIGR_STATE_RESUME) {
> +        goto run_ctx;
> +    }
> +
> +    if (!o->vfu_mig_file) {
> +        o->vfu_mig_file =3D qemu_fopen_ops(o, &vfu_mig_fops_load, false);
> +    }
> +
> +    ret =3D qemu_remote_loadvm(o->vfu_mig_file);
> +    if (ret) {
> +        VFU_OBJECT_ERROR(o, "vfu: failed to restore device state");
> +        return;
> +    }
> +
> +    qemu_file_shutdown(o->vfu_mig_file);
> +    o->vfu_mig_file =3D NULL;
> +
> +run_ctx:
> +    ret =3D qdev_walk_children(DEVICE(o->pci_dev), NULL, NULL,
> +                             vfu_object_start_devs,
> +                             NULL, NULL);
> +    if (ret) {
> +        VFU_OBJECT_ERROR(o, "vfu: failed to setup backends for %s",
> +                         o->device);
> +        return;
> +    }
> +}
> +
> +static void vfu_mig_state_stop(vfu_ctx_t *vfu_ctx)
> +{
> +    VfuObject *o =3D vfu_get_private(vfu_ctx);
> +    int ret;
> +
> +    ret =3D qdev_walk_children(DEVICE(o->pci_dev), NULL, NULL,
> +                             vfu_object_stop_devs,
> +                             NULL, NULL);
> +    if (ret) {
> +        VFU_OBJECT_ERROR(o, "vfu: failed to inactivate backends for %s",
> +                         o->device);
> +    }
> +}
> +
> +static int vfu_mig_transition(vfu_ctx_t *vfu_ctx, vfu_migr_state_t state)
> +{
> +    VfuObject *o =3D vfu_get_private(vfu_ctx);
> +
> +    if (o->vfu_state =3D=3D state) {
> +        return 0;
> +    }
> +
> +    switch (state) {
> +    case VFU_MIGR_STATE_RESUME:
> +        break;
> +    case VFU_MIGR_STATE_STOP_AND_COPY:
> +        vfu_mig_state_stop_and_copy(vfu_ctx);
> +        break;
> +    case VFU_MIGR_STATE_STOP:
> +        vfu_mig_state_stop(vfu_ctx);
> +        break;
> +    case VFU_MIGR_STATE_PRE_COPY:
> +        break;
> +    case VFU_MIGR_STATE_RUNNING:
> +        vfu_mig_state_running(vfu_ctx);
> +        break;
> +    default:
> +        warn_report("vfu: Unknown migration state %d", state);
> +    }
> +
> +    o->vfu_state =3D state;
> +
> +    return 0;
> +}
> +
> +static uint64_t vfu_mig_get_pending_bytes(vfu_ctx_t *vfu_ctx)
> +{
> +    VfuObject *o =3D vfu_get_private(vfu_ctx);
> +    static bool mig_ongoing;
> +
> +    if (!mig_ongoing && !o->vfu_mig_buf_pending) {
> +        o->vfu_mig_buf_pending =3D o->vfu_mig_buf_size;
> +        mig_ongoing =3D true;
> +    }
> +
> +    if (mig_ongoing && !o->vfu_mig_buf_pending) {
> +        mig_ongoing =3D false;
> +    }
> +
> +    return o->vfu_mig_buf_pending;
> +}
> +
> +static int vfu_mig_prepare_data(vfu_ctx_t *vfu_ctx, uint64_t *offset,
> +                                uint64_t *size)
> +{
> +    VfuObject *o =3D vfu_get_private(vfu_ctx);
> +    uint64_t data_size =3D o->vfu_mig_buf_pending;
> +
> +    if (data_size > VFU_OBJECT_MIG_WINDOW) {
> +        data_size =3D VFU_OBJECT_MIG_WINDOW;
> +    }
> +
> +    o->vfu_mig_section_offset =3D o->vfu_mig_buf_size - o->vfu_mig_buf_p=
ending;
> +
> +    o->vfu_mig_buf_pending -=3D data_size;
> +
> +    if (offset) {
> +        *offset =3D 0;
> +    }
> +
> +    if (size) {
> +        *size =3D data_size;
> +    }
> +
> +    return 0;
> +}
> +
> +static ssize_t vfu_mig_read_data(vfu_ctx_t *vfu_ctx, void *buf,
> +                                 uint64_t size, uint64_t offset)
> +{
> +    VfuObject *o =3D vfu_get_private(vfu_ctx);
> +    uint64_t read_offset =3D o->vfu_mig_section_offset + offset;
> +
> +    if (read_offset > o->vfu_mig_buf_size) {
> +        warn_report("vfu: buffer overflow - offset outside range");
> +        return -1;
> +    }
> +
> +    if ((read_offset + size) > o->vfu_mig_buf_size) {
> +        warn_report("vfu: buffer overflow - size outside range");
> +        size =3D o->vfu_mig_buf_size - read_offset;
> +    }
> +
> +    memcpy(buf, (o->vfu_mig_buf + read_offset), size);
> +
> +    return size;
> +}
> +
> +static ssize_t vfu_mig_write_data(vfu_ctx_t *vfu_ctx, void *data,
> +                                  uint64_t size, uint64_t offset)
> +{
> +    VfuObject *o =3D vfu_get_private(vfu_ctx);
> +    uint64_t end =3D o->vfu_mig_data_written + offset + size;
> +
> +    if (end > o->vfu_mig_buf_size) {
> +        o->vfu_mig_buf =3D g_realloc(o->vfu_mig_buf, end);
> +        o->vfu_mig_buf_size =3D end;
> +    }
> +
> +    memcpy((o->vfu_mig_buf + o->vfu_mig_data_written + offset), data, si=
ze);
> +
> +    return size;
> +}
> +
> +static int vfu_mig_data_written(vfu_ctx_t *vfu_ctx, uint64_t count)
> +{
> +    VfuObject *o =3D vfu_get_private(vfu_ctx);
> +
> +    o->vfu_mig_data_written +=3D count;
> +
> +    return 0;
> +}
> +
> +static const vfu_migration_callbacks_t vfu_mig_cbs =3D {
> +    .version =3D VFU_MIGR_CALLBACKS_VERS,
> +    .transition =3D &vfu_mig_transition,
> +    .get_pending_bytes =3D &vfu_mig_get_pending_bytes,
> +    .prepare_data =3D &vfu_mig_prepare_data,
> +    .read_data =3D &vfu_mig_read_data,
> +    .data_written =3D &vfu_mig_data_written,
> +    .write_data =3D &vfu_mig_write_data,
> +};
> +
>  static void vfu_object_ctx_run(void *opaque)
>  {
>      VfuObject *o =3D opaque;
> @@ -550,6 +982,13 @@ void vfu_object_set_bus_irq(PCIBus *pci_bus)
>      pci_bus_irqs(pci_bus, vfu_object_set_irq, vfu_object_map_irq, NULL, =
1);
>  }
> =20
> +static bool vfu_object_migratable(VfuObject *o)
> +{
> +    DeviceClass *dc =3D DEVICE_GET_CLASS(o->pci_dev);
> +
> +    return dc->vmsd && !dc->vmsd->unmigratable;
> +}
> +
>  /*
>   * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'devi=
ce'
>   * properties. It also depends on devices instantiated in QEMU. These
> @@ -575,6 +1014,7 @@ static void vfu_object_init_ctx(VfuObject *o, Error =
**errp)
>      ERRP_GUARD();
>      DeviceState *dev =3D NULL;
>      vfu_pci_type_t pci_type =3D VFU_PCI_TYPE_CONVENTIONAL;
> +    uint64_t migr_regs_size, migr_size;
>      int ret;
> =20
>      if (o->vfu_ctx || !o->socket || !o->device ||
> @@ -653,6 +1093,31 @@ static void vfu_object_init_ctx(VfuObject *o, Error=
 **errp)
>          goto fail;
>      }
> =20
> +    migr_regs_size =3D vfu_get_migr_register_area_size();
> +    migr_size =3D migr_regs_size + VFU_OBJECT_MIG_WINDOW;
> +
> +    ret =3D vfu_setup_region(o->vfu_ctx, VFU_PCI_DEV_MIGR_REGION_IDX,
> +                           migr_size, NULL,
> +                           VFU_REGION_FLAG_RW, NULL, 0, -1, 0);
> +    if (ret < 0) {
> +        error_setg(errp, "vfu: Failed to register migration BAR %s- %s",
> +                   o->device, strerror(errno));
> +        goto fail;
> +    }
> +
> +    if (!vfu_object_migratable(o)) {
> +        goto realize_ctx;
> +    }
> +
> +    ret =3D vfu_setup_device_migration_callbacks(o->vfu_ctx, &vfu_mig_cb=
s,
> +                                               migr_regs_size);
> +    if (ret < 0) {
> +        error_setg(errp, "vfu: Failed to setup migration %s- %s",
> +                   o->device, strerror(errno));
> +        goto fail;
> +    }
> +
> +realize_ctx:
>      ret =3D vfu_realize_ctx(o->vfu_ctx);
>      if (ret < 0) {
>          error_setg(errp, "vfu: Failed to realize device %s- %s",
> @@ -700,6 +1165,8 @@ static void vfu_object_init(Object *obj)
>      }
> =20
>      o->vfu_poll_fd =3D -1;
> +
> +    o->vfu_state =3D VFU_MIGR_STATE_STOP;

I was expecting RUNNING instead of STOP. Can you explain the state
machine? Perhaps --object x-vfio-user-server needs an incoming=3Don|off
parameter that defaults to off?

>  }
> =20
>  static void vfu_object_finalize(Object *obj)
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 1599b02fbc..2cc3b74287 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -66,6 +66,7 @@
>  #include "net/announce.h"
>  #include "qemu/yank.h"
>  #include "yank_functions.h"
> +#include "hw/qdev-core.h"
> =20
>  const unsigned int postcopy_ram_discard_version;
> =20
> @@ -1606,6 +1607,64 @@ static int qemu_savevm_state(QEMUFile *f, Error **=
errp)
>      return ret;
>  }
> =20
> +static SaveStateEntry *find_se_from_dev(DeviceState *dev)
> +{
> +    SaveStateEntry *se;
> +
> +    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> +        if (se->opaque =3D=3D dev) {
> +            return se;
> +        }
> +    }
> +
> +    return NULL;
> +}
> +
> +static int qemu_remote_savevm_section_full(DeviceState *dev, void *opaqu=
e)
> +{
> +    QEMUFile *f =3D opaque;
> +    SaveStateEntry *se;
> +    int ret;
> +
> +    se =3D find_se_from_dev(dev);
> +    if (!se) {
> +        return 0;
> +    }
> +
> +    if (!se->vmsd || !vmstate_save_needed(se->vmsd, se->opaque) ||
> +        se->vmsd->unmigratable) {
> +        return 0;
> +    }
> +
> +    save_section_header(f, se, QEMU_VM_SECTION_FULL);
> +
> +    ret =3D vmstate_save(f, se, NULL);
> +    if (ret) {
> +        qemu_file_set_error(f, ret);
> +        return ret;
> +    }
> +
> +    save_section_footer(f, se);
> +
> +    return 0;
> +}
> +
> +int qemu_remote_savevm(QEMUFile *f, DeviceState *dev)
> +{
> +    int ret =3D qdev_walk_children(dev, NULL, NULL,
> +                                 qemu_remote_savevm_section_full,
> +                                 NULL, f);
> +
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    qemu_put_byte(f, QEMU_VM_EOF);
> +    qemu_fflush(f);
> +
> +    return 0;
> +}
> +
>  void qemu_savevm_live_state(QEMUFile *f)
>  {
>      /* save QEMU_VM_SECTION_END section */
> @@ -2447,6 +2506,36 @@ qemu_loadvm_section_start_full(QEMUFile *f, Migrat=
ionIncomingState *mis)
>      return 0;
>  }
> =20
> +int qemu_remote_loadvm(QEMUFile *f)
> +{
> +    uint8_t section_type;
> +    int ret =3D 0;
> +
> +    while (true) {
> +        section_type =3D qemu_get_byte(f);
> +
> +        ret =3D qemu_file_get_error(f);
> +        if (ret) {
> +            break;
> +        }
> +
> +        switch (section_type) {
> +        case QEMU_VM_SECTION_FULL:
> +            ret =3D qemu_loadvm_section_start_full(f, NULL);
> +            if (ret < 0) {
> +                break;
> +            }
> +            break;
> +        case QEMU_VM_EOF:
> +            return ret;
> +        default:
> +            return -EINVAL;
> +        }
> +    }
> +
> +    return ret;
> +}
> +
>  static int
>  qemu_loadvm_section_part_end(QEMUFile *f, MigrationIncomingState *mis)
>  {
> diff --git a/migration/vmstate.c b/migration/vmstate.c
> index 05f87cdddc..83f8562792 100644
> --- a/migration/vmstate.c
> +++ b/migration/vmstate.c
> @@ -63,6 +63,25 @@ static int vmstate_size(void *opaque, const VMStateFie=
ld *field)
>      return size;
>  }
> =20
> +uint64_t vmstate_vmsd_size(PCIDevice *pci_dev)

This function is no longer used and can be dropped.

--KwmPQQewKxkzU0O4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIl69sACgkQnKSrs4Gr
c8hFQwf/e6uNr+0Ia3E2q6Oc9jazE1GiPj7huPfjE1RiPlDxpnXrKU4//bHGPsUK
9feaw7QqOjfAj/zJiCo7goux9gC9c1pzBN/G0z6eNh6ZXdWxSLdhHG8sMWZ27zdG
Fr2Uc8LEdYBTFm4F33QwST0gcc8xYI9H/Sz4dM/nywJVgAIgIc7vd+N8to2Jiry1
A8GroMD1WNVIHjXWHr+VU8a9lfQfujHnYt8mbHznYT1j8yhE5xxMMxPc2RqewVYg
hHRn5LdtFnpnO6T2zVkkZEyAxzNV3hylpaH6R+yr48RrgDFlmcRUJ4Ur28zHCMF6
Xdo6m1wr0rGpK9g/tBgaVFCW5XWgFg==
=UDHC
-----END PGP SIGNATURE-----

--KwmPQQewKxkzU0O4--


