Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3418069F63A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 15:15:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUpsr-0005kJ-0x; Wed, 22 Feb 2023 09:14:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pUpso-0005k5-LG
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:14:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pUpsm-0007JJ-2x
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:14:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677075243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=neoNTwc01I7y5AnwKAWLxEEYnTweYg1kFt4C/L6kjqc=;
 b=hOFkdJM89AB+VEPTWvQg/gJkJCwykO7sPEkZANQGPyv9IlCgTobQbQd0zLwAsVW5mCs8cb
 wW9ITEvxsBf+TcO1KANmo7KTwCYaHf736Qo+u/8O/t2ep8/7OGpjGiA583uBCWSfBR7eOH
 FKugzJJiQ7l3d6AO5dRjEVsuiaJhfkE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-9E11NO8DONS_wRePpN47vw-1; Wed, 22 Feb 2023 09:13:57 -0500
X-MC-Unique: 9E11NO8DONS_wRePpN47vw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19CD33C10694;
 Wed, 22 Feb 2023 14:13:55 +0000 (UTC)
Received: from localhost (unknown [10.39.195.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D2C62166B26;
 Wed, 22 Feb 2023 14:13:53 +0000 (UTC)
Date: Wed, 22 Feb 2023 09:13:52 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jon Maloy <jmaloy@redhat.com>, Siqi Chen <coc.cyqh@gmail.com>
Subject: Re: [PATCH v6 0/4] memory: prevent dma-reentracy issues
Message-ID: <Y/YjIF6/Y7zgICgn@fedora>
References: <20230205040737.3567731-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tI57dO4F+IQ99/j5"
Content-Disposition: inline
In-Reply-To: <20230205040737.3567731-1-alxndr@bu.edu>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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


--tI57dO4F+IQ99/j5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 04, 2023 at 11:07:33PM -0500, Alexander Bulekov wrote:
> These patches aim to solve two types of DMA-reentrancy issues:
>  =20
> 1.) mmio -> dma -> mmio case
> To solve this, we track whether the device is engaged in io by
> checking/setting a reentrancy-guard within APIs used for MMIO access.
>  =20
> 2.) bh -> dma write -> mmio case
> This case is trickier, since we dont have a generic way to associate a
> bh with the underlying Device/DeviceState. Thus, this version allows a
> device to associate a reentrancy-guard with a bh, when creating it.
> (Instead of calling qemu_bh_new, you call qemu_bh_new_guarded)
>  =20
> I replaced most of the qemu_bh_new invocations with the guarded analog,
> except for the ones where the DeviceState was not trivially accessible.
>=20
> v5 -> v6:
>     - Only apply checkpatch checks to code in paths containing "/hw/"
>       (/hw/ and include/hw/)
>     - Fix a bug in a _guarded call added to hw/block/virtio-blk.c
> v4-> v5:
>     - Add corresponding checkpatch checks
>     - Save/restore reentrancy-flag when entering/exiting BHs
>     - Improve documentation
>     - Check object_dynamic_cast return value
>  =20
> v3 -> v4: Instead of changing all of the DMA APIs, instead add an
>     optional reentrancy guard to the BH API.
>=20
> v2 -> v3: Bite the bullet and modify the DMA APIs, rather than
>     attempting to guess DeviceStates in BHs.
>=20
> Alexander Bulekov (4):
>   memory: prevent dma-reentracy issues
>   async: Add an optional reentrancy guard to the BH API
>   checkpatch: add qemu_bh_new/aio_bh_new checks
>   hw: replace most qemu_bh_new calls with qemu_bh_new_guarded
>=20
>  docs/devel/multiple-iothreads.txt |  7 +++++++
>  hw/9pfs/xen-9p-backend.c          |  4 +++-
>  hw/block/dataplane/virtio-blk.c   |  3 ++-
>  hw/block/dataplane/xen-block.c    |  5 +++--
>  hw/char/virtio-serial-bus.c       |  3 ++-
>  hw/display/qxl.c                  |  9 ++++++---
>  hw/display/virtio-gpu.c           |  6 ++++--
>  hw/ide/ahci.c                     |  3 ++-
>  hw/ide/core.c                     |  3 ++-
>  hw/misc/imx_rngc.c                |  6 ++++--
>  hw/misc/macio/mac_dbdma.c         |  2 +-
>  hw/net/virtio-net.c               |  3 ++-
>  hw/nvme/ctrl.c                    |  6 ++++--
>  hw/scsi/mptsas.c                  |  3 ++-
>  hw/scsi/scsi-bus.c                |  3 ++-
>  hw/scsi/vmw_pvscsi.c              |  3 ++-
>  hw/usb/dev-uas.c                  |  3 ++-
>  hw/usb/hcd-dwc2.c                 |  3 ++-
>  hw/usb/hcd-ehci.c                 |  3 ++-
>  hw/usb/hcd-uhci.c                 |  2 +-
>  hw/usb/host-libusb.c              |  6 ++++--
>  hw/usb/redirect.c                 |  6 ++++--
>  hw/usb/xen-usb.c                  |  3 ++-
>  hw/virtio/virtio-balloon.c        |  5 +++--
>  hw/virtio/virtio-crypto.c         |  3 ++-
>  include/block/aio.h               | 18 ++++++++++++++++--
>  include/hw/qdev-core.h            |  7 +++++++
>  include/qemu/main-loop.h          |  7 +++++--
>  scripts/checkpatch.pl             |  8 ++++++++
>  softmmu/memory.c                  | 17 +++++++++++++++++
>  softmmu/trace-events              |  1 +
>  tests/unit/ptimer-test-stubs.c    |  3 ++-
>  util/async.c                      | 18 +++++++++++++++++-
>  util/main-loop.c                  |  5 +++--
>  util/trace-events                 |  1 +
>  35 files changed, 147 insertions(+), 41 deletions(-)
>=20
> --=20
> 2.39.0
>=20

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--tI57dO4F+IQ99/j5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmP2IyAACgkQnKSrs4Gr
c8gy8wf+N+69l7qaR4aQRx9Kv/RxkAc9hpnLGBfSnP6LkFeBuprDeV78rmrXHwhJ
W0mK0HfJcEQJu0hQzHBfXRvYQkXhFj/BYFRk1v21myzGDmFDshdfExevKhkq7G6E
PkHFlQjWrz5h4oRkRwbLXwbszNA+VyoJdIpxbvK2D44Y3MWfqB/LLxOE9pQSvY1O
6XKWrzQslmDlKsS/b5ut48bhCnR6wSjySEVSj7p3TDc76iFPhZ1ja4z538vodNou
i3N3D4vK/QlNUZTJbRZoOxWrOoa+PTa2YA+AyCXnzN9HsvYQHEGJ4SHvSjKOr2pa
J5hXVXp/Hu/c2ihDxgpeA053nw0bsw==
=+Ec9
-----END PGP SIGNATURE-----

--tI57dO4F+IQ99/j5--


