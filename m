Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2039F60424B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 12:58:05 +0200 (CEST)
Received: from localhost ([::1]:50714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol6lv-0003Hv-NC
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 06:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ol6hd-00005W-6s
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 06:53:37 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ol6hb-0006X8-HJ
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 06:53:36 -0400
Received: by mail-wr1-x42e.google.com with SMTP id j7so28481699wrr.3
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 03:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qtER+pnoU+/7ikP3NPM81Ooz5nTRUPZQTbvTnPDFZPw=;
 b=QXWL5wvTyP3hG88xdRQ6Wyo91av8GmdemxaD/Hjr1dxF5RAgTtgF4vGEMtsiFohP2R
 aRQaQ6DqwO5+vKAf9PFg5Rd65bZP1J9D0FrFjq9Zag6B8SwzcyoD6Mzw00vjL/SnxT6N
 cOaVpGzj6mKC5C3drkwUcQRkbGQUO4FZlUn0ggBWz3ACef32Y8z1V+Y1lxuwLaAOX27G
 /+XYiU4/tURALKOZgT7scugKx3OTC+9aBSqB7EG2SCi8JV7Rt9h9QXLRGXfBL3joQxC6
 7jhJxbvep3IEblyysDAxpywS4U9tEUo/6EPSu1eUfRu99e7IwzjvGDpRr05mWJmKTmY3
 8qYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qtER+pnoU+/7ikP3NPM81Ooz5nTRUPZQTbvTnPDFZPw=;
 b=o87bVBk3nZmQ0cCdTQAjg62+LeiyawIcLIzjf2CnUp+2bZAv9Is6w24cD5jmTfvAKw
 OJyvBJLzKmJGmArmogT4d0MfErOBf6mef91W6i3FHU9eYzoXLOaXmdXARlDOiw/TFC3v
 FSN27YIW/jGY5ihaC9eGkl3t1mJhUG4Ir9kkisA4MAU/IveMIs/POXr7tMxuziDlJzXf
 CTrI5ILNd2SbJfl4yYWwYQ8qjJ/8zc3C3HvE2W99VIhE+TFRn13Pu5SPt4Z5rmATnfqg
 /sJMH+XfD5oayGl0DbI06ZSNsVp1X+k81tnWQAz+VxPxXFzACsMRGbikZG6X8gsskP4n
 7lzg==
X-Gm-Message-State: ACrzQf2hNJwu8T1zgjEcsxHlcW5Zjgqmfgyg3/+Yhwy5GVkLcaZHar2m
 aGA0D9RvTj17fkHHw6H1DA2ztQ==
X-Google-Smtp-Source: AMsMyM7nW9AuFTrgsViYtc3kz/pbS3FgqQ0/o3Ypjmb+rLWeBTdIExy76JlOpM8/JodCAG+NGZBmDA==
X-Received: by 2002:a5d:43ce:0:b0:22e:4acd:2153 with SMTP id
 v14-20020a5d43ce000000b0022e4acd2153mr4392713wrr.189.1666176813753; 
 Wed, 19 Oct 2022 03:53:33 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c25-20020a7bc019000000b003c6b874a0dfsm19715175wmb.14.2022.10.19.03.53.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 03:53:33 -0700 (PDT)
Message-ID: <2b2eb94f-c534-464d-0f60-bc8a88e41af7@linaro.org>
Date: Wed, 19 Oct 2022 12:53:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v3 15/15] accel/kvm: move kvm_update_guest_debug to inline
 stub
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-16-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20220927141504.3886314-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/9/22 16:15, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/sysemu/kvm.h   | 16 ++++++++++++++++
>   accel/kvm/kvm-all.c    |  6 ------
>   accel/stubs/kvm-stub.c |  5 -----
>   3 files changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index 6e1bd01725..790d35ef78 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -247,7 +247,23 @@ int kvm_on_sigbus(int code, void *addr);
>   
>   void kvm_flush_coalesced_mmio_buffer(void);
>   
> +/**
> + * kvm_update_guest_debug(): ensure KVM debug structures updated
> + * @cs: the CPUState for this cpu
> + * @reinject_trap: KVM trap injection control
> + *
> + * There are usually per-arch specifics which will be handled by
> + * calling down to kvm_arch_update_guest_debug after the generic
> + * fields have been set.
> + */
> +#ifdef KVM_CAP_SET_GUEST_DEBUG
>   int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap);
> +#else
> +static inline int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap)
> +{
> +    return -EINVAL;

Wouldn't -ENOSYS make more sense in this case?

> +}
> +#endif
>   
>   /* internal API */
>   
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 6ebff6e5a6..423fb1936f 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -3395,12 +3395,6 @@ void kvm_remove_all_breakpoints(CPUState *cpu)
>       }
>   }
>   
> -#else /* !KVM_CAP_SET_GUEST_DEBUG */
> -
> -static int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap)
> -{
> -    return -EINVAL;
> -}
>   #endif /* !KVM_CAP_SET_GUEST_DEBUG */
>   
>   static int kvm_set_signal_mask(CPUState *cpu, const sigset_t *sigset)
> diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
> index 2d79333143..5d2dd8f351 100644
> --- a/accel/stubs/kvm-stub.c
> +++ b/accel/stubs/kvm-stub.c
> @@ -46,11 +46,6 @@ int kvm_has_many_ioeventfds(void)
>       return 0;
>   }
>   
> -int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap)
> -{
> -    return -ENOSYS;
> -}
> -
>   int kvm_on_sigbus_vcpu(CPUState *cpu, int code, void *addr)
>   {
>       return 1;


