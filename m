Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3C937387B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 12:19:54 +0200 (CEST)
Received: from localhost ([::1]:38950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leEdG-0000Dv-0d
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 06:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leEag-0005xq-WC
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:17:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1leEaX-0003qN-UJ
 for qemu-devel@nongnu.org; Wed, 05 May 2021 06:17:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620209825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3e3cCLx+RIcMeYczPr3h5ienhxGGJkXVbKN5k5ZxvLA=;
 b=MUCOvED0zmcGz3/Q+jLWNsMDnf8gALGZE7yR73k6U23lHVYDDm6DJOZfaklX98H5XdcQrQ
 3JcuFsVIy/QISwVhCmbyIAKDw4/N5fVQRtzjC8nSluN+pRhlWl+utAqPEWXXMLky4l4x2Q
 e2etO5cB2voHUDoCTO+ZHDr5gtq/oek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-boLGvY8VOfO3MQJtjQXvyQ-1; Wed, 05 May 2021 06:17:01 -0400
X-MC-Unique: boLGvY8VOfO3MQJtjQXvyQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 589E41922036;
 Wed,  5 May 2021 10:17:00 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 891EF5D9DD;
 Wed,  5 May 2021 10:16:55 +0000 (UTC)
Date: Wed, 5 May 2021 11:16:54 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [for-6.1 3/4] virtio-scsi: Set host notifiers and callbacks
 separately
Message-ID: <YJJwlmmtj2SslG9z@stefanha-x1.localdomain>
References: <20210407143501.244343-1-groug@kaod.org>
 <20210407143501.244343-4-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210407143501.244343-4-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mHXb49xCqRYFjfMm"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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

--mHXb49xCqRYFjfMm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 07, 2021 at 04:35:00PM +0200, Greg Kurz wrote:
> Host notifiers are guaranteed to be idle until the callbacks are
> hooked up with virtio_queue_aio_set_host_notifier_handler(). They
> thus don't need to be set or unset with the AioContext lock held.
>=20
> Do this outside the critical section, like virtio-blk already
> does : basically downgrading virtio_scsi_vring_init() to only
> setup the host notifier and set the callback in the caller.
>=20
> This will allow to batch addition/deletion of ioeventds in
> a single memory transaction, which is expected to greatly
> improve initialization time.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  hw/scsi/virtio-scsi-dataplane.c | 40 ++++++++++++++++++---------------
>  1 file changed, 22 insertions(+), 18 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--mHXb49xCqRYFjfMm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCScJYACgkQnKSrs4Gr
c8jvTAgAslhal3XZdodfIBNLEy6StZz37wAoJykMt3zDlhBuYIUWO99jppZvxF+h
98pDjA2fYppAidV36aBnBmeoDV7ytUxL/qAmRRja49YJdyj951ae8Dt6LNv/pj4/
a9Tzwn2LZj2+YeBig+Y+O4FIehZ+TLv73nPjADRG0zSlTVscBNC1Ab8zQHNAuwgm
EsdrYksi5ZiJFIOCaV1jozETkUHihfD28LgC8/SfCGYwui7DI7RTUTGFju2N/c+Z
0z5TPiVKxxf719q1YJ3R/Lw0pvIbmF+Mu28T2K9QLS01bhtWeHO8DBSepq6XZsMX
zoLXDLec4qDeBsZYX1dGgDHUsw8hHA==
=mOmJ
-----END PGP SIGNATURE-----

--mHXb49xCqRYFjfMm--


