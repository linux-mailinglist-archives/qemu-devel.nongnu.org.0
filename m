Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 536433CFC99
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 16:49:54 +0200 (CEST)
Received: from localhost ([::1]:45708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5r4D-0000DB-0m
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 10:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m5qzm-0007ix-HI
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:45:18 -0400
Received: from ozlabs.org ([203.11.71.1]:50515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m5qzj-00088f-BZ
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:45:18 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GThML3tLyz9sWw; Wed, 21 Jul 2021 00:45:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1626792302;
 bh=fcKQJYnRnqv2suOSu6uV5X+dpWP7ofbxtdLwaZjRmn0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jZWsvyVGUjt6l2MTaMORCqDET7CCgunplAw6JlOtZ1s9IPOVjCHAem1C1kIG7QrrT
 Wb+8SL2wM3W5HcGVes7hE3ueCD+VwpCe2rvcsGzBLU6WNxWjmqrmGFT5TLaEY61Wza
 K14RDxuYwR/jfJmvE5oGcLG+FXFqN9oauvCkXGlM=
Date: Tue, 20 Jul 2021 23:12:59 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 02/16] spapr: Plug memory leak when we can't add a
 migration blocker
Message-ID: <YPbL22aisygFD4vh@yekko>
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-3-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="x6ekk9CYR/ztf4gJ"
Content-Disposition: inline
In-Reply-To: <20210720125408.387910-3-armbru@redhat.com>
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
Cc: Aravinda Prasad <arawinda.p@gmail.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--x6ekk9CYR/ztf4gJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 20, 2021 at 02:53:54PM +0200, Markus Armbruster wrote:
> Fixes: 2500fb423adb17995485de0b4d507cf2f09e3a7f
> Cc: Aravinda Prasad <arawinda.p@gmail.com>
> Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/ppc/spapr_events.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
> index 0cfc19be19..a8f2cc6bdc 100644
> --- a/hw/ppc/spapr_events.c
> +++ b/hw/ppc/spapr_events.c
> @@ -872,7 +872,6 @@ void spapr_mce_req_event(PowerPCCPU *cpu, bool recove=
red)
>      SpaprMachineState *spapr =3D SPAPR_MACHINE(qdev_get_machine());
>      CPUState *cs =3D CPU(cpu);
>      int ret;
> -    Error *local_err =3D NULL;
> =20
>      if (spapr->fwnmi_machine_check_addr =3D=3D -1) {
>          /* Non-FWNMI case, deliver it like an architected CPU interrupt.=
 */
> @@ -912,7 +911,7 @@ void spapr_mce_req_event(PowerPCCPU *cpu, bool recove=
red)
>          }
>      }
> =20
> -    ret =3D migrate_add_blocker(spapr->fwnmi_migration_blocker, &local_e=
rr);
> +    ret =3D migrate_add_blocker(spapr->fwnmi_migration_blocker, NULL);
>      if (ret =3D=3D -EBUSY) {
>          /*
>           * We don't want to abort so we let the migration to continue.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--x6ekk9CYR/ztf4gJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmD2y9gACgkQbDjKyiDZ
s5LMxxAAl9321EIJ/nQq2zMtY9SB4U0BV2AJOs42izozVdOE7g9KB1rikB+TuxG1
LXqzNruI5CxUtxYCkmkKj5mZvz/p2tmn4SE/gpp3z81PzIlfycusSWW5Ss+kCqPu
LSiarWdkzEk2PA+Dwm9k7NOBrZkbZQs2ZK168bN1ys1IEOoSFH6NrgmR10RICVOi
gUCqq6MYKWx4d7M8bt2p5JshTmAigqXyEpDtYlhLSg/pdyEt03D6dp56nGNeFezv
p7YQ4fgzLEf6La8YCL0cRQ49/rqWElukRdcLMHXQPeGu+78Y6E58voS8OaxJmFtq
tN+QbdU5ENDpZEBWh+rbLKyFnGeeKJyTbhFRj7iwhPcmATg60vqXehiOoTq5MV5C
wkBjOF+Q9rKSXHHOY9Htg3eLmYaBIorrCETDXfw/btSwo5DCNDq+krb10uhkJWPp
hqDYGfFUf/N/o11jzfRKnwivuoNiFqhz/bcAFsjzFOZ525+3DZBXhH/DMBlpSyto
voxOG5chpJtN3EaBTS5ybD42yuD6xWnynlpnwRLCKEGZfg2AbAuAqV7WBfQq052/
s6k+D1IGIpyHKOZwiA96UTKTGhxjaV9SHkahGbgZYnNrEQnHUriVL68c8XREaDOp
2oEXK91+12aJOM3eyOndv0GXx0LAdLp2zxu47uXEKPnRPZLmBAk=
=V0Pu
-----END PGP SIGNATURE-----

--x6ekk9CYR/ztf4gJ--

