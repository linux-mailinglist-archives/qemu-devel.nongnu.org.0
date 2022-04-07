Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3FA4F72B2
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 05:10:31 +0200 (CEST)
Received: from localhost ([::1]:36404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncIXW-0002CW-GS
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 23:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1ncIW2-0001KY-Fi
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 23:08:58 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:51894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1ncIW0-0003Qa-3b
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 23:08:58 -0400
Received: by mail-pj1-x1034.google.com with SMTP id fu5so4367113pjb.1
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 20:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Rb12aTedKXMaL/2srowPpO/6SKAPfWCX0kbKsVCG2ZI=;
 b=1ocCr86dzNuW+y5JEY+mtIMehZbJjrXNqFZcWlNcHYZc0YWfX2ayF9iMZWhksBTmXa
 pTa4Ke5j1v2CLsQib73oTzvhPrKqAVC68vRgC9A0edKgcTJsxy9ds0fUWAtmzcBKwImF
 WlhKNOStNxi9vh516PBDIrth+84G9i4OxiUUQgjROXh+5BxGAUeDtrqUaDBAaVqn64gq
 YXp4p/mTvnxWhU/1H25sQahJpN6CQ/kz01fukwnnxxfRe1Sr440QClKJgvxZeweM7Xav
 lCr0U/rWMyz+IStLv8V9vbdYvJcmSsIvifcVEKKdBoD7ZdKQzppL52mQVdHAcLiluakL
 TCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Rb12aTedKXMaL/2srowPpO/6SKAPfWCX0kbKsVCG2ZI=;
 b=iQ8gES8hW7vVNeIl3ufbqsbGK7TjX2RUBehWQvU1g7/0Tgc3UZBOldYGEFjAo2Bcr5
 zp0bg6WhillfodDl06QW1cx1SwrCR1xWmBsOcPns+enoqGc+od0VgZX1xMYbfdrW1BhH
 9ha1ecynsbS3283cIGJeCc6uQGaAUIYk8Gd/cb4uAzBTcvgYyRIj/yBX4nRDdhzzkKet
 CzBlt7CgRSugI7EtyTfC8k0Sr2Jfmi+t245gLr0mUVjxy+6iSgl21sJXsaTtFG1laYGA
 x4hzQVTIbwqPY8UBtbcnjQ2NB64VyS66JipfXn87s6iEtO54pjhQNwN49Aq+wLrPhjau
 SWEQ==
X-Gm-Message-State: AOAM5329blwuri+dnIOUhRH5mH45JUbEFbIc1qFCysnyWZs1+i4jZ9Ki
 xkxBES9X9JljDNxLbqkA3B3j+A==
X-Google-Smtp-Source: ABdhPJwwrChU8tfeX70FS/29H0kl+mRl9jN+R9jXdCTpBwoRkaRBy4n/AejNqZ77SOKSIxGcKEj2mA==
X-Received: by 2002:a17:903:186:b0:154:3606:7a73 with SMTP id
 z6-20020a170903018600b0015436067a73mr11832172plg.89.1649300933179; 
 Wed, 06 Apr 2022 20:08:53 -0700 (PDT)
Received: from [192.168.10.153] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a056a00248400b004faad8c81bcsm21724878pfv.127.2022.04.06.20.08.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 20:08:52 -0700 (PDT)
Message-ID: <2d756e15-ed5d-84da-1720-a2ba112c6d19@ozlabs.ru>
Date: Thu, 7 Apr 2022 13:08:48 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH qemu] ppc/spapr/ddw: Add 2M pagesize
Content-Language: en-US
To: qemu-ppc@nongnu.org
References: <20220321071945.918669-1-aik@ozlabs.ru>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20220321071945.918669-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=aik@ozlabs.ru; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 21/03/2022 18:19, Alexey Kardashevskiy wrote:
> Recently the LoPAPR spec got a new 2MB pagesize to support in Dynamic DMA
> Windows API (DDW), this adds the new flag.
> 
> Linux supports it since
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=38727311871
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

ping?

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

