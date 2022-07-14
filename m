Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B386574231
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 06:21:28 +0200 (CEST)
Received: from localhost ([::1]:33510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBqLu-0007K4-07
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 00:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oBqJ3-0005DR-3C
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 00:18:29 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:46115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oBqJ0-0007Q2-9z
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 00:18:28 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 3C2DA320091E;
 Thu, 14 Jul 2022 00:18:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 14 Jul 2022 00:18:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657772300; x=1657858700; bh=fz
 /9qabC1cklPuPuzYeL2wVK2+FJ+wfYd8djEGWEtWI=; b=IHqgN1KmIqvVUFQZs6
 1GXWaQDFAr8JrIuNluqJT97ch05Ag4QxbOMMfDixQ83cx3+zzcn1ONzE3fkPyXln
 3Iah+gyqHu7lfqJKragFeW9pRDiL/0qPbfDMXnxDLE/wlxOId4eFL7tQQqSOXGtQ
 K67IgaxGK7iA1TJ2l1EaQsy6fhphK6Px8KPTD6qHWzzKMuXyhGVS0PZBr1TDUbEn
 kbAvjyYL7h2CXhN9ZeE0rlCzGpouhNZQ2xnlat26r/rLNOPA9UIrakBPyhYwGVzD
 LgkcuXbMK/FKstoexTquf6kEx+s+FwNnco+4EKp/XcPzl4LdY1JMBwXC2Bhzz7NB
 XQGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1657772300; x=1657858700; bh=fz/9qabC1cklPuPuzYeL2wVK2+FJ
 +wfYd8djEGWEtWI=; b=0Zvtn9OPtmYBA6It3zU0hIH/I+0yMO7CzzVmbjf4AGYD
 LJN3fiR9liD7aWsO7ppvi85IN9IZ5x5hXtRWOesch3HjYJ4lHAl7V3tde3sCa/X5
 2vTnBgIEV0VmZhTz8mNK2x2cdezbp1CYIzXIMVChT7KzqSV1Qb5khQbiFVswFXzI
 HWx1iY3LOaPTPjKfOKQzuhrnKH4HbceJR6bVtOTA1srp5451TsnTqZoQC1hnBPuk
 IqqEp7RMGDTDEMXJNNxoQFcxTomiiD4hAAP3bRUHRlc8C8I4IcHm0HdcA6DplymY
 HuBKjth3zut5XI+VI3gatkph+XZH3pHNXuPkLvRTHw==
X-ME-Sender: <xms:CpnPYqDBTJULh6kfgi4jo0FVF9m_22mXgfBQsSM-zl6cMMUYU5zzBw>
 <xme:CpnPYkhNGg-RlR9LhKkjAw4OJ7uP57Se_aGUroHtvjXMfTNrfJg5R43KOJXhrxU23
 KK6K9_LcNt_KFmBqfI>
X-ME-Received: <xmr:CpnPYtnvYbUDrnY1z2dxK45JLfzJqnypJf66vim3URENTbTKwDTLDFDsQePQHht6teaRFbQ_Z2TvLBD8Ims>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejkedgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgfejfeffvdeuhfeifefhgffgue
 elhedukeevjeevtdduudegieegteffffejveenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:CpnPYoyBH8dQAEc6Q392WV5djFiJGbkwaJn4K9A0GiOdgAM1CqExzg>
 <xmx:CpnPYvS0ISgjizu-eV7SI4Ddcqrd0YDD03V-DIMCXLKFooZ1gGyshQ>
 <xmx:CpnPYjbgw0ilJY8pXpo9kAYtHXptZ_rrEnpHuA5AxvByYA9I3Ki9OQ>
 <xmx:DJnPYqfsyospA7B4iBAfehC8VKuNisF5lzI9yy39z5OPjmvbEU0FbA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Jul 2022 00:18:18 -0400 (EDT)
Date: Thu, 14 Jul 2022 06:18:16 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org
Subject: Re: [RFC] hw/nvme: Use irqfd to send interrupts
Message-ID: <Ys+ZCHFWbjAH/48O@apples>
References: <20220709043503.2228736-1-fanjinhao21s@ict.ac.cn>
 <Ys1oY9LmeDCGT9FT@apples>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="v3jKuSJ8O1QhPWVU"
Content-Disposition: inline
In-Reply-To: <Ys1oY9LmeDCGT9FT@apples>
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


--v3jKuSJ8O1QhPWVU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 12 14:26, Klaus Jensen wrote:
> On Jul  9 12:35, Jinhao Fan wrote:
> > Use irqfd to directly notify KVM to inject interrupts. This is done by
> > registering a virtual IRQ(virq) in KVM and associate the virq with an
> > irqfd, so that KVM can directly inject the interrupt when it receives
> > notification from the irqfd. This approach is supposed to improve=20
> > performance because it bypasses QEMU's MSI interrupt emulation logic.
> >=20
> > However, I did not see an obvious improvement of the emulation KIOPS:
> >=20
> > QD      1   4  16  64=20
> > QEMU   38 123 210 329
> > irqfd  40 129 219 328
> >=20
> > I found this problem quite hard to diagnose since irqfd's workflow
> > involves both QEMU and the in-kernel KVM.=20
> >=20
> > Could you help me figure out the following questions:
> >=20
> > 1. How much performance improvement can I expect from using irqfd?
>=20
> This is a level of QEMU/KVM that I am by no means an expert on and I
> would have to let the broader QEMU community comment on this.
>=20

In any case, I'm wary about adding this level of kvm-dependence in the
device. This wont work on non-kvm platforms any more.

I think you should put irqfd on hold and focus on iothreads :)

--v3jKuSJ8O1QhPWVU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmLPmPkACgkQTeGvMW1P
Den/oggAlyIwBZi925ZzIey+wbzl1dRc6JqcRyNnJqXrp+zTvwfkoxMRFwtJ6lij
8PUR5o7DSJ+1d1uHWfN0v6bGgnxA7OtrfClogz1S/zZwGKaA7z9KcxGPX0WndwK2
psyq/F4bRdhdptbNVOstlgz0dykNZ9hP/QVC7QGyJf/PIXqRwWwUAZ/2ROEwOWUJ
mPI7GkHkv2QN2XQa4O1/WZR8FGi1Jf9MWVqu2nqxczuHD8k0G+ExeET6CQ1OmTo1
EHzBgvcNcfQE5tFkTBicTKvbLYFTUCLtWzLP/SI5TZFJDmx73ort0JAt33H0jJQp
vDwhS1TGJ39uUZwmoxZ5gX9o/vs9wg==
=BvS1
-----END PGP SIGNATURE-----

--v3jKuSJ8O1QhPWVU--

