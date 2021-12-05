Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0E2468BC2
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Dec 2021 16:27:23 +0100 (CET)
Received: from localhost ([::1]:51428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mttQ8-00071E-5V
	for lists+qemu-devel@lfdr.de; Sun, 05 Dec 2021 10:27:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mttOt-0006Fj-7U
 for qemu-devel@nongnu.org; Sun, 05 Dec 2021 10:26:03 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:59665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mttOq-0003Nf-Op
 for qemu-devel@nongnu.org; Sun, 05 Dec 2021 10:26:03 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 898A05C008F;
 Sun,  5 Dec 2021 10:25:58 -0500 (EST)
Received: from imap44 ([10.202.2.94])
 by compute5.internal (MEProxy); Sun, 05 Dec 2021 10:25:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm3; bh=Y++CU
 VDFgBssjHOas6sPy9Uttyt86EcAQnW/hWgxPA4=; b=lM87+VuE+pga7mdSqoKKB
 RcfrM/lbATskG7n/6Bd99d33S7DwHQFX8UoVsiIHeyfY37vwFWg93GPtJ7QNw1+U
 NZyxAbWDbmWLQ0XxIDBm5FDgeIjz3AsNVXdbFMLvJ53lL43wNdE4I5Biq9F7mYyo
 +60U7P7NOd1wrMr3+F21QmA/mLDb2iDE8YiCC5IUT+jN0dFLIJ5hEhaeei9yRJMO
 SRe5Or9sgK7RF85QrARWH5AUcoEiJGwPib9IKX45IjmwvMtdRsHICOOHgfco59Qi
 6sbC0yc3yhB3Qmvo0kQUEdr3jWYrMgshuQYqtvtsBNdschDbw/9NIwITn4i8vnOq
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=Y++CUVDFgBssjHOas6sPy9Uttyt86EcAQnW/hWgxP
 A4=; b=NRNUAYFl3UYFwTTMHtoBieDsPeW8LjsLkFurjt3ikbj0a96kIJ5/kUvPT
 vQwbSMcZyBCKmrvRm0FfV0rU6+KFBqTLlRNDuLRIlqZwmUE9Ejc28+vh8RiOxBEW
 9XnKbii15BoMJogFiWzesW5VXnT9Jqm2ETyyIcpzZBNfJMPuN9iuAr3T73ECXmgE
 JZhOc+in1Frk6OsqMGrAfJ5roOCIrpiWpNCmiFfvnfRvawDD1OFzZdw3d5tyqUKP
 aXOAzYWl/6IKkas7nyxhPlW9tQ1GCKlyXTTYhKUwkVs2Airy6skHZmgujKQvW10o
 90jgx0g1wHoolJSEJYSGmAQUBraCA==
X-ME-Sender: <xms:BtqsYSxW5ev4aCMv1W45sv4gUdfOQyX0lEQKEGv8pH6TtBdpQ_o5FQ>
 <xme:BtqsYeRUl1zjCC3M968-COxjmRem7gYvtWddCIEFqTSOKpQMvC_PlSYMToYtU3fGa
 MQh-LnhP7-B-RVFvpA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrjedugdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgfgsehtqh
 ertderreejnecuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdih
 rghnghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeetgeekveefte
 fhgfduheegvdeuuddvieefvddvlefhfeehkeetfeeukedtfeejnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfh
 hlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:BtqsYUVVRFSCK_4GAJdjHBShrFRiK45U_t7aB5f_lK_sRAxqAN759g>
 <xmx:BtqsYYi4M_zyNMaQPMZ5YQQJE4E7bSCdcSECRHSFguH2uEV6ednTfg>
 <xmx:BtqsYUCGcyNNnrTD7-tRxSMOoxrOPQ-BTPVe9eY5bvfBhkdNwex1aQ>
 <xmx:BtqsYT_A8z3hta6XeJHDe6UDLQmwE9YaXVUJ9dd9_bxfQX6jKUHjEQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3B498FA0AA6; Sun,  5 Dec 2021 10:25:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4458-g51a91c06b2-fm-20211130.004-g51a91c06
Mime-Version: 1.0
Message-Id: <33dac041-a041-4880-82a1-cbdc9035e6da@www.fastmail.com>
In-Reply-To: <cb7f6ba2-60b7-2da4-4248-749c78aec1b4@amsat.org>
References: <20211130211729.7116-1-jiaxun.yang@flygoat.com>
 <20211130211729.7116-2-jiaxun.yang@flygoat.com>
 <f6d41700-94fa-d8bf-bc54-a842f0cd4873@amsat.org>
 <5466a0e1-2fad-464a-bec1-7be8b794d09c@www.fastmail.com>
 <cb7f6ba2-60b7-2da4-4248-749c78aec1b4@amsat.org>
Date: Sun, 05 Dec 2021 15:25:36 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "BALATON Zoltan via" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 1/2] hw/mips: bootloader: Fix write_ulong
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.26; envelope-from=jiaxun.yang@flygoat.com;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



=E5=9C=A82021=E5=B9=B412=E6=9C=882=E6=97=A5=E5=8D=81=E4=BA=8C=E6=9C=88 =E4=
=B8=8B=E5=8D=886:01=EF=BC=8CPhilippe Mathieu-Daud=C3=A9=E5=86=99=E9=81=93=
=EF=BC=9A
> On 12/2/21 11:51, Jiaxun Yang wrote:
>> =E5=9C=A82021=E5=B9=B411=E6=9C=8830=E6=97=A5=E5=8D=81=E4=B8=80=E6=9C=88=
 =E4=B8=8B=E5=8D=889:52=EF=BC=8CPhilippe Mathieu-Daud=C3=A9=E5=86=99=E9=81=
=93=EF=BC=9A
>>> On 11/30/21 22:17, Jiaxun Yang wrote:
>>>> bl_gen_write_ulong uses sd for both 32 and 64 bit CPU,
>>>> while sd is illegal on 32 bit CPUs.
>>>>
>>>> Replace sd with sw on 32bit CPUs.
>>>>
>>>> Fixes: 3ebbf86 ("hw/mips: Add a bootloader helper")
>>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>> ---
>>>> Should be backported to 6.0 onwards.
>>>> ---
>>>>  hw/mips/bootloader.c | 6 +++++-
>>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
>>>> index 6ec8314490..99991f8b2b 100644
>>>> --- a/hw/mips/bootloader.c
>>>> +++ b/hw/mips/bootloader.c
>>>> @@ -182,7 +182,11 @@ void bl_gen_write_ulong(uint32_t **p, target_u=
long addr, target_ulong val)
>>>>  {
>>>>      bl_gen_load_ulong(p, BL_REG_K0, val);
>>>>      bl_gen_load_ulong(p, BL_REG_K1, addr);
>>>> -    bl_gen_sd(p, BL_REG_K0, BL_REG_K1, 0x0);
>>>> +    if (bootcpu_supports_isa(ISA_MIPS3)) {
>>>> +        bl_gen_sd(p, BL_REG_K0, BL_REG_K1, 0x0);
>>>> +    } else {
>>>> +        bl_gen_sw(p, BL_REG_K0, BL_REG_K1, 0x0);
>>>> +    }
>>>
>>> We have bl_gen_load_ulong(); having bl_gen_store_ulong()
>>> would make the API even. Mind sending a patch? Otherwise:
>>=20
>> Should I revisit this set or start another patch?
>
> Another patch :)

Just revisited the code and bl_gen_load_ulong means load a target_ulong
immedaite number, not load from memory so it's not even.

I'd leave it as is.

Thanks.

--=20
- Jiaxun

