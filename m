Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FD1690CCF
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 16:22:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ8ka-0000NM-Cc; Thu, 09 Feb 2023 10:22:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pQ8kS-0000MS-DZ
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:22:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pQ8kQ-0008Tz-1x
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:22:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675956123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/uHs2OTIyZTYo90vO51Tn/IoLke9i+mxjAo352tr69M=;
 b=VoEhRwfrh2pcSelCDV6YiwerokwF3+gVDz9YxPsUQt2NZKvmqDNoiNoJrY7n6QIQ+P/j8E
 P83m8hJZ0OjAetMI+Ma1cfr0YDGzlv0gTkxuNKcGbG+pObFuYaLUz8+w2z5vY6uMsEZ9f6
 qvVNXNBReGAqrZhKL8IkLifOIjlRql0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-tnhzWHJSNqeRXUEnFitQ_g-1; Thu, 09 Feb 2023 10:21:59 -0500
X-MC-Unique: tnhzWHJSNqeRXUEnFitQ_g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2582B801779;
 Thu,  9 Feb 2023 15:21:59 +0000 (UTC)
Received: from localhost (unknown [10.39.193.208])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A46DB18EC1;
 Thu,  9 Feb 2023 15:21:58 +0000 (UTC)
Date: Thu, 9 Feb 2023 10:21:57 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] virtio-blk: add missing AioContext lock
Message-ID: <Y+UPlYj0ukKKHLdw@fedora>
References: <20230208111148.1040083-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yMvVbRJ8PGoYU65M"
Content-Disposition: inline
In-Reply-To: <20230208111148.1040083-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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


--yMvVbRJ8PGoYU65M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 08, 2023 at 06:11:48AM -0500, Emanuele Giuseppe Esposito wrote:
> virtio_blk_update_config() calls blk_get_geometry and blk_getlength,
> and both functions eventually end up calling bdrv_poll_co when not
> running in a coroutine:
> - blk_getlength is a co_wrapper_mixed function
> - blk_get_geometry calls bdrv_get_geometry -> bdrv_nb_sectors, a
>   co_wrapper_mixed function too
>=20
> Since we are not running in a coroutine, we need to take s->blk
> AioContext lock, otherwise bdrv_poll_co will inevitably call
> AIO_WAIT_WHILE and therefore try to un unlock() an AioContext lock
> that was never acquired.
>=20
> RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=3D2167838
>=20
> Steps to reproduce the issue: simply boot a VM with
> -object '{"qom-type":"iothread","id":"iothread1"}' \
> -blockdev '{"driver":"file","filename":"$QCOW2","aio":"native","node-name=
":"libvirt-1-storage","cache":{"direct":true,"no-flush":false},"auto-read-o=
nly":true,"discard":"unmap"}' \
> -blockdev '{"node-name":"libvirt-1-format","read-only":false,"cache":{"di=
rect":true,"no-flush":false},"driver":"qcow2","file":"libvirt-1-storage"}' \
> -device virtio-blk-pci,iothread=3Diothread1,drive=3Dlibvirt-1-format,id=
=3Dvirtio-disk0,bootindex=3D1,write-cache=3Don
>=20
> and observe that it will fail not manage to boot with "qemu_mutex_unlock_=
impl: Operation not permitted"
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  hw/block/virtio-blk.c | 5 +++++
>  1 file changed, 5 insertions(+)

Thanks, applied to my block tree:
https://gitlab.com/stefanha/qemu/commits/block

Stefan

--yMvVbRJ8PGoYU65M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPlD5UACgkQnKSrs4Gr
c8i6owf/VdUA3KpKT3+M9nP1dpr2sI65TBmx4Kb9xIF2142W/2jFQOeIa5h1r9Km
Ejzdk7ZwftWSj0T+1r2iNGS1oRtYlplyA4LRx4Exsf6L0javQhX9Z7waO5XMa3UY
DQEHl39XqREDqRi/4eNCCaVpygd8KDsG2hs0B47TiyVxEQGQCMzE7hslK30nSa9+
uTtmvOGIsKkg35GqsVcJya4Xe9Cvxa9Pe10ZS7ac97tGXUsT19pHzABoV3CU0AAl
GhlgqWK+Y1YIgi/WmwMaFgzwOUnyxy/ekuMON0kV3nM4XYQW0Za1zqYPPy88UJVw
kqJPLPA/UPOtOs1tl0mTn1PBZzYBPA==
=nw6y
-----END PGP SIGNATURE-----

--yMvVbRJ8PGoYU65M--


