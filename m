Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA384BB2CF
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 08:03:02 +0100 (CET)
Received: from localhost ([::1]:59520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKxID-0006PO-0j
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 02:03:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nKx5M-0002iE-Ja; Fri, 18 Feb 2022 01:49:45 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:54291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nKx5J-00043y-Eu; Fri, 18 Feb 2022 01:49:44 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 1E1AA3200E86;
 Fri, 18 Feb 2022 01:49:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 18 Feb 2022 01:49:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=dZwHJbgIkuSYNSa2brcqwQFe57+Aja
 MiqroLFSudXaQ=; b=tNKt8ETf7PQ98wxjdpPEYHMGaN4TNXI/aai0oYDanj9COL
 ycpLtp3Hp1WdBkDnPYTzcONvbQ7FmyoMHafIwVxDNSmN2e7Jfb7xa9yPEFjGf8Oq
 WTyojsKYJ/3WPUwD2Ct5Mdoc/uRGHl35zYDx6wr0G+qfaTClUo/Z6zViLA64QIjQ
 VeY10HSEsMHI0QV6mUT5UQLIHIrYtSuDgyxa1USzQzy8/XUBvZ2ouIVhXpkmKIWN
 Oc3vtx0S1R8S4LeKTkoyJxIldRdyNsc2Co/qYMv7FinzuS7lDd+eKfQv8PYNShxN
 A+RfWsazNZ7+IdFuXmYb/4ObE4mx5FuK+D3iU7WQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=dZwHJbgIkuSYNSa2b
 rcqwQFe57+AjaMiqroLFSudXaQ=; b=QLoyFW0Xwtt1Q+1M1BY7EC3YsTpfRXJ6I
 E9mleTHojnhN+pMzncDt6V9yc1oEk8Qa0Pxpyat1AvvUGvkuBLYJy1LNsl6wSUCy
 /GVDDpNU5+dXYcS/3BM7EUjKnxmBLqD35wCXdyCzH+wNwUXIzGEu5+zoj+SaTqOD
 Z17SWqci54oo08/Yi56SkpqfHwotYlxYNswmTetEoQUkB2c01btJeHgD1gH1v82U
 rpDIvVo/FrzG9KXIEZJG1WidDChtDaknHDuvsmyKna5QAtWKYr5HVw2oxM1lwZ/e
 YvPqArxVANkvrPsLQYZZffP3uQ0aZv9BQm0bmajb8aUbayRpFd0YQ==
X-ME-Sender: <xms:gEEPYknv81mpqs52VixTI-tTzkMhFQrqtZNyZCqmPiwAWVV9vFCoLA>
 <xme:gEEPYj2UGqM-WuNCHzy47Mo7_2raBX-TRoGfydX3npaIMt2dBk7MnTrphvBpjlv63
 3zZZ79T2TtaA0MJbEc>
X-ME-Received: <xmr:gEEPYipEHNkzitukGaI5usvr75lGfz2uNtXW1bWakLPRMWAzQKYwzeOf0SJCiBxe8ilu6s6PWIzR5-MM3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeelgdellecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:gEEPYgku4l198kkwH-wVCOIHBtZ-RDzppSdNDYnbNNbt3djL-CqYdQ>
 <xmx:gEEPYi10OamrAphmNXkmlZn8gK8J-Qsc4bxjrI7vASD-moUqsmtsOQ>
 <xmx:gEEPYnuBOUwuZqJqGPgN93vsTfntBewo4SkmgysWQHXK3dXHm75Heg>
 <xmx:gEEPYlSb_XZPtCXNEQRkaA8A2l_gdXqT9dHfeTd3oMEdjKy264Vvog>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Feb 2022 01:49:35 -0500 (EST)
Date: Fri, 18 Feb 2022 07:49:33 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH v5 15/15] hw/nvme: Update the initalization place for the
 AER queue
Message-ID: <Yg9Bfdgsd49lSpIn@apples>
References: <20220217174504.1051716-1-lukasz.maniak@linux.intel.com>
 <20220217174504.1051716-16-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ntD2BTd207/3Qg2x"
Content-Disposition: inline
In-Reply-To: <20220217174504.1051716-16-lukasz.maniak@linux.intel.com>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ntD2BTd207/3Qg2x
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 17 18:45, Lukasz Maniak wrote:
> From: =C5=81ukasz Gieryk <lukasz.gieryk@linux.intel.com>
>=20
> This patch updates the initialization place for the AER queue, so it=E2=
=80=99s
> initialized once, at controller initialization, and not every time
> controller is enabled.
>=20
> While the original version works for a non-SR-IOV device, as it=E2=80=99s=
 hard
> to interact with the controller if it=E2=80=99s not enabled, the multiple
> reinitialization is not necessarily correct.
>=20
> With the SR/IOV feature enabled a segfault can happen: a VF can have its
> controller disabled, while a namespace can still be attached to the
> controller through the parent PF. An event generated in such case ends
> up on an uninitialized queue.
>=20
> While it=E2=80=99s an interesting question whether a VF should support AE=
R in
> the first place, I don=E2=80=99t think it must be answered today.
>=20
> Signed-off-by: =C5=81ukasz Gieryk <lukasz.gieryk@linux.intel.com>

Looks good.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--ntD2BTd207/3Qg2x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmIPQXkACgkQTeGvMW1P
DelOSAgAgskgzpTbbRdpdMMg4uEw0RIOnG0tlzYjQag+GxusDj71T1jG9ztTPfnl
Cy/v9BHqWSOPyhhYUsw6+6zWI4x+88W8ZUec36E1/J0puCT+Se2ZP3whZygzvJF0
rtw/rOKMcTgY2Ybm0BaS7zWS6MYWHHK9XbiCSZi1OIy5b+jR5i6lxkIR5jPaW7/d
hDQGEjfZp2y4+NfscnCj54JtUvHDdDv1FfR6gYrrq6L6thGqqkx82eC5MxUK3o5s
Vz4VRrgM0JHLxoY6NCUBlnQWDB40voC28grGP+wPefywxvnqs7aQB1IDtvc5wpF+
YGPxR8usaaIoRAFp8N6Sodzcz4upww==
=6lYG
-----END PGP SIGNATURE-----

--ntD2BTd207/3Qg2x--

