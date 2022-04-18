Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDF3504B3F
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 05:17:47 +0200 (CEST)
Received: from localhost ([::1]:51618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngHta-0001bs-E8
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 23:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngHrh-0000pP-Ty
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 23:15:50 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:42806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngHrg-0002ip-46
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 23:15:49 -0400
Received: by mail-pl1-x633.google.com with SMTP id s17so518760plg.9
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 20:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qwu678HhalPuDY3Iuue0QQZiCeFyyFy2Xql+yWPbQW8=;
 b=V6C2yfvWntne+lda61Px2erhhZ8Uad56cLilgz9fxzg+b+wIdge6Js9l8NpwzqlLRK
 ZrIED4sm8lr8ZmjpfgxdIpvA//YUrBJecE8KsPPOmlvsQA9qP6nI8pwmJZkT7U2xq+3W
 xLeJ8Qiv7iTXIWnarBnAnBiQ5MrphlpHvTgfIwW4XuITyiyloQ3qxW8cn1WTHzI/gODa
 3JMx+Ke3rZNkd6boQF6aUi6Ig2Vf4OAb9ZaaUcwvrDBdn+jognhb0ZEjMqNE74FDANcf
 G1GC5hL6+9kWePQlsCGGZ79qk8ZaHxeIhj4Fb+Yf6Irn3n1IIbBpS1udFUFB8wU7MAEy
 viZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qwu678HhalPuDY3Iuue0QQZiCeFyyFy2Xql+yWPbQW8=;
 b=16MdlobvtPhoZoNRaP+AMWogvhkbT5MnxbdNbqMDkbvc1GnjbXy6UqHPODHFUPJN8s
 NWJvBgjMuSKy8ixXlprzc04LcrRndy+gTWbkll4LaM0nZsKs8yvaW7clCNC15gTmXNzw
 bp2Hs+GwrL7go969W37Ein/0bWuGx5J2LQFLfYulfq+IG22PPm79yeM8tLK1PAqiR5YH
 7ZG/a4gk0SeANoUCtzY3sOCXCpm2Dnfrf4NPrJIcDy/ps4h3WIFqjqPO5hNp0nl+mZeU
 Ovz6GFGlaULUV8NIcw6jzZhrnhKNw9gwx2CrbKxcJgfq1xVGGMTBrn0QWKvB1jwCv0Op
 0/DQ==
X-Gm-Message-State: AOAM530Pp0C8bp7SFb2W7JVkpLYFEUxqUnDcNWpyKjjI83nJnieD8PcB
 7cviFF1tp8gXV0EKn3wfvzqdAQ==
X-Google-Smtp-Source: ABdhPJxRsqU8ah3mlJiSa+p1Ao1t82gJ/vwlv+ITrIMorGJomFWVnlOHFiRrDbc0nd8PEurDqK1o1Q==
X-Received: by 2002:a17:90b:4f85:b0:1d2:828f:9860 with SMTP id
 qe5-20020a17090b4f8500b001d2828f9860mr5719942pjb.54.1650251746368; 
 Sun, 17 Apr 2022 20:15:46 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a62ed19000000b004f140515d56sm10176155pfh.46.2022.04.17.20.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Apr 2022 20:15:45 -0700 (PDT)
Message-ID: <832efe6e-f647-9691-202c-e8713caf97d5@linaro.org>
Date: Sun, 17 Apr 2022 20:15:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 33/43] hw/intc: Add LoongArch ls7a interrupt controller
 support(PCH-PIC)
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-34-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220415094058.3584233-34-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/22 02:40, Xiaojuan Yang wrote:
> +static void pch_pic_update_irq(LoongArchPCHPIC *s, uint32_t mask,
> +                               int level, int hi)
> +{
> +    uint32_t val, irq;
> +
> +    if (level == 1) {
> +        if (hi) {
> +            val = mask & s->intirr_hi & (~s->int_mask_hi);
> +            irq = find_first_bit((unsigned long *)&val, 32);

This does not work -- you're accessing beyond the end of the uint32_t for all LP64 hosts. 
  I think you just want ctz32()...


> +            if (irq != 32) {
> +                s->intisr_hi |= 1ULL << irq;
> +                qemu_set_irq(s->parent_irq[s->htmsi_vector[irq + 32]], 1);
> +            }

... which should in fact only be tested if val != 0, which is to what this IF equates.

Is there a good reason that this function is treating hi and lo separately, as opposed to 
simply doing all of the computation on uint64_t?


r~

