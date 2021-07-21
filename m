Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5F03D0903
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 08:36:53 +0200 (CEST)
Received: from localhost ([::1]:35640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m65qe-0006Ta-FH
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 02:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m65ng-0003cb-AJ
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:33:48 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:42693 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m65nc-0006q2-8X
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:33:48 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GV5Pv53nkz9sX1; Wed, 21 Jul 2021 16:33:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626849219;
 bh=F8gyl13W8d9bJreMFB7RLhv3BkcqFveIzzIuJw3Aoi4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mNKp7FyZ1FBSZCI2PUb/Zeceud3iosk/Dpr9IGL2bLpYQLGWt+Ct8EPv399Kv5wso
 Go6rF++StxHdR/ERxKuc25Mx6yWXBLWt9etNOheoZmDZ2jxnZ5dAuqabPy4T1o4bkm
 KD/SZgR0rc2lYwZ/18Td/hpgdJ/y1ANIhhzWp0+E=
Date: Wed, 21 Jul 2021 16:08:19 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 03/16] spapr: Explain purpose of
 ->fwnmi_migration_blocker more clearly
Message-ID: <YPe504pJWh6iZCnc@yekko>
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-4-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kyRovcnPWfQrSkfv"
Content-Disposition: inline
In-Reply-To: <20210720125408.387910-4-armbru@redhat.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
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
Cc: Aravinda Prasad <arawinda.p@gmail.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--kyRovcnPWfQrSkfv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 20, 2021 at 02:53:55PM +0200, Markus Armbruster wrote:
> spapr_mce_req_event() makes an effort to prevent migration from
> degrading the reporting of FWNMIs.  It adds a migration blocker when
> it receives one, and deletes it when it's done handling it.  This is a
> best effort.
>=20
> Commit 2500fb423a "migration: Include migration support for machine
> check handling" tried to explain this in a comment.  Rewrite the
> comment for clarity, and reposition it to make it clear it applies to
> all failure modes, not just "migration already in progress".
>=20
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Aravinda Prasad <arawinda.p@gmail.com>
> Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr_events.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
> index a8f2cc6bdc..7d6876f12d 100644
> --- a/hw/ppc/spapr_events.c
> +++ b/hw/ppc/spapr_events.c
> @@ -911,16 +911,17 @@ void spapr_mce_req_event(PowerPCCPU *cpu, bool reco=
vered)
>          }
>      }
> =20
> +    /*
> +     * Try to block migration while FWNMI is being handled, so the
> +     * machine check handler runs where the information passed to it
> +     * actually makes sense.  This shouldn't actually block migration,
> +     * only delay it slightly, assuming migration is retried.  If the
> +     * attempt to block fails, carry on.  Unfortunately, it always
> +     * fails when running with -only-migrate.  A proper interface to
> +     * delay migration completion for a bit could avoid that.
> +     */
>      ret =3D migrate_add_blocker(spapr->fwnmi_migration_blocker, NULL);
>      if (ret =3D=3D -EBUSY) {
> -        /*
> -         * We don't want to abort so we let the migration to continue.
> -         * In a rare case, the machine check handler will run on the tar=
get.
> -         * Though this is not preferable, it is better than aborting
> -         * the migration or killing the VM. It is okay to call
> -         * migrate_del_blocker on a blocker that was not added (which the
> -         * nmi-interlock handler would do when it's called after this).
> -         */
>          warn_report("Received a fwnmi while migration was in progress");
>      }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kyRovcnPWfQrSkfv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD3udMACgkQbDjKyiDZ
s5J4aw/+LCfl+RBdjC04GzI3AdFnD7+URmKreqOkNkpT1JzkIsZBcPiK94gziRTB
nSrR7njU61VileSYT+5UtQUA0rExvTAJhwx//WBpT40IHPlGXUr66SM5dzFZtndc
bXNM7D4v0Njf/gUDzbcoR7ES4zkBwQXCeRWmH1qtpT7FQbqPUgtQjsllu8RbQr7V
q8h1AmNdY7c8HdhaECoyNm8BLPznnti28MBs80Mf0E7SyHMjFIWJwzCHwmEeUL8D
Pn8v/T5rCWV7BBUSLySFwnubRV2H02omG+09BEU8A+s+10RiXK1/xb71g9a+YeOC
hnTp3HZwDG5XTOVjrd5cDM8mh8X9RXoX2cdg6UJJyiZTat+yykBF5MQi9KEmQi8T
yGINQSYwIafby2icwHBhGX0/505ipumkasS8gBFAEN6Mtr6srh/iSDBeqrbxY5Gy
XeLsu9pbBqkLl78cRjTamuIUabazbW4GqiiRpRcTlDs4nvVSJkEUGmE5TEC2Bjxp
67+rWu1frYmtqkTC9/sYxcN7Q/DtlJFd5uNJr2zj10MIR/nxV2jR1ymNNiOdVWIi
kgsdORFyCk01BUJEbPyVPQdpZNGqssyCCsAIPEadN0FWrPdxTqCMB3+EC1lRl4j4
PwatxFv6blxZFK3sJQAwYJMeS9yKDeGC0IQu2QF/aR5fK7SM2uI=
=DTIe
-----END PGP SIGNATURE-----

--kyRovcnPWfQrSkfv--

