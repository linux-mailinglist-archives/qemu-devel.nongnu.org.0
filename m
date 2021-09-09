Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F604046E2
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 10:18:02 +0200 (CEST)
Received: from localhost ([::1]:53664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOFFz-0006Ui-7R
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 04:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mOFCf-00024q-Jj
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 04:14:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mOFCY-0001ZT-Iz
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 04:14:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631175268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JfKWJTPLU7BcFDlWWDKZ/4SDyQySW73ZBgMkcrT9Oqk=;
 b=GgX6nLwgNZxoreIt84oJOUPTJXDynu75iyTG8bYm2FIF/LUeAJltATBnGWEL+3d3pyxQh5
 des7dgcifb5WsIir+Jqg/SS51QzG0qF8lDk2prsCgmr+nwr6opOw+HebZgfZy2bmlceZl4
 vcUpX1h7huKZMtHCQLs3iPXE0sUMcdc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-0MA3-TM5OAaw16N8neSSuw-1; Thu, 09 Sep 2021 04:14:26 -0400
X-MC-Unique: 0MA3-TM5OAaw16N8neSSuw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90392362F9;
 Thu,  9 Sep 2021 08:14:24 +0000 (UTC)
Received: from localhost (unknown [10.39.192.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB4B85D9FC;
 Thu,  9 Sep 2021 08:14:19 +0000 (UTC)
Date: Thu, 9 Sep 2021 09:14:18 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH RFC server v2 10/11] vfio-user: register handlers to
 facilitate migration
Message-ID: <YTnCWv5pKEksApTz@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
 <1550222ea65ae3dc425dff236f4f36b723ab8597.1630084211.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1550222ea65ae3dc425dff236f4f36b723ab8597.1630084211.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gQ2WgZZjnmJptP0L"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, philmd@redhat.com,
 qemu-devel@nongnu.org, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--gQ2WgZZjnmJptP0L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 27, 2021 at 01:53:29PM -0400, Jagannathan Raman wrote:
> +static ssize_t vfu_mig_buf_read(void *opaque, uint8_t *buf, int64_t pos,
> +                                size_t size, Error **errp)
> +{
> +    VfuObject *o =3D opaque;
> +
> +    if (pos > o->vfu_mig_buf_size) {
> +        size =3D 0;
> +    } else if ((pos + size) > o->vfu_mig_buf_size) {
> +        size =3D o->vfu_mig_buf_size;
> +    }
> +
> +    memcpy(buf, (o->vfu_mig_buf + pos), size);
> +
> +    o->vfu_mig_buf_size -=3D size;

This looks strange. pos increases each time we're called. We seem to be
truncating the buffer on each read. Should this line be dropped? Did you
test live migration (maybe this code needs more debugging)?

> +
> +    return size;
> +}
> +
> +static ssize_t vfu_mig_buf_write(void *opaque, struct iovec *iov, int io=
vcnt,
> +                                 int64_t pos, Error **errp)
> +{
> +    VfuObject *o =3D opaque;
> +    uint64_t end =3D pos + iov_size(iov, iovcnt);
> +    int i;
> +
> +    if (end > o->vfu_mig_buf_size) {
> +        o->vfu_mig_buf =3D g_realloc(o->vfu_mig_buf, end);
> +    }
> +
> +    for (i =3D 0; i < iovcnt; i++) {
> +        memcpy((o->vfu_mig_buf + o->vfu_mig_buf_size), iov[i].iov_base,
> +               iov[i].iov_len);
> +        o->vfu_mig_buf_size +=3D iov[i].iov_len;
> +        o->vfu_mig_buf_pending +=3D iov[i].iov_len;
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
> +/**
> + * handlers for vfu_migration_callbacks_t
> + *
> + * The libvfio-user library accesses these handlers to drive the migrati=
on
> + * at the remote end, and also to transport the data stored in vfu_mig_b=
uf
> + *
> + */
> +static void vfu_mig_state_precopy(vfu_ctx_t *vfu_ctx)
> +{
> +    VfuObject *o =3D vfu_get_private(vfu_ctx);
> +    int ret;
> +
> +    if (!o->vfu_mig_file) {
> +        o->vfu_mig_file =3D qemu_fopen_ops(o, &vfu_mig_fops_save, false)=
;
> +    }
> +
> +    ret =3D qemu_remote_savevm(o->vfu_mig_file, DEVICE(o->pci_dev));
> +    if (ret) {
> +        qemu_file_shutdown(o->vfu_mig_file);
> +        return;
> +    }
> +
> +    qemu_fflush(o->vfu_mig_file);
> +}

Are you sure pre-copy is the state where you want to serialize the
savevm data? IIUC pre-copy is the iterative state while the device is
still running (e.g. when copying RAM but before devices are stopped). I
expected savevm to happen when we reach stop-and-copy.

The reason why this matters is that we're saving the state of the device
while the guest is still running and possibly interacting with the
device. The destination won't have the final state of the device, it
will have an earlier state of the device when we started migrating RAM!

Maybe I'm wrong, please double-check, but this looks like a bug.

> +
> +static void vfu_mig_state_running(vfu_ctx_t *vfu_ctx)
> +{
> +    VfuObject *o =3D vfu_get_private(vfu_ctx);
> +    VfuObjectClass *k =3D VFU_OBJECT_GET_CLASS(OBJECT(o));
> +    static int migrated_devs;
> +    Error *local_err =3D NULL;
> +    int ret;
> +
> +    ret =3D qemu_remote_loadvm(o->vfu_mig_file);
> +    if (ret) {
> +        error_setg(&error_abort, "vfu: failed to restore device state");
> +        return;
> +    }
> +
> +    if (++migrated_devs =3D=3D k->nr_devs) {
> +        bdrv_invalidate_cache_all(&local_err);
> +        if (local_err) {
> +            error_report_err(local_err);
> +            return;
> +        }
> +
> +        vm_start();
> +    }
> +}

This looks like it's intended for the destination side. Does this code
work on the source side if the device is transitioned back into the
running state?

> +
> +static void vfu_mig_state_stop(vfu_ctx_t *vfu_ctx)
> +{
> +    VfuObject *o =3D vfu_get_private(vfu_ctx);
> +    VfuObjectClass *k =3D VFU_OBJECT_GET_CLASS(OBJECT(o));
> +    static int migrated_devs;
> +
> +    /**
> +     * note: calling bdrv_inactivate_all() is not the best approach.
> +     *
> +     *  Ideally, we would identify the block devices (if any) indirectly
> +     *  linked (such as via a scs-hd device) to each of the migrated dev=
ices,
> +     *  and inactivate them individually. This is essential while operat=
ing
> +     *  the server in a storage daemon mode, with devices from different=
 VMs.
> +     *
> +     *  However, we currently don't have this capability. As such, we ne=
ed to
> +     *  inactivate all devices at the same time when migration is comple=
ted.
> +     */
> +    if (++migrated_devs =3D=3D k->nr_devs) {
> +        bdrv_inactivate_all();
> +    }
> +}
> +
> +static int vfu_mig_transition(vfu_ctx_t *vfu_ctx, vfu_migr_state_t state=
)
> +{
> +    switch (state) {
> +    case VFU_MIGR_STATE_RESUME:
> +    case VFU_MIGR_STATE_STOP_AND_COPY:
> +        break;
> +    case VFU_MIGR_STATE_STOP:
> +        vfu_mig_state_stop(vfu_ctx);
> +        break;
> +    case VFU_MIGR_STATE_PRE_COPY:
> +        vfu_mig_state_precopy(vfu_ctx);
> +        break;
> +    case VFU_MIGR_STATE_RUNNING:
> +        if (!runstate_is_running()) {
> +            vfu_mig_state_running(vfu_ctx);
> +        }
> +        break;
> +    default:
> +        warn_report("vfu: Unknown migration state %d", state);
> +    }
> +
> +    return 0;
> +}
> +
> +static uint64_t vfu_mig_get_pending_bytes(vfu_ctx_t *vfu_ctx)
> +{
> +    VfuObject *o =3D vfu_get_private(vfu_ctx);
> +
> +    return o->vfu_mig_buf_pending;
> +}
> +
> +static int vfu_mig_prepare_data(vfu_ctx_t *vfu_ctx, uint64_t *offset,
> +                                uint64_t *size)
> +{
> +    VfuObject *o =3D vfu_get_private(vfu_ctx);
> +
> +    if (offset) {
> +        *offset =3D 0;
> +    }
> +
> +    if (size) {
> +        *size =3D o->vfu_mig_buf_size;
> +    }
> +
> +    return 0;
> +}
> +
> +static ssize_t vfu_mig_read_data(vfu_ctx_t *vfu_ctx, void *buf,
> +                                 uint64_t size, uint64_t offset)
> +{
> +    VfuObject *o =3D vfu_get_private(vfu_ctx);
> +
> +    if (offset > o->vfu_mig_buf_size) {
> +        return -1;
> +    }
> +
> +    if ((offset + size) > o->vfu_mig_buf_size) {
> +        warn_report("vfu: buffer overflow - check pending_bytes");
> +        size =3D o->vfu_mig_buf_size - offset;
> +    }
> +
> +    memcpy(buf, (o->vfu_mig_buf + offset), size);
> +
> +    o->vfu_mig_buf_pending -=3D size;
> +
> +    return size;
> +}
> +
> +static ssize_t vfu_mig_write_data(vfu_ctx_t *vfu_ctx, void *data,
> +                                  uint64_t size, uint64_t offset)
> +{
> +    VfuObject *o =3D vfu_get_private(vfu_ctx);
> +    uint64_t end =3D offset + size;
> +
> +    if (end > o->vfu_mig_buf_size) {
> +        o->vfu_mig_buf =3D g_realloc(o->vfu_mig_buf, end);
> +        o->vfu_mig_buf_size =3D end;
> +    }
> +
> +    memcpy((o->vfu_mig_buf + offset), data, size);
> +
> +    if (!o->vfu_mig_file) {
> +        o->vfu_mig_file =3D qemu_fopen_ops(o, &vfu_mig_fops_load, false)=
;
> +    }

Why open the file here where it's not accessed? I expected this to
happen at the point where data has been fully written and we call
qemu_remote_loadvm().

> +
> +    return size;
> +}
> +
> +static int vfu_mig_data_written(vfu_ctx_t *vfu_ctx, uint64_t count)
> +{
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
> @@ -340,6 +615,7 @@ static void vfu_object_machine_done(Notifier *notifie=
r, void *data)
>  {
>      VfuObject *o =3D container_of(notifier, VfuObject, machine_done);
>      DeviceState *dev =3D NULL;
> +    size_t migr_area_size;
>      QemuThread thread;
>      int ret;
> =20
> @@ -401,6 +677,35 @@ static void vfu_object_machine_done(Notifier *notifi=
er, void *data)
>          return;
>      }
> =20
> +    /*
> +     * TODO: The 0x20000 number used below is a temporary. We are workin=
g on
> +     *     a cleaner fix for this.
> +     *
> +     *     The libvfio-user library assumes that the remote knows the si=
ze of
> +     *     the data to be migrated at boot time, but that is not the cas=
e with
> +     *     VMSDs, as it can contain a variable-size buffer. 0x20000 is u=
sed
> +     *     as a sufficiently large buffer to demonstrate migration, but =
that
> +     *     cannot be used as a solution.
> +     *
> +     */

libvfio-user has the vfu_migration_callbacks_t interface that allows the
device to save/load more data regardless of the size of the migration
region. I don't see the issue here since the region doesn't need to be
sized to fit the savevm data?

--gQ2WgZZjnmJptP0L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE5wloACgkQnKSrs4Gr
c8iyXQgAoz+yF+9FGGk+DeRyKSeOKmRi3ifF9nV+mOj/Ro9G8PiI7rmoJbvKQtcD
ousQin3/NR39gaYFeAdhqyp3N2hxw6Yt6TH8dDu8fhxZ9PVZoTRZaIBSZ+ryHhJj
/ArUkLDOsgIyMxPBXDoTlphoyk/eNhDnSHpHM7q81S7M9HAw0HTMciDgon6KukZ3
cg/rg46RKxynIoW8VLRbiQBCjkwoX+zujsaD+hFNoTofVg8Ii+d1edUFN5WtcvzW
ymRxrPcS7PPwdakIjuqWU/bryYlpsqBJOTzTs/PSgxnHezq5+d2BIGm6D1yAJIxl
r8VMesT5i+ZgHCy9BvSKssnbNfyUVw==
=RHdl
-----END PGP SIGNATURE-----

--gQ2WgZZjnmJptP0L--


