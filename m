Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1D051F943
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 12:01:39 +0200 (CEST)
Received: from localhost ([::1]:41072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no0Cw-00063R-9O
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 06:01:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nnzxq-0002HB-A8
 for qemu-devel@nongnu.org; Mon, 09 May 2022 05:46:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nnzxn-0003xo-Qw
 for qemu-devel@nongnu.org; Mon, 09 May 2022 05:46:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652089559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RmeLwBtBxeFqcZWLH1i4IjVOF4+im+9lZr5XPb+/vAA=;
 b=dy7899sOya8/oSy1M4a9/aEARioBkJTKnyRl2rEVrqvx7mwU9KCgeMK80+gy0gSajLXcuj
 gL/z54MLoOtZ4wkWEb0YE9pP9+T4wa7TDAZsjANn7Ket0Q5y/CrDeX0ns8vdTCXkFeg3S0
 JS+Cp9VNELSoGhAyBfOV2w/TzKI5qAo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-d4I1oqosNmmAAZQOp60Z9A-1; Mon, 09 May 2022 05:45:55 -0400
X-MC-Unique: d4I1oqosNmmAAZQOp60Z9A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3386100DE72;
 Mon,  9 May 2022 09:45:54 +0000 (UTC)
Received: from localhost (unknown [10.39.195.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B196E2027EB4;
 Mon,  9 May 2022 09:45:52 +0000 (UTC)
Date: Mon, 9 May 2022 10:45:51 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Nir Soffer <nsoffer@redhat.com>,
 qemu-stable@nongnu.org
Subject: Re: [PATCH 0/6] virtio-scsi: fix 100% CPU consumption in IOThread
Message-ID: <Ynjiz80EJk9l4ynO@stefanha-x1.localdomain>
References: <20220427143541.119567-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wU6mTEbDePbyleB+"
Content-Disposition: inline
In-Reply-To: <20220427143541.119567-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--wU6mTEbDePbyleB+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 27, 2022 at 03:35:35PM +0100, Stefan Hajnoczi wrote:
> Nir Soffer reported that virtio-scsi,iothread=3D... consumes 100% CPU in =
QEMU
> 7.0. This patch series addresses two bugs in hw/scsi/virtio-scsi.c (see p=
atches
> 1 & 2) and follows up with code cleanups.
>=20
> Stefan Hajnoczi (6):
>   virtio-scsi: fix ctrl and event handler functions in dataplane mode
>   virtio-scsi: don't waste CPU polling the event virtqueue
>   virtio-scsi: clean up virtio_scsi_handle_event_vq()
>   virtio-scsi: clean up virtio_scsi_handle_ctrl_vq()
>   virtio-scsi: clean up virtio_scsi_handle_cmd_vq()
>   virtio-scsi: move request-related items from .h to .c
>=20
>  include/hw/virtio/virtio-scsi.h |  43 --------------
>  include/hw/virtio/virtio.h      |   1 +
>  hw/scsi/virtio-scsi-dataplane.c |   2 +-
>  hw/scsi/virtio-scsi.c           | 101 ++++++++++++++++++++++----------
>  hw/virtio/virtio.c              |  13 ++++
>  5 files changed, 86 insertions(+), 74 deletions(-)
>=20
> --=20
> 2.35.1
>=20

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--wU6mTEbDePbyleB+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJ44s8ACgkQnKSrs4Gr
c8gPrQgAiRq+wkkjoJ0RxfMmhv4CK4yQWb0GaiIogYylhFCuR4fz0f5fmg432Iei
rVZsq9apAvsRxn5t01SW/NF6CbhG5IWJgADeIciqGudopaIRvEf1tDhG8SfZj5dt
gK1DUpXE705xS3LhmWD2f0RTvczN7/rTkkbe3didRLNqSJlij2yycjKzO2OoGbGU
5gPjNR1Ver2CH5+6DyqC3jR5prO6l7nINcD/FqXHOlkVA2NuDT7RHLN4tyV3cNk0
ePfn1eQ9o7nV3/eqZofy8Rz0jQh0iWJeWPESwA6uVK8HHaJuqvuuuyneL2+7DSWm
ak+AP9hyVfa560p+GBc0LpkXVmv7hA==
=vS/g
-----END PGP SIGNATURE-----

--wU6mTEbDePbyleB+--


