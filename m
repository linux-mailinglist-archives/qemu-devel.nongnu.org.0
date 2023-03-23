Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2347D6C65F0
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 11:59:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfIe2-00049W-1S; Thu, 23 Mar 2023 06:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pfIdz-000494-ES; Thu, 23 Mar 2023 06:58:07 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pfIdx-0007ZC-HP; Thu, 23 Mar 2023 06:58:07 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 54F8D32008C3;
 Thu, 23 Mar 2023 06:57:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 23 Mar 2023 06:57:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1679569077; x=
 1679655477; bh=x6qUFGHqxHmFZ8dFOq/PnhQfxWL5SL4X/KMRlfML1aE=; b=0
 UENfoTNUlpbLlflhSZC64SwgvEeOAq6DF1W9SZWrY1m0P9vh2SyLaTzMrpxgIBjF
 gyIGhu52qy4p/AZP6CM+Jo+UEkzIGLvcKszh7Qw9txlWwKituR0KmM/ZLPvpGEZa
 4pStHJVYtkk2S3uknXeMVV0xfkVzstboxPzinmA1U/kF5uZ3EM1T433HUWumomEV
 RKZ8yqRGEXRy+Q7VnykdGBtTOrBULVyZhNGOByUAXAsmsFHLRhWWYo+d/QbIjnQI
 haDv4s1EvCGxXVuOg6sR77oqUFz8nF+YYAwvMjHDh127WzmWIhxAhnZoqMGX0HLx
 CoR2sDR3AkzL1/OGTNQ/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1679569077; x=1679655477; bh=x6qUFGHqxHmFZ
 8dFOq/PnhQfxWL5SL4X/KMRlfML1aE=; b=RtdYvKr1e3XNeuVgDXKyBRXVCqXk+
 +Xxn0YtqU3QeidmLS2hZT2+PzdsqhbiICPFUmeJrnUJ4kjeC0MKxOebGxeWKRemR
 iJtLkEWy5BmBqcgPHxFM7XPcpF4QgwaEFIoISak7nsWHoPzZIEBxTBuqavt/w2Kz
 FmnB5iIoQlit3BBf6z0GZ3D8S5fgfIW7tag5uhnGyQV6Y3dBY68fTdzK1PoiBoHl
 mvbYiuZHdfHJZRVQtJ7iEXFjbVW0sOJmNt5fLFiPrsBOaCKbbL1inoNJyNGe3XVg
 Gpdm5hdvugTMGDLOu5ikM0judh6E9LuWJHxXcSAEE0iBGPYmLvcjH49QQ==
X-ME-Sender: <xms:tTAcZPufhEQZYsVzJfFedwO0IutMu2Vfif1GX5mihNCbWdWYHTgA0g>
 <xme:tTAcZAe8jcE_TNh0hdEctEqSdp62Wa73Kwyj0kziLDwyuqPzCGAUonzzvVnrN9m8U
 8A3bWi4yHVb3xh61GI>
X-ME-Received: <xmr:tTAcZCyxGyA7uR-X_NZmrP3NQw_8bMvSvGHjfKB9J5WCqS6pt4q66oE_EqGBPmNL-z8QMpGh6QrbjImbArDvxCKhVW4tNzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeggedgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:tTAcZONja06dA77UODACQK9GD2Y5bTPzkgT-5Du8_UMPRPErO3AJsw>
 <xmx:tTAcZP89_wpclzbzn2U3mUu5XU1yv9yx3Azh0fvq8huQVSu24KguWw>
 <xmx:tTAcZOUbW8oX3eIQGvTYfIUbZiTVXlXnRwnLk47dP4TQjWzw3ooMfw>
 <xmx:tTAcZLYY494I5c7AYO2AX7_EIX9XGH1U0flROhJnYMc1oXtr0rn4xQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Mar 2023 06:57:56 -0400 (EDT)
Date: Thu, 23 Mar 2023 11:57:54 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Mateusz Kozlowski <kozlowski.mateuszpl@gmail.com>
Cc: qemu-devel@nongnu.org, mateusz.kozlowski@solidigm.com,
 Keith Busch <kbusch@kernel.org>, "open list:nvme" <qemu-block@nongnu.org>
Subject: Re: [PATCH] hw/nvme: Change alignment in dma functions for nvme_blk_*
Message-ID: <ZBwwsj9Z9Ej9ccHf@cormorant.local>
References: <20230320124042.1404-1-kozlowski.mateuszpl@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mdG9s6m9OhZbf4vy"
Content-Disposition: inline
In-Reply-To: <20230320124042.1404-1-kozlowski.mateuszpl@gmail.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--mdG9s6m9OhZbf4vy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 20 13:40, Mateusz Kozlowski wrote:
> Since the nvme_blk_read/write are used by both the data and metadata
> portions of the IO, it can't have the 512B alignment requirement.
> Without this change any metadata transfer, which length isn't a multiple
> of 512B and which is bigger than 512B, will result in only a partial
> transfer.
>=20
> Signed-off-by: Mateusz Kozlowski <kozlowski.mateuszpl@gmail.com>

Thanks Mateusz,

LGTM.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--mdG9s6m9OhZbf4vy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmQcMLEACgkQTeGvMW1P
DenvlggAi+bG8WiBeeIH589jAoAHgAnOWB5a720cRHCUlTAH+saXYMnuyBNzYhML
czR4nX7PCwnc84DM0Zpi5H3q+XN9YcCnj+1S1C3TApmcSc02QZWvp8BkiCoYjEqU
DOPyEzVQh8bn4TBU7DZb4SJE6Zxp6PmqkWAaB5EWbFVQjNly1hjDQwgfIXxzPWPQ
bbGanbDIcQTN2xZ0iw6VwCzO+d0A49wcBjCTh7MrtbLH5RcWyE7O+rjaOE6IS0mJ
cx58/zbsNhwLSwaNNZHrBhV1vahO9CEKfp5iwkZXpgO13+mZN/UXJLIpfnwKzo/Z
lHkWXaS8vFLIoMaaSkecEP37/C0zcg==
=cvja
-----END PGP SIGNATURE-----

--mdG9s6m9OhZbf4vy--

