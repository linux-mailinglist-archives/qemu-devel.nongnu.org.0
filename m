Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BE24021C3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 03:22:09 +0200 (CEST)
Received: from localhost ([::1]:39418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNPoO-0006ew-4y
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 21:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mNPlA-0004nk-HQ; Mon, 06 Sep 2021 21:18:48 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50521 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mNPl8-0007Cs-QR; Mon, 06 Sep 2021 21:18:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630977522;
 bh=MgGyZHf8+WuVn3PBF28ThMO9GZTNanSXClFN44bXUXQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MkNUobHEMjo9Q0o4ERx2y6Nt1g0JqN0TbstcxXDU6SSghUIDKAoXLl77mV7ReQh4o
 aUqEFBdtJqMgS/btGVxrUdA4kS9jRm/y7qsviJPj0e6es5ojTyolC1uc4Q2M7oQdUk
 /c4lEeQL86cMRZXHkYYA+dn+uVYK5K/4EgTPsHiU=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H3S8L5VNVz9sW4; Tue,  7 Sep 2021 11:18:42 +1000 (AEST)
Date: Tue, 7 Sep 2021 11:17:21 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v8 0/7] DEVICE_UNPLUG_GUEST_ERROR QAPI event
Message-ID: <YTa9oUveYwTjtaBm@yekko>
References: <20210907004755.424931-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="n+/NsTiAxC57yI7D"
Content-Disposition: inline
In-Reply-To: <20210907004755.424931-1-danielhb413@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--n+/NsTiAxC57yI7D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 06, 2021 at 09:47:48PM -0300, Daniel Henrique Barboza wrote:
> Hi,
>=20
> This new version amends the QAPI doc in patch 5, as suggested
> by David and Markus, and added all reviewed-by and acked-by
> tags.

I've staged this in the ppc-for-6.2 tree.  Obviously it has some stuff
that isn't purely ppc related, but I'm figuring that should be ok with
the acks from Igor and Markus.  Let me know if there are any
objections.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--n+/NsTiAxC57yI7D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmE2vaAACgkQbDjKyiDZ
s5InQA/6AjEQL8pfg7t33OltmvUB1GXv78sy/sqZebCL4RW5L8mspKrU84boPZ3e
/qBzyqX20Qeyjb4QRxet6T/NqMefR+7KDflbzAn2aNXzyeJz/LB7urtx2coYyZXS
Cka6CpypWzr64TPp6op1MZN/KC5q3/GUPAsnvEJ3vZGhr/ATq4yjl9Qus5ZRbVmx
T2KxzEi02bnIrMdEZv7qek3xb5AmkOCyBCd9rngbhkVwt9mRNqRDbcq4bQpENN1r
vOCbJMjO/Z9SCvj/f1IlzuXneF6JFf/R1XzTegbTljf7yvzxJo/JW0Q/4Q2VQL8Z
eeOFTqrNgNj7DunVIRwl+pRHLTS+1JOAcjwJrIwxxXxASzkg9ZfXfXfh4gJbxWvT
wHWrJDRqHdgNCSI7pTJxV0AcTuFfHHLq/E+1LOiKGFh5zlz9oFQXSHJ5MC8Ju3Ej
WBHAdVraDZLWAybfFNznf5PgRLgAWyJuu/c9l6P7a5Z9T3a9gayqQA++Co3pDvLi
ibs4h6henF/4JXsOF4eySL3afc/FrCuWpbGdvsewsvZ3PWfeUMRV+YbuwuwBvOyT
A1l16VVn7YBv77Ue4nZSYG22wI9RIpKZyXytCH067f9hKwytWGZLsR9RFZG9aL4R
roS5OYhmcstOQcMfIAgP8OG7FoLuT7NHripQ1LzonoJTa4hUg4M=
=DIMq
-----END PGP SIGNATURE-----

--n+/NsTiAxC57yI7D--

