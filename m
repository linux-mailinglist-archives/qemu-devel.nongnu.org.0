Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BC83038BE
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 10:14:11 +0100 (CET)
Received: from localhost ([::1]:54068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4KQM-0004Qa-Jo
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 04:14:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l4KLK-0002xN-55; Tue, 26 Jan 2021 04:08:58 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:37341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l4KLG-0005wH-Ss; Tue, 26 Jan 2021 04:08:57 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 62E5E5C0174;
 Tue, 26 Jan 2021 04:08:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 26 Jan 2021 04:08:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=yBV97bkMaH+vIpyPKZAmeiXLmdU
 mcUq5/661GQIYJbc=; b=akTp91R1VL2G4DkXRADxiaRn6IaZN1lnoDy/T3Kt/bY
 lwjoR9u/zlYR5i9KqMpWLn0ywA6KjcyUbqNL/QYHrBn3lsoJVxux3PVwN56BBsXX
 OtiQhsVP610QkzBoe7bUZ/ID8WtrvleiwREjtkHC1d5LkXI/oHF3xEw0tEDqvnex
 UwaWHayenNYk01GT1lan7tRZaZqxthWAosyrCusR+jU4Sn0RNo+uYi9N/Zm7Rpyj
 dT6p3EbS4qtd/+/EcWRVyJc6oXf7uGlvAG/KkNo7RKD5eaWZclOz3ePgl8+IbtUM
 +i9bKamGYnro2Tg/yfPjryPhQjXKEAZCNGvytcIHQGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=yBV97b
 kMaH+vIpyPKZAmeiXLmdUmcUq5/661GQIYJbc=; b=Wh8MpQmbZNSenVWuN2mfA9
 HMpZGr8UvF780f+VyB0WzpcGX+zye53WWesDyhLWxYTX6vw9/rAxyuCvsvABphiS
 oLDfKLl39HKKn5FmEoAMVtqfbsfByJJxVsLyBtHfUZbItTUkq4rWfp8ZsOaWVXVv
 8BzHGdTviZ6OU2CU4A1APSTvTOsp106bNmA/2pxh755hjARtZHmYwIBvy1XZ0mdI
 p6b/pYRazg7iqG7qzUylPBjKtexyuspkvvW1HHIHad8YtiJ0sV9UC9qwvqasrYdr
 +/MeZJjEvebQ/xIzbeqnK/oAs0M+De8dJE9MRmezhG3//NqaZ1FKsUUO9OZ3fD9w
 ==
X-ME-Sender: <xms:JdwPYPNFj0_AK5ZggzUTzn2q7H6mEsUXZLnVuHYaZILHS8S_5kXK8A>
 <xme:JdwPYOQFdWzcp1ReAqxM--goo_nI62Ngj6F0WrsRQdTTpF61WB8MoTmAhC5eRUvPt
 O0HclpneXstA07if4M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 epfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhsucflvghn
 shgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrhhnpe
 ejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudffkeenucfk
 phepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:JdwPYNYM41IY89ISGuR7gCX4FvSngaGdgLBZ6XNsRZDmKOFpxNQ8MQ>
 <xmx:JdwPYL2yTmPcHuczlfps1DaafE-cyrdemfm_fP1lZOdxPI_TiQ21rg>
 <xmx:JdwPYNXw0d0GbbK-e1i7YHSagcXAyFx6wE6nUlJFo5p1XkU2jSYnWg>
 <xmx:JdwPYAldSUCOUnaQEuvLeigx85MqA-VaoydvinGYkbCs9c4krrJpmQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 215BB24005C;
 Tue, 26 Jan 2021 04:08:52 -0500 (EST)
Date: Tue, 26 Jan 2021 10:08:50 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH] hw/block/nvme: fix wrong parameter name 'cross_read'
Message-ID: <YA/cIsINJkFbtnWr@apples.localdomain>
References: <20210126001924.3963-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/h7ZcNpcC20mriaT"
Content-Disposition: inline
In-Reply-To: <20210126001924.3963-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--/h7ZcNpcC20mriaT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 26 09:19, Minwoo Im wrote:
> The actual parameter name is 'cross_read' rather than 'cross_zone_read'.
>=20
> Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
> ---
>  hw/block/nvme.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 21aec90637fa..bf9134f73d81 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -81,7 +81,7 @@
>   *         The default value means there is no limit to the number of
>   *         concurrently open zones.
>   *
> - *     zoned.cross_zone_read=3D<enable RAZB, default: false>
> + *     zoned.cross_read=3D<enable RAZB, default: false>
>   *         Setting this property to true enables Read Across Zone Bounda=
ries.
>   */
> =20

Thanks, applied!

--/h7ZcNpcC20mriaT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAP3CAACgkQTeGvMW1P
DemNVgf/bVHGE7bQc0jtPNkB27xKU4yeqsqvTbFsxsSdlNwsa3+VdEE8KIDd7Y0F
KykX/NfbYv54x1TX1GGBYD2DKb8GuzLX6YGr5jkBv8nl6etsR83r9z7b2cYXeQ2X
UmMZ+fWNn5MYpuiWoR4hPWuhNmcWT60oRPAsrK6bqs5s6R9kLdT0HUL2CMgDuF9i
z3CHvvYGUVQsbPgqK6Ysj5Y7xwoQsyRR6P3ISslfbmlSOHSWQ/5vAzpK06VveuEN
U5NGRsrEmwfgZpAmWPjBkq66bgy3Ly9Jlp5AZiz24pmJZR3zRir5LSBZJ0Fh2LKu
9FXu3xIAo89JKbyuHdGoxMLIVrLOFw==
=h39U
-----END PGP SIGNATURE-----

--/h7ZcNpcC20mriaT--

