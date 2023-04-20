Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA536E8EC4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:00:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppR5V-0005Lf-EJ; Thu, 20 Apr 2023 06:00:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppR5R-0005LP-M3
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:00:22 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppR5D-00024Q-If
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:00:21 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f17b967bfbso14691105e9.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 03:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681984806; x=1684576806;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yBAhlFTL1lrIG28vRQkGMKES1YJTi+dPx+8I3leXqUc=;
 b=EAj+c/nWVBe+vVG1OFbAUOVuYiruq5FN1IapVG4c7mukQjxpKO00ereqYUDG6Ii6sc
 5nvDdzKEF3cj+JsSmmj4aYJxNLdvfE87Dji8V0f2TG/kcyloDySZlHCa3hFZqtnhBivQ
 jRPwTQDOELJQL3bjeStJrIMT9Pf1FdKu1677eXhTD4A8z04zP84d6WbaCkui75cRMkoL
 80qGZC7sb4PJTfx9FpH4ErytQeCu12hE8p3IpSMr8jt+9Wj22Vh+TPwVbG9HJCKfYKhK
 SW9v+V3O6WQxDSCA90IulZiRYVILz23a6Z9HZRB3KbedYtgTUaHzKVMwrx+wp3xyZ9z4
 LLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681984806; x=1684576806;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yBAhlFTL1lrIG28vRQkGMKES1YJTi+dPx+8I3leXqUc=;
 b=J08ILGP6XSERIYTVwllk9Eftn3lDCGsOZvWONoVPRZCiniREdr2YBs0L5SseR9O5XA
 1Kq7dt174GZCWe6hD1J/aZpxuvkOrDYIKGES7y5ze7YwDZwbYNznPkEngJ2i/zmD27qR
 rQzqbFz2hD5ZiacWDG9koRF9CAW5mUxZDSdw4/T1LMgKOAmd1RlSUkxTFdTzhZeqYYFn
 TotBzBgJSZOos7Yt354vvkErNCJNN+W1Bslaik/WNQReC3wLSWk0a3Q1VBdSETiELm7/
 lS6MelxHwp5LCFUSe6BeC37uPSzYo14GDY+hucseJX2ZAjSn53zrXYoiyL6TlZ4VJo+8
 2TBA==
X-Gm-Message-State: AAQBX9fUNIEZ3GQi/ylcZn/14OGUC8u0Zo1sZ1iMom/T7mJheYb3t+8r
 YRxZEt2ArXuFEwJP24L4sXGWTA==
X-Google-Smtp-Source: AKy350bEZYWD6DVX3P6g8MyM/q4UdKvVB8e52UoHDz5C0Fvd8fuhxKuVhfOFXyKP0hpfnZYA2zyM1A==
X-Received: by 2002:adf:f092:0:b0:2fe:c8b5:b5da with SMTP id
 n18-20020adff092000000b002fec8b5b5damr940920wro.13.1681984805711; 
 Thu, 20 Apr 2023 03:00:05 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 a10-20020adfdd0a000000b002febc543c40sm1501157wrm.82.2023.04.20.03.00.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 03:00:05 -0700 (PDT)
Message-ID: <bbc4bf1b-9855-db6f-05d4-aa3baac96ee2@linaro.org>
Date: Thu, 20 Apr 2023 12:00:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH RFC v1 07/10] target/loongarch: Implement
 kvm_arch_handle_exit
Content-Language: en-US
To: Tianrui Zhao <zhaotianrui@loongson.cn>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, gaosong@loongson.cn
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, maobibo@loongson.cn
References: <20230420093606.3366969-1-zhaotianrui@loongson.cn>
 <20230420093606.3366969-8-zhaotianrui@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230420093606.3366969-8-zhaotianrui@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 20/4/23 11:36, Tianrui Zhao wrote:
> Implement kvm_arch_handle_exit for loongarch. In this
> function, the KVM_EXIT_LOONGARCH_IOCSR is handled,
> we read or write the iocsr address space by the addr,
> length and is_write argument in kvm_run.
> 
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> ---
>   target/loongarch/kvm.c | 24 +++++++++++++++++++++++-
>   1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/target/loongarch/kvm.c b/target/loongarch/kvm.c
> index f8772bbb27..4ce343d276 100644
> --- a/target/loongarch/kvm.c
> +++ b/target/loongarch/kvm.c
> @@ -499,7 +499,29 @@ bool kvm_arch_cpu_check_are_resettable(void)
>   
>   int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>   {
> -    return 0;
> +    int ret = 0;
> +    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
> +    CPULoongArchState *env = &cpu->env;
> +    MemTxAttrs attrs = {};
> +
> +    attrs.requester_id = env_cpu(env)->cpu_index;
> +
> +    DPRINTF("%s\n", __func__);

Please use trace events instead of DPRINTF(), as we are trying to remove
these.

> +    switch (run->exit_reason) {
> +    case KVM_EXIT_LOONGARCH_IOCSR:
> +        address_space_rw(&env->address_space_iocsr,
> +                         run->iocsr_io.phys_addr,
> +                         attrs,
> +                         run->iocsr_io.data,
> +                         run->iocsr_io.len,
> +                         run->iocsr_io.is_write);
> +        break;
> +    default:
> +        ret = -1;
> +        fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_reason);

Would warn_report() be more appropriate here?

> +        break;
> +    }
> +    return ret;
>   }
>   
>   void kvm_arch_accel_class_init(ObjectClass *oc)


