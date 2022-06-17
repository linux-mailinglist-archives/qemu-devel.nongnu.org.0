Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C246154F803
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 14:59:24 +0200 (CEST)
Received: from localhost ([::1]:58854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2BZL-0004Jg-Dd
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 08:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1o2BWq-0003YR-AC
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:56:48 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:36431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1o2BWl-0002S3-5s
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 08:56:44 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 276D55C00DD;
 Fri, 17 Jun 2022 08:56:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 17 Jun 2022 08:56:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655470601; x=1655557001; bh=f3
 rsKljFebc4h22wllVTUtC4hzl8BM/3g0wEF9IDt7E=; b=QeRCEpPosdYT9j4hiR
 kPCpEhzAcirU5hBIwEi86SkiMhjeYQPTnDhCdHELoe7jFm5fpEaIz4N8w1eWhI1z
 rVtcSW+u6ezLjPvXf8q8a0Q1RfdqTo73hwiZa7+UsPn2zv8pG5S6tzYKPGHquY2f
 mTNehQi6+YmSPeqjG2W26CQnNbWck55MiKjaqX3/ozlOT5otPUfdmLbLeEBGHuUz
 Nfo1FLA2AC6XlsTVVo/vy11lYQ9Q6e9vurXVXbs8GCJ8zQfStNn2WZgewru3twjR
 tHVxQP5dko3X/xiRbEPWykKCpzu+6+kuMzQ/37nbHsnTt8oHPOyCIflyoUM4nzzq
 FTnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655470601; x=1655557001; bh=f3rsKljFebc4h22wllVTUtC4hzl8
 BM/3g0wEF9IDt7E=; b=dgtwDhSLhnPSn63dOxudtW25xhf4O2ecCe/audRxW8fm
 h9VxWqmrfKSvKZeaz+QOgkBwMJyU+6B4XQDyXCPS6qqub36foLdMY0zXJmgutpP7
 kuTClAsYnTq0MPwVvu0pOseAtziVTtFaxjwtrI3bvsx3IYSUXEoA8w+E+aDmRSkJ
 30rvFO8LOUPAGsjG/Nk6IiStpnM7s5rbJSETFp00ys1DNP+n2CarpZw1qzfWCyPI
 pfaRQfFJ6mqgt8kK1vxe+YzdsA4A4hZ4K6wvz45XFkJB0anQzN5fhLG3GlJsG/sv
 pc+g6ABKPec0KqCbjtcznHpoQQKEzYWTSFaPATrD4g==
X-ME-Sender: <xms:B3qsYq555skiVNzTdKne1B9rcnJg8481Z-0lzy7loPd2LwtY7C1u5g>
 <xme:B3qsYj4_0mBNga-UleWQdSxN7bAv4tfLPHvJ00S31extCPlZwiBEz46eCL7PqaaeD
 4Ez0zmsHAC5mGHc3Dw>
X-ME-Received: <xmr:B3qsYpf53iZDSgLZR2OXPhng270J4lK1mAAKEFYyyZvTciDCu8DF7qdWfGwfGIhmf8pYWZZsFd2m-Y9psw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvhedgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgfejfeffvdeuhfeifefhgffgue
 elhedukeevjeevtdduudegieegteffffejveenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:B3qsYnJbRS83LPAxhgwyYpJaBRZrZGgVscwFLWP_FDeW1Mle6usoHg>
 <xmx:B3qsYuIfDNZ0gl6vc34WaXKbxyVR9y_8Wj4MMM-qzEtIGrf6LWRD9A>
 <xmx:B3qsYow7Denew5T2hX1dxqxPW4d19c6XqSvyxT5vuQvO-qIrk7ucdg>
 <xmx:CXqsYlWH0tUI74W7usT-Dghnp0K3n5-1k_r7yABUdFEnuXMREFmV_A>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Jun 2022 08:56:38 -0400 (EDT)
Date: Fri, 17 Jun 2022 14:56:36 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org
Subject: Re: [PATCH v3 0/2] hw/nvme: Add shadow doorbell buffer support
Message-ID: <Yqx6BK6sh5s0FG3O@apples>
References: <20220616123408.3306055-1-fanjinhao21s@ict.ac.cn>
 <YqxrXgLeMdVKFQ4P@apples>
 <75D77EF8-3A0E-4CFB-A7CB-2342C28CB60C@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Dy/JwgfMtLc3Ixbg"
Content-Disposition: inline
In-Reply-To: <75D77EF8-3A0E-4CFB-A7CB-2342C28CB60C@ict.ac.cn>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


--Dy/JwgfMtLc3Ixbg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 17 20:47, Jinhao Fan wrote:
>=20
>=20
> > On Jun 17, 2022, at 7:54 PM, Klaus Jensen <its@irrelevant.dk> wrote:
> >=20
> > LGTM,
> >=20
> > Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
> >=20
>=20
> Great!
>=20
> I have two questions:
>=20
> How many =E2=80=9CReviewed-by=E2=80=9D=E2=80=99s do I need to get my patc=
h applied?
>=20

That depends ;) The maintainers decide that.

> Do I need to post a v4 patch to add the =E2=80=9CReviewed-by=E2=80=9D=E2=
=80=99s in my commit=20
> message?
>=20

Nope, the maintainer will pick that up when applying.

--Dy/JwgfMtLc3Ixbg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKsegIACgkQTeGvMW1P
DenlsAgApeCjplSyP+0YNxvLQ2RQdkNCNvgLlhfYRlUydEpDety2Zy0icK4HZJiq
SgyY3CJpQS4xNFogM6d5EY15T71vqv35bB4tYfC7KT1t/RshzlfRyjVB1jq6mJga
aoPzUw+XI7waP5Qr0O/svJI+TSVr+gPPG6dhWSHle+xTnnsS3FbR27UXStOI8yTj
ycbrmDCcdos0zyRXr1Wlo3R+hDHEYclTjoR5YAagiXQ7ewM1pXdHI+8lQoIJnGbY
PCEuHz0jtiQJnwfLVzdhR5Qj3kic8kJJocdgGC1qBpTZ6Rrsb4K3rXnJKyoZnaf2
cpfcN3sJZfCtf1be7eTHZzs8gd3EJg==
=Y+JO
-----END PGP SIGNATURE-----

--Dy/JwgfMtLc3Ixbg--

