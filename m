Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5B73870CC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 06:53:40 +0200 (CEST)
Received: from localhost ([::1]:54830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lirjf-0004Hf-I0
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 00:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1liri0-0003GK-Td
 for qemu-devel@nongnu.org; Tue, 18 May 2021 00:51:56 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:46611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lirhy-0004L7-5c
 for qemu-devel@nongnu.org; Tue, 18 May 2021 00:51:56 -0400
Received: by mail-pg1-x532.google.com with SMTP id m124so6131038pgm.13
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 21:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hGxMKnU1SGabfpF0oweJjZ37kJSJwCRID40NfciK0P0=;
 b=Qfhe6gorDwH4xTynNBzd4gddMTWZWhjpD650afkrRatvne4o5KxQsrsfWCpjbQZzpQ
 VPQpabwA37xKwFnP6S5EnCyacoOyYQztEUVCLNbbDJS1hh6KS1zMc5Co8hkokSfT1iLk
 50K6rHtMgdw0Y1GRLAMg94DZpZMvlAip+UEE/I7D1+B5Ytpys+rlSxbMPN7InJNoRhKr
 om3rrvtk/HiKea1UYoRtBEJ8vYDtHsoFDR/gspJKv+Ps18IhGZUH5/ZF0hf7ebYzpl95
 YOkBdQFzCiG6HV0QxTCCDZAPPi3nkMHHvxcyEwiZIY5pT2EXclP9aQzaLmHFtubmpZKa
 I7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hGxMKnU1SGabfpF0oweJjZ37kJSJwCRID40NfciK0P0=;
 b=T2Ym5EbXbJqGYzD4TiaFhJfGXTpap7osC1yS+8yb5IevOxlFnC2IxBO6Tn9MqQSHqh
 I4an3Xj9Zx4PmopPLQp2taVsWqIze2RWBVLF9y0DnCp4XRj9Gd1XuU396Bn82xKcwExQ
 nHfEaNby4X+wY8ZicV/G++ia2PvmdbpaJ0hBqXk9gloBSg04lG4T8KyK8Pu9EuE7NxhP
 8PrWzhJJPaX3eat6X2glrdL984oa5j/Q2l8w9Aa5L9eaVk0p7z17m9iAa/HNzCwOZ23v
 RkJ3ruZr0Wq7I42fcxRZwaU7c329fcMhjQtVqsQ7rhV9E9lO3YA6oGIHwnN+ISp6eP8P
 Xr/Q==
X-Gm-Message-State: AOAM531VD/MGJYUBvl2dPqGMXmUKKT7TTUdE3P6YdbMnOOLPHV6ADAgq
 IGCG9IZ8wqeThZjjmYoPJmBejA==
X-Google-Smtp-Source: ABdhPJyBhrwZ/XoefXPYhQgZkxsYHLUZCduVU1Sm5ADSQ4Y2aC9bsQzEQMG6eSU1VJv03MoMl2sK5w==
X-Received: by 2002:a65:6a07:: with SMTP id m7mr3122133pgu.136.1621313511145; 
 Mon, 17 May 2021 21:51:51 -0700 (PDT)
Received: from [192.168.10.23]
 (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
 by smtp.gmail.com with UTF8SMTPSA id s48sm2595058pfw.205.2021.05.17.21.51.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 21:51:50 -0700 (PDT)
Message-ID: <68d33123-db33-9bda-6174-e22ae1e6bf66@ozlabs.ru>
Date: Tue, 18 May 2021 14:51:45 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:89.0) Gecko/20100101
 Thunderbird/89.0
Subject: Re: [PATCH qemu v19] spapr: Implement Open Firmware client interface
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210422125819.1122661-1-aik@ozlabs.ru>
 <c9997a3b-118b-6a23-d3cb-4c3c59dc839d@eik.bme.hu>
 <8e1bae8e-9b8e-0895-5747-9e7cd7d70def@ozlabs.ru>
 <381924b9-29fd-67a0-e311-72c8718f853@eik.bme.hu>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <381924b9-29fd-67a0-e311-72c8718f853@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=aik@ozlabs.ru; helo=mail-pg1-x532.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 17/05/2021 22:17, BALATON Zoltan wrote:
> On Mon, 17 May 2021, Alexey Kardashevskiy wrote:
>> On 5/16/21 01:04, BALATON Zoltan wrote:
>>> On Thu, 22 Apr 2021, Alexey Kardashevskiy wrote:
>>
>> [snip]
>>
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
>>
>> Correct, I'll fix it - there are 2 copies already.
>>
>>
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
>>> Is this mtmsrd really needed? Do 64-bit Power CPUs start in 64 bit mode?
>>
>> Yup:
>> https://git.qemu.org/?p=qemu.git;a=blob;f=target/ppc/translate_init.c.inc;h=66e6a4a746f46148e0006081af09391b32c125cd;hb=HEAD#l10085 
>>
>>
>> I cannot find the exact reason for that, probably PAPR or some PPC-OF 
>> binding says so.
>>
>>
>>> I'd expect them to be in compatibility mode unless 64 bit is enabled 
>>> but I did not check the docs. If it's needed maybe a dummy handler 
>>> has to be at 0x700 to ignore this exception if it's running on a 
>>> 32-bit CPU.
>>
>> I wanted MSR and the code to be in sync explicitly.
> 
> OK, then can you add a dummy exception handler at 0x700 to ignore this 
> so it would also work on a 32-bit CPU? That does not seem to be too 
> difficult.
> 
>>> By the way does vof need to be loaded at addr 0 or it could work at 
>>> the default ROM address as well? That would simplify usage if it 
>>> could run position independent.
>>
>> What do you call the default ROM address? SLOF loads at 0 and starts 
>> at 0x100, VOF does the same.
> 
> On pegasos2 the ROM is at 0xfff00000 normally and that's where it starts 
> executing at offset 0x100. If I load vof.bin there it starts but 
> hypercalls fail as above. I've changed it to load vof at 0 then it works 
> a bit better and after adding the property to /chosen it tries to query 
> it but fails there for some reason.
> 
>> Making it run position independend is going to make it more complex 
>> and I really (really) want it to be tiny.
> 
> It's not needed as I can special case it and load vof at 0 but is it 
> more complex than just compiling it with the appropriate flag for PIC 
> (-fPIC or what is it).
> 
>> I think what you really want is another vof-pegasos2.bin linked at the 
>> address you like and not calling mtmsrd, could be an #ifdef in the 
>> existing vof firmware. It is rather expected to have a firmware per a 
>> machine type.
> 
> Is that really needed? Can we make a single firmware binary run on 
> different CPUs? I think openbios-ppc runs on both 64 and 32 bit PPC 
> while itself compiled as 32 bit but also runs with qemu-system-ppc64 -M 
> mac99 which uses a G5 CPU by default. It does some magic here:
> 
> https://github.com/openbios/openbios/blob/master/arch/ppc/qemu/start.S
> 
> but that may be too ugly to copy.



> Another thing that I'm not sure about is that on 32 bit OpenFirmware 
> cells are normally also 32 bit but VOF expects them to be 64 bit so I 

Not sure I follow. The FDT values are raw values of a length specific to 
the property. QEMU puts 2 64bit values in qemu,boot-kernel, VOF reads 
exactly this.


> had to change the mem reg and chosen qemu,boot-kernel properties that 
> VOF queries to use uint64_t and not sure that would be a problem. For 
> now I'm just trying to get some guest code to run and try to use the VOF 
> CI to see if it would work. If guests expect mem reg to be 32 bit then 
> we may need a separate version for that.


Ah. Right. vof_dt_memory_available() assumes it is 64bit and ignores 
#address-cells and #size-cells from the FDT's "/", I need to fix that.



-- 
Alexey

