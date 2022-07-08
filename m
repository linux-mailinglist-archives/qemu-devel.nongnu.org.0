Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD8656BBE7
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 16:44:43 +0200 (CEST)
Received: from localhost ([::1]:58456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9pDm-00068a-D8
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 10:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pCA-0005EG-8y
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 10:43:03 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:33745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pC7-0002Z3-N7
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 10:43:01 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 72so1034703pge.0
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 07:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZPbrArNFZ/rWeA8x7cl5tNZ595+1bD1UnZfj1X9XxkA=;
 b=XzIE5gqayEQOT+n4vcOqBRkm488gYNyZCAsBYo7ua49q4UZ9KXeVv69h2jbMDLtCvS
 wqmUnkzPzLjn1Gqus6eGIglSLfGtpR5sH/w1jdOFt7zvxFabDOQIuGXIPPGhB4N5zUG/
 sOBNB5f6kea1tLjBSiILLdakELgvl7QPC5n8RYFXhueLdpy339tsEc/6k/0OaXnM3bxg
 pXbecybgtDRWnCZpFWNR93Nh0EC42ChLxMg1OpD+lfBpshAnY1583s0GbqBk5rczN6jQ
 xG3jidQr1mPIP1QuhcwXXLt+XItfoN5CPjxJGv/LD9SQN3QkxNXkUP4yRk727AjIWwbH
 ilUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZPbrArNFZ/rWeA8x7cl5tNZ595+1bD1UnZfj1X9XxkA=;
 b=3DRZntbocagPhf2kGFqefPtNAqBoMuFw9FMu3sJdpse2chLE/ggmMhhxPcKuAUDD+4
 MStUpqaYZe5WvuFlphnKBIx+izN2+2QRKqMRbQfwAoCLmI5515tGSz9DfYaVvVm2d2dr
 VxrAAY017NnSdErkClhxevjSP+3tBreYjf2kCZ9HCZe0jf9t9xGnzJjrWKUFGUSrRPa1
 5ZPfReqeTYmbHkDmwKQBDqNC7TEwXWrKml1MVkXT4RCaxs00oebPQgUm/d7nmV/y9m+V
 2FONrX8nA9isNvCDbAvrwsFm1tKyhzjHQoEkxOJLUCl2/6VhWOxuryiccf14ykZjMALh
 xP3g==
X-Gm-Message-State: AJIora+YiOh35Yz+fJdYn3cqCADHjIM/tyP5hcVvYaiNsSjecBSvxldY
 MtiRzL8neEOjMqFVempUsoezXw==
X-Google-Smtp-Source: AGRyM1tqcNAd4JatcCA4KM2MV/AehuRgKnKvr15khzpnKvkQ6wtcWfW8YbMbEGZMeou+ksehfzghKg==
X-Received: by 2002:a63:4604:0:b0:40d:a0ec:5dc4 with SMTP id
 t4-20020a634604000000b0040da0ec5dc4mr3693668pga.510.1657291378038; 
 Fri, 08 Jul 2022 07:42:58 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a170903230200b0016b90620910sm22677315plh.71.2022.07.08.07.42.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 07:42:57 -0700 (PDT)
Message-ID: <83f71b37-848b-ad6f-d51f-b3d6e0d4cf24@linaro.org>
Date: Fri, 8 Jul 2022 20:12:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 25/45] target/arm: Implement BFMOPA, BFMOPS
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
 <20220706082411.1664825-26-richard.henderson@linaro.org>
 <CAFEAcA8Ou2N9qJyvSy2wkpGtguCjJrA9YWoio4jsrv5VrNE3VQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8Ou2N9qJyvSy2wkpGtguCjJrA9YWoio4jsrv5VrNE3VQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 7/7/22 15:12, Peter Maydell wrote:
>> +static inline uint32_t f16mop_adj_pair(uint32_t pair, uint32_t pg, uint32_t neg)
>> +{
>> +    pair ^= neg;
> 
> You seem to be negating element 1 of row and col ('neg' here is
> 1 << 15 unless I've misread something, and it gets passed to
> the calls for both the row and column data), but the pseudocode
> says we want to negate element 0 and element 1 of row, and not
> negate the col elements.

Yep, thanks.

>> +    if (!(pg & 1)) {
>> +        pair &= 0xffff0000u;
>> +    }
>> +    if (!(pg & 4)) {
>> +        pair &= 0x0000ffffu;
>> +    }
> 
> The pseudocode sets the element to 0 if it is not
> predicated, and then applies the negation second.

Yes.  However, the negation is predicated too -- the squashed FPZero is never negated.  I 
found it simpler to unconditionally negate and then conditionally squash to zero.

>> +            uint32_t n = *(uint32_t *)(vzn + row);
> 
> More missing H macros ?

Yep.

>> +                    if ((pa & 0b0101) == 0b0101 || (pb & 0b0101) == 0b0101) {
> 
> The pseudocode test for "do we do anything" is
>   (prow_0 && pcol_0) || (prow_1 && pcol_1)
> 
> but isn't this C expression doing
>   (prow_0 && prow_1) || (pcol_0 && pcol_1) ?

Yep, thanks.


r~

