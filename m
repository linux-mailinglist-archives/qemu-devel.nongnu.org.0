Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E2F44DCB2
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 21:48:45 +0100 (CET)
Received: from localhost ([::1]:46658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlH00-0006NE-5Z
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 15:48:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mlGu1-0004Pb-Er; Thu, 11 Nov 2021 15:42:33 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:34675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mlGtz-0007vL-79; Thu, 11 Nov 2021 15:42:33 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7A8395C0097;
 Thu, 11 Nov 2021 15:42:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 11 Nov 2021 15:42:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=6oMzCYPUictn4byQC1Vw6ThtpaI
 vSEIgsV7TMRODvUc=; b=X4UPpoWWN5yyL0twllNNnMoUrXeNZehgOrFdzKD4riS
 X5J956oFyscAEbKRNwT0kvaaCs23goET6IrTSt7yTVBi5TWipGM8+XqQA1PnD+Ag
 8jG9DsiJQH7bk+GVJbbLkvxZDddijFvJhEVJ8YqndcJ/++U+rhvj4AuylZZKZFni
 /SqY+eGCDXpkzox/ezEaGVlmbOrLrJe0xm6Y+lcbpfsT2P681KZ6ToJTAnBtEUnk
 jjwxThq9l/qo8b9001GDHWIpsyQ/G9T/+Vl10pZTb+MhaTCAYeroTVLasyWPvQzA
 3W35oPXEIH9hf40V62wQToNlASKJh80I9taoDFgSnUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=6oMzCY
 PUictn4byQC1Vw6ThtpaIvSEIgsV7TMRODvUc=; b=LstrKmAcd2c1YW2sY3wz5Q
 722jY/EPURFkfaoLGnogcsvwE7MqVuvAKT45EMxfdIAl+zTDeFqg//vaUv86y3Zp
 Dn+GoMRqJndyYTHPGT6Q7RR1thOWv5CLZig5gJZNTmqY3jkz0LpCRhfcJBD3Op/A
 aEwZmKY2f+wcu7eoy1z3rttPvXmJEG2fzI+ZIMUvCP4Vw9fHyB1PmdzrE28CS7aV
 OoHpRFko+DjTfUn7ps+g4WOe4A3grqnUkNsnDtSqoaUWuL7hJx3Md1QxlS0lSdZ+
 hGqmOJGfdoLnxtw7o5OaV65697hl/cQC0P9m4/B7YuHkzKNSCdzVV9snx9A4cL1w
 ==
X-ME-Sender: <xms:NICNYR75w5gceWJAZx0YQ84BbhnvRq1pXDoeGwZTu2ArdQbJAhDxMA>
 <xme:NICNYe4h4BCug-jZ3b0QxzkCDwxhtSZAoxax6pXEiL3luvoj0LG3QuJoXLPXlUyRx
 tjL7iCU2XDPjdTcATg>
X-ME-Received: <xmr:NICNYYeesjDop2q3zdkjvjDz_Zsn47R2jzBngECW_rGB2G7NMRH6ueX7pRKoeDTzYmBCSm0IP-0_g9d_FPwAsOhHv_-c-rSXxH2n1ekWnEs4N-vKhA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrvddugddufeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:NICNYaI10rE9gqUdSlNfpcbDDl9RU-aVhscaaV5wmf21Ik9jdoykAw>
 <xmx:NICNYVImTLx4wYYXXnpzE_Un1lDo4BJigqjzqo-iHVme29pKEFQtrA>
 <xmx:NICNYTyZWIcfXbw83DnJ50GVrrtwgEwPkEIH7Nk52iH0zuf1TRGc9g>
 <xmx:NYCNYd_huR4LK0Qp_XEzhpgwLGC6nA4yZayZvChbgchBi0cUdDx6zQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Nov 2021 15:42:27 -0500 (EST)
Date: Thu, 11 Nov 2021 21:42:25 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.2] hw/nvme/ctrl: Fix buffer overrun (CVE-2021-3947)
Message-ID: <YY2AMcQ/KU0RrSqG@apples.localdomain>
References: <20211111153125.2258176-1-philmd@redhat.com>
 <YY1cH52EbS1sEUDn@apples.localdomain>
 <2d711ff2-2280-a283-7206-0b5bd1db4bad@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vagu6bK+BirJGHbU"
