Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8981F53B590
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 10:59:58 +0200 (CEST)
Received: from localhost ([::1]:60218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwggP-0000w3-4l
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 04:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nwgdz-0008ON-C6; Thu, 02 Jun 2022 04:57:27 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nwgdx-0003jQ-Q3; Thu, 02 Jun 2022 04:57:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=szyadflqR7ySDwx7RvkZsu9iQ3ugW9rftJeUlScyEbw=; b=fcIUQSPBj2gVVsBvmegU2Q4aye
 eZdDslFyErs6NJ2gnARAJdQaC+JyYXohB863OIvg4ehc7WfJzdePpNwAYSRL5Fdvt2nHFtOCNtAIF
 Cj+F7Sb5fxTnJ6cjFKtLoyxD2S7/kV2w6SlV2iS1rPbcB2EA+NPO00y7D5LR1AJLlg6pltpHd8efC
 klEvlW2DgW+0ZQSq7qTPm6QotL1pIJK+LZyXeu0KKo9KbbNuitjaDPFyeVV1V9/EbHSb5iJd2XXxl
 ljG7QvCejhY0vAoDwo5GTrLa/U4QBAWcIDFqV0bailcOdmClaIMoxh5O8AWLiwraaNPBzfr5cqrEU
 2OwlD2Taa+SSmkMpJ0wUnTGozSJVjBLyxCnR/y0PNgEoChCDGrAP/Czgp5LR6c6zm39VWtPVaqXPC
 xLJskOJJTowUCH1o4OPCERjRLTiHtE7SYun9cFr1Nx/6E7AnQyiGPmkok6tTtDR4cL9nno4j15VH9
 Ui3SAq5AV7CJPYc7q7KoizfHv4rwQFW2YZgBMWXX5kASPFEGWBmW4JhvrZ/5FtfFIaGwo+v/3TCML
 8U/jPnE63uv75ccGAeEeMFq0hJUSEwxrLlh02shrlYiPc7Ty5mC7omK5c97Dvj1kLz44yli2y8KTI
 20TZxcpbLnSW9vcqZMUHJXUSRz+8Yit2nMCgAxf84=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nwgck-0003UI-15; Thu, 02 Jun 2022 09:56:14 +0100
Message-ID: <7d9715a5-0f46-10cd-2288-ac86c1e12e8a@ilande.co.uk>
Date: Thu, 2 Jun 2022 09:57:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org
References: <20220601125355.1266165-1-matheus.ferst@eldorado.org.br>
 <ffe922c2-f833-cce4-2da4-03fac5fb458c@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <ffe922c2-f833-cce4-2da4-03fac5fb458c@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] target/ppc: fix vbpermd in big endian hosts
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 01/06/2022 15:21, Philippe Mathieu-Daudé via wrote:

> +Mark for commit ef96e3ae96.
> 
> On 1/6/22 14:53, matheus.ferst@eldorado.org.br wrote:
>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>
>> The extract64 arguments are not endian dependent as they are only used
>> for bitwise operations. The current behavior in little-endian hosts is
>> correct; since the indexes in VRB are in PowerISA-ordering, we should
>> always invert the value before calling extract64. Also, using the VsrD
>> macro, we can have a single EXTRACT_BIT definition for big and
>> little-endian with the correct behavior.
>>
>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>> ---
>> Found this bug while refactoring VECTOR_FOR_INORDER_I uses. The
>> complete patch series will also use Vsr[DB] instead of VBPERM[DQ]_INDEX,
>> but it will need more testing. For now, we're just changing what is
>> necessary to fix the instruction.
>> ---
>>   target/ppc/int_helper.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
>> index 105b626d1b..4c5d3f03f8 100644
>> --- a/target/ppc/int_helper.c
>> +++ b/target/ppc/int_helper.c
>> @@ -1307,14 +1307,13 @@ XXGENPCV(XXGENPCVDM, 8)
>>   #define VBPERMQ_INDEX(avr, i) ((avr)->u8[(i)])
>>   #define VBPERMD_INDEX(i) (i)
>>   #define VBPERMQ_DW(index) (((index) & 0x40) != 0)
>> -#define EXTRACT_BIT(avr, i, index) (extract64((avr)->u64[i], index, 1))
>>   #else
>>   #define VBPERMQ_INDEX(avr, i) ((avr)->u8[15 - (i)])
>>   #define VBPERMD_INDEX(i) (1 - i)
>>   #define VBPERMQ_DW(index) (((index) & 0x40) == 0)
>> -#define EXTRACT_BIT(avr, i, index) \
>> -        (extract64((avr)->u64[1 - i], 63 - index, 1))
>>   #endif
>> +#define EXTRACT_BIT(avr, i, index) \
>> +        (extract64((avr)->VsrD(i), 63 - index, 1))
>>   void helper_vbpermd(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
>>   {

I'm not too familiar with vbpermd, however in general the use of the VsrX() macros is 
the right way to ensure things work correctly on both big-endian and little-endian 
hosts, so it looks fine to me.

FWIW with all the great improvements being done in this area, I think that Matheus 
and Daniel have picked things up really quickly and have a much better test setup 
than the G4 Mac Mini I used to do the original gvec work. If I happen to spot 
something on the mailing list then I'll likely reply, but otherwise I'm happy to 
allow things to progress without requiring an explicit Ack from me (these days my 
testing is mostly confined to checking that MacOS 9/X boot okay).


ATB,

Mark.

