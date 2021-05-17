Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1859B382380
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 06:29:16 +0200 (CEST)
Received: from localhost ([::1]:57256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liUsV-0007iz-6K
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 00:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1liUrO-0006tV-Vw
 for qemu-devel@nongnu.org; Mon, 17 May 2021 00:28:07 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:43552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1liUrM-0005PA-Do
 for qemu-devel@nongnu.org; Mon, 17 May 2021 00:28:06 -0400
Received: by mail-pg1-x52b.google.com with SMTP id k15so3761801pgb.10
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 21:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ckJ4jTEb5qCq92z/04ULkc7L/wU+ZY884DkvppOT5qc=;
 b=kf0bd2ywDXvw0BTSs+kqQ+MGExJU9KtoYt0yDcEGBa7gh989BPdyzio4vYodqU3L3M
 Dl3rVaNHbP9tieLVwCA5+ai2l5nifNV781WwMnmVPHmCHjdvMmXoJef3Denruqe2kDIk
 fciSRAmamorp9XOrThbhDgus7x5XiSh+zqsV1Lmf+0eAitgJMMGI17q4m5DlEKiEgodS
 OezyqUxTv1WMRP44CGlIUG2MjslQS75NNNZs0Cm02mCdw4MX/f+by4eY9JlktvCA1RaE
 FPnJazcu6Too7V3gry8ezAc7MgEq1jEwsGdveNUTHm1jnu8ZLOvox+CTptl73L9kCter
 lBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ckJ4jTEb5qCq92z/04ULkc7L/wU+ZY884DkvppOT5qc=;
 b=gU42bzbqYC/ctgJ5Z8lKEPSwzvgZLdbUSWKgZaveT+1p1CX8QSFNlS62Uw0baVGH6i
 uax/tZZI8Ss4lAtZsruMmqqnYAwWC71nerQQ4HhQKalSajrSiIYa+kraBS34GFP2Fja5
 SE8TbdE1pyN0xYXTxiMxGOsu0n7RXskvc+mncevZun7FsnAoYIiOOKelqvBQ2CrDq46M
 pozB5lGpP9xzyfqI48vUikhcCONFYM/kOY1iX6/NBfRIPvrqmyOYllMdbdtJlREcPI3g
 v0KvW7hFZvre2ASkugB5aw6UDiUzW5mTpPIUjbQq2VypoMaAmbuCXgyHJmkYfLdt83ES
 BiiQ==
X-Gm-Message-State: AOAM5324oCo3Dl1LBMVlwoJdq80e9ehrXNsrHs8aKAIwwezXGSSlomwt
 Nzc5qKoCVN3L+PCubWkzthAx7w==
X-Google-Smtp-Source: ABdhPJyjXDtpUhFUlQdowokTCY6NbDiLCvM9stesPI0wTw3EahNP66PSOKnMS5HfU+exXKUDTzlr1A==
X-Received: by 2002:a63:6e4d:: with SMTP id j74mr18926418pgc.390.1621225682753; 
 Sun, 16 May 2021 21:28:02 -0700 (PDT)
Received: from localhost (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242])
 by smtp.gmail.com with UTF8SMTPSA id h76sm9302601pfe.161.2021.05.16.21.28.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 May 2021 21:28:02 -0700 (PDT)
Message-ID: <0ab637d9-d54c-add1-ebdc-1c5c1bdcfdf8@ozlabs.ru>
Date: Mon, 17 May 2021 14:27:58 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [PATCH qemu v19] spapr: Implement Open Firmware client interface
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210422125819.1122661-1-aik@ozlabs.ru>
 <c9997a3b-118b-6a23-d3cb-4c3c59dc839d@eik.bme.hu>
 <dbdc9e7-b179-6c5e-61ef-297e72e086b5@eik.bme.hu>
 <64a2bb6f-85f-d029-1846-be4d693f7ab2@eik.bme.hu>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <64a2bb6f-85f-d029-1846-be4d693f7ab2@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=aik@ozlabs.ru; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 5/17/21 09:34, BALATON Zoltan wrote:
> On Sat, 15 May 2021, BALATON Zoltan wrote:
>> On Sat, 15 May 2021, BALATON Zoltan wrote:
>>> On Thu, 22 Apr 2021, Alexey Kardashevskiy wrote:

[snip]

