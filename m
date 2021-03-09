Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCC2332B0C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:52:13 +0100 (CET)
Received: from localhost ([::1]:48486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeeY-0002Sm-VE
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:52:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJe78-0003Bo-5a
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:17:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJe75-0002rS-HB
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:17:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615303053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qFtcJeGYXMATfkj41zpL0LajkY9gNExE6E06kdWBkxc=;
 b=PLExN6wZcNGu1L2sMdqaH/VhCFj93CamRb4DtYSrHcBsDSo+ilTR1SbutfcRaMlIE4kjx6
 IxgagPASO3Kj4m5v5QcnuqOWqXYP4EN+fQwaY8aa36nIpwkzVpot3OSMb9mZcGNy35b3v9
 rmvvbZl40Ck5fT6+1Qg7DHESwV33YE0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-EMylsZTMNTu0cRVd5fD44w-1; Tue, 09 Mar 2021 10:17:28 -0500
X-MC-Unique: EMylsZTMNTu0cRVd5fD44w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 432231842144;
 Tue,  9 Mar 2021 15:17:27 +0000 (UTC)
Received: from localhost (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39F4819C46;
 Tue,  9 Mar 2021 15:17:23 +0000 (UTC)
Date: Tue, 9 Mar 2021 15:17:21 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 2/4] vhost-user: Convert slave channel to QIOChannelSocket
Message-ID: <YEeRgY2WEFSw+1qG@stefanha-x1.localdomain>
References: <20210308123141.26444-1-groug@kaod.org>
 <20210308123141.26444-3-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210308123141.26444-3-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MIuVGyLk4znvSjFm"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Vivek Goyal <vgoyal@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--MIuVGyLk4znvSjFm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 08, 2021 at 01:31:39PM +0100, Greg Kurz wrote:
> +    g_autofree int *fd =3D NULL;
> +    size_t fdsize =3D 0;
> +    int i;
> =20
>      /* Read header */
>      iov.iov_base =3D &hdr;
>      iov.iov_len =3D VHOST_USER_HDR_SIZE;
> =20
>      do {
> -        size =3D recvmsg(u->slave_fd, &msgh, 0);
> -    } while (size < 0 && (errno =3D=3D EINTR || errno =3D=3D EAGAIN));
> +        size =3D qio_channel_readv_full(ioc, &iov, 1, &fd, &fdsize, NULL=
);
> +    } while (size =3D=3D QIO_CHANNEL_ERR_BLOCK);

Is it possible to leak file descriptors and fd[] memory if we receive a
short message and then loop around? qio_channel_readv_full() will
overwrite &fd and that's how the leak occurs.

On the other hand, it looks like ioc is in blocking mode. I'm not sure
QIO_CHANNEL_ERR_BLOCK can occur?

> @@ -1500,8 +1479,8 @@ static void slave_read(void *opaque)
> =20
>      /* Read payload */
>      do {
> -        size =3D read(u->slave_fd, &payload, hdr.size);
> -    } while (size < 0 && (errno =3D=3D EINTR || errno =3D=3D EAGAIN));
> +        size =3D qio_channel_read(ioc, (char *) &payload, hdr.size, NULL=
);
> +    } while (size =3D=3D QIO_CHANNEL_ERR_BLOCK);

Same question here.

--MIuVGyLk4znvSjFm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBHkYEACgkQnKSrs4Gr
c8gGGgf/YuF+2GYgiE/5kG61UHxg6A5wbV/xmNm9UFvK72CrQgRRSZIDQGl2K74V
bBEYnpA2lsClkqdgdlcIM77a1HqBxcMstcYHUPSbY0+hlnH1q9rVD7YdytrwRiMj
o2hXbL3pvilYqgGrVbf6BHbXbbglzV8Kk8Scxh+DopFysF+WyNchvbv4jvjYufsT
HT6yXuC9sjrOXMng98zSACyjn4pEyxAwihC3mwZaQC4QdwmEEHGuDt2lWabWibn7
XvvFTmRxVLlX7TClBnnGG5oOHqpGiup7T8knl6p5VVRYxd65md4xcD/7tbSawYDz
u+IhVp5YfkC81FEYAIiD+Hidlw4Fhw==
=JGRN
-----END PGP SIGNATURE-----

--MIuVGyLk4znvSjFm--


