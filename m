Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE5A55BC64
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 00:55:58 +0200 (CEST)
Received: from localhost ([::1]:35972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5xe8-00038k-Lw
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 18:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5xc7-0002Ac-Lt
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 18:53:51 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:38869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5xc3-00014X-Ga
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 18:53:49 -0400
Received: by mail-pl1-x633.google.com with SMTP id m14so9474218plg.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 15:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vYqXd79+V8jayTOkJhsqghC4+xfdJz7wmyDIIc9y5K8=;
 b=t46IGSRECvFJy+uZorMe0b7NFz6RJbmhJ4ZmU4Ct7K14I1Y1FK9LbmHyeyENi/Y8II
 Um/lHrN4wqn0TF3XkuXjcEFzQKu5ddRFWhNcCEhUhDaDnxUI1sL9YnRy4Asy1ZQoNvkj
 T8pjRx+7TMrW/TfkLBE/GetN4p/og1ardDO6E6XAF82FSyIkTlIa6FIa6/yPqDTi1ZY9
 eOqGYdJYmn17wRGC6MugWSCtIlgVmVF1wOEo76gX3X+Hpu+LF6ciGdI9yt/Knb+C9Qd2
 2z742wBZ+rUhG1U9SEXwk+jWZssYxSxMNCddXhID+Bbmt224VGcVZitLbKVwF/UynlVc
 c+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vYqXd79+V8jayTOkJhsqghC4+xfdJz7wmyDIIc9y5K8=;
 b=r5YT+6tKRVpPWnnI5WXiCd7mAGRM3Y6TKZF3gedur03kiffqWIJfED8DgxgBZUryW7
 kg27nw3E8CwIQ0na4SB7dExxqCZIkybkkHK18pHh0+m+XJ9hhc/FEzfy8iJNfcyPmwTL
 z7wFU5MYxWxUQ+PR4xS62QD2PvUV0jT5JNYiB5nQ06FwxD50yvm3WwlsB9ze9fBza+kx
 vl5khzw1RGIa9wg1lfjDVedeFwOP4f3Fw74jz+Ym+GYZ+4ZDw0T3MkJOlD/IfUcLrhYQ
 cnzP+4OzEyPsJKaBYnK63BbZp2ErwSVYJsFgglbrTt+cKg93RyYPRZb6tm3dQEqVx7qe
 AssQ==
X-Gm-Message-State: AJIora9i+sa9fiLj6k9UlTuhMrlEb9cYiT7YtN5hjHQ4xmegZT3JYn6A
 ujBB0BjBbr0Tis5K/sVmRlD7Fg==
X-Google-Smtp-Source: AGRyM1vRQne9lzGXHouOYNTLqG2ivn8OQnMRDdIyM2f8xlIF2+wFIyuDeCCwbeOk2+FMT1dzLj2VbQ==
X-Received: by 2002:a17:902:d502:b0:16a:797c:cfb1 with SMTP id
 b2-20020a170902d50200b0016a797ccfb1mr1765573plg.137.1656370425843; 
 Mon, 27 Jun 2022 15:53:45 -0700 (PDT)
Received: from [192.168.123.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 ip11-20020a17090b314b00b001ec84b0f199sm83181pjb.1.2022.06.27.15.53.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 15:53:45 -0700 (PDT)
Message-ID: <a1467ccb-e0a8-b908-dfa6-08ead6aa3633@linaro.org>
Date: Tue, 28 Jun 2022 04:23:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] target/arm: Fix qemu-system-arm handling of LPAE block
 descriptors for highmem
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: He Zhe <zhe.he@windriver.com>
References: <20220627134620.3190252-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220627134620.3190252-1-peter.maydell@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/27/22 19:16, Peter Maydell wrote:
> In commit 39a1fd25287f5d we fixed a bug in the handling of LPAE block
> descriptors where we weren't correctly zeroing out some RES0 bits.
> However this fix has a bug because the calculation of the mask is
> done at the wrong width: in
>    descaddr &= ~(page_size - 1);
> page_size is a target_ulong, so in the 'qemu-system-arm' binary it is
> only 32 bits, and the effect is that we always zero out the top 32
> bits of the calculated address.  Fix the calculation by forcing the
> mask to be calculated with the same type as descaddr.
> 
> This only affects 32-bit CPUs which support LPAE (e.g. cortex-a15)
> when used on board models which put RAM or devices above the 4GB
> mark and when the 'qemu-system-arm' executable is being used.
> It was also masked in 7.0 by the main bug reported in
> https://gitlab.com/qemu-project/qemu/-/issues/1078 where the
> virt board incorrectly does not enable 'highmem' for 32-bit CPUs.
> 
> The workaround is to use 'qemu-system-aarch64' with the same
> command line.
> 
> Reported-by: He Zhe <zhe.he@windriver.com>
> Fixes: 39a1fd25287f5de
> ("target/arm: Fix handling of LPAE block descriptors")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/ptw.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index da478104f05..e71fc1f4293 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -1257,7 +1257,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
>            * clear the lower bits here before ORing in the low vaddr bits.
>            */
>           page_size = (1ULL << ((stride * (4 - level)) + 3));
> -        descaddr &= ~(page_size - 1);
> +        descaddr &= ~(hwaddr)(page_size - 1);
>           descaddr |= (address & (page_size - 1));
>           /* Extract attributes from the descriptor */
>           attrs = extract64(descriptor, 2, 10)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

