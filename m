Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC1B392494
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 03:53:00 +0200 (CEST)
Received: from localhost ([::1]:58634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm5Cl-0005Wk-MV
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 21:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lm58P-0005xb-V3; Wed, 26 May 2021 21:48:30 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:42703 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lm58M-0001k9-3d; Wed, 26 May 2021 21:48:29 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fr9gy71Q7z9sW8; Thu, 27 May 2021 11:48:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622080094;
 bh=2DvPJPwa2aRpzyEczNaPALEbJ/RC2AKvVluD7wxWnao=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HFpc76qyJiAT0QeTQyfkQ+QCiIdLQa4nc25X0ETxBbW/XBMovFg6jSKoB94J2J96A
 8ZXpjwWwyXVRDhR6f4pyXmpF7KMmLtqFzzPLxpri+ZJKNjhP0cuH5xek9++JPsnrF9
 Zi08tyoDpZ6oWROG2d8tyWlyTWesAN9N6+pkF9sk=
Date: Thu, 27 May 2021 11:18:48 +1000
From: "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 1/5] target/ppc: fixed GEN_OPCODE behavior when
 PPC_DUMP_CPU is set
Message-ID: <YK7zeAtV9gxeKl1u@yekko>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <20210526202104.127910-2-bruno.larsen@eldorado.org.br>
 <CP2PR80MB36687B3DEA1BA59FB969DB5EDA249@CP2PR80MB3668.lamprd80.prod.outlook.com>
 <cb8e582b-5997-4d6e-60d5-87b03decf88f@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YpfV5fIdHiUcQWoV"
Content-Disposition: inline
In-Reply-To: <cb8e582b-5997-4d6e-60d5-87b03decf88f@linaro.org>
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
Cc: "farosas@linux.ibm.com" <farosas@linux.ibm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--YpfV5fIdHiUcQWoV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 26, 2021 at 02:24:51PM -0700, Richard Henderson wrote:
> On 5/26/21 2:13 PM, Luis Fernando Fujita Pires wrote:
> > From: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> > > Before this patch, when PPC_DUMP_CPU is set, oname is added to
> > > opc_handler_t, but GEN_OPCODE* wouldn't set it unless DO_PPC_STATISTI=
CS
> > > was set as well.
> > >=20
> > > This patch changes it so those changes would happen when PPC_DUMP_CPU=
 is
> > > set, but not statistics, because the latter is being removed.
> > >=20
> > > Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> > > ---
> > >   target/ppc/translate.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > I suggest removing dump_ppc_insns() altogether and 'oname' along with i=
t.
> >=20
> > Now that we're moving to decodetree, dump_ppc_insns() wouldn't show all=
 the available opcodes anyway. And the only other locations where 'oname' i=
s being used are when registering more than one handler for the same opcode=
 by mistake, which won't happen anymore, as any new instructions should use=
 decodetree.
>=20
> Agreed.

I'll wait for a follow up doing this then.

>=20
> r~
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--YpfV5fIdHiUcQWoV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCu83cACgkQbDjKyiDZ
s5JnkA//UdJQPDiA4wIa8ZwHiNv+De13HzVhqT+MLWdIJyKhdhHKWOhX9Oc/iqO1
KiU9FlPBt7OcVwGyvwsrZYizv/UEOAWZlIWZx/Lfn9XqHrFvvFewBoVUoIG6sy2z
0K3az657mIxScqU8fsDf8+ONvCY2A6+z6Mk7OfLKjCO0bTg/6mF5Wekz+m6F2pAO
FvFXrNSxI/ur5B0JV9PHQWkb0Grgg1YqFGngk37xlVLJBPekUUITPjVFhaAwnz7s
3F+VKp6JqRawuZrtgrapazY22GZ+1Xtl0jDffaeCSMSfbuOdDlSOnkxXNVD2cOxk
diEpYHmawx73gpoZe0Jf9rLifV1/n9pyJ0Twts3VA0p8qyewZlKXJujtTQg58Aq2
TaLdeExjmKC1d6NwM3jFoVtoWsqxIJdXWlDdyMMpcHdwK/KeK6JLIcAG+8C20Ea2
lmkmqlRqC6APpgceMxCT/YI54H4ZToaRRIZ+emcn229M+xcL+V1LV+ClkuBIOCq6
a3WleDpi4xrxyISa11uhL9Ljs+43/CyeITPeAJqIV1CiS3jPybcQSn9MyY1mRowI
AHMg2F+8wdDAbDUAD7HOEyAYhjyJoePHEym+quUf6YwiI6HpahwsPuoTqMD57D4V
6TuKvAwBb3rwH9VrLcHRJIyS2ba6qGnV0JiwqA8xgRsumqjSeHQ=
=/D3v
-----END PGP SIGNATURE-----

--YpfV5fIdHiUcQWoV--

