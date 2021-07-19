Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 290823CCE21
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 08:51:21 +0200 (CEST)
Received: from localhost ([::1]:47748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5N7X-0004kf-TU
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 02:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m5N0D-0000S9-QE; Mon, 19 Jul 2021 02:43:45 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:58933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m5N0B-0006YE-C0; Mon, 19 Jul 2021 02:43:45 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1A601580454;
 Mon, 19 Jul 2021 02:43:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 19 Jul 2021 02:43:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=vtlU3Q0W85WzXkxv7TLwX6FYtG1
 V4JZCzRxINboIzXs=; b=e5qsFS1/gndQaSb4ZGsGl8SICrA7oovJyYiaxQuUTb2
 oEOxACDWZOM1VdfXL6MhNAzwgTK2fqHH+vPiTSfjI3J2NkJdxJM2i4Hp+74lvl52
 7LxeIZ18wMGD4P8YZtGqSac7PvtyI5DBwKfZSu0SGLEzjFvgJCVUTWdp/ujDIOtU
 oIrgRqbBADv48sdAoEXH3eQlDMPuULQdvm74d96mQ7jljSWalSBVz1PLdy/wI1MD
 HDxJZ6OO38eoqcKV9fPbCMjnex9wu1O1xNddQH9oCuBrLc3x9xDLuY5RVLklGihL
 XsPp2MSaxc600T7rNcInfplZ38rHzXc42FuQVncfjiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=vtlU3Q
 0W85WzXkxv7TLwX6FYtG1V4JZCzRxINboIzXs=; b=LwTWWZYouO8Ddz3CL/49iv
 9ZSu9TSXmf2HykQPqKvTyX4KI2w8NOMJ+a6ofTY2jlXZqexTohl78851QF/kIFdL
 9C4wry2Gc6vNHQPZGmPAaRl0nQE2Pr2D+ibF86ELx8n3/VFPrzH/lJ5n8Aoboe22
 FrGz1jedbDXL+ayUbijk0stDqG+J+warubtYQ4SkTT6ZRynSrs76vEJkzMclnvvD
 EdwXqn9RzwWPba6hXhse2ViscI5lbFyJCP08xs0tNcCbteIaGG310qKZ9vy0CYsM
 o0/+oZUhiRxrvuOZqFhDuRgyIei5nCpk4erxIWwg8puF53UBU7QNHZcLRXt2RDkg
 ==
X-ME-Sender: <xms:Gh_1YMN4rByWxLzkNSvLaghC0hW8mLqmxnJiDHpuCnTW0iTIMPdpIA>
 <xme:Gh_1YC-5qN_3N6ai76x1h5cgMnBDehH2seAHAeQQtZbRKj4yoEfB7rRLIQ6roOr0e
 oSroeghE6gplPPiFI8>
X-ME-Received: <xmr:Gh_1YDRr60Fxd2LZPG98muFOMz75ctRMc4nJfNn2Z7iIt4vMjI2YbyjgzqBNbTTzFzCVFQ2Mlansi5GUIT5sjk0cNdKa_3Lpi0pryXoSYQDBxVWqwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdelgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Gh_1YEvJYMSJmwsju1ofOXU4QQJPIPwyt3cOoBEKrd64QLMHS64JYQ>
 <xmx:Gh_1YEfbdmmPqFut-hdMXuc4AYbrOIO3f7fNuU9547P8YeTWjchDjQ>
 <xmx:Gh_1YI3D9-iZESGEvudhZ8OosUygWax7f_j7_Rx24FDs0qZA1RKoHw>
 <xmx:HB_1YD8nHFmMNmmNWXrBniXROA3xE1TV96dtVKE7-UPckpeAGhjjfQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Jul 2021 02:43:35 -0400 (EDT)
Date: Mon, 19 Jul 2021 08:43:33 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v3 0/5] hw/nvme: fix mmio read
Message-ID: <YPUfFQpvpiYT2bKJ@apples.localdomain>
References: <20210714060125.994882-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+dVZrU6OKboBn6Py"
Content-Disposition: inline
In-Reply-To: <20210714060125.994882-1-its@irrelevant.dk>
Received-SPF: pass client-ip=66.111.4.224; envelope-from=its@irrelevant.dk;
 helo=new2-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+dVZrU6OKboBn6Py
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 14 08:01, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> Fix mmio read issues on big-endian hosts. The core issue is that values
> in the BAR is not stored in little endian as required.
>=20
> Fix that and add a regression test for this. This required a bit of
> cleanup, so it blew up into a series.
>=20
> v2:
>=20
>   * "hw/nvme: use symbolic names for registers"
>     Use offsetof(NvmeBar, reg) instead of explicit offsets (Philippe)
>=20
>   * "hw/nvme: fix mmio read"
>     Use the st/ld API instead of cpu_to_X (Philippe)
>=20
> Klaus Jensen (5):
>   hw/nvme: split pmrmsc register into upper and lower
>   hw/nvme: use symbolic names for registers
>   hw/nvme: fix out-of-bounds reads
>   hw/nvme: fix mmio read
>   tests/qtest/nvme-test: add mmio read test
>=20
>  include/block/nvme.h    |  60 +++++--
>  hw/nvme/ctrl.c          | 362 +++++++++++++++++++++++-----------------
>  tests/qtest/nvme-test.c |  26 +++
>  3 files changed, 276 insertions(+), 172 deletions(-)
>=20

Oi,

A review on patch 3 and 4 would be appreciated so this has a chance of
reaching Peter for -rc0 :)

--+dVZrU6OKboBn6Py
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmD1HxAACgkQTeGvMW1P
DemV4wf9FaK7ZG8+CHuQSWonhSglBHU29oT5K4f11OXGfyXL2eO4FNA9EgN31zMz
q2/pJBwvaNlyfkyYgeBbz/j6daSAIG7GKiBMqxdzAEb/mdbtp6fbmGDDAG3fKcZr
9uLjY2G0GVczn5no1bobBvxdZT+lMrhNafWvSCnVoISniTEbvlTiKF1RLl8pn3Tf
LjPg4diY0JhvFoBSpmsfUcrb2fMduUZ+W/rdOSS4XhzbOtgF4NNJrR05sEEMP7fT
T5Y5A7nUWrNAWE816jmE8vdByPH/6D90ADCoJLfzgpxWF0pyJZdA5GUHaUEdd57q
Uljb54Oe429MQ5Gj1JvAo++ubKWZNg==
=TMGW
-----END PGP SIGNATURE-----

--+dVZrU6OKboBn6Py--

