Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE4162450C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 16:05:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot962-0002WE-WD; Thu, 10 Nov 2022 10:04:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ot95j-0002W2-OZ
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 10:03:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ot95i-0001yq-9J
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 10:03:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668092621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k/3q3256pp58KWK7ymho0kAryiKI5f+MBTIVIPpuJjk=;
 b=MonXoRv3xreTRSLkmDwnlf0mIEOYDRwOWeD0TrKaya8ela4JN+qUnnLQGVMxoCDQvzyS71
 Y7QGdzzoogJvaSjM6dZllSmFaN2qPeHl6PNOd1EIYxzeeerZDfc15vpCX2uwGSICes6KwQ
 o0nsoDpmj0s+w8Kxit11qVrzsVLUxxI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-2aXn5MT5PP2bB8lNq1pjkQ-1; Thu, 10 Nov 2022 10:03:24 -0500
X-MC-Unique: 2aXn5MT5PP2bB8lNq1pjkQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E757886462;
 Thu, 10 Nov 2022 15:03:24 +0000 (UTC)
Received: from localhost (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9B984A9268;
 Thu, 10 Nov 2022 15:03:23 +0000 (UTC)
Date: Thu, 10 Nov 2022 10:03:21 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH] virtio-blk: simplify virtio_blk_dma_restart_cb()
Message-ID: <Y20SucmGAnCu3Epl@fedora>
References: <20221102182337.252202-1-stefanha@redhat.com>
 <20221110072742-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="S6YE3tR6iBibVHIL"
Content-Disposition: inline
In-Reply-To: <20221110072742-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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


--S6YE3tR6iBibVHIL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 10, 2022 at 07:27:59AM -0500, Michael S. Tsirkin wrote:
> On Wed, Nov 02, 2022 at 02:23:37PM -0400, Stefan Hajnoczi wrote:
> > virtio_blk_dma_restart_cb() is tricky because the BH must deal with
> > virtio_blk_data_plane_start()/virtio_blk_data_plane_stop() being called.
> >=20
> > There are two issues with the code:
> >=20
> > 1. virtio_blk_realize() should use qdev_add_vm_change_state_handler()
> >    instead of qemu_add_vm_change_state_handler(). This ensures the
> >    ordering with virtio_init()'s vm change state handler that calls
> >    virtio_blk_data_plane_start()/virtio_blk_data_plane_stop() is
> >    well-defined. Then blk's AioContext is guaranteed to be up-to-date in
> >    virtio_blk_dma_restart_cb() and it's no longer necessary to have a
> >    special case for virtio_blk_data_plane_start().
> >=20
> > 2. Only blk_drain() waits for virtio_blk_dma_restart_cb()'s
> >    blk_inc_in_flight() to be decremented. The bdrv_drain() family of
> >    functions do not wait for BlockBackend's in_flight counter to reach
> >    zero. virtio_blk_data_plane_stop() relies on blk_set_aio_context()'s
> >    implicit drain, but that's a bdrv_drain() and not a blk_drain().
> >    Note that virtio_blk_reset() already correctly relies on blk_drain().
> >    If virtio_blk_data_plane_stop() switches to blk_drain() then we can
> >    properly wait for pending virtio_blk_dma_restart_bh() calls.
> >=20
> > Once these issues are taken care of the code becomes simpler. This
> > change is in preparation for multiple IOThreads in virtio-blk where we
> > need to clean up the multi-threading behavior.
> >=20
> > I ran the reproducer from commit 49b44549ace7 ("virtio-blk: On restart,
> > process queued requests in the proper context") to check that there is
> > no regression.
> >=20
> > Cc: Sergio Lopez <slp@redhat.com>
> > Cc: Kevin Wolf <kwolf@redhat.com>
> > Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>=20
>=20
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>=20
> block tree I presume?

Thanks, merged into my block-next tree.

Stefan

--S6YE3tR6iBibVHIL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNtErkACgkQnKSrs4Gr
c8gAyQgAkd2Y5yj/cDhnc5ygo6DsqBgPEhP4wRpl5T/MN0yxowBhEsxWZjePidrm
ZSANnXQbu8wwPWkFgGUnM0Z9GU+kUystfK8+p+UNV6p+y0JRU0Or4nqR9uTFcot0
wxYQLA2VM4q4hQ/DQ23mMy9Sa+FKxEGr/QcXeS7PzGkcAb8jM8lvMBtZGNuh/+sN
WlglS+VtdKt/oFqJ4TeBdUN1x49V0qLEGLC1PCc4v9lA8QFeLBOU+7CYzNKvo3qv
8fWaR3m1ahD8gjW+mf0OwhEhZ9+FmgSnyCnA68r+EIiWoE/0lDUAM9qQtjsV6g/E
0l5MRtphUWcUFo9g3IHDSs41G6HQrA==
=xgi0
-----END PGP SIGNATURE-----

--S6YE3tR6iBibVHIL--


