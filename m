Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B6C31995D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 05:55:24 +0100 (CET)
Received: from localhost ([::1]:50946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAQUF-0000g7-NR
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 23:55:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAQSx-00009H-UZ
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 23:54:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAQSw-0006wW-9N
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 23:54:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613105640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mYcL1VSc+s2rG77z2dkN4p5q1bLj9JoXoMG6QBAUMvo=;
 b=XaqX9d6UGwKXm0awyP8fizjiwQQeXV9OUzgKHIL4gN0/GeTIl19pUPMZ8VUz6w8okNDkz1
 py4BKZ2yd19fkNFv8xcNtbjGymmfLa0rYHYXq2Xc8uiANcPoq+sk0kGJ1QgtJg52SSLXi7
 er5uwN5qZqTHUE3148vE/huVwdkji24=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-oCIzjzMxO0KN8Bo6qcpiTA-1; Thu, 11 Feb 2021 23:53:57 -0500
X-MC-Unique: oCIzjzMxO0KN8Bo6qcpiTA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A6A5C280;
 Fri, 12 Feb 2021 04:53:56 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-146.rdu2.redhat.com
 [10.10.112.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5ED56F7ED;
 Fri, 12 Feb 2021 04:53:50 +0000 (UTC)
Date: Thu, 11 Feb 2021 23:53:49 -0500
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 02/24] iotests/297: add --namespace-packages to mypy
 arguments
Message-ID: <YCYJ3RwlGLrmnwHX@localhost.localdomain>
References: <20210211185856.3975616-1-jsnow@redhat.com>
 <20210211185856.3975616-3-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210211185856.3975616-3-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wILVqNqk61wgS/9q"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--wILVqNqk61wgS/9q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 01:58:34PM -0500, John Snow wrote:
> mypy is kind of weird about how it handles imports. For legacy reasons,
> it won't load PEP 420 namespaces, because of logic implemented prior to
> that becoming a standard.
>=20
> So, if you plan on using any, you have to pass
> --namespace-packages. Alright, fine.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/qemu-iotests/297 | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--wILVqNqk61wgS/9q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAmCdoACgkQZX6NM6Xy
CfMaLRAAt3Yt25OZx9KI93Zrdyb4JRTtlhY2D5kCMe1O3rvFtoEocTf+a6v5eXtq
g1Cipylwa84G9W6ztA1YSzNwNmu7WLx1Xc6FNhNnCFUtx7bxlHCwLwm41zrE98zz
GjdXuNHOdXHCmq7AH45CB80EpllW6H6ANGyZdgPFyX/McY+8Ru5pz8bLQ7jh0ULo
jwIinTNpy3SKvcLns1vsAJ09B9dmf4wHVa5lS0TyWt3UmCKDtoQApT0ee10x68ce
TAoIcI0JgQjVzEBh6f+mUfQVh0MrtbTlxpDLcKfWojbXf3974CBqLHkxqHtU7n/Q
CJvb1/yuOL+z67uoivxuRBGnqUmufH2twUxqiou+Jg3fnUJ6mxjgkrVWoqMkHpFU
av5TEuG9xT672HaGaqi4tXvC9RkHAo6I8A01N5p2Si90xezV+JwCJbuwhz+Px4+w
dPukED3T0/nZqZL1svrhtJOjJm9t3wPhlq9hm/rW/htbCca/VthATCsJ2m06z9cR
zt/nt2w9AHgoaCT/ZPKtHD4c8c28mmXZn1pQ+Di7XqAGFDFq6pFeZWl4CUSJ50jX
aLgfxn3xbvh2Fgmi3H/C2mv+MISeHoAmbAGYn+HsWVsUHHOCchDgBTlCbIMKRnpy
QjnGZG9pRmEpNH8NxcuwPt9RPIYuJEzJBOx4WlfyIfDZF7KrA+8=
=BeOx
-----END PGP SIGNATURE-----

--wILVqNqk61wgS/9q--


