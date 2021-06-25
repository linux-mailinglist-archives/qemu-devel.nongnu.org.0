Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D94A43B3FCC
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 10:52:22 +0200 (CEST)
Received: from localhost ([::1]:46640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwhZV-00030m-QU
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 04:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwhYX-0001bJ-Rh
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:51:21 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwhYW-0001S6-7f
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:51:21 -0400
Received: by mail-wr1-x434.google.com with SMTP id b3so9714017wrm.6
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 01:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zDqzQMtWvoOJarrTW1fcPQOe/v+CboNNwByzCCeSOzI=;
 b=QvSr5GFtEqLZrMxgA6PDd5i3Y9BO2mURVsuzKUK2KuG9o7Wg4h5v/2S8V2qEkbyVEV
 6okYMB1iZGDD3VpPoh976GFe+XAKjQpGvYLKl2ZMNhed+nBdeB169tRLDKX5nadFNyUx
 JpQR9GvEhwF83JEwxtNW+7za6p8AFhrhCq68vxcZWD7clB2StceO6/4LGuwF9Q5LGHAt
 VxZBZtFQS8LTZ1nM5nm6d9FcgbdirEKS1gM6jkeI7/n3PVhHLdSScUawkB4f8Qak1m8s
 73+cpcGqXb1oaGPFCrJ+ZoeaimRfWgT7ls8LoCBKIcPzreUI1JSyUAscLM/ksQGgi3TD
 Uk+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zDqzQMtWvoOJarrTW1fcPQOe/v+CboNNwByzCCeSOzI=;
 b=tqkEfBUGodHKk2p/C6XfvNWT38EU8NklLgMJZqZe3RVcJCjhbUPXNsaj2g1Yjkdaal
 Z+/cLq+/wW95qOcLN+xu2SAA48+NsGBoiW54Pr04/GIqG+X7EJJWfaotHaWmEMLjoLKu
 NolH8o/f1MEiL2ow5DSzDRj5au1dN8dnD4/aRyfcvdKK5oGUV4okDGqwckmOX04/lm5T
 Uk4KURfj8/XrXh5ierLIpF81lA0Uc+uknn3+6b/7KVym6+qutmPyzS4vHRSHVITxlfUN
 RI+JCJg55LOjgNkSr4CZHmlfjO8heFUdqSDj3Ez4ukVHsMxW20O9ji2jS2+impvROIfm
 E9Ww==
X-Gm-Message-State: AOAM530FtkjvaYUK6ufyPzCrLqGHghd9uIpYNvGk80iqjn1F8BYAGY0C
 +i3c53I2AHq12hYjOJDQvGI=
X-Google-Smtp-Source: ABdhPJwtcQuPuYH8mB1CWhhHttuNfEiIDzBHPD38+S+nn7bDkLMVGBBW7UwI6rIZ8pexizt+dfNxYg==
X-Received: by 2002:adf:fc43:: with SMTP id e3mr9643853wrs.212.1624611078793; 
 Fri, 25 Jun 2021 01:51:18 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z6sm5355152wrl.15.2021.06.25.01.51.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 01:51:18 -0700 (PDT)
Subject: Re: [PATCH v2 10/10] hw/mips/jazz: specify correct endian for dp8393x
 device
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, jasowang@redhat.com, fthain@telegraphics.com.au,
 laurent@vivier.eu
References: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
 <20210625065401.30170-11-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <425f2517-808d-c046-42a4-8ff617a456f3@amsat.org>
Date: Fri, 25 Jun 2021 10:51:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625065401.30170-11-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/25/21 8:54 AM, Mark Cave-Ayland wrote:
> The MIPS magnum machines are available in both big endian (mips64) and little
> endian (mips64el) configurations. Ensure that the dp893x big_endian property
> is set accordingly using logic similar to that used for the MIPS malta
> machines.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/mips/jazz.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
> index 89ca8bb910..ee1789183e 100644
> --- a/hw/mips/jazz.c
> +++ b/hw/mips/jazz.c
> @@ -126,7 +126,7 @@ static void mips_jazz_init(MachineState *machine,
>  {
>      MemoryRegion *address_space = get_system_memory();
>      char *filename;
> -    int bios_size, n;
> +    int bios_size, n, big_endian;

Why not use a boolean directly?

>      Clock *cpuclk;
>      MIPSCPU *cpu;
>      MIPSCPUClass *mcc;
> @@ -158,6 +158,12 @@ static void mips_jazz_init(MachineState *machine,
>          [JAZZ_PICA61] = {33333333, 4},
>      };
>  
> +#ifdef TARGET_WORDS_BIGENDIAN
> +    big_endian = 1;
> +#else
> +    big_endian = 0;
> +#endif
> +
>      if (machine->ram_size > 256 * MiB) {
>          error_report("RAM size more than 256Mb is not supported");
>          exit(EXIT_FAILURE);
> @@ -290,6 +296,7 @@ static void mips_jazz_init(MachineState *machine,
>              dev = qdev_new("dp8393x");
>              qdev_set_nic_properties(dev, nd);
>              qdev_prop_set_uint8(dev, "it_shift", 2);
> +            qdev_prop_set_bit(dev, "big_endian", big_endian > 0);
>              object_property_set_link(OBJECT(dev), "dma_mr",
>                                       OBJECT(rc4030_dma_mr), &error_abort);
>              sysbus = SYS_BUS_DEVICE(dev);
> 

