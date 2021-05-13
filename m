Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D79238010A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 02:02:55 +0200 (CEST)
Received: from localhost ([::1]:45898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhLI6-0001cg-Ja
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 20:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lhLEC-0003rR-TV; Thu, 13 May 2021 19:58:52 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:35503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lhLEA-0007o6-FS; Thu, 13 May 2021 19:58:52 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fh7sd1pxKz9sWX; Fri, 14 May 2021 09:58:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620950325;
 bh=yQja/ddUjLI4ci6lyKRYYHMpcNP7O8WJfro5oEUO+j0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JLBtQplsQjkGqb8kDy+SO/IcBVw3i0PGnAKj/wRtthg1eSbywmL725cy0I4vGROAK
 Qvs98DRVk2ZIEsFk4ktF80nt85y1NwSML2Gqr8swL5OPgXXJTHC7tK4zCg7SX3rcll
 1LwnLp1Zgao1OtMfrAcqPFIGrCNbF7yQNSi3Hdi0=
Date: Fri, 14 May 2021 09:33:18 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 1/5] hw/mem/nvdimm: Use Kconfig 'imply' instead of
 'depends on'
Message-ID: <YJ23PiCRO/ytJEKo@yekko>
References: <20210511155354.3069141-1-philmd@redhat.com>
 <20210511155354.3069141-2-philmd@redhat.com>
 <YJs8anLs1zL3nPdS@yekko>
 <21e0a306-ccfb-a627-1496-14f831fe80a7@redhat.com>
 <dba0c284-b279-5e5b-74c9-2da719a8ce2e@redhat.com>
 <YJt9iiXF48P77gOY@yekko>
 <161fa4ca-5407-790c-8e2f-e0665c89fd6f@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rq5Bgz6Q6RS8hq6k"
Content-Disposition: inline
In-Reply-To: <161fa4ca-5407-790c-8e2f-e0665c89fd6f@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 qemu-ppc@nongnu.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--rq5Bgz6Q6RS8hq6k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2021 at 05:20:06PM +0200, Paolo Bonzini wrote:
> On 12/05/21 09:02, David Gibson wrote:
> > > But with "imply" you could end up with a PSERIES that does not have N=
VDIMM
> > > when also using --without-default-devices, couldn't you? Why don't yo=
u use
> > > "select" instead of "imply" ?
> > Oh.. clearly I misunderstand the semantics of "imply".  If we don't
> > need NVDIMM for PSERIES, why does there need to be any Kconfig
> > connection between them at all?
>=20
> Because you still want it in the binary by default (i.e. unless
> --without-default-devices).
>=20
> Basically,
>=20
> config PSERIES
>     imply NVDIMM
>=20
> is the same as
>=20
> config NVDIMM
>     default y if PSERIES

Ah, ok, I get it now.  "imply" is a terrible word for this, but ok.

> Both of them are a way to say "PSERIES can work with NVDIMM so you want to
> include it unless you want some fine tuning".  In Linux "imply" is very
> rarely used, while in QEMU it's quite common because it keeps the many
> per-board defaults close together.
>=20
> Paolo
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rq5Bgz6Q6RS8hq6k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCdtzsACgkQbDjKyiDZ
s5KfMBAAm2GQO0a2VI49UQ3Qm/v9DXPZTyVMlytrE20Ob4aUMmIgzw92q6ibt5ho
bnH3ss07eRgAhD8wHClGrt8yWoS4iZZNeosLYEQT1Bnayxj1F9A3QrGop74ak1GO
rWhXbk9tNXQpcoHKtgkVFmi8wbDAZZWehqOIU9LeWW+avhnVEY98+lJTJSgdlzn6
yktWEFROeHEAb2U4hA3EmjYuXdx8ZrmJnL37/iDOm28+szez/hitrF0q++Pww791
sj5WwTckpFkd/qdKl0bzubSWa5UoAyXx+8Ay1ScKLzbIhzhY7F5ZxHXvk73qy/2h
Z8S4yTR9WfH9r9/vknX8qz1gBu8dRwYSuu+zhF4Ak52r6MilFrAoyeCvPpeNWoK9
o4tuZWlXmYV3XHiwOrnWabOLejmF7prLKfZDR0amvk7cwpfau8+T6KjTwA7NLOnH
+OUjtl3t/OMYs98VuVNf9TTGX1CDu2NkRNLNphoWoCQEqAGlFD4fykBkPSRoDTtM
GsMfqJ+18C6Wsp7NeAEdRFHDTQMCg/mBKppxygwVTE6FXDDcBDzWC2iMw5xn/SAb
sct16VA1hJ5fqNlSzqoqENQJWXcb8hsVdBts1L72QcYWiP/qtzN+97CwkfB3OEie
46cD5yV4pkRHkV/SnPu5WzRn2hbxx/aBvywb4OXL9uPNYLEzonc=
=UAKR
-----END PGP SIGNATURE-----

--rq5Bgz6Q6RS8hq6k--

