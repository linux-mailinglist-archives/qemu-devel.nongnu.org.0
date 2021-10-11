Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E40C428DB5
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 15:21:02 +0200 (CEST)
Received: from localhost ([::1]:48600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZvEj-0005c0-5Z
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 09:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mZv7S-0002Ky-Ud; Mon, 11 Oct 2021 09:13:30 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:35119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mZv7P-0002D4-Uk; Mon, 11 Oct 2021 09:13:30 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HSfP16CPgz4xbV; Tue, 12 Oct 2021 00:13:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1633957989;
 bh=dna3bmHiG37zb3rwiCqxuXpj4gSHVDyOY6PB6au3chM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eo9zd6mWsWI5yeDU2Y2X22WfCafthgOuA0J9m3dhksl4gO79ghMqvcnMpaUSL9M+4
 CvFd+aROZ0pdns7wd4LUik+DTpI4WhcHqYYHZUH3zSTwS97HF580rpT+P7YHUZ+5EV
 eZGDk5l5uiZoHG3b3yavNiRd5Ob3ovIdBzY/s6V0=
Date: Mon, 11 Oct 2021 20:20:20 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: Deprecate the ppc405 boards in QEMU?
Message-ID: <YWQB1FMhQfmqRYxN@yekko>
References: <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <0beb4744-5421-2cec-1fe4-6a8b7353d932@redhat.com>
 <cdbfbb3c-2e79-7853-afe0-fe8a65683db1@ozlabs.ru>
 <3b1570d3-56f5-1184-239a-72791fc8ef83@redhat.com>
 <881242de-fec8-3296-ffb4-36d2a551d21f@redhat.com>
 <e551634d-c6e7-c57-5b7f-b9ad8621824@eik.bme.hu>
 <119bc1c7-22e0-c455-9f34-57a7424f0c52@redhat.com>
 <a60b6ad-801c-6783-a81d-1d2b8ed97e34@eik.bme.hu>
 <7526ae07-0054-69df-c71f-8751858ef0db@redhat.com>
 <ad151b9d-27a7-bb5d-2cad-1196ceecfdd6@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="74YeukcuEzGKrq/c"
Content-Disposition: inline
In-Reply-To: <ad151b9d-27a7-bb5d-2cad-1196ceecfdd6@redhat.com>
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Peter Maydell <peter.maydell@linaro.org>, dbarboza@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Greg Kurz <groug@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--74YeukcuEzGKrq/c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 11, 2021 at 10:10:36AM +0200, Thomas Huth wrote:
> On 06/10/2021 09.25, Thomas Huth wrote:
> > On 05/10/2021 23.53, BALATON Zoltan wrote:
> > [...]
> > > Maybe these 405 boards in QEMU ran with modified firmware where the
> > > memory detection was patched out but it seems to detect the RAM so I
> > > wonder where it gets that from. Maybe by reading the SDRAM
> > > controller DCRs ppc4xx_sdram_init() sets up. Then I'm not sure what
> > > it needs the SPD for, I forgot how this worked on sam460ex. Maybe
> > > for the speed calibration, so could be it detects ram by reading
> > > DCRs then tries to get SPD data and that's where it stops as i2c is
> > > not emulated on taihu. This could be confirmed by checking what it
> > > pokes with -d guest_errors that shows accesses to missing devices
> > > but don't know where 405 has the i2c controller and if it's the same
> > > as newer SoCs. If so that could be reused and an i2c bus could be
> > > added with the SPD data like in sam460ex to make u-boot happy or you
> > > could skip this in u-boot.
> >=20
> > FWIW, I've just tried the latter (skipping the sdram init in u-boot),
> > and indeed, I can get to the u-boot prompt now.
> [...]> I've also attached the patch with my modifications to u-boot.
>=20
> FYI, the changes can now be found on this branch here:
>=20
>  https://gitlab.com/huth/u-boot/-/commits/taihu
>=20
> I also added a gitlab-CI file, so you can now download the u-boot.bin as =
an
> artifact from the corresponding pipeline, e.g.:
>=20
>  https://gitlab.com/huth/u-boot/-/jobs/1667201028

Thanks.

Are you going to send a v2 of your proposed deprecation patches?  If
you do can you please CC me explicitly.  I only scan qemu-ppc once a
week or so, and it goes into a different folder.  If I'm CCed I'll
notice and respond to it faster.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--74YeukcuEzGKrq/c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFkAdIACgkQbDjKyiDZ
s5LfZg/+L+rnF+NAcQqXRrs9s7Il1BhT9dCD/pFZ/wpXYUcX6z6WchM+8w/TYezV
l/M5dP4BSNCa37p9riBnzsoawb2m5bqdzfJtQNAyRdXewd63MGG/eF25byKhM27p
DCd09p1pjQo6hLpyiS+SM7dChGc+q5J9rAi4YNVZmKb+m9CSkNOtSiIRTdu05saf
Z1s4/ZqCwzntTJIEz405AOtCw7Fg9NgVuLOMM+JcPl2/Yx0tCVmar5gRsRhbIq6r
5I1iUaKq3yR5+25pEkycU+QpoQBwVwEplD9uHYp5WwYpn7tH7V3+E4ibLu8O3F0a
AjVA8YShEQl5HJYUqG7uknymKF5WAxpFrDGtwsVbG1DFMhC/wUtlbh6KII5fMSEE
ogeNQdkWcXZWW2FoArqDlDlO18/opVx9o3Qq6T9nbx3RawqBo+wWQukxbGZKhGNk
4BoQ2zfBTDNSavjGk00s+xF56Rz7RPmVxkFtYhb1HdeT1nYLXJRkJcKLi0gEbQXo
VCsTdDcneAkkVxc35EJby1K1OaHDaRj7kOzniYpcznMdOpcgUum4rlVH2XS+HSOn
8gg38eBCf4sUoBap++9iEQL+0k7rapPu3rJmlIlpGRJHC9oxMmyHcdCBnQBWeHRV
j5/09jGnxUIN9MArtF3WSi4J+C1F/AZKsNTylRlBSoUvEqFETvk=
=7sEy
-----END PGP SIGNATURE-----

--74YeukcuEzGKrq/c--

