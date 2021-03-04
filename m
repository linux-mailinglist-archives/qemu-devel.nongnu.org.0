Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A55432D988
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 19:41:49 +0100 (CET)
Received: from localhost ([::1]:49004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHsux-0001Jr-Q5
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 13:41:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHsrx-0000ZZ-75
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 13:38:41 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:34853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHsrt-0005NB-JW
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 13:38:40 -0500
Received: by mail-pj1-x1029.google.com with SMTP id h13so1173653pjt.0
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 10:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=7CkzNXuEbYSGkJDtStWbiEBKR2nqWeCAE3VHI6OZ4Ek=;
 b=TYZ1/vfJmw4AmcNfjpcaPKI0pyTLQrZuXBK04VavbskmKIqzVbFnbSaauEP+FVOafd
 zw7F5mU5mpe+tGfnP/NBEcz02dEEeBTaT1qU8k6X8/7TAdxpQV/Obkep8OlE6KyAP8sw
 DqVeBnnUBYEw8vSyRv36vQe0rMzv1n4NfWaUYd5QOPiP7PuzHTl8QPf95XndZ5h/PTe2
 q5IvZbC8jJqyRIGarlBo7E6EmvzSqhOvJcMaisxPl5wXZO84GlGNT56p0sFqhr5EY2fK
 l4L5gtX38GmZ4UYB+4h0vMN06W9+xyWUqUFHw3A+kKro3e5uM8SMClal4lSickEOkiTj
 r1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7CkzNXuEbYSGkJDtStWbiEBKR2nqWeCAE3VHI6OZ4Ek=;
 b=D3nC+P1mdiAAGRk8iszw2DflvxPBuzKedF+97NwgPKWbbkL0fV0KMWtyKyPTTIDbIr
 bDvIh+OsiRSlwESAkt1GXHL/xDNmLMKSgzRSV7+5WYOghvug1knpNs/wx2k6Z1RUuVs4
 6PiXI7WXb9g9Wt5qfIypg0O5BvnAC0gRNemH3AMkpj6dwWb5/Zr8L61yxA7bQBuzK3yO
 izmL1FrgtfKgkIqjvMMDGvvZkoqoPltRPBrS2537Fzup8jtxNRVemeaoq9BiUQo4Zs3n
 fwjUNDeKekoAlXkawGn6J9c2hSoRP1w4bWaYyntlimzmCZ7DcfDoTz8arwm/iwuWySkY
 qrdQ==
X-Gm-Message-State: AOAM533M0kVY/Xv+ehTkRndtLzeVEmd0j3++fren89fu6qC8AqxJoabQ
 VCh4F9kwT9Hiu/ia10zNtzK/zHSf9VOlGA==
X-Google-Smtp-Source: ABdhPJxJCcoS0MyGSsfq7cPfmJjEhIgHRvrgtc/Ep0ABNlTYVxJ0hHQLUW+SpxgOudHX9H/vfCoGCg==
X-Received: by 2002:a17:90a:9748:: with SMTP id
 i8mr5037460pjw.145.1614883115345; 
 Thu, 04 Mar 2021 10:38:35 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id z10sm16816pjn.11.2021.03.04.10.38.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 10:38:34 -0800 (PST)
Subject: Re: [PATCH 11/44] hw/timer/sse-counter: Model the SSE Subsystem
 System Counter
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <abd5bdd0-2bbf-f230-8c84-02b85ba03491@linaro.org>
Date: Thu, 4 Mar 2021 10:38:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

On 2/19/21 6:45 AM, Peter Maydell wrote:
> The SSE-300 includes a counter module; implement a model of it.
> 
> This counter is documented in the SSE-123 Example Subsystem
> Technical Reference Manual:
>   https://developer.arm.com/documentation/101370/latest/
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

