Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A1943D16C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 21:09:23 +0200 (CEST)
Received: from localhost ([::1]:47956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfoIc-00040v-L6
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 15:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfnhJ-0002I6-7h
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:30:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfnhE-0005iw-7H
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:30:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635359443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FiUxa6GtUNDhOCdHJqoR4or2tMMwB8/d8ftyPqpwwFY=;
 b=Z2J5ESf64wBaWM6+dR/r7fRbwT5ycftLl1qz/+SxTa1KVFhbC5MpD14DM3jubMYyqtQ79n
 Gy27m56Fysi9mHXL+CM+y17xfWS0YxWYy+IrKOHns6VDOQZMiWbr+qXRzswKzKSdoiGLsP
 en9eO4R8OBuOYG0j41+ZrgpTZEhfo+E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-dHkyyd2JNVq-fagpp5OxWA-1; Wed, 27 Oct 2021 14:30:40 -0400
X-MC-Unique: dHkyyd2JNVq-fagpp5OxWA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C6961808304;
 Wed, 27 Oct 2021 18:30:38 +0000 (UTC)
Received: from localhost (unknown [10.39.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FD8D90BA;
 Wed, 27 Oct 2021 18:30:18 +0000 (UTC)
Date: Wed, 27 Oct 2021 19:30:17 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v3 11/12] vfio-user: register handlers to facilitate
 migration
Message-ID: <YXmauWJFaVBtdUFq@stefanha-x1.localdomain>
References: <cover.1633929457.git.jag.raman@oracle.com>
 <9f85493af346c32d34cca3622e8293053b5c7440.1633929457.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <9f85493af346c32d34cca3622e8293053b5c7440.1633929457.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="D9YvZ8nzzj8NqhZT"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 thanos.makatos@nutanix.com, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--D9YvZ8nzzj8NqhZT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 11, 2021 at 01:31:16AM -0400, Jagannathan Raman wrote:
> +static void vfu_mig_state_running(vfu_ctx_t *vfu_ctx)
> +{
> +    VfuObject *o =3D vfu_get_private(vfu_ctx);
> +    VfuObjectClass *k =3D VFU_OBJECT_GET_CLASS(OBJECT(o));
> +    static int migrated_devs;
> +    Error *local_err =3D NULL;
> +    int ret;
> +
> +    /**
> +     * TODO: move to VFU_MIGR_STATE_RESUME handler. Presently, the
> +     * VMSD data from source is not available at RESUME state.
> +     * Working on a fix for this.
> +     */
> +    if (!o->vfu_mig_file) {
> +        o->vfu_mig_file =3D qemu_fopen_ops(o, &vfu_mig_fops_load, false)=
;
> +    }
> +
> +    ret =3D qemu_remote_loadvm(o->vfu_mig_file);
> +    if (ret) {
> +        error_setg(&error_abort, "vfu: failed to restore device state");
> +        return;
> +    }
> +
> +    qemu_file_shutdown(o->vfu_mig_file);
> +    o->vfu_mig_file =3D NULL;
> +
> +    /* VFU_MIGR_STATE_RUNNING begins here */
> +    if (++migrated_devs =3D=3D k->nr_devs) {

See below about migrated_devs.

> +        bdrv_invalidate_cache_all(&local_err);
> +        if (local_err) {
> +            error_report_err(local_err);
> +            return;
> +        }
> +
> +        vm_start();
> +    }
> +}
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

s/scs/scsi/

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
> +        vm_stop(RUN_STATE_PAUSED);

The order of these two functions is reversed in migration/migration.c.
First we pause the VM, then we inactivate disks.

I think we need to zero migrated_devs in case migration fails and we try
to migrate again later:

  migrated_devs =3D 0;

This is still not quite right because maybe only a few VfuObjects are
stopped before migration fails. A different approach for counting
devices is necessary, like zeroing migrated_devs in
vfu_mig_state_stop_and_copy().

> @@ -422,6 +722,35 @@ static void vfu_object_machine_done(Notifier *notifi=
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

My question from the previous revision was not answered:

  libvfio-user has the vfu_migration_callbacks_t interface that allows the
  device to save/load more data regardless of the size of the migration
  region. I don't see the issue here since the region doesn't need to be
  sized to fit the savevm data?

--D9YvZ8nzzj8NqhZT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF5mrkACgkQnKSrs4Gr
c8h2IwgAjgIdfvKx1b4g+kP/pbdniJQQ3MWZQEnmSU4+laLPPlx1sN8K/lmzgIed
UhycJ+YuZ1dW0e04NJGrNBq60Cig3matBnDXbt33ju5f/ECzrQQmYmxrCeP+ZNw4
0XZRtBs93PjAXrvTVXjm65ugA85SWqA+BVf2NaXipxCQ7FyM+hHFpJwOJ8N6004o
j/l3x3NGo8f0Lz+QKTiYIsQ+entFFpG24cEmYanZnsipRWs3epFzjZn5I3YiLICN
5+TpJrOa9g/E94l8J9Tb/F1wUbK2j0kIoKWtNfzuTm27GqMPd1mMlChzCOtBz9kp
1i6SRJ/Op2DgWlye4E5C1hR1ZrbuRw==
=40s5
-----END PGP SIGNATURE-----

--D9YvZ8nzzj8NqhZT--


