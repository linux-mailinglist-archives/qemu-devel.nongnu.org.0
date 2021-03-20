Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67371342E35
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 17:13:20 +0100 (CET)
Received: from localhost ([::1]:58164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNeE3-0002Je-FB
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 12:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lNeCd-0001hK-Gy
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 12:11:51 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:38468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lNeCZ-00024d-EI
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 12:11:51 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 w21-20020a9d63950000b02901ce7b8c45b4so11545796otk.5
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 09:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=dpg3d2BFnCjaKCo2NJOCLfOA2/ap/GVXBNq5i9rifkM=;
 b=nhNJYivaqaE4+zoh3he3VKtZPW3VjsC6FuDRSmEET9wJ6mmK0i+3PIjVJCGARorV3R
 t9RmQE2NB/bfMJUJYRJ/PLSODbAwM9F1OrH+v+FM6dpbs25TJF7xmwTJQR1jJ2TPAZNH
 BkqyzI9kRoTK/hZOHJdf7YrhYjxrNZl6npBFy3nF2d4k61lk3RoEW3XMsP/9I/fLajdi
 Tk9ydqGiOvllhIXbXF5WZVaug0xRFz7I+yhHobt1S/auRf3DfAQgKqE5jyrWXT1UkkVL
 AwoxUfYUVYi4IBhRg9GzflM2IM2qAvmtLNH4u5mnmALwXpkyYdx+SnM4zcDbLFgkq6BK
 aDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dpg3d2BFnCjaKCo2NJOCLfOA2/ap/GVXBNq5i9rifkM=;
 b=BHL1Szahoiql/HVLS31BxoZ9o4LKp+SpJGJSZr+r0nZ0VXn4wJIpp9MTkeQ5PNNuj5
 kNm9G6Jwyugm6duBEvds2lsbyx0dV8nlMjEsgmNhyuHFIuvGwU2nSb6PnfJ2RS7slsNN
 sOoeMRFsJzqsKrH6PUkciaZR+8YKa1buX6a3XqQTZ4f2FvpWY89FnXIqVH4E6mKQGD3R
 tP1IOw79ltlld9tzpy3sQNUwryle1qsWc4qsDOswR5MVbq+9NvGY7jpqsBxdp/YvjUh8
 1u+3BUohO65vEvPl8KzjffHiKlAufmgEkj8KJP6nS/QxtiNPF0DF8LwmGBO0eoaLMFTa
 D3+g==
X-Gm-Message-State: AOAM532cLh6NLpLGA2CBaq5G7wS27pg+YkO41KHfBcjH0pm1CQbD9UXJ
 MOYQXrmSAzq5RFruoBrEIpZ7H6r2QDV452LB
X-Google-Smtp-Source: ABdhPJzjs2LNxmNLl1TENDMQq+LexDL4hFnt6WLSIWP4prZaMz0RArw4Knd/pFmwgPULCffxGNg8PA==
X-Received: by 2002:a9d:4584:: with SMTP id x4mr1700408ote.255.1616256703599; 
 Sat, 20 Mar 2021 09:11:43 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id w22sm336121oth.51.2021.03.20.09.11.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Mar 2021 09:11:43 -0700 (PDT)
Subject: Re: [PATCH v1 09/14] tests/tcg: add HeapInfo checking to semihosting
 test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210320133706.21475-1-alex.bennee@linaro.org>
 <20210320133706.21475-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b74d09e5-0e42-6705-0890-3b5df74e0509@linaro.org>
Date: Sat, 20 Mar 2021 10:11:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210320133706.21475-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/20/21 7:37 AM, Alex Bennée wrote:
> +    if (info.heap_base == NULL || info.heap_limit == NULL) {
> +        printf("null heap: %p -> %p\n", info.heap_base, info.heap_limit);
> +        exit(1);
> +    } else if (info.heap_base != NULL && info.heap_limit != NULL) {

Useless inversion of first test?

> +    if (info.stack_base == NULL) {
> +        printf("null stack: %p -> %p\n", info.stack_base, info.stack_limit);
> +        exit(3);
> +    } else if (info.stack_base != NULL && info.stack_limit != NULL) {

So... we're expecting stack_limit unset is valid?

Perhaps a check that stack and heap do not intersect?
Perhaps a check that &info is within the stack bounds?


r~

