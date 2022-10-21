Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC36606F97
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 07:47:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olksL-0003dk-6B
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 01:47:21 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olkj2-0001an-2s
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 01:37:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1olkin-0001Te-NH; Fri, 21 Oct 2022 01:37:30 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1olkii-0008Rw-43; Fri, 21 Oct 2022 01:37:29 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id A9D8B5C0110;
 Fri, 21 Oct 2022 01:37:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 21 Oct 2022 01:37:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1666330642; x=1666417042; bh=41
 +nvSg5mQtziDKiu2upcRZhMih8JEYCp9Mfbdw2G1Y=; b=RdnMMPdkm7DwR1JULK
 u2hHPSHv1rmq6IrpPo9ypwHQuZNYALnm2dJlvlhn+n5WOwKq8ikp1PW7XnblVz2j
 LxDTK8RjieL2pIdBwmaWhddh/6uEZIfApYsZm5tT8fBaq9tYTKi4kXZW5eXZSqv4
 +3cYA399dmYM8mh6uweXtCVC/3lbsQDQRkaNqOfXdt03EunBvKyEvQ29m+CexHEB
 bJhuWak2dmWzU0U0XPWQf8XD0/IqZWWB/v6TgGDl0hfTKIQVR4xzgHObYloTZhqR
 DLrx/cwEQ7YqLAKG3rL+EXfUGrC5l1sHes868qjw2P2wdQ0dmJvamaB1W+WNnYn0
 nwAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1666330642; x=1666417042; bh=41+nvSg5mQtziDKiu2upcRZhMih8
 JEYCp9Mfbdw2G1Y=; b=tSYLEBT3+jPV0CdFQ4wNprupaK+DSUJwLJ+4iskrvdWN
 wl0ZDv/ZWFRafEO0PpjFU+f0hhQpQtj+u1wPvqnvWVsU856FvJ/cB+jOvAER4Zog
 Gg0acDiPR196VwWWJhguff8nRPDPFQ+zF7ZQBHZSLmppNXNYms0dKub7nPd41gEe
 LLHpYsIOhUGsMwPxfEd/T2FZ0OHJCSnxb1lDvy7RRtOX6kCa3k9lLbZiTufyfU4G
 /pO+NWOLHsnIPKtlsoFU7M6/KM5hVcGv1nwcKv8oTdUNdkkw3YmrsPcYBCmb37fb
 DsuCVMlT0TtUEPzZXQJ/bbAqGANYyv2ewC+AKfZ71Q==
X-ME-Sender: <xms:ETBSYzzFci0WDPSbKAEhbHsCtj5z5us64UO3hpe6y_uIQmSrMQbzBA>
 <xme:ETBSY7T-V5oHj5fzmulhhAkBlK6Sk033Nl8ciiDhIggJ6o8mkhniQvQHq1vhF5gXb
 Ih4om49iU11cZy5whs>
X-ME-Received: <xmr:ETBSY9WCnaPum_g8NgPEKDLAZwts-pYgAOkDqSbPEmzJ1B0TRat5tjRWvHjyizYDEM9k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeljedgleelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ETBSY9h-28RYpdffM3-gLgIkIOdRjicgdfXXtekDzZfl8N-eqIr92g>
 <xmx:ETBSY1DWzoDI3AJ58rAWXdLib5mYPUUP4DBSVk3q9QNwaUY_QHj3QA>
 <xmx:ETBSY2K8Qx9Gclif4WcnpaqkDRdVSxRFtsU8RJVNaQHDhce3YHReQA>
 <xmx:EjBSYw-KDVraQ4ay09v4-U6MtE2lOSW3ZwSUpus7Q5WQH3An3kN0TA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Oct 2022 01:37:20 -0400 (EDT)
Date: Fri, 21 Oct 2022 07:37:18 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH] hw/nvme: reenable cqe batching
Message-ID: <Y1IwDsaYc04+QhWu@cormorant.local>
References: <20221020113538.36526-1-its@irrelevant.dk>
 <D059FE13-A269-4C82-9BE7-1FEA9F2AE53A@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="XiS8wT3RD1W+ngtK"
Content-Disposition: inline
In-Reply-To: <D059FE13-A269-4C82-9BE7-1FEA9F2AE53A@ict.ac.cn>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


--XiS8wT3RD1W+ngtK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Okt 21 10:37, Jinhao Fan wrote:
> at 7:35 PM, Klaus Jensen <its@irrelevant.dk> wrote:
>=20
> > Commit 2e53b0b45024 ("hw/nvme: Use ioeventfd to handle doorbell
> > updates") had the unintended effect of disabling batching of CQEs.
> >=20
> > This patch changes the sq/cq timers to bottom halfs and instead of
> > calling nvme_post_cqes() immediately (causing an interrupt per cqe), we
> > defer the call.
>=20
> This change is definitely desired.
>=20
> >=20
> >                   | iops
> >  -----------------+------
> >    baseline       | 138k
> >    +cqe batching  | 233k
>=20
> What is the queue depth config for this test?
>=20

That's 64. My box isnt nearly as beefy as yours ;)

--XiS8wT3RD1W+ngtK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNSMA4ACgkQTeGvMW1P
DeluDAf/RPRbVwc8EHMnaiyV0DLUzHJsK33Wt121spVNFmk9R74DMYrUr6yNUu80
QXAN2FmdGQzYTkvXjwygT4YAXQxNwMtRUJga84XuFB000HYr7FzM1wUH3dtxbXPx
QvkPtu9DY6/huQSyyzsHJpiskdoVC5n5jqhIq3XuYA/jJ0wZLyktfXZ8xcCVrj9Z
fAResoP8PVxQYah00FtkXOkGStzy/3EM5bQ36QyrkG1yobPhfcCURAbgYKXmkb2Q
jk08e4qmrm/gGkfNL0J3t/o1aejN2ffEfzGda1LXdlk25CMtJmhfzHuWPvy0Wdif
txZpPBHo1cIhLNaVf/YjmtyNbdJTvg==
=q9ES
-----END PGP SIGNATURE-----

--XiS8wT3RD1W+ngtK--

