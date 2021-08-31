Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27DE3FC5DC
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 13:25:21 +0200 (CEST)
Received: from localhost ([::1]:35878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL1tI-0005Su-8x
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 07:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1mL1rt-0004Xu-85; Tue, 31 Aug 2021 07:23:53 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:36499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1mL1rr-0002gF-Bw; Tue, 31 Aug 2021 07:23:53 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id C78235C0051;
 Tue, 31 Aug 2021 07:23:48 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Tue, 31 Aug 2021 07:23:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=L2Vtm
 5Z4vGJidVeg/2jOJv5NFZBJrz6FMsbuGAp6lxM=; b=T/7ZEtogHDJVj4AoGddW7
 N6zcbL2w6LusdlKyDh7bBkXMDLdF5y6L4A3l/a3EUq66FvNEnwM+O3xQ6oanY+Sr
 xkZxYC7kYEv3fH3nzCot5e3t/h1vhPzKHbEtIuwOXkfaTXwjNU1EOGyWQQwZk7KN
 TKiKRnnm6U6CXyb5QTlTouG7NTI78ZUL18nUcxYykt6QcHPIO/wpm1/ANjmreUo2
 avq5wgt/jzYThwDecy7Lg/f6UD1OdclEe05e6n8QkwxXVVlJgupGytUIzs3bhjYW
 stmtN1vlKTuWdFiNaprekdg9+hyFf1SVWMZYUaeRqsMSVtXtOdbWXeGyRkCQ922y
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=L2Vtm5Z4vGJidVeg/2jOJv5NFZBJrz6FMsbuGAp6l
 xM=; b=TncLntfJ3m4kOl8ESf5nhkcn5mn8gpU9DRPMCLtXmW5oEGKhh7lExBJ7u
 My1BAkaVuFXEkTl888fuWItnPM5Itk+Sa3pQqak4KD1aqaiQICFA/k/n8wD9XymX
 3BKlMW5wxZ/mA9i+812Q7moorT2N5eeTTnQjTs5I0TGM7OV/PTWy14Rm26/QMalP
 g/oexIy1JsRSxKgVOg8ZkwUHdmVKixcuY/JLFyMblXPhduv9SqacJFbfaTBobQGQ
 1sEYqLNg5wDmKII9UL0E8pnA4g/+z5n7no2eULaTly0urQD4IKkLITEYPOJ2IE1f
 yoIYSC/0vLVl4/4uYPAUQ/qWYDgWQ==
X-ME-Sender: <xms:QxEuYaRd1HBd4M_etK2GjQJShScLPziLJBStvQnwORbRA45mM4VqCQ>
 <xme:QxEuYfxSs6ltQ7zo4E1LVjueDsV_xKrpO1AxFio0Y12HARLo39NvdEL5jsgjhiG1d
 VxuHAdvjWV6Qh5kmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvuddgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpefhgfekhfdugefhjeduhfdtgfeutdefheejveetffegudduteejieej
 hfehfffgfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgr
 uh
X-ME-Proxy: <xmx:QxEuYX0VmV3VjgxdVAXusvsrkZwcXpk1ZxGDsnUb3N1RNOIR-a_5yA>
 <xmx:QxEuYWDgm92db1qDpFqN7aXfKq7nPxCDvIKcbkhvMROpUupQ1yznjA>
 <xmx:QxEuYTiNuLvK36WN2tGAYs2tX7Ion2w5cYmwnO5794YYOPnlhTUvDA>
 <xmx:RBEuYWsJY8DPmqIEucwoL7FmTeisnkjhTN0xMiPgCJ14dndnIeA2hw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B0E5DAC0362; Tue, 31 Aug 2021 07:23:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1124-g8f1c7cb9de-fm-20210824.001-g8f1c7cb9
Mime-Version: 1.0
Message-Id: <d3d43c7a-1f37-4489-a07b-bf561e4e36a1@www.fastmail.com>
In-Reply-To: <547b5f32-0858-1882-fb8b-c60056cdbfd4@kaod.org>
References: <20210827210417.4022054-1-pdel@fb.com>
 <20210827210417.4022054-3-pdel@fb.com>
 <7a53d5e9-52c2-a06b-1385-fd71a96d7486@kaod.org>
 <BYAPR15MB3032BA6C3556797AC2A3461CACC99@BYAPR15MB3032.namprd15.prod.outlook.com>
 <547b5f32-0858-1882-fb8b-c60056cdbfd4@kaod.org>
Date: Tue, 31 Aug 2021 20:53:10 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Peter Delevoryas" <pdel@fb.com>
Subject: Re: [PATCH 2/5] hw/arm/aspeed: Select console UART from machine
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.28; envelope-from=andrew@aj.id.au;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Cameron Esfahani via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi C=C3=A9dric, Peter,

On Tue, 31 Aug 2021, at 20:09, C=C3=A9dric Le Goater wrote:
> On 8/28/21 5:58 PM, Peter Delevoryas wrote:
> > I think I=E2=80=99m a little confused on this part. What I meant by =
=E2=80=9Cmost machines just use UART5=E2=80=9D was that most DTS=E2=80=99=
s use =E2=80=9Cstdout-path=3D&uart5=E2=80=9D, but fuji uses =E2=80=9Cstd=
out-path=3D&uart1=E2=80=9D. I /do/ see that SCU510 includes a bit relate=
d to UART, but it=E2=80=99s for disabling booting from UART1 and UART5. =
I just care about the console aspect, not booting.
>=20
> The UART can be switched with SCU70[29] on the AST2500, btw.

If it helps, neither the AST2600's "Boot from UART" feature nor the=20
AST2[456]00's "Debug UART" feature are related to which UART is used as=20
the BMC console by u-boot and/or the kernel - the latter is entirely a=20
software thing.

The "Debug UART" is a hardware backdoor, a UART-to-AHB bridge=20
implemented by the SoC. It provides a shell environment that allows you=20
to issue transactions directly on the AHB if you perform a magic knock.=20
I have a driver for it implemented here:

https://github.com/amboar/cve-2019-6260/blob/master/src/debug.c

SCU70[29] on the AST2500 selects whether this backdoor is exposed on=20
UART1 or UART5.

The "Boot from UART" feature is implemented in the AST2600 ROM code as=20
a fallback for loading the SPL if fetching it from SPI-NOR or the eMMC=20
fails, or the SPL is incorrectly signed for secure-boot.

I think Peter is on the right track with this patch?

Andrew

