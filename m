Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D8B6437E6
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 23:19:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Jng-00086X-44; Mon, 05 Dec 2022 17:19:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2JnZ-00081Z-Bg
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 17:18:58 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2JnX-00037o-Ax
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 17:18:52 -0500
Received: by mail-wr1-x436.google.com with SMTP id h12so20926491wrv.10
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 14:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZmEj4204Rw5tFoFlIOISXYlcsxG5U/EeL1oTRN44YKA=;
 b=FPAGl81W2hqDmXXsHUAeZ/AIlLPoI0RfPjf78xeRTSKOyGTSd5mLFEE8DMqrAabkmX
 AiPfJj0pYO4P9U2cTXY/iRuE+D1HyeAmWQAFK5W4dDn6uKvn4Am5R/5eNyRrxp/ulQdz
 J4s1+GMHbuhxfRMV1ZWLt8H15DZ3TQB2FId1eNQuK5aOHhDwtTaby2/+Xy8MtRVsfdU2
 WKp2QUDu4i+lSMAiTSU7Qq/sc2wGOoqjxnRES8FO7IvmwHEJp9yPzrUy21KCrjQp3xFG
 oOvjbTReiLl9TEoYNU2YGZE6Jc2gtY9nBZFihRBvJKA0xmPvAaubcyema9mIsIGR6Lh1
 oJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZmEj4204Rw5tFoFlIOISXYlcsxG5U/EeL1oTRN44YKA=;
 b=Bk7CqJug3yqZVRKcVVLlE4ZPttEsfYpuNiV60dUkPNRezrHEIsDz0sjprGi1WEyybK
 ue2HVy6A9nI1CI6E+Am8/6BUwyPujPLBpOl/SuzrOnxhSCN5S3IA01/O0tYM15tgMgqa
 KwtYFrbhqNWrYSXuu/+gheI5F3pSeK+4nvTpH/Gmw1TbRiHEk/3UCSgQGIqFjjN0XgZN
 o0taCDKYdLYbbGQPEP9s18r4G8rOe2gnwrEQ465NhRSXj0MoVduFArdrH4UvgrWJQ7jI
 /27zM7q81qBXGcJqvYiRw5SwVag30qo9y6mv7UOUblpnWCMGBqOI5/OlGHY5Bm4fG2Ck
 7ffw==
X-Gm-Message-State: ANoB5pmFQlT+BToytIO6VJOJWM2ex3GdfrxFoUsxzXEpDQkWruEDAXCU
 tim3DCQpTeaB+gUzlzNdo6kcBQ==
X-Google-Smtp-Source: AA0mqf5W+kZt9KWFmUQjeX2dQZawgg+jCRHTCiwUl2fgduOonoFSzhjfBp5LdgM2JgwrfP8e4RfpDA==
X-Received: by 2002:a5d:6a06:0:b0:242:140d:43d5 with SMTP id
 m6-20020a5d6a06000000b00242140d43d5mr24755065wru.53.1670278729716; 
 Mon, 05 Dec 2022 14:18:49 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 16-20020a05600c22d000b003b497138093sm18678544wmg.47.2022.12.05.14.18.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 14:18:49 -0800 (PST)
Message-ID: <ba84971b-824b-380f-d798-757f27a7e9c3@linaro.org>
Date: Mon, 5 Dec 2022 23:18:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 14/21] i386/xen: implement HYPERVISOR_vcpu_op
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>
References: <20221205173137.607044-1-dwmw2@infradead.org>
 <20221205173137.607044-15-dwmw2@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221205173137.607044-15-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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

On 5/12/22 18:31, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> This is simply when guest tries to register a vcpu_info
> and since vcpu_info placement is optional in the minimum ABI
> therefore we can just fail with -ENOSYS
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/xen.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)

> +static int kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit,
> +                                 int cmd, uint64_t arg)
> +{
> +    switch (cmd) {
> +    case VCPUOP_register_vcpu_info: {
> +            /* no vcpu info placement for now */
> +            exit->u.hcall.result = -ENOSYS;
> +            return 0;
> +        }
> +    }

Can we log some trace-event or GUEST_ERROR?

> +    exit->u.hcall.result = -ENOSYS;
> +    return HCALL_ERR;
> +}

