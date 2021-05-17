Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 252A1382352
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 06:17:20 +0200 (CEST)
Received: from localhost ([::1]:54332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liUgx-0005Ee-7z
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 00:17:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1liUft-00044z-JG
 for qemu-devel@nongnu.org; Mon, 17 May 2021 00:16:14 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:35740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1liUfo-0005dN-DL
 for qemu-devel@nongnu.org; Mon, 17 May 2021 00:16:13 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 pf4-20020a17090b1d84b029015ccffe0f2eso4809534pjb.0
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 21:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SSKZ6Cci27W1DXLlxGXOKUzq73YauJ2E2SHW6NfTbnE=;
 b=m/5KUf6vEuQvC5rqYR53INZShJXy8tx2IYbEw3r21qjzTHgZH6cXheYJmSRodIpqIX
 GXPhnorARpPX6whhwiRulcweW/McJRaCt438nhZhIwrERlirBRAwaODdq9DyvKAGj8Vu
 ePwjBF3jWFFabxMZMkAqqiPBvh/vnIPb40rPFLT7uRBVQemj1ZpXT9CcAe0sr9Aw9DqK
 4fSLHRrh5+AS6lWnQEdMK1skr7jOFbXxe90yVQg5LwK74NcZ2dJ0P/MWcnAHxIvu16nI
 WlG4c/0BTERuNyHs+JxF9Lj0XWavByj6zCjtgOmD9B052awAcxughnVJTK+MVztrj5zZ
 tDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SSKZ6Cci27W1DXLlxGXOKUzq73YauJ2E2SHW6NfTbnE=;
 b=Ox+8VR9amXcrWmTGp+MkB5/y+uYD+kXiF1niMWQIOK4zgVvMj392PJfbMlPLTSn+Ka
 rsgw8xiW5oBKFBM5VMIL808C5yZs0WDEBWpXOcz77r7FYc2qrEty9zRO2XZKWvhwEaC8
 Uw/eIcrlLtObIjuDR6waDHd6vm59iiz78JQ4kLPiHTxwvJ7NNqcmofHmRGSGxxbznX8B
 91Idh7bv0nuAKsRAyB6VibEAO8C0FnnIzgY5PsLzZwrTWsE7dmscYGl5I0qMKLsPVGjk
 QWkTqfEa/8CTIfUng7Bn/8b3ho9c/H3WT9O6Y4KegYc9RcnyjYjIYJADcgD2qW1qwvpI
 Migw==
X-Gm-Message-State: AOAM532NwIffAZhF8aC/nvhRf+/VrQvU33IdcTp0p50WCpNgHU2GqZ1a
 15IWTkEwZ16LNyzTzeszNy2I0Q==
X-Google-Smtp-Source: ABdhPJyaHktXa1asPfPYInPHTsbPaC31yFpx25x+o2TPTu6tWOnFZ0kbfhZqc+VXByEv7+Bo+cLBBQ==
X-Received: by 2002:a17:902:f211:b029:f0:c53a:65e2 with SMTP id
 m17-20020a170902f211b02900f0c53a65e2mr8631652plc.80.1621224962039; 
 Sun, 16 May 2021 21:16:02 -0700 (PDT)
Received: from localhost (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242])
 by smtp.gmail.com with UTF8SMTPSA id c13sm8306390pfl.212.2021.05.16.21.15.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 May 2021 21:16:01 -0700 (PDT)
Message-ID: <8e1bae8e-9b8e-0895-5747-9e7cd7d70def@ozlabs.ru>
Date: Mon, 17 May 2021 14:15:57 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [PATCH qemu v19] spapr: Implement Open Firmware client interface
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210422125819.1122661-1-aik@ozlabs.ru>
 <c9997a3b-118b-6a23-d3cb-4c3c59dc839d@eik.bme.hu>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <c9997a3b-118b-6a23-d3cb-4c3c59dc839d@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=aik@ozlabs.ru; helo=mail-pj1-x1034.google.com
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
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 5/16/21 01:04, BALATON Zoltan wrote:
> On Thu, 22 Apr 2021, Alexey Kardashevskiy wrote:

[snip]

>> +/* Defined as Big Endian */
>> +struct prom_args {
>> +    uint32_t service;
>> +    uint32_t nargs;
>> +    uint32_t nret;
>> +    uint32_t args[10];
>> +} QEMU_PACKED;
> 
> This #define and struct definition should probably be moved to 
> include/hw/ppc/vof.h as I had to copy these when trying to get VOF 
> running with pegasos2 and these seem to be VOF specific not spapr.

Correct, I'll fix it - there are 2 copies already.


> 
> I was trying to wire up VOF on pegasos2 as proof of concept but I did 
> not get very far as it crashed at the first move due to using mtmsrd 
> which does not exist on the 32 bit CPUs (G4 or G3) used by pegasos2:
> 
> vof_claim virt=0x0 size=0xc38 align=0x0 => 0x0
> vof_claim virt=0x0 size=0x8000 align=0x8000 => 0x8000
> vof_claim virt=0xc00000 size=0x18fd62 align=0x0 => 0xc00000
> vof_claimed 0x0..0xc38 size=0xc38
> vof_claimed 0x8000..0x10000 size=0x8000
> vof_claimed 0xc00000..0xd8fd62 size=0x18fd62
> vof_avail 0xc38..0x8000 size=0x73c8
> vof_avail 0x10000..0xc00000 size=0xbf0000
> vof_avail 0xd8fd62..0x20000000 size=0x1f27029e
> via_superio_cfg: unimplemented register 0xf2
> via_superio_cfg: unimplemented register 0xf4
> via_superio_cfg: unimplemented register 0xf6
> via_superio_cfg: unimplemented register 0xf7
> invalid/unsupported opcode: 1f - 12 - 05 - 00 (7fe00164) fff00108 0
> ----------------
> IN:
> 0xfff00100:  3fe00000  lis      r31, 0
> 0xfff00104:  63ff0000  ori      r31, r31, 0
> 0xfff00108:  7fe00164  mtmsrd   r31
> 
> ----------------
> IN:
> 0xfff00700:  807e8020  lwz      r3, -0x7fe0(r30)
> 0xfff00704:  4cc63182  crclr    6
> 0xfff00708:  4bfffd1d  bl       0xfff00424
> 
> Invalid access at addr 0xFFFF8020, size 4, region '(null)', reason: 
> rejected
> 
> Is this mtmsrd really needed? Do 64-bit Power CPUs start in 64 bit mode?

Yup:
https://git.qemu.org/?p=qemu.git;a=blob;f=target/ppc/translate_init.c.inc;h=66e6a4a746f46148e0006081af09391b32c125cd;hb=HEAD#l10085

I cannot find the exact reason for that, probably PAPR or some PPC-OF 
binding says so.


> I'd expect them to be in compatibility mode unless 64 bit is enabled but 
> I did not check the docs. If it's needed maybe a dummy handler has to be 
> at 0x700 to ignore this exception if it's running on a 32-bit CPU.

I wanted MSR and the code to be in sync explicitly.

> By the way does vof need to be loaded at addr 0 or it could work at the 
> default ROM address as well? That would simplify usage if it could run 
> position independent.

What do you call the default ROM address? SLOF loads at 0 and starts at 
0x100, VOF does the same.

Making it run position independend is going to make it more complex and 
I really (really) want it to be tiny.

I think what you really want is another vof-pegasos2.bin linked at the 
address you like and not calling mtmsrd, could be an #ifdef in the 
existing vof firmware. It is rather expected to have a firmware per a 
machine type.


-- 
Alexey

