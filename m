Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FA2354DA9
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 09:18:00 +0200 (CEST)
Received: from localhost ([::1]:35950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTfyI-00007k-SF
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 03:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lTfwI-0007gT-Ho
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 03:15:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lTfwE-0001YB-L2
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 03:15:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617693349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qvrdDlvKu22uXUziqHM55JUoTZw4apRfqlu8ewC5drg=;
 b=T6ed6wnI9SNW984r+4R5rlHcFI0WnGwzMPxmX8MUFUmxz3vuhE4rLf6Nha03VWZIu521HN
 4tKSTfzCrgr+zgupv/n/7To/SKO5bxBkmU7Ymz/Q07zt5hLq6jSNrTl6uP6+86xdwKfqbA
 ZgfzamtF622AQNw9i0VfCoPJwV+9ZBQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-js1NnkGLOWamDPdi9TrRpg-1; Tue, 06 Apr 2021 03:15:46 -0400
X-MC-Unique: js1NnkGLOWamDPdi9TrRpg-1
Received: by mail-ej1-f71.google.com with SMTP id gn30so5077195ejc.3
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 00:15:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qvrdDlvKu22uXUziqHM55JUoTZw4apRfqlu8ewC5drg=;
 b=qfJSP78/AqACgxViYAVP+c0XvbjdGtTmKZ1Jnw8fk3MFOQ8oKre3kF8IeJtuHUh4wa
 czChjMZHHvoqo7D1adpUnrgZTs9e0cK2Wbn53kmNsGcajPTkR9fs2GX7Y8OVCz11MF7u
 3bQ02anDnoj4GVmxbqnDWvmNN4VYa3y8pYZ2lKysD0F1GwEpim/JzASO86Z3abbYMtlw
 4wYLYpw1PMwBFpgyy4VzfYZz6zsVeKUUMTie4L0d3z+qzcbA2a4mB0HJqRwg4bZ+AWvd
 Dy4tcWhMFRU3s2J3qh3vhLq19p9H1oy3ZqSsV+AM9uEtSf+XH+udyLsTzH3zczg/4t6h
 mOjQ==
X-Gm-Message-State: AOAM5336X+osEdErvOPLw2RMXToT/NbmiiQCWLWv+wy2KfSEkOxZGngk
 ch5+1O6P+IuFYBB3x9zwGMIStB+lHsuEKTNT7zfaCsPRv0FaWcCrVA+XU0x5NyXFRGCfG5APrne
 +yZ6zU4bNnK3lsUw=
X-Received: by 2002:a05:6402:3593:: with SMTP id
 y19mr36007157edc.317.1617693345871; 
 Tue, 06 Apr 2021 00:15:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKNySVhjZhoKLGbBWjRkE1aDp9mOSbj0gvKY+O19nPlHYsH6tO/QUWXaXJirvA01IIzr5TVw==
X-Received: by 2002:a05:6402:3593:: with SMTP id
 y19mr36007143edc.317.1617693345695; 
 Tue, 06 Apr 2021 00:15:45 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id q2sm10484051eje.24.2021.04.06.00.15.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 00:15:45 -0700 (PDT)
Subject: Re: [PATCH] i386/cpu: Expose AVX_VNNI instruction to guset
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20210406015757.25718-1-yang.zhong@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <35eb247d-55be-981a-8818-16aceb84cf82@redhat.com>
Date: Tue, 6 Apr 2021 09:15:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210406015757.25718-1-yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: bonzini@gnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Typo "guest" in subject.

On 4/6/21 3:57 AM, Yang Zhong wrote:
> Expose AVX (VEX-encoded) versions of the Vector Neural Network
> Instructions to guest.>
> The bit definition:
> CPUID.(EAX=7,ECX=1):EAX[bit 4] AVX_VNNI
> 
> The following instructions are available when this feature is
> present in the guest.
>   1. VPDPBUS: Multiply and Add Unsigned and Signed Bytes
>   2. VPDPBUSDS: Multiply and Add Unsigned and Signed Bytes with Saturation
>   3. VPDPWSSD: Multiply and Add Signed Word Integers
>   4. VPDPWSSDS: Multiply and Add Signed Integers with Saturation
> 
> As for the kvm related code, please reference Linux commit id 1085a6b585d7.
> 
> The release document ref below link:
> https://software.intel.com/content/www/us/en/develop/download/\
> intel-architecture-instruction-set-extensions-programming-reference.html
> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>  target/i386/cpu.c | 4 ++--
>  target/i386/cpu.h | 2 ++
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 6b3e9467f1..f0c48f06a2 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -996,7 +996,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
>          .type = CPUID_FEATURE_WORD,
>          .feat_names = {
>              NULL, NULL, NULL, NULL,
> -            NULL, "avx512-bf16", NULL, NULL,
> +            "avx-vnni", "avx512-bf16", NULL, NULL,
>              NULL, NULL, NULL, NULL,
>              NULL, NULL, NULL, NULL,
>              NULL, NULL, NULL, NULL,
> @@ -3273,7 +3273,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
>              MSR_ARCH_CAP_SKIP_L1DFL_VMENTRY | MSR_ARCH_CAP_MDS_NO |
>              MSR_ARCH_CAP_PSCHANGE_MC_NO | MSR_ARCH_CAP_TAA_NO,
>          .features[FEAT_7_1_EAX] =
> -            CPUID_7_1_EAX_AVX512_BF16,
> +            CPUID_7_1_EAX_AVX_VNNI | CPUID_7_1_EAX_AVX512_BF16,
>          /*
>           * Missing: XSAVES (not supported by some Linux versions,
>           * including v4.1 to v4.12).
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 570f916878..edc8984448 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -804,6 +804,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
>  /* Speculative Store Bypass Disable */
>  #define CPUID_7_0_EDX_SPEC_CTRL_SSBD    (1U << 31)
>  
> +/* AVX VNNI Instruction */
> +#define CPUID_7_1_EAX_AVX_VNNI          (1U << 4)
>  /* AVX512 BFloat16 Instruction */
>  #define CPUID_7_1_EAX_AVX512_BF16       (1U << 5)
>  
> 


