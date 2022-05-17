Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F1B52AB60
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 21:00:08 +0200 (CEST)
Received: from localhost ([::1]:49536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr2QJ-0004CX-JK
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 14:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nr2Og-0002oK-RQ; Tue, 17 May 2022 14:58:18 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:46974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nr2Oe-0000mf-W4; Tue, 17 May 2022 14:58:18 -0400
Received: by mail-oi1-x22c.google.com with SMTP id q8so23410637oif.13;
 Tue, 17 May 2022 11:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=d33r3+PAaX2bZ4hBIXHr+WxQTh651/IwQWLqfu7/PXU=;
 b=CXJYjiwfAI1yrQtsPcujRQHHBL0HjBQgD1BWaiJhv1qsbxOSDPW3muC6pc8jsHd1ZG
 15sJm7DRR8RgsoeKTjWbz04FKdB2agjiChf6DbgFu5JmfgRuHhXvPcVVaEg/GjP8avCC
 510ba3hnMfG8DpqVCdwptVPL7MkCSw9Gelq8RJ26RQLce5vqEkAzvM5ocr+BZl5yF27h
 172NUKs6R9UUiNd8wb0rd5yepuv1kOtZh4sSo1rVR4nbD4gRRKcBPLLs6Wu0V8RNZarI
 +EQLQ/5TYQkrwD1zX8aXL+N0hJrJljNooPF2DBFg37GAZih2q4AeVP7YFQYyo7fiOssc
 rzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d33r3+PAaX2bZ4hBIXHr+WxQTh651/IwQWLqfu7/PXU=;
 b=UWnXj6vsr+v6vlJvMNwdKYxcJqN6yGHQotiHhJIPG3xDUNQ8JpZpYF/E3fator5i5W
 3XYsXRAiTWvIQlS4BUuSgKinsHZBNsi5TEtluePkMBM36y0Cd2Jo9mMW5gK496a6W6x1
 TharYNs1PqYBc1gSZXY8ZxhP8LSIC1RlpVUlVU5Hs2MUS4Ih9Ly1V0YIMoO6eiGY0j6o
 baZlS+stbQSAliieGVHpFy0eE4RDB37pkkgpJBPmcBLJybLS88i+QPzvr/YCtFiYaWgd
 Ebdefc/e5T0oiEde65p1Obhf8elBHkZJBHjpF1QpVLwZYdSx29bYsrWEihoPee0/0nj3
 D9jw==
X-Gm-Message-State: AOAM532v4tiTtZQxdLcjvjA92BQcN35idJP+uD+OupucIaKVSv0m7HkN
 jF4hxxr9dmJoHT1P6XNdJFlb6GKYBYA=
X-Google-Smtp-Source: ABdhPJwnsu392oaMdE/mrlXHvdD+Ws98DOwsrERPpIzlB9HnBGvXxdmnPNr8nHWzAz12f0XerQWTMQ==
X-Received: by 2002:a54:478c:0:b0:326:abba:5013 with SMTP id
 o12-20020a54478c000000b00326abba5013mr11526864oic.146.1652813894957; 
 Tue, 17 May 2022 11:58:14 -0700 (PDT)
Received: from [192.168.10.102] ([191.193.151.26])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a4a8144000000b0035eb4e5a6d0sm76162oog.38.2022.05.17.11.58.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 11:58:11 -0700 (PDT)
Message-ID: <a9ac6ca4-d404-485c-f4a7-7712e81864ec@gmail.com>
Date: Tue, 17 May 2022 15:58:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH qemu] spapr: Use address from elf parser for kernel address
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
References: <20220504065536.3534488-1-aik@ozlabs.ru>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220504065536.3534488-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Alexey,

I had to amend your commit due to Gitlab CI complaining about ...

