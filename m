Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6197F69F2BA
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 11:30:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUmNn-0000Fe-TV; Wed, 22 Feb 2023 05:29:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pUmNl-0000AE-Tw
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:29:53 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pUmNj-0003l7-Ub
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:29:53 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id DEEA55C0162;
 Wed, 22 Feb 2023 05:29:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 22 Feb 2023 05:29:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1677061788; x=
 1677148188; bh=szsQo1Hi/iilIGq+KwglSomiuO9TOAR8uTOMUkIrs2k=; b=r
 2Q41XiOyTDV/4sgtgzArmSlO8x/7XYITB3os3YC5HN3uk2g7Ds+wNrbndIc2f4es
 7XMK+Mxw+SnkL5HdbPcULjnCkN2wfW4XzcumcxVrS8phfRsp66TTEnJWyADCB/0x
 VksHXNf7HMkwM52VWV/0ErlMBwmYiR1Fr7b4wRfJMRHHGbj1AjgJu59Ayaypn6i5
 nkdCfqXYUY2IxkYr6deanfQMPQYghvJ5Y6Q0Ab00WvfbW9nExS8Pw9Otl1qQbnXG
 D9702UX5oY6b+b4nTiSp7R9Yt/HguK1W8P+UPLSxpP5WDYMtsW/cpDrfj5wWB+Ek
 m7vAspSRZGmKzUbij57pQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677061788; x=
 1677148188; bh=szsQo1Hi/iilIGq+KwglSomiuO9TOAR8uTOMUkIrs2k=; b=D
 3KeFDCL0SrRiHukwwQL50iwobL10RChupwdHj+bkwJGiZqqfmD+Vo5JAedeRn07K
 OJdg85shMgq+tNtKboARbBQzOe/jlUkZ/qRgV7YuNbKhTR/ovG8waNIy4efOqrEM
 Vo51UINnxI7LwIOc9MNSToTihIreYayI17Iun/dh/Z9p83IMhTviLNOgDFEQrzL6
 EO0A85uH70LklDRwvLV6XPzzHaZkKwyMy/PuJ756DLOx7Rx3waHLMZhtrt3Lh/dD
 vuepXsEyTRRP49BJYvdvrgyEM1tE4tn5gnRcIqv3+KuWTfNmoA5wlz2R+BIR8k7l
 M4MZzIsNNiEwfZZl9pT5A==
X-ME-Sender: <xms:nO71Y7rynXUhyQW__zoaTOisKfGRzmKJc7ios-BrtDF8Kc6-6JjRCQ>
 <xme:nO71Y1qRwVN_sR3lSks79Sd7GRFK3lsTpyymrz1RrZxyVye66yxmTbK8O5_ppvF41
 cDwTrUrzBzRTMTyvyc>
X-ME-Received: <xmr:nO71Y4MXWpSv-qQfXx35-KNUO0MoImlGYUGmnjCLC7Wm0PIwvKa6DIis9BXMKUa65YZi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejledgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
 gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
 cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
 ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:nO71Y-4gI6cKB2EQ1BLGIlsFstnATUbUv-9lNTWve-_VTpnhuzcsVw>
 <xmx:nO71Y66dNrUdAwlDz63CKFKxChXzTvJOGABW1scrlum9DK_F6MDoWw>
 <xmx:nO71Y2gTOvtK_rGfmb1go0QZAWdnwewPi3Gm5sTr3cZ6YZdwgXYCSw>
 <xmx:nO71YwQcuAx45SHd7WiZkLFJ2gaySmkEVn3T3-jVeluZDDs1mMDnxQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Feb 2023 05:29:47 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [PATCH 3/3] hw/mips: Add MIPS virt board
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <BC1C4370-DD4F-4777-9F83-6D9FA719F0A1@flygoat.com>
Date: Wed, 22 Feb 2023 10:29:36 +0000
Cc: BALATON Zoltan via <qemu-devel@nongnu.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Content-Transfer-Encoding: quoted-printable
Message-Id: <377EC8F0-B773-41B1-8006-0C8B10F2BE82@flygoat.com>
References: <20230202132138.30945-1-jiaxun.yang@flygoat.com>
 <20230202132138.30945-4-jiaxun.yang@flygoat.com>
 <02b95cdf-fe38-f147-1b9c-5078aaf35adb@linaro.org>
 <BC1C4370-DD4F-4777-9F83-6D9FA719F0A1@flygoat.com>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
Received-SPF: pass client-ip=66.111.4.28; envelope-from=jiaxun.yang@flygoat.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Ping?

> 2023=E5=B9=B42=E6=9C=886=E6=97=A5 01:08=EF=BC=8CJiaxun Yang =
<jiaxun.yang@flygoat.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
>=20
>=20
>> 2023=E5=B9=B42=E6=9C=885=E6=97=A5 11:48=EF=BC=8CPhilippe =
Mathieu-Daud=C3=A9 <philmd@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
>>=20
>> Hi Jiaxun,
>>=20
>> On 2/2/23 14:21, Jiaxun Yang wrote:
>>> MIPS virt board is design to utilize existing VirtIO infrastures
>>> but also comptitable with MIPS's existing internal simulation tools.
>>> It includes virtio-mmio, pcie gpex, flash rom, fw_cfg, goldfish-rtc,
>>> and optional goldfish_pic in case MIPS GIC is not present.
>>=20
>> Is it worth using the CPS/GIC? Can't we using the goldfish PIC
>> regardless CPS availability? Did you run performance comparison?
>=20
> goldfish_pic don=E2=80=99t have IPI infra so we must reinvent another =
SMP mechanism :-(
>=20
> The interrupt performance should be close as the interrupt handling =
flow is almost
> the same.
>=20
> Also it can help us prepare for I6400 vGIC support.
>=20
> Thanks.
> - Jiaxun
>=20
>=20
>>=20
>>> It should be able to cooperate with any MIPS CPU cores.
>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>> ---
>>> v1:
>>> - Rename to virt board
>>> - Convert BIOS flash to ROM
>>> - Cleanups
>>> ---
>>> MAINTAINERS                             |    7 +
>>> configs/devices/mips-softmmu/common.mak |    1 +
>>> docs/system/target-mips.rst             |   24 +
>>> hw/mips/Kconfig                         |   18 +
>>> hw/mips/meson.build                     |    1 +
>>> hw/mips/virt.c                          | 1015 =
+++++++++++++++++++++++
>>> 6 files changed, 1066 insertions(+)
>>> create mode 100644 hw/mips/virt.c
>>=20
>=20
>=20


