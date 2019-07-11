Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 482F8657EC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 15:36:43 +0200 (CEST)
Received: from localhost ([::1]:41848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlZFa-00037Z-Gv
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 09:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44958)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hlZEU-0002Fi-VX
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 09:35:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hlZEU-00016a-0H
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 09:35:34 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35861)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hlZET-00015T-P7
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 09:35:33 -0400
Received: by mail-wr1-f66.google.com with SMTP id n4so6356310wrs.3
 for <qemu-devel@nongnu.org>; Thu, 11 Jul 2019 06:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pH6IES3/nGr4r5FV4z7rtiiDK0sH4ktfyPk5fhHI6mI=;
 b=aRve/itNqPeLhxtMNw8QEJyrsRP0r/HHbULYDIqOzg7yorDevo3OWnvvaOi2Q6ZwcP
 /s1EaVdcqS2UcfnVYWfxG8dlMIAkWVLRPKbUJBNGD2mkTLFn6a3mLmmpu7A3yO+gI25y
 N4bMxyP0Ch1Gv5/fp+GxomKEULlfl9KVPUcyvnDvJbe9wELyhI9xW3R+pUOft9sK+W2z
 RmFZnJ38yHBff//5utlUiCEhFvUvY86cMp56jewmebA8rc6buXCbfuSwTs/ZpuEe0zUd
 4O2REPCp2MWdLsB1SN4+/PztxWbzycIsRAhBXMuTtH7A0OxvmwibXDi+TeDbm7053l46
 jWbQ==
X-Gm-Message-State: APjAAAXQMDJvYKwP4yeHSgYQc/om+Kj40H5/6oiuSHXqI5bFY5krt2Iz
 KfNvwIAgaTkHorei14vh4KRRqQ==
X-Google-Smtp-Source: APXvYqzFBLJaR1P1/N+yre7g2V1AxgFlkIWWBpWilfQe9fFGL4T3KG/XXXsJKlKUMwTFvJCgFHx0IQ==
X-Received: by 2002:a05:6000:1043:: with SMTP id
 c3mr5527822wrx.236.1562852132665; 
 Thu, 11 Jul 2019 06:35:32 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d066:6881:ec69:75ab?
 ([2001:b07:6468:f312:d066:6881:ec69:75ab])
 by smtp.gmail.com with ESMTPSA id q18sm1999839wrw.36.2019.07.11.06.35.31
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jul 2019 06:35:31 -0700 (PDT)
To: Liran Alon <liran.alon@oracle.com>, qemu-devel@nongnu.org
References: <20190705210636.3095-1-liran.alon@oracle.com>
 <20190705210636.3095-3-liran.alon@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e7b28be0-964a-755a-6349-02396887e7d9@redhat.com>
Date: Thu, 11 Jul 2019 15:35:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190705210636.3095-3-liran.alon@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-devel] [PATCH 2/4] target/i386: kvm: Init nested-state
 for vCPU exposed with SVM
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
Cc: Joao Martins <joao.m.martins@oracle.com>, ehabkost@redhat.com,
 kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/07/19 23:06, Liran Alon wrote:
> Reviewed-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: Liran Alon <liran.alon@oracle.com>
> ---
>  target/i386/cpu.h | 5 +++++
>  target/i386/kvm.c | 2 ++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 93345792f4cb..cdb0e43676a9 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1867,6 +1867,11 @@ static inline bool cpu_has_vmx(CPUX86State *env)
>      return env->features[FEAT_1_ECX] & CPUID_EXT_VMX;
>  }
>  
> +static inline bool cpu_has_svm(CPUX86State *env)
> +{
> +    return env->features[FEAT_8000_0001_ECX] & CPUID_EXT3_SVM;
> +}
> +
>  /* fpu_helper.c */
>  void update_fp_status(CPUX86State *env);
>  void update_mxcsr_status(CPUX86State *env);
> diff --git a/target/i386/kvm.c b/target/i386/kvm.c
> index b57f873ec9e8..4e2c8652168f 100644
> --- a/target/i386/kvm.c
> +++ b/target/i386/kvm.c
> @@ -1721,6 +1721,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
>              env->nested_state->format = KVM_STATE_NESTED_FORMAT_VMX;
>              vmx_hdr->vmxon_pa = -1ull;
>              vmx_hdr->vmcs12_pa = -1ull;
> +        } else if (cpu_has_svm(env)) {
> +            env->nested_state->format = KVM_STATE_NESTED_FORMAT_SVM;
>          }
>      }
>  
> 

I'm not sure about it.  We have no idea what the format will be, so we
shouldn't set the format carelessly.

Paolo

