Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A24F734EC49
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 17:26:48 +0200 (CEST)
Received: from localhost ([::1]:38434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRGGV-0002hB-OD
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 11:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRGEA-0000jw-VG
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 11:24:22 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:36583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRGE5-0008Qp-Sl
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 11:24:22 -0400
Received: by mail-pf1-x433.google.com with SMTP id g15so12400502pfq.3
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 08:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=kKqKeJbVc+qM4PattL1DWYWfUBV3IFxCUlCgBl2m858=;
 b=CCT2RKXiKx4nRpz/Y5NqDqUmC/ufngbnIyVZ8LJ+GbcjsNDyxDcTmSO/Veo1JF6jeC
 1/mVz1paYcWXHJqAoOVBwcjSk9F/MTh7Dng6IL1/x611vRLD+kx1sUeWn8r9WBT9Eu9U
 mQK3RefR05JxdufLO6Kcjlvg45J6YkF8aZaV4SHlASXhT841xiUH/9LOGREYy0ctw2Nm
 5ALYp6V99/yQ1c+lT5Me9PIgiq7qpL0ytHsunACZJYyOhwJGFwFZ9ByLtbRP1+sViqIZ
 4e/PhokrjhdnOE4vpNkFgba9wtlnpKUq5111ORtrnvG7veBqQwmdztfLd0OOBe6r1Y+q
 N4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kKqKeJbVc+qM4PattL1DWYWfUBV3IFxCUlCgBl2m858=;
 b=d7LLtygAU4kQ9CK+JY7dMtauuKIEwC6sGEKhyww+c1sKa/RVTfj/IUl80eDb1svINb
 h28WuxVWg7jMh0FFbojfzB3TwCENkhN9DerEnduROL+FQGsyeB21miUBoS9Dh6PevR6y
 JSf4pLybHIcRy9KQkStJn5sCk7QtqstKvLn5uH4ndwi4iX84fyrULrLEARYk1VSUdlLi
 FVvqMQERzlEgaQ7o6hAO/87zhGIcK5WkJjOLCYss9AXP+DfIGjIICYPGa6SP5e+65P4G
 Is3ff35S/zBH/4S94zJewqYFsbCJ5BmRzmFhRNs6xoNY76XupRpCwUk7TmKCwSkqgP2N
 S84g==
X-Gm-Message-State: AOAM530hE1ZkmLtyN/zP2ESQR3OZtGnyzQ5a2oLe63VjFxKa1oUmOvsQ
 /YuqFBX9UoTWXUETtg+5Ql38ayKHwlf+OrbM
X-Google-Smtp-Source: ABdhPJyAkcEkK4INKIbKNXzWNZtBFNc2vVTwiZEf3jJozF4RqDjy2p/z6lpzbAIt/GVlcmZpZcQsVA==
X-Received: by 2002:aa7:990d:0:b029:21d:7aef:c545 with SMTP id
 z13-20020aa7990d0000b029021d7aefc545mr30141639pff.77.1617117856204; 
 Tue, 30 Mar 2021 08:24:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id s1sm3040619pju.7.2021.03.30.08.24.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 08:24:15 -0700 (PDT)
Subject: Re: [PATCH v1 1/6] tests/tcg: update the defaults for x86 compilers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210329110303.15235-1-alex.bennee@linaro.org>
 <20210329110303.15235-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7aaa1ca0-ba8f-a032-a619-3e03e47065bc@linaro.org>
Date: Tue, 30 Mar 2021 08:24:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210329110303.15235-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

On 3/29/21 5:02 AM, Alex Bennée wrote:
> You don't usually notice this is broken on developer system on x86 as
> we use the normal host compiler. However on other systems the -pc was
> extraneous. Also for 32 bit only i686 packages exist now so we should
> use those when available.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/tcg/configure.sh | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

