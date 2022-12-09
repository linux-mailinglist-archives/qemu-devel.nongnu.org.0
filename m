Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F9B6489D4
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 22:03:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3kVZ-00084P-AB; Fri, 09 Dec 2022 16:02:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1p3kVX-00083a-8Y
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 16:02:11 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1p3kVV-00012U-14
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 16:02:11 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 8BE3132003CE;
 Fri,  9 Dec 2022 16:02:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 09 Dec 2022 16:02:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1670619726; x=
 1670706126; bh=A6q452ORHOvAkvvAQIUMroCKg9NE4LOq5H8fklddmGI=; b=I
 V2N97SDougDf7OAD87kQmPNLgCdHSpdvVswSOwXNT9r8BowxUxlASCsPxjAjB1AY
 5dhOHnzvMwUQ0eF9WZ75J6NY4l5ssGZ84XCdm2ndtcPc6zq2OMTCtL6vwns/pIm9
 Lq36Jf6jg1YqwrukrokfmgJQ6wpEIxejuYmyoWVsonMVNW6K5SelhGtopjeuDHeC
 gHRougyVpKNfXp82CamxvA33oRngxgALIsl+zaOU5YgkP/XcTEs42+r5abykpWk7
 LDtuSxUngH7itkfDPBNIL2iL2AqkOYyN+EV1EPSbC/kiV7P7Ku5nyjFIGxfInWdr
 4mnp9ezUyqCpk9INLdSQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1670619726; x=
 1670706126; bh=A6q452ORHOvAkvvAQIUMroCKg9NE4LOq5H8fklddmGI=; b=F
 I6vpb/RgfaBru1LkOxOBkiCY+ahZkUhovhUTA6pu2XE0h+8v1OjNck/64O84xm6H
 ZPEizk5BKJcYeQrpdasLZjBzmS7pen0WID6/fxElP6z34mZCjsFzoTvbXYgQIQpw
 stfJ3HnWc8TXOiSz9r1Itu+2+UvczuWMP6g6O2h02KfWhAxpFvONGrfNYHE3+nd1
 RITYSMJxwg44ZlBOW3JpwQL1c0+owiAAVWYEwnIPlobKaPBBwja+CNCD3f4Y917L
 hGABTlOZUdB/GKKlu0e/dtg037Aeehbxsru4m/DbIDJWrfIQ2EKaQMkFUXx8vl5d
 f3MS4UA/YJs5rT6oB4xrw==
X-ME-Sender: <xms:TaKTY-Ze6ibXvwCwT1710OSVgsfhsFkL3CB8HPKt7_nA569s8rJOkA>
 <xme:TaKTYxYoC1voqqAjNnRF__zfVFmaU0g36louC8ppWBfQJL6GWGGzX7ujLVHVOZhKp
 89U2sXBHy6qXHa6qFQ>
X-ME-Received: <xmr:TaKTY48tbMlr3HJNRB9xXHuDOsRMH41vOIJJxeZU8Tk_yppsfNIug3Im3FPsVG0Dk6OJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvgddugedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
 gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
 cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
 ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:TaKTYwpMtTqkwOqFY9MTCOtQ9gv5qxLhtJk9rDrcNmYCSvPxOa6PsA>
 <xmx:TaKTY5og_uIV-tk59qjrM0jJ2XUyq-JeD5yPsf6RHJg4ORD8plJfEA>
 <xmx:TaKTY-TZXBLMBcjr887xQUsO4BB9ugFQAzQj2BV800QZmGhJOqpzSQ>
 <xmx:TqKTY6lXA4q9oP7fshuXL_7S9QKVA6w7j2SQB7_IuDnD1G_RjqFPCw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Dec 2022 16:02:04 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: CVMSEG Emulation
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <CAG7Es25r-pY2y+V2GP6Hba4qPos5uN5oeBKQ81gaWctt-jd4Rg@mail.gmail.com>
Date: Fri, 9 Dec 2022 21:01:53 +0000
Cc: BALATON Zoltan via <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <47336F08-8917-43A6-981A-2D2019AD9E1A@flygoat.com>
References: <CAG7Es24cbb24S1k7=XyA+N7uXCghQT6mt_QkJW4zcO7_usbmjw@mail.gmail.com>
 <F0A77EF0-ED2D-43E0-91D7-B4D70B9E575F@flygoat.com>
 <CAG7Es25r-pY2y+V2GP6Hba4qPos5uN5oeBKQ81gaWctt-jd4Rg@mail.gmail.com>
To: Christopher Wrogg <cwrogg@umich.edu>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> 2022=E5=B9=B412=E6=9C=889=E6=97=A5 17:44=EF=BC=8CChristopher Wrogg =
<cwrogg@umich.edu> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> I tried both.
>=20
> Option 1=20
>     What I did:
>         #undef TARGET_VIRT_ADDR_SPACE_BITS and #define =
TARGET_VIRT_ADDR_SPACE_BITS 64
>     The Result:
>         perror reports "Cannot allocate memory"
> Option 2:=20
>     What I did:
>         TARGET_VIRT_ADDR_SPACE_BITS for me is 30 so I masked by =
0x3FFFFFFF
>     The Result:
>         The segfault persists and gdb reports the memory as =
inaccessible.

Hmm this looks wired for me, by no chance TARGET_VIRT_ADDR_SPACE_BITS =
for MIPS
can be 30, on N64 ABI build it should be 48 and 32 for N32 or O32 build.

It is defined in target/mips/cpu-param.h .

Thanks.

>=20
> On Thu, Dec 8, 2022 at 4:55 PM Jiaxun Yang <jiaxun.yang@flygoat.com> =
wrote:
>=20
> Hi,
>=20
> This address range is located in KSEG3=E2=80=A6 Doesn=E2=80=99t seems =
to be a good location
> for userspace program.
>=20
> I think you have two options to make target_mmap work, the first would =
be rising
> TARGET_VIRT_ADDR_SPACE_BITS to 64 bit. That may break some user space
> applications storing pointer tags on higher bits.
>=20
> The second would be mask CVMSEG base with TARGET_VIRT_ADDR_SPACE_BITS
> before mmap, As higher VM address bits will be dropped when addressing =
guest VM,
> that should provide a similar behaviour. Though you=E2=80=99ll have =
multiple alias for CVMSEG in
> memory and application will be able to access CVMSEG with bits higher =
than
> TARGET_VIRT_ADDR_SPACE_BITS set to any value. Don=E2=80=99t know if it =
will break anything,
> AFAIK normal applications won't use this range.
>=20
> Thanks
> - Jiaxun=20
>=20
>=20
> > 2022=E5=B9=B412=E6=9C=888=E6=97=A5 15:08=EF=BC=8CChristopher Wrogg =
<cwrogg@umich.edu> =E5=86=99=E9=81=93=EF=BC=9A
> >=20
> > In userspace emulation how do I make a set of addresses always valid =
and initialized to 0 even though the process does not map it in? In =
particular I want to map the CVMSEG for Cavium qemu-mips64 and =
qemu-mipsn32. The addresses would be 0xFFFFFFFFFFFF8000 - =
0xFFFFFFFFFFFFBFFF. I've looked at target_mmap but it can't handle =
addresses that large. The lack of an emulated mmu for 64 bit guests is =
going to be a problem.
>=20


