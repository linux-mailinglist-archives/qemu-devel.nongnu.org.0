Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5CBAF680
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 09:14:40 +0200 (CEST)
Received: from localhost ([::1]:47256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7wpp-0007mu-Td
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 03:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42420)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1i7wan-0000ZS-Nb
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 02:59:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1i7wam-0001Lh-Nf
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 02:59:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34728)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1i7wak-0001JQ-BR; Wed, 11 Sep 2019 02:59:02 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AE7F2197BCE0;
 Wed, 11 Sep 2019 06:59:00 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-182.ams2.redhat.com
 [10.36.116.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2089A6012A;
 Wed, 11 Sep 2019 06:58:58 +0000 (UTC)
Date: Wed, 11 Sep 2019 08:58:57 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20190911065857.GB4907@localhost.localdomain>
References: <20190910185839.19682-1-thuth@redhat.com>
 <4ce671ea-452b-39ac-ea2e-83b9d75a3b84@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="z6Eq5LdranGa6ru8"
Content-Disposition: inline
In-Reply-To: <4ce671ea-452b-39ac-ea2e-83b9d75a3b84@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Wed, 11 Sep 2019 06:59:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [Qemu-block] [PATCH 0/7] Move qtests to a separate
 folder
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--z6Eq5LdranGa6ru8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 10.09.2019 um 21:07 hat Eric Blake geschrieben:
> On 9/10/19 1:58 PM, Thomas Huth wrote:
> > Our "tests" directory is very overcrowded - we store the qtests,
> > unit test and other files there. That makes it difficult to
> > determine which file belongs to each test subsystem, and the
> > wildcards in the MAINTAINERS file are inaccurate, too.
> >=20
> > Let's clean up this mess. The first patches disentangle some
> > dependencies, and the last three patches then move the qtests
> > and libqos (which is a subsystem of the qtests) to a new folder
> > called "tests/qtest/".
>=20
> I'd also welcome a rename of tests/qemu-iotests to tests/iotests.

I might prefer if the directory were named "iotests" rather than
"qemu-iotests" if we were only adding the code now.

However, I'm not so sure if I'd like a rename now because a rename
always comes with a cost and the benefits are rather limited in this
case.

Kevin

--z6Eq5LdranGa6ru8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJdeJsxAAoJEH8JsnLIjy/WqzgP/RUU5lqcOtlRGZ7PhR88wkxS
K9Y8KyEx3IKjRYpVlxm6mNPrMd9vhfkZb4ZX/s4OyKzUyc2s3lFoPCk5wJ+MOKc1
Xi+K+qvAzHKxrQnC/LeVTeVjtpf9Ge7CZ5OkXh5867BrtHGACwJ41A+er/KFur8O
auc0fr6jcaT/3teY+BQS2YbdH1DPfuOnndm2YN/BWA/x3FdIb2fmRw3VXCpRF0Ps
Xlz0qOCJd/7O7lnT7iJ7GRuyB8KybskMPaA7R6uI8s58EjaPcL3WrL7eTVzCQ79W
EHjt64oub+wzBKSGVibN1BczC2lf+JxJGRH80DqC612EY3b1JIUnZA1zmI9nAu2m
nWdH2XAUW90j/j9Xz7zC224NrDsb5MWHLD0WPtvJhw7ebGMCgEZB/N+2vB0FKuvY
4dfEoYgH3tgHjfVokIwU2X5g2T7ToPJO4wj+dmhiGDWqZQ3/ctdo+MPqgm9TKbVz
w/TGJd83LVQTUKFALVormIIwbK+IB28xwiBsKtZiarPbVHVSD/3NqtOcV3iBXCv7
d8BTmsEGOutPU70SUKqHPtvKefJTV/PsAF4DFktv0M3Cy+YF2jGTLhPR4qprgHsO
7xB9IYwBm6FVqmG+wXk2H6YxjtGqY+D/LoBEIVsJjBY7lulZ+FqwDWu85EsJJh1M
JCcGXaEJf+kpGKCBzquw
=aBMQ
-----END PGP SIGNATURE-----

--z6Eq5LdranGa6ru8--

