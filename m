Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7D144314C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 16:11:13 +0100 (CET)
Received: from localhost ([::1]:47342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhvRQ-00016Y-Lg
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 11:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mhusZ-0000cx-6X; Tue, 02 Nov 2021 10:35:11 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:38181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mhusX-0007km-01; Tue, 02 Nov 2021 10:35:10 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 487B02B0134C;
 Tue,  2 Nov 2021 10:35:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 02 Nov 2021 10:35:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=BvXE6AwDywBqAvXqsznMc8Pa5eF
 Q+nsRLJ0Jx2m57gM=; b=jGFTRtjt1MmaVpO0RvGvNhRFWk2JMHWks/oTThPe+WW
 MdEF1Zh5ZgZlOcLefL1CJQ1evuhIkkPvfEjqoiBPU/2EBLM2CufyPrNc2iO/pCN2
 6XrOymx/aGoZLUFQLOZofUikmBvZeE+30ZfJbCgRYh/SXVJpqDPjcel7BIiGScT5
 a9HKoIW8pmRVDGJY2HAlQif8jFxt0fT7ukFQhOWk2ydH0yaeFu2x4C11xU+sVY3s
 fa+xHbsf8MVTlxnVASKAMsU3LNkG9Et8zPjxndwYQZZ/HDYY6Lqq18QzDgALlDHL
 tCJRL1n/60VgZW2cJZ1mBXROzzjNlrNUKPhrK/vVffw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=BvXE6A
 wDywBqAvXqsznMc8Pa5eFQ+nsRLJ0Jx2m57gM=; b=RQ7h+GuJ+whc3EizDcz4iW
 d/H9GtgQnyVBcUnLXrghDMgmpArfdRds4mHIsIvzrNx3ldTUevubgkSssrRq7ulw
 xSqlYTEOtw+3B2xMxTpUeX3qxLqKPcHYNCFt26kE/P5IDNAvRcg7xBEf01tgZUXb
 efix8PN3gpDCs3J2uivmD/1wr40K1KyE6swn2mAliHyRhSkUpL7/p2uw788nRICP
 fnXCkgXZM755C/D0fbVrPButiOvgHvdorQrET5D7u88XEhf4Ub3w3r+WlbyxdM4C
 RZ6aAC/trd0IYdllsN4BE5a0EoDnMCQvEXEvQH+wRGjIJd2S2TfkgvOS1gURzgjw
 ==
X-ME-Sender: <xms:mUyBYXCtEclsHASjkpvQFMEoyAw72Ti0AdYb-HrviAtzPYq3NiCQ1A>
 <xme:mUyBYdiUj8lyxBEnIsEFl6mpCWkDiCBfw4K7oj5LHcNKB59zTCeBSX2_-oAiw2khw
 88D9AXFhvEJvbH1RfI>
X-ME-Received: <xmr:mUyBYSnIXFCAgrzzJ0GtXPE9xgW39dYGpNsUJbfT21Y3RX-1U8WsznVr3jWNGk20VhsRytzpQahkxyiXfXR2_6xZ-HuAG3lT7cDq1h6viERUne2lBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddtgdegtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueeuffeihffggfetheejieevleduhfetfffhheeigfehteejieetvddtgedvhedt
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:mUyBYZx7BewFWrGSO6eSV3gb9vL39YJZriqf5OwVM5IrTNFl6UIi_A>
 <xmx:mUyBYcSNd-P1iaCiGi_e3FFZFOwkln93YCquKqHlwUCXuRIxk_wvfA>
 <xmx:mUyBYcYQ3Gxdfvjfc_PwgFkWh4F4u8vUGMPLLpqhd3LkyG1dCJ19tA>
 <xmx:mUyBYV-7IJhBiwSSaN21VsSaHwzKemn99-djxK5hNCmrsA6Ee4mcf2_gouo>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Nov 2021 10:35:03 -0400 (EDT)
Date: Tue, 2 Nov 2021 15:35:01 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH 07/15] hw/nvme: Add support for Secondary Controller List
Message-ID: <YYFMlRXGDaLIiVNF@apples.localdomain>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
 <20211007162406.1920374-8-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OE0EV4FEB53Ntavo"
Content-Disposition: inline
In-Reply-To: <20211007162406.1920374-8-lukasz.maniak@linux.intel.com>
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--OE0EV4FEB53Ntavo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct  7 18:23, Lukasz Maniak wrote:
> Introduce handling for Secondary Controller List (Identify command with
> CNS value of 15h).
>=20
> Secondary controller ids are unique in the subsystem, hence they are
> reserved by it upon initialization of the primary controller to the
> number of sriov_max_vfs.
>=20
> ID reservation requires the addition of an intermediate controller slot
> state, so the reserved controller has the address 0xFFFF.
> A secondary controller is in the reserved state when it has no virtual
> function assigned, but its primary controller is realized.
> Secondary controller reservations are released to NULL when its primary
> controller is unregistered.
>=20

If I understood correctly, you want to change the callback thing in v2,
so I'll wait for v2 with my review on this.

--OE0EV4FEB53Ntavo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmGBTJQACgkQTeGvMW1P
DekK0ggAj0aMRsZmsBQrIZhiAIyp5AKt0VUbzHcOvRFUHVv/khXG65cJiNGM2ge7
SUFfAt9gcHKIlMexo6iHrUaambnyvut5sy9znsiD91HwV2QiOlCn5X6tiidYlKv9
AV0R0sdPycr5Dco4Fv+YEn9depTJsV8k9nMAvzkmenmexfAi+BuRY1tj3pQBUWzH
6E+rBM5TwP4ABhmS8ETNfxvRGaNKzDEJyB1QfA2Ms57Ox3QSgIWXYzurQ+KSptNx
1OdkD0IZ2zCvyWGvt0Iq4Plh8CqLNqBpqkG2yAsUyzrg8njb4IZdnCOhj3Rr2xiU
afVtX45C2WKKdhbznIYCpVRQIsqu1w==
=wda+
-----END PGP SIGNATURE-----

--OE0EV4FEB53Ntavo--

