Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 052D2359611
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 09:09:19 +0200 (CEST)
Received: from localhost ([::1]:60054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUlGX-0006AX-M5
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 03:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lUl8M-0002Iq-94; Fri, 09 Apr 2021 03:00:50 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:37127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lUl8I-0006yO-Vt; Fri, 09 Apr 2021 03:00:50 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 107E31653;
 Fri,  9 Apr 2021 03:00:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 09 Apr 2021 03:00:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=sMGhGADtjojGJqngS84ipn8On48
 jBlbk/SrZfh/cOCo=; b=xjlAC+qXc9BMQkhM4qmz00WZ0yhDIeK+pTYCJnltRLC
 ZeY4oeerPZkbY4TSuMHwc+uByfZMT6xgg/hLI4vGE+Nv7x5pkmGtsT8fEchJRB2F
 gjnKMPZ/aFjL0Rd+4rxYkNpGiHlD/Gm/7e6JFL6P+pBAZu5gn/2ikn88MNnNsq66
 sP4EQJDnsJ36sP6xj2lj2Lr1/Agabbz/XSXvwOzxORCp2C4peNJLEL9FOk8WaJI6
 idvlxro/5X1KzdCc6Fpb7heP+I4FFr78nzZItxwQlK+EF+Aar3QFfLeDFLuleDxD
 OIM+BUq1C029RD/0KzG+akllVNxmOi+utDRoa3/Fw9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=sMGhGA
 DtjojGJqngS84ipn8On48jBlbk/SrZfh/cOCo=; b=n6OlgwvP6L5G6sJxvDzkxM
 igDyQcd0U07LGh+Vp8khsLwt2KZ9w2MX+pwyZYRcVoa35iWGx7Ks0Vi3I9pPdGzO
 hoiXYoueQ5uGT0Noyc7LOr+MXUQIn6/A2i8etbINDKIkU2xtYdaNJqLWxsLyKJPg
 1S4Jxb9+RoiKaZxvX8xXcblaMWwuk+DwM/nnLjGW3CLnmLFy0vMGrriMcIxPL9Uh
 OR1wxx+VwO1rNDcQH87Wh/+eUJVVYXvXOND/9uhtV1t+uBC0BtAXL2St3cSnllI9
 twh7dTB2S35ChGZ9kENzj+eUAVvKFrM1siX4+3HrP4I9BAByq4IgRh8c+/VIjeBQ
 ==
X-ME-Sender: <xms:mftvYEQ6usMc4z0RQZNBecAR_IknA21QEl5XLrXuF7MN2O493AcsDQ>
 <xme:mftvYBwDSp0NoK1C_UIZvcYdpzFs6OQ8n_k5tZueaF_-arYypvz0Vz7jVk7EoX1cy
 WM0ublEBbZaxyvVtNo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudektddguddufecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:mftvYB3TfpQcTDkipqmk3j-jjY0e7DLZumvIV3nE4qELv65SmVJ8KQ>
 <xmx:mftvYIBdSzUQzjKLr0b0yrhPe73WkG7chk_rgWbBs31eS8VHyAM-_Q>
 <xmx:mftvYNiTW9W67my209EoE8OUyEaiLubdyBSTdKEVNmuIX5wZh59raQ>
 <xmx:mvtvYIW4-rgI6W53Jsazyv5egd4G42siZmzhKo6UP5K57TFSqbAYZg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 48AF2240065;
 Fri,  9 Apr 2021 03:00:40 -0400 (EDT)
Date: Fri, 9 Apr 2021 09:00:37 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH] hw/block/nvme: map prp fix if prp2 contains non-zero
 offset
Message-ID: <YG/7lUSf+r8d0Lc6@apples.localdomain>
References: <CGME20210408162750epcas5p1f093ab42779ab250fbcb672a41455a30@epcas5p1.samsung.com>
 <20210408162313.22749-1-p.kalghatgi@samsung.com>
 <20210408213821.GA4727@redsun51.ssa.fujisawa.hgst.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wBBKbZBwuQ2Vh6GB"
Content-Disposition: inline
In-Reply-To: <20210408213821.GA4727@redsun51.ssa.fujisawa.hgst.com>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, stefanha@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 Padmakar Kalghatgi <p.kalghatgi@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--wBBKbZBwuQ2Vh6GB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

On Apr  9 06:38, Keith Busch wrote:
>On Thu, Apr 08, 2021 at 09:53:13PM +0530, Padmakar Kalghatgi wrote:
>> +            /*
>> +             *   The first PRP list entry, pointed by PRP2 can contain
>> +             *   offsets. Hence, we need calculate the no of entries in
>> +             *   prp2 based on the offset it has.
>> +             */
>
>This comment has some unnecessary spacing at the beginning.
>
>> +            nents = (n->page_size - (prp2 % n->page_size)) >> 3;
>
>page_size is a always a power of two, so let's replace the costly modulo
>with:
>
>	nents = (n->page_size - (prp2 & (n->page_size - 1))) >> 3;
>

Good point.

I'll fix both issues and queue the patch.

--wBBKbZBwuQ2Vh6GB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBv+5EACgkQTeGvMW1P
Dek8Ngf/W1aP4zVVymTl70syFv71l+9ohqgppRvMHsV3PXtNYlknK6D9/vEP/mnP
g0KXR3s4nqf/c2t00A+cw+7VdhheVNx+W1OJHA7B9iYMCKZIrmuZrqVV26vg803M
rqhZRbMZwM/2zhEMmqTjj0sJMoo7srVxIv7boU5iy2ZaRXMnFfnNDCDnN///9UAQ
15MMoboJ0y2QtoVpgHTc1/JBkKq1Kfv9rn4aslkmIA2s6Tzdnx2YbaXSxNebrbQU
5fqkRgl3+/k+vXJIxg7yKM60R9Ooj8uZSbrGeAUnWzNrPIXw1smh6OVUIasGiyDy
dMQXf//WUDA1P8LSQoMRIraz2lm9DA==
=lKfX
-----END PGP SIGNATURE-----

--wBBKbZBwuQ2Vh6GB--

