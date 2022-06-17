Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28ACB54F139
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 08:51:39 +0200 (CEST)
Received: from localhost ([::1]:50908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o25pR-0002It-MN
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 02:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o25fI-0007hN-GD; Fri, 17 Jun 2022 02:41:08 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:51795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o25fB-0008U5-Ff; Fri, 17 Jun 2022 02:41:07 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 230B75C00D9;
 Fri, 17 Jun 2022 02:41:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 17 Jun 2022 02:41:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655448060; x=1655534460; bh=mc
 91Cklbr3H9EupsKkyM21/iF1cYCMMZZMxdxir9pNk=; b=gYur4pugluG9AhAd+l
 eedeyaK98FmFJoccn/EN318Lz8dswEN2xXMutl1QgfHnttlvYExbqRLgxaz0vAFO
 M8FbgcPHxZ5xwWChI0cMOlziqdaWPqYsptytDGRzXW9nWJ9dXH5OovcBU5cfwVo4
 LhbEXN1R9p2hS9txW7150MtX3DW2XhaNC0AQT39b9dall8KN7jKwPRFexThiZRSL
 bkJGrgOzzgX03kbaI/F3Rq95bXCeRd57z8e0mFrc59bIq6ScB1wGHgzaNCyNhveU
 pQm3ARpzm4xrXbwC/9lKozacxxx+NHVUt25om4ph09d0b6THhKGpQypPaoUckQnW
 HhTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655448060; x=1655534460; bh=mc91Cklbr3H9EupsKkyM21/iF1cY
 CMMZZMxdxir9pNk=; b=OxyYAuLE9dRTLTO9spA5sT7ZCTo9LguKp4fh+UyyLxNU
 LK0vnb+ft5LxwpL25Bj6c3gZ6zDE6Zx5m7A5QG1j8G1SqEoqMcSicaALoflXfbfg
 RBcbQ1S679DoPoDa9KMUdj4IQ9GbK4pa4hEZBnk68FyBQhaK8ifvFYrB58N4XIXZ
 qaG6Nk0x50rsMWjeOBODMVquDQzyrzp6ojDfxBgZCHmG3scHvyEnqGpZZvxR7BRG
 8fpctAUMFbNyjPJF2LCKVVtFNUyNEqiN+CV19MIRZS189UIpJu/L4oJGTe2ms55K
 UjEc+4m1mJxShic+ufnEEzoTHjcLLr0Ih6h9dEQEhw==
X-ME-Sender: <xms:-yGsYnZqYiEnAekby4NMIPLQemFb6mTAMxoZ8TgPr6YdfAa-1NdbTw>
 <xme:-yGsYmZ0S2OdIIEgx6zLwEq0Pu4rh12QFdK4GMw0W1cS2KCKgEQHiGoyDX5-G-QiT
 ZZYFPiuQA6lJU7PrHA>
X-ME-Received: <xmr:-yGsYp-LHMtBhVH-ZCWAA7iGjbdVMJvc_Xjpsbn75MgwTMMTeyFjOiYwdDBh0SoZojl_Wn3yLfuKzsXW_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvgedguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteff
 ffejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:-yGsYtq4D_4GAcItMbqSxvXqtJLc5xQhgJ-fO9kEn88WImgPKd5uLw>
 <xmx:-yGsYipVAf7UP04ovcureNIexF-58eVDIGTlbzJKw8iyf-t7YlWpvg>
 <xmx:-yGsYjSbs8hlewFWdsYuxtQAmkIMSNIue7UdGmBaw9W9y8tztnMvpA>
 <xmx:_CGsYlWzuAyr4JoHaoDPaHud1Gg792AqNDnDcK2W8HAqk8UprlDyMQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Jun 2022 02:40:58 -0400 (EDT)
Date: Fri, 17 Jun 2022 08:40:56 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH] hw/nvme: clear aen mask on reset
Message-ID: <Yqwh+OaLfcN4madq@apples>
References: <20220512093055.726022-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="a8r/GblAk6ODGdjv"
Content-Disposition: inline
In-Reply-To: <20220512093055.726022-1-its@irrelevant.dk>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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


--a8r/GblAk6ODGdjv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May 12 11:30, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> The internally maintained AEN mask is not cleared on reset. Fix this.
>=20
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/nvme/ctrl.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 1e6e0fcad918..4c8200dfb859 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -5889,6 +5889,7 @@ static void nvme_ctrl_reset(NvmeCtrl *n)
>      }
> =20
>      n->aer_queued =3D 0;
> +    n->aer_mask =3D 0;
>      n->outstanding_aers =3D 0;
>      n->qs_created =3D false;
>  }
> --=20
> 2.36.0
>=20

Applied to nvme-next.

--a8r/GblAk6ODGdjv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKsIfYACgkQTeGvMW1P
DenXFQf/QA10eterRyNtuynoJe960U0xmIex1dHrMJkMpmhzkzsYx3j4uDr5870L
aq/w9duN4iNCC55pHDawGy3QE7oerdTIxH4wCUpQhpKhG+DjmQG4gjoxINrpMfrh
2zL4FAXXtUe6zDhP4Kd4OERR1WVacII655NJhFR9zhKLZXzFbY0MxMPiVFNR9TgS
OLxRa5QN5/41Go5oybaKmCoGtGDXN1RJsY3rpI7nWSVYCYFdK57s+jmlahVaSTM5
1pcB9ytUk5vufPecNTT4yucqGLUris5VHQ+OQruMn+bNgKYwwhG2txbO/p9Gzn0N
LLS8gOtdtgyjBOJjKmVh8HTHYRCqfw==
=aiLa
-----END PGP SIGNATURE-----

--a8r/GblAk6ODGdjv--

