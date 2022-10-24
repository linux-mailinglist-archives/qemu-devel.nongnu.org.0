Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F77B60AEEC
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 17:22:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omyZT-00054u-RG; Mon, 24 Oct 2022 10:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1omyZR-00054b-PF
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:36:53 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1omyZL-00087M-Bp
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:36:53 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 99BFF3200942;
 Mon, 24 Oct 2022 10:36:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 24 Oct 2022 10:36:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1666622204; x=
 1666708604; bh=duXm+m/9HkfLCjiKUas/qRAWXPVHS4BKrbHyuqy2v78=; b=N
 YGlmiz1zSljDYfhjnQOH+C0uvwDzrrU4M23Qv6Io4gVSjjv4/O+u+aEnQqe91K/n
 GtVg1gGVZGyqtEvmsikbxSH4y/ruTl6MCTeuJchDOfjAYzPFci/aGkwS8LiH6pBt
 TyKS8AX8ZPZ50VoKUOtRc2LXn2i5dRBOkj43uUFDOAoTFn9qzemcwi/VNZekClhV
 EwUm0sXVYbsTEdvW2Rt/vV234cW3Dx5CSsVkNPUjeiC16CySDHDUMWqh/qZBs+OW
 7ee2mEthQwf9SXxKyVjnXHW77Xx1okx67Utae5TfgK+59zT5V3e81i3PjcGJlOjB
 LjRj93Rd710SZp5r92nUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666622204; x=
 1666708604; bh=duXm+m/9HkfLCjiKUas/qRAWXPVHS4BKrbHyuqy2v78=; b=L
 s3lJfdfnQseVHE7LA3hRG/0blhYFHDAWLPFE8vKeq2gLiUhU6ufyXIZOk28oHKKz
 zeEX3wD9B87L+6y7ChUBHpaEyOW7tKrhig7O2O75m/pjTPC2pHriQKEhwMdi7666
 Xst5/9h2EQnJTws97/xwd1GKIEVbCxrubt7GFbHy/adjTVaIy1ZLgcIiM+LQIcwo
 6nATR15AJtOztj1jHpNCIu26iDLvXxzoqTdq5glD7Gq9cuKC7eRGseqU98Wyudpr
 aSYZzkVuZsPFMtBVoRYttV/2kDHAJdQt7uMqJaq1w9YmU3JpZuzjwOqPg+yuPOc4
 FcF2OC/k7yKEJz+ZamH+A==
X-ME-Sender: <xms:_KJWY9gW6PjFhl00JqrcLt_z0kSyZ6XC6zwjy-v9Z6MaWuZD1Qle1Q>
 <xme:_KJWYyDmbSYjasjH49ACjveaf4W_evU0Wh3bFe0wOi4Zn9h55ZtpcrEbrFxzGnkli
 PuA4n8QTYBTPmi-aNM>
X-ME-Received: <xmr:_KJWY9ETbPYihog_G52oZzERnTbdps0KMWhutoZcUmQhU5OMkVxcKCiUf1SWeo5YKr15>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtgedgjeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpegtggfuhfgjffevgffkfhfvofesth
 hqmhdthhdtjeenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
 nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpedutdejffetteefke
 ejieehfeeuieeguedtveeijeeviefhffelvdfgudeihfdvtdenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
 ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:_KJWYySiYc2gcBfXuHwoNyD2OikTYUvkYTqxaVWkP58RkBRMlldeFw>
 <xmx:_KJWY6wlshdXmADqN3sm5unM4zPbHckfTKcC5NGDMgsYwX6rEUJO1w>
 <xmx:_KJWY44uKYgbGjgHN2s1lghqc0mx-D95hZUqhozTXuU3LS44F8affA>
 <xmx:_KJWYwZ6v7iHQSkBXntop8GnRWDdo5bHjz7pgQ7TTVoP90CQCAHfag>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Oct 2022 10:36:43 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH 0/2] hw/mips/boston: Initrd support
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20221024143507.97477-1-jiaxun.yang@flygoat.com>
Date: Mon, 24 Oct 2022 15:36:32 +0100
Cc: qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <622BA091-9332-4C30-841F-B3534BA26CD9@flygoat.com>
References: <20221024143507.97477-1-jiaxun.yang@flygoat.com>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
X-Mailer: Apple Mail (2.3731.200.110.1.12)
Received-SPF: pass client-ip=64.147.123.19;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout3-smtp.messagingengine.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Please ignore this mail.
Sorry for the noise.


Thanks.

> 2022=E5=B9=B410=E6=9C=8824=E6=97=A5 15:35=EF=BC=8CJiaxun Yang =
<jiaxun.yang@flygoat.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi all,
>=20
> Just a small addition to make boston board easier to use :-)
>=20
> Thanks
> - Jiaxun
>=20
> Jiaxun Yang (2):
>  mips/boston: Support initrd for ELF kernel
>  hw/mips/boston: Pack fdt in fdt filter
>=20
> hw/mips/boston.c | 40 ++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 40 insertions(+)
>=20
> --=20
> 2.32.1 (Apple Git-133)
>=20

---
Jiaxun Yang


