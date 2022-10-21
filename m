Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5659C6073B1
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:14:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olo77-0001UW-Ac
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:14:49 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olo48-0008DB-E2
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olo3a-0007Mf-Cl
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:11:16 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olo3Y-0002fJ-Dp
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:11:09 -0400
Received: by mail-wr1-x42d.google.com with SMTP id j7so3885953wrr.3
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 02:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6TIFrpGKLWJyV9aOfW5LxnL1Omh/kE372hyN6eDy0f4=;
 b=cC6hUvbcHZlYOJDSHAaA+jG0wa2Ihe5eMh3vEtk6OLPgILTIuXEQRIy/va99Qpxr/B
 cbDecmoH1r99xyOOmqjp+5oAfjNmxIFWwDsP/yjAuKAX6SfT8MKIapcEvrcTz0HPWjcz
 MrIhsnsVr6Hc5O9bMMdIBGMFEcOWq7Jw5GigIYSOixXsFLGHPyUTbEos5jB/qS2wauzz
 yiFU3VdbF8ECB62EuuOIC/98YYuF3MF0nNitK/ubnLDnYSGXC5r1+Kfhw3t5dyhlcEj5
 juml3HhoP2XyojcR3YkUz1ln0bXNhnAaUd82drq6NBW9EINR/mTlO7laCMdolljjV0Hp
 bykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6TIFrpGKLWJyV9aOfW5LxnL1Omh/kE372hyN6eDy0f4=;
 b=M2f3yI9O1ZksaVD1WkTLEc9VABrgLDCEk+AaVpbP7Ri8ge0zFtnTvCbZyPCPvPdp81
 eiGqskmz3c/loIHLjc6GhdnnTaeosk1idMMwJpvXVGY8Zl5/hgwdReqAk+zgA/OyZ/r9
 yVJBaO1doG+KOgj0RRZ+rhNp7RHZHLxDWswt989aNQO5n+FVCVnAoZ1immQc5VgqKWdU
 BJwthmBQUrxLEAz7bIyQxzetuEIu9ccWescodmxZ6HvB2hzVAsCa8Ln3HskZvzyxo7TH
 xvbMeXc240Ajhb2TpEEpJlg8y27cAeSSNRiripb5HrtNxHactloxoJPf2XbjGanOr+aE
 xJ5A==
X-Gm-Message-State: ACrzQf1qVjcFEfoKrOuWIiirhrEOdPFdJitHkKl2ekyX9ydz9fdqFJFs
 +w406vPKp7AoTbxN04DAxSUTDA==
X-Google-Smtp-Source: AMsMyM5d5xWcioCS5nTq9OCICLmjq5z8xp3G2DuP+ootyN3HV+aPaEreYeJJxueWgz+K4GBTCgADXA==
X-Received: by 2002:a5d:6dcd:0:b0:235:f087:fec2 with SMTP id
 d13-20020a5d6dcd000000b00235f087fec2mr4727573wrz.444.1666343466511; 
 Fri, 21 Oct 2022 02:11:06 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c310600b003a6a3595edasm2026734wmo.27.2022.10.21.02.11.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 02:11:05 -0700 (PDT)
Message-ID: <9e356cfc-5532-2ef5-8356-fdde1033d398@linaro.org>
Date: Fri, 21 Oct 2022 11:11:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v8 2/2] hw/intc: Fix LoongArch extioi coreisr accessing
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 f4bug@amsat.org
References: <20221021015307.2570844-1-yangxiaojuan@loongson.cn>
 <20221021015307.2570844-3-yangxiaojuan@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221021015307.2570844-3-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

On 21/10/22 03:53, Xiaojuan Yang wrote:
> 1. When cpu read or write extioi COREISR reg, it should access
> the reg belonged to itself, so the cpu index of 's->coreisr'
> is current cpu number. Using MemTxAttrs' requester_id to get
> the cpu index.
> 2. it need not to mask 0x1f when calculate the coreisr array index.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   hw/intc/loongarch_extioi.c      | 10 ++++++----
>   target/loongarch/iocsr_helper.c | 19 +++++++++++--------
>   2 files changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/intc/loongarch_extioi.c b/hw/intc/loongarch_extioi.c
> index 72f4b0cde5..4b8ec3f28a 100644
> --- a/hw/intc/loongarch_extioi.c
> +++ b/hw/intc/loongarch_extioi.c
> @@ -93,8 +93,9 @@ static MemTxResult extioi_readw(void *opaque, hwaddr addr, uint64_t *data,
>           *data = s->bounce[index];
>           break;
>       case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
> -        index = ((offset - EXTIOI_COREISR_START) & 0x1f) >> 2;
> -        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
> +        index = (offset - EXTIOI_COREISR_START) >> 2;
> +        /* using attrs to get current cpu index */
> +        cpu = attrs.requester_id;
>           *data = s->coreisr[cpu][index];
>           break;
>       case EXTIOI_COREMAP_START ... EXTIOI_COREMAP_END - 1:
> @@ -185,8 +186,9 @@ static MemTxResult extioi_writew(void *opaque, hwaddr addr,
>           s->bounce[index] = val;
>           break;
>       case EXTIOI_COREISR_START ... EXTIOI_COREISR_END - 1:
> -        index = ((offset - EXTIOI_COREISR_START) & 0x1f) >> 2;
> -        cpu = ((offset - EXTIOI_COREISR_START) >> 8) & 0x3;
> +        index = (offset - EXTIOI_COREISR_START) >> 2;
> +        /* using attrs to get current cpu index */
> +        cpu = attrs.requester_id;
>           old_data = s->coreisr[cpu][index];
>           s->coreisr[cpu][index] = old_data & ~val;
>           /* write 1 to clear interrrupt */
> diff --git a/target/loongarch/iocsr_helper.c b/target/loongarch/iocsr_helper.c
> index 0e9c537dc7..505853e17b 100644
> --- a/target/loongarch/iocsr_helper.c
> +++ b/target/loongarch/iocsr_helper.c
> @@ -14,54 +14,57 @@
>   #include "exec/cpu_ldst.h"
>   #include "tcg/tcg-ldst.h"
>   
> +#define GET_MEMTXATTRS(cas) \
> +        ((MemTxAttrs){.requester_id = env_cpu(cas)->cpu_index})

The suggestion from v7 is incomplete, I apologize for missing it.

#define GET_MEMTXATTRS(cas) ((MemTxAttrs) {\
                                .requester_type = MTRT_CPU,\
                                .requester_id = env_cpu(cas)->cpu_index,\
                             })

Also see from v6, add in the read/write handlers:

             assert(attrs.requester_type == MTRT_CPU);

https://lore.kernel.org/qemu-devel/f7c4f7ca-cbf9-87d6-4d8c-5957c36ae23c@linaro.org/

Regards,

Phil.



