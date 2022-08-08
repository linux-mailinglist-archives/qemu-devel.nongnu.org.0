Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5981758CC2C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 18:32:40 +0200 (CEST)
Received: from localhost ([::1]:45302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL5gE-0004Vl-U7
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 12:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oL5dI-00023J-RD
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 12:29:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oL5dG-0005Po-BZ
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 12:29:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659976173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RpDQlws4mJOVVAZOaTWaG2oQeFrEjhWIeW54njK/qes=;
 b=KAIlH2fI6slSPc2+uxfPifpePPgsqdBoo/7I7/+7eqHnEQnJQBhqGfxQjgvqZWF15Kuxnl
 FRTmHUPz9tZuXRFsfFR5K+1Q6KGd9TAVaHZ+RJGKcMKLGAwv+9dSp9tc1mAxpdNYSe0TuB
 peZxZRr/P+Psnz9mxuT3NmbQXD70UmA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-41Qy-6YSMna1D6x12es4pA-1; Mon, 08 Aug 2022 12:29:29 -0400
X-MC-Unique: 41Qy-6YSMna1D6x12es4pA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DD0C8117B0;
 Mon,  8 Aug 2022 16:29:29 +0000 (UTC)
Received: from localhost (unknown [10.39.194.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8792E40C1288;
 Mon,  8 Aug 2022 16:29:28 +0000 (UTC)
Date: Mon, 8 Aug 2022 12:29:26 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] virtio-blk and scsi: replace
 dataplane_{start/stopping/started}
Message-ID: <YvE55gsiyP5MLjqq@fedora>
References: <20220808094147.612472-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NGtsP4K3P4Sc+4tm"
Content-Disposition: inline
In-Reply-To: <20220808094147.612472-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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


--NGtsP4K3P4Sc+4tm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 08, 2022 at 05:41:45AM -0400, Emanuele Giuseppe Esposito wrote:
> The way the dataplane stages at startup and stop are monitored is unneces=
sary
> complicated. In virtio-scsi we have dataplane_started, dataplane_starting=
 and
> dataplane_stopping in VirtIOSCSI.
> In virtio-blk we have dataplene_started in VirtIOBlock, and starting and =
stopping
> in VirtIOBlockDataPlane.
>=20
> Just replace all these flags with an atomic enum.
>=20
> Based-on: 20220803162824.948023-1-stefanha@redhat.com

Hi Emanuele,
I posted a v2 of my virtio-scsi dataplane startup race condition fix
that's related to this patch. This time it's based on how virtio-blk
does it.

We can merge both our patch series or just one of them in order to fix
the race condition.

Stefan

>=20
> Emanuele Giuseppe Esposito (2):
>   virtio-scsi: replace VirtIOBlock dataplane_{start/starting/stopped}
>     with enum
>   virtio-blk: replace dataplane_start/stopping/started with enum
>=20
>  hw/block/dataplane/virtio-blk.c | 24 +++++++++---------------
>  hw/block/virtio-blk.c           |  9 +++++----
>  hw/scsi/virtio-scsi-dataplane.c | 21 +++++++++------------
>  hw/scsi/virtio-scsi.c           | 10 ++++++----
>  include/hw/virtio/virtio-blk.h  |  2 +-
>  include/hw/virtio/virtio-scsi.h |  5 ++---
>  include/hw/virtio/virtio.h      |  7 +++++++
>  7 files changed, 39 insertions(+), 39 deletions(-)
>=20
> --=20
> 2.31.1
>=20

--NGtsP4K3P4Sc+4tm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLxOeYACgkQnKSrs4Gr
c8i+IAgAgCYGZAJFz+L5ETje7W8lC8VIVgQ0RhjIihqtcaOz6XxHabVGKANgPJAE
B8nVLQJg4ph+YN1cyniVM6uD/OetXBWnV8URKlx1paZL7Wv6Rfco8deC8vKb7Dib
L+YLsAEKKYk9ZskJf1lE2XKDoegMxMdGXgsEfM4kGB5+UaEcZBiAJ+0HTTrzRQFg
1AunV3v44hwTIyejf5TfmsaXk+g9urRvvNo00P9A7ketXzbuLejdRyG4WkF9j8Zs
dc6B+WvoKiVx5m9ZhXyLq5SAomrCce82m4RdRlO2HdeKSiRaM+AEh6T/tpr8Hx8S
GsONb+kOAPjbfotl2oHDTuPdZjM2YQ==
=dVGF
-----END PGP SIGNATURE-----

--NGtsP4K3P4Sc+4tm--


