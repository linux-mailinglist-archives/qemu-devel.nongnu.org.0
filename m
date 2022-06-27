Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E2355BB48
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 19:17:18 +0200 (CEST)
Received: from localhost ([::1]:47052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5sMP-00072S-Cr
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 13:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o5sHH-0002PW-F7; Mon, 27 Jun 2022 13:11:59 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:56381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o5sHF-0004od-Dk; Mon, 27 Jun 2022 13:11:59 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id D61183200564;
 Mon, 27 Jun 2022 13:11:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 27 Jun 2022 13:11:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656349914; x=1656436314; bh=gO
 bmEoBtIQrFy73h+DhcqssZWIJa+EAeOccJyy7jAfA=; b=WBDZYmFe40tuB1uQ16
 1qNOjNAEElRMDgPPcYR8lBKr2mi/vX5O9sUpZFIOcSTZBwip9XbZ1zDlxiN8uNZk
 25ZUZ6Ts4ULJUl4SEBry/bYkXJ+aQgHqnoEmKkCoi+cshxtCk5yg7S7oJ/R9Btie
 8XITt88bRYGf0T1cMBRbo1pF+PVuIc7oUgpvfM5hlbBH+EMaBZovdd8elOel53CL
 STLa3a4dw0m38s5e7nBF8eIin78aZEeVKo01v4ex9Z+5W8Y0r4hHHUcL8Uc3m1uz
 +tG+1qsy0I3xSek+Tp5fIaCy2X47F8LJnvVyA1ET5nM+xR/vnlN6yzD+b3Vxmu+X
 lHDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1656349914; x=1656436314; bh=gObmEoBtIQrFy73h+DhcqssZWIJa
 +EAeOccJyy7jAfA=; b=PKDp7t23kDhZLD0MLPBrJuzisbLzpxA3oWSshWO9a9jk
 kmWGkeej8I9CzB1EgjhVBVeLxDdboqRZln5/5WcH6m5695HbZ8jnK47QPNOVc2nj
 2Uqk67P9GaB3IsYpfdg3a+KsZkCGYQe8eOKtI0LW/8Zc1NhkxR3eQYuhcoOJk2KQ
 4Mja74sB8kq7Z1D9YDA3bhYAJWTNhw+aqcq/HfpyQhl3sOH2s8sfsDaILPQRlKEL
 ewsVrn6kbFI3e1pNKv6OunE32TJmeqtaEbN1u9/pXQs/hojF+2U12sA8QspFlyOE
 5/0DLwahT54GzXbUAXEEgtXhG71Fk3i9AAl/EGLT/Q==
X-ME-Sender: <xms:2eS5YifetWA74x2lB1Y7bbZe_u4DnGlvx1f_pFYqg6Pkgfu4rMOJaw>
 <xme:2eS5YsO88HjoCGhG9us5ZIxRnAP2iBbsCh7z7IC99vjLOOobH3ZNuA8G2QWhFSVfj
 zlu5V4KLahfw89VBtU>
X-ME-Received: <xmr:2eS5YjjpO92fjFuOfoIuVznNuxOpfSMsDw8LiBlFTE5dM7Z9ZAAHc1Dir_mUOs8wW8qpTyb1vN7ItLdo6pM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeghedgudduvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteff
 ffejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:2eS5Yv8IjtrlVspyp4LrKcYjJipYrqNdP0Wio5sJ5gQAdOT70oeO5w>
 <xmx:2eS5Yuuy5lNMcHNXRKeNg7AwXCLErStUOsM1Ymvh_g4s49QCoD-Z1g>
 <xmx:2eS5YmHsgznys2AuzMiQ8tp41zvu6--tSE7bPaxTvlZ0SqzUJnGJ9A>
 <xmx:2uS5YiIdf6jRFSm6BLjfLy-5zqgC66TV7NRKh8XVb9UA6WretN-Ang>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Jun 2022 13:11:52 -0400 (EDT)
Date: Mon, 27 Jun 2022 19:11:51 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: kbusch@kernel.org, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/nvme: fix example serial in documentation
Message-ID: <Yrnk13dtEptPYVIA@apples>
References: <20220627123957.363889-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lkgwK/+0Osax24zh"
Content-Disposition: inline
In-Reply-To: <20220627123957.363889-1-niklas.cassel@wdc.com>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--lkgwK/+0Osax24zh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 27 14:39, Niklas Cassel wrote:
> The serial prop on the controller is actually describing the nvme
> subsystem serial, which has to be identical for all controllers within
> the same nvme subsystem.
>=20
> This is enforced since commit a859eb9f8f64 ("hw/nvme: enforce common
> serial per subsystem").
>=20
> Fix the documentation, so that people copying the qemu command line
> example won't get an error on qemu start.
>=20
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> ---
>  docs/system/devices/nvme.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/docs/system/devices/nvme.rst b/docs/system/devices/nvme.rst
> index aba253304e..30f841ef62 100644
> --- a/docs/system/devices/nvme.rst
> +++ b/docs/system/devices/nvme.rst
> @@ -104,8 +104,8 @@ multipath I/O.
>  .. code-block:: console
> =20
>     -device nvme-subsys,id=3Dnvme-subsys-0,nqn=3Dsubsys0
> -   -device nvme,serial=3Da,subsys=3Dnvme-subsys-0
> -   -device nvme,serial=3Db,subsys=3Dnvme-subsys-0
> +   -device nvme,serial=3Ddeadbeef,subsys=3Dnvme-subsys-0
> +   -device nvme,serial=3Ddeadbeef,subsys=3Dnvme-subsys-0
> =20
>  This will create an NVM subsystem with two controllers. Having controlle=
rs
>  linked to an ``nvme-subsys`` device allows additional ``nvme-ns`` parame=
ters:
> --=20
> 2.36.1
>=20

Woops!

Thanks Niklas, applied to nvme-next!

--lkgwK/+0Osax24zh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmK55NQACgkQTeGvMW1P
DemlUAf/Qb8jvhe5Ci1mkmGvk3y0D2ceV7YH8MHJFIRXDe05AVpJ5uI/K7BImvp+
crXu9hB6MjiuxWT/VD6N3HpbbHrXQb2+5j1PYS07s+5vgxo5MuXKEKmf5MtNgGFt
Idim8JoVIlGz/6AH8+Ty0xHvAsBn8yJDR4u0m4rOr8SotkBk7Epkf132czcbNrJe
1OvtjAj84XrLYeSDSocluua7wWan378Gs2wJckknXkVzsIuyBstW7NvhGEOSQMwf
UwKZjZEqEBqLj9JgVeshDJe4FtapNJC/QYI4ZRZ9nAErASB3hGeNqMJiQ5b9pOvQ
kNpfzy1lmOtXf9KPwDe26LcbilhUhQ==
=FSCE
-----END PGP SIGNATURE-----

--lkgwK/+0Osax24zh--

