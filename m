Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4E0497E18
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 12:34:42 +0100 (CET)
Received: from localhost ([::1]:47858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBxcP-00074U-Ag
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 06:34:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nBxOP-00034J-FT; Mon, 24 Jan 2022 06:20:14 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:45405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nBxOI-0008OG-L5; Mon, 24 Jan 2022 06:20:12 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 3780E5C0124;
 Mon, 24 Jan 2022 06:19:58 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 24 Jan 2022 06:19:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=oqdEu6DiVWx663jsVkYdHXsOIQBEzk
 81DH0fFngwIFA=; b=CVcOWaJFW5WsSlBKZeV88lCi/Nz/kh1Fod7Ntf35CDW40L
 o9jIF/nRL9goeq9A4E/BexCYROKsNyhuOnS4HhOqW6kDlIPX+DXr+4M8wSeE0mad
 m/LX+OhHy85O8YRjq8zYhDA5brh5K9QJZc8JXD3Ed/29vs6ZBzcFEIfxSBmi/p4d
 tV3fs09lSPM9pR9pbWterBvrOOfN/WZig/yv45ot/MVGqKECh8YNii/0wLH7z1K+
 28sWezU4IR7FcIGDuzOMI2j+WWtTqIS1IlmvUgHnASCUb4epobhThC5obB6tb1rj
 6Oo2HKQpG9S8EG6LNyud4+lWemraoivONiaqQt8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=oqdEu6DiVWx663jsV
 kYdHXsOIQBEzk81DH0fFngwIFA=; b=DWGiKLS29YJE0p955DOxiVINJxcQin40i
 5jFLSGI9SuBEMEPh8rf3Qmjd6+76BM9zLvUXvlyhkVfTe4tzxuLhYVrhQLTb26Av
 hjDniBzhpKik4UJcsGMxkWrSw5wISabk6ffbFjS4z1gWxdDKPKi/hhlls9svERrx
 jpHlUQlC7Z2V1WBdGzGs/2gcEGagCaoB7xnHE0dnlOKq/3fobNgCm+gg53ngL+XH
 FsQXR+O1yteRxi1c6PqyCEK2MyRRPyg7IL947XM6jTMac0yvgmPVEgll98lWh3Es
 IIG4JW/ZJMNkR+fDJPEvCBjw4+HKTKKIXcIigP/2aX0WuL1iWJvJg==
X-ME-Sender: <xms:XYvuYfJGM37syZGXyTjjaiBvAiY_6olP3_cwNe9nAcrdn81-MKEdsw>
 <xme:XYvuYTK9oFjqaB6y8OJzdVope_NXmnhb6W4g6no2Q8yq3g_zgVMry3BZcPCETG6AI
 Z5P5Uo4zaBhQQlYMpY>
X-ME-Received: <xmr:XYvuYXvS4-PK_T_lTwWorYIl9rpFioYZipIAt2kmhyfLM59qL3cxuW0wv-_hMWn7KieIsjPSe0ro2XGq9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdeigddvjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:XYvuYYaMYq_fqLCXpnjj1lYGLyEiDExA4RidGhRuBVxRhzCh6y8rtA>
 <xmx:XYvuYWb9ATNOAOgL_j8ufF6n-Phw_Uyn7T7Y3Fb7GRaoO6Yq2ZsuZw>
 <xmx:XYvuYcAkcRAZ2K--jhSIpoIpc8J8t3GnlxjL7zx10V3QrUAtAFNcsw>
 <xmx:XovuYdw28aqb4b6ZAmtAnhgJViLj1MuZcFNg1c2bXJ0XszjsZNd50A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Jan 2022 06:19:56 -0500 (EST)
Date: Mon, 24 Jan 2022 12:19:54 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2] hw/nvme: fix CVE-2021-3929
Message-ID: <Ye6LWtV+3DrWQ34I@apples>
References: <20220121063225.312603-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="McFNmCIs3E49SSS1"
Content-Disposition: inline
In-Reply-To: <20220121063225.312603-1-its@irrelevant.dk>
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Qiuhao Li <Qiuhao.Li@outlook.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--McFNmCIs3E49SSS1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 21 07:32, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> This fixes CVE-2021-3929 "locally" by denying DMA to the iomem of the
> device itself. This still allows DMA to MMIO regions of other devices
> (e.g. doing P2P DMA to the controller memory buffer of another NVMe
> device).
>=20
> Fixes: CVE-2021-3929
> Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> Reviewed-by: Keith Busch <kbusch@kernel.org>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/nvme/ctrl.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20

Applied to nvme-next.

--McFNmCIs3E49SSS1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmHui1UACgkQTeGvMW1P
DelTPQf7BerKZxl9YscbrG+2t0jLObdBELwaEjb65Rj7Dfp+Hly7dxAkHjqfwm4u
X3bLW8BKU1ak4tMGFZdPa0OmRDFLhUrfaoX0Np+oYRFFBKdtejgKUtDSnaZokxau
vybGxn6hQU3Y1vVVK+7bU2VswvPO+VwaQLRzl5yhmRCIiS/1Zp9GZaeE/kXIh3FV
Qc0ESICYGS4lEx3xZeOK58yEP+SxCwJ3whLYrCeJ4m2FifMDkZbpmvrTkcuXE8+B
QGI6utNE5r8nBmBbAmhBHtBmRxNE0YMvG3rJTUQz/rEA6zT/ChBnYVtIv4T1w8ol
l19FlQ3PD66bftecw4VDUTSzS6E9uQ==
=YA0Q
-----END PGP SIGNATURE-----

--McFNmCIs3E49SSS1--