On 5/4/22 03:55, Alexey Kardashevskiy wrote:
> tl;dr: This allows Big Endian zImage booting via -kernel + x-vof=on.
> 
> QEMU loads the kernel at 0x400000 by default which works most of
> the time as Linux kernels are relocatable, 64bit and compiled with "-pie"
> (position independent code). This works for a little endian zImage too.
> 
> However a big endian zImage is compiled without -pie, is 32bit, linked to
> 0x4000000 so current QEMU ends up loading it at
> 0x4400000 but keeps spapr->kernel_addr unchanged so booting fails.
> 
> This uses the kernel address returned from load_elf().
> If the default kernel_addr is used, there is no change in behavior (as
> translate_kernel_address() takes care of this), which is:
> LE/BE vmlinux and LE zImage boot, BE zImage does not.
> If the VM created with "-machine kernel-addr=0,x-vof=on", then QEMU
> prints a warning and BE zImage boots.
> 
> Note #1: SLOF (x-vof=off) still cannot boot a big endian zImage as
> SLOF enables MSR_SF for everything loaded by QEMU and this leads to early
> crash of 32bit zImage.
> 
> Note #2: BE/LE vmlinux images set MSR_SF in early boot so these just work;
> a LE zImage restores MSR_SF after every CI call and we are lucky enough
> not to crash before the first CI call.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
> 
> We could probably change SLOF to always clear MSR_SF before jumping to
> the kernel but this is 1) SLOF fix 2) not quite sure if it brings
> lots of value.
> 
> 
> I really wish I had this when tested this fix:
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220406070038.3704604-1-aik@ozlabs.ru/
> 
> ---
>   hw/ppc/spapr.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index a4372ba1891e..89f18f6564bd 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -2971,14 +2971,16 @@ static void spapr_machine_init(MachineState *machine)
>       }
>   
>       if (kernel_filename) {
> +        uint64_t loaded_addr = 0;
> +
>           spapr->kernel_size = load_elf(kernel_filename, NULL,
>                                         translate_kernel_address, spapr,
> -                                      NULL, NULL, NULL, NULL, 1,
> +                                      NULL, &loaded_addr, NULL, NULL, 1,
>                                         PPC_ELF_MACHINE, 0, 0);
>           if (spapr->kernel_size == ELF_LOAD_WRONG_ENDIAN) {
>               spapr->kernel_size = load_elf(kernel_filename, NULL,
>                                             translate_kernel_address, spapr,
> -                                          NULL, NULL, NULL, NULL, 0,
> +                                          NULL, &loaded_addr, NULL, NULL, 0,
>                                             PPC_ELF_MACHINE, 0, 0);
>               spapr->kernel_le = spapr->kernel_size > 0;
>           }
> @@ -2988,6 +2990,12 @@ static void spapr_machine_init(MachineState *machine)
>               exit(1);
>           }
>   
> +        if (spapr->kernel_addr != loaded_addr) {
> +            warn_report("spapr: kernel_addr changed from 0x%lx to 0x%lx",
> +                        spapr->kernel_addr, loaded_addr);


... this code. This is problematic when compiling in a 32 bit environment because
the definition of long (long) unsigned differs from the usual 64 bit env we use:



../hw/ppc/spapr.c: In function 'spapr_machine_init':
../hw/ppc/spapr.c:2998:25: error: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'uint64_t' {aka 'long long unsigned int'} [-Werror=format=]
  2998 |             warn_report("spapr: kernel_addr changed from 0x%lx to 0x%lx",
       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  2999 |                         spapr->kernel_addr, loaded_addr);
       |                         ~~~~~~~~~~~~~~~~~~
       |                              |
       |                              uint64_t {aka long long unsigned int}
../hw/ppc/spapr.c:2998:25: error: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'uint64_t' {aka 'long long unsigned int'} [-Werror=format=]
  2998 |             warn_report("spapr: kernel_addr changed from 0x%lx to 0x%lx",
       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  2999 |                         spapr->kernel_addr, loaded_addr);
       |                                             ~~~~~~~~~~~
       |                                             |
       |                                             uint64_t {aka long long unsigned int}
cc1: all warnings being treated as errors


I've fixed it by doing the following:


diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 156e799ae9..8d5bdfc20f 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2995,7 +2995,7 @@ static void spapr_machine_init(MachineState *machine)
          }
  
          if (spapr->kernel_addr != loaded_addr) {
-            warn_report("spapr: kernel_addr changed from 0x%lx to 0x%lx",
+            warn_report("spapr: kernel_addr changed from 0x%"PRIx64
+                        " to 0x%"PRIx64,
                          spapr->kernel_addr, loaded_addr);
              spapr->kernel_addr = loaded_addr;
          }



If you're ok with this fixup we can keep it as is. Otherwise feel free to send
another version.


Thanks,


Daniel





> +            spapr->kernel_addr = loaded_addr;
> +        }
> +
>           /* load initrd */
>           if (initrd_filename) {
>               /* Try to locate the initrd in the gap between the kernel

