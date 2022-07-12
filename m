Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5AD571A85
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 14:52:56 +0200 (CEST)
Received: from localhost ([::1]:59290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBFNn-0006Pd-Fe
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 08:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oBFIK-0000GK-G8
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:47:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oBFII-0000KH-5O
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:47:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657630032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VY9+pLsviGvcBUHTeOWYNWwAWnENofpNZzApa9yRYz4=;
 b=RplBviNkYw4kNs5r1gmXUjh5WOzUj9NFvLAAkeqLfOuOvk67eFAQQ3SNX/jApJOe1uRLae
 +l6E1kmFM2VBsgfDTHUB5KVyTiIZc8HgUpXyy9UZJkhv6JS9BqSODEq4Nssc7Hb7qhclhj
 EizpsMLTLFIxBTZRFGx433CJvqZNigw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-DaAvtNGgM9WoIO9ieKWMFQ-1; Tue, 12 Jul 2022 08:47:09 -0400
X-MC-Unique: DaAvtNGgM9WoIO9ieKWMFQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F1A61C0336D;
 Tue, 12 Jul 2022 12:47:09 +0000 (UTC)
Received: from localhost (unknown [10.39.193.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA6CE1121314;
 Tue, 12 Jul 2022 12:47:08 +0000 (UTC)
Date: Tue, 12 Jul 2022 13:47:07 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 1/8] virtio_queue_aio_attach_host_notifier: remove
 AioContext lock
Message-ID: <Ys1tS51bxJ+VovCt@stefanha-x1.localdomain>
References: <20220609143727.1151816-1-eesposit@redhat.com>
 <20220609143727.1151816-2-eesposit@redhat.com>
 <YsRGpb02psGIffrw@stefanha-x1.localdomain>
 <3c910e80-dfdd-da1c-9683-3d7db51467c4@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8cYzRl2hzEEm5xmC"
Content-Disposition: inline
In-Reply-To: <3c910e80-dfdd-da1c-9683-3d7db51467c4@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--8cYzRl2hzEEm5xmC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 08, 2022 at 11:01:37AM +0200, Emanuele Giuseppe Esposito wrote:
>=20
>=20
> Am 05/07/2022 um 16:11 schrieb Stefan Hajnoczi:
> > On Thu, Jun 09, 2022 at 10:37:20AM -0400, Emanuele Giuseppe Esposito wr=
ote:
> >> @@ -146,7 +147,6 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
> >> =20
> >>      s->dataplane_starting =3D false;
> >>      s->dataplane_started =3D true;
> >> -    aio_context_release(s->ctx);
> >>      return 0;
> >=20
> > This looks risky because s->dataplane_started is accessed by IO code and
> > there is a race condition here. Maybe you can refactor the code along
> > the lines of virtio-blk to avoid the race.
> >=20
>=20
> Uhmm could you explain why is virtio-blk also safe here?
> And what is currently protecting dataplane_started (in both blk and
> scsi, as I don't see any other AioContext lock taken)?

dataplane_started is assigned before the host notifier is set up, which
I'm assuming is an implicit write barrier.

> Because I see that for example virtio_blk_req_complete is IO_CODE, so it
> could theoretically read dataplane_started while it is being changed in
> dataplane_stop? Even though I guess it doesn't because we disable and
> clean the host notifier before modifying it?

virtio_blk_data_plane_stop() has:

  aio_context_acquire(s->ctx);
  aio_wait_bh_oneshot(s->ctx, virtio_blk_data_plane_stop_bh, s);

  /* Drain and try to switch bs back to the QEMU main loop. If other users
   * keep the BlockBackend in the iothread, that's ok */
  blk_set_aio_context(s->conf->conf.blk, qemu_get_aio_context(), NULL);

  aio_context_release(s->ctx);

and disables host notifiers. At that point the IOThread no longer
receives virtqueue kicks and all in-flight requests have completed.
dataplane_started is only written afterwards so there is no race with
virtio_blk_req_complete().

>=20
> But if so, I don't get what is the difference with scsi code, and why we
> need to protect only that instance with the aiocontext lock?

The race condition I pointed out is not with virtio_blk_req_complete()
and data_plane_stop(). It's data_plane_start() racing with
virtio_blk_req_complete().

The virtio-scsi dataplane code is different for historical reasons and
happens to have the race. I don't think the virtio-blk code is affected.

Stefan

--8cYzRl2hzEEm5xmC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLNbUsACgkQnKSrs4Gr
c8hgqwf9HScoTqc8ZsbW4enzRp67yelZ0yLBtW0oEGfmA/2E948jSLTEdXIKZBMG
aRYqX9qFWW4/Cw60XK7Dck+yqUodteGSH78j9dMLk5Q78p7TIlAsPnnWdhRsVGHy
qYJ1xUj6FIAn3ctAVm5D8IYkPE/9Y7B0vyjY0gPPg9ws2V+4Oud7i0+rtHbVM3Ob
GlP58tGol4GON4LtoShSYNhvZ38hP/S+oMntsKKXIuvpj2aCMd92ZE3BNGyImjvi
RTtoQXnD8pmkuukmD69QZtxaGqUnN46GNP27d0XzyapDGReAq06tSNoVqUGwqZ7B
Ip70teKqIQ1dQpoRJADoKcqI/mjWdA==
=L5Me
-----END PGP SIGNATURE-----

--8cYzRl2hzEEm5xmC--


