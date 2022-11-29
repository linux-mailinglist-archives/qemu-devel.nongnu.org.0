Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E4463C4C7
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 17:11:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p03Bi-0002Mm-Sk; Tue, 29 Nov 2022 11:10:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1p03Bd-0002MH-55; Tue, 29 Nov 2022 11:10:21 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1p03Ba-000847-Kn; Tue, 29 Nov 2022 11:10:20 -0500
Received: by mail-pl1-x62b.google.com with SMTP id w23so13848035ply.12;
 Tue, 29 Nov 2022 08:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
 bh=pvamvq8PTQrfBFyKTvfAvSxdfaZhADl6M+V3Mb/pIzg=;
 b=KyBD3Y8rdsrIBbc17VKKS4Uk8yNnfz3T1fL8/SHpC0mAcHnR+b+m8OQc0BvswYBrdX
 eiS0czUX2LlbPflbS7syUcG+Dmx7huyINQUso2VGkn3ajueb5Vw5Bp69qBWiM6ejcP/x
 df3ndCXROeNvOF0CmvRNSKOhE5/r+OWxGEqwQNzLFQwnNnJ/YxO1WFEJMgeGjPZ93sFS
 j3JiWn/q4gImQ2UMFhCb1FEedqcM3VpYdzliez8xoDWs/UbtsoOSVNsTLO2C14pjlOSs
 wFZbNXnCa6UtUODBd9/L44ynqgwvif1zMbTWvPtgqeIMp68MWGoF694PBWzUb52Kk3As
 Vskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pvamvq8PTQrfBFyKTvfAvSxdfaZhADl6M+V3Mb/pIzg=;
 b=KT14e7IqeIHQt/9Dvmvp06raQ2ophdu3VjOcxnukQUBHoOBzWwL/rOHCJjHDPEkD4h
 8WReXPm87sbtYV74gMF3x1i/2n1TkGPCgksvDhdWX95glZi/EWadQ3k9Qxd3HAJucRZ8
 ZjWhKkzb+YnoD7+LZzIDQwEyLsOD809bLGIOa80rgWaN0sXy0jxfK9zHHmYhbZAj/nNa
 Vo9tqMfO/TvPLOBGn0XiIX4BZrHd3H2c9vfYLHnPViTYJxLKC9xun4pWyzPDQfwB1xzI
 aIiDwf/P7HmEIGUySi6qMpBmNjuJdk8GRb83212OGcpeP+xg2XHC7CFnFzJspyfcVxZM
 +WwQ==
X-Gm-Message-State: ANoB5pmJ7hmdCV0v9DzfGBo8/6T9FnSmhNb9TLebd/Y+Q0Dw+XUJOM40
 5BOOCEIbM6GkbHD+h70wPKjkFQmSqJUZaw==
X-Google-Smtp-Source: AA0mqf442BuOpJUS3U6augqYi2juqLlnoMPnpbChZHR5yDlNbFNT1tn8f/UKKEXK6n4JKkl55Y6n3g==
X-Received: by 2002:a17:902:8212:b0:187:2430:d37d with SMTP id
 x18-20020a170902821200b001872430d37dmr50190808pln.28.1669738214779; 
 Tue, 29 Nov 2022 08:10:14 -0800 (PST)
Received: from MBP (ec2-18-117-95-84.us-east-2.compute.amazonaws.com.
 [18.117.95.84]) by smtp.gmail.com with ESMTPSA id
 19-20020a621913000000b005748029bab8sm10085695pfz.156.2022.11.29.08.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 08:10:14 -0800 (PST)
References: <20221129104809.84860-1-schspa@gmail.com>
 <CAFEAcA-nznyaoxw-Ok1mY7sxFRXE0=JKtLH4unrYDK3Bv4w_9w@mail.gmail.com>
User-agent: mu4e 1.8.10; emacs 28.2
From: Schspa Shi <schspa@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/1] hw/arm/boot: set initrd with
 #[address/size]-cells type in fdt
