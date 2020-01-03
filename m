Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45F912F6E4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jan 2020 11:53:19 +0100 (CET)
Received: from localhost ([::1]:50788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1inKZy-0003DU-Uu
	for lists+qemu-devel@lfdr.de; Fri, 03 Jan 2020 05:53:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55812)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1inKYj-0002Mv-RM
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 05:52:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1inKYi-0005uR-PS
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 05:52:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56325
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1inKYi-0005rh-JW
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 05:52:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578048720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HfoMrwYSSL5Cf4VvxvJvIKA/g3MRF7YdIi4SQWLB8Fw=;
 b=LvYIrh2a4vZeAfnN1wO2uXHzA6WZ5krNBfQ5+9K/WOPMj5DEK2Wwtvx1s4Xzd75RgpAL0x
 aGNOzoIoTllG1BFH9Xei8OKRWILOwy2DxWOuXAuswSoeTw/K/mNqEXS8r9stZJH5FVBvl4
 VVVH3b/OLSJz2w0whkg5Cjg894Zeamw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-wMc3KmLhOlWnV9PZp9CSBw-1; Fri, 03 Jan 2020 05:51:59 -0500
X-MC-Unique: wMc3KmLhOlWnV9PZp9CSBw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6E8E8024D7;
 Fri,  3 Jan 2020 10:51:57 +0000 (UTC)
Received: from localhost (ovpn-116-102.ams2.redhat.com [10.36.116.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B530808EE;
 Fri,  3 Jan 2020 10:51:54 +0000 (UTC)
Date: Fri, 3 Jan 2020 10:51:53 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Oleinik, Alexander" <alxndr@bu.edu>
Subject: Re: [PATCH v6 08/21] tests: provide test variables to other targets
Message-ID: <20200103105153.GD130240@stefanha-x1.localdomain>
References: <20191129213424.6290-1-alxndr@bu.edu>
 <20191129213424.6290-9-alxndr@bu.edu>
MIME-Version: 1.0
In-Reply-To: <20191129213424.6290-9-alxndr@bu.edu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eqp4TxRxnD4KrmFZ"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "bsd@redhat.com" <bsd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--eqp4TxRxnD4KrmFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2019 at 09:34:44PM +0000, Oleinik, Alexander wrote:
> Before, when tests/Makefile.include was included, the contents would be
> ignored if config-host.mak was defined. Moving the ifneq responsible for
> this allows a target to depend on both testing-related and host-related
> objects. For example the virtual-device fuzzer relies on both
> libqtest/libqos objects and softmmu objects.
>=20
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> ---
>  tests/Makefile.include | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

I've checked that "make check" is still happy when the x86_64-linux-user
target is configured:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--eqp4TxRxnD4KrmFZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl4PHMgACgkQnKSrs4Gr
c8iIBAgArQ6DfOsZTOq1UJ2N8nPNBjwBCaI9hBhV801iUcHgJxRl/K/0xP2SwtFj
zGxN4vMjNr7xCQ0+LDVaeB5aQ3Ww1rcEC3wEeB1u8znOgUuG2shDNkdp+E0G/TAV
C/v/66g/kQ1qoBn/cd5uJyVNGQ4N3zwZRp2TmR0lRv77OPSzyMcXDS8LimUiGCvJ
w4b+TzYr/7JvgCqpXeUfg8mKWnni9LxJhtdxpBCC4RjsdNwtm8qsVxQUCcv1S0fZ
QGFwIjpl75HBcBSFASgKkEGUhhi7PrHBK0bq2yRkubSm+rylGahInBjo4jbXXVzB
CgUWBAIGtFhb1k9zXXjXfqsH0e6kOg==
=4hpS
-----END PGP SIGNATURE-----

--eqp4TxRxnD4KrmFZ--


