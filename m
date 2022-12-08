Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DD4647856
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 22:56:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3OrM-0001qt-Ia; Thu, 08 Dec 2022 16:55:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1p3OrE-0001qc-Vi
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 16:55:09 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1p3OrC-0008IQ-Ae
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 16:55:07 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 43D945C0103;
 Thu,  8 Dec 2022 16:55:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 08 Dec 2022 16:55:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1670536504; x=
 1670622904; bh=IAFL+t2HG9mOYMr+E8i9NY0bZTdwHW7CJRINM8Zx14Q=; b=D
 S4MdwWWY3N9F/8NHBOa/PYHsq6cg/dCXg+SXhFyXjLiytGwcee5aCQI6O1exOTlu
 8KAcLHhxn0mUUZc0NHyrrLDbdBs53jP1CVVrlueJuf3TRkzBIY0rC7pYpQiM4L7k
 BdFHc2RlBqEic/ObilBG6vNSPNaZwcVmBwNSXnyS5n2dJtoeqxrxuvcHLc2YBLrA
 R9jJASxa2usMjkeUZOvqMAl+21YyeDnoFiMLmfKBZsQc7Ru7SuwdlmHKAgaBB5M/
 9a3XAYSjPixqxO3OuyZYKBXrGqPHj0FZTHNOFE0MP2SkVhhx9GVgkQ2tBzgZEuL8
 FJj7D+VFfRnU7i+UpX96Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1670536504; x=
 1670622904; bh=IAFL+t2HG9mOYMr+E8i9NY0bZTdwHW7CJRINM8Zx14Q=; b=M
 RxLZ3P6gwujDxZgvitXDzVgyl9NF5dsKsJmbghrmATVxkP+nazTJWUPpfAKM9N73
 wwVq+kIFpWFh7ZgPFTanTk9MZm1u0DmcYoIsVct4TxqcSo9aTfeSh6ORG2kra6za
 +UVFtJwLrBINA1+SgA5qQrQ6FW3YMlLJNTrc3u8rwqNDpmXYBuq+JiP0tQ/mUeYb
 bG8Y+DH5hPbzFOpvCSXH8EPxTHPBgghZPFFdIqqdVuc1K3fm6kR7w5JqejW13Qe0
 U6W/vbITzTZvU9GYcOzu5A2KL8rCv5hyHUIePEL1+32tC+KYCcVHWSJ9cW0GBuas
 hHhr6Zz8eZoNSoZxLjORQ==
X-ME-Sender: <xms:N12SY2AWgoBGjc1R1b3c4mF6Uy5JSMXuZ4vp4kB5Cur1YMsnOrybSA>
 <xme:N12SYwjj879EVF0EvpV0aj6IEY7lBUUJqSbhuQWZpSM5vfQwZUjfVkivpgtP4RyL6
 -OxRv_8i0_q-xHEba8>
X-ME-Received: <xmr:N12SY5kykQtPwFis8iiNq3Hf9DC5OKmK1RNheV9_afuxgikOeld3haeL5B3EY3g8iQlx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtgdduheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
 gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
 cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
 ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:N12SY0xtN_jzMMjm2fpicLdNvd1x5b_nR8W5Hf1h6xIRvShReg-QFw>
 <xmx:N12SY7SVH2J-aWMdIuVi1-7isNg273OTq6AtmkwkZzZJdxcUKyQBSA>
 <xmx:N12SY_YRycIECllHLO9UmgISRqeK574w248PNWTH2DWfK7h-EDehVQ>
 <xmx:OF2SY5NuYZFDcFFTgI8CnA3B3PTki_Ih1_i1Ytdc_ShZxKdNJE21yw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Dec 2022 16:55:03 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: CVMSEG Emulation
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <CAG7Es24cbb24S1k7=XyA+N7uXCghQT6mt_QkJW4zcO7_usbmjw@mail.gmail.com>
Date: Thu, 8 Dec 2022 21:54:51 +0000
Cc: BALATON Zoltan via <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F0A77EF0-ED2D-43E0-91D7-B4D70B9E575F@flygoat.com>
References: <CAG7Es24cbb24S1k7=XyA+N7uXCghQT6mt_QkJW4zcO7_usbmjw@mail.gmail.com>
To: Christopher Wrogg <cwrogg@umich.edu>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Hi,

This address range is located in KSEG3=E2=80=A6 Doesn=E2=80=99t seems to =
be a good location
for userspace program.

I think you have two options to make target_mmap work, the first would =
be rising
TARGET_VIRT_ADDR_SPACE_BITS to 64 bit. That may break some user space
applications storing pointer tags on higher bits.

The second would be mask CVMSEG base with TARGET_VIRT_ADDR_SPACE_BITS
before mmap, As higher VM address bits will be dropped when addressing =
guest VM,
that should provide a similar behaviour. Though you=E2=80=99ll have =
multiple alias for CVMSEG in
memory and application will be able to access CVMSEG with bits higher =
than
TARGET_VIRT_ADDR_SPACE_BITS set to any value. Don=E2=80=99t know if it =
will break anything,
AFAIK normal applications won't use this range.

Thanks
- Jiaxun=20


> 2022=E5=B9=B412=E6=9C=888=E6=97=A5 15:08=EF=BC=8CChristopher Wrogg =
<cwrogg@umich.edu> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> In userspace emulation how do I make a set of addresses always valid =
and initialized to 0 even though the process does not map it in? In =
particular I want to map the CVMSEG for Cavium qemu-mips64 and =
qemu-mipsn32. The addresses would be 0xFFFFFFFFFFFF8000 - =
0xFFFFFFFFFFFFBFFF. I've looked at target_mmap but it can't handle =
addresses that large. The lack of an emulated mmu for 64 bit guests is =
going to be a problem.


