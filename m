Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB3069225D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 16:36:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQVRF-0007Sp-Ll; Fri, 10 Feb 2023 10:35:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQVRC-0007SY-Ob
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:35:46 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQVRA-000529-Nm
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:35:46 -0500
Received: by mail-wm1-x331.google.com with SMTP id n13so4088035wmr.4
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 07:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jHgdmBRHVjGTYPD9Y0o8gLfGeHL7CZKVv4AeFHMIbvg=;
 b=oaQS9xmyOaAl0WW8px7NLNl5f89y1sXQEKGozrDyFvE+dFpqhZxIQH8bjXEeC9Bb3y
 /V9Io174rTldFCBnsAC0L5AcQADSdoHQJmJAOMJZW2tGE/2OG95zQJRIvaqYkXl+CpMB
 +F4Gn+heoet72CQKxZ7bTU4b+9X98Iqd0ws14ZSVUIj5z15QgSCWROHlkhxjxs+FZB9k
 jahLcCZvlRkIpljdJMrwPfucv+zwAjLJExAjz8H+AvYIrg948PseJwz48a0dYdZM9Z+2
 y8to9b+Y4ZQ+fEMus6dYmdyIVFN0UKDOd+VXgQKXYLPPY7ZnZ4iq8MCsGTepLqWNXF7C
 ZKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jHgdmBRHVjGTYPD9Y0o8gLfGeHL7CZKVv4AeFHMIbvg=;
 b=BCxIVh8hzDTmu3QZvTFnutlB72yrWIDOQdhxJNwcbdmgFVo6iHtsan+2niCtJFcnwU
 MukWRWw9UlS3+Xx228e1q6nyWe5KK6UdsouD8iV9M/ePI0JrOrJcrmcylOm5n/sO5VeI
 j8d3OytfLtaFfVvQDCvIaPXDglmWH/1ZRPbDQtNLSqvQJSXsv8uZm/u7ToRDaW6/YjqW
 lkuMRXaL3TNc1egOwD+DkHgyPau3T2wvrMocbUNiWvVvKKrSDYODjcX44zGLkMj/KekH
 PN9NQoQ1jZ3LjVoXA7hCLSZL2NYgd7VqsI4fJEMRxgk8YRfoe6riMvzGsTqkR3ZXrcyR
 hD8A==
X-Gm-Message-State: AO0yUKXg2Ezy7dZsoAFnpulXvNWY1hpXe+/W+D02pHYzFKR1H+ASYSnv
 I6LirPa5rY0Qf/Bbm5JZdO7LYQ==
X-Google-Smtp-Source: AK7set/PfKRHR4bUnjuF7p9kH9ZUIsiBWFPjzVbI20JAHIV4WIIdfkbn7ZK1GfKeC3HG6pLbV2/UgQ==
X-Received: by 2002:a05:600c:9a2:b0:3dc:576c:ab07 with SMTP id
 w34-20020a05600c09a200b003dc576cab07mr13088960wmp.14.1676043342728; 
 Fri, 10 Feb 2023 07:35:42 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l40-20020a05600c1d2800b003dd1b00bd9asm6263016wms.32.2023.02.10.07.35.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 07:35:42 -0800 (PST)
Message-ID: <957c3a01-a39e-f967-ac35-f73bb8e2063d@linaro.org>
Date: Fri, 10 Feb 2023 16:35:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: Byte-swapping issue on qemu-user for sparc64 guest
Content-Language: en-US
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
References: <d7002aa7ea4bc165e51b84fc5e591f03d8a9d29d.camel@physik.fu-berlin.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <d7002aa7ea4bc165e51b84fc5e591f03d8a9d29d.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 10/2/23 16:23, John Paul Adrian Glaubitz wrote:
> Hi!
> 
> There is an unaddressed issue in qemu-user [1] which results in getresuid()
> returning an incorrect UID due to a byte-swapping issue on sparc64.
> 
> This issue is fixed by the patch below which was suggested by Phillippe
> Mathieu-Daudé, but the corresponding line [2] has not been patched yet.
> 
> Could anyone step up and fix the bug?

Sorry Adrian, this is in my TODO list, but I couldn't find the time to
write a good commit description to this fix yet :~(

> Thanks,
> Adrian
> 
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index 77864de57f..4d4b4a22e8 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -61,7 +61,7 @@
>    
>    #if (defined(TARGET_I386) && defined(TARGET_ABI32)) \
>        || (defined(TARGET_ARM) && defined(TARGET_ABI32)) \
> -     || defined(TARGET_SPARC) \
> +     || (defined(TARGET_SPARC) && defined(TARGET_ABI32)) \
>        || defined(TARGET_M68K) || defined(TARGET_SH4) || defined(TARGET_CRIS)
>        /* 16 bit uid wrappers emulation */
>    #define USE_UID16
> 
>> [1] https://gitlab.com/qemu-project/qemu/-/issues/1394
>> [2] https://gitlab.com/qemu-project/qemu/-/blob/master/linux-user/syscall_defs.h#L64
> 


