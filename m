Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 626E54AE4E6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 23:47:12 +0100 (CET)
Received: from localhost ([::1]:42498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHZGR-0006es-H5
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 17:47:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHZD7-000553-Ic
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 17:43:46 -0500
Received: from [2607:f8b0:4864:20::102f] (port=38646
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHZD4-0005ob-Am
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 17:43:45 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 h14-20020a17090a130e00b001b88991a305so3312048pja.3
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 14:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NQEGsvR6nCEH4h8MH5bky5mEIwYtseCbWg5+tcGgokU=;
 b=Yqfwz+tHinTPLHgZk3e6ZmfH6nRbJLsjidS2PqBi4sxloFIlgfRTSRDCnSU9srxET0
 5Tw45YoDJIYi6zjpQLvvd7BdnKVmeoeJLGnQIITthqgd3/KwHmYC8ZKJ2CWyh9udXUaT
 KdpgC5EgGgqqqowSy/3OIgmlLixzyVtkpMV6BkziaLGGUEwpu4RrbRlTZ7oevRIX3BMb
 DO/nubOPIEuC1XIqm1t/fTWO/v1aCgaFuhNLunnTIozNo+Pr9hhKFsdKmlrhZkXUGXld
 t6ry1+gCfkzOlX9usiZxmRbvTLi5XpArLXeJtzS33IDNUWrY76oP9rTcGbtCK1vcsbyI
 bL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NQEGsvR6nCEH4h8MH5bky5mEIwYtseCbWg5+tcGgokU=;
 b=XLs1Brw4svZLIX62sNA/HnuKM516ZE+Dl6eED4En/fGcefFZFdH/UylVtnuK/JXIAg
 xbIu/uDTDCFFrcY+6J540nMHqnRSUC1ZZP4MyOxnRG/FO2xxPBSeSKofYIih3W6EBB80
 wgWLl9230tXxFHicJKfdYOC5aYttSotvMVSJhvKor5OGkCSA2JhSl0BPMYhoIR97hSCO
 ZVZEu6xE5maw8168rlLyW/sZHurbqekBFNRa9non78+KjCEej3Egu1OC44RvhGnfUdOW
 R4QbywwxvFUggZW2mHc4VC7a8aXKe4WmorIHq430IfJmnWptobcxY4losB3aE2ky+pqw
 Uj4A==
X-Gm-Message-State: AOAM533ChE+GwS2+8Qst0UL4Kw4uPGE/XTknPTpjyko4KXfabUuU96BE
 jqaEYAlNou22IolvORdHQIKPBzLCNSD5sA==
X-Google-Smtp-Source: ABdhPJxbIMdyd6Qrca/o7KdW1/R7Enp7uFiGZkOB2g5Luyiy1yzaI6loVGT+U3SV4VZ55Cb1HN7Yqw==
X-Received: by 2002:a17:902:ecd2:: with SMTP id
 a18mr6714611plh.84.1644360219619; 
 Tue, 08 Feb 2022 14:43:39 -0800 (PST)
Received: from [192.168.1.118] (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id s10sm17594516pfu.186.2022.02.08.14.43.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 14:43:39 -0800 (PST)
Message-ID: <d8a0b09c-84dc-07bd-96fd-5155b8278e3a@linaro.org>
Date: Wed, 9 Feb 2022 09:43:34 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 11/13] exec/cpu_ldst: Restrict TCG-specific code
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220208152243.16452-1-f4bug@amsat.org>
 <20220208152243.16452-12-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220208152243.16452-12-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/22 02:22, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/exec/cpu_ldst.h | 53 ++++++++++++++++++++++-------------------
>   1 file changed, 28 insertions(+), 25 deletions(-)
> 
> diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
> index 5c999966de..0932096d29 100644
> --- a/include/exec/cpu_ldst.h
> +++ b/include/exec/cpu_ldst.h
> @@ -321,6 +321,8 @@ void cpu_atomic_sto_le_mmu(CPUArchState *env, target_ulong addr, Int128 val,
>   void cpu_atomic_sto_be_mmu(CPUArchState *env, target_ulong addr, Int128 val,
>                              MemOpIdx oi, uintptr_t retaddr);
>   
> +#ifdef CONFIG_TCG
> +
>   #if defined(CONFIG_USER_ONLY)
>   
>   extern __thread uintptr_t helper_retaddr;
> @@ -374,9 +376,34 @@ static inline CPUTLBEntry *tlb_entry(CPUArchState *env, uintptr_t mmu_idx,
>   {
>       return &env_tlb(env)->f[mmu_idx].table[tlb_index(env, mmu_idx, addr)];
>   }
> -
>   #endif /* defined(CONFIG_USER_ONLY) */
>   
> +/**
> + * tlb_vaddr_to_host:
> + * @env: CPUArchState
> + * @addr: guest virtual address to look up
> + * @access_type: 0 for read, 1 for write, 2 for execute
> + * @mmu_idx: MMU index to use for lookup
> + *
> + * Look up the specified guest virtual index in the TCG softmmu TLB.
> + * If we can translate a host virtual address suitable for direct RAM
> + * access, without causing a guest exception, then return it.
> + * Otherwise (TLB entry is for an I/O access, guest software
> + * TLB fill required, etc) return NULL.
> + */
> +#ifdef CONFIG_USER_ONLY
> +static inline void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
> +                                      MMUAccessType access_type, int mmu_idx)
> +{
> +    return g2h(env_cpu(env), addr);
> +}
> +#else
> +void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
> +                        MMUAccessType access_type, int mmu_idx);
> +#endif
> +
> +#endif /* CONFIG_TCG */

Why is it just these functions you think are tcg only?
I think the entire file is tcg only, if you are considering stuff that uses the softmmu tlb.

