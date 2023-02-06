Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDA768C0E3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 16:04:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP31U-0000q1-Ps; Mon, 06 Feb 2023 10:03:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP31L-0000or-U3
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:03:09 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP31K-0007IN-2O
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:03:03 -0500
Received: by mail-wm1-x333.google.com with SMTP id u10so5830058wmj.3
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 07:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q6q5Dnon0SlZrgp0JefJPRIHQyX3KYD+vmLlF+UXTlI=;
 b=wGGkG0N9tFHJFCgGyDKU/4M44spXMw53PGWlCq6nOCgLCRL6FnGszAERShYrN/Cc/f
 kunfuF6P5UacIjaLIS6BCgFNlrZycZujatxfmzVYOpAVJ3cLVCe9ASIQThnD6SMvYXGk
 QmwIfHL7uqtCKOA++AJ5Zp+ue0+NqS7SbX0i/gZAUHdrJ5RynYH6qQKorHEoEQZyzQOT
 aaZt5EoN5TvG4wknEHQLmvWtmG+lSN9Ptp6UH5BWpBomhuZmB3MBVI9KKZjShnHUw99l
 0WNFCpIFD4ARJzayVcLaN7GsAoqdX02z0G8ZXl48wBROBwSCfn/aFu7OXiJWsdwNObiJ
 elzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q6q5Dnon0SlZrgp0JefJPRIHQyX3KYD+vmLlF+UXTlI=;
 b=t0FyFItali6mxx0aezd+w1IsekUQvb81G80QcTVF10x6pv2IlQ1DF3l7X5Q7a+HGTk
 whVQ/MMg2fvtlLewMk5ipuxtBO2PF6/MWya3cWqqqtIl4An4e8iPpp/bXbHO1vjSuwqf
 bGWc/Q4fAh7TNNRVLQQYJ9ytzQsiqPUczhfz8EfqFKFI0BlWhlpGNnxBcQpiEhDSzt3B
 Ar2PeeWbp8Us4TySPFfldK/Lpbp1Pzh2cwO4GjWxB1V/mdmVflMHXdKO31NOlZxVajyL
 J8IDZ/RGHpKB18FeA1TTj+CX9s4of1S5J7ZP+z/NL4UCMrzv+miSW+kQbNIHJ1tNI5nK
 O+Fg==
X-Gm-Message-State: AO0yUKWZZkM0nZ7rQafNlqy6yrskS1fN4tppbr0wBi68cSs+JCYDLVE6
 b3g+kAy5uPtxyRDHDHEwLG/UcA==
X-Google-Smtp-Source: AK7set/eO7dX29btlMue0cA1esEKJZ55gpfVpHEBIKyI4nViwwjKDJHnzAeo3LT1PsrgSnTpiT/pmA==
X-Received: by 2002:a1c:f413:0:b0:3dd:b0b3:811b with SMTP id
 z19-20020a1cf413000000b003ddb0b3811bmr19590644wma.31.1675695780518; 
 Mon, 06 Feb 2023 07:03:00 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c190e00b003daf681d05dsm12224640wmq.26.2023.02.06.07.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 07:02:59 -0800 (PST)
Message-ID: <c75d2adc-f566-75bc-f3a1-71c5b1dd9245@linaro.org>
Date: Mon, 6 Feb 2023 16:02:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 01/10] vl.c: Do not add isa-parallel if it's not present
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230206140809.26028-1-farosas@suse.de>
 <20230206140809.26028-2-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230206140809.26028-2-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 6/2/23 15:08, Fabiano Rosas wrote:
> Currently the isa-parallel driver is always added by default
> regardless of the presence of the actual code in the build, which can
> lead to a crash:
> 
> qemu-system-i386: unknown type 'isa-parallel'
> Aborted (core dumped)
> 
> Check for the presence of the QOM class and do not include
> isa-parallel by default if it's not found.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   softmmu/vl.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 9177d95d4e..614e6cf66e 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -1269,7 +1269,8 @@ static void qemu_disable_default_devices(void)
>       if (!has_defaults || machine_class->no_serial) {
>           default_serial = 0;
>       }
> -    if (!has_defaults || machine_class->no_parallel) {
> +    if (!has_defaults || machine_class->no_parallel ||
> +        !object_class_by_name("isa-parallel")) {
>           default_parallel = 0;
>       }
>       if (!has_defaults || machine_class->no_floppy) {

How is isa-parallel different, why not the other defaults?

