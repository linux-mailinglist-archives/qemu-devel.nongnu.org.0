Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 009276E856
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 18:00:16 +0200 (CEST)
Received: from localhost ([::1]:46604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoVIt-0005Ic-6K
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 12:00:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37372)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@redhat.com>) id 1hoVIb-0004tB-9c
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 11:59:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1hoVIB-0002WU-W6
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 11:59:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45914)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>)
 id 1hoVHT-0000Jx-AV; Fri, 19 Jul 2019 11:58:55 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F35DF7574F;
 Fri, 19 Jul 2019 15:54:21 +0000 (UTC)
Received: from localhost (ovpn-117-223.ams2.redhat.com [10.36.117.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 161485D978;
 Fri, 19 Jul 2019 15:54:11 +0000 (UTC)
Date: Fri, 19 Jul 2019 16:54:11 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Aarushi Mehta <mehta.aaru20@gmail.com>
Message-ID: <20190719155411.GJ24412@stefanha-x1.localdomain>
References: <20190719133530.28688-1-mehta.aaru20@gmail.com>
 <20190719133530.28688-15-mehta.aaru20@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="I/5syFLg1Ed7r+1G"
Content-Disposition: inline
In-Reply-To: <20190719133530.28688-15-mehta.aaru20@gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 19 Jul 2019 15:54:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v6 14/14] qemu-iotest: enable testing with
 qemu-io aio options
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
Cc: Fam Zheng <fam@euphon.net>, Maxim Levitsky <mlevitsk@redhat.com>,
 qemu-block@nongnu.org, Sergio Lopez <slp@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, saket.sinha89@gmail.com,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefan@redhat.com>,
 Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--I/5syFLg1Ed7r+1G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 19, 2019 at 07:05:30PM +0530, Aarushi Mehta wrote:
> Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
> ---
>  tests/qemu-iotests/check     | 14 +++++++++++++-
>  tests/qemu-iotests/common.rc | 10 ++++++++++
>  2 files changed, 23 insertions(+), 1 deletion(-)

So far this patch affects qemu-io only.  That's a good start but more
can be done.

Taking CACHEMODE as an example, there are other places where the
parameter can be added.  The main one is qemu -drive options but
qemu-img could also use AIOMODE.

Please add an aiomode variable to the iotests.py module (see how
cachemode is set there) so that Python tests can use the the value set
on the ./check command-line.

--I/5syFLg1Ed7r+1G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl0x56IACgkQnKSrs4Gr
c8i25ggAtk7fpv+Zu82jYIL2fNiIFK6ruMaRPugetYWBKQ1+y6ij7y+BRr0GPonZ
60ETWNAGY6jJLKJtgvNdkq4GjAv/oJwRjMsGvOipDR1R9bNcpTPxmUvGMF7awNp4
yl1tyF1VEecLLyghnomXCR2cUD34ghM3WP7TuNczrrwWhfPu3ysV6t2oRHR2eQvK
qQKMtAwtvag+0DNtXWKqVlH/8dxxuDZRP+HRyje9NQ8btanm+h/S8DiarmmKD0mX
3cb9p7/4RAws86ZlTdBeEskckw+4/w4ojaTsPTwjonvZESZNs3T+NxUSE/BUJSgF
vWFIAibkyRDkhxEoHp0bPzl7KocenQ==
=FslS
-----END PGP SIGNATURE-----

--I/5syFLg1Ed7r+1G--