Content-Disposition: inline
In-Reply-To: <2d711ff2-2280-a283-7206-0b5bd1db4bad@redhat.com>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Qiuhao Li <Qiuhao.Li@outlook.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--vagu6bK+BirJGHbU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 11 19:46, Philippe Mathieu-Daud=C3=A9 wrote:
> On 11/11/21 19:08, Klaus Jensen wrote:
> > On Nov 11 16:31, Philippe Mathieu-Daud=C3=A9 wrote:
> >> Both 'buf_len' and 'off' arguments are under guest control.
> >> Since nvme_c2h() doesn't check out of boundary access, the
> >> caller must check for eventual buffer overrun on 'trans_len'.
> >>
> >> Cc: qemu-stable@nongnu.org
> >> Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> >> Fixes: f432fdfa121 ("support changed namespace asynchronous event")
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >>  hw/nvme/ctrl.c | 22 ++++++++++++----------
> >>  1 file changed, 12 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> >> index 6a571d18cfa..634b290e069 100644
> >> --- a/hw/nvme/ctrl.c
> >> +++ b/hw/nvme/ctrl.c
> >> @@ -4072,7 +4072,8 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uin=
t8_t rae, uint32_t buf_len,
> >>      NvmeNamespace *ns;
> >>      time_t current_ms;
> >> =20
> >> -    if (off >=3D sizeof(smart)) {
> >> +    trans_len =3D MIN(sizeof(smart) - off, buf_len);
> >> +    if (trans_len >=3D sizeof(smart)) {
> >>          return NVME_INVALID_FIELD | NVME_DNR;
> >>      }
> >> =20
> >> @@ -4094,7 +4095,6 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uin=
t8_t rae, uint32_t buf_len,
> >>          }
> >>      }
> >> =20
> >> -    trans_len =3D MIN(sizeof(smart) - off, buf_len);
> >>      smart.critical_warning =3D n->smart_critical_warning;
> >> =20
> >>      smart.data_units_read[0] =3D cpu_to_le64(DIV_ROUND_UP(stats.units=
_read,
> >=20
> > Uhm. Hehe.
> >=20
> > This "fix" breaks all log pages. Take smart_info as an example. Say the
> > offset is zero and the buffer length is 512. The transfer length
> > (trans_len) then becomes 512 and it ends up returning Invalid Field in
> > Command because trans_len equals sizeof(smart).
> >=20
> > Worse, this "fix" actually *introduce* oob's all over the place if
> >=20
> >     off > sizeof(smart) && buf_len < sizeof(smart)
> >=20
> >=20
> > Example
> >=20
> >    sizeof(smart) =3D 512
> >    off =3D 516 (must be dword aligned to get to this spot)
> >    buf_len =3D 4 (same, but is always aligned)
> >    =3D> trans_len =3D min(512 - 516, 4) =3D 4
> >    if (1 >=3D 512) =3D> false
> >=20
> > And we end up with
> >=20
> >    nvme_c2h(n, &smart + 516, 4, req);
>=20
> Doh, I missed the '+ off' part in the nvme_c2h() call...
>=20

You wanna send a v2 just adding the check on offset like the other log
pages, or was there a particular reason you think it could use a
refactor?

I'm open to whatever can make it safer! :)

--vagu6bK+BirJGHbU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmGNgDAACgkQTeGvMW1P
DemdwAf8CEUARYgivpy7vPK7WqtgYQdTVx/W3WHgqL0BI1fstzeiYi7sFNWO3W2E
t1BFGx8JgwxxX72GVFJuUdKY3LB0nCPO9tgjyg5BO5v3AHOd4ilsF8e/9d8+A/LZ
Bo8gtqsPM4QDPq8LPK5TgoLEG4LSb3ZWMMw8O7vPYpaKpV/Rr02Btcz336CqU9q/
wMUYs/1ihI5e7l8sek/WJfjldW/rSuz1LPXTk86NIoqhgW96dWyEE7Dv/gnRHoo4
x32QGOLTYaRaFkZiWIdBJ/cKUGG4TMkpe9d7rmVZqgnNo+jnE1R60RBfnW8k/mR8
8Hs31VmRQUoNkvpBpVqMjMlw1qh08Q==
=DGQc
-----END PGP SIGNATURE-----

--vagu6bK+BirJGHbU--

