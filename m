Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AA36D793A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 12:04:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjzzS-0006yZ-8o; Wed, 05 Apr 2023 06:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjzzP-0006xn-L7
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:03:39 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjzzN-0001dl-Tf
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:03:39 -0400
Received: by mail-wr1-x434.google.com with SMTP id r29so35572343wra.13
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 03:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680689016;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qPGiYsKsF9XBHpZHSaehfUjdHj55ArKkkl5Mh728FTk=;
 b=qlk5EhXvVzCvvWSUiu3qmdkaf677tpVSe5Qcaq52Cu+aCIEZ5h8H6wmwb0rnz/yOzN
 r9Bdg2B4N/a/TpruwLlEvdWPdGNbqRuM1IVFsX+pD6W+314On/BtbLyui9NjneTzmhKn
 h4RcE/4rt1i7/9SGPst01Mwfy/m2y1yHEjwzemJfDVW2wnsOj+MAsf0mckTzQ+Fbwlpr
 9YyHbtIAZ6+othz0fZxTdBkqUneKS5D+qK6HuY3fw6TTUOjXU4xlf2t+SHitetq3g3Av
 0JEA0fMUcts0WCyy7pHRp2UBevGU1cAe7yzRh0nR75pu3ih4xNE3UfnWstbFZfF5XKEg
 ZXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680689016;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qPGiYsKsF9XBHpZHSaehfUjdHj55ArKkkl5Mh728FTk=;
 b=SdRUwQQ+g2zc9sfcWP9/4Az5ic2IsRemkNpwcbJNPlEhdkC0lfjTHZrXSxEf/yUDat
 qtiUbBcbrcjI5ZyjdzWouUxgOOBqTUElH/2Lwk85A6SDxQ9pV1JsvEBT6fyaYLhMPeHR
 cAsZqi2RNo0Bk/WF4grtPNfxVcwJyZkfORsVAuDu2DtRXJYRf6fjG042biTaxjyNxssy
 pWkH+DOFWJuE+2+jFJ7+JEl2Jb3j6NKU1R52QGKzEJAMXVeEVgelEMSh4WReDW1dF7Ma
 XhOSmS3pI2vVQDiG0tKYJt8OuHJxb/Xgtd7Iv224z/x+OMzJSWHTiCJy41I/zKz2jzqJ
 Hkng==
X-Gm-Message-State: AAQBX9dOZCkFR6bBTyf2atewLd3WQBp+wKYFvlT/d8eKj//9ex0vQVN5
 ocnJqPLXzmmaUVK8iZU87R6ABQ==
X-Google-Smtp-Source: AKy350aQUBvC2M9NhCRTbZ9/Q3Osr+DnJ9BpAh2NuONzKX985+X7H163FOr+LZ6xo9Jq69rFyP4gQg==
X-Received: by 2002:a5d:4a04:0:b0:2ce:a93d:41a7 with SMTP id
 m4-20020a5d4a04000000b002cea93d41a7mr3736642wrq.40.1680689016046; 
 Wed, 05 Apr 2023 03:03:36 -0700 (PDT)
Received: from [192.168.69.115] (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr.
 [176.184.52.81]) by smtp.gmail.com with ESMTPSA id
 x3-20020a5d4903000000b002cea8e3bd54sm14650863wrq.53.2023.04.05.03.03.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Apr 2023 03:03:35 -0700 (PDT)
Message-ID: <51212bc5-cbb7-4d24-f97f-8ad00dda42f2@linaro.org>
Date: Wed, 5 Apr 2023 12:03:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH] target/arm: Check if debug is already initialized
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230405070244.23464-1-akihiko.odaki@daynix.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230405070244.23464-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.925,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 5/4/23 09:02, Akihiko Odaki wrote:
> When virtualizing SMP system, kvm_arm_init_debug() will be called
> multiple times. Check if the debug feature is already initialized when the
> function is called; otherwise it will overwrite pointers to memory
> allocated with the previous call and leak it.
> 
> Fixes: e4482ab7e3 ("target-arm: kvm - add support for HW assisted debug")
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   target/arm/kvm64.c | 23 +++++++++++++++++------
>   1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 1197253d12..d2fce5e582 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -32,7 +32,11 @@
>   #include "hw/acpi/ghes.h"
>   #include "hw/arm/virt.h"
>   
> -static bool have_guest_debug;
> +static enum {
> +    GUEST_DEBUG_UNINITED,
> +    GUEST_DEBUG_INITED,
> +    GUEST_DEBUG_UNAVAILABLE,
> +} guest_debug;
>   
>   /*
>    * Although the ARM implementation of hardware assisted debugging
> @@ -84,8 +88,14 @@ GArray *hw_breakpoints, *hw_watchpoints;
>    */
>   static void kvm_arm_init_debug(CPUState *cs)
>   {
> -    have_guest_debug = kvm_check_extension(cs->kvm_state,
> -                                           KVM_CAP_SET_GUEST_DEBUG);

- Maybe we can merge kvm{,64}.c (see commit 82bf7ae84c
   "target/arm: Remove KVM support for 32-bit Arm hosts")

- Could kvm_arm_init_debug() belong to kvm_arch_init()?
   Then this patch / enum is not required.

- Why we keep a reference to the global kvm_state in CPUState is not
   clear to me.

