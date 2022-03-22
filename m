Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B16B34E369B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 03:28:09 +0100 (CET)
Received: from localhost ([::1]:57692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWUFk-000403-2f
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 22:28:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nWUAa-00039j-Mg; Mon, 21 Mar 2022 22:22:48 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:59925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nWUAW-0001ka-LC; Mon, 21 Mar 2022 22:22:47 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4KMwHf3wTDz4xXV; Tue, 22 Mar 2022 13:22:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1647915758;
 bh=U/NurfqjJq32PqupWu5+Rc6I1pJpUZ6mnLaSDdoXiKk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hcbhYiwOoLpCOucdY+g4837DpJ+jRoJOj8mv6GrC+rV53upALLnbn5EDguNjp4x0W
 iVKiTl4TBfrfH9Wgv3g7xWNOhyk17QpQmnWfeWO5ywPaN33eBL/cETQ3urMP5SfdNg
 mlfTowSIBk2HdSWHZOU0sfBrNEokci/mlwB9ICXk=
Date: Tue, 22 Mar 2022 12:03:34 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH for-7.1 0/9] spapr: add drc->index, remove
 spapr_drc_index()
Message-ID: <YjkgZjefvhrnY7eh@yekko>
References: <20220318173320.320541-1-danielhb413@gmail.com>
 <Yjf3Ifdun+jaJ8zF@yekko>
 <9b90b3a2-c4a1-1b3c-d6d9-2c96921d7d14@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="92MDi2E3HL7t+1j9"
Content-Disposition: inline
In-Reply-To: <9b90b3a2-c4a1-1b3c-d6d9-2c96921d7d14@gmail.com>
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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


--92MDi2E3HL7t+1j9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 21, 2022 at 04:58:47AM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 3/21/22 00:55, David Gibson wrote:
> > On Fri, Mar 18, 2022 at 02:33:11PM -0300, Daniel Henrique Barboza wrote:
> > > Hi,
> > >=20
> > > I decided to make this change after realizing that (1) spapr_drc_inde=
x()
> > > always return the same index value for the DRC regardless of machine =
or
> > > device state and (2) we call spapr_drc_index() a lot throughout the
> > > spapr code.
> >=20
> > Hmm.. so, spapr_drc_index() wasn't ever intended as an abstraction
> > point.  Rather, it's just there as a matter of data redundancy.  The
> > index can be derived from the drc->id and the type.  Unless there's a
> > compelling reason otherwise, it's usually a good idea to store data in
> > just one form (if there's more it's an opportunity for bugs to let it
> > get out of sync).
>=20
>=20
> Hmm what if we store drc->index instead and derive drc->id from it? drc->=
index
> is read from several places, while drc->id is used just in spapr_drc_name=
() to
> write the DT (via spapr_dt_drc()).

That could work.  It's still slightly redundant since the type part of
the index can be derived from the class, but I think it's not unreasonable.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--92MDi2E3HL7t+1j9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmI5IFwACgkQgypY4gEw
YSKSOw//cmQnZPWK7jAyy9Nq5uUXj3TvuwUnxY586OgenV6ylypUjfh/WJh9L802
gYot6OPFP7ydkVbymz8qEH6cad3jwP1/RLjn3Ow0tyTVimV7GFIVfib9riBO2+RF
5dx2d+7OXpnGVSQ2Jet/4rU5tXT0VbOmsbMtX2RZmbnjJNqYVz1A1KQvzl4SyOeH
unkA5IXOMBFjSrwZEa8F8WVknkLoADLmRps4OBoum5zDEE4bSzzReeVGuY+rs7RO
INGWC9Rf06JFbkd/Hgh7X3rd5yO5RUyb9XfC0Jh82sS2/8walidGJl67rB1htJpa
bDS4oJdPnEf/rsnbDFRGQbrCBZeXzzOFsQ/F7pDs2h6BsTC/XaEmGcOAgp6/R3Ju
CDZ6QaQErd2/K0CBAlqbDH51A52JNmdmHbjzb76zCyu/z00kzKczu0KJinDOMuxn
z3na1sSEA2N9e2ttpFPhXtoPYffrCit4dVatr5ho1Ek2wBGqyUJZ8N25ZFf2TN5O
qpCc9+AOAiUZCc77bNO9reusW35c1yIwo4cpTHLfvMY/xOT/ZMoA1yNEJkz0ZAqF
3V+4UpP7XnztjHEGxaM0UnIVJs79pXyKPUCCnVBxjw5R6qCocAaPCcCF2CqE/30I
KIs9WHlOXTZEbTm9Remfu9R0yld+LpWwkBKr9hvRYB0YblDvDAE=
=gG3/
-----END PGP SIGNATURE-----

--92MDi2E3HL7t+1j9--

