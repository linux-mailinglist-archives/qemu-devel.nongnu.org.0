Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFCE2AD5AF
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:55:11 +0100 (CET)
Received: from localhost ([::1]:57738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcSEw-00086A-6f
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:55:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcSD8-0007D7-8i
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:53:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcSD6-0001Ky-I9
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:53:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605009195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9dh0BtFK3Pgpagfme0cvoma8QOuEI8Gl9gCoVpZW8OQ=;
 b=hOkCzYJQNAPB6l/kZLiB9a9V7nvw5HAm2YTQ+XmrZ9a0sQOFf9dixODRYheKzymRgtWpwB
 cE9ksFMk2aDAXlhNtRIg5frWG5+AFUSkL0MD1DMqLy0GFwNDcI/iCN0ZN8cJijwEyGLuqJ
 HkjCeRUfLHa4Jj+moSP00daoys9OWG0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-KSxKNLmxNnWLUDcj6j5l_g-1; Tue, 10 Nov 2020 06:53:13 -0500
X-MC-Unique: KSxKNLmxNnWLUDcj6j5l_g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93F3D188C122;
 Tue, 10 Nov 2020 11:53:12 +0000 (UTC)
Received: from localhost (ovpn-114-36.ams2.redhat.com [10.36.114.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22A3910013D9;
 Tue, 10 Nov 2020 11:53:08 +0000 (UTC)
Date: Tue, 10 Nov 2020 11:53:07 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH V2] virtiofsd: Use --thread-pool-size=0 to mean no thread
 pool
Message-ID: <20201110115307.GB1084668@stefanha-x1.localdomain>
References: <20201109143548.GA1479853@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201109143548.GA1479853@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yNb1oOkm5a9FJOVX"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs-list <virtio-fs@redhat.com>, jose.carlos.venegas.munoz@intel.com,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--yNb1oOkm5a9FJOVX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 09, 2020 at 09:35:48AM -0500, Vivek Goyal wrote:
> Right now we create a thread pool and main thread hands over the request
> to thread in thread pool to process. Number of threads in thread pool
> can be managed by option --thread-pool-size.
>=20
> In tests we have noted that many of the workloads are getting better
> performance if we don't use a thread pool at all and process all
> the requests in the context of a thread receiving the request.
>=20
> Hence give user an option to be able to run virtiofsd without using
> a thread pool.
>=20
> To implement this, I have used existing option --thread-pool-size. This
> option defines how many maximum threads can be in the thread pool.
> Thread pool size zero freezes thead pool. I can't see why will one
> start virtiofsd with a frozen thread pool (hence frozen file system).
> So I am redefining --thread-pool-size=3D0 to mean, don't use a thread poo=
l.
> Instead process the request in the context of thread receiving request
> from the queue.
>=20
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  tools/virtiofsd/fuse_virtio.c | 36 ++++++++++++++++++++++++++---------
>  1 file changed, 27 insertions(+), 9 deletions(-)

This is useful for benchmarking. For production we need to understand
the cause of the performance difference so that virtiofsd can adapt to
the workload without setting a specific thread-pool-size value.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--yNb1oOkm5a9FJOVX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+qfyMACgkQnKSrs4Gr
c8jGPggAmvkTZSheip0oT7WhLt3KNTPHHLHrKYD5wkXyfEmzlLx4Z8anSysw7BED
2TXxJKXVtZOsEyrHPre3W6dgfDYCOrUPILQxCvMwPXWKvspvmMaWmlfqDlOk+gAE
V0EvngtJJQtmyn2My5T35ys6q/AHCGCgDA6PR0WU+e05vxV6vrZR+rWK/U9V4TUe
jAaoabvA43ETJJyxLiNDyfqylhFpKnPMItsWcyvPd8FcnVIHE6wDncA2tl9stxZT
YsF46tnSgaWZ2/lUULCRVquDim0ptMj1ZxRUVu2enpg9R9Qbl+OggPfEY9I5++CW
qIPL2a73H/aYvi10ZbpE1YhcfRkizw==
=kgED
-----END PGP SIGNATURE-----

--yNb1oOkm5a9FJOVX--


