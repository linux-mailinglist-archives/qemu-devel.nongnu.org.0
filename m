Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C782F5820E9
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 09:18:47 +0200 (CEST)
Received: from localhost ([::1]:36662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGbJe-00024a-6S
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 03:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oGb4j-0006PF-A8
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 03:03:21 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:34677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oGb4h-0005mw-9J
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 03:03:21 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 770E35C00F0;
 Wed, 27 Jul 2022 03:03:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 27 Jul 2022 03:03:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1658905395; x=1658991795; bh=i1
 llm2SRWaNsNWNvZkCNDmzaRqVPXhw1mMlGhNpf3AM=; b=Ek2UahCO9V7les+eLC
 /sQcaJ11ym7LKSToHDfRTlfYQ8SLkzN90dksmiTrMv5r1Qukv+D3q2L4kGOTcwB2
 wwVEyZnosiz+UZmSRMHXNsM8CNeUMoeAf9QJQAPpWMsJOWohKT3j+qJA7hLfw3K9
 XYHPeN07Q7KcfpYaiMI0kfAXfTJzNbymxKaIX7rQK6xrOfdB2BcPG5kHi+paXk0s
 wnzliB8j7BearW79MBepfzYpGLyeld3mlm18U3J2CPdjPo5bHCN/vE6VKhLENZTZ
 Gi2KcaIlZN8SbXr4EekIr7qICVqI7GvxzGzhETkmoXMLbwJGIpUH7NdMO0ca+wh5
 Bw4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1658905395; x=1658991795; bh=i1llm2SRWaNsNWNvZkCNDmzaRqVP
 Xhw1mMlGhNpf3AM=; b=C0Js5zyiEJynim0S1H2pLcfYie4ZIG1qIAcdLSwhrB3e
 4X5uGq9T6ANV1/92Dh9uLA1jaaPh4t0I/R083Rv6uUrjDM/kcqFgLzTsr8uui2fC
 O0wCBKKR9GKxeL0UWCkeyDh2HtS5VkA/4xt1K5n04nmed+SK+ZMpbT6UCJHAJfSE
 Td8qWq00RRpGNaR6q/9sCHgDnwLMN58mjnhOPYxcAseev7bwXXG9Z3LT4FShTbPz
 oey0adCUvtsvRGnXGk5pP3vV9YegqNCgK81QZ2yt/jsVrX754d5+DqWmT+T/r8O1
 beXEYf2/YEY/b/Dcf7e4ZtXz+6nsnUNgu8dKwl4Qeg==
X-ME-Sender: <xms:M-PgYmvez2yKf3ZslQ-fQhFdQKEDbD1DA_iIFIxko0dq9MlII3AXfA>
 <xme:M-PgYrfx7zIBT7N8ZPndRgkqKMeds6gp_NNJXOwokB8FmI5ArKVf0XpGJ4ta7jQfQ
 KcBEooqStdt6jsEqEs>
X-ME-Received: <xmr:M-PgYhytaMFAasO6SsUSMoxq5_jPBNpyeUFvxKHqxnOX7FjAiFA4xkA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduuddguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesgh
 dtreertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgv
 lhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepjefgjeefffdvuefhieefhffggf
 euleehudekveejvedtuddugeeigeetffffjeevnecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:M-PgYhNJzIdezXCJQpmavG-k9pfuAQ7hMiE8MOyx9RACiNA53GX4UA>
 <xmx:M-PgYm_zaW9Dm6ZtzdJLwMiBzPOriC48M451r9EUPVRqtazMGArLew>
 <xmx:M-PgYpX8DM4kuk9maFkk7UpvY12WcD3FJrw59tu8bprdQXKX5DkOOw>
 <xmx:M-PgYoJfsAdwA0KhbxdQO1tTzsXeg8cGSnhPfg7CZ9V4FU1ZAGEkBw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Jul 2022 03:03:14 -0400 (EDT)
Date: Wed, 27 Jul 2022 09:03:12 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel <qemu-devel@nongnu.org>, kbusch@kernel.org
Subject: Re: [PATCH] hw/nvme: Add iothread support
Message-ID: <YuDjMIz4S9n4nCY0@apples>
References: <20220720090053.309229-1-fanjinhao21s@ict.ac.cn>
 <E29F6EF6-F2BF-41F4-B04E-E6D901D64078@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9Nki9TIjh/tZocOg"
Content-Disposition: inline
In-Reply-To: <E29F6EF6-F2BF-41F4-B04E-E6D901D64078@ict.ac.cn>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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


--9Nki9TIjh/tZocOg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 26 16:55, Jinhao Fan wrote:
>=20
> Hi Klaus and Keith,
>=20
> I just added support for interrupt masking. How can I test interrupt
> masking?
>=20

I wondered if this might be possible to test this with a user-space
VFIO-based driver, but VFIO does not export masking/unmasking on
MSI/MSI-X through the SET_IRQ interface and disallows reading and
writing in the MSI-X table area :(

--9Nki9TIjh/tZocOg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmLg4ywACgkQTeGvMW1P
Dek6kggApMH/lNrDj6rDbdNgd5DP7ocboOca85qSjpUPsEKMSDqSRlHpXF+ivK5z
YbajrzXKAdSBjUcnKEkN7IZMs8jPIfXtpFOxSHV4Xuay8kCWmi58hHumE4oncgkX
tDNwwiF+/6ENKfrMToYjwdOyRXETq4eBYx+PgW4gmf4uAA6vmH2nEB7RaSy+L8Kv
nK1oxxS/Dxorwt0NyJ3nlAk914+k6dpYmdKKHIw0BKZ5b7/Elr9FMAcVQzA0Ep8c
q+6+DvyO+Rr+Gz4ocpXjdXFwrAltGOO6EW4JzUZQBLEa9dwi+7dFZ6+h9F2Y39Mu
eyE+nyq3GWrlX50bsX7PPADkVtUZOQ==
=PqCH
-----END PGP SIGNATURE-----

--9Nki9TIjh/tZocOg--

