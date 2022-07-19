Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE095793B3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 09:02:12 +0200 (CEST)
Received: from localhost ([::1]:45252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDhFD-0008HM-UB
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 03:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDhBY-0004lt-6P
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 02:58:24 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:45932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDhBW-0002DN-JX
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 02:58:23 -0400
Received: by mail-io1-xd35.google.com with SMTP id y2so11081802ior.12
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 23:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2sDFc44jkwXrS3IBUViKaRKV8KTEFCOxeI+EtWnkhvk=;
 b=bi8f9PQ+GD5ts56Tr+6iOipPsyy/hDB/JAJsCcrJ/3ydoCyXE21JAx7/yAIqQLlhPi
 Gozx6k+mDbfHfa8HdyUdZLWwl+eByZRayevJ1I4Icjnd1OG3zYdVB10ZLY+hJ5U+dFnM
 lpbFQc0q+pLGLI8x2MFMrX/5z4Br5UmpOcIZ2IVj/CtDaZmoOVGxd7GlRddtbGdfhKOw
 pRbBNsMf7nv1bsBIFOFwXKprmw9elf9l2PivknhQf1ZlBxhv3kV7c4qZVeCasYC/aCWt
 hUm5Fk4n7BgNjCEy8RDu9YUmnYwI91qp1B8OnXeCOJDg3XgICCvbTI0HsFUmrm+4FQA5
 5KMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2sDFc44jkwXrS3IBUViKaRKV8KTEFCOxeI+EtWnkhvk=;
 b=qQDmmIsIEJoRY5sA22EHzjGEEYFckfNjgGgGtk5QTimKGsK6e/XXj1/GY8tbjS64UL
 DkZXPNYzakUki+Sn8tziQW086RpB6vOCwiuAe0DpyUy4KCSO2HLSBKXluC88vqgDAw7B
 /AXuEdRQ2xe7OCaiIXNLjp0TZ14tbG7UE+y6xX3orLoIT5nukmWwyyNEHGxnII8KifqD
 8oMmAMItnhNI3alC8ZW37KrxTZ6cKtpCEmLq71RhHKBrhcbLVPQ0Qfs8ApicMdQY38T+
 RAqkUF5Y9D+PWWNmb1VbOfkSBic/CNvsuanVmshcEtMyNUEOKbvll9f8xC+bTHfFIUWC
 Ekcg==
X-Gm-Message-State: AJIora8Y77e6H67vIvRHR3LaOyEXfD7X9HSMNALsqrZThea1E7VBZx7M
 jTFd1Oyqb0AxDjNY3gY/lHVc+g==
X-Google-Smtp-Source: AGRyM1v7JNguV4DVKQub3led3FdbQd7IYnQ5sCJVB7zrIYpsAjcw3E86KkVjkC4O2rtjbPmek4YJMA==
X-Received: by 2002:a05:6602:150f:b0:669:3a9e:e1f3 with SMTP id
 g15-20020a056602150f00b006693a9ee1f3mr15082613iow.35.1658213901359; 
 Mon, 18 Jul 2022 23:58:21 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.139.163])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a02aa93000000b0033f3394cf9fsm6272631jai.6.2022.07.18.23.58.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 23:58:20 -0700 (PDT)
Message-ID: <8dcc0b6c-6a78-d98f-e9d1-9a7bf9983676@linaro.org>
Date: Tue, 19 Jul 2022 12:28:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 0/5] Fix LoongArch coverity error and cpu name bug
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220715060740.1500628-1-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220715060740.1500628-1-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/15/22 11:37, Xiaojuan Yang wrote:
> This series fix some coverity errors and loongarch_cpu_class_by_name function
> for LoongArch virt machine.
> 
> Only the loongarch_pch_pic patch(number 2/5) need to be reviewed in this v3
> verison, and other patches have been reviewed.
> 
> Changes for v3:
> 
> 1. In loongarch_pch_pic file, We should not use 'unsigned long'
>     type as argument when we use find_first_bit(), and we use
>     ctz64() to replace find_first_bit() to fix this bug.
> 2. It is not standard to use '1ULL << irq' to generate a irq mask.
>     So, we replace it with 'MAKE_64BIT_MASK(irq, 1)'.
> 3. Rewrite commit comments for op_helper patch(number 5/5).

Queued all of these, with fixes as described for patches 1 and 2.


r~

> 
> Changes for v2:
> 
> 1. Use MAKE_64BIT_MASK(shift, len) to replace 'xxx << shift'.
> 2. Use ARRAY_SIZE(arrqy) to get the array size.
> 3. Add the assertion that 'cpu_model' resolve to a class of the
>     appropriate type.
> 
> 
> Changes for v1:
> 
> 1. Fix coverity errors such as out-of-bounds, integer overflow,
>     cond_at_most, etc.
> 2. Fix loongarch_cpu_class_by_name function.
> 
> 
> Please help review
> Thanks.
> 
> Xiaojuan Yang (5):
>    target/loongarch/cpu: Fix cpu_class_by_name function
>    hw/intc/loongarch_pch_pic: Fix bugs for update_irq function
>    target/loongarch/cpu: Fix coverity errors about excp_names
>    target/loongarch/tlb_helper: Fix coverity integer overflow error
>    target/loongarch/op_helper: Fix coverity cond_at_most error
> 
>   hw/intc/loongarch_pch_pic.c   | 18 +++++++++++-------
>   target/loongarch/cpu.c        | 15 ++++++++-------
>   target/loongarch/op_helper.c  |  2 +-
>   target/loongarch/tlb_helper.c |  4 ++--
>   4 files changed, 22 insertions(+), 17 deletions(-)
> 


