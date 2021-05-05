Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B37A037386E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 12:16:52 +0200 (CEST)
Received: from localhost ([::1]:57350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leEaJ-0004d5-PM
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 06:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leEY9-0003UB-Dd
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:14:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leEY6-0002He-0J
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:14:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620209673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+wNOTlYOCEgrnzojq5cYBNHOifVg2uBD9wgjX4Bv/DI=;
 b=gGFl1XKm8HJmBigpA4wivKp9BOfL40kilz0tgQ9yjNj1eCjBfnvySqsfFeYycyex/TW8AL
 Mk6VV12sBVTjiKnIe9hC9wRcwFP/YO/cZPGn74NEAP166IRfYhxpYFzuyYc0RFWpfcW5d3
 u4z/2kA4ArlOU5rrRQKopUPJX0kT/Kc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-ddfdQf1CMqSc9fjOgniaYw-1; Wed, 05 May 2021 06:14:29 -0400
X-MC-Unique: ddfdQf1CMqSc9fjOgniaYw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B365107ACF2;
 Wed,  5 May 2021 10:14:28 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A830D5B4A6;
 Wed,  5 May 2021 10:14:24 +0000 (UTC)
Date: Wed, 5 May 2021 11:14:23 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [for-6.1 2/4] virtio-blk: Configure all host notifiers in a
 single MR transaction
Message-ID: <YJJv/5jWOwEu92C/@stefanha-x1.localdomain>
References: <20210407143501.244343-1-groug@kaod.org>
 <20210407143501.244343-3-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210407143501.244343-3-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DiYfepx/HEEzTjOO"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--DiYfepx/HEEzTjOO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 07, 2021 at 04:34:59PM +0200, Greg Kurz wrote:
> This allows the virtio-blk-pci device to batch the setup of all its
> host notifiers. This significantly improves boot time of VMs with a
> high number of vCPUs, e.g. from 3m26.186s down to 0m58.023s for a
> pseries machine with 384 vCPUs.
>=20
> Note that memory_region_transaction_commit() must be called before
> virtio_bus_cleanup_host_notifier() because the latter might close
> ioeventfds that the transaction still assumes to be around when it
> commits.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  hw/block/dataplane/virtio-blk.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>=20
> diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-=
blk.c
> index d7b5c95d26d9..cd81893d1d01 100644
> --- a/hw/block/dataplane/virtio-blk.c
> +++ b/hw/block/dataplane/virtio-blk.c
> @@ -198,19 +198,30 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
>          goto fail_guest_notifiers;
>      }
> =20
> +    memory_region_transaction_begin();

This call is optional and an optimization. It would be nice to have a
comment here explaining that - otherwise people may wonder why this is
necessary.

> +
>      /* Set up virtqueue notify */
>      for (i =3D 0; i < nvqs; i++) {
>          r =3D virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, true);
>          if (r !=3D 0) {
> +            int j =3D i;
> +
>              fprintf(stderr, "virtio-blk failed to set host notifier (%d)=
\n", r);
>              while (i--) {
>                  virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false)=
;
> +            }
> +
> +            memory_region_transaction_commit();
> +
> +            while (j--) {
>                  virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
>              }
>              goto fail_host_notifiers;
>          }
>      }
> =20
> +    memory_region_transaction_commit();
> +
>      s->starting =3D false;
>      vblk->dataplane_started =3D true;
>      trace_virtio_blk_data_plane_start(s);
> @@ -246,8 +257,15 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
>      return 0;
> =20
>    fail_aio_context:
> +    memory_region_transaction_begin();

Probably unnecessary since this is an error code path. We don't need to
optimize it.

Doesn't hurt though.

--DiYfepx/HEEzTjOO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCSb/8ACgkQnKSrs4Gr
c8gzTAf9GRzccMNGiTDxMRXF6olCKNFNfy+DPXSEi2UfplC62x8ESTvR2wNtsW94
0ciT24Z4D/3j4SIYLcasgm/DyCt1CQXZp5iKE0okBJHhmM8P7xu86YfByhUk1dxx
rbukP6W5OHgRCv+rNpOV8gnF53FNMKHWz/AGPdhZBWytaNi7WkbdNbjOPV23sEZB
mhzYKoT821grkXaIHgfiOfLqBIvIeP/iqlnAXTDS+TsvSiYEd/fphBE/hD2RbZVw
OekJRtYisfCr92XEDYW00TpuKfJIMU89MOzjy8HBI8r05dE92OVehFs5CxmwGYFk
ha8+IGMaaouurzkznDk5EC5bk1sE9A==
=cFgF
-----END PGP SIGNATURE-----

--DiYfepx/HEEzTjOO--