Date: Wed, 30 Nov 2022 00:07:56 +0800
In-reply-to: <CAFEAcA-nznyaoxw-Ok1mY7sxFRXE0=JKtLH4unrYDK3Bv4w_9w@mail.gmail.com>
Message-ID: <m2fse1vj1d.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=schspa@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 29 Nov 2022 at 10:48, Schspa Shi <schspa@gmail.com> wrote:
>>
>> We use 32bit value for linux,initrd-[start/end], when we have
>> loader_start > 4GB, there will be a wrong initrd_start passed
>> to the kernel, and the kernel will report the following warning.
>>
>> [    0.000000] ------------[ cut here ]------------
>> [    0.000000] initrd not fully accessible via the linear mapping -- please check your bootloader ...
>> [    0.000000] WARNING: CPU: 0 PID: 0 at arch/arm64/mm/init.c:355 arm64_memblock_init+0x158/0x244
>> [    0.000000] Modules linked in:
>> [    0.000000] CPU: 0 PID: 0 Comm: swapper Tainted: G        W          6.1.0-rc3-13250-g30a0b95b1335-dirty #28
>> [    0.000000] Hardware name: Horizon Sigi Virtual development board (DT)
>> [    0.000000] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [    0.000000] pc : arm64_memblock_init+0x158/0x244
>> [    0.000000] lr : arm64_memblock_init+0x158/0x244
>> [    0.000000] sp : ffff800009273df0
>> [    0.000000] x29: ffff800009273df0 x28: 0000001000cc0010 x27: 0000800000000000
>> [    0.000000] x26: 000000000050a3e2 x25: ffff800008b46000 x24: ffff800008b46000
>> [    0.000000] x23: ffff800008a53000 x22: ffff800009420000 x21: ffff800008a53000
>> [    0.000000] x20: 0000000004000000 x19: 0000000004000000 x18: 00000000ffff1020
>> [    0.000000] x17: 6568632065736165 x16: 6c70202d2d20676e x15: 697070616d207261
>> [    0.000000] x14: 656e696c20656874 x13: 0a2e2e2e20726564 x12: 0000000000000000
>> [    0.000000] x11: 0000000000000000 x10: 00000000ffffffff x9 : 0000000000000000
>> [    0.000000] x8 : 0000000000000000 x7 : 796c6c756620746f x6 : 6e20647274696e69
>> [    0.000000] x5 : ffff8000093c7c47 x4 : ffff800008a2102f x3 : ffff800009273a88
>> [    0.000000] x2 : 80000000fffff038 x1 : 00000000000000c0 x0 : 0000000000000056
>> [    0.000000] Call trace:
>> [    0.000000]  arm64_memblock_init+0x158/0x244
>> [    0.000000]  setup_arch+0x164/0x1cc
>> [    0.000000]  start_kernel+0x94/0x4ac
>> [    0.000000]  __primary_switched+0xb4/0xbc
>> [    0.000000] ---[ end trace 0000000000000000 ]---
>> [    0.000000] Zone ranges:
>> [    0.000000]   DMA      [mem 0x0000001000000000-0x0000001007ffffff]
>>
>> To fix it, we can change it to #[address/size]-cells type.
>>
>> Signed-off-by: Schspa Shi <schspa@gmail.com>
>>
>> --
>>
>> Changelog:
>> v1 -> v2:
>>         - Use #[address/size]-cells for data type.
>> ---
>>  hw/arm/boot.c | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index 57efb61ee419..98cd1fdad2c6 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -638,15 +638,17 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>      }
>>
>>      if (binfo->initrd_size) {
>> -        rc = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start",
>> -                                   binfo->initrd_start);
>> +        rc = qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,initrd-start",
>> +                                     acells, binfo->initrd_start);
>
> Indentation here doesn't look quite right.
>

My mistake, and fixed in the v3 patch.

>>          if (rc < 0) {
>>              fprintf(stderr, "couldn't set /chosen/linux,initrd-start\n");
>>              goto fail;
>>          }
>>
>> -        rc = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
>> -                                   binfo->initrd_start + binfo->initrd_size);
>> +        rc = qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,initrd-end",
>> +                                          scells,
>> +                                          binfo->initrd_start +
>> +                                          binfo->initrd_size);
>
> This should use 'acells', not 'scells', because it's an address,
> not a size.
>

It fixed in the v3 patch too.

> thanks
> -- PMM

-- 
BRs
Schspa Shi

