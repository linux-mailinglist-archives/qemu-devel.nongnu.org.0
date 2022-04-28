Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA01513C95
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 22:21:13 +0200 (CEST)
Received: from localhost ([::1]:51310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkAdU-0005vY-Ck
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 16:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nkAYs-00041U-KQ; Thu, 28 Apr 2022 16:16:26 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:48585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nkAYq-0005bv-IV; Thu, 28 Apr 2022 16:16:26 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 0E762320095B;
 Thu, 28 Apr 2022 16:16:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 28 Apr 2022 16:16:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1651176979; x=1651263379; bh=YC
 tmQBjzS/jAsxZPZJMRZMtRSdHV0LThZAQXiIZP3zQ=; b=a2MlJq8F/i2hPmQ2VD
 xJ4Ffwmtdh0T9rt35d8UfCZl4p4Sl+NKyOlfW5WPVMMXGcEkBNy6jpOXcB8a29Qi
 5w6Zxpbk/lQ7P6CxqFeTDmS4J0PNkBfB/K8F4n3ES534XHLNqKUpB8UGxQw4veM5
 SwBB+YkyTiWlPQDi0Aal158ICoAbiWyynm9CKZPQh7yGXoDK/WBJAAOyYBlfFpvC
 cYLRlA86wSs/Rt8Pt4XlzPz7MqVLOwJkeJxi4G7ukvCoZFb3jPfS6VABsDKMPZaQ
 KnrXuFUt30NyfhVjdJCq8BXUHOYx8aBeVA27ntQPCF1sSSVW3983jgk7wRQUD1/W
 qhnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651176979; x=
 1651263379; bh=YCtmQBjzS/jAsxZPZJMRZMtRSdHV0LThZAQXiIZP3zQ=; b=O
 AWnlTLn7+Dw4gAOLyLP19QBzmXqte1oWZr8QPy+cNuuloUnAhkGtadZ8z7oilxY4
 anoYNbxga4DZ5Q/QkZvCAEcPt8gthE3ANGXGdrCT4MgNw7dfvSjFhPZ2y8x3d7aW
 tuUTLZdU2qiYOMva6mZToeam9EYgpUV1wLQPb+Ix5Y7Vzq/QmX9Ajm217lxn8ZLq
 pe1823vNT1CR8mmNwyMp2o6rmo++Y8z0SQ6smfk3R9Jsrl5KjGhAFSVr6tsEepiI
 +AgJTGsu2k1CD6cjy7hTi20tvPfLWBAEd50DzrMsL3s4LOlnHWJcwH9qTpCnnXRs
 yoDirK7CRMkGFPYtqvcRg==
X-ME-Sender: <xms:E_ZqYvtse3sVJ1qDwXUvUmFUsYD37miLRqR9dE_2ik9oEHr4nvjLUQ>
 <xme:E_ZqYgcF0eAjqgiDao6cTLLjdxMQhg0rS-lopj6xyP3LnLn0SlEdUpnD1eiVPFa6U
 UR-qKx3y4UEHu6Tm8c>
X-ME-Received: <xmr:E_ZqYizGVy_AIcGuETKwuXoZtz__9QJ8JjZRY9liYoBVJBJa-bIBb9RPosOleBaHgxhV_HFHUf5ICH769w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgddugeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgfejfeffvdeuhfeifefhgffgue
 elhedukeevjeevtdduudegieegteffffejveenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:E_ZqYuNU3iEuhWX2jQEmf6VkafZT4Vu3__BBOk_ACURDCitqI228ow>
 <xmx:E_ZqYv_adYOZ3eHKmNZzal-vdxnYgfoEflnNbNYyfummFLnLkiE8NA>
 <xmx:E_ZqYuX06WEv0u0jpyWHDYLjtvPFzBlVEDa6Vz0u1Em3_owl7eSasQ>
 <xmx:E_ZqYqkgxlOOX1p1bshrwQtEEh436EKErxAW4JjU73y-h3prIq51QA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 16:16:17 -0400 (EDT)
Date: Thu, 28 Apr 2022 22:16:16 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Tikhov <d.tihov@yadro.com>
Subject: Re: [PATCH v2] hw/nvme: fix copy cmd for pi enabled namespaces
Message-ID: <Ymr2ENnMLhKqqKe8@apples>
References: <20220421105158.ufd3wzivaougxokx@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4ckoOBN6yDibZH6w"
Content-Disposition: inline
In-Reply-To: <20220421105158.ufd3wzivaougxokx@localhost.localdomain>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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
Cc: kbusch@kernel.org, ddtikhov@gmail.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, linux@yadro.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--4ckoOBN6yDibZH6w
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 21 13:51, Dmitry Tikhov wrote:
> Current implementation have problem in the read part of copy command.
> Because there is no metadata mangling before nvme_dif_check invocation,
> reftag error could be thrown for blocks of namespace that have not been
> previously written to.
>=20
> Signed-off-by: Dmitry Tikhov <d.tihov@yadro.com>
> ---
> v2:
>     * remove refactoring
>     * remove write part fix
> ---
>  hw/nvme/ctrl.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 74540a03d5..08574c4dcb 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -2787,6 +2787,10 @@ static void nvme_copy_in_completed_cb(void *opaque=
, int ret)
>          size_t mlen =3D nvme_m2b(ns, nlb);
>          uint8_t *mbounce =3D iocb->bounce + nvme_l2b(ns, nlb);
> =20
> +        status =3D nvme_dif_mangle_mdata(ns, mbounce, mlen, slba);
> +        if (status) {
> +            goto invalid;
> +        }
>          status =3D nvme_dif_check(ns, iocb->bounce, len, mbounce, mlen, =
prinfor,
>                                  slba, apptag, appmask, &reftag);
>          if (status) {
> --=20
> 2.35.1
>=20

Thanks Dmitry,

Applied to nvme-next.

--4ckoOBN6yDibZH6w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJq9g0ACgkQTeGvMW1P
DelSdwf/aRLGk8cHdWNquT9jqSJuE7P08bJjN3rQ8hjmcXzvSe3Qxl8neL2b6Mpo
B5QH0ri/b4ox2UeZZiGv/ppWr2vuRsJ9irBL8ZC3MxCPCO7voaP0s2QBm936Mj9h
3IU1GLZGljKrXsvRhuhmWbojKlFRkD3n2yL23jOmmyK07I6ubszi//jDCgmngtUI
NVA6rYq9Y/ijSMWsK/miVGkYLrxwyBmQ20yYxHIAbNTuq36Z+Gv4rrpkI3P0lXtX
OgHr5FD2c4sPtVLR2tO+soAtTFQAiQDp8L/3PMaav/hZlBliudh6FgbZEnnjEHqD
rkRICnduWvjfmAVKkhNVJgQNLxDcmA==
=f/SF
-----END PGP SIGNATURE-----

--4ckoOBN6yDibZH6w--

