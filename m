Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2643304A92
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 21:50:00 +0100 (CET)
Received: from localhost ([::1]:51012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4VHj-0004nd-LM
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 15:49:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4VGb-0004Az-6L
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 15:48:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4VGX-0004io-Sm
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 15:48:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611694124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oiu4rr5Og2DycQaRkI1Edoe3CXBAzk3kdYd/jnyRjMU=;
 b=bngKLc842wTGoO4UIZAezd9wwzMGNanHZc49btN/ZDeUr8EWmk4swil/LvR0RKq6gNdzyV
 M4a9lzSJIg6N7cdNsddBPYhMUDPKZ7Me4hvuX5x8KihKySUGrB6UJcsRQLhYIxc9fwcmHz
 BKpd2Ffxm9F6WdB35+Ed0goHZT7rIr0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101--8UVvPlvNNSzVGW6vI2E5A-1; Tue, 26 Jan 2021 15:48:41 -0500
X-MC-Unique: -8UVvPlvNNSzVGW6vI2E5A-1
Received: by mail-ed1-f69.google.com with SMTP id u19so9464891edr.1
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 12:48:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Oiu4rr5Og2DycQaRkI1Edoe3CXBAzk3kdYd/jnyRjMU=;
 b=amNgtBviiukvCaKtTEiHxj5D/y5meOP1lPxfnjYZxrzKX+8BtBYOIxTlSZWYWZU+lW
 P1DaenR50WiVYCc9zwFTCBgOXu5dOI/69BktwEsbFnYKFBauVEbp4eouyPOXmk/aygeR
 DFBFgxIBbLLbuevEMCf884E/X2x7j4EuQL5bRAhPcKIbJb6mxbJj6UNy4K5LUhptJTcG
 ZQzx9dsk6FhPkE45AFrRYr3Y2oLlQgimjGNy16pNFVw2TeH6NWieXnfij0vKK2nY+uTk
 KFJtMGddeivF0wXMVWZo1ymLz4KFfGLHFYvQei2NxdGNyP84vC4QHB9aXhbXsw0JOz74
 u3GA==
X-Gm-Message-State: AOAM531AakmQDxUDwixjx0ijH+Gc3kkkiXLbcTdi8cP30k/Y6pVQQZh8
 zy3Xhtlun735cV3lz766iUrofjgxAnmjkgPMpALIzyFHJP67GnFVgxwxjwpqcTAxrtu6spdXIoM
 BhT1fCbvmYAT3LNM=
X-Received: by 2002:a17:906:c410:: with SMTP id
 u16mr4447562ejz.159.1611694120632; 
 Tue, 26 Jan 2021 12:48:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyl9L5bQciH17+deIhdU7ov3iivCm1WmYIQjuYFk6Lk2TtgsLtZab+ofKx8mzHAoxHorktBEg==
X-Received: by 2002:a17:906:c410:: with SMTP id
 u16mr4447551ejz.159.1611694120450; 
 Tue, 26 Jan 2021 12:48:40 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id gb14sm9936115ejc.61.2021.01.26.12.48.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jan 2021 12:48:39 -0800 (PST)
Subject: Re: [PATCH 1/1] x86/cpu: Populate SVM CPUID feature bits
To: Wei Huang <wei.huang2@amd.com>, qemu-devel@nongnu.org
References: <20210126202456.589932-1-wei.huang2@amd.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7e13bab7-5d2d-8062-649c-d4cafddcf75c@redhat.com>
Date: Tue, 26 Jan 2021 21:48:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210126202456.589932-1-wei.huang2@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: ehabkost@redhat.com, richard.henderson@linaro.org, dgilbert@redhat.com,
 mlevitsk@redhat.com, babu.moger@amd.com, bsd@redhat.com, vkuznets@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/01/21 21:24, Wei Huang wrote:
> Newer AMD CPUs will add CPUID_0x8000000A_EDX[28] bit, which indicates
> that SVM instructions (VMRUN/VMSAVE/VMLOAD) will trigger #VMEXIT before
> CPU checking their EAX against reserved memory regions. This change will
> allow the hypervisor to avoid intercepting #GP and emulating SVM
> instructions. KVM turns on this CPUID bit for nested VMs. In order to
> support it, let us populate this bit, along with other SVM feature bits,
> in FEAT_SVM.
> 
> Signed-off-by: Wei Huang <wei.huang2@amd.com>
> ---
>   target/i386/cpu.c |  6 +++---
>   target/i386/cpu.h | 24 ++++++++++++++----------
>   2 files changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 72a79e6019b5..85e529157659 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -926,11 +926,11 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
>               "npt", "lbrv", "svm-lock", "nrip-save",
>               "tsc-scale", "vmcb-clean",  "flushbyasid", "decodeassists",
>               NULL, NULL, "pause-filter", NULL,
> -            "pfthreshold", NULL, NULL, NULL,
> -            NULL, NULL, NULL, NULL,
> -            NULL, NULL, NULL, NULL,
> +            "pfthreshold", "avic", NULL, "v-vmsave-vmload",
> +            "vgif", NULL, NULL, NULL,
>               NULL, NULL, NULL, NULL,
>               NULL, NULL, NULL, NULL,
> +            "svme-addr-chk", NULL, NULL, NULL,
>           },
>           .cpuid = { .eax = 0x8000000A, .reg = R_EDX, },
>           .tcg_features = TCG_SVM_FEATURES,
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index d23a5b340a8d..b39ec505de96 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -670,16 +670,20 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
>   #define CPUID_EXT3_PERFCORE (1U << 23)
>   #define CPUID_EXT3_PERFNB  (1U << 24)
>   
> -#define CPUID_SVM_NPT          (1U << 0)
> -#define CPUID_SVM_LBRV         (1U << 1)
> -#define CPUID_SVM_SVMLOCK      (1U << 2)
> -#define CPUID_SVM_NRIPSAVE     (1U << 3)
> -#define CPUID_SVM_TSCSCALE     (1U << 4)
> -#define CPUID_SVM_VMCBCLEAN    (1U << 5)
> -#define CPUID_SVM_FLUSHASID    (1U << 6)
> -#define CPUID_SVM_DECODEASSIST (1U << 7)
> -#define CPUID_SVM_PAUSEFILTER  (1U << 10)
> -#define CPUID_SVM_PFTHRESHOLD  (1U << 12)
> +#define CPUID_SVM_NPT             (1U << 0)
> +#define CPUID_SVM_LBRV            (1U << 1)
> +#define CPUID_SVM_SVMLOCK         (1U << 2)
> +#define CPUID_SVM_NRIPSAVE        (1U << 3)
> +#define CPUID_SVM_TSCSCALE        (1U << 4)
> +#define CPUID_SVM_VMCBCLEAN       (1U << 5)
> +#define CPUID_SVM_FLUSHASID       (1U << 6)
> +#define CPUID_SVM_DECODEASSIST    (1U << 7)
> +#define CPUID_SVM_PAUSEFILTER     (1U << 10)
> +#define CPUID_SVM_PFTHRESHOLD     (1U << 12)
> +#define CPUID_SVM_AVIC            (1U << 13)
> +#define CPUID_SVM_V_VMSAVE_VMLOAD (1U << 15)
> +#define CPUID_SVM_VGIF            (1U << 16)
> +#define CPUID_SVM_SVME_ADDR_CHK   (1U << 28)
>   
>   /* Support RDFSBASE/RDGSBASE/WRFSBASE/WRGSBASE */
>   #define CPUID_7_0_EBX_FSGSBASE          (1U << 0)
> 

Queued, thanks.

Paolo


