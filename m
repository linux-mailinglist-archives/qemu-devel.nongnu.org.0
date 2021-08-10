Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6012A3E51F5
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 06:21:40 +0200 (CEST)
Received: from localhost ([::1]:44628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDJGl-0003RH-Cu
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 00:21:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDo-00081x-Jj; Tue, 10 Aug 2021 00:18:36 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:40381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJDk-00029A-SO; Tue, 10 Aug 2021 00:18:36 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GkKSR1fBbz9t4b; Tue, 10 Aug 2021 14:18:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628569095;
 bh=G0e9woNcVtr6mSZZec1NwDtj0HRAndadoFC3B93YfnY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kYeInJ1bDXamdr5tiwXzT4Z5YkFz1axcxmlGmQqpVdu+Rmh+wduigV7AD89BT1pnL
 CjS0UIXA5IKYcgyk1Geks1CTdad8/ZlZqUhScOVZpf13TvTt+p4ZHlj/YjwJwzFICm
 Koaqa5vcV2NoHFNjW7Q+F0gziZ3xjF170f+ekGQ4=
Date: Tue, 10 Aug 2021 13:07:49 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 00/26] ppc/pnv: Extend the powernv10 machine
Message-ID: <YRHthQVH27VuyQCU@yekko>
References: <20210809134547.689560-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="chr33i6oSXkVZam3"
Content-Disposition: inline
In-Reply-To: <20210809134547.689560-1-clg@kaod.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--chr33i6oSXkVZam3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 03:45:21PM +0200, C=E9dric Le Goater wrote:
> Hi,
>=20
> This series adds the minimum set of models (XIVE2, PHB5) to boot a
> baremetal POWER10 machine using the OpenPOWER firmware images.
>=20
> The major change is the support for the interrupt controller of the
> POWER10 processor. XIVE2 is very much like XIVE but the register
> interface, the different MMIO regions, the XIVE internal descriptors
> have gone through a major cleanup. It was easier to duplicate the
> models then to try to adapt the current models. XIVE2 adds some new
> set of features. Not all are modeled here but we add the
> "Address-based trigger" mode which is activated by default on the
> PHB5. When using ABT, the PHB5 offloads all interrupt management on
> the IC, this to improve latency.

1..4/26 applied to ppc-for-6.2, continuing to look at the rest.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--chr33i6oSXkVZam3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmER7YQACgkQbDjKyiDZ
s5IMERAAiUFgfrSlEi8Xkd3NNdzOrI3yCZ+4mcEsvVoZsd2KFGNkWNnYhy8RamXg
SHxDcqAqNOj1sbNgH6+m8DjqpCMw7/fdOdzWBGTBE+wp3DU3Ip3mtt3bY4iITG44
IIg1+RbSHdHVrt/LKrZZG9jpIgFr5/iJ5kL8+z8QjyrJvtn8U9G6W5O21lGfvp1g
OTL/uGR+7gvSpyRvJx5SeRn6mgqyw+gn3NmAsh9iNEJJytAfOQ2aT9u0UFSYYkia
O7UtDZsjwLnFyy5/uIMMjXSDPqT2VHNSByBmiq8ffx4jgwshkatvCWvYWofJlgiz
i8jMSiohrHCHPg/Z4FHBol10CowNZ2CL7k/Vu0EV7wVxHHTcED1gh78oXe0USYm9
WuoKFSKhZNo809aY6nm4jI95BX79WHYCRU1rjny3D/f/7qlu5IiyI/klI0voOy6v
am0FrCYhA87BFvoZ9wWOr47vVrbkRPcWDQv09fcsN4UaPkuUdbNGt3ySo9snCdmB
ApvLp/fQH4gi+FmPx196bcuKz42pSQUl0Nb7urlAkKvBMwCbUGGgmXhbLuMkzA0l
LhTodrgpRlZ9RKy2ii2CXNGFlNqHSAx2bmNyyTPlgdfne8RT+sdSaYTt/R1el3dw
0Du3BvdtYiLKUXJXukjOb4vWWJYUCDT6N2nN8xh8J2uJKEns1/w=
=bCNd
-----END PGP SIGNATURE-----

--chr33i6oSXkVZam3--

