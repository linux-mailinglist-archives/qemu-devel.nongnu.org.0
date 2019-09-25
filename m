Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CADCBBD659
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 04:22:16 +0200 (CEST)
Received: from localhost ([::1]:44766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCwwZ-0001rH-Az
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 22:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40423)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iCwur-00017x-OF
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 22:20:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iCwup-0000OV-CO
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 22:20:28 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:56979 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iCwum-0000Mu-Sa; Tue, 24 Sep 2019 22:20:27 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46dMGW4Nhpz9sP3; Wed, 25 Sep 2019 12:20:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1569378019;
 bh=qL7RBYlQRnQ7sCSAS7qbQF60rGqnntjZvuVJEW/sdWg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cow47ewbYyIlxwvXcdZ/MOIW65IoPktDma9GL8TMGoKmW5Pz4jFqv42kvrLNhCRKO
 xx7vAcqiFah4gV2UhhKlQJxDpRfWCU3hYWHXOaIrXIBGDtfgA6GvMh+BN2Ar26ikMm
 lOkT7RMZ+jwuQsbo7HkrDqiEnnvBgWN3Y7TiU1oU=
Date: Wed, 25 Sep 2019 11:46:53 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 4/4] xics: Merge TYPE_ICS_BASE and TYPE_ICS_SIMPLE classes
Message-ID: <20190925014653.GK17405@umbus>
References: <20190924045952.11412-1-david@gibson.dropbear.id.au>
 <20190924045952.11412-5-david@gibson.dropbear.id.au>
 <9636ac3a-f0db-7fb8-cb5d-a4a2b83479b5@kaod.org>
 <20190924114124.GC17405@umbus>
 <5dca1aae-65d9-c972-e8a8-9d5b8f016c75@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dxRQSzdsN/lOP445"
Content-Disposition: inline
In-Reply-To: <5dca1aae-65d9-c972-e8a8-9d5b8f016c75@kaod.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 gkurz@kaod.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--dxRQSzdsN/lOP445
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2019 at 04:06:02PM +0200, C=E9dric Le Goater wrote:
> On 24/09/2019 13:41, David Gibson wrote:
> > On Tue, Sep 24, 2019 at 07:31:44AM +0200, C=E9dric Le Goater wrote:
> >> On 24/09/2019 06:59, David Gibson wrote:
> >>> TYPE_ICS_SIMPLE is the only subtype of TYPE_ICS_BASE that's ever
> >>> instantiated, and the only one we're ever likely to want.  The
> >>> existence of different classes is just a hang over from when we
> >>> (misguidedly) had separate subtypes for the KVM and non-KVM version of
> >>> the device.
> >>>
> >>> So, collapse the two classes together into just TYPE_ICS.
> >>
> >>
> >> Well, I have been maintaining another subclass for the PHB3 MSI=20
> >> but it has never been merged and it will require some rework.
> >=20
> > Well, if you did do this again, is there an actual need for it to be a
> > subclass of ICS_BASE, and not ICS_SIMPLE?  AFAICT the merged ICS class
> > should be fine for pnv as well.
>=20
> the reject resend handlers might be an issue. Anyhow, let's merge this=20
> cleanup. PHB3 has been out of tree for too long.

Hrm, are you sure.  I remember thinking the other day "whatever
happened to that PHB3 patchset?".  Is it actually broken, or has it
just been a long time since it was posted, and therefore been
forgotten by me.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--dxRQSzdsN/lOP445
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl2Kxw0ACgkQbDjKyiDZ
s5KgxA//fPUov1dN1hvMhkBp0dMW+jhsJMvz+a+TwSwjQiOMgwtZpyZv/oODRHJ2
7zk/ZwODbeIQs8JuE7K7FXhK/DT6BYA4EUM9hbCqoD7cSq+KaTdm0sZue1+bkZlf
kkUOI+bGxqmIh9AZF42hQkyvMKBbGYMvQPuqGcTosGeBtT9MfQvEAHZh9+0C1/mn
2uC9DDLXicSHk043uYm5ibKk/quPFHCRU3wJBpJep1orJ4uHpsdJz2aLCapC9QGD
2KyLp80P3JT0LdIl1MeoTebvf25WxNK4ojVnej8/9P2+/HoSC0MdgyAxL4wJbsHx
MiiLZdVUQIvGDNc3ytcWp4nLtS5P0VtA8JK5lDbSBVkv/2j5aEpDlFcQTCxrcZkp
5eapntrGTInhcB9tw2NFoY/TKNQHF17qDZqkruw3+OWJsMTnCsJBOPLfHxEC7wG0
OkQp2g0U4zC6lVBOAFc/jkzfg3Rupgf4Fvk0QvryYuU3A3v9azCqLWQqbs4GRe9s
OOSn3P/Z//CEdl/6EzpKFr+Iqw9VfPkNSQFhKyysN5Nfr0lgcbofQCEXHC/Np9D+
UDNfWWisXPiN1WpYcf4d2PeMutwvL3i9eTYla0I6C1WsDeL3Zebb9C2vQZGTeRKI
Kw/QWfQUAHmnfw8y2GqucBl+Z5/LuiTy7z5J30Ts9EKgvwOevlw=
=hsBl
-----END PGP SIGNATURE-----

--dxRQSzdsN/lOP445--

