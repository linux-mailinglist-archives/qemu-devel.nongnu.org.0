Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F935A8759
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 20:58:01 +0200 (CEST)
Received: from localhost ([::1]:36404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5aTg-00023x-27
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 14:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34537)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1i5aOS-0006JD-M3
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 14:52:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1i5aOR-0005bu-Py
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 14:52:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38444)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1i5aOR-0005ba-KB
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 14:52:35 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EE3ED1DAD
 for <qemu-devel@nongnu.org>; Wed,  4 Sep 2019 18:52:34 +0000 (UTC)
Received: from localhost (ovpn-116-88.ams2.redhat.com [10.36.116.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8301560BFB;
 Wed,  4 Sep 2019 18:52:34 +0000 (UTC)
Date: Wed, 4 Sep 2019 19:52:33 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20190904185233.GJ26826@stefanha-x1.localdomain>
References: <20190904130047.25808-1-thuth@redhat.com>
 <20190904130047.25808-3-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/0U0QBNx7JIUZLHm"
Content-Disposition: inline
In-Reply-To: <20190904130047.25808-3-thuth@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Wed, 04 Sep 2019 18:52:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 2/6] tests/libqos/e1000e: Make e1000e
 libqos functions independent from global_qtest
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/0U0QBNx7JIUZLHm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 04, 2019 at 03:00:43PM +0200, Thomas Huth wrote:
> libqos library functions should never depend on functions (like memread(),
> memwrite() or clock_step()) that require global_qtest to be set, since
> library functions might get used in qtests that track multiple states, to=
o.
> Thus let's replace the global_qtest-related functions with their independ=
ent
> counterparts.
>=20
> Reviewed-by: Laurent Vivier <lvivier@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/libqos/e1000e.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--/0U0QBNx7JIUZLHm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl1wB/EACgkQnKSrs4Gr
c8ikFwf/SGusm73C0JIBIPQ/rh/fNDgcIrwVfRqukXDSeHYgl08AgnrP0aD7fFEe
yDgvq3e64XS4y2Rc2cBSMlBHQmY0NdAouh0YZAaE891fCsnhEFbJ0EL/yfsO7hQy
T7h0KsOsArnVdCEex1mOND0Vz3WLIJm7A+zVhekjl2UXvDo8ZxFEk0Qi6GsIXbOF
uJWJom5Dnjw6le4pl+cgskdrOrrN2+2oFv2K60CGCALcKv8hI0e3LtfnEzhVRNf7
TjZKEgZ1ojuE4obrgF9nOKDTWFo1S9wM5nj7fe5ur53Z+tsRySEHFP3NIuhh4OBv
lPJS1Cmb15ffamvlMHl6/rUvRbkFwA==
=0iMs
-----END PGP SIGNATURE-----

--/0U0QBNx7JIUZLHm--

