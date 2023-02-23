Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF776A0D06
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:35:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDcF-0004Ee-Uz; Thu, 23 Feb 2023 10:34:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pVDc4-0004BB-Jn
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:34:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pVDc2-0005HU-QG
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:34:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677166464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ur1gfoLT0cUMevlkAHvJopiA7UrE2IWfgPbAJ0H8WDo=;
 b=h/bZEbOvBJBvjNUgfecfMTUmcgXjVXOJFDPXYv9BB7pXCgdJTft1uvKfx/anXlh4S5ySK2
 WyXU7bKj+eXT8uhGyH9pIxrmA4m9vXQzyTWcwoZWVteIHbJkm0sC4EVoFsPk2olYkZTU3r
 bzMdCHEApOSIxQ8Iz7i4MWAkhBEWQq0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-4fdaQIjHMiq0dBOF1z358w-1; Thu, 23 Feb 2023 10:34:22 -0500
X-MC-Unique: 4fdaQIjHMiq0dBOF1z358w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7D63101A52E;
 Thu, 23 Feb 2023 15:34:21 +0000 (UTC)
Received: from localhost (unknown [10.39.192.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 107091121315;
 Thu, 23 Feb 2023 15:34:20 +0000 (UTC)
Date: Thu, 23 Feb 2023 10:03:32 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Fam Zheng <fam@euphon.net>, Qing Wang <qinwang@redhat.com>
Subject: Re: [PATCH v2 3/3] virtio-scsi: reset SCSI devices from main loop
 thread
Message-ID: <Y/eAREba3la1olXP@fedora>
References: <20230210143238.524357-1-stefanha@redhat.com>
 <20230210143238.524357-4-stefanha@redhat.com>
 <Y+9VShQtrC1KeEWU@redhat.com> <Y/Tz+qw7thcwO+G3@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zqQ5fO04DIRfWZOW"
Content-Disposition: inline
In-Reply-To: <Y/Tz+qw7thcwO+G3@fedora>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--zqQ5fO04DIRfWZOW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2023 at 11:40:26AM -0500, Stefan Hajnoczi wrote:
> On Fri, Feb 17, 2023 at 11:22:02AM +0100, Kevin Wolf wrote:
> > Am 10.02.2023 um 15:32 hat Stefan Hajnoczi geschrieben:
> > > When an IOThread is configured, the ctrl virtqueue is processed in the
> > > IOThread. TMFs that reset SCSI devices are currently called directly
> > > from the IOThread and trigger an assertion failure in blk_drain():
> > >=20
> > >   ../block/block-backend.c:1780: void blk_drain(BlockBackend *): Asse=
rtion `qemu_in_main_thread()' failed.
> > >=20
> > > The blk_drain() function is not designed to be called from an IOThread
> > > because it needs the Big QEMU Lock (BQL).
> > >=20
> > > This patch defers TMFs that reset SCSI devices to a Bottom Half (BH)
> > > that runs in the main loop thread under the BQL. This way it's safe to
> > > call blk_drain() and the assertion failure is avoided.
> >=20
> > It's not entirely obvious what is the call path that leads to
> > blk_drain(). Do we somehow call into virtio_scsi_dataplane_stop()?
>=20
> I'll make it clearer that resetting the SCSIDevice calls blk_drain():
>=20
>   void scsi_device_purge_requests(SCSIDevice *sdev, SCSISense sense)
>   {
>       SCSIRequest *req;
>=20
>       aio_context_acquire(blk_get_aio_context(sdev->conf.blk));
>       while (!QTAILQ_EMPTY(&sdev->requests)) {
>           req =3D QTAILQ_FIRST(&sdev->requests);
>           scsi_req_cancel_async(req, NULL);
>       }
>       blk_drain(sdev->conf.blk);
>       ^^^^^^^^^^^^^^^^^^^^^^^^^^
>=20
> The IOThread code path is virtio_scsi_handle_ctrl_req ->
> virtio_scsi_do_tmf -> device_code_reset -> scsi_disk_reset ->
> scsi_device_purge_requests.
>=20
> > > Introduce s->tmf_bh_list for tracking TMF requests that have been
> > > deferred to the BH. When the BH runs it will grab the entire list and
> > > process all requests. Care must be taken to clear the list when the
> > > virtio-scsi device is reset or unrealized. Otherwise deferred TMF
> > > requests could execute later and lead to use-after-free or other
> > > undefined behavior.
> >=20
> > Why don't we already need the same for other asynchronously processed
> > requests? Certainly having a read request write to guest memory after
> > the device has been reset or unplugged isn't what we want either.
>=20
> I/O is already taken care of because bdrv_drain_all() is called in
> do_vm_stop(). TMFs are not purely a device emulation concept and not a
> block layer concept covered by bdrv_drain_all(), so they need to be
> handled explicitly.
>=20
> >=20
> > I see that we assert(!s->dataplane_started) in virtio_scsi_reset(),
> > which may be part of the reason. If we're not processing any requests,
>=20
> Yes, dataplane is stopped when the virtio-scsi device is reset.
>=20
> > then we're safe. virtio_scsi_dataplane_stop() calls blk_drain_all()
> > (which is really a too big hammer) in order to make sure that in-flight
> > requests are completed before dataplane_started becomes false.
> >=20
> > I was wondering if we couldn't just blk_inc_in_flight() while a TMF
> > request is in flight and then use the same draining logic to be covered.
> > You could use oneshot BHs then and do away with the list because you
> > don't need to cancel anything any more, you just wait until the BHs have
> > completed.
> >=20
> > The practical problem may be that we don't have a blk here (which is
> > probably also why blk_drain_all() is used). We could have our own
> > AIO_WAIT_WHILE() instead. I feel waiting instead of cancelling BHs would
> > simplify the code.
> >=20
> > In fact, I think technically, you may not need any of that because
> > blk_drain_all() also executes all BHs in the main loop before it
> > returns, but that might be a bit subtle...
>=20
> There is a bit of a layering violation if we use the fake block layer
> requests to track virtio-scsi HBA TMF emulation.
>=20
> The starting point for doing this would probably be a
> SCSIDeviceClass->schedule_reset() function that allows scsi-disk.c to
> implement the one-shot BH + blk_inc_in_flight() approach. scsi-disk.c
> has the BlockBackend.
>=20
> The fact that we're having to think hard about how to make this work
> makes me wonder whether it's a good idea?
>=20
> > > The s->resetting counter that's used by TMFs that reset SCSI devices =
is
> > > accessed from multiple threads. This patch makes that explicit by usi=
ng
> > > atomic accessor functions. With this patch applied the counter is only
> > > modified by the main loop thread under the BQL but can be read by any
> > > thread.
> > >=20
> > > Reported-by: Qing Wang <qinwang@redhat.com>
> > > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> >=20
> > Kevin
> >=20



--zqQ5fO04DIRfWZOW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmP3gEQACgkQnKSrs4Gr
c8jA8Af/R8VbaCjEDqZQFgqGpuQMCEk45n5l3dxHh+bcxEHUukV2yuVJJlw7kTIR
q5XHQ6JS1mOkFNrpWfxxD+US7GMPWSao91NV3RZKeIXx6ms88LTV3c8sNOoDVGgA
d1FglW1LR9mNczyfXc6E6twHFnEbzL8KgF3b7UTu5zm7oAZUGhHCsJClipvCaY6o
FJEvrpa12GR7UPA/0N0ULUpp2U2FItnCatpd1vcK8oXYmEcLj4C2Yn6qr9M/A48u
2dJOvSt++YqYbYLRF7W0AdNfb3WF1fpCxv6zJ8TQcPukNNz158HKy8PJTl/8kXLx
6qaMIWuLdDndpHGMwX2CN9Yv+49F5A==
=th6W
-----END PGP SIGNATURE-----

--zqQ5fO04DIRfWZOW--


