Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4A242FDA7
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 23:52:06 +0200 (CEST)
Received: from localhost ([::1]:50228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbV7V-0003WB-4U
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 17:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mbV5s-00026b-1k
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:50:24 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:51557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mbV5n-00048k-RG
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:50:23 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 21D1C32019DA;
 Fri, 15 Oct 2021 17:50:15 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
 by compute2.internal (MEProxy); Fri, 15 Oct 2021 17:50:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=qSThY
 dqz59eOyMMVIXKeOROOGHDXUF4LU3CmJjsQl3o=; b=sCKHzcx82Wxv0j4JVNJ0x
 P6UZRwU5DPfkNXt98FN1pFFbcAdCpNMt6tKDUCY5i09SyAsqXcny3p4gcjVZHUWM
 DyAeePNgXSUSQd1v5Q0d/lm6bS3hTv9zGXZvDvMK8pqtHZhKhuqUUKn8IITG/FpE
 MW5LhDV/shDbkLfVkma11QiP8J/+0qGWCxR+W/LEI2WHpkoGtCN9fhCLJFZE6sZI
 67dPYOzOLrauQXqyQO0KOT+8K78jVtAvKbPkFvF+DC7qKCufef3hVTfhuXNRY/LA
 Opm18W18/zCSC/GNVWqfyebwAeT+fN9NCcPkQg7eA7ZIbVGWZ9hB2TEzBeERj4xU
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=qSThYdqz59eOyMMVIXKeOROOGHDXUF4LU3CmJjsQl
 3o=; b=KE8gvZ+IFdi1DAZtz0zbdD8rBqe46sHqNiPEbmDyWPO2WaXtZ5EkWn3w2
 MS6ICtd9LXIEiNgILol3jT8p+IKkHvGl+EdCuR4xf/s8jno9tdQJo2pVdhyo4lFZ
 fRqEjLR7UMQOZz5jMQ/1YraVBBpf4k6z9rWDuKslvB3x0X2ldqhOQnnbo5qB7A0D
 6n8Uo3V2c292JShCY/in28SOETMcf7AbHNd3o83gXLvr3YMTUQ9vfzf4xuHn9/AH
 6ra1d6fu/Q9+0MsDSr6ubWPhh4SIQQjbXLyyou7jOszreDCTCSuTpuvYEVFoG1+K
 r3T6eT7dgYRQw2eLpmDkktzayb8Eg==
X-ME-Sender: <xms:lvdpYYdvNYqSejXC2P0L2raFdBotEOI0rNt2Hhmmur3KcCgfQkJYWw>
 <xme:lvdpYaPiXQVwhRK7uNyEZuJ7otQ1lrnUBe9R-b42KUp--vQt_vJAVT7in4ZNZJnfw
 SY_A3a8M8M_OvVyzok>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdduhedgtddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
 rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
 eqnecuggftrfgrthhtvghrnhepfeetgeekveeftefhgfduheegvdeuuddvieefvddvlefh
 feehkeetfeeukedtfeejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrg
 hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:lvdpYZhJPOKIXa-kXIjKD6tdx6E3djMzjarhjK3ziUWoczpJhbM8zw>
 <xmx:lvdpYd9RzWoGOVgcpgZ7Bh0cm2xo7tUZB6hGi90Es8iLGYRjNT0P6g>
 <xmx:lvdpYUv60QjZgJBhStOTN6uZCsxo7ncsdDtTQjOmJbRKv5qtwbXk8w>
 <xmx:lvdpYd7lJwyYhoCGsu53OaIPTMDbNWcUSDSuzX-1WDDN1LGsvKbpCA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 97360FA0AA5; Fri, 15 Oct 2021 17:50:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1345-g8441cd7852-fm-20211006.001-g8441cd78
Mime-Version: 1.0
Message-Id: <adf8c5ed-bcbb-4f22-838e-65d1988fd24f@www.fastmail.com>
In-Reply-To: <778c04dc2c8affac060b8edf9e8d7dab3c3e04eb.1634259980.git.balaton@eik.bme.hu>
References: <cover.1634259980.git.balaton@eik.bme.hu>
 <778c04dc2c8affac060b8edf9e8d7dab3c3e04eb.1634259980.git.balaton@eik.bme.hu>
Date: Fri, 15 Oct 2021 22:49:53 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "BALATON Zoltan" <balaton@eik.bme.hu>,
 "BALATON Zoltan via" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 2/4] vt82c686: Add a method to VIA_ISA to raise ISA
 interrupts
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.25;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



=E5=9C=A82021=E5=B9=B410=E6=9C=8815=E6=97=A5=E5=8D=81=E6=9C=88 =E4=B8=8A=
=E5=8D=882:06=EF=BC=8CBALATON Zoltan=E5=86=99=E9=81=93=EF=BC=9A
> Other functions in the VT82xx chips need to raise ISA interrupts. Keep
> a reference to them in the device state and add via_isa_set_irq() to
> allow setting their state.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

> ---

--=20
- Jiaxun

