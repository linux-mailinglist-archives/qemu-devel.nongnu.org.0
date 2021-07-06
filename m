Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 402273BDAD9
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 18:04:00 +0200 (CEST)
Received: from localhost ([::1]:46294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0nYE-00078v-Hp
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 12:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0nWX-0004Sy-Q0
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:02:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0nWU-0003Iw-NY
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:02:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625587328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UX/gXJmhQ+k9QK6RF4R3E/rt84J1f9RdtZwinQH9iM0=;
 b=UWGcysTlfI7lbNlkKVDpaiV5YnliNOP5PG3X9nysiGSCCeKYNMogu+Mfthk/BpzkejVQY1
 ngr2PsZCkCU38AMag1UtxDi6fu8RmiG9IVN9rLXBVqBQba5B8ZXGF0nN6wjVKHUNQdjafy
 3sdrcfm1qu0Ful2zyDxMJJTrrGcqbJk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-JussMKAzNFGgdMU4qAUH7w-1; Tue, 06 Jul 2021 12:02:07 -0400
X-MC-Unique: JussMKAzNFGgdMU4qAUH7w-1
Received: by mail-ed1-f72.google.com with SMTP id
 m21-20020a50ef150000b029039c013d5b80so910767eds.7
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 09:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UX/gXJmhQ+k9QK6RF4R3E/rt84J1f9RdtZwinQH9iM0=;
 b=TkfdmzJW53xg4oSevqcpqV2F63LNpHzQTU/2dRMoV4yxQsyIeH1S1F9R76qTtmcOTy
 JapwTORI/y9mrp+hxzInnK5Lsh6GRrgD/veCfFpATzzk7cbe7LYAQQpfG6+cHXcBgUCN
 fWGIpMOZVrBSBNGCBM/GAmVMp9nq6/kf8A/fuU0nwNkAZt3reYaLNapuA8ryBfBz8MSL
 MpFV0s/d6vMugnbqDuJZhAbRb4+MBjffe7uaG7y79Oxu4ESg39mTf3UTMramDJi1bWq4
 Ev2MYv4kBsK9osJsUsBUwvl4gfsxsUOhl+76vRy+/zXNk8uKR4aE8SEcyY66cVgIb/EV
 qcLA==
X-Gm-Message-State: AOAM532CQyrGQMXvFWbBOcmGbxPy0aVgPvAE/RD9dm4OSkV+UZ5+Rpdu
 waftutS4lnfBcjmbI2qt51dyi1x5eiEE8htHgJaIVwnsHtghtwdUaY5pLfHw212lCo3IgA32Yyo
 oGAY08q+7D0fgbW4mXcvnfVOJL9MWwqHdZRsHK5Ao+SnRJrh3ULaqtRzlfxmTWVwCLmg=
X-Received: by 2002:a17:906:974f:: with SMTP id
 o15mr9319261ejy.476.1625587319140; 
 Tue, 06 Jul 2021 09:01:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLOIUbe/SwR92Zlmmr9ljqDUYMgm9/FKxW3S1ynJ/TnMcjT1hi6nnHVTQmICKA2ih5AvJ5nw==
X-Received: by 2002:a17:906:974f:: with SMTP id
 o15mr9318995ejy.476.1625587312112; 
 Tue, 06 Jul 2021 09:01:52 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id cn17sm4933451edb.29.2021.07.06.09.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 09:01:51 -0700 (PDT)
Subject: Re: [PATCH 1/4] target/i386: Added MSRPM and IOPM size check
To: Lara Lazier <laramglazier@gmail.com>, qemu-devel@nongnu.org
References: <20210705081802.18960-1-laramglazier@gmail.com>
 <20210705081802.18960-2-laramglazier@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <72218a72-c1c9-9008-6870-c78d095446f1@redhat.com>
Date: Tue, 6 Jul 2021 18:01:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705081802.18960-2-laramglazier@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 05/07/21 10:17, Lara Lazier wrote:
> The address of the last entry in the MSRPM and
> in the IOPM must be smaller than the largest physical address.
> (APM2 15.10-15.11)
> 
> Signed-off-by: Lara Lazier <laramglazier@gmail.com>
> ---
>   target/i386/svm.h                   |  3 +++
>   target/i386/tcg/sysemu/svm_helper.c | 15 +++++++++++++++
>   2 files changed, 18 insertions(+)
> 
> diff --git a/target/i386/svm.h b/target/i386/svm.h
> index 5098733053..adc058dc76 100644
> --- a/target/i386/svm.h
> +++ b/target/i386/svm.h
> @@ -137,6 +137,9 @@
>   
>   #define SVM_CR0_RESERVED_MASK 0xffffffff00000000U
>   
> +#define SVM_MSRPM_SIZE		(1ULL << 13)
> +#define SVM_IOPM_SIZE		((1ULL << 13) + 1)
> +
>   struct QEMU_PACKED vmcb_control_area {
>   	uint16_t intercept_cr_read;
>   	uint16_t intercept_cr_write;
> diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
> index 1c2dbc1862..fa701829e5 100644
> --- a/target/i386/tcg/sysemu/svm_helper.c
> +++ b/target/i386/tcg/sysemu/svm_helper.c
> @@ -68,6 +68,7 @@ static inline void svm_load_seg_cache(CPUX86State *env, hwaddr addr,
>   void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
>   {
>       CPUState *cs = env_cpu(env);
> +    X86CPU *cpu = env_archcpu(env);
>       target_ulong addr;
>       uint64_t nested_ctl;
>       uint32_t event_inj;
> @@ -159,6 +160,20 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
>       asid = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb,
>                                                             control.asid));
>   
> +    uint64_t msrpm_base_pa = x86_ldq_phys(cs, env->vm_vmcb +
> +                                    offsetof(struct vmcb,
> +                                            control.msrpm_base_pa));
> +    uint64_t iopm_base_pa = x86_ldq_phys(cs, env->vm_vmcb +
> +                                 offsetof(struct vmcb, control.iopm_base_pa));
> +
> +    if ((msrpm_base_pa & ~0xfff) >= (1ull << cpu->phys_bits) - SVM_MSRPM_SIZE) {
> +        cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
> +    }
> +
> +    if ((iopm_base_pa & ~0xfff) >= (1ull << cpu->phys_bits) - SVM_IOPM_SIZE) {
> +        cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
> +    }
> +
>       env->nested_pg_mode = 0;
>   
>       if (!cpu_svm_has_intercept(env, SVM_EXIT_VMRUN)) {
> 

Queued, thanks.

Paolo


