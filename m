Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB515876BB
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 07:33:05 +0200 (CEST)
Received: from localhost ([::1]:40566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIkWd-0002cQ-Gw
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 01:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oIkTj-00013S-2c
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 01:30:03 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:39871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oIkTg-0002N9-PY
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 01:30:02 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E54BE5C0184;
 Tue,  2 Aug 2022 01:29:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 02 Aug 2022 01:29:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1659418198; x=1659504598; bh=nR
 sK4EE5DQWRB1GOR/vqlv23UkRCh56QQ5Or7hp/sYQ=; b=2TJ8+2HDjoVW9XZ5wS
 XSmw2gFqib++Mh6UJ17ojrYECUvw/cMrUaVXvgGy1ZmziF2G3QCr0aCNY9xeWfuQ
 0erFBNWtUfx/n8+AJ23uXS9nZPkY/Fw/dSsRXJV9EiirMrWTuBmNf7o2teuAj7WQ
 JR5YQ0700yGb4vBJMwCVrI9grWXsqhQR1XQNFqNDklmRIc+d9eGhdX4KDPGnCzvO
 3gq1WI8tlCkpztOJTaUtodfWiXl8GBcHmIu9sDHYMoMkCMn1fjjFZ/bjZYqHStH0
 fFTy7xq5KRnKb6Xw8Ge2ohvvrPgT/gyYPbgqfdWBEMK4awzcWbDQN2biuYzCLbzI
 TDQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1659418198; x=1659504598; bh=nRsK4EE5DQWRB1GOR/vqlv23UkRC
 h56QQ5Or7hp/sYQ=; b=WFHgkLg+OB29+9BFsSnaibuHwOXbP3PoHCta9Mr3dPY6
 66q01MUacgiwimPG2pD3bbpunTF56O9dNPxVxDY1n4yf2f5LqKmK0GKL6O+ZlmBO
 OZwuyB/RamrUbVjssKVdAWpbxhhAQdJCcHOQCpZkwdwa68hAshsqMBSLgk+N2q7A
 9Ays4ptAulGayyo6DU1O2OrkiOo4/Ai2lCpKrBb6omU6KGRIlFGmTZl2DXP1cN18
 PboZvUjbXcnJ4yFDwxsNxi9O+WHyZh1OiUvppB23pBTapId3GsSbYWGW0zj8QDNF
 c+P61ZAXISSCbUXoDaHQVCJIxe2U5xikjYyVo14NUg==
X-ME-Sender: <xms:VrboYmtwvUhRs1jrT3SieHyUkJGgIhEbmQTkp8kI6x8XQlWPXgRhhA>
 <xme:VrboYrcbQ-AgpvqeC3mLFmgyb03X9e7p3OKn5yZXpRtt2OqzAPnP_fL-JE0YcJz0m
 v1joAOP9Fo6mDR9NSo>
X-ME-Received: <xmr:VrboYhyPjf0Rix7nlUR7fG-yeB5gpvJeUG6wT11QQPUq6N5QAEYNkrjaWOmWRb5R8O6Wq3O_aebeWmcB5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvgedgleejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:VrboYhODjJ5PbUpvcDP20Cqz5UcXHxi5gOvFs24izmxpXfAv7Mw2nw>
 <xmx:VrboYm-lXkvK7lXs6W5vN_alWU9eVnBtcRAJjqOBbY6xtUi31sSMbA>
 <xmx:VrboYpXGKGUtSVe3PJ3upho8eNLVbWisx5gjRiwdXmqdS-1Igo256w>
 <xmx:VrboYtaJyYFI-j_zWiOieeGd42VlqDrJ7nR4erBsp-zKOfrdxMq1Yg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Aug 2022 01:29:57 -0400 (EDT)
Date: Tue, 2 Aug 2022 07:29:55 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>, Keith Busch <kbusch@kernel.org>
Subject: Re: [RFC] hw/nvme: Use irqfd to send interrupts
Message-ID: <Yui2Uz8Gwdt8XZ6f@apples>
References: <20220709043503.2228736-1-fanjinhao21s@ict.ac.cn>
 <CAJSP0QWSGG4=Vj2j5yw2o13FrHbSC0WZ=MJgPj6Jio_5WhvOyw@mail.gmail.com>
 <732EF0E5-C936-43C0-8619-E8B6E565716F@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4uDoYIiW62Yy+Y3o"
Content-Disposition: inline
In-Reply-To: <732EF0E5-C936-43C0-8619-E8B6E565716F@ict.ac.cn>
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


--4uDoYIiW62Yy+Y3o
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug  2 12:03, Jinhao Fan wrote:
> at 6:21 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>=20
> > What happens when the MSI-X vector is masked?
> >=20
> > I remember the VIRTIO code having masking support. I'm on my phone and =
can't check now, but I think it registers a temporary eventfd and buffers i=
rqs while the vector is masked.
>=20
> Hi Stefan,
>=20
> While implementing interrupt masking support, I found it hard to test this
> feature on the host. Keith told me that no NVMe drivers are currently usi=
ng
> this feature. Do you remember how you tested interrupt masking?
>=20

You can probably do this with qtest. I don't see a helper for masking
the vectors, but qpci_msix_masked() should be usable as a base for just
changing that readl to a writel and mask it out.

This should allow you to do a relatively simple test case where you

  1. bootstrap the device as simple as possible (forget about I/O
     queues) - I *think* you just need to use guest_alloc for the admin
     queue memory, use qpci_msix_enable() etc.
  2. setup a simple admin command in the queue
  3. mask the interrupt
  4. ring the doorbell (a writel)
  5. check that the vector remains in pending state
  (qpci_msix_pending()).


This *could* be a potential way to do this.

--4uDoYIiW62Yy+Y3o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmLotlEACgkQTeGvMW1P
DemJVAgAw8h5fwp+0ChzXQMYOFcUOn8Ha0IRWn65uK4Vy4ujRuWOj1af1E51nDqm
vMP6ziIJszWcC3yoBJzLzsANVZlJRxCflKzBCTQ6AEadHs+AuJm0NJImVmaXC4YG
pZuw2AGnhUNETcW7QqSpBPyFSKEUO0DI/8jl1+iq+TaeNqDuRaY5MhvLcS54M4mC
xluxgR7eszkTIVq+Zuv9LbffGeMGFpmL+bSpUH2SpLfP6KMoGSOLRb2cCRiE04eA
4t9yVWpy8JtW7Jjz+4rPhPyH09GbHI0JYUqn4f92Aw6ObRizECtvwftiLPtOr1OH
4I7OM3jJZLKwRV+d1sN2tV5XYAm+jw==
=tS7t
-----END PGP SIGNATURE-----

--4uDoYIiW62Yy+Y3o--

