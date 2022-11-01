Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C576147C7
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 11:37:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opocj-00042e-PA; Tue, 01 Nov 2022 06:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1opocg-0003ve-4b; Tue, 01 Nov 2022 06:35:58 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1opoce-0007z8-15; Tue, 01 Nov 2022 06:35:57 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 17F063200413;
 Tue,  1 Nov 2022 06:35:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 01 Nov 2022 06:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1667298950; x=1667385350; bh=dQ
 WEif6xcM6bxHomB2MAGdSD4eQz4dVumsyrc7+Ttck=; b=rcui8kaqD3J/mjg7eQ
 OBomI4lfHvdzWcCjTS7ojHtjeHuMEJN8BwmVV0uUrFVpFp1Na1i4uzczIF1N7DbS
 TsKBxxbngpoUdCsk146RXYBiAfs8OSmHOx8AqMVAjD5P1Q3z65+eW6WHWKdj15XB
 CXBLdgnRlRKF5RKoghPNiKQvU1thOmXpe9RmzifhYdmDwsSeLOF0F77ZwhV17BN3
 FjuLItdI8S0SK0rVMlTNDtBpbgr0/pcmBQhTlhl+GqD16uJXBR2UHr2py8oKNaK4
 LcD9XmVrryhIes5XAUG474hPk3viD80PKWPSK0N2SQ3vr/kn+pfPjYNtxXgIQZXz
 7slw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1667298950; x=1667385350; bh=dQWEif6xcM6bxHomB2MAGdSD4eQz
 4dVumsyrc7+Ttck=; b=n0Jx6bMtoTbTWBSVb7zJyKG7xaoTTH+OkbWziYSxegB3
 nauYFdomI+WYhl1WPOBOyQrPHhQ8Nicnj+iCf1JoCjuM6Z8iFKfR9hu1o5oaqV6K
 HJUSMdsmb5O/QMyjAI1Ed4u7TK7mFclL0C/apxYQ1yk8T/MacBNefB07YVxPrhi2
 dNlc8ZY7iFvSBbjpF9px7j2d8yIC+YEDyTgdzLbc5ZOg0V90QazVnC3O3w8gwrhU
 I/H8vy3cT+dGalkpQTf/eaA9kCcAdiwKof1bmBaPJJr3VkLX3WQ53Oxb2KxZ/+lu
 3VZjqwyGKEN07cVQ341TtlOcQ84poLKPb6iHZFfbXA==
X-ME-Sender: <xms:hfZgY_HbFVlMPqbiLoDDhWI-JYI8Ph3jIE-37ip1rC0UE9-fgKe_Rg>
 <xme:hfZgY8VHC5rExtSKg7dIGlzFy62hBlDoqKsz5d4lVKLGoNMI6BUU8xDZhGkyjcNcp
 qQ0uNX3_WbIjhKP8q4>
X-ME-Received: <xmr:hfZgYxLlRLDmwpBgFgp3iyACe5ZicWKikjOcJPhtbrtwu4MRFTuVL-Jj4kNFhIl3XVvaVCc_zI5Tiu05TrnD8xm47Wsec5Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudehgddujecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteffffej
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:hfZgY9EgnwDtjwoQPj8AJGEF39T4CVmORrRswAHe27CHjB_ZwqqtXw>
 <xmx:hfZgY1WDLPal5Fd2q_h2bCbiW87ddkse2lyllI5rAoC2gtEcop58Og>
 <xmx:hfZgY4PlNBjnk4frVCiNnQEQN_GfBAhJbUbioUD4csh4_vEh-u2uIQ>
 <xmx:hvZgY7znQJsYRF4wSnf--4txjb5bSMY_0NEwKMx8jY-KQ8x1rXzdPA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Nov 2022 06:35:48 -0400 (EDT)
Date: Tue, 1 Nov 2022 11:35:46 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Jinhao Fan <fanjinhao21s@ict.ac.cn>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH] hw/nvme: reenable cqe batching
Message-ID: <Y2D2gjX3kUYP9rCs@cormorant.local>
References: <20221020113538.36526-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gEYNcj6LGw35n26H"
Content-Disposition: inline
In-Reply-To: <20221020113538.36526-1-its@irrelevant.dk>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org


--gEYNcj6LGw35n26H
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 20 13:35, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> Commit 2e53b0b45024 ("hw/nvme: Use ioeventfd to handle doorbell
> updates") had the unintended effect of disabling batching of CQEs.
>=20
> This patch changes the sq/cq timers to bottom halfs and instead of
> calling nvme_post_cqes() immediately (causing an interrupt per cqe), we
> defer the call.
>=20
>                    | iops
>   -----------------+------
>     baseline       | 138k
>     +cqe batching  | 233k
>=20
> Fixes: 2e53b0b45024 ("hw/nvme: Use ioeventfd to handle doorbell updates")
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

Thanks for the reviews, applied to nvme-next!

--gEYNcj6LGw35n26H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNg9oEACgkQTeGvMW1P
Dek1VAgAgjASrbHRStfEIKoOsSdrRYBoYN1nn7/nsUIjsjB3qR5Ff628g4ZahoM0
APb0rsyOpSUG5RnpeG5CtTH1HuJ3hBBSvLlH+DHc7aVExo2HAYLoSFrWfPB594fv
bTMSAGO4hirY8PMnxbgUsaY5TvhzSw2VToXv8KXr9dqxVz27Nfo4mShER7Amfik+
ewSpr+IEiIttlDLyOBwAq/iH/8LNkFz0RLxDFggU9I4VOQ9Vt4X3aa9aWdWVEDzY
yI19Wm56IAIj1lg+MdxQuHNyc5QY+HyBZtBZRfBwT38BZtttEWwUxIJ9mWVt0/aU
qf5M+oiJs59E0BRJMJrMghLWUVA7Pg==
=HIYs
-----END PGP SIGNATURE-----

--gEYNcj6LGw35n26H--

