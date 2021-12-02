Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0490C4661C6
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 11:53:51 +0100 (CET)
Received: from localhost ([::1]:57596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msjin-00026t-HG
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 05:53:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1msjhT-0001Gl-7E
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 05:52:27 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:49231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1msjhQ-00039h-N5
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 05:52:26 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 5BE1A3201EAD;
 Thu,  2 Dec 2021 05:52:20 -0500 (EST)
Received: from imap44 ([10.202.2.94])
 by compute5.internal (MEProxy); Thu, 02 Dec 2021 05:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm3; bh=flRaU
 xOgqe7iwUi0pLNnkMGdMRxY8SV9LjVBdVMg3yc=; b=Pe+XmSHfa6AnlgGXK/Lha
 XuYrZn4vaTjr1iHGskq0eijpSNRbuyGy732duqnV04Je7bsK5DfaaaquKTqAFG7P
 11us7miKtfrahCWBhPX+ZczR04t1kSus4D+cC7X9HTo7eHB7sm0ckTpFjuNr9zWd
 y3vrJlbN7xKzcXGDtXwJe0NN4EJZHUIEXCN0lXzKFIipWMux2Byupnfjefnhf5l7
 G7EI5tu+5LsjMn3I1YBexU+pRnkv6cWzlRwdnkMHA/gV6X2VDZzEX4gRQqYxSyEl
 27JlvN3hx2kTfSoU6u9rbyK07BuCH8rVJXycYyIrDQqE6ChjPxGxEhdvcDV5rebV
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=flRaUxOgqe7iwUi0pLNnkMGdMRxY8SV9LjVBdVMg3
 yc=; b=EN3kjLBkEbhvF9sKJ+yFWhWG+TOCrfbwz73BNJRga+IbvdyW/dEtrpyHL
 f4aj61rGXolPT0AzPnxxLY10xs9o4INOYpFSAurhjoVX9Lbe//EWGM4xhqOyFj2L
 s1TQ+szuqBZhVT+ZJVOXHDOVmzpi5LMhPxNQkZS6rkDwEEE/H6DbtnzrVx1TcE2l
 SNoJ2kEPBDEMl/qcTfixKqSZjN3RES+AYGIjWbg6msNzSVll+nWnu3sKtTUDY+QP
 +Kak9A2YnFdHjMi6VUQfnP5a1Qu0qQXY/i6TruZwGhWy2Es8FyTvUM4iyzrT/zbM
 fww0HMqVXNDk/puKio5R0JhS6WsTQ==
X-ME-Sender: <xms:Y6WoYTtyE0ozS7nKFTSyE54eIxLluHYKmy4E7eXZt53mqzvBG1S65g>
 <xme:Y6WoYUfBQsNlbbEsTSAnuls8gAm8ngKRP-bfIQOWiddo0zvd4lTkuK2NIQpFCA_LY
 96ASuAuPII40B_oUPM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieehgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgfgsehtqh
 ertderreejnecuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdih
 rghnghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeetgeekveefte
 fhgfduheegvdeuuddvieefvddvlefhfeehkeetfeeukedtfeejnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfh
 hlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:Y6WoYWxt5tPMK02NXs8yhRfkigSf0xA3_wLVkMRdKj9CwpDOhfOn2w>
 <xmx:Y6WoYSML3wsGPWCtKKWtwmtJK4rH3AMHEVPD73prSQMg8stb_EEZvg>
 <xmx:Y6WoYT_0gEzPl-oHmpISVzZ5dc64A8DQozFKXoG3voCASndl7A1Y7A>
 <xmx:Y6WoYQI2rRlVpG7cEjkbXdymN1zjYUktmlc4A_4BtDAOA-0FbTNiAw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 86B2CFA0AA7; Thu,  2 Dec 2021 05:52:19 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4458-g51a91c06b2-fm-20211130.004-g51a91c06
Mime-Version: 1.0
Message-Id: <5466a0e1-2fad-464a-bec1-7be8b794d09c@www.fastmail.com>
In-Reply-To: <f6d41700-94fa-d8bf-bc54-a842f0cd4873@amsat.org>
References: <20211130211729.7116-1-jiaxun.yang@flygoat.com>
 <20211130211729.7116-2-jiaxun.yang@flygoat.com>
 <f6d41700-94fa-d8bf-bc54-a842f0cd4873@amsat.org>
Date: Thu, 02 Dec 2021 10:51:58 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "BALATON Zoltan via" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 1/2] hw/mips: bootloader: Fix write_ulong
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.20;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout4-smtp.messagingengine.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



=E5=9C=A82021=E5=B9=B411=E6=9C=8830=E6=97=A5=E5=8D=81=E4=B8=80=E6=9C=88 =
=E4=B8=8B=E5=8D=889:52=EF=BC=8CPhilippe Mathieu-Daud=C3=A9=E5=86=99=E9=81=
=93=EF=BC=9A
> On 11/30/21 22:17, Jiaxun Yang wrote:
>> bl_gen_write_ulong uses sd for both 32 and 64 bit CPU,
>> while sd is illegal on 32 bit CPUs.
>>=20
>> Replace sd with sw on 32bit CPUs.
>>=20
>> Fixes: 3ebbf86 ("hw/mips: Add a bootloader helper")
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>> Should be backported to 6.0 onwards.
>> ---
>>  hw/mips/bootloader.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
>> index 6ec8314490..99991f8b2b 100644
>> --- a/hw/mips/bootloader.c
>> +++ b/hw/mips/bootloader.c
>> @@ -182,7 +182,11 @@ void bl_gen_write_ulong(uint32_t **p, target_ulo=
ng addr, target_ulong val)
>>  {
>>      bl_gen_load_ulong(p, BL_REG_K0, val);
>>      bl_gen_load_ulong(p, BL_REG_K1, addr);
>> -    bl_gen_sd(p, BL_REG_K0, BL_REG_K1, 0x0);
>> +    if (bootcpu_supports_isa(ISA_MIPS3)) {
>> +        bl_gen_sd(p, BL_REG_K0, BL_REG_K1, 0x0);
>> +    } else {
>> +        bl_gen_sw(p, BL_REG_K0, BL_REG_K1, 0x0);
>> +    }
>
> We have bl_gen_load_ulong(); having bl_gen_store_ulong()
> would make the API even. Mind sending a patch? Otherwise:

Should I revisit this set or start another patch?

Thanks.

>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
>>  }
>> =20
>>  void bl_gen_write_u32(uint32_t **p, target_ulong addr, uint32_t val)
>>

--=20
- Jiaxun

