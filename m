Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 257E16504C5
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 22:23:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p716G-0003Y1-1U; Sun, 18 Dec 2022 16:21:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p716D-0003UU-Pp
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 16:21:33 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p716C-0002gX-BD
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 16:21:33 -0500
Received: by mail-ed1-x532.google.com with SMTP id c17so10452654edj.13
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 13:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cagov++s+a3IBQIx8UtomHcylzhAazeB7wD1q4zBsAw=;
 b=t5YCbn8TQxrAloK6WgqpHaUsv/+uMbA43YP6TDdJjkWFrLw/7yVylCHNjBHsTbTs7s
 S2F7OjQ+/hnC6MNImaAFEnZlczvRIsB65G0hJkdqLlD5lOxqtHzTJDN4RIjPRFdIggld
 2wS+BsFCyqyjvhAuEwoKfQG5UgiB91Yn0uWvr/P1nJ0Ykpmoycd19xbrh2yVXAEyYMyX
 eaWMu/NpyemX/61O/gRVBMOqnYe8zbKcq7JAFdY0brrX2XN9PVpvu1DOi0IGBezRVzht
 ptsoVegCY3b4xad8FTp2go9NuBVSxrQdvHl8FHyEHtQd6ISbG1qXiH3ESWKPWzKzSNv9
 JOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cagov++s+a3IBQIx8UtomHcylzhAazeB7wD1q4zBsAw=;
 b=qQ2emHKUmC/k2diCbncwFc8KI7A+/U0l3hrXmy9enPlNJAxJWfqz3AHXWNypgb0zgL
 75r7PhITjTiaNL5XsNenwvYLKX6JYyBCEfResc7/1ss07DrkO938y8kUs+ZcOtQVnEwR
 Q/SHt/A7z6MGLrNLdCQaJs8dKemRExmauq1A3XWyDkMPtl70Yy5VbKZn5YzXw1MeU9En
 UpyrBXNNB+8W3EgD876ftzBjxVLpbuhf6WRRxMFZl99V68pJq6bYa6o1MuTihRppBcwD
 +EsMyTd+1DzZK1jJxIOGNp9RXcIRWiW22rI/JRUjxb6uWYVFKd0z5IEzyxyFymPBk5fX
 K5Fg==
X-Gm-Message-State: ANoB5pkK8BrLQ6BeBsrmVoih8KBzdahYMVeU98Qi25e6jYP+5r2MUjMe
 6WVsREuqdzrLUcDNEugfKOYnToEpbKDofZwJOew=
X-Google-Smtp-Source: AA0mqf5r9MTANTN7LF+EKDZ+pI6rhqixhOVuiMyStfKlSBiuIpov1P3+eZMYT7SGgELNxa8I1GCqSw==
X-Received: by 2002:aa7:c944:0:b0:45c:834b:f28c with SMTP id
 h4-20020aa7c944000000b0045c834bf28cmr30447568edt.9.1671398490868; 
 Sun, 18 Dec 2022 13:21:30 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a056402180900b004781169b0desm2125774edy.51.2022.12.18.13.21.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 13:21:30 -0800 (PST)
Message-ID: <c2b1e948-524e-ada0-b7de-565322fd9f6b@linaro.org>
Date: Sun, 18 Dec 2022 22:21:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v4 26/27] tcg/aarch64: Merge tcg_out_callr into
 tcg_out_call
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221213212541.1820840-1-richard.henderson@linaro.org>
 <20221213212541.1820840-27-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221213212541.1820840-27-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
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

On 13/12/22 22:25, Richard Henderson wrote:
> There is only one use, and BLR is perhaps even more
> self-documentary than CALLR.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/aarch64/tcg-target.c.inc | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


