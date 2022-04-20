Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB79509085
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:33:47 +0200 (CEST)
Received: from localhost ([::1]:46522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhG5C-0003Z3-C1
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:33:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhFif-0006iL-Rd; Wed, 20 Apr 2022 15:10:33 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:38818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhFid-0002HG-Rj; Wed, 20 Apr 2022 15:10:29 -0400
Received: by mail-oi1-x236.google.com with SMTP id r8so3150905oib.5;
 Wed, 20 Apr 2022 12:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=y7mNme8fshH2622cAXefdm98NMHwLVVnxsOkjOSLb/s=;
 b=pQQeQqd75E08iBEwELdPwY8CQix8Si+SQYWhqDFTZNM0q9jjcvRJERSkW+6g+MNFf7
 jN5+KdaqPj1728BzBhYtkjlZJSwByXA84bw/Gwy9VlAUzJT/5MOscx3QTQXys0qFEWA5
 FaztTPnsd6V1tMYrNuX37s4g/tWqtOrzrP8g0uZ46DGVqfxeP3TE6KRia/DA4kyEz6HM
 cOKO/Rf59g71ThxIDpXfCBjfAjcU0MkfxNXOjl0mR2fGObPEAZd7XFQxXji+DH+CdQel
 AceLPB6KFgdU728a+rI71m/5ja633eTHWkzd9LpvqMdw/7wPKYXXBCxrFEoaUTkVbw8X
 svGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=y7mNme8fshH2622cAXefdm98NMHwLVVnxsOkjOSLb/s=;
 b=vgQa/MpBz/aVagZpRElpoKUP7EBxqoPZbNblzgr/tX2AKFH0TsTvQWYVNyhjOgntRE
 dkp+QPsHScqwFVRvDGp2FrVdJoluKPT87VQ/c1OKldRU4oIXg2nhx8JBys/UGzIBWtAv
 xP0g+q3yIUopbqycvoWf52ldjwJjZ8SYLWiHPBznh2IahQELBuePqhwPaTklz0wfoIGQ
 Jum05J9RR0u1dNfjxXeBsBsxpbj19JcStIRU4NDOXNJTp4maBR5jx54IRp8xpNdNLMb0
 aC1UIHmOu+VXRjo2Fmb8ZS8EVDXFNOPP2NyyRcI8ces33EYq5qTos5vMoFna2QCJL0gL
 mfMA==
X-Gm-Message-State: AOAM532DBoUlK23d8LW3H+RAjABJvzyV0ohCY/UZsRAQmmC9hn1UZAmk
 c1acWh5LGx9Pp4UucF3I5QJ20Qr8z9o=
X-Google-Smtp-Source: ABdhPJyWSL4Y2HRcWuixR2qdM7M5Bpp6E6SuWa0Qb0sSsSEtVwkJyF1nsfwIP5A2GYgEKW1DVn+49w==
X-Received: by 2002:a05:6808:3010:b0:2f7:3e71:88b2 with SMTP id
 ay16-20020a056808301000b002f73e7188b2mr2493537oib.102.1650481826510; 
 Wed, 20 Apr 2022 12:10:26 -0700 (PDT)
Received: from [192.168.10.222] ([179.225.252.195])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a4a3147000000b00338c6fbb67asm6279658oog.1.2022.04.20.12.10.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 12:10:25 -0700 (PDT)
Message-ID: <6c88a6e2-9597-e808-4c81-b25e0033e722@gmail.com>
Date: Wed, 20 Apr 2022 16:10:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH qemu] ppc/spapr/ddw: Add 2M pagesize
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org
References: <20220321071945.918669-1-aik@ozlabs.ru>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220321071945.918669-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel


On 3/21/22 04:19, Alexey Kardashevskiy wrote:
> Recently the LoPAPR spec got a new 2MB pagesize to support in Dynamic DMA
> Windows API (DDW), this adds the new flag.
> 
> Linux supports it since
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=38727311871
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
> PHYP added support for it in development builds as well.
> ---
>   include/hw/ppc/spapr.h  | 1 +
>   hw/ppc/spapr_rtas_ddw.c | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index f5c33dcc8616..14b01c3f5963 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -745,6 +745,7 @@ void push_sregs_to_kvm_pr(SpaprMachineState *spapr);
>   #define RTAS_DDW_PGSIZE_128M     0x20
>   #define RTAS_DDW_PGSIZE_256M     0x40
>   #define RTAS_DDW_PGSIZE_16G      0x80
> +#define RTAS_DDW_PGSIZE_2M       0x100
>   
>   /* RTAS tokens */
>   #define RTAS_TOKEN_BASE      0x2000
> diff --git a/hw/ppc/spapr_rtas_ddw.c b/hw/ppc/spapr_rtas_ddw.c
> index 3e826e1308c4..13d339c807c1 100644
> --- a/hw/ppc/spapr_rtas_ddw.c
> +++ b/hw/ppc/spapr_rtas_ddw.c
> @@ -72,6 +72,7 @@ static uint32_t spapr_page_mask_to_query_mask(uint64_t page_mask)
>       const struct { int shift; uint32_t mask; } masks[] = {
>           { 12, RTAS_DDW_PGSIZE_4K },
>           { 16, RTAS_DDW_PGSIZE_64K },
> +        { 21, RTAS_DDW_PGSIZE_2M },
>           { 24, RTAS_DDW_PGSIZE_16M },
>           { 25, RTAS_DDW_PGSIZE_32M },
>           { 26, RTAS_DDW_PGSIZE_64M },

