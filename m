Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 800FE401635
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 08:09:44 +0200 (CEST)
Received: from localhost ([::1]:40222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mN7p8-0007n1-To
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 02:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mN7kB-0006mr-AF; Mon, 06 Sep 2021 02:04:37 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:33867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mN7k8-0002sj-MZ; Mon, 06 Sep 2021 02:04:34 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id BCA852B00930;
 Mon,  6 Sep 2021 02:04:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 06 Sep 2021 02:04:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=EhB8zdp1k8N40nbLzrhY+lb+6k6
 TXv874N61LTFIGmM=; b=iCiiW4cRm7IT3n3esc9yESvG6U/zKQc70UNwkhpd962
 5du1dSSGBTq5q5sn9JlMczWH0pQB1l1bmiE3Tx8R3HaMz0j6MTCMxyNf7jgv6HZE
 M8Ov0XLU6ds50ac8IG7sg/n3CQGz0cplGS4Fx9YKcoHnB3Ke8Ggy3HHM1BMFwAYh
 rESdnThd5bXhRKoI7XDhdyWr6Ja1idBQsR5/0vkISqHGln/RA/w6sKcrkVTaRRgR
 ho3wWqtEDdJ8MGxslwfGjfpmA/mvenOlZ633eFgU+XTckF9GfHeowQKHmi1U7Jd4
 ForiZAcku+86PdrX3SDXk9/Mc3d0ICbjyDmITlmnLog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=EhB8zd
 p1k8N40nbLzrhY+lb+6k6TXv874N61LTFIGmM=; b=rytvudvMLkXLT8JO+4Jtw8
 bTBDQXhsy7LS8nORzm124PLS5Ao1uBAcJhjk3tS439llg/P1I46KQFt9z+PT7Vii
 7sZ1ZvaKPMa88NDOdRRROsy6GQmfaUKhDi5amefgihrzORcB/A5jycHfOnhHaKt8
 EpvL4mQErW3ZPlycKE5DOZu4KKz+yAYSFEQ7mmnpWd9hofuTyjgs95Jyde37ctOh
 QOQX3+nq7Mgl8vMGHN8K0M5X+9Tp2EcpTcQs23/yQPYQTE7INWLnE5ot4fxeDoEp
 6h8Aqh9Cfbt4kkSW2lVAMpdQzX3+Wta3EhLaV6BRpd7g/OVdc1T5mM1jE5Co/6cA
 ==
X-ME-Sender: <xms:aa81YVJg9wH6QjdFcPPuRn0Dd3cQKrMe6L1i9NkykcBmmSChlp9-GQ>
 <xme:aa81YRLLa0Zs21pGUFD46m0d05M2X0_RTfPYEzTLDTrUvtsRvR4RH3xpPOr-0fbev
 lyM7BgE0uidrEpoqfc>
X-ME-Received: <xmr:aa81Ydv6T5yWfYlzdPWckl6QMXPYC8bzTaZ9O2ZViI4DgY03eC8n_jJyqHClnDajSkCyHYnbAozfUdRMAgydLS5PRq2DOKR-79fbHZ5Km2dBIvheug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudefvddgledvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtro
 ertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgvlhgv
 vhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepueeuffeihffggfetheejieevleduhf
 etfffhheeigfehteejieetvddtgedvhedtnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:aa81YWb9NdpdDOe8YmJB8zdgG5rkM053t6wycxRn5MAL-HoqbHnyBw>
 <xmx:aa81YcZM8rRDKlL97EHo2E6JcHxVvwnjuLeRoGhrSDrDvVu36vS5iA>
 <xmx:aa81YaAwk7dvEzpFWrZjZ7axXXi5wl_FsqPAMA7i5Km2PuphYD4j0A>
 <xmx:a681Ycrqzj3f7Gm0fl_1ApRN2GbuuqbYN7so44eN342ieaJxHG4pIPfmdLA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Sep 2021 02:04:23 -0400 (EDT)
Date: Mon, 6 Sep 2021 08:04:21 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Naveen <naveen.n1@samsung.com>
Subject: Re: hw/nvme: fix verification of select field in namespace attachment
Message-ID: <YTWvZRwoMgqpTUXJ@apples.localdomain>
References: <CGME20210823114601epcas5p17b488aeeae3dd41d32ab3df4fd235256@epcas5p1.samsung.com>
 <1629716613-26819-1-git-send-email-naveen.n1@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SA+qQD+2rEa190Ny"
Content-Disposition: inline
In-Reply-To: <1629716613-26819-1-git-send-email-naveen.n1@samsung.com>
Received-SPF: pass client-ip=64.147.123.17; envelope-from=its@irrelevant.dk;
 helo=wnew3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, anuj.singh@samsung.com,
 jg123.choi@samsung.com, qemu-block@nongnu.org, k.jensen@samsung.com,
 d.palani@samsung.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, kbusch@kernel.org, prakash.v@samsung.com,
 raphel.david@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--SA+qQD+2rEa190Ny
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 23 16:33, Naveen wrote:
> Fix is added to check for reserved value in select field for=20
> namespace attachment
>=20
> Signed-off-by: Naveen Nagar <naveen.n1@samsung.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> cc: Minwoo Im <minwoo.im.dev@gmail.com>
>=20

Thanks,

Applied to nvme-next.

--SA+qQD+2rEa190Ny
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmE1r2AACgkQTeGvMW1P
DekwHgf+NyiEzfa/mGVo8ADJAO9RCphOuJs1T6GZF56cwB2fceOTs+Hluiv9/YWM
cwc6xMrTOcyr1xeZcQK6V/uMgM4QgpnzSZkbRN3O93Ah3bDAJFriAk3MZnjq524b
3FxTOnRr8GIpTjU5gn8YX8ACW5fcBNcAq9bu9A8nzFwXVe+5saji8J11dQ1xeHGG
N6291UqMOX+cELRN+CjKoHAJez60kn9dFuZK3arx7T4/8SlULTbrzfWiaO0uejO+
3zffncisFYJhdR6YW2mfu1NBiZTy3MBejJghahfWdaB1aV5U82DY6JjvhNNfXfEB
l8tlET8Xso9YNebBHzjjoI4+E7N1+Q==
=gTkF
-----END PGP SIGNATURE-----

--SA+qQD+2rEa190Ny--

