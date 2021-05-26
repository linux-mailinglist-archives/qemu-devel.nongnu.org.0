Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A82391F4D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 20:40:00 +0200 (CEST)
Received: from localhost ([::1]:48022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llyRj-0002lM-1z
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 14:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llyNx-0005vl-D6
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:36:06 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:38555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llyNs-0001gn-AM
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:36:04 -0400
Received: by mail-pl1-x62e.google.com with SMTP id 69so1063434plc.5
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 11:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Klcj9DUqh9/iEk2wCEZftCqjoLWQMNPFCBy+WpsFmZE=;
 b=IzJsYRp7BOQP5fKEr4/uzLB/NEIH9mPzjQKzV3d3Io+wkoqs12O6ZBFlvOvCepZz1B
 KHEZDSVPTmo++MZnUGZ24+FD+JD/F0gqYMpxn7aA+Ke4FxP4BqGAP4CaXAQ8DSasOY02
 gF76lW0fk4JcrzaI6qtAA+wCe91k2LVQ2OVqcLDMaWPnVIG+jl9X++jBmvUDCA592i7J
 yEozV0oYEF7ApTYWkzbnhuVXzbeRoxjhWKL4ylxl21udYXTfKpUb/vVyNWOzPvnxDHJU
 fr0MTi5ueJ5PMAMLgiv9dh4fDcCd7n3EgjV7mw3kLtg4bprqmucL1K2QAYfXp6tDVtfo
 IAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Klcj9DUqh9/iEk2wCEZftCqjoLWQMNPFCBy+WpsFmZE=;
 b=tsSga+1z+w4dBtjuGSMz5q2ASWu9Sq/oSOcRTDods0HQIxoaPq9mG0X0+GGgDHypOv
 Tynx11DQo0kN3/T8pDC9lk4R96vGBAd6f4b9khSyx6r4GYsRk1zvSvPp2U5YTR2PpTKd
 iJd41906l/us5qN46u5Naud0axGegsSdm6b8P+tqYJzeDp+EiuhPbfcYGVk9qDTDlobO
 gi177TWGLjAjlmxh7WHB4r7TIRSPFzyGQWB9fAssl8bHlV6q0Nu91qm/69KANCBpSx+H
 wnrKmWR2x0ui7iTOaJSblkB7R5tu5lAk5o8fnWGCAj0UpNZNd7pcZpeIZwAw6hi41DXL
 jvmQ==
X-Gm-Message-State: AOAM531ry0lPDJU4MXt0/njeLhCGpJUXMlPfzehwKFTfcN9SCrlATOM3
 brH1liwB33v4IkR0yMJaOkanbg==
X-Google-Smtp-Source: ABdhPJzV5mAMw0Chw74QuBbK7VjG5+fdRDrKsbZ9gJq3se1DqnV7NsxS3r2pRzlrdUGECT8AxFS0lA==
X-Received: by 2002:a17:90a:f581:: with SMTP id
 ct1mr2948451pjb.116.1622054156098; 
 Wed, 26 May 2021 11:35:56 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 r11sm87021pgl.34.2021.05.26.11.35.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 11:35:55 -0700 (PDT)
Subject: Re: [RFC PATCH 01/15] accel/kvm: Add more stubs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517115525.1088693-1-f4bug@amsat.org>
 <20210517115525.1088693-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bea3644d-0b05-14d0-781a-5ed65ecb0484@linaro.org>
Date: Wed, 26 May 2021 11:35:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517115525.1088693-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 4:55 AM, Philippe Mathieu-Daudé wrote:
> To be able to make softmmu/cpus.c not target-specific, we need to
> add two more KVM stubs, to avoid:
> 
>    /usr/bin/ld: libcommon.fa.p/softmmu_cpus.c.o: in function `cpu_thread_is_idle':
>    softmmu/cpus.c:85: undefined reference to `kvm_halt_in_kernel_allowed'
>    /usr/bin/ld: libcommon.fa.p/softmmu_cpus.c.o: in function `cpu_check_are_resettable':
>    include/sysemu/hw_accel.h:28: undefined reference to `kvm_cpu_check_are_resettable'
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   accel/stubs/kvm-stub.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
> index 5b1d00a2224..6bda6c8c925 100644
> --- a/accel/stubs/kvm-stub.c
> +++ b/accel/stubs/kvm-stub.c
> @@ -20,6 +20,7 @@
>   KVMState *kvm_state;
>   bool kvm_kernel_irqchip;
>   bool kvm_async_interrupts_allowed;
> +bool kvm_halt_in_kernel_allowed;
>   bool kvm_eventfds_allowed;
>   bool kvm_irqfds_allowed;
>   bool kvm_resamplefds_allowed;
> @@ -147,4 +148,10 @@ bool kvm_arm_supports_user_irq(void)
>   {
>       return false;
>   }
> +
> +bool kvm_cpu_check_are_resettable(void)
> +{
> +    g_assert_not_reached();
> +}
> +

It should be easy to turn cpus_are_resettable into an AccelOpsClass hook.

It's less obvious how to do that for cpu_thread_is_idle, but it's clear with 
the kvm and whpx checks that something is required.


r~

