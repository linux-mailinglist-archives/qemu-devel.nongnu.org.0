Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0C83EFB01
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 08:07:27 +0200 (CEST)
Received: from localhost ([::1]:35150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGEjW-0000gn-DN
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 02:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mGEdZ-0006Mc-IF; Wed, 18 Aug 2021 02:01:17 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:56195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mGEdW-0008MG-Qv; Wed, 18 Aug 2021 02:01:17 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id F3EB32B011E3;
 Wed, 18 Aug 2021 02:01:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 18 Aug 2021 02:01:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=heM2TvNxsotfnc7hjjKhOEZ+cx1
 fs+9CFsdet+NE/Jc=; b=JRTVrJs4Zt+i5KQpZQtt2zNjggqxVqnj3gdZTzj9RGP
 nKGXsh8/CQSFVy1xIT/g+13EkeacYUPEXjPW444JF/tGIizIGS+AYQGdkrrFkz4U
 7QboNMSPig+2CILSge64nwuWXuEMrTYBkg3acmhwEHSuW8WaqTJNPGukSBy8d4O3
 aCIw38JzTnbQR9XSgBcp6HopyPlTvOFE1tlUizbIzc69dCAZUoTD4pp98QJcn1TX
 BRmW2SHk7ijtHeo8Ja3aEVd4p8UFKGBBfrnef/AwPQrsaiGCFYi0rjDrGFnUZZqm
 ixOjeKnn9wxLeRQyNFtAEUS+1r94jdoWHICQsd3h+gA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=heM2Tv
 Nxsotfnc7hjjKhOEZ+cx1fs+9CFsdet+NE/Jc=; b=lyImZxs8On0ebRnevB2Q8h
 msChRzzoDMCWOYMxmv3HLAqD0Xnvu0s2nxc3cUau8voRRB9O4M0Mg2heGcaPdoVo
 m5wQ4EnUCCHSjFBrudtfi8bC8gJXQ5pE/8RVREh78kwiGLQhTiISdimEhi4YBaXP
 8l76Gg+Psgum5AMoN8s3QZSwtM5qOWRHV6KI3LKz7kUeN5tWGIXRLLd0INykF2hd
 UAFRx1DhOrBia6XynlZuLfoSkgPGMRBshEb9Ynnj9FGC3yzBZppDJuB3ZDWAdpPw
 pg1HnwSHOQ82eY6W7XDiHc5dcHDknLrZT4UYHBCj3tNQxHx9vCg25iJJdp75xeRw
 ==
X-ME-Sender: <xms:JKIcYeMn-Flxis_Beg5uf69n-wrVz8g6nI6uEIXPnMe27g6i9tVwsQ>
 <xme:JKIcYc8JuSngoPZAwN6aaUrPj995gLUQoiTuJ4TmPrPSnCy_zKTx-bEE35bp-aSf7
 eNbTxxRhK5eFGmyGqk>
X-ME-Received: <xmr:JKIcYVR_zYZ5Es_U8kcZK4Y1va3OZL4mwVwvwaRSAC-VAiy7MofXGzVqz_rvGi5hj5d61zfmeKpexHD-w2dszTwkJ180x9WpBt6cY3mpJ_2Uhe-oLw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleeggdellecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:JKIcYesaOISqVT5aurYvHd_XHkN1h8oPgbDtld2N_Uea7ck45ialoQ>
 <xmx:JKIcYWdc-orv7uxjh9K4PevQCRHwKej6iSt7zB73WzYdxnKUmOx0HQ>
 <xmx:JKIcYS1-eB0bLwoeWL5NcU2xrNknUC78Z1nLx1EcvT9VV6a2rEM7zQ>
 <xmx:JaIcYZuO3hnfG5CzqPpeIAcvsanBYxfmDkQgYWkI3_PI9QffKxRbc1E9c98>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Aug 2021 02:01:05 -0400 (EDT)
Date: Wed, 18 Aug 2021 08:01:03 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
Subject: Re: [RFC PATCH: v3 1/2] add mi device in qemu
Message-ID: <YRyiH7aLzBh/Cko5@apples.localdomain>
References: <CGME20210803080737epcas5p1c9bd6ecde8700d1194748533a3812db6@epcas5p1.samsung.com>
 <1627975487-1640-1-git-send-email-p.kalghatgi@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zk20PYG4ooyImfh6"
Content-Disposition: inline
In-Reply-To: <1627975487-1640-1-git-send-email-p.kalghatgi@samsung.com>
Received-SPF: pass client-ip=64.147.123.27; envelope-from=its@irrelevant.dk;
 helo=wnew2-smtp.messagingengine.com
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
Cc: fam@euphon.net, kwolf@redhat.com, arun.kka@samsung.com,
 jg123.choi@samsung.com, qemu-block@nongnu.org, k.jensen@samsung.com,
 d.palani@samsung.com, qemu-devel@nongnu.org, linux-nvme@lists.infradead.org,
 mreitz@redhat.com, u.kishore@samsung.com, stefanha@redhat.com,
 kbusch@kernel.org, javier.gonz@samsung.com, prakash.v@samsung.com,
 mohit.kap@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--zk20PYG4ooyImfh6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug  3 12:54, Padmakar Kalghatgi wrote:
> From: padmakar <p.kalghatgi@samsung.com>
>=20
> This patch contains the implementation of certain commands=20
> of nvme-mi specification.The MI commands are useful to
> manage/configure/monitor the device.Eventhough the MI commands
> can be sent via the inband NVMe-MI send/recieve commands, the idea=20
> here is to emulate the sideband interface for MI.
>=20
> The changes here includes the interface for i2c/smbus=20
> for nvme-mi protocol. We have used i2c address of 0x15
> using which the guest VM can send and recieve the nvme-mi
> commands. Since the nvme-mi device uses the I2C_SLAVE as
> parent, we have used the send and recieve callbacks by
> which the nvme-mi device will get the required notification.
> With the callback approach, we have eliminated the use of=20
> threads.=20
>=20
> One needs to specify the following command in the launch to
> specify the nvme-mi device, link to nvme and assign the i2c address.
> <-device nvme-mi,nvme=3Dnvme0,address=3D0x15>
>=20
> This module makes use of the NvmeCtrl structure of the nvme module,
> to fetch relevant information of the nvme device which are used in
> some of the mi commands. Eventhough certain commands might require
> modification to the nvme module, currently we have currently refrained
> from making changes to the nvme module.
>=20
> cmd-name                              cmd-type
> *************************************************
> read nvme-mi ds                        nvme-mi
> configuration set                      nvme-mi
> configuration get                      nvme-mi
> vpd read                               nvme-mi
> vpd write                              nvme-mi
> controller Health Staus Poll           nvme-mi
> nvme subsystem health status poll      nvme-mi
> identify                               nvme-admin
> get log page                           nvme-admin
> get features                           nvme-admin
>=20
> Signed-off-by: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
> Reviewed-by: Klaus Birkelund Jensen <k.jensen@samsung.com>
> Reviewed-by: Jaegyu Choi <jg123.choi@samsung.com>
>=20

My Reviewed-by here was added by mistake. I've not given it my formal
R-b, but I'll provide a proper review on-list ASAP.

But just glossing over it, I like this approach a lot better than v1
(vsock).

--zk20PYG4ooyImfh6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmEcohsACgkQTeGvMW1P
DekCcAf/e3ez63dluPzli+KxhybVCfNu8rppjSI/dA9t2ZHcKrU75W23S0h8d9vc
QF5I3rbdpuJe0Umc2J44nAhyE5y8QhB3FClHGaFIjvMAQLtnSY0m46Bk4/iyF3hA
4pfdWVHKHhbxZvFs4Y2nCOcjKGvPKuJOHLI0TXIq9UaTCmFFbOOT7yUqnUscrOW3
sDcqd+ieQ/sQeZQ0OMDLQVWbD8B91Vq6KDiXQOFUWAbwVZVVSu5CLnngpIrAvVxz
QiTPkmmqf4oOO/jU/nL/qYdgd7PYXm6iXBfUtOgwUfZtOZXbc9z7uYLd8WHK89DB
tjj2p3oCeMwWZ5gYYVUtonB6Kdkr0w==
=p25e
-----END PGP SIGNATURE-----

--zk20PYG4ooyImfh6--

