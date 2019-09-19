Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A97B779F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 12:42:28 +0200 (CEST)
Received: from localhost ([::1]:42218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAttL-00011G-DF
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 06:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53448)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iAtj8-0006dK-Ts
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 06:31:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iAtj5-0004sp-6G
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 06:31:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:22065)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1iAtj5-0004sd-0S
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 06:31:51 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 56A4F307D853;
 Thu, 19 Sep 2019 10:31:50 +0000 (UTC)
Received: from localhost (unknown [10.36.118.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E551660BF1;
 Thu, 19 Sep 2019 10:31:49 +0000 (UTC)
Date: Thu, 19 Sep 2019 11:31:48 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Oleinik, Alexander" <alxndr@bu.edu>
Message-ID: <20190919103148.GL3606@stefanha-x1.localdomain>
References: <20190918231846.22538-1-alxndr@bu.edu>
 <20190918231846.22538-10-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="w2xx78T4DcG3O+DJ"
Content-Disposition: inline
In-Reply-To: <20190918231846.22538-10-alxndr@bu.edu>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 19 Sep 2019 10:31:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 09/22] qtest: add in-process incoming
 command handler
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
Cc: Thomas Huth <thuth@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "bsd@redhat.com" <bsd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Laurent Vivier <lvivier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--w2xx78T4DcG3O+DJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2019 at 11:19:36PM +0000, Oleinik, Alexander wrote:
> The handler allows a qtest client to send commands to the server by
> directly calling a function, rather than using a file/CharBackend
>=20
> Signed-off-by: Alexander Oleinik <alxndr@bu.edu>
> ---
>  include/sysemu/qtest.h | 1 +
>  qtest.c                | 7 +++++++
>  2 files changed, 8 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--w2xx78T4DcG3O+DJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2DWRQACgkQnKSrs4Gr
c8iGCAgAtbOy/VcYDSKFw6TmxZnUw8rHquXf7woRJ2ROhIEJM8R2mryUk056Zmon
cMKD+Fnkh9h09wjrd9uiU/yUYkzUzW4h6Mrr1wFj/VpvYhneq9TvN9dQB8SPwE+i
PwOUMpdtWXsAGi/1DwLrk7BbD23raMN2xp0UN9/7ldzvHq7avVg+evmYHm2706iE
YNCn+FuZO19grZMb9OeuGzs7JrPEl4KMPOt+cTM2WGE8QkGMq7Sbyb2064acbafY
aZXYyDNZjbqPLeJ76UUattn2CSuxqQXkOJf2zQJd7UPI7P6S3rkPkAU6N71mzQwm
3ZIxn5wtgrmvvq5QD0XAqlkU7SuUoQ==
=pUkg
-----END PGP SIGNATURE-----

--w2xx78T4DcG3O+DJ--

