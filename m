Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 140C26328C2
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 16:57:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox98s-0007YV-Ct; Mon, 21 Nov 2022 10:55:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ox98q-0007Us-3u
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 10:55:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ox98l-0003SE-Ir
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 10:55:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669046122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h7vk+MBjBIvFGk+X/HoTA0xrvX6E4ki/pvS7hzMCuzg=;
 b=avCrYrWaIUDEc3WdOA9PS7IoC68O0MQcwxWJlokHSxHNqx0C5nradN9eDHp76ldsJyJ4C4
 K3Va2TH6NPXkvq8Dx+dTOmelEpu1Va2cjMp9gkhIV7Wp++EqvvGdZJNZsqJztKQSUYypQi
 Afr0hX43+yneyo3sjFX47nT9vbaennM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-hFbAVaynOe2lQSj0GPWwWA-1; Mon, 21 Nov 2022 10:55:21 -0500
X-MC-Unique: hFbAVaynOe2lQSj0GPWwWA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EADC385A5B6;
 Mon, 21 Nov 2022 15:55:20 +0000 (UTC)
Received: from localhost (unknown [10.39.195.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F421C15BB3;
 Mon, 21 Nov 2022 15:55:19 +0000 (UTC)
Date: Mon, 21 Nov 2022 10:55:16 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Tobias Fiebig <tobias+git@fiebig.nl>, Jason Wang <jasowang@redhat.com>,
 qemu-stable@nongnu.org
Subject: Re: [PATCH for-7.2 v3 0/3] rtl8139: honor large send MSS value
Message-ID: <Y3ufZAmO+fgZm1UW@fedora>
References: <20221117165554.1773409-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QtM9dKyDHDuIF35n"
Content-Disposition: inline
In-Reply-To: <20221117165554.1773409-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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


--QtM9dKyDHDuIF35n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2022 at 11:55:51AM -0500, Stefan Hajnoczi wrote:
> v3:
> - Add Patch 1 to avoid clobbering tx descriptor bits
> - Add Patch 2 to avoid confusing tx command modes
> - Exclude IP and TCP headers from large send MSS value
>=20
> The rtl8139 large send offload currently does not honor the MSS value pro=
vided
> by the driver. This is a problem especially when the MTU is small because=
 IP
> fragmentation occurs and leads to poor performance.
>=20
> These patches make use of the large send MSS value.
>=20
> I have done basic testing by running the following Python code inside the
> guest:
>=20
>   import socket
>   s =3D socket.socket()
>   s.connect(('10.0.2.2', 1234))
>   buf =3D b'A' * 4096
>   s.send(buf)
>=20
> The device sees a 4150 byte tx descriptor that results in the transmissio=
n of 3
> Ethernet frames with sizes of 1514, 1514, and 1230 bytes when the large s=
end
> MSS value is 1460 bytes.
>=20
> Stefan Hajnoczi (3):
>   rtl8139: avoid clobbering tx descriptor bits
>   rtl8139: keep Tx command mode 0 and 1 separate
>   rtl8139: honor large send MSS value
>=20
>  hw/net/rtl8139.c | 47 ++++++++++++++++++++++++-----------------------
>  1 file changed, 24 insertions(+), 23 deletions(-)
>=20
> --=20
> 2.38.1
>=20

Thanks, applied to qemu.git/master!

Stefan

--QtM9dKyDHDuIF35n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmN7n2QACgkQnKSrs4Gr
c8jW7Qf/QxFGOl3z+qeJqBXnCpEIIA2hImbkKk/z1vkUWo2o8tb9qZ/ZXSspm3KA
wewjSTJPxGiFzOxy96ODhof2j3nxbcqO3P+ndkMals/pfjjIiuOpvFtUEO+OSV/t
QgHaIahy8IMwqQLc/EQkPn4iCKEd9ANXv18hF4vxOkZzI+TJpO907YbTY+aaUQr9
lt7q+i38pFukR/I15VP/DBkArfb8v3QZEwSN0gbU9nrcEuHPWnzf9DC3Wuxc2KLn
Pa3EQnJYCGtSCAWEGUJ07VOa60ZsuTkPRwsFrorxBKzou2smlrMVsvYuMbGOJTRM
f7cMUxA0R68FLg3mz/BbZMhk3Q8Txw==
=5dMy
-----END PGP SIGNATURE-----

--QtM9dKyDHDuIF35n--


