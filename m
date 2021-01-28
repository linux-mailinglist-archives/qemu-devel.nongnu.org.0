Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CAF308292
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 01:43:21 +0100 (CET)
Received: from localhost ([::1]:44054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Hse-0000jW-Pg
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 19:43:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l5Hk9-0001Zc-VF; Thu, 28 Jan 2021 19:34:33 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33199 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l5Hk1-0003Im-Ve; Thu, 28 Jan 2021 19:34:33 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DRdd92yrfz9sWK; Fri, 29 Jan 2021 11:34:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611880461;
 bh=zU+acxDHaKTzBypWy182RqvWv/jz+ngXiAVI5AzdlPQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zek/xClpvxHHWQpuyuXxsVnbDjtJEa3SOzJH4lA76ZLwDs+4UDoVZ70GOmJJaQQ3L
 b+jsb61qs1tgAQZth+CU/PnoSqGzqYGGQKUB/BkCLh7e/pem/8WyWpHMv9GwDlFfhw
 41MSJeOZEJVfp1M1Yzc2465KnVZAqozvn5Y5EXYc=
Date: Fri, 29 Jan 2021 09:40:11 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 4/7] ppc/pnv: Simplify pnv_bmc_create()
Message-ID: <20210128224011.GB6951@yekko.fritz.box>
References: <20210126171059.307867-1-clg@kaod.org>
 <20210126171059.307867-5-clg@kaod.org>
 <CACPK8Xfw-E8TetGdfDYpMZChFbY7cQNGLX8_xh390A-vanS--w@mail.gmail.com>
 <9ea1ce11-15ba-3eea-f7a4-b036a9db841f@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Content-Disposition: inline
In-Reply-To: <9ea1ce11-15ba-3eea-f7a4-b036a9db841f@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-ppc@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 28, 2021 at 08:46:01AM +0100, C=E9dric Le Goater wrote:
> On 1/28/21 1:46 AM, Joel Stanley wrote:
> > On Tue, 26 Jan 2021 at 17:14, C=E9dric Le Goater <clg@kaod.org> wrote:
> >>
> >> and reuse pnv_bmc_set_pnor() to share the setting of the PNOR.
> >>
> >> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> >> ---
> >>  hw/ppc/pnv_bmc.c | 7 +------
> >>  1 file changed, 1 insertion(+), 6 deletions(-)
> >>
> >> diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
> >> index 67ebb16c4d5f..86d16b493539 100644
> >> --- a/hw/ppc/pnv_bmc.c
> >> +++ b/hw/ppc/pnv_bmc.c
> >> @@ -260,13 +260,8 @@ IPMIBmc *pnv_bmc_create(PnvPnor *pnor)
> >>      Object *obj;
> >>
> >>      obj =3D object_new(TYPE_IPMI_BMC_SIMULATOR);
> >> -    object_ref(OBJECT(pnor));
> >> -    object_property_add_const_link(obj, "pnor", OBJECT(pnor));
> >=20
> > I assume it's ok to move the link set to after the realise of the BMC o=
bject?
> =20
>=20
> When 2 objects need to be linked, one has to be realized first.=20
> I suppose this is why it is allowed but I am not expert in that area.=20
>=20
> Greg  ?
>=20
> That was the case already when defining a "ipmi-bmc-sim" device on the=20
> command line.

Well, the other thing here is that the IPMI_BMC_SIMULATOR isn't a
POWER specific object, and doesn't actually know anything about pnor,
so it never looks at that property.  Do we even need it?

>=20
> C.=20
>=20
>=20
> >>      qdev_realize(DEVICE(obj), NULL, &error_fatal);
> >> -
> >> -    /* Install the HIOMAP protocol handlers to access the PNOR */
> >> -    ipmi_sim_register_netfn(IPMI_BMC_SIMULATOR(obj), IPMI_NETFN_OEM,
> >> -                            &hiomap_netfn);
> >> +    pnv_bmc_set_pnor(IPMI_BMC(obj), pnor);
> >>
> >>      return IPMI_BMC(obj);
> >>  }
> >>
> >>
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmATPUsACgkQbDjKyiDZ
s5KOlw//U8MFimEpW78o7AnfUqDAFd/8gv9fq33WRtMsSusEjRcqPQDIZHLKnc/R
PRKIusQDRgoX7NlyF+cP8mdIqt80a/IYvF1h3rAIcbwX5G/loN1Ci5igK7rZlL3N
u13UpjON2YhTgYqSUwePUjJeIDxOkLRujglzG8pE7qD+uUl0mLYUjpN7EJZyTHl1
54/HBPwiSv+xQzGrZn/JJzGzXJoPv0DzpuFqw2CvfHpCWynHCgZ3oPXYWPAV9adH
Svou9hSW7BAHt4q2EFt1fwd+G6SBpLBsOd23M8v5AY+8uqEXBuQMCTcxUmMcyzQq
Mnb5TP2jHc+D2drtD+U36GIHP6xDJCZ7kjm2fYu654Xp/uqZTA0hnp+3CW6hIzjc
k8Z91ZCepRXYrYvzjVhfksGpWuEG/Od9VCTzinhg3n9rJYd2PqT/RR8yY/6MZNdM
QM8n3GrFmNwN/7I8F5vTcIsIO0JO8TbxisNfZt820cgswBp39YyTz9jQlYUuQ4Ph
HZVVMUrAudJafiYRXNFvrj1YOvyxuoi5Q1fketyAGykl2tBUoR8nxWA8+k0ja6m+
thYutG0ueLUrJRchSkxiQm5/CT/BFXkxWkyH9vAoJ0AAmP6Z3aXKOiMXGhEXbqJO
+TAiArNApwuP0ajJrDu043Y+dtiy9E8BLDH89XngtKuLgDU7btg=
=9Shj
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--

