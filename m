Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EB15744AB
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 07:43:58 +0200 (CEST)
Received: from localhost ([::1]:33840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBrdl-0005QQ-BF
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 01:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oBrY1-0001kv-Qa; Thu, 14 Jul 2022 01:38:02 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:55479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oBrY0-0004w3-BD; Thu, 14 Jul 2022 01:38:01 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 65D2E320069B;
 Thu, 14 Jul 2022 01:37:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 14 Jul 2022 01:37:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657777077; x=1657863477; bh=qs
 2SihCQYuxKyjmr6zYnjmOdYjAOohguDRch6XuMUY0=; b=Reg+nE6mlsHaR0rO4y
 3Jh0E2pUyiaddhbzMq4zanKUd9ikOpIqyCi4+wGwiDJdrSuT7u/oZtEeann3WLwy
 Slm8IPHGVLup5b7q7CAx5npTSNNWgwXwnnDWQ9rcw4lUcoKZMxhT8voTcQwkQpDz
 Lz4mSA/AZWDa9nihwy+/fG28TOrXDJ4AQghe0JoRMRD/4LCeG4IZu8ymaou7CGw+
 uBtHruddM1kU3YLwf5XaUVH/O7lHH7R4pkgRR69yXWlsob1j2mB74uwJK8ku+nWy
 PIPZWmwmii20WaHDcS2EqcHEUu5rVpwdyoB8yDWDlMNEm5jNoBgHZs4XJT5YHY2V
 BM/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1657777077; x=1657863477; bh=qs2SihCQYuxKyjmr6zYnjmOdYjAO
 ohguDRch6XuMUY0=; b=0aodfFSn3bAjC4zzR9GBMWOmw9yvyf2mS8dVObm5fLms
 VT+9gahJoePaPhD69s1/IGFlu6jf17xCR/LsxcAo4+EJYlf5UaN+SOb9ACvRfWGj
 D7K/6xd/hwt59PUNRW5XmjW0rLTGGnADBMiqx4X8IhkwLB0QVI+4Ybg+mt6GOPy9
 5jeUKrwlvUdlr620jNVeyARpyLr4QPQwOlGZXFVv1aPa1sFXN5EwKO1ZMaD5zzaV
 yZs7RnuFfsdylCOYKjnMoZJQMm+mlU7mUE4v/cPz6TQNIfDi3rG58OomPGgmn90V
 cE/33RlsaUOsba/fmVBhVTE2EerJnM75+m/HDQe46Q==
X-ME-Sender: <xms:tavPYl1U-cTtNgpCFfKgxn-bBcsejHHgNJjqGQXdFW9XlrwkpdNgqA>
 <xme:tavPYsGVppPuVGIApqwqbU0O9wAP1B_uxs7-_yaiMGToB7NnnhqmY-N3I9tc3tY9q
 1lVnD8FZbpj0n_MjsE>
X-ME-Received: <xmr:tavPYl6BxetznKvtyq0_MXMwc44Lc3CIFwuRCGBhJahc6fFDzGfe29KvlXm_ATSnAg6Ju32Gk-C7yHpyS4I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejkedgleejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:tavPYi313eDpk9YBP5raN2UCzded9XqLAqtktGkpG2SkwXuWwK3nxw>
 <xmx:tavPYoGWh3Cd9jMSL80DvR8EfIQF2momZKmpfmcpECnbF1a6bhXviQ>
 <xmx:tavPYj-Xxdi2UMeofNTZPXCpj1mVknXw3mKo__0lUbhPgRx_q4qyCA>
 <xmx:tavPYsAFLI08ViY8wzWJV6hpz6PeF-I3eut44qj8zx3yg2FVuMntHQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Jul 2022 01:37:56 -0400 (EDT)
Date: Thu, 14 Jul 2022 07:37:55 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH 00/12] hw/nvme: misc fixes and updates
Message-ID: <Ys+rs0J+0YRMt6zp@apples>
References: <20220623211821.50534-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NzhmLNRoa+/Y2O3n"
Content-Disposition: inline
In-Reply-To: <20220623211821.50534-1-its@irrelevant.dk>
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


--NzhmLNRoa+/Y2O3n
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 23 23:18, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> This series includes a couple of misc fixes as well as some cleanup
> pertaining to the aio handling in flush, dsm, copy and zone reset. As
> Jinhao gets around to iothread stuff, it might come in handy to have
> this stuff cleaned up a bit.
>=20
> Dmitrys fix (nvme-next commit "hw/nvme: add missing return statement")
> for dsm prompted me to audit the flush, dsm, zone reset and copy code
> and that resulted in the discovery of some bugs and some general clean
> up.
>=20
> Klaus Jensen (12):
>   hw/nvme: fix incorrect use of errp/local_err
>   hw/nvme: remove redundant passing of PCIDevice
>   hw/nvme: cleanup error reporting in nvme_init_pci()
>   hw/nvme: fix numzrwa handling
>   hw/nvme: fix accidental reintroduction of redundant code
>   hw/nvme: fix cancellation of format operations
>   hw/nvme: fix flush cancel
>   hw/nvme: rework flush bh scheduling
>   hw/nvme: improve cancellation handling in zone reset
>   hw/nvme: improve cancellation handling in dsm
>   hw/nvme: simplify copy command error handling
>   hw/nvme: align logic of format with flush
>=20
>  hw/nvme/ctrl.c | 252 +++++++++++++++++++++++--------------------------
>  hw/nvme/ns.c   |   4 +-
>  2 files changed, 119 insertions(+), 137 deletions(-)
>=20
> --=20
> 2.36.1
>=20

Ping,

We are coming up on the 7.1 soft-freeze. Most of the above are fixes, so
they can go in after, but I'd like to get a couple of the other non-fix
patches in if possile ;)

--NzhmLNRoa+/Y2O3n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmLPq7EACgkQTeGvMW1P
DenooAf/eqM4aIFj0CaGkHWQYo/cgRPftfrsHLNcv5+ufVbLCzP0jSB0B6n1IK/5
ytBZhHZsYPtLsHNMbrYCETAZmxVzvRCqxnH+r+75wCABGS4KY2P62K7GtfQi5iJU
VhjsIC+TJwjRCyxDxQksHylNUmMHLCU+35moWq/8OmmC7Np0LW98uBf2+Yl8DoSg
6pnPX8lVGmYNnjXw/+JdVQgo3I2Qa7YZdKZQKjKMchTaW3QuZ+WfJpjhxUtkrJlK
i16pAdIvK/n8cgkW/2D5NPppzzeTc1tAJyRs6TYRJBQg81KyHId97U30k++LWMkP
ANuF4TdZ5e4Lr/A7prbu+rVrTA+C8g==
=T1bG
-----END PGP SIGNATURE-----

--NzhmLNRoa+/Y2O3n--

