Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C74F652551B
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 20:47:15 +0200 (CEST)
Received: from localhost ([::1]:60176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npDqE-0008SI-Pv
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 14:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1npCut-0002d3-BI; Thu, 12 May 2022 13:48:07 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:36389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1npCur-0000Ar-B6; Thu, 12 May 2022 13:47:58 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 31-20020a9d0822000000b00605f1807664so3226292oty.3; 
 Thu, 12 May 2022 10:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vgJ3MAF8NyWTE6+2JNR7ZHfAvy29qB7eQe22pd03L5w=;
 b=jVKdX/BWnVH6YX6lRJow6QU49dgk12JZrV0T3zlT/pibDznPnih9Rtb9q4xzBZaB5D
 Ud+V6sGIXXCBloXGm7e2WtULd7IFxkGvdrQ0by0GuIaaj94KV0D0P9TimjNC3y0yb0bB
 6OrtbRSrpikdkYlptZvUBJL4H4+yLiSopvZvgo/nUKVqv7xPrRl7UsWbEkomNrFPnbod
 hZEp1Dgr0j0xpD/woPBDQordQaslBTyIFm0fITiC3KOwFZr0TvdO5dJ4xGo3/TsKq8h0
 qFMZMRuc6V4JfnMHtIdMDmpIjdPGC0AuAODcz1dCT6OPReqm15iHowItQqgyXJ2h2wix
 pD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vgJ3MAF8NyWTE6+2JNR7ZHfAvy29qB7eQe22pd03L5w=;
 b=6iWGbhBVYmEaQOQVKKYekbi5/v/SCv+k/tYckfDeYqzdKUi0mDWsjKaGqcpd3wB3vC
 v9cHt7gXZaN0Fpf1uEiZIVJ0AX38F2zLf4+g6Y118rItVFclCOZZrTMP8+lmDoB4DSYC
 3HHXhbc07wyc0GYBNDuwxwHV7lxY41RQsZn/q3KrlUl/zQn6sKADh41SQHQr2/IEVMlM
 yCf64+DJ74y1qOUNDWSMJQbErxVE7GBqI5wbMCn5TSXzdOaLwShj6XZTcXELma4vGJQh
 77mMazGFMYRsbapWnVnu11uNird9pXjEu6+TwRpF7+4iSL5tl+Inhifc6zLsrtEDhbo/
 gnKQ==
X-Gm-Message-State: AOAM533NwMPg8/4wMMs77QoGrM/WVvFc08LssOIOnUcTGumzebYAz39J
 k8FoMJWZrhS0MymqNYFzze8N43Ngh/w=
X-Google-Smtp-Source: ABdhPJyZ1Dfty80cJZ72hwpeh/g7vZTniP4xuVq3mmYCC3+GIduhESVo/gzjbI1uj7F+Co2UJ0zaNA==
X-Received: by 2002:a9d:7d89:0:b0:606:b193:6ca0 with SMTP id
 j9-20020a9d7d89000000b00606b1936ca0mr454584otn.101.1652377675613; 
 Thu, 12 May 2022 10:47:55 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:6d99:130b:198b:b4b2:dcf0?
 ([2804:431:c7c7:6d99:130b:198b:b4b2:dcf0])
 by smtp.gmail.com with ESMTPSA id
 y22-20020a4a6256000000b0035eb4e5a6cfsm88483oog.37.2022.05.12.10.47.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 10:47:55 -0700 (PDT)
Message-ID: <746f0415-b095-2831-fa7f-785c0c531423@gmail.com>
Date: Thu, 12 May 2022 14:47:52 -0300
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x331.google.com
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

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel


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
> +            spapr->kernel_addr = loaded_addr;
> +        }
> +
>           /* load initrd */
>           if (initrd_filename) {
>               /* Try to locate the initrd in the gap between the kernel

