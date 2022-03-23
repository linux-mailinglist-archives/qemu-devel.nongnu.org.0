Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3A54E58CF
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 19:59:28 +0100 (CET)
Received: from localhost ([::1]:35854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX6Cd-0003E6-5K
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 14:59:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX6AG-00022i-1r
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:57:00 -0400
Received: from [2607:f8b0:4864:20::833] (port=46057
 helo=mail-qt1-x833.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX6AB-0006n3-KX
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:56:57 -0400
Received: by mail-qt1-x833.google.com with SMTP id a11so1972909qtb.12
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 11:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5eVbw0nx8xg2wrymdgy7rIBO9Z2Z1ybMaOCic40tRX8=;
 b=pINxR8DJ/dnErtsZYHLcjm3xLVqJFIx1fMZNHtFehMtqd8aGXnSl54CT4YCi0RLQF1
 H9kc4Fd7rO9qljLBdTA4RxkI2f7FzHEvejLR/IrVv3ShAVJLFaJwsVQfOkLIRbusOioH
 LfbzI6BuvUyV0CU2sjYFvVtrZg9SOin6Ov/isa+XzSYhHwAHIO99eVmW79gYKjwiD5db
 157eGbN9NADA4/5cI5kFhkeT9C0pk178OKQI8l5wT8ovbXUnRHdyBEZAMvCvZ/4Ra2fE
 IJEPWagNz/x8+yoWrbByo2K5dgojkE1HzMlryp40yl7F8BrPdBpzDOhxibrbqDs8AVLS
 JZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5eVbw0nx8xg2wrymdgy7rIBO9Z2Z1ybMaOCic40tRX8=;
 b=4X2/yesQTFG60bm7qmsnQNBFsqOa4ygmWPRPHs2v8p+F46fySGX5Ywh8D5cZJHxhgV
 5A7M0cKeeekwiBVNNi4FtP+A/awoGV77bAflgTKoeUsfgJe735aKNAEfGyHrDR1W1I8W
 WVc9YLWuPRlBzAtugMqTBNKhla6h4XNUixxVXJxKVp1K36Ms2SrxWp8+7YWftaDcYnyN
 eA7rzJoAewvN+HoytaBiMLbgyoh2u6nPyLnea5XbYuiGpfNUC9wZNGTR5RGJpIKcx5yh
 XpSgTnQ8fC0JLofnftH/A3gqJb7nhhW6rZa0n9i7YkHuo0DW0Ml4mH2c9uMEsr+dMCfY
 HIWg==
X-Gm-Message-State: AOAM532hf7+0tsUVCXJwD5leWp4Bv5uO1AICtMh6kc4yCN/AvCjxiSpl
 xpoR9Gf9dSQQ7SWRylBaPkaRVbjV+2g=
X-Google-Smtp-Source: ABdhPJwKXR1brQUncQYlgUOu7VO+BDgmnuJ6K6yvnXsMlACxq1xjWW0DRh2aVZuhQlVnRO+8VmthaA==
X-Received: by 2002:ac8:59c8:0:b0:2e0:6ae2:eb6f with SMTP id
 f8-20020ac859c8000000b002e06ae2eb6fmr1175396qtf.580.1648061814387; 
 Wed, 23 Mar 2022 11:56:54 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 20-20020ac84e94000000b002e1d5505fb6sm693231qtp.63.2022.03.23.11.56.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 11:56:53 -0700 (PDT)
Message-ID: <06217ec6-bd2a-6fd1-b2ff-1704b073456f@gmail.com>
Date: Wed, 23 Mar 2022 19:56:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v4 01/13] cpu: Free cpu->cpu_ases in
 cpu_address_space_destroy()
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
 <20220323171751.78612-2-philippe.mathieu.daude@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220323171751.78612-2-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::833
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-qt1-x833.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paul Durrant <paul@xen.org>, Peter Xu <peterx@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 David Hildenbrand <david@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Eduardo Habkost <eduardo@habkost.net>, Marcelo Tosatti <mtosatti@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wenchao Wang <wenchao.wang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/3/22 18:17, Philippe Mathieu-Daudé wrote:
> From: Mark Kanda <mark.kanda@oracle.com>
> 
> Create cpu_address_space_destroy() to free a CPU's cpu_ases list.

This seems incorrect...

> vCPU hotunplug related leak reported by Valgrind:
> 
> ==132362== 216 bytes in 1 blocks are definitely lost in loss record 7,119 of 8,549
> ==132362==    at 0x4C3ADBB: calloc (vg_replace_malloc.c:1117)
> ==132362==    by 0x69EE4CD: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.5600.4)
> ==132362==    by 0x7E34AF: cpu_address_space_init (physmem.c:751)
> ==132362==    by 0x45053E: qemu_init_vcpu (cpus.c:635)
> ==132362==    by 0x76B4A7: x86_cpu_realizefn (cpu.c:6520)
> ==132362==    by 0x9343ED: device_set_realized (qdev.c:531)
> ==132362==    by 0x93E26F: property_set_bool (object.c:2273)
> ==132362==    by 0x93C23E: object_property_set (object.c:1408)
> ==132362==    by 0x9406DC: object_property_set_qobject (qom-qobject.c:28)
> ==132362==    by 0x93C5A9: object_property_set_bool (object.c:1477)
> ==132362==    by 0x933C81: qdev_realize (qdev.c:333)
> ==132362==    by 0x455E9A: qdev_device_add_from_qdict (qdev-monitor.c:713)
> 
> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Message-Id: <20220321141409.3112932-5-mark.kanda@oracle.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   cpu.c                     | 1 +
>   include/exec/cpu-common.h | 7 +++++++
>   softmmu/physmem.c         | 5 +++++
>   3 files changed, 13 insertions(+)
> 
> diff --git a/cpu.c b/cpu.c
> index be1f8b074c..59352a1487 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -174,6 +174,7 @@ void cpu_exec_unrealizefn(CPUState *cpu)
>           tcg_exec_unrealizefn(cpu);
>       }
>   
> +    cpu_address_space_destroy(cpu);
>       cpu_list_remove(cpu);
>   }
>   
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index 50a7d2912e..b17ad61ae4 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -111,6 +111,13 @@ size_t qemu_ram_pagesize_largest(void);
>    */
>   void cpu_address_space_init(CPUState *cpu, int asidx,
>                               const char *prefix, MemoryRegion *mr);

... cpu_address_space_init() creates a single AS, ...

> +/**
> + * cpu_address_space_destroy:
> + * @cpu: CPU for this address space
> + *
> + * Cleanup CPU's cpu_ases list.
> + */
> +void cpu_address_space_destroy(CPUState *cpu);
>   
>   void cpu_physical_memory_rw(hwaddr addr, void *buf,
>                               hwaddr len, bool is_write);
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 43ae70fbe2..aec61ca07a 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -762,6 +762,11 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
>       }
>   }
>   
> +void cpu_address_space_destroy(CPUState *cpu)
> +{
> +    g_free(cpu->cpu_ases);

... but here you destroy all the ASes.

> +}
> +
>   AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx)
>   {
>       /* Return the AddressSpace corresponding to the specified index */


