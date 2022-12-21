Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A266F652E1B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 09:53:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7upU-0002FT-Si; Wed, 21 Dec 2022 03:52:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7upS-0002Ec-3Z
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 03:51:58 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7upQ-0006jj-Bc
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 03:51:57 -0500
Received: by mail-wr1-x42f.google.com with SMTP id y16so14230842wrm.2
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 00:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CHwwpo6YP2fNyRb3/gRp8z+3eSoVMuErG3i5EVAl/xs=;
 b=PIpry9QehztY2kdeLIqv9ZXXrVwe9pW2bRtfy+r/X1X26NRdEVM1iuWOGLqyoJeZ9I
 qULZ5AWQVZ4l6yD1qx8XnB2CDA/Fa07LdI38f8kZdyQSCG6PYpLckjN16bfRfStiD6pc
 Pms6FEWjH/Y+cH8FdKTpQKwGxyVxh6a36Fsc/VjE7NDjI5i5g4jk5v5WH1GWrYTiyT1T
 gcljifKoA6Itl8aSMeTEeDfDwDABMOSnLky5oF7bVWZGc/NMEUTStPABSFJDdq1YV9Bj
 zJXoLSOKMxDvqXoETzf44gn75kl8MO9bTEXRjzj6Ogu9f+YCBhHHKB5m6it97CLj/r+/
 Zo1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CHwwpo6YP2fNyRb3/gRp8z+3eSoVMuErG3i5EVAl/xs=;
 b=rtfndzqfpsud9r+Nk45ivPkbsN6JJKz7XsI5fGrXabLeSUY4HM+IO0kPrzuMCGbFqD
 uO1NJ6O0VEp54Ss+Qh8wxDagro88J9fzX1lYoUlSRAz7O2btVvVjRIJLEfzl6RdNd7dE
 X2gF/Ab7oOXXn/CjWHZKohZLbMAzJDmpl9Gr2J++Vz+dUXqNo2SxRKbZnmxa9Y3TkGzs
 qxj+NV/Hv8SJVHnEf2E2aBUagCF1CENy3ZhoDhB2t0TgLSDvId/8IBAbnBHcfEugZ0FD
 GUGmU/nntd35WDZ4arQmzxfjFdSIau+psHocQ6zv1iUHXXNjzjuzffhWcxJhpU4lGxdp
 zJCQ==
X-Gm-Message-State: AFqh2kqnaSJgTD7tMjwjBCKSPZuL42lOIBncxIyG8m9hD0yoyf3SuBbz
 /qTfkWZAeOFAq+tCNuYDjVS/zQ==
X-Google-Smtp-Source: AMrXdXuBGoB6EbdjCJj/jPG7gPAdMRIrAAfHAgNfjs/fFrdoEYqXWp8RxPEgV2GavIYZ0eIbb4QxgQ==
X-Received: by 2002:a5d:4acb:0:b0:242:844a:70a5 with SMTP id
 y11-20020a5d4acb000000b00242844a70a5mr410753wrs.35.1671612714352; 
 Wed, 21 Dec 2022 00:51:54 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 d4-20020adfe884000000b00228cbac7a25sm14666553wrm.64.2022.12.21.00.51.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 00:51:53 -0800 (PST)
Message-ID: <80b49ba9-e925-6708-be8b-3a8103826747@linaro.org>
Date: Wed, 21 Dec 2022 09:51:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH] MIPS: remove support for trap and emulate KVM
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@kernel.org>
References: <20221218000649.686882-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221218000649.686882-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 18/12/22 01:06, Paolo Bonzini wrote:
> This support was limited to the Malta board, drop it.
> I do not have a machine that can run VZ KVM, so I am assuming
> that it works for -M malta as well.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   docs/about/deprecated.rst       |  9 -------
>   docs/about/removed-features.rst |  9 +++++++
>   hw/mips/malta.c                 | 44 ++++-----------------------------
>   target/mips/cpu.c               |  7 +-----
>   target/mips/cpu.h               |  2 --
>   target/mips/kvm.c               | 11 +--------
>   target/mips/sysemu/addr.c       | 17 -------------
>   target/mips/sysemu/physaddr.c   | 13 ----------
>   8 files changed, 16 insertions(+), 96 deletions(-)


> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
> index 7a565466cb3f..065a9cd10ec9 100644
> --- a/target/mips/cpu.c
> +++ b/target/mips/cpu.c
> @@ -290,12 +290,7 @@ static void mips_cpu_reset(DeviceState *dev)
>       env->tlb->tlb_in_use = env->tlb->nb_tlb;
>       env->CP0_Wired = 0;
>       env->CP0_GlobalNumber = (cs->cpu_index & 0xFF) << CP0GN_VPId;
> -    env->CP0_EBase = (cs->cpu_index & 0x3FF);
> -    if (mips_um_ksegs_enabled()) {
> -        env->CP0_EBase |= 0x40000000;
> -    } else {
> -        env->CP0_EBase |= (int32_t)0x80000000;
> -    }
> +    env->CP0_EBase = (cs->cpu_index & 0x3FF) | (int32_t)0x80000000;

Pre-existing, but maybe clearer as:

        env->CP0_EBase = KSEG0_BASE | (cs->cpu_index & 0x3FF);

>       if (env->CP0_Config3 & (1 << CP0C3_CMGCR)) {
>           env->CP0_CMGCRBase = 0x1fbf8000 >> 4;
>       }
> diff --git a/target/mips/cpu.h b/target/mips/cpu.h
> index 0a085643a3f1..3411cbc37825 100644
> --- a/target/mips/cpu.h
> +++ b/target/mips/cpu.h
> @@ -1299,8 +1299,6 @@ uint64_t cpu_mips_phys_to_kseg0(void *opaque, uint64_t addr);
>   uint64_t cpu_mips_kvm_um_phys_to_kseg0(void *opaque, uint64_t addr);

cpu_mips_kvm_um_phys_to_kseg0() is removed ...

>   uint64_t cpu_mips_kseg1_to_phys(void *opaque, uint64_t addr);
>   uint64_t cpu_mips_phys_to_kseg1(void *opaque, uint64_t addr);
> -bool mips_um_ksegs_enabled(void);
> -void mips_um_ksegs_enable(void);
>   
>   #if !defined(CONFIG_USER_ONLY)

> diff --git a/target/mips/sysemu/addr.c b/target/mips/sysemu/addr.c
> index 86f1c129c9f4..4f025be44a1d 100644
> --- a/target/mips/sysemu/addr.c
> +++ b/target/mips/sysemu/addr.c
> @@ -23,8 +23,6 @@
>   #include "qemu/osdep.h"
>   #include "cpu.h"

> -uint64_t cpu_mips_kvm_um_phys_to_kseg0(void *opaque, uint64_t addr)
> -{
> -    return addr | 0x40000000ll;
> -}

... here.

