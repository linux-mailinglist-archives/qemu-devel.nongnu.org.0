Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE8A606220
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 15:47:19 +0200 (CEST)
Received: from localhost ([::1]:51904 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVsv-0006zy-V9
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:46:59 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olUxn-0000pr-Dq
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1olTXk-00008B-Hn
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:16:57 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:54833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1olTXj-0007yg-0l
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:16:56 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 836255C012F;
 Thu, 20 Oct 2022 07:16:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 20 Oct 2022 07:16:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1666264614; x=1666351014; bh=2J
 r3qiol4Hg9avaO40/D8wrulioeXtWGmMLmGoPeno4=; b=KMIyWYT7521xKCV0SL
 cjrDYq+au9ji/0HDnhRS2QyUg+eJMYn5kQ5oPnDZKqWO30RJKjw7zmHJdGIiN1w7
 sdKWfw8MEI3ucZWQtP1d1jr+HgvInuKypw1WX1fK5cVeQ0uC0R4f55JR+8xU0HCq
 WO2hx5ItfKYOn+r/gVxp+xU8be9HLc++AvK20acDY4kfjYfFtb3CfCRa9pEvLSnu
 v1UwDoQXetAj+8GbyHTuufJ4+B3bY5tB2TgDYGaOoOE3EgrI1ThPJLdhnorMrUKc
 Cok/k3Viuw7VMoPUl50kN/1N7HUn/J2OU/BzHhtgAPz7w/0+B2/JnC2kTnu59B8T
 rwyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1666264614; x=1666351014; bh=2Jr3qiol4Hg9avaO40/D8wrulioe
 XtWGmMLmGoPeno4=; b=rIyB7Os/jriJRz4r5TRR/4DbFTj5bhFE3j8X8SAb12uM
 4ddkDI1VcIHi+oAgIq31TjhIpuqdJoNDDTN6VMAmTaN7LALtzjL1fgXVz0/N2PHi
 X4z/zM4tQGRNx7NdeiVVVkI/YpPGmgLq8hr1JViJCEATId+s80jj1+LDE4BJnIML
 bTqA55uZVb1/u/QQCka5MPhWFuIK8GwErx8jrysFeKJwpjNVDNUTIwKXlNaRCuMs
 SkRsPsQCHw4vSmKP2Fg1Z+SscNYmXR6V7BUCQWfvEpmCG1Hv+rJoIn3/5VsZVLBZ
 mTcDdXE3qwixZMY6MAScsEymMgecBm/cdAepkinFAA==
X-ME-Sender: <xms:Ji5RYwtcj7k-ormNcbwfvCIiiWh7gHyKRqDPIS9wnjj6oL2eFRlRFQ>
 <xme:Ji5RY9cu1np4_YUXRisBEkX-CUe7683p6_QvptPaU2mIY1p_XOE4l_Bs4vlHvji95
 QLXCbFonCzrtcKOxPY>
X-ME-Received: <xmr:Ji5RY7xz21K3dFXsbFifH2NvtuQ_unc0cuuOGKr6rEw5EF_gjiflHm_3itIRlhyc_aao>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeliedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgfejfeffvdeuhfeifefhgffgue
 elhedukeevjeevtdduudegieegteffffejveenucevlhhushhtvghrufhiiigvpedunecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Ji5RYzObnm_p9t6aRcVjYN8ELBaQJiUjSSYkAHmkznmABbxGwWYCsQ>
 <xmx:Ji5RYw-rP49SJ8hE2jJ5AZ91zRQQanL0FfnHm2XLtPxA66ieUYqsrw>
 <xmx:Ji5RY7XrhWarbh0E8ZI8F_lNC6-05ATykLxIbsubeCDepYmWeY9qXQ>
 <xmx:Ji5RY_YyesYkXJvJcOtjSUr94nfsMMIMUZHYAONzxk7MYoDxM7ErNA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Oct 2022 07:16:53 -0400 (EDT)
Date: Thu, 20 Oct 2022 13:16:51 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org, stefanha@gmail.com
Subject: Re: [PATCH v3 0/4] irqfd, iothread and polling support
Message-ID: <Y1EuI60+kDFpQjlk@cormorant.local>
References: <20220827091258.3589230-1-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Kk/U7COQITw9OVdf"
Content-Disposition: inline
In-Reply-To: <20220827091258.3589230-1-fanjinhao21s@ict.ac.cn>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Kk/U7COQITw9OVdf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 27 17:12, Jinhao Fan wrote:
> This series of performance enhancements brings iothread and polling
> capabilities to qemu-nvme. The first two patches implements support
> for irqfd, which solves thread safety problems for interrupt emulation
> outside the main loop thread. The third patch adds support for
> emulating NVMe IO queues in a dedicated iothread, which avoid
> interference from other devices running on the main loop thread.
> The fourth patch implements SQ and CQ pollers, thus enabling polling
> on SQ and CQ.
>=20
> After all these optimizations, our performance becomes similar to
> virtio-blk.
>=20
> Comparison (KIOPS):
>=20
> QD                    1   4  16  64
> virtio-blk           59 185 260 256
> nvme                 53 155 245 309
> virtio-blk-polling   88 212 210 213
> nvme-polling        123 165 189 191
>=20

While reviewing this I noticed that the commit that introduced the
ioeventfd, we end up disabling batching of cqes (that is, we post and
interrupt for *each* cqe).

I'll post a patch to rectify that. With that, I am seeing progressive
performance improvements with the patches in this series.

--Kk/U7COQITw9OVdf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNRLiMACgkQTeGvMW1P
Dekyowf+JlI3gkxB0m3N8xMOT7N9tmV5YLh+E9w0wQLFcEVl6DgFtcaMjJAWA0Dn
WJusOLygMqYjR0b33/5d1o2Pl0JHL1HnMsHj07UNtSJOgTe4Ng9/S0DzooFdmbu2
RJGgdKaO/AIonKvIDbXhILv/sX4Z/jZgA15IdqX/wQPCJEyBFtyprx13bFaP+zTg
m7NHONP3C1QrQbK9/0p+lIo75BNGkDhQDbSBksMEJ1SJq1lz0yLreB++G9zDqA1x
yHTa9lSxjkvjIWQ5o8zqV70g7bB2ReDTSvwSLpVVcSIkbZrRsu3parNiOd1Lw9VR
bSlXVIn+F7oZTAyIlRL4/r7YjThEfQ==
=uvTH
-----END PGP SIGNATURE-----

--Kk/U7COQITw9OVdf--

