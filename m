Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 981565744AA
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 07:43:37 +0200 (CEST)
Received: from localhost ([::1]:33238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBrdQ-00052d-NC
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 01:43:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oBrVR-000092-8l
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 01:35:21 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:60233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oBrVP-0004b9-MT
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 01:35:20 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 14631320093A;
 Thu, 14 Jul 2022 01:35:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 14 Jul 2022 01:35:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657776917; x=1657863317; bh=l2
 +B/vYiUGx+u1zr4+T5m31Y7XrfP0Zi3S/cDlhCdrc=; b=1xvlDENX8MD1IYHSas
 4GAVXaeDPn3VYHkNmT6iN+agKdCxiIFwKoChcXFXe+AIvRIhQzzpLX6LMdfQw5Fd
 2Ny7RaDyP8ytOECuo+KmYeJDXJRDDy4TIc9GMHSI1bjd0672m7NZkWCHUjKlknfq
 SVzaHr8NqsBFjrgb6vYDjjnredu3NtX3U0hsvcV3f/NrDyXsXS1ma0VoatmraZHu
 fZvhUjBME2jIzFEcPu8xnXorpYSBdfsVll+dMm74oDW/vMGI8xlnJIfBw80SEU0W
 lTVtBq7Bu+Ntu+NXCkFoC0zoGDX2lEypnrUwde/yDEfv09V4620rKfOEMgD8evru
 uDvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1657776917; x=1657863317; bh=l2+B/vYiUGx+u1zr4+T5m31Y7Xrf
 P0Zi3S/cDlhCdrc=; b=TwOO+tb5Zue4GJkQU4JwGf/1AtQMp2XGXjWk7G5HN1T2
 upQY6o0vsrYtBkJpFeM51BQx7uzaT/Q2K46RESyd9M9xERsQVXMDK8JLMBlSzDoK
 XrANOFPjXUNn0zoZbgJfCCZKHAVF0giTmXe92UZXhgrvqzTRu4tMGFKfkopzHmUo
 jSAcKkpZsf7xHG6rJenxA4XR+b83yzhQyIMceLT1jhWT6LWuL1JB5XhFsWW0CE/J
 zzFTJiSI9M4HMq1cTxJ/5q1x5fy2Ipr8VXjYymDPb2Jdy9+O+LdMVk/8b6zcRCoL
 kqnTsdshj9wjFz4LSyYMcp07OSmBRZpvevATkC5fxw==
X-ME-Sender: <xms:FavPYuZ7WfC88XN4KsM2Z4e-dH0-tD-5n0VGHlSDFL0El52QJNLVzw>
 <xme:FavPYhaBaK89HHIQ5ULFm-9pLcnAChcCqJAI99xYPtqATxdH8Z_-g3vejNsSaSEkb
 UXIYUudW3U9kUnuRQo>
X-ME-Received: <xmr:FavPYo8SIZ8nXkS_pxyKGHrdMLs1m1EzfbT6nmbFiwOZqL1Dq6_aQaOpDCZxQhVlzDzF-qGHpclHecVkBys>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejkedgleejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:FavPYgrNeNqMqf6mFlG7aBBB34lllxXcXjVXL2U-9ETkU40hj6B_-Q>
 <xmx:FavPYpoNIntTNeLlBuSVYH_a6B8VUujAHUYqS-92z8CFs8aTXHKPGQ>
 <xmx:FavPYuTClpwjaltQfeoQougKq8_6B0sZvBchhO4B0XKVnnCN7FFO5Q>
 <xmx:FavPYg1041_J5m_pHRCdOEDgx-k9vaTOp0nkO0bS8XuIUc49y21IDg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Jul 2022 01:35:16 -0400 (EDT)
Date: Thu, 14 Jul 2022 07:35:15 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v4] hw/nvme: Use ioeventfd to handle doorbell updates
Message-ID: <Ys+rE/S66bwqmXLm@apples>
References: <20220705142403.101539-1-fanjinhao21s@ict.ac.cn>
 <D7E0940C-3263-485C-81AC-E102566282EF@ict.ac.cn>
 <Ys1nz68zLPN3Hq8F@apples>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vpuW/JgkHsEwpYKd"
Content-Disposition: inline
In-Reply-To: <Ys1nz68zLPN3Hq8F@apples>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
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


--vpuW/JgkHsEwpYKd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 12 14:23, Klaus Jensen wrote:
> On Jul  9 11:06, Jinhao Fan wrote:
> > at 10:24 PM, Jinhao Fan <fanjinhao21s@ict.ac.cn> wrote:
> >=20
> > > @@ -5793,6 +5891,7 @@ static uint16_t nvme_dbbuf_config(NvmeCtrl *n, =
const NvmeRequest *req)
> > >     uint64_t dbs_addr =3D le64_to_cpu(req->cmd.dptr.prp1);
> > >     uint64_t eis_addr =3D le64_to_cpu(req->cmd.dptr.prp2);
> > >     int i;
> > > +    int ret;
> > >=20
> >=20
> > I just noticed this ret is unused. Could you help remove this line when
> > applying the patch?
>=20
> Yes, I noticed it and hot-fixed it ;)

Jinhao,

Applied to nvme-next!

--vpuW/JgkHsEwpYKd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmLPqxEACgkQTeGvMW1P
DemC0wf+Lh3QUdPtPzrPycg2bjC9cR6AleTd8HiGCjvmBVJO2X4MsUD/dwS4UiQj
beax6MlWrQndPRPwyfXerXfFUsNa7gSMBjKCH6X0+jQ55aw1c3BpXPU3p8K6m4HQ
H9D1afWye98ym5AOKpQ46bsKxU4rHocNVZC/0UFZSdtG1tW+dbZc1+nn4T8MT+lN
vM6JIzXcLgSDCy9Pio9C7ZzcBCPPyzKUy20zFHwA/rmqPwA9+N48EdEv4ANmXOj4
dPWsyYHbs56jDF8Ch+dUeaCNaZT5XKzQFPS9gTuzSz9hzVhF+I+y+8udLOmBpX1u
nKI+kNXde6ZyUjHBOdhe7LBUB554wA==
=fZS8
-----END PGP SIGNATURE-----

--vpuW/JgkHsEwpYKd--

