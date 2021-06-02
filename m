Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9343984AB
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 10:55:25 +0200 (CEST)
Received: from localhost ([::1]:43018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loMeq-0003RM-7w
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 04:55:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loMdd-0001HB-Jt; Wed, 02 Jun 2021 04:54:09 -0400
Received: from ozlabs.org ([203.11.71.1]:41659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loMdb-0003mp-FA; Wed, 02 Jun 2021 04:54:09 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fw2rV1B12z9sRN; Wed,  2 Jun 2021 18:54:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622624042;
 bh=bzLKXI0pJ27BlNqqu2Us8I0EBGr0f2ShKmtlywOegtw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qReH0YbvU+T9+eXKplDAwLGbc0e9PcdUs9Ff7lbMkIDgNBw8SXujLArr+JyzPeu9i
 +UVhZkDKeZtgZajdALQf3TlD964mbRzp8Yt7E6nd/Y43/uUHlfa1yiFLi8kUgFYmv1
 trpDIjwkfjnjogzbcqfRyDLz6m+DU3//coUdWyEY=
Date: Wed, 2 Jun 2021 18:53:40 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v6 14/14] target/ppc: Move cmp/cmpi/cmpl/cmpli to
 decodetree
Message-ID: <YLdHFAefFkA4mWx6@yekko>
References: <20210601193528.2533031-1-matheus.ferst@eldorado.org.br>
 <20210601193528.2533031-15-matheus.ferst@eldorado.org.br>
 <cb59c1df-cee4-3f40-aa77-fd966d49bb6e@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="das/wOmat2s314GH"
Content-Disposition: inline
In-Reply-To: <cb59c1df-cee4-3f40-aa77-fd966d49bb6e@linaro.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, luis.pires@eldorado.org.br,
 qemu-ppc@nongnu.org, lagarcia@br.ibm.com, matheus.ferst@eldorado.org.br,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--das/wOmat2s314GH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 01, 2021 at 01:57:25PM -0700, Richard Henderson wrote:
> On 6/1/21 12:35 PM, matheus.ferst@eldorado.org.br wrote:
> > --- a/target/ppc/translate/fixedpoint-impl.c.inc
> > +++ b/target/ppc/translate/fixedpoint-impl.c.inc
> > @@ -1,4 +1,4 @@
> > -/*
> > +    /*
> >    * Power ISA decode for Fixed-Point Facility instructions
>=20
> Watch the whitespace errors.

I've fixed that up in my tree.

>=20
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>=20
> r~
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--das/wOmat2s314GH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmC3RxMACgkQbDjKyiDZ
s5LeDRAAjGF3zjWeC78T5hw3YprQBTFAH/pEE4RAgHdVByfdtI8lx0wvNl36jhKJ
HxgmcT4IMrCtm0jczhQQZjycHO1ARMqZcB4zyr8P176I2WLUptj3MNukUexCZ6kV
bppP70+/bYtFyY/gmE7MS8d8VZz+ZCoxLyS3k5wAaIUMJ5ASohngxRuCROlpVJAA
fFp05poHvz+oeZEOriQX0HG2X8nxJNdT4wbOtJgJ5J/Zmt/WZnNdLnCW/Kq80lZu
GMlJ557NWgw2kQA1zIJn5hEF1rd1VtxckBKcOWdi/s86DK84P1cQUD3elGun9Y17
t1XAsT2/j37xcW4c9dRPnc1qEjlFesmNWmQ1NP83YC1nWBOG0G7r+9N20J3Hc4OT
LT72YF35TpUIY0MZI7DFGqiax/XxIIfc9ANY8xOEou7UiOgArr8wK8REd/9g6N1+
fxBiwpsfo2c5tMkcZQF7N7/BTAwhBAkYsnWeZCzwLqCBcrm6TIJYt5B+YbX+iCh2
BGQPDNf5raS4l5/URNLip69pQz37ohQ/AL2eHYLKTnmsHFD9gOn28fUdsnlvxEXW
OtLFy6A3pBYIWkZ4cVYVIgdBgANNe1ETTZ1RNrHscxtSlETDN3KxCU4Gbnjuf04n
NZt+xR3//dkR35kMutvcNeAhIcTtEIzIKxTnHQl3ktZyZ+DLDHA=
=bogz
-----END PGP SIGNATURE-----

--das/wOmat2s314GH--

