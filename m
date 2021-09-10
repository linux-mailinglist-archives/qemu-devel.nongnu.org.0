Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98334406C79
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 14:50:42 +0200 (CEST)
Received: from localhost ([::1]:49134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOfzN-0000by-M4
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 08:50:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOfqE-00086h-Nb
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 08:41:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOfqD-00030G-4B
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 08:41:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631277672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9JkwruSYspwJ9bIGEGe2AvtEenoGDxZOAlo838cS2xY=;
 b=XCSATKY+5I0w2nAwBSqIrq2/sy9gtD13aWWM21RwBbA0fjE0ttVpYwAizo6y5fi+OC7Yt0
 T8NEsg4r9bFcaN2K6R+De57khvq6/k9n+QFsBEyapp3NlWVM75rzYuHDXR3B8BFoZCUyTU
 1a/Gfx7JDuiT/WVY8KKWVN1jQIr9mTY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-LXwYw5C8P4ywbRyg2Qquyw-1; Fri, 10 Sep 2021 08:41:11 -0400
X-MC-Unique: LXwYw5C8P4ywbRyg2Qquyw-1
Received: by mail-wm1-f70.google.com with SMTP id
 g18-20020a1c4e12000000b002fa970d2d8dso590891wmh.0
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 05:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9JkwruSYspwJ9bIGEGe2AvtEenoGDxZOAlo838cS2xY=;
 b=t8XuWkZbfFAKZvZWw/63qLHpc4RIetsDySu9RyRr/I8sSGw1QVUR3DrayJn4XiDH8y
 ySDVNOgXt7tID/oIVwRyemBCGTYlhWvrpx/S8q9HgX+kvVCK8cQzUWZGTZBswkw9JpQ3
 O9/Ff2Hhn76IUteTlQJVhYgCmM10ggngyDxu/TENkVEKGZiFd8Amu0PqR7J7VUS4SFP8
 Amn4mRimkVo4N5S+tkbQZYMBLCCiQiOarsaVoqkCV4g6iajGhd+XorIyD+9ZS8ZCvidS
 lIICNoXIqfcxN6HT+Sn0IdOhjE5ZIC21puK/j5zM3tqe4ShK1KQ02ceubBQA6JAWQmch
 g9IA==
X-Gm-Message-State: AOAM530KoaIXSbdg/KTUSdePKeB/CStM1SJiL/dXWKFVk37o/pOdDlNt
 vhQdC23OYgzuQQ1yYiFkx6HZaWcp0x4dM69WPzbYaXBAhIDF820UtykMDyPqJLm0JLoR9zbd6iu
 nekIpkMm0ik/ZnGk=
X-Received: by 2002:a5d:404e:: with SMTP id w14mr9243566wrp.391.1631277670007; 
 Fri, 10 Sep 2021 05:41:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeVqTh2Ep8+PoIKh+yrHd/5HeDCi6rBY+LXCS7eRw85RLwKzHXhSNZO0MBNBhdseJ8+QcEmw==
X-Received: by 2002:a5d:404e:: with SMTP id w14mr9243542wrp.391.1631277669805; 
 Fri, 10 Sep 2021 05:41:09 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id k16sm4550816wrx.87.2021.09.10.05.41.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 05:41:09 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] qmp: Add the qmp_query_sgx_capabilities()
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20210910102258.46648-1-yang.zhong@intel.com>
 <20210910102258.46648-3-yang.zhong@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fc329a6b-117c-2f83-986b-e94312af7dce@redhat.com>
Date: Fri, 10 Sep 2021 14:41:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210910102258.46648-3-yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: pbonzini@redhat.com, eblake@redhat.com, seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/21 12:22 PM, Yang Zhong wrote:
> Libvirt can use qmp_query_sgx_capabilities() to get the host
> sgx capabilities to decide how to allocate SGX EPC size to VM.
> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>  hw/i386/sgx.c              | 66 ++++++++++++++++++++++++++++++++++++++
>  include/hw/i386/sgx.h      |  1 +
>  qapi/misc-target.json      | 18 +++++++++++
>  target/i386/monitor.c      |  5 +++
>  tests/qtest/qmp-cmd-test.c |  1 +
>  5 files changed, 91 insertions(+)
> 
> diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
> index 8a32d62d7e..1be2670c84 100644
> --- a/hw/i386/sgx.c
> +++ b/hw/i386/sgx.c
> @@ -18,6 +18,72 @@
>  #include "qapi/error.h"
>  #include "exec/address-spaces.h"
>  #include "hw/i386/sgx.h"
> +#include "sysemu/hw_accel.h"
> +
> +#define SGX_MAX_EPC_SECTIONS            8
> +#define SGX_CPUID_EPC_INVALID           0x0
> +
> +/* A valid EPC section. */
> +#define SGX_CPUID_EPC_SECTION           0x1
> +#define SGX_CPUID_EPC_MASK              0xF
> +
> +static uint64_t sgx_calc_section_metric(uint64_t low, uint64_t high)
> +{
> +    return (low & MAKE_64BIT_MASK(12, 31 - 12 + 1)) +
> +           ((high & MAKE_64BIT_MASK(0, 19 - 0 + 1)) << 32);

Thanks for using MAKE_64BIT_MASK.

Can we have #definitions instead of these magic values please?

> +}
> +
> +static uint64_t sgx_calc_host_epc_section_size(void)
> +{
> +    uint32_t i, type;
> +    uint32_t eax, ebx, ecx, edx;
> +    uint64_t size = 0;
> +
> +    for (i = 0; i < SGX_MAX_EPC_SECTIONS; i++) {
> +        host_cpuid(0x12, i + 2, &eax, &ebx, &ecx, &edx);
> +
> +        type = eax & SGX_CPUID_EPC_MASK;
> +        if (type == SGX_CPUID_EPC_INVALID) {
> +            break;
> +        }
> +
> +        if (type != SGX_CPUID_EPC_SECTION) {
> +            break;
> +        }
> +
> +        size += sgx_calc_section_metric(ecx, edx);
> +    }
> +
> +    return size;
> +}
> +
> +SGXInfo *sgx_get_capabilities(Error **errp)
> +{
> +    SGXInfo *info = NULL;
> +    uint32_t eax, ebx, ecx, edx;
> +
> +    int fd = qemu_open_old("/dev/sgx_vepc", O_RDWR);
> +    if (fd < 0) {
> +        error_setg(errp, "SGX is not enabled in KVM");
> +        return NULL;
> +    }
> +
> +    info = g_new0(SGXInfo, 1);
> +    host_cpuid(0x7, 0, &eax, &ebx, &ecx, &edx);
> +
> +    info->sgx = ebx & (1U << 2) ? true : false;
> +    info->flc = ecx & (1U << 30) ? true : false;
> +
> +    host_cpuid(0x12, 0, &eax, &ebx, &ecx, &edx);
> +    info->sgx1 = eax & (1U << 0) ? true : false;
> +    info->sgx2 = eax & (1U << 1) ? true : false;
> +
> +    info->section_size = sgx_calc_host_epc_section_size();
> +
> +    close(fd);
> +
> +    return info;
> +}


