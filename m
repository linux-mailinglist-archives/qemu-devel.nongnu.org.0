Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09290477C68
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 20:23:22 +0100 (CET)
Received: from localhost ([::1]:48350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxwLY-0003Ea-SI
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 14:23:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mxwCM-0000oc-A5; Thu, 16 Dec 2021 14:13:51 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:34721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mxwCJ-0006hW-Qb; Thu, 16 Dec 2021 14:13:50 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id D3D32580166;
 Thu, 16 Dec 2021 14:13:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 16 Dec 2021 14:13:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=jQ3my/+ziAKmp56h86y1gyxn7AE
 I65gpn3WfeYr4uJc=; b=mqhqqkQt/WJXTkuqDNzuoTyxWCyQvLyslT4pI0T61V0
 qKc3x5beD0PLkJ+Xkm6rcJiBpngxSDcMGAO2AI786aNR4pqdIODT3s1KMh3MAAMT
 RCKofi9GpdT/wIaDq/vANHZip8S7ozmIX/622n4DFB0VvVzJ8AH2xgsZ1B0F2jUJ
 idymTp94Hb/hwrw5T4iJzCTlMSW/XFpWTXNN5+IsWfu0+1AcMw3n0cE2KWtt5IXM
 2jY/YX69pQh4die9ig3jydtwIgghUcz6kT0bCzZK6Ol8QOkO98aMt3e2Tb2sniek
 TJoFmyrVLB6+IC1pH4cWbO9PX0Fsp4VmZLK8qgQEdWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=jQ3my/
 +ziAKmp56h86y1gyxn7AEI65gpn3WfeYr4uJc=; b=iKlMogXZ2Vle6+3S3FIUSb
 7cH3UjU1Av17vuap+OeE8xavSUHn6yog49jeKkZ93HF2JFNuIwdwAhL74nz8BeAD
 PjLUVw8dluJX9+u/uFKjNIRDDUVOuOy8a5eJBq8fiU5xq0nmRXrQC32cAQ35/blK
 1LkZBvM7hgzUaZttjHDbT5O+26Yt+fy39wmZPb4O9SlxLK1ujdHX3fjlejUpbH5k
 LBuL7NNwORyaRpQCyTdLhW7ACWp4QD/NhQDP15RaFk4jd52Yx96/8DfligPwcG2J
 ckNA1BbzS26bez0ronzMvx0bFKP8IOxow1keV1PoKvft7FWKDFtTcEVY3h5eMaVg
 ==
X-ME-Sender: <xms:54-7YfXVb7qK9BahzA5L4jh6Su0kyeiVPNuYhq7N5Hrc6hOIACNLlA>
 <xme:54-7YXlTqteDcXZobObLMcArDbNES4R671kdZERMdXE-EtvCYi6-PuJho6befReLV
 2UBF67BNfA7ILBpGwo>
X-ME-Received: <xmr:54-7YbaYcLPu38zdYVZ9PaEmqTt0X1K-2ob4qdw3YdndHiNmpkWh9mykuZTl3h-F9EJCqPhN5pCDTJxHLNCqgSS_R6uCKQN-XQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrleeggdduvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpedugeefveegfeduhfeuledugfeufeetheeuhfeuffejgeelgffgtdeffeduvddt
 veenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:54-7YaX1z3CGQcfCqkJ-DGtuysZTalhab7YRmDxpuGh64gGRZDaHyQ>
 <xmx:54-7YZmZnaUw347LE_Jzf328uhZwCrCxu-_ikUFcHSWLUB7ThNNQOA>
 <xmx:54-7YXd4DOQOPkfmfDoMdusmNS5N7wtDBgwYtcRPpOIdvQQ_Q-W4oA>
 <xmx:6I-7YZmj60CMjH28lBFqMdQ25e-fOx2KXNQD4WCx_3zAZj5FHueg7g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Dec 2021 14:13:41 -0500 (EST)
Date: Thu, 16 Dec 2021 20:13:39 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 0/2] hw/nvme: Fix CVE-2021-3929 (DMA re-entrancy
 exploitation)
Message-ID: <YbuP4/rLTlCVBRi7@apples>
References: <20211216175510.884749-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3AO6AQFMyxSTXO7m"
Content-Disposition: inline
In-Reply-To: <20211216175510.884749-1-philmd@redhat.com>
Received-SPF: pass client-ip=66.111.4.230; envelope-from=its@irrelevant.dk;
 helo=new4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--3AO6AQFMyxSTXO7m
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec 16 18:55, Philippe Mathieu-Daud=C3=A9 wrote:
> Now that the DMA API allow passing MemTxAttrs argument and
> returning MemTxResult (with MEMTX_BUS_ERROR in particular),
> we can restrict the NVMe controller to memories (prohibitting
> accesses by the DMA engine to devices) and block yet another
> DMA re-entrancy attack.
>=20
> I'll will try to get a reproducer (and authorization to commit
> it as qtest) from the reporter.
>=20
> Based-on: <20211216123558.799425-1-philmd@redhat.com>
> "hw: Have DMA API take MemTxAttrs arg & propagate MemTxResult (part 2)"
> https://lore.kernel.org/qemu-devel/20211216123558.799425-1-philmd@redhat.=
com/
>=20
> Philippe Mathieu-Daud=C3=A9 (2):
>   hw/nvme/ctrl: Do not ignore DMA access errors
>   hw/nvme/ctrl: Prohibit DMA accesses to devices (CVE-2021-3929)
>=20
>  hw/nvme/ctrl.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20

LGTM.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--3AO6AQFMyxSTXO7m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmG7j94ACgkQTeGvMW1P
DelO/wf/Ye7jv6TIUzqdxAGKx9H4DK49U35XkKWFB1pne5/zhh+1aoLqBn4fapRn
tobeLV9Du+qO8On37JRrrhDfxn2Ju2z21hbc8qMdXFRmtRwIuddW2NfzCaGIcx4s
x3+KLYTxgXyJtovy59VfdjUAK4WlQMzB0gwI0yVXE6WkjAqdZ8ceIVpNANWfP1HB
UIagW1R5XnbcNoBiFWifFXaNimmnzZptlahGh88BMWHp7Dfe8E1CCJcn3WeaYvMI
M1h97CYWpsaxp6B7ZouvLLKOMnmzJbObl2IvIsEIQDwGDM7Jvh+g8gO0BAzF5jOy
EESF8GlulTb5v51DOkX2GgwJGyChgA==
=ZcZY
-----END PGP SIGNATURE-----

--3AO6AQFMyxSTXO7m--

