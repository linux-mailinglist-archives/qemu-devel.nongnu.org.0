Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7DF58CB7B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 17:45:37 +0200 (CEST)
Received: from localhost ([::1]:45004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL4wi-0006Vk-0E
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 11:45:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oL4uc-0003pv-IJ
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 11:43:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oL4uY-0005f9-Mt
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 11:43:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659973401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rgAXWkABgHpbkMpXBwUm4txpPv8+oh9HiE7cqn7oa/E=;
 b=FL9W0GVTqb8M/XxgOcqELLManw54yAvJtkfEG9148bDQ6mWC1cOPBVjfAd9ZrThUlWcQHP
 CAaoE97rjyPZd6NFX/cLBccqGoFRFOTsIFBofGN1j+QWFzHnceNhhhwpuSMGhG79rleKHY
 fGhckcHLGBzQu4WkFEqhAkNrNyHES54=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-Te17-4s_O7KfI8Hiy7Y-JA-1; Mon, 08 Aug 2022 11:43:14 -0400
X-MC-Unique: Te17-4s_O7KfI8Hiy7Y-JA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9894885A587;
 Mon,  8 Aug 2022 15:43:13 +0000 (UTC)
Received: from localhost (unknown [10.39.194.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A4232026D4C;
 Mon,  8 Aug 2022 15:43:12 +0000 (UTC)
Date: Mon, 8 Aug 2022 11:43:11 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] virtio-scsi: replace VirtIOBlock
 dataplane_{start/starting/stopped} with enum
Message-ID: <YvEvD1X9/QSvyMGP@fedora>
References: <20220808094147.612472-1-eesposit@redhat.com>
 <20220808094147.612472-2-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SOVyBfCcl8XDzMt3"
Content-Disposition: inline
In-Reply-To: <20220808094147.612472-2-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--SOVyBfCcl8XDzMt3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 08, 2022 at 05:41:46AM -0400, Emanuele Giuseppe Esposito wrote:
> Simplify the various dataplane stages in dataplane_start/stop by using
> a single enum instead of having multiple flags.
>=20
> Read/write the enum atomically, as it can be read also by iothread
> callbacks.

What guarantees that these relaxed loads/stores always produce
DATAPLANE_STARTING/STARTED in virtio_scsi_defer_to_dataplane() and not
an older value? Are there implicit memory barriers?

>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  hw/scsi/virtio-scsi-dataplane.c | 21 +++++++++------------
>  hw/scsi/virtio-scsi.c           | 10 ++++++----
>  include/hw/virtio/virtio-scsi.h |  5 ++---
>  include/hw/virtio/virtio.h      |  7 +++++++
>  4 files changed, 24 insertions(+), 19 deletions(-)
>=20
> diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-datapl=
ane.c
> index a575c3f0cd..9ad73e3e19 100644
> --- a/hw/scsi/virtio-scsi-dataplane.c
> +++ b/hw/scsi/virtio-scsi-dataplane.c
> @@ -106,13 +106,12 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
>      VirtIOSCSICommon *vs =3D VIRTIO_SCSI_COMMON(vdev);
>      VirtIOSCSI *s =3D VIRTIO_SCSI(vdev);
> =20
> -    if (s->dataplane_started ||
> -        s->dataplane_starting ||
> +    if (qatomic_read(&s->dataplane_state) <=3D DATAPLANE_STARTED ||

It's not obvious that the STOPPING and STOPPED constants have a value
greater than STARTING and STARTED. It could be other way around too. It
would be safer to write the code so there are no assumptions about the
constants:

  VirtIODataplaneStates state =3D qatomic_read(&s->dataplane_state);

  if (state =3D=3D DATAPLANE_STARTING || state =3D=3D DATAPLANE_STARTED || =
=2E..)

--SOVyBfCcl8XDzMt3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLxLw8ACgkQnKSrs4Gr
c8hu8Qf/foIr3g4D9m12SF0rpFHo2U08QWCwLRK6bqTgm8skvOjfIAqXa/7GCJPc
SaYQu+EdQLdhimff5hJL56Px7J1cWWOX3dl3AxvBuCxS7W9DaH+4CgltaTTw2mvd
RVMp2XYeSWfqiEiHe2nXm1k9VGQ6VpRCuprgaYIjBrBWNn44BsLrVqBODu5KRWw8
aYkIhitsJAu06dSX4zsezKMuNNmPLbEWgj1qD/GYp3NDF5GyZthbtEnJsJm+x899
bBwkw4qtEn/nZNENfial+PkOyKmDjd7KQD7rwoxcV7Iode7MQwSRI13TKalRT4Sl
Mpx6HNAXDf/Gygmgl3PSCHYR0Oggig==
=AI66
-----END PGP SIGNATURE-----

--SOVyBfCcl8XDzMt3--


