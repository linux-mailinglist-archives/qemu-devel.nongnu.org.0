Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C56F9495533
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 21:04:17 +0100 (CET)
Received: from localhost ([::1]:46864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAdfM-0006UL-RL
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 15:04:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nAXU9-0006WT-OH
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 08:28:18 -0500
Received: from [2a00:1450:4864:20::336] (port=51144
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nAXU7-0002WT-PP
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 08:28:17 -0500
Received: by mail-wm1-x336.google.com with SMTP id w26so12206507wmi.0
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 05:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1OLG3eWLTORsWUtSkKjbAECefyllwyMJgw8eASk/6fw=;
 b=ZaaHWAzr7hfc7cITEy4opB9QYVsGjhOp5KehOXPBubQv5AD1TF5g2p/N3NpOiUVCdP
 xMIjOZiKpnNkZxZEpZBJNzBl5NAiQAxBOYn3Vs6y4wOf65N2BJ6Sg7agW0Ax9jEFQ58u
 ctQpjb3UTtMm/GkpQScU7AZMjTo+2Q8Ht90ZAED2UY00n4p6euF3MHFoQq0GX8YM2afx
 qEUsKw4VvT7Kv9QZFuvz4PnS6YAO5n4frIrKyOsQD59N5szZnXDhKPp05MEyg4twVE2Z
 ARnDpWvmHWYiUglo7rg3M6Rzt3XM3xJMCAHMB3bNUrozch7oGNBre/QqBgA8E+bUBbA1
 aJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1OLG3eWLTORsWUtSkKjbAECefyllwyMJgw8eASk/6fw=;
 b=UA6lHyEic6Afyl8rzjOBDHN1M5xx7+y9fxNGfGjye1W4ci6U1K5Y7IC5XHC6DstcQv
 /ZdpwrBOo5mntzFj0UQ6C3ZzuXg2n52amC6DJscc7W4VHnSChgQZalPu2h0G6WBZscIf
 1USqFyVQoqWJS5d9fLk7plAAq7TWB7o6Vt5p9uJad+zztKuJZ9ClDZa3zBEpuAJxEIlL
 Kh7eIJSlE4KDUYD2vhKqy0kKgS7U1sdwcIsuoXtQ+mK0E9BOa7/lxL+FNOwBhF39PL4c
 weH8DLH27sG8rxYRiiFlt4wujIFeRQgP+FXUqR05a528azibcx+q8iNf6ksm9nlVh9tJ
 bosw==
X-Gm-Message-State: AOAM530WYf19fRAqSOZ78PqRw5eMB82uy+yuJwBJ1aQtTj7CYZFDAwGH
 9UN7MFHfzNqnkhYachiCsD0=
X-Google-Smtp-Source: ABdhPJzT3Niu+oy0nIPoL8O5fkDDUOxNZr43GRsYroGK21C4ibWSlxloRNWfczMfYS/KLQt0fJBVnw==
X-Received: by 2002:a05:600c:1986:: with SMTP id
 t6mr8880980wmq.164.1642685293714; 
 Thu, 20 Jan 2022 05:28:13 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id n10sm1596076wrf.96.2022.01.20.05.28.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 05:28:13 -0800 (PST)
Message-ID: <b7540c06-50ba-28f0-db3d-ab2fa067b6d9@redhat.com>
Date: Thu, 20 Jan 2022 14:28:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] exec/cpu: Make host pages variables / macros 'target
 agnostic'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220120000836.229419-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220120000836.229419-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/22 01:08, Philippe Mathieu-Daudé via wrote:
> "host" pages are related to the *host* not the *target*,
> thus the qemu_host_page_size / qemu_host_page_mask variables
> and the HOST_PAGE_ALIGN() / REAL_HOST_PAGE_ALIGN() macros
> can be moved to "exec/cpu-common.h" which is target agnostic.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Queued, thanks.

Paolo

> ---
>   include/exec/cpu-all.h    | 9 ---------
>   include/exec/cpu-common.h | 9 +++++++++
>   2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index bb37239efa3..84caf5c3d9f 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -234,15 +234,6 @@ extern const TargetPageBits target_page;
>   
>   #define TARGET_PAGE_ALIGN(addr) ROUND_UP((addr), TARGET_PAGE_SIZE)
>   
> -/* Using intptr_t ensures that qemu_*_page_mask is sign-extended even
> - * when intptr_t is 32-bit and we are aligning a long long.
> - */
> -extern uintptr_t qemu_host_page_size;
> -extern intptr_t qemu_host_page_mask;
> -
> -#define HOST_PAGE_ALIGN(addr) ROUND_UP((addr), qemu_host_page_size)
> -#define REAL_HOST_PAGE_ALIGN(addr) ROUND_UP((addr), qemu_real_host_page_size)
> -
>   /* same as PROT_xxx */
>   #define PAGE_READ      0x0001
>   #define PAGE_WRITE     0x0002
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index 039d422bf4c..de5f444b193 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -7,6 +7,15 @@
>   #include "exec/hwaddr.h"
>   #endif
>   
> +/* Using intptr_t ensures that qemu_*_page_mask is sign-extended even
> + * when intptr_t is 32-bit and we are aligning a long long.
> + */
> +extern uintptr_t qemu_host_page_size;
> +extern intptr_t qemu_host_page_mask;
> +
> +#define HOST_PAGE_ALIGN(addr) ROUND_UP((addr), qemu_host_page_size)
> +#define REAL_HOST_PAGE_ALIGN(addr) ROUND_UP((addr), qemu_real_host_page_size)
> +
>   /* The CPU list lock nests outside page_(un)lock or mmap_(un)lock */
>   void qemu_init_cpu_list(void);
>   void cpu_list_lock(void);


