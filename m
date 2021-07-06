Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2533BDADE
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 18:04:53 +0200 (CEST)
Received: from localhost ([::1]:49622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0nZ7-0000vQ-0t
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 12:04:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0nX8-0006Br-8i
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:02:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0nX6-0003LZ-HT
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:02:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625587368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DHppnqn+poRkOzg522vLpp3kJSrlBqg86CbkXZXYmvQ=;
 b=BP2eKgfhbY/qKTdKpMGweYEkvUG5KfPHDSXqA3R8jWibV5iJDYGhJZpBqkvDEkzOObfnEL
 MLn5+OU3Bxe9haLGgtAR1Ahu/Cju3xJ/U4K0Ii0c90+k5AZOvWBIIxfGmk0/aeZu5MEnSN
 6Jo6x8X1gxAdmE0Sk+Yk0KqLV3Hh4g0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-RB-rGWcpPB6rRl4F2NlwTg-1; Tue, 06 Jul 2021 12:02:47 -0400
X-MC-Unique: RB-rGWcpPB6rRl4F2NlwTg-1
Received: by mail-ed1-f69.google.com with SMTP id
 z5-20020a05640235c5b0290393974bcf7eso11046608edc.2
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 09:02:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DHppnqn+poRkOzg522vLpp3kJSrlBqg86CbkXZXYmvQ=;
 b=hLMOdlAag251mdhuQT0AFaYXTR6TAq/KlR1ps7wgvYVYBLAs80RGFXKLwHSbagOfAl
 io8EJ8rg4gyHboaEuwirkGwV6tDr7JXucFSTt/3YoL/NsjQ3OWo/IDm5M9J2W6+IdAD/
 gZWUfV4zb4lYB8gv8zXoenTXluu/qD1s3b9tfsf+oTY3gbrMbRNnFQZKmFKCV0a0VDB1
 WTBnAh6v2g4bDYgp/Ar1A/eI5OBwT9iuv0EyYLz7AxQhu9upTMpfnebu/A8lLEy1UE/6
 jRRzQcTxZpBVshS/QExsw1iCwVmtSCEZfz+ydicrbdcci5Xf/M+JwYvYGkLtgT0qxK7l
 UutQ==
X-Gm-Message-State: AOAM533W9CUR0pZBCH55UErYFK8tbpC9PryafL2OVA6A7EW04Eef5rus
 zmDTBCpf3Y//GH6zbyDKrs1QPqLIrGFCP2NZNEf07fPnFasQHuiuE5UoJBaBHRo+o6kGhl4O/zx
 LHdUK8kkfA2HWyADG4pVxbUf4qjTeQxDmTpeOKVtRX6By79Sv7wSwoLUtsNKZtahL+zk=
X-Received: by 2002:a17:907:7709:: with SMTP id
 kw9mr19933900ejc.68.1625587365656; 
 Tue, 06 Jul 2021 09:02:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvuiPbdtlvTyHFcvbHN+SnrzNFEn/z/eVaB+djTLEKc8G2fnroeJGc6jYKtsuQdIOqcrtErQ==
X-Received: by 2002:a17:907:7709:: with SMTP id
 kw9mr19933875ejc.68.1625587365425; 
 Tue, 06 Jul 2021 09:02:45 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u17sm7407739edt.67.2021.07.06.09.02.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 09:02:44 -0700 (PDT)
Subject: Re: [PATCH 2/4] target/i386: Added DR6 and DR7 consistency checks
To: Lara Lazier <laramglazier@gmail.com>, qemu-devel@nongnu.org
References: <20210705081802.18960-1-laramglazier@gmail.com>
 <20210705081802.18960-3-laramglazier@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8e4595de-f309-5fd8-c004-4ade4b26155e@redhat.com>
Date: Tue, 6 Jul 2021 18:02:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705081802.18960-3-laramglazier@gmail.com>
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

On 05/07/21 10:18, Lara Lazier wrote:
> DR6[63:32] and DR7[63:32] are reserved and need to be zero.
> (AMD64 Architecture Programmer's Manual, V2, 15.5)
> 
> Signed-off-by: Lara Lazier <laramglazier@gmail.com>

The checks need to be disabled on 32-bit builds where env->dr[6] and 
env->dr[7] is a 32-bit value (compilers or static analyzers would 
complain about always-zero conditions) but otherwise the patch is fine. 
  When you fetch from the QEMU repository and rebase, you will be able 
to use my changes just with "git rebase --skip".

Queued, thanks.

Paolo

> ---
>   target/i386/svm.h                   | 2 ++
>   target/i386/tcg/sysemu/svm_helper.c | 8 +++++++-
>   2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/target/i386/svm.h b/target/i386/svm.h
> index adc058dc76..e54670ef12 100644
> --- a/target/i386/svm.h
> +++ b/target/i386/svm.h
> @@ -140,6 +140,8 @@
>   #define SVM_MSRPM_SIZE		(1ULL << 13)
>   #define SVM_IOPM_SIZE		((1ULL << 13) + 1)
>   
> +#define SVM_DR_RESERVED_MASK 0xffffffff00000000U
> +
>   struct QEMU_PACKED vmcb_control_area {
>   	uint16_t intercept_cr_read;
>   	uint16_t intercept_cr_write;
> diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
> index fa701829e5..276c240f70 100644
> --- a/target/i386/tcg/sysemu/svm_helper.c
> +++ b/target/i386/tcg/sysemu/svm_helper.c
> @@ -269,7 +269,13 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
>       env->dr[6] = x86_ldq_phys(cs,
>                             env->vm_vmcb + offsetof(struct vmcb, save.dr6));
>   
> -    /* FIXME: guest state consistency checks */
> +    if (env->dr[6] & SVM_DR_RESERVED_MASK) {
> +        cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
> +    }
> +
> +    if (env->dr[7] & SVM_DR_RESERVED_MASK) {
> +        cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
> +    }
>   
>       switch (x86_ldub_phys(cs,
>                         env->vm_vmcb + offsetof(struct vmcb, control.tlb_ctl))) {
> 


