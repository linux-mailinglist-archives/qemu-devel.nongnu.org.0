Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D6E37110D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 06:56:49 +0200 (CEST)
Received: from localhost ([::1]:43124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldQdU-0003Km-44
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 00:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldQbg-0001Ro-TO; Mon, 03 May 2021 00:54:57 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:47441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldQbd-000804-12; Mon, 03 May 2021 00:54:56 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FYVyJ00grz9sTD; Mon,  3 May 2021 14:54:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620017688;
 bh=1ET68Nz5Vx2bzVLMZxIOjXd7uFvgRDdthEdWJmqLc8c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hi/kSh4/Dj0PEPAZuNBjtNYj/078xbw+vaO2K2dsYTKzdMV5cBuv73QFLq0ipzam7
 j6nLT7PFKvgmG5xZApfskviVpsHFWnYPPJNoxr9hhVuDoFIvxJTDVtcnbYOJ1s1xV7
 jnIItZMvjbgmbWSTZBu8sms6YPlUX8vmJcrW6Y5w=
Date: Mon, 3 May 2021 14:39:43 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 3/7] target/ppc: remove unnecessary SPR functions
Message-ID: <YI9+jxv3k/GqkVjl@yekko>
References: <20210430193533.82136-1-bruno.larsen@eldorado.org.br>
 <20210430193533.82136-4-bruno.larsen@eldorado.org.br>
 <8d2f4db4-ebf9-cf6f-ed3a-293f271ed34e@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FCH1lIn8l9vrG2dr"
Content-Disposition: inline
In-Reply-To: <8d2f4db4-ebf9-cf6f-ed3a-293f271ed34e@linaro.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: farosas@linux.ibm.com, qemu-devel@nongnu.org, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--FCH1lIn8l9vrG2dr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 30, 2021 at 05:58:46PM -0700, Richard Henderson wrote:
> On 4/30/21 12:35 PM, Bruno Larsen (billionai) wrote:
> > Removed functions gen_read_xer and gen_write_xer, moving their logic
> > directly into spr_read_xer and spr_write_xer, respectively.
> >=20
> > Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> > ---
>=20
> "Unnecessary" makes me believe that the code isn't used at all.
> A better description for this patch is
>=20
> ---
> target/ppc: Fold gen_{read,write}_xer into spr_{read,write}_xer
>=20
> Fold these functions into their single caller.
> ---

Agreed.
=20
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

This one looks good to me now, whereas I still need to think about the
rest of the code motion here.  So, could you move this earlier in the
series, before the creation of spr_tcg.inc.c, so I can go ahead and
apply it while we continue discussing the rest.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--FCH1lIn8l9vrG2dr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCPfo8ACgkQbDjKyiDZ
s5J6rhAAkMeJ4aJ/RnUTEbM1Dn08O3CvUL10lBqtiFgfznwBO3n3KowmwuntpsLh
0YW7Tm12RqFiiB8zB8N+WpktSPQgkKGTPD93AYNMy1cDSoL/VH872F9ERsmCRfSB
tzYksQhFJAB56MddoR7ourZDXuMvMTm45Ff3pXV4mKtJ5W4RH/HuZvCIsvue0IfG
ZmWbc/HUV5Ju5iJpJ4Tt/AxUG8eIWFVoujiaiwvK5BIvgDYCC3JgDrmJlkjexIN8
E0zTvp5/BYESU1muUU5RqDTRMadjqxwzPdK7LVKx6ccflrnL9KHHznFgSvFK6Y4h
jvVNCYoYC51Pn9NQFfUXTpPglJ6obx0tg3mA7XKh0L+bmiJ+eadPU8By93v9/AjZ
XJp4Olf13Kw17Xmf9XQLBOtQDBuCtWMCj1OkRwjdlDFvC/Vrvf6s4vTqqOkabG9p
b1yYyRGCbVprmr9hzeYjj+8FWrP80WdEVUDzrnNcYJdjaosNGvYChRPR9kapjh5f
pzzVNjlbSMj74ollVgSFQiNsZlLq3LJ2rYW7TUVwAuLgcLpYDzAX3qjCwa7NlT88
v+TCFXNm8bW9DVjUNqpfLRsWUcYZNeqJVQXR8ThCY3tGsp1hjT9aiAOF4aaJMPeq
O0Bs5cAMmPNuBMhZA8BOzswd6belTdDh/Rl1Hjo4IHrQgdXyFxw=
=0+66
-----END PGP SIGNATURE-----

--FCH1lIn8l9vrG2dr--

