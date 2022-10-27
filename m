Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B59760F565
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 12:37:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo0FK-0007HZ-NI; Thu, 27 Oct 2022 06:36:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oo0FC-0006Se-5C
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:36:18 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oo0FA-0001A3-7x
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:36:13 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 77D8B5C017D;
 Thu, 27 Oct 2022 06:36:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 27 Oct 2022 06:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1666866970; x=
 1666953370; bh=QjF0/PefXPriS9SBXdCeHqrCG14ESGARifMmtSqQxHw=; b=j
 7z+UySPSf5zT2dYougfF2ydY/IEc0pBwox19hZqumF/N+4fXUQDHbowOz+3d9Sj2
 C00OiCGkqXYDcn5vBj5kSvbs2vH/WkMeB3hS2Y7gXM/loBkYjuLxJOI/MZ8Gr7Hq
 O4jsBHu8sxCvuuAHwEt2ZLMPXgNlImk6rIgLNIdbbH2PHYq3ibCqggn5gkTKbw3h
 dxI0migR/L2qEzSnQetN0hcRO9OyMmrBgqrS/DMdnHytPDkPwKt3Wk3XO0+x1r5T
 G+9cW/KDU2w5weLNV301n+z2z51kH5XWzE3Ovx5u0+y9G57L+ZDONKYnhON42zPO
 Tnxb4/9Z3RRgI2jgZlQzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666866970; x=
 1666953370; bh=QjF0/PefXPriS9SBXdCeHqrCG14ESGARifMmtSqQxHw=; b=f
 TmYhLgGw6J7ZnVdo6ZaQMx+W74f+95WwISLuXHh8WKgcW1Frk33yKR3Xsb8k8ZRh
 IYJIRRKoR3/omRmZTa/n1RJwBX9HgUKTDsHjQw/B2qCf1Z5Y1ENh4phUp97jT+dg
 KssmeegP8rfVfTxqe/cE2gXQAKk0tI58mnB88r4Zk5FKC3jLmEWSdz6gUv/n/56u
 kpNZbDFmLU0DGngiyc8KocbuQfWjB5hLpCYAhvo5Kf8S0X9Jlzy/PTQG+XJI0igp
 l/IJTiBtqrnMhudlqVsGNtswbsCF/WdfTAJ/6rVcvoiyv3LUBb5nVPqdZvQTwwnd
 0fwjJBsteOlCOnydbyHiA==
X-ME-Sender: <xms:Gl9aY1KFquJqybPKaMFg54Tsfa5K5Ta96QeJx1XjUbOp2C_uktrJSQ>
 <xme:Gl9aYxKM8AE6t9r4jBE9uNQv6PUFx34viUiP7ums4wLckKYKge9g_9dVxlivMvKYJ
 29Ou4BqCqAsqssU_F4>
X-ME-Received: <xmr:Gl9aY9snPKUTsFU6NpkWZUwgFwNMn24SwqjEDbdW5VQBvkSa-roJPHlZDvpPcR6EFh7C>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdeggddvjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtjeenucfhrhhomheplfhirgig
 uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeekveeileevieeukeevjeegkeffhfffkeekieekjeffvdektdeg
 veefjeeugfeggeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghes
 fhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:Gl9aY2YmM1P5o8bTk0DiT67QtEx-U4J1aYzbAI89iCVh7sDP3hQhvA>
 <xmx:Gl9aY8bBknfK7oIQyRN5zAwiKHxObx431pfc-uFvs5-VtzoVOU1pTA>
 <xmx:Gl9aY6ABA5vb3-41Vhyt5Q-F7FuxnHZcyzYpRzUsq8HFBBxia3TRgw>
 <xmx:Gl9aYzUA0PhLRhnokmANOwC88fTTMFFjuI01aFzmgCdS5bNIAXjKkg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Oct 2022 06:36:09 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH v4 0/3] MIPS Bootloader helper
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20221026191821.28167-1-philmd@linaro.org>
Date: Thu, 27 Oct 2022 11:35:58 +0100
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0408209F-88BB-4C97-A8F4-D55B7C71CE56@flygoat.com>
References: <20221026191821.28167-1-philmd@linaro.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: Apple Mail (2.3731.200.110.1.12)
Received-SPF: pass client-ip=66.111.4.25; envelope-from=jiaxun.yang@flygoat.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> 2022=E5=B9=B410=E6=9C=8826=E6=97=A5 20:18=EF=BC=8CPhilippe =
Mathieu-Daud=C3=A9 <philmd@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> This is a respin of Jiaxun v3 [1] addressing the semihosting review
> comment [2].
>=20
> [1] =
https://lore.kernel.org/qemu-devel/20210127065424.114125-1-jiaxun.yang@fly=
goat.com/
> [2] =
https://lore.kernel.org/qemu-devel/5a22bbe1-5023-6fc3-a41b-8d72ec2bb4a1@fl=
ygoat.com/

For the series:

Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Jiaxun Yang <jiaxun,yang@flygoat.com>

I thought this series was committed in whole.. Just forgot that there =
are still something remaining :-)

Thanks
- Jiaxun


>=20
> *** BLURB HERE ***
>=20
> Jiaxun Yang (2):
>  hw/mips: Use bl_gen_kernel_jump to generate bootloaders
>  hw/mips/malta: Use bootloader helper to set BAR registers
>=20
> Philippe Mathieu-Daud=C3=A9 (1):
>  hw/mips/bootloader: Allow bl_gen_jump_kernel to optionally set
>    register
>=20
> hw/mips/bootloader.c         |  28 ++++++--
> hw/mips/boston.c             |   5 +-
> hw/mips/fuloong2e.c          |   8 ++-
> hw/mips/malta.c              | 122 ++++++++++++++---------------------
> include/hw/mips/bootloader.h |   8 ++-
> 5 files changed, 86 insertions(+), 85 deletions(-)
>=20
> --=20
> 2.37.3
>=20

---
Jiaxun Yang


