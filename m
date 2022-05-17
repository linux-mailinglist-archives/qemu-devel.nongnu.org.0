Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5376552A8FE
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 19:09:24 +0200 (CEST)
Received: from localhost ([::1]:59402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr0h9-0006zb-65
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 13:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nr0fc-0004sQ-5B
 for qemu-devel@nongnu.org; Tue, 17 May 2022 13:07:40 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:46763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nr0fa-00017r-Et
 for qemu-devel@nongnu.org; Tue, 17 May 2022 13:07:39 -0400
Received: by mail-ej1-x635.google.com with SMTP id j6so35883541ejc.13
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 10:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7yBvEiWolXOYz605CKb+au7LCxmgtojgmI+zQ1JdS3s=;
 b=Asxj1he34HyEy91pPXXDjBat+ostamfI5AmE0Q4E8pXyYgJ9JMUp+hO0Q2VI0su27P
 EOa0k3AKVUGOjk8dC+DmxNOmxw4YNhFZtvzI4URLWXs2yV3M4c0DCrHBaGEkMkrocEZg
 0UnFw3cG0YCXp499+wmJxXRNI50vr+swXmo8k1uKvmQcIJF/lGptgifVQ0VnbB7eLuWI
 1iSCylNeNnziOSvBwaBMBg7zzUtUNrIZHmOXKzQeJnY/Zz5kLh4f5GPyki7aDt0QPz4u
 KV1AiH2O9RzdHkks+wxFY+gALxMRRd6jS0acQbhKdEVDGMmvqSnJ3dzlyU1qHYQpdeOh
 KREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7yBvEiWolXOYz605CKb+au7LCxmgtojgmI+zQ1JdS3s=;
 b=d7wOABIKEXzj8Jz6ONZZcdQX06BaU2/nBgDmzuD7AtyrhFxTcmMJHuLXsfQRwKypQq
 mPitULWw4oDEXNzP965YVykpMwfv1FUGA5rsFaijuzx3LqJiZiyAaG/r0RHL+vvJIObK
 Z6vTTslA41he1l596QmmWLqRW5a8I3J/EQ2L0MP/1qJ03tTol3DVRaWMPa2EAOoiuUwO
 TcCKnM7TwxutGNYxJDpWyAGQEBkTDa1LIFq6RXk4eIhTUAvqhBPSP92BvwElb2VsTiQJ
 WyC5XaBTMbKgmFtB8zYicaKZCw9+KhxFg4IcMbjh4PQVw2Bo75vl/USr7tLIMTbSDd8O
 m8Pw==
X-Gm-Message-State: AOAM530fd5fS7hiIqVJrwyVeSGityKEA43A03Nnf9B5rWXXu2ZyZwyzX
 5I4lybutHeqZvs/MWtQLt90=
X-Google-Smtp-Source: ABdhPJzc2JYeZjVqpQmq6X/D1vCwbT/+4IS6aQOqUYlvJJirsx4X6zYyWlGIdUmjHjBPKTnQHZb/3Q==
X-Received: by 2002:a17:906:5d05:b0:6f6:6353:c325 with SMTP id
 g5-20020a1709065d0500b006f66353c325mr20685907ejt.749.1652807256713; 
 Tue, 17 May 2022 10:07:36 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 el8-20020a170907284800b006f3ef214e73sm1242420ejc.217.2022.05.17.10.07.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 10:07:36 -0700 (PDT)
Message-ID: <9c1f1218-136c-6a73-4c3a-813f2597fb3c@redhat.com>
Date: Tue, 17 May 2022 19:07:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/i386: Remove LBREn bit check when access Arch LBR
 MSRs
Content-Language: en-US
To: Yang Weijiang <weijiang.yang@intel.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20220517155024.33270-1-weijiang.yang@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220517155024.33270-1-weijiang.yang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/22 17:50, Yang Weijiang wrote:
> Live migration can happen when Arch LBR LBREn bit is cleared,
> e.g., when migration happens after guest entered SMM mode.
> In this case, we still need to migrate Arch LBR MSRs.
> 
> Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
> ---
>   target/i386/kvm/kvm.c | 21 +++++++++------------
>   1 file changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index a9ee8eebd7..e2d675115b 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -3373,15 +3373,14 @@ static int kvm_put_msrs(X86CPU *cpu, int level)
>               int i, ret;
>   
>               /*
> -             * Only migrate Arch LBR states when: 1) Arch LBR is enabled
> -             * for migrated vcpu. 2) the host Arch LBR depth equals that
> -             * of source guest's, this is to avoid mismatch of guest/host
> -             * config for the msr hence avoid unexpected misbehavior.
> +             * Only migrate Arch LBR states when the host Arch LBR depth
> +             * equals that of source guest's, this is to avoid mismatch
> +             * of guest/host config for the msr hence avoid unexpected
> +             * misbehavior.
>                */
>               ret = kvm_get_one_msr(cpu, MSR_ARCH_LBR_DEPTH, &depth);
>   
> -            if (ret == 1 && (env->msr_lbr_ctl & 0x1) && !!depth &&
> -                depth == env->msr_lbr_depth) {
> +            if (ret == 1 && !!depth && depth == env->msr_lbr_depth) {
>                   kvm_msr_entry_add(cpu, MSR_ARCH_LBR_CTL, env->msr_lbr_ctl);
>                   kvm_msr_entry_add(cpu, MSR_ARCH_LBR_DEPTH, env->msr_lbr_depth);
>   
> @@ -3801,13 +3800,11 @@ static int kvm_get_msrs(X86CPU *cpu)
>   
>       if (kvm_enabled() && cpu->enable_pmu &&
>           (env->features[FEAT_7_0_EDX] & CPUID_7_0_EDX_ARCH_LBR)) {
> -        uint64_t ctl, depth;
> -        int i, ret2;
> +        uint64_t depth;
> +        int i, ret;
>   
> -        ret = kvm_get_one_msr(cpu, MSR_ARCH_LBR_CTL, &ctl);
> -        ret2 = kvm_get_one_msr(cpu, MSR_ARCH_LBR_DEPTH, &depth);
> -        if (ret == 1 && ret2 == 1 && (ctl & 0x1) &&
> -            depth == ARCH_LBR_NR_ENTRIES) {
> +        ret = kvm_get_one_msr(cpu, MSR_ARCH_LBR_DEPTH, &depth);
> +        if (ret == 1 && depth == ARCH_LBR_NR_ENTRIES) {
>               kvm_msr_entry_add(cpu, MSR_ARCH_LBR_CTL, 0);
>               kvm_msr_entry_add(cpu, MSR_ARCH_LBR_DEPTH, 0);
>   
> 
> base-commit: 8eccdb9eb84615291faef1257d5779ebfef7a0d0

Queued, thanks.

Paolo

