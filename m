Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE61425442
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:37:34 +0200 (CEST)
Received: from localhost ([::1]:44100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTaX-0005r2-Tr
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYTEw-000202-CZ
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:15:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mYTEq-000116-HR
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:15:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633612507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U1PE3qVdWFtcfc5PEyDCO8mqqyhOtUd0drm9iOVAAAg=;
 b=H47W4NzvJid2ZJ2jO67YWDgzFQHr3azYDAtYx9cBx0dCWrYqH0HeATZY67XlUyiT5owgMf
 QwdFx9ywLLpplmGGM7YX8DeKAn5lSmGPgRKqsgh4sJQSDQ2i0Be+Q/g5cz1QeUENRGCP1W
 /hdFeI1JOplShXcMoLH3INjLHTHQgb8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-uhQ3fKJeMJaVsJCvBT674A-1; Thu, 07 Oct 2021 09:15:05 -0400
X-MC-Unique: uhQ3fKJeMJaVsJCvBT674A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F47856B41;
 Thu,  7 Oct 2021 13:15:04 +0000 (UTC)
Received: from localhost (unknown [10.39.194.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D3EB5C1A3;
 Thu,  7 Oct 2021 13:15:03 +0000 (UTC)
Date: Thu, 7 Oct 2021 14:15:03 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 0/4] aio: AIO_CONTEXT_ACQUIRE_GUARD() macro experiment
Message-ID: <YV7y145FN+Es+Vue@stefanha-x1.localdomain>
References: <20211005185807.4134557-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005185807.4134557-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dgBvWF7K6WL1E/RS"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--dgBvWF7K6WL1E/RS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 05, 2021 at 08:58:03PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Experiment to use glib g_autoptr/autofree features with
> AIO context.
> Since this is a RFC, only few examples are provided.
>=20
> TODO: Document the macros in docs/devel/multiple-iothreads.txt
>=20
> Philippe Mathieu-Daud=E9 (4):
>   block/aio: Add automatically released aio_context variants
>   hw/scsi/scsi-disk: Use automatic AIO context lock
>   hw/scsi/scsi-generic: Use automatic AIO context lock
>   hw/block/virtio-blk: Use automatic AIO context lock
>=20
>  include/block/aio.h    | 24 ++++++++++++++++++++++++
>  hw/block/virtio-blk.c  | 26 ++++++++++++--------------
>  hw/scsi/scsi-disk.c    | 13 ++++---------
>  hw/scsi/scsi-generic.c |  6 +++---
>  4 files changed, 43 insertions(+), 26 deletions(-)

This is nice. Two things:

1. Emanuele is working on eliminating aio_context_acquire/release(), so
   a big effort to convert existing code to using guards could be wasted
   energy and cause conflicts with his patches.

2. A few callers anticipate that the AioContext of their BDS may change
   between acquire/release. Care needs to be taken when converting to
   preserve the semantics but most instances should be safe to convert.

Stefan

--dgBvWF7K6WL1E/RS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFe8tcACgkQnKSrs4Gr
c8iLwggAnKTs9ddDDXWAaoCNdfqE/0yhJDdHVpOvAW+9S1bQF7hk0n+krCBINNOk
LWyiW5gZuSJeJZJVB+LWeiSrXrRf5OtL/LP2rS3m0/x0d9E1ysF8OYozbPQ2tETn
L2YNap3zUXUkXMW/ArS2L+1kiRojGR8f8loNV2DSh6fPs1CaFLXEYsZ44A3aEnue
f7d88ZJhbRJuvV8/GwvyIbeRSR4Q3FA3wyJdYLIOx2M9uZuZv+sGtaijpoL13rEy
OzT06mkrtl1tMxN9lDXA5BlivXShO6HWnbedkhfSWDBI+3HsVsYpfVlAdNTGtf2I
4GipVijJ69rHe75/5Pymx4ApkTp3fQ==
=ejtq
-----END PGP SIGNATURE-----

--dgBvWF7K6WL1E/RS--


