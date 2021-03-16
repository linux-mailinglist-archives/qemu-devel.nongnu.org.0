Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1386133E0E1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:54:25 +0100 (CET)
Received: from localhost ([::1]:45732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHdv-0003Pa-UK
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMHWo-0005zB-4J; Tue, 16 Mar 2021 17:47:02 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:40851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMHWm-0000LQ-9B; Tue, 16 Mar 2021 17:47:01 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 242655C00CF;
 Tue, 16 Mar 2021 17:46:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 16 Mar 2021 17:46:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=xwGLMjGRER2iprYYvPUdtQM/w5N
 Ag0tprwSSCeb+M+4=; b=2YoR1FxiNZrHGddqJq+p+C2os3gJuPDKCyYEPvGgRrQ
 FXGNdpH86mtI56idwv1Wv0VovSpBWcqsnFA6n+e5cAo96BB767Rw3OEQHN4ZN54Y
 PFRFo4szPisMRSSxjvsvRXFpxLo/uEkahnzFIDUzAdCQgON67AqBUY9LxvU6XW0X
 jqF+HG4svmwWnJRrgiAwq74Jph3OHesBTx6w5YQ3twfytwH5CVXlZKlxHJlTHf7D
 N1HfeBYCLrPtCHmZ0J5q7n7Xp/tXuLb7y/nuJ8ke8K9LF2xPi8itd6HrBOBxSth7
 +h3yxd442ut9jCpk9G43VleE5hvoYEZe1DBo3HiEW1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xwGLMj
 GRER2iprYYvPUdtQM/w5NAg0tprwSSCeb+M+4=; b=TvsdE4GSapYsHRpcilYo7D
 qLbViksuwtwe8xXuI/0shssTe4lRZHFl/+LSW/L3L3wsZHJnV9hndu8hjS9GXUgC
 eBMDMeCLeIndbzM12nMD78Avg5FeueikxvrNXZG9lbHm+zJE22mWLfJEJDvXHQLX
 nKdBq7DEcvZXcSDC7Dy8PHfL8FPeG/xxZgEYSujzoJDJ3TlebvHCWtQVEiY/BAef
 /Xlez8yFa9C93N3cw4X5AcI0RnPIV/ZatkH+iMKnpwCoEXLuQ986myfkbn6vRNTa
 qDL3dvoyn7SnL7vcKCDYChZH3wmak/X3txLktDn6k64f15aWEII1kkIIR1Kln2Aw
 ==
X-ME-Sender: <xms:TydRYNnm9KHNAXG6KNlr1Qn3hKvWiY0efRFR77DJJPaeRF4h2-dolA>
 <xme:TydRYI1cr0L2ZLqiF_Cg5ARQiqz_kXtbRl7lt2_6Ev-Gmv-A-BJjRt-10cuTHPrC4
 A-1j7VuKa9rPZmQVqk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefvddgudehgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:TydRYDpuLYFoXH5h9nP0DklpNHXxyiNMMox43n2DzRcveXEk0IJzDw>
 <xmx:TydRYNl2u_8s3DzHsrYc4QmIZ2eQgqwqAT6l8vR5rXRZjmqJZzDGdw>
 <xmx:TydRYL1U6EmgCFQOdlQDbmUn8HeYol8hao6r663wHOyvkCZd2UJORg>
 <xmx:UCdRYFq0va7qZ24796oxhajHqLNBLMBjjtjZy1RGw7mfIfCd-18wiQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id E21DB24005D;
 Tue, 16 Mar 2021 17:46:53 -0400 (EDT)
Date: Tue, 16 Mar 2021 22:46:51 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keqian Zhu <zhukeqian1@huawei.com>
Subject: Re: [PATCH V3 1/8] hw/block/nvme: support namespace detach
Message-ID: <YFEnS584HU6sr+4u@apples.localdomain>
References: <20210228161100.54015-1-minwoo.im.dev@gmail.com>
 <20210228161100.54015-2-minwoo.im.dev@gmail.com>
 <7001d348-91f7-1728-024d-55a2f5d92628@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nltI5CfBXP5hE70f"
Content-Disposition: inline
In-Reply-To: <7001d348-91f7-1728-024d-55a2f5d92628@huawei.com>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Minwoo Im <minwoo.im.dev@gmail.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--nltI5CfBXP5hE70f
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 15 12:56, Keqian Zhu wrote:
> Hi,
>=20
> I don't dig into code logic, just some nit below.
>=20

Thanks! I'll cook up a fix with some corrections on these typos.



--nltI5CfBXP5hE70f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBRJ0kACgkQTeGvMW1P
Dekyegf+MXB19IWsVkHPRny9y+delOYqWWelwBnoupMn86Zgp2eVNbsm2rIcddCO
6qr5PnOJUwbuCptDfNhaFSpzmkk1IJcZ0v7Wn9D+ljmOPxQGvVuqmX6pQ7GMiD8S
LZud35OjGTRuuDXXvP9ErfsOiuvnlUgDk1MDmd5tnpC+CX+ucFja2Yj/56N+DfTW
PRmcFvrtMK8VOE72qEYauVyrcUpiYYeZDt6OLsa8w/K8Z8KDQJsJoX0kAuYb36LQ
4gSQV62eqJR6nAOziMwrsdicH1jotzzArNILsAj4G9ZwnaPDN0fTBbOPp9P18PJU
kayIPfaafg2IxzLQtDpoQuileG8AFA==
=yxRz
-----END PGP SIGNATURE-----

--nltI5CfBXP5hE70f--