>>>> +/* Defined as Big Endian */
>>>> +struct prom_args {
>>>> +    uint32_t service;
>>>> +    uint32_t nargs;
>>>> +    uint32_t nret;
>>>> +    uint32_t args[10];
>>>> +} QEMU_PACKED;
>>>
>>> This #define and struct definition should probably be moved to 
>>> include/hw/ppc/vof.h as I had to copy these when trying to get VOF 
>>> running with pegasos2 and these seem to be VOF specific not spapr.
>>>
>>> I was trying to wire up VOF on pegasos2 as proof of concept but I did 
>>> not get very far as it crashed at the first move due to using mtmsrd 
>>> which does not exist on the 32 bit CPUs (G4 or G3) used by pegasos2:
>>>
>>> vof_claim virt=0x0 size=0xc38 align=0x0 => 0x0
>>> vof_claim virt=0x0 size=0x8000 align=0x8000 => 0x8000
>>> vof_claim virt=0xc00000 size=0x18fd62 align=0x0 => 0xc00000
>>> vof_claimed 0x0..0xc38 size=0xc38
>>> vof_claimed 0x8000..0x10000 size=0x8000
>>> vof_claimed 0xc00000..0xd8fd62 size=0x18fd62
>>> vof_avail 0xc38..0x8000 size=0x73c8
>>> vof_avail 0x10000..0xc00000 size=0xbf0000
>>> vof_avail 0xd8fd62..0x20000000 size=0x1f27029e
>>> via_superio_cfg: unimplemented register 0xf2
>>> via_superio_cfg: unimplemented register 0xf4
>>> via_superio_cfg: unimplemented register 0xf6
>>> via_superio_cfg: unimplemented register 0xf7
>>> invalid/unsupported opcode: 1f - 12 - 05 - 00 (7fe00164) fff00108 0
>>> ----------------
>>> IN:
>>> 0xfff00100:  3fe00000  lis      r31, 0
>>> 0xfff00104:  63ff0000  ori      r31, r31, 0
>>> 0xfff00108:  7fe00164  mtmsrd   r31
>>>
>>> ----------------
>>> IN:
>>> 0xfff00700:  807e8020  lwz      r3, -0x7fe0(r30)
>>> 0xfff00704:  4cc63182  crclr    6
>>> 0xfff00708:  4bfffd1d  bl       0xfff00424
>>>
>>> Invalid access at addr 0xFFFF8020, size 4, region '(null)', reason: 
>>> rejected
>>>
>>> Is this mtmsrd really needed? Do 64-bit Power CPUs start in 64 bit 
>>> mode? I'd expect them to be in compatibility mode unless 64 bit is 
>>> enabled but I did not check the docs. If it's needed maybe a dummy 
>>> handler has to be at 0x700 to ignore this exception if it's running 
>>> on a 32-bit CPU.
>>>
>>> By the way does vof need to be loaded at addr 0 or it could work at 
>>> the default ROM address as well? That would simplify usage if it 
>>> could run position independent.
>>
>> Just for the sake of experimenting I've patched out the mtmsrd for now 
>> from vof.bin and got a bit further to the point that it's trying to do 
>> hypercalls now but there must be something wrong with decoding the 
>> parameters as I'm getting:
>>
>> IN:
>> 0xfff00590:  393f000c  addi     r9, r31, 0xc
>> 0xfff00594:  7d234b78  mr       r3, r9
>> 0xfff00598:  4bfffbad  bl       0xfff00144
>>
>> ----------------
>> IN:
>> 0xfff00144:  7c641b78  mr       r4, r3
>> 0xfff00148:  3c600000  lis      r3, 0
>> 0xfff0014c:  6063f005  ori      r3, r3, 0xf005
>> 0xfff00150:  44000022  sc       1
>>
>> Raise exception at fff00150 => 00000008 (01)
>> hypercall r3=000000000000f005 r4=000000000000fe7c r5=0000000000000001 
>> r6=0000000000000be8 r7=0000000000000000 r8=000000000000fe78 
>> r9=000000000000fe7c r10=0000000000000001 r11=0000000000000000 
>> r12=0000000000000000 nip=fff00150
>> vof_error_unknown_service "" args=1 rets=1
>>
>> (This is the first hypercall vof does, did not check what this should 
>> be.) I've basically blindly copied spapr_h_vof_client() from 
>> spapr_vof.c but I only vagely understand what it tries to do. Since I 
>> did not have ppc64_phys_to_real() on the 32-bit PPC CPU pegasos2 is 
>> using I've just dropped that and using _args[0] as args_real but maybe 
>> that's wrong and it needs some conversion? For other hypercalls later 
>> I get same result with service being empty while args and rets change. 
>> Any idea what I could be missing or how to debug it?
>>
>> One thing I don't get is how it will find the kernel entry point to 
>> start executing? Does it have to be in the device tree somewhere or it 
>> expects a fixed address? (I could probably find out from the source 
>> but it's easier to ask.)
> 
> OK, I've found that vof.bin needs to be at address 0 then hypercalls 
> work and it tries to query /chosen/qemu.boot-kernel but I get len = -1 
> for some reason. I'm adding the kernel address and size like this:
> 
>     uint64_t cells[2];
> 
>     cells[0] = cpu_to_be64(pm->kernel_addr);
>     cells[1] = cpu_to_be64(pm->kernel_size);
>     qemu_fdt_setprop(fdt, "/chosen", "qemu,boot-kernel",
>                      cells, sizeof(cells));
> 
> which is very much like what spapr does but when vof tries to query it I 
> get:


spapr_vof_reset() also claims the kernel/initrd/VOF memory and allocates 
the stack,  vof_claim() barfs if there are overlaps.


> Raise exception at 00000150 => 00000008 (01)
> hypercall r3=000000000000f005 r4=000000000000fe6c r5=0000000000000001 
> r6=0000000000000005 r7=0000000000000bf0 r8=000000000000fe68 
> r9=000000000000fe6c r10=0000000000000001 r11=000000000000ff60 
> r12=0000000000000000 nip=00000150
> vof_getprop ph=0x5 "qemu,boot-kernel" => len=-1 []
> 
> then it calls exit and the VM stops. Any idea what could be wrong with 
> the above or what to check?

Memory allocation. Another thing I saw was clang/llvm incorrectly 
initializing bss start/end for prom (very early boot) so the prim init 
code in the kernel would memset(0) wrong page and break things. Dunno.




-- 
Alexey

