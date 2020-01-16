Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C0113D1E8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 03:10:23 +0100 (CET)
Received: from localhost ([::1]:35338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iruc2-0006gV-1s
	for lists+qemu-devel@lfdr.de; Wed, 15 Jan 2020 21:10:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42444)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iruaj-0005Or-Kf
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 21:09:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iruah-0004pX-UV
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 21:09:01 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:54347)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iruah-0004o4-Jb; Wed, 15 Jan 2020 21:08:59 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47yngD2bSTz9sR0; Thu, 16 Jan 2020 13:08:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1579140536;
 bh=A8CzjItVEQVG/28ImSxm3nZRKrfcapiCgBvREBz2jwg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wu+OI3b7+Hc5ymZizNxNc8dSOw/isPDKDkMWePWA/6MHQt1V5st4OVz90v+LV6+xQ
 bclc+cL3bIFpQfCyhEl4LmZXDdVMIUPeDJXd5b587U8EIMuMIhLCH+Y3uYh7IwsDzE
 O3kEfp3hoUlRdPRFluiI5nPPS8lto7s3OzayIzXc=
Date: Thu, 16 Jan 2020 12:03:06 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 63/86] ppc:pnv: use memdev for RAM
Message-ID: <20200116020306.GH54439@umbus>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
 <1579100861-73692-64-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="svZFHVx8/dhPCe52"
Content-Disposition: inline
In-Reply-To: <1579100861-73692-64-git-send-email-imammedo@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--svZFHVx8/dhPCe52
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2020 at 04:07:18PM +0100, Igor Mammedov wrote:
> memory_region_allocate_system_memory() API is going away, so
> replace it with memdev allocated MemoryRegion. The later is
> initialized by generic code, so board only needs to opt in
> to memdev scheme by providing
>   MachineClass::default_ram_id
> and using MachineState::ram instead of manually initializing
> RAM memory region.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--svZFHVx8/dhPCe52
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl4fxFoACgkQbDjKyiDZ
s5JBOA/9Gk1uHB3MosF6yd0b/fOgdB4g8HIt3ikki1NP6b2kBoT849NnKD5YKedR
5vj8FIXph+0QPI/mMzVR8IJv6lcyLDv24pzc9IC3I5MimyOZpccdJ57x8iE3JvIh
TWWIR89DNxNaE0q5fRfRqTqJR+xzOZqZS1VEaySL/Cd///jOPrA97+WFXbNUSVWs
pC0CVfWldtR7R7jcLxCbcE9eBki4B+DReczlogS/BBmsmk9v1LOmPL58NtPAkdiH
j6HDJyhqWkpESWpRUvKKbBKnep8Ld4ohI6XJOZoiUH8uBDW6MHkN5Y1Fb327dDLN
IkpqEbtpTBtGVefCersgwvSlpLuz8qpOXXtsFpp4yb/0hElpatsa9cCYp60CjByO
EhPyl7oQVrhrevUSpBLqAlwQLpyWhHki8OP9V3NhX2JOmKUuicfIp3S9STaEkTbl
TwEk1eMtERGCiAoiCHuVyZOjPganhMMZE90X6xhFMXWYPMqzfMVBat8Z2iAajiNw
MqFEIbLp9KKT4jFXUXzfqUJh2rVDwN/sno2mdcxICAokbKoUmHYXfIgYDfJyI9aN
ymqPb8ga3FyP7gwmbaPiEU0dpAalwgJnRoItVkj/4ogF+aq5o2Vc+OyLBKGbVUCq
0yuB7KNibh0DC3NS7wZeSGOZgpxV9WqEBtPHd3KquwKRZXZQ54o=
=ow6B
-----END PGP SIGNATURE-----

--svZFHVx8/dhPCe52--

