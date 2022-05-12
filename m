Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF22524544
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 07:59:34 +0200 (CEST)
Received: from localhost ([::1]:54798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np1rI-0001ZS-8k
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 01:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1np1YI-0006Vf-GL; Thu, 12 May 2022 01:39:56 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:59693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1np1YC-0005o9-7V; Thu, 12 May 2022 01:39:50 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E958F5C018D;
 Thu, 12 May 2022 01:39:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 12 May 2022 01:39:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1652333985; x=1652420385; bh=lH
 GPB/kGNUZZD417lL3+6wSUBzD6N3jLInKz5BdxBB8=; b=CEL2s860X4Gd6k1/y7
 jnyU9EuVa0F1qM8eADm7jwlnPedV16cyTX+R1+x9y+iTx6HTdiGJzyy8u8QCJpGV
 2+0nTP1dZsXqFMtMQqK8DV6D0wNYnyLL3zppZFPaSyVRJVU8EFyI0rOsECrv4fzn
 2nT+3tgbKUUU/oDDojWe0/2fuMXt6i/GMRoauKG4+ZxxoyngX0nl6W/lJNN1ptII
 pHb0QWm3clDChPsTDE3ADOxeqC4DVdC+obFNBYluYxOLLeTorUq1lcCTbYCCbwOo
 Vvc//oQWPqJghklfsxavBEKOCT6PgM9C7yxb9xKFh3RnYqMhWsQPFi/cw1oVHdKF
 ThbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1652333985; x=
 1652420385; bh=lHGPB/kGNUZZD417lL3+6wSUBzD6N3jLInKz5BdxBB8=; b=h
 MCJYQGu6FltDJTc5EG1AnhWAUGRiYY3DbAcEOLT87SJwUl2csmsIf28rSOaMxm4Y
 d023i59ubbjKizuee5s7RNyZJeYUn9lNEX6CrGNVfgaE4VZrr5etxeQxl1meJdyU
 wbmdydHhkSjVCliRcpx38yZIQaUiDfYz3JLOl4KfP6VXHFfdWgEeTP/yZLEwNIAd
 VJihezD/etvAZAl/Gx2M6TLqlruJSPrNdL8TK6CltL6x2YZLKBUGlTZYkOTYDwm5
 z9wzmAwapVIMAoJVDJnr38Rj1dELn5llEUjn9Z6IdVoXqvFnIE/91RDeaQHcXHYT
 ry3yNHOaslnJA3QnOScnA==
X-ME-Sender: <xms:oJ18YnRblUSnLLe8kEVg0IzXgheaeHqa7B-pOLJ7abpjjH_H3WcwNA>
 <xme:oJ18YoxEqJLkwlJFP2GpmXWLciyrePvmMuXhW2gZ6o-P9W1nuMMoCnL6E3Za5o7Te
 7LqCUvOrPy1Zk4hTNk>
X-ME-Received: <xmr:oJ18Ys1Pqy-eZDtZaSLGZcZcgn7oDZI27NkbRpfibg3F5haH50twS_3Fs1xolCn8knbF-JE6LHbx7JyEFrI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeeigdeliecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteffffej
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:oJ18YnCUgtH27jPTRjxSmujjdObQB6oHbpuDdUt7R76jktunTmPjIw>
 <xmx:oJ18YgiYebmL1lq-M2PbggQP0sl5rHC3Phs1Qr2XoDTcPqfWSXx0JQ>
 <xmx:oJ18YrqHo8_t7_FD44yEyKqRQk7Kzna_YtkjqSBFApCL4kDvrI5OJw>
 <xmx:oZ18YodFe3U77TTqYy-Vj9MbWAfmxoH_JuZpHsyAhWD4jbVuKg2cRQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 01:39:43 -0400 (EDT)
Date: Thu, 12 May 2022 07:39:42 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Zhenwei Pi <pizhenwei@bytedance.com>, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH] hw/nvme: fix smart aen
Message-ID: <Ynydnnv3jksYDWx/@apples>
References: <20220506063649.13361-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MwJy4rHsajifW5t/"
Content-Disposition: inline
In-Reply-To: <20220506063649.13361-1-its@irrelevant.dk>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


--MwJy4rHsajifW5t/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May  6 08:36, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> Pass the right constant to nvme_smart_event(). The NVME_AER* values hold
> the bit position in the SMART byte, not the shifted value that we expect
> it to be in nvme_smart_event().
>=20
> Fixes: c62720f137df ("hw/block/nvme: trigger async event during injecting=
 smart warning")
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/nvme/ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 08574c4dcbc8..a2f6069f7fe1 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -5325,7 +5325,7 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeR=
equest *req)
> =20
>          if ((n->temperature >=3D n->features.temp_thresh_hi) ||
>              (n->temperature <=3D n->features.temp_thresh_low)) {
> -            nvme_smart_event(n, NVME_AER_INFO_SMART_TEMP_THRESH);
> +            nvme_smart_event(n, NVME_SMART_TEMPERATURE);
>          }
> =20
>          break;
> --=20
> 2.36.0
>=20

Applied to nvme-next.

--MwJy4rHsajifW5t/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJ8nZwACgkQTeGvMW1P
DemfTgf/cjbk7+R4kWKYXg4XkWQ7tWfwxg9l1pNf57YMJD3qwEEPc/lZCPCPZqE6
3u7BkjXCjFLNoico44BtoQO5xwiaVD92fnKAOtcRw4YEJwVj0AF6bB7u8lb2kdyG
X0T8Hr0jfAboGNdJz8o6v17pWTmDHgSfDqCbECQ8KroqR6L7NV3OIBs0BDCs9BX7
acGIdPRN2ta1p/MvT31aaaj65PwBtCvflqRSJAOJh6jVaXNV0wEesOP80oGjahCf
m35dU0UdiBAauJ4zN7yXRCS3lvD7kc9ZyfAwlnAWTPtk8O9x8waKHv4C6Bz2EyD2
awTvJx77G3iPxRopxTOWtVyzGqqV7Q==
=cjka
-----END PGP SIGNATURE-----

--MwJy4rHsajifW5t/--

