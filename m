Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0B8494BC9
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 11:33:06 +0100 (CET)
Received: from localhost ([::1]:42766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAUkb-00087f-MZ
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 05:33:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nAUXB-0006zN-Ga
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 05:19:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nAUX7-0001Jh-08
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 05:19:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642673941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZRsxWwR6rzCgBfK9A6P7HCRLIBnIM9PjrdEwsh8HIgk=;
 b=e+TwI5tvJJ4tFaxCPA+gveravS2P4ktrTkqWvz/mQ83hnUPJV/HEG5eRsmCw5yWz6H0KUi
 ENTCvWeyvv0fJTb7lxejDbEsTrHAB73ADGiu+AYNzgmEG5hEqewS8U3/91IgG/f/c0V10z
 E5d7c4+uhYLO20bw/+R9LiDa+rrk0ZU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-JBu_JDJTNo-2BNFKSvcByQ-1; Thu, 20 Jan 2022 05:19:00 -0500
X-MC-Unique: JBu_JDJTNo-2BNFKSvcByQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 o3-20020a05600c4fc300b0034aee9534bdso2548796wmq.2
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 02:18:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZRsxWwR6rzCgBfK9A6P7HCRLIBnIM9PjrdEwsh8HIgk=;
 b=tskqYsyWcAF9d9O5i7o8T6w1gK+/cT78RyuMgWjA1Gnm7joEcLhm8G4hll5Ezcg748
 nz1x4/k6oA+f2NyHAPvzmIhN/e/QcPHz38qaMAoBuKwuOaRjSuZTPw6uJLCxl4Xe5K5F
 v7XEoQJS7Ry+LHZUhz92UTq1PrXa3a17caJnmh0cxTqFGPg1BKV90FjLBCvNlfuJP+H1
 NYNbl4rXC4l7OnwvL9CA1gPfvghRKXtCZWcJy6FLaqBK6GSRxXszAXeORppkvK4oL1hv
 CeFcH3fkSu1HaaUKOYn4loZVU0Ev2e61KcZ+x4FchZ91TBDn+ISqTKWmnrVhkR1SU5P3
 RoJg==
X-Gm-Message-State: AOAM530rNTy3DIapSVjybpk2TAuMAL7+PR3lwg1JrfN7uKZ0h+YGEY9X
 dleC4xb9mioh2b73Rs1/J17nElOUQmmpQkuP1vEt3gcYd8O9BzqkijcfAIl3MdDsSXrowYO9PjS
 eKHw/Eak3euJB9C8=
X-Received: by 2002:a05:6000:1002:: with SMTP id
 a2mr32023593wrx.157.1642673938920; 
 Thu, 20 Jan 2022 02:18:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmkJDeWzNwNp2lVl6EUVUoN0EuS/knxPxPB1o/XTkN/8Wtrwy5RIy9z/7V3lBo7j3OjTleeQ==
X-Received: by 2002:a05:6000:1002:: with SMTP id
 a2mr32023572wrx.157.1642673938622; 
 Thu, 20 Jan 2022 02:18:58 -0800 (PST)
Received: from ?IPV6:2003:cb:c70e:5800:eeb:dae2:b1c0:f5d1?
 (p200300cbc70e58000eebdae2b1c0f5d1.dip0.t-ipconnect.de.
 [2003:cb:c70e:5800:eeb:dae2:b1c0:f5d1])
 by smtp.gmail.com with ESMTPSA id o13sm2468711wrq.37.2022.01.20.02.18.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 02:18:58 -0800 (PST)
Message-ID: <ccce2dbb-dfa1-f651-9feb-bf0accc9da04@redhat.com>
Date: Thu, 20 Jan 2022 11:18:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] exec/cpu: Make host pages variables / macros 'target
 agnostic'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220120000836.229419-1-f4bug@amsat.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220120000836.229419-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.01.22 01:08, Philippe Mathieu-Daudé wrote:
> "host" pages are related to the *host* not the *target*,
> thus the qemu_host_page_size / qemu_host_page_mask variables
> and the HOST_PAGE_ALIGN() / REAL_HOST_PAGE_ALIGN() macros
> can be moved to "exec/cpu-common.h" which is target agnostic.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/exec/cpu-all.h    | 9 ---------
>  include/exec/cpu-common.h | 9 +++++++++
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index bb37239efa3..84caf5c3d9f 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -234,15 +234,6 @@ extern const TargetPageBits target_page;
>  
>  #define TARGET_PAGE_ALIGN(addr) ROUND_UP((addr), TARGET_PAGE_SIZE)
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
>  /* same as PROT_xxx */
>  #define PAGE_READ      0x0001
>  #define PAGE_WRITE     0x0002
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index 039d422bf4c..de5f444b193 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -7,6 +7,15 @@
>  #include "exec/hwaddr.h"
>  #endif
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
>  /* The CPU list lock nests outside page_(un)lock or mmap_(un)lock */
>  void qemu_init_cpu_list(void);
>  void cpu_list_lock(void);

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


