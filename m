Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA4B68B3A3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 02:10:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOq0D-00086E-1k; Sun, 05 Feb 2023 20:09:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pOq0B-00085v-8Q
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 20:08:59 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pOq09-0007jH-Ki
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 20:08:59 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id D651F5C013E;
 Sun,  5 Feb 2023 20:08:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 05 Feb 2023 20:08:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1675645735; x=
 1675732135; bh=TLiwYAbG6WF1xb1iZ+DG1liPHGd/G4F4LT16UUbKemc=; b=i
 Qrjp8cF7IOEVK7JQPHv6jHxVRABax/Z3usj4Atj27Rvho1NlRBb/TvHzwf+e/n13
 Y/pNdT9qn2WGpV/g5VcaphZKpD9wvuhQkZGpz1BdvvyuaTxA98OzFbZeK/+ciWE2
 cQEoK6kguvmDPVAVDzDqKvE+/4kP6CgljJ0rDR/q038xQKnCJbu0TJs78l5CV4ci
 BF2UDiGH1BJq7Afs96CTBbg+4Kgwh8iu+236+87eMiXXgucjL2/YGxQfAOMaK+af
 B3Ra94o5K9Qxws3ww7M/3chN4jFywSiMUBg81eUnHtBlgQmd5oEQx/wxpn2e3lbS
 0Rbel9xYz8/Bdb5MNCYnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1675645735; x=
 1675732135; bh=TLiwYAbG6WF1xb1iZ+DG1liPHGd/G4F4LT16UUbKemc=; b=q
 q9KBjKr3l+B+TSO4BSMLKaD5ZBf36sacqlVJBEggz1armasslWnezhNILB46UoxH
 +X9HUxVENzHYGn9YUK2dShtAhjojWboMktTrIdmCPbqMcapSAbANrRima6fJYs+y
 2JHVYTM0eCB008g0safSKSOjfbp5KMs9mZ/i7uvJWV2OTYCNn6aqSEaQ9O3mB4SP
 ZZE+xHkRdz4GXGUly4pAmOeavLkjoFsIWtn46MCFb/ODj8nOuD7YyI8ILZP7ND1f
 GCYytii3mgUnmT9ElrMn5vPCc2Kk2dppy6RUZ1bpRNBJdz34i9CbYOUSmqst0vBZ
 8Mz8dSKv/rIbTTBAXrTFw==
X-ME-Sender: <xms:J1PgYwwSbmlOB4bpI9NEFvDPXXJWTzWykSsvK7lsMy2Va_eF54MHAQ>
 <xme:J1PgY0STGhvhG9FGrlRxB7h-1nLODSLZ3uX_xK1o0bi2EOsxNhvan10DO5y2B0YGC
 0ZF_xhDss_h5iieedA>
X-ME-Received: <xmr:J1PgYyUksBzZcXRjnzrXTeu__aDaHJ8TlHfqM5R_FPW68WMAfHFxbxykQJ1KSBx1bUwN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeghedgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
 gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
 cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
 ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:J1PgY-gNeCTPi2CXuzj1bnmttS8EgmQzW-WNb-SIMQ-SxUgayMCuHg>
 <xmx:J1PgYyAgwKFM81xAc7myFl3shijlACE_khuRSnEDWSHcVoSUmosZdw>
 <xmx:J1PgY_IJEVq69EYFQmGqaZegEL7eKUxV9c10fwRqWYIrBFTPzWGDSQ>
 <xmx:J1PgYz7u-3kegZY12GmaiJRqRvDvLYWOUzrzrzxCc9VpwEU8u7_pfg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 5 Feb 2023 20:08:54 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Re: [PATCH 3/3] hw/mips: Add MIPS virt board
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <02b95cdf-fe38-f147-1b9c-5078aaf35adb@linaro.org>
Date: Mon, 6 Feb 2023 01:08:43 +0000
Cc: BALATON Zoltan via <qemu-devel@nongnu.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BC1C4370-DD4F-4777-9F83-6D9FA719F0A1@flygoat.com>
References: <20230202132138.30945-1-jiaxun.yang@flygoat.com>
 <20230202132138.30945-4-jiaxun.yang@flygoat.com>
 <02b95cdf-fe38-f147-1b9c-5078aaf35adb@linaro.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: Apple Mail (2.3731.300.101.1.3)
Received-SPF: pass client-ip=66.111.4.27; envelope-from=jiaxun.yang@flygoat.com;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> 2023=E5=B9=B42=E6=9C=885=E6=97=A5 11:48=EF=BC=8CPhilippe =
Mathieu-Daud=C3=A9 <philmd@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi Jiaxun,
>=20
> On 2/2/23 14:21, Jiaxun Yang wrote:
>> MIPS virt board is design to utilize existing VirtIO infrastures
>> but also comptitable with MIPS's existing internal simulation tools.
>> It includes virtio-mmio, pcie gpex, flash rom, fw_cfg, goldfish-rtc,
>> and optional goldfish_pic in case MIPS GIC is not present.
>=20
> Is it worth using the CPS/GIC? Can't we using the goldfish PIC
> regardless CPS availability? Did you run performance comparison?

goldfish_pic don=E2=80=99t have IPI infra so we must reinvent another =
SMP mechanism :-(

The interrupt performance should be close as the interrupt handling flow =
is almost
the same.

Also it can help us prepare for I6400 vGIC support.

Thanks.
- Jiaxun


>=20
>> It should be able to cooperate with any MIPS CPU cores.
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>> v1:
>>  - Rename to virt board
>>  - Convert BIOS flash to ROM
>>  - Cleanups
>> ---
>>  MAINTAINERS                             |    7 +
>>  configs/devices/mips-softmmu/common.mak |    1 +
>>  docs/system/target-mips.rst             |   24 +
>>  hw/mips/Kconfig                         |   18 +
>>  hw/mips/meson.build                     |    1 +
>>  hw/mips/virt.c                          | 1015 =
+++++++++++++++++++++++
>>  6 files changed, 1066 insertions(+)
>>  create mode 100644 hw/mips/virt.c
>=20


