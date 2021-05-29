Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC695394AAE
	for <lists+qemu-devel@lfdr.de>; Sat, 29 May 2021 08:01:57 +0200 (CEST)
Received: from localhost ([::1]:53704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lms2m-0004EL-G6
	for lists+qemu-devel@lfdr.de; Sat, 29 May 2021 02:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lms17-00028X-3O; Sat, 29 May 2021 02:00:13 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:53437 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lms12-0006fd-Ir; Sat, 29 May 2021 02:00:12 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FsW9T1LKSz9sW5; Sat, 29 May 2021 15:59:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622267997;
 bh=EPCVt3Cwg/a6uTrnoWt5ZUGtyI52XXQK8t7i7H8j/To=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eqdl9RQ/heLVM+7RMmQLn/J+s5GNBNF5G29Zus/j4h1gBLbRPpCzvYqOU2Fys9wYZ
 dwBVsmZ465L3zmg6usX/QoykY4lB+44F7IPyzvllV1808ZS6iP26+rEHLQbAOWDRnv
 WS7z1nGtrYIm8rHCCPH97pNVYpK54DKjCT1DEPjE=
Date: Sat, 29 May 2021 15:48:56 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 1/1] ppc/pef.c: initialize cgs->ready in kvmppc_svm_init()
Message-ID: <YLHVyCNhIkVLNV32@yekko>
References: <20210528201619.52363-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yc5L9MpedbAMF7RP"
Content-Disposition: inline
In-Reply-To: <20210528201619.52363-1-danielhb413@gmail.com>
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
Cc: linuxram@us.ibm.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--yc5L9MpedbAMF7RP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 28, 2021 at 05:16:19PM -0300, Daniel Henrique Barboza wrote:
> QEMU is failing to launch a CGS pSeries guest in a host that has PEF
> support:
>=20
> qemu-system-ppc64: ../softmmu/vl.c:2585: qemu_machine_creation_done: Asse=
rtion `machine->cgs->ready' failed.
> Aborted
>=20
> This is happening because we're not setting the cgs->ready flag that is
> asserted in qemu_machine_creation_done() during machine start.
>=20
> cgs->ready is set in s390_pv_kvm_init() and sev_kvm_init(). Let's set it
> in kvmppc_svm_init() as well.
>=20
> Reported-by: Ram Pai <linuxram@us.ibm.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Oops, that's an embarrasing omission.  Applied to ppc-for-6.1.

> ---
>  hw/ppc/pef.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/ppc/pef.c b/hw/ppc/pef.c
> index 573be3ed79..cc44d5e339 100644
> --- a/hw/ppc/pef.c
> +++ b/hw/ppc/pef.c
> @@ -41,7 +41,7 @@ struct PefGuest {
>      ConfidentialGuestSupport parent_obj;
>  };
> =20
> -static int kvmppc_svm_init(Error **errp)
> +static int kvmppc_svm_init(ConfidentialGuestSupport *cgs, Error **errp)
>  {
>  #ifdef CONFIG_KVM
>      static Error *pef_mig_blocker;
> @@ -65,6 +65,8 @@ static int kvmppc_svm_init(Error **errp)
>      /* NB: This can fail if --only-migratable is used */
>      migrate_add_blocker(pef_mig_blocker, &error_fatal);
> =20
> +    cgs->ready =3D true;
> +
>      return 0;
>  #else
>      g_assert_not_reached();
> @@ -102,7 +104,7 @@ int pef_kvm_init(ConfidentialGuestSupport *cgs, Error=
 **errp)
>          return -1;
>      }
> =20
> -    return kvmppc_svm_init(errp);
> +    return kvmppc_svm_init(cgs, errp);
>  }
> =20
>  int pef_kvm_reset(ConfidentialGuestSupport *cgs, Error **errp)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--yc5L9MpedbAMF7RP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCx1ccACgkQbDjKyiDZ
s5IDuRAAl61Dw+11ueQ9frtJusxh+snunehfUYx10+folxNh+PLGxkCMBwDC4B/N
E9UY51/MjRcDat2uLCZYbyNqpdzoiOjyJ3cvFY0DaLMHQXEgCbCXgvmsYcDXCkzO
GqbPCQ771+DNwg4eF3IOat8V13V83RAbbrb0umueLVLi2RNiGyMIpZJRDwogBKA6
qQOp11Ip51pBZmVZSEIE3VPpHbtan++yuTljeMRhUvmLcwVM6RHK47poEG2vgmTg
brX7em+tGVXFXke/xxrEESiDXmpdoZ4wY9gFOwIfF6lW16ZoZy2D/zJOQpzrrS/R
2sDtCUGo3mcRRdR51AtS7tdsBJjxwDyYdlmPu/+D83SAfdxwI7bVxQtscqG9EL5d
fNVvC7q4WAhUHR0dRxpWWptxJh4Y6HZyPv38UJ32CzhupwGQ60bokVC4XLbZnGoV
Dj2Ce5s5lpIeNKm4YbPqMQHWKvp+TaGBxAcPKheXvWRlfzJTP5/FsWH7CcTJRJHD
EOXK36c9d/jccd471V475pvoyAynYNvH9+n/AAFCh4rHCN+I/ljSxPeXzfogdH8Q
JAX4QTfmqFGNrH2EfiOly6eTyemnyv4UdY/Cq4B9/ShQ7UtDtgh2m2mHLGNsocu7
TNvpvB8WF+5IMZFgK1+R/mD1FQA/QkYo4rFsNzi+NG+OB4olOT0=
=eVpI
-----END PGP SIGNATURE-----

--yc5L9MpedbAMF7RP--

