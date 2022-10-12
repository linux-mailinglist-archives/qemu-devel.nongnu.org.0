Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 427165FC7F7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 17:08:42 +0200 (CEST)
Received: from localhost ([::1]:47386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oidLd-0008ML-Ay
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 11:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oictn-0004k1-3d
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:39:56 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:37205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1oictl-0007XW-0W
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:39:54 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3D62B320047A;
 Wed, 12 Oct 2022 10:39:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 12 Oct 2022 10:39:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1665585588; x=1665671988; bh=Hd
 lnIuG0Pnt4GxUOmUP2xOwgREFrlo7LWyzRlghirMI=; b=jQocleq9ae4EmLh21l
 oYbBfRwn2bZ21PyfYXR//FKYbwmntsHarpMSmZLmbFX3a3o0swkQo6Ixwo6iOQ7L
 W9L6UMt4V9f7FeQgX3squGUuiR1DiC7jDqJaaKfkHnXfmCvErQ2MHInrfNZrQqD+
 cCD0C7J85/wlefF/VhCiNORLy0tCjfsdoymhtjda4i+WRc0P5AlBSMhNg0kmpm1R
 /Amd0+5KlPIVb2qDoQVXdO8Vad9ADandljurvwbjsFCyDKVb9n8lHALBAZKjkfXc
 vKd2dJVsJnnCvqD4xzQV7KWhNnBoVzNF7b6CafChAKTGGQZn9tyd4nMQLKdJcK6F
 EJxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1665585588; x=1665671988; bh=HdlnIuG0Pnt4GxUOmUP2xOwgREFr
 lo7LWyzRlghirMI=; b=i0Yj4vEGz02+lAEkbc2hr0pfPrh3O3YXn8Oci8KEf9HA
 JW00Ro8OqzSSIe8/2dytBpAJx8msUkni7ktSWlkrb+KqGAflSlALDcsW7chbCswa
 WDB3ZMM3sJi5JbpMqTi22CPO8o5EJAsehRMYnkCGydGdEwp1g0nMLPZ/bes8ldrc
 qaywefJ9T1WESD5HkvZcyOiGGf6HYnp4DYTxdNTLTKIrNZgEzjTPyxMY88d0LJ1B
 RPOuXUUPPZKBSVV6jv4Q+F1V2V9HPfARUHdCC9HrCRMXTwbj8xK2i8Zg7oWJrAUY
 15LpmxKUo+qeaqR0kIlcTGIpo62+IFiTzKM2Xcjy+A==
X-ME-Sender: <xms:s9FGYxS88pr9Xl1woBbW53S-2E86Fh93PSlH79YXALG061H3191Xiw>
 <xme:s9FGY6wouhApwG6jkGfSJs5B86Fe_4V1JPlglnnGN6PsiNtU8OkYn12J_y8Lc5UkH
 _Tro-PxTSuh2KOhxcw>
X-ME-Received: <xmr:s9FGY20xvv0RtoixELOJZhmPGV-paoWyJ8HDHBtp9j0F6KbVLLD6D4T4mlRsaqVAVOZ3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejkedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:s9FGY5BlwkXO8osZXw9qorWECJUHJQBWnuUo6LN9zZpyX_Eha-DCyA>
 <xmx:s9FGY6hiCBglVBYgQNKnVx0Mcr-vZTkTWzFyM-lejALe_gQ6LnZeAw>
 <xmx:s9FGY9qN--fSV77zKp2QEajSNnF86g_aBEkALowlQ4tZv7v3QR2hGQ>
 <xmx:tNFGY7sUsvBwkmBLWLys0XzR5Ys6n0zCe427chNbtT3ntE8W5nLrXQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Oct 2022 10:39:46 -0400 (EDT)
Date: Wed, 12 Oct 2022 16:39:44 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-devel@nongnu.org,
 kbusch@kernel.org
Subject: Re: [PATCH 0/3] iothread and irqfd support
Message-ID: <Y0bRsLWaSaUnPFqM@cormorant.local>
References: <20220826111834.3014912-1-fanjinhao21s@ict.ac.cn>
 <CAJSP0QViGDCNrdPNPnT87go=ofCxTE7cWMGHFnOH5v+8rw8BGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="89d/YDLuDqRdWwVL"
Content-Disposition: inline
In-Reply-To: <CAJSP0QViGDCNrdPNPnT87go=ofCxTE7cWMGHFnOH5v+8rw8BGA@mail.gmail.com>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--89d/YDLuDqRdWwVL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Okt 12 10:28, Stefan Hajnoczi wrote:
> On Fri, 26 Aug 2022 at 07:18, Jinhao Fan <fanjinhao21s@ict.ac.cn> wrote:
> >
> > This patch series adds support for using a seperate iothread for NVMe
> > IO emulation, which brings the potential of applying polling. The
> > first two patches implements support for irqfd, which solves thread
> > safety problems for interrupt emulation outside the main loop thread.
> >
> > Jinhao Fan (3):
> >   hw/nvme: support irq(de)assertion with eventfd
> >   hw/nvme: use KVM irqfd when available
> >   hw/nvme: add iothread support
>=20
> Hi,
> What is the status of this series?
>=20

I have been meaning to pick it up, but I got side-tracked. The polling
performance drop needs to be address as we discussed offline.

But the v4 looks pretty good and I can pick that up without the polling
support for now.

--89d/YDLuDqRdWwVL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNG0a8ACgkQTeGvMW1P
DenKEAgAhJIRRzfvZhhVbk+UJHbR7igMzuq9KMyuavl0oyOeJdxcBdASUI0rcwZm
+44U006R1HEuUezbbPXbRxOG3Yx1jH0kJ83PZSlxzMcVO8X8LCrGA3i4twd+QfLo
5+DA6ExgLtkBuCbDFrQPtLBfW9WxWkIBOsWjjkUKmvWrbN7IuZM16wKhf9j4F1eZ
mRoFLCUP9RI+hQKcojG6YZmpD/KajyyRCSDF7k1bV/7HPAomSlJTUbEulQ6tHryC
rq+XvktABZwK866GnYSpGyQCFozRU2oCRiuaLkX1RoLJAT1Au5qmOUAKF6uWbeFb
AQyu3WpWX+1/FsdpjUH9/ZO8ist8yw==
=Yu9u
-----END PGP SIGNATURE-----

--89d/YDLuDqRdWwVL--

