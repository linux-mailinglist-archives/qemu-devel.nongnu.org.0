Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E22122CB3A0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 04:58:05 +0100 (CET)
Received: from localhost ([::1]:44576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkJHI-0007xB-FK
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 22:58:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kkJEn-0006pe-0z; Tue, 01 Dec 2020 22:55:29 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:56023 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kkJEh-0007XM-08; Tue, 01 Dec 2020 22:55:27 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cm4qc70Hsz9sSf; Wed,  2 Dec 2020 14:55:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1606881308;
 bh=bFVVTOj+6qy6I+LlSbc1MSXgH394qnmF1nSRxIqfLAs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZBRH+EdhdOEwBbZuiJZwpAKNE6sxzgKiqp14U0bDu99235woa1RFJdu62jNiQ0/zg
 WM751O5E7zPCXZcpWgehz7oGZjmYBuPJClqaCJS8MGpQd+QGr3sYlOfD0b+PlcfnYI
 zodrHHMVEauKEOhwFdNY40wvH6RcfnZuU89VYUsw=
Date: Wed, 2 Dec 2020 14:16:00 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH for-6.0 v2 0/4] spapr: Perform hotplug sanity checks at
 pre-plug
Message-ID: <20201202031600.GA7801@yekko.fritz.box>
References: <20201201113728.885700-1-groug@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline
In-Reply-To: <20201201113728.885700-1-groug@kaod.org>
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 01, 2020 at 12:37:24PM +0100, Greg Kurz wrote:
> Igor recently suggested that instead of failing in spapr_drc_attach()
> at plug time we should rather check that the DRC is attachable at
> pre-plug time. This allows to error out before the hot-plugged device
> is even realized and to come up with simpler plug callbacks.
>=20
> sPAPR currently supports hotplug of PCI devices, PHBs, CPU cores,
> PC-DIMM/NVDIMM memory and TPM proxy devices. Some of these already
> do sanity checks at pre-plug that are sufficient to ensure the DRC
> are attachables. Some others don't even have a pre-plug handler.
>=20
> This series adds the missing pieces so that all failing conditions
> are caught at pre-plug time instead of plug time for all devices.
>=20
> v2: - hopefully less fragile way of setting compat mode for hot-plugged
>       CPUs

Applied to ppc-for-6.0, thanks.

>=20
> Greg Kurz (4):
>   spapr: Fix pre-2.10 dummy ICP hack
>   spapr: Abort if ppc_set_compat() fails for hot-plugged CPUs
>   spapr: Simplify error path of spapr_core_plug()
>   spapr: spapr_drc_attach() cannot fail
>=20
>  include/hw/ppc/spapr_drc.h |  8 ++++++-
>  hw/ppc/spapr.c             | 49 ++++++++++++++++++--------------------
>  hw/ppc/spapr_drc.c         |  8 ++-----
>  hw/ppc/spapr_nvdimm.c      |  2 +-
>  hw/ppc/spapr_pci.c         |  2 +-
>  5 files changed, 34 insertions(+), 35 deletions(-)
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/HBu4ACgkQbDjKyiDZ
s5LkrQ/9ED+4TeIRnsIMy7NLBBdnqB89lKbMwxTXNP3CHqqjfTJS0pGm0T6PScFj
KycwOgbfQvuuaXo0EVZdpJaZwwBYEFuXG70UOhL7cYzfxSS612lQ8oLBVhpLrp3s
get1BW+uLeovv/xjNkEJBosJzMsGPkEGnkeC/6w4WflFofVMX0mX1AzQpeXTvZQm
ydZtXogVl8IzjHq2BtklLVZ7u19/z1WIhPn7ZL3pQWRZyux1vPGd4gt2lOQ0G3iH
kMBzXlP6hKq46JUTMlRZfGWTyhSiD0Iezv9qsuIRaT/JgFRkmOFtVjqrr8tt20Tb
ZO9urZuAwQwFqDtdPRkR+1UOiynxI089HE73WV15/jxQxWkdBQvI9h7cto1iUyPi
AuU+RsxC36voT/7cct8GZlunEE7cwau9G23jDQi5Csg6OQk4b8O/QQQ2W4cy9A5S
z2tBdRTdXx/EHqDtXnnd4ass2v6Adf/slVzLaoxXkJs6QydP8SKbR5bAX8Pzmv+h
FjwBkM/X2XkLJ9sLk3VsX4oyL4Q3CsZpCpQIngSIz5dvUoDKjJ79XmAOVkf5ZeJE
L/GoKFCbu6cHI2sPqu44bCQSRHIf3Ezi0DwSsSFewdeftqhLxhI/oS5vA4Mec5EC
4nftc8sK+Y1vPnvuRoqo3liWquztAeQbATUbR75GumOwVc4069w=
=8yDd
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--

