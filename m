Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AE244DB77
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 19:15:04 +0100 (CET)
Received: from localhost ([::1]:48804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlEbH-0004PO-Af
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 13:15:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mlEVg-0001Wg-Lx; Thu, 11 Nov 2021 13:09:16 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:53411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mlEVc-0004kt-U2; Thu, 11 Nov 2021 13:09:15 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8ABFB5C0175;
 Thu, 11 Nov 2021 13:09:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 11 Nov 2021 13:09:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=AYzN6rX/u99uNmVBDydim/Vj2gA
 XFqH7WFUIxwWl3LE=; b=gPeERHnGy5kqtXB+K3Twpy/rquCRloMYsbX06KclH7O
 DjYfeFHmfYEcqD0nxYsuun//YAUWk84eUqVB4ZoI1+96VdQiIlnEaCLONALch1a3
 jUMwNtsUqJeHHand79ISXHA6yNn2RpJ0adNiuo9jKGF5jU7jwxxucIYHFAvzbFYU
 1/rjAhMcKRo1lLVBCnXEArN3yPXFHR8wnFI9JPfLJtN6w/uixfiCCzolv4dmVdwh
 5LwEM9oaKezV0/qjf+2Kxgq6rnmNeHELWHvFMXGYGgRjafHavCbhMonAUPUgY8UH
 HKjwZoBKPPM/K8eX1by6tC0txwwey6ZC0O8uRoqjSCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=AYzN6r
 X/u99uNmVBDydim/Vj2gAXFqH7WFUIxwWl3LE=; b=TqwIvRcE8iwL7yAPg28Pjr
 yAjE0oXWZjtHPrEUhmXkawOklmuTVePcL3wVEbOpGhoFASh/HozfCnX5Q0slbG4V
 2NcoVPk9DqCoyhx/fBCgW1kiDHSl//iYUmHxNfVK/B7Gp3O2Otn4qw+dRK8Set4n
 S3eRv0QyiBA9BicwZR+MRHU7Ti0xflcOZRhO3M4bDedcjSMugoJ+8OOlyw3hjMRY
 DQYCsAAoGEEN0fo9i8deGKijIabW85+LVN34Mb+BIN5zPHjO1JOWLLjOS5y48Q5g
 Vz080uV3ya1aJnBW8CTmqTRBy1wqI5BlbixbigAX+dL3X155q8ZU3tZVl0ne5VyQ
 ==
X-ME-Sender: <xms:Q1yNYfoTvfP3MyyeUJ-tsOaxrEUtOY7eCP2ApoYWpOoxbPNdfOi6Wg>
 <xme:Q1yNYZo54iXgLVuDeT_BtI4BDktBapVuVOYUgEg7k_yrTOJ18nRZ-9K6Q6AXWSZ0-
 EU6KaOrLH2Rdu1KjkU>
X-ME-Received: <xmr:Q1yNYcM6a_6-E03AJ0UKM7oAewBMpvmK0mAn3wJW6WPLBZxqcHq0qD8BjxDhKDw34yrQnvKDFS41A0AIofougsNdCwMEB9OLui8x3JU9kOv1ryzSGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrvddugddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpedugeefveegfeduhfeuledugfeufeetheeuhfeuffejgeelgffgtdeffeduvddt
 veenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:Q1yNYS6jGjWam6-cxdMf1y2eddvofoYSqHrDCZIOf0WA00ZloFKkHQ>
 <xmx:Q1yNYe6Snhl29xSq8kcHY5pMVU77i-DaX53E3POa2MKK0vlk3pr8KQ>
 <xmx:Q1yNYaj_1Lid4bjQ5XzMhuvDVQKC53OedftaJpgd4eG12S0H8g6KrA>
 <xmx:Q1yNYUmyLk-DMpEet1ZbweBVld1TN4bMcTv6-WDmiRySHLzk-6mJcA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Nov 2021 13:09:06 -0500 (EST)
Date: Thu, 11 Nov 2021 19:09:04 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-7.0 0/2] hw/nvme/ctrl: Buffer types cleanups
Message-ID: <YY1cQEvB+YK1VA01@apples.localdomain>
References: <20211111154552.2263410-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uORX5IDRCTsIQ2zU"
Content-Disposition: inline
In-Reply-To: <20211111154552.2263410-1-philmd@redhat.com>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--uORX5IDRCTsIQ2zU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 11 16:45, Philippe Mathieu-Daud=C3=A9 wrote:
> Some trivial notes I took while reviewing CVE-2021-3947:
> https://lore.kernel.org/qemu-devel/20211111153125.2258176-1-philmd@redhat=
=2Ecom/
>=20
> Based-on: <20211111153125.2258176-1-philmd@redhat.com>
>=20
> *** BLURB HERE ***
>=20
> Philippe Mathieu-Daud=C3=A9 (2):
>   hw/nvme/ctrl: Have nvme_addr_write() take const buffer
>   hw/nvme/ctrl: Pass buffers as 'void *' types
>=20
>  hw/nvme/nvme.h |  4 ++--
>  hw/nvme/ctrl.c | 12 ++++++------
>  2 files changed, 8 insertions(+), 8 deletions(-)
>=20

Thanks Philippe, LGTM.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--uORX5IDRCTsIQ2zU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmGNXD8ACgkQTeGvMW1P
Dem3EwgAv55ybgUqMlFw7jwy6d0gmCNKcZ6K2I6gPh5aaPegi71Xf0WQTKjUR22K
Cb/5/1YOkeEQaYs9iSr2H54QMvMYvIiK9sMxR+8XQEkFhT9q/lyxvPxiHz4CMWqN
Uv2mowGQaNqYqxbuWkwkfDrHQutHp+sHs0l46fgib1PoRblpltIO4J9R74q+mEEV
8g8ywapc1/bIXUB6Opgkx8SzG74Afmh51ktbdX1X96933TrLkQm1dP2dKOfPhyNp
u+NcYkWX85Kpf1RCrHonx0ewrfHwO09pD1McjSSV7JmCXmV0D/cBOHmYVBOfS/A5
tn0FJvr5u+dVJiNT6o8aSq0wjRgq+w==
=BHCU
-----END PGP SIGNATURE-----

--uORX5IDRCTsIQ2zU--

