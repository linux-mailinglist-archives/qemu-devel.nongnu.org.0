Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ED92CBFA2
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 15:29:46 +0100 (CET)
Received: from localhost ([::1]:40168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkT8b-0000N4-AS
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 09:29:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkT7a-0007uj-5q
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 09:28:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kkT7W-0003we-Am
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 09:28:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606919317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BFmYu+9lsyv3PtpA7SgFAJIADTG7mNokDIMQaLGdLL8=;
 b=JrNYklKhykvtFaA7i6eJdFMxJad1LC8TyCVt1HqmyQrn1Kye3hTFGVqVznd2EJO58HqODy
 RYuq2Bw5qDLWIIQd8LnrvZTY6VB8gypDSU6PKOTUNPb7gTphzcL+UWMrxZ3nYzUaWBkFIL
 nHCUAKk+VFctghwww8gct4QYuiC1q2Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-gDzs33mbPrWGaLVsBeOTsw-1; Wed, 02 Dec 2020 09:28:35 -0500
X-MC-Unique: gDzs33mbPrWGaLVsBeOTsw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97FEE101E98C
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 14:28:34 +0000 (UTC)
Received: from localhost (ovpn-114-255.ams2.redhat.com [10.36.114.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CD8719C47;
 Wed,  2 Dec 2020 14:28:26 +0000 (UTC)
Date: Wed, 2 Dec 2020 14:28:25 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v2 7/8] libvhost-user: add a simple link test without glib
Message-ID: <20201202142825.GI655829@stefanha-x1.localdomain>
References: <20201125100640.366523-1-marcandre.lureau@redhat.com>
 <20201125100640.366523-8-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201125100640.366523-8-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gTY1JhLGodeuSBqf"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--gTY1JhLGodeuSBqf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2020 at 02:06:39PM +0400, marcandre.lureau@redhat.com wrote=
:
> From: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> ---
>  subprojects/libvhost-user/link-test.c | 45 +++++++++++++++++++++++++++
>  subprojects/libvhost-user/meson.build |  4 +++
>  2 files changed, 49 insertions(+)
>  create mode 100644 subprojects/libvhost-user/link-test.c

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--gTY1JhLGodeuSBqf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/HpIkACgkQnKSrs4Gr
c8jJAwf+Lm64PL/guFR81JJjjXe/mMTWL2HfxT6qhGPptpw2EZL8DvixtHAHmBqN
Xj9a1Kw/8Zvjmd4pTYnVc3O+AMr3HiQMwWdtR3dwsX+mFuD/HHrBeVJcscZ7RQuV
8NG53KefRmQI+XJcV62iwv35to8EA3ewkbyv/C5zAbzOZKz5IcyO7SJmRiTheRi+
9xqvPLfl+z+Eooud7Owhgoap9aOh5kbw9Sx+kq2QGCa5v/9Du0oLxs+IZdvDJ8y8
m50BnWRHh5cKJ5cw2Kk1JH1DH683fY3e3Gz7MMqh1m+NqwX5HPIGWeLHojVqc8ge
UWivOm8wGZv+Ptari7kSoTEQGbAmzg==
=wCaQ
-----END PGP SIGNATURE-----

--gTY1JhLGodeuSBqf--


