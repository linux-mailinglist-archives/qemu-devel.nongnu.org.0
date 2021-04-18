Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56378363799
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 22:47:20 +0200 (CEST)
Received: from localhost ([::1]:55850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYEK7-0006TJ-FR
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 16:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYEHI-0005I8-4K
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 16:44:24 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:33364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYEHB-0006op-Ad
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 16:44:23 -0400
Received: by mail-qk1-x730.google.com with SMTP id o5so34086878qkb.0
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 13:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7tZ6TbFzAEb4FUVgltCUOwntWNzcFRtHEuhR5TbROHM=;
 b=Q6iUotcDS5GbLTQfWdCt7DuNzB93bl12vTvsv5m4U+SgvzrI/cx+pYV7R2Wq0lAsBE
 cXgowtqktIc2Wo4iN3QftEvSkOO0UrfK9cWhZMMV5bm79gv7OYwkuw1w+wbFt+k5ORZ9
 WJL+E2osgjQH6eqh4FixUZBxBaE1D2eqqCs1mq86XhG0ntxKT274YcBhHVo5ZOzPwjot
 dT9kbHVG+z98Nj0GyIN/uj5ig2BfhaGunfCuIOmhqbOfD6Idv2ktGffTuz2p6BLCI9lq
 hSaJ0TUdy/IN5zJBYvD0Irzh1ljM80U+FBuNtVr532D5cAmkipVrEc34ej6C2j+RMLVy
 tOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7tZ6TbFzAEb4FUVgltCUOwntWNzcFRtHEuhR5TbROHM=;
 b=A9f1Hu7Qpi7WeBSwWwOgCwlzVSTvFV7M4SxYuBn/1F/PyeEXJ8DjaH21Z61vu48Ddk
 mwRiK0I+b4yW0nP7G/Rj49+wJ9gq/MuxzAycT1CStMNvUsKWM0tHDW0inX59ozQlEntP
 y3PLz65E7E9oi8MaGfpFN4He7648ieM6MRWnXPJt11nyoAaExFZeUfFAg2YEDTEPSOrB
 FvAQqLU3syG6rzbmMlO/6sXHeDw5zV6LmIJo5fAq2r9VGBfexZ/dwen/R6GnPDmRqwBM
 LH72vnJ4wAvL4OC/0MOblhQDnwVGG8Vpk/kq5gk/h9xq+dRXmlXmuT1IFec3bwZ8DDwS
 H5bA==
X-Gm-Message-State: AOAM533+rJI5eO/MWheFG9/OZMmgugBo7DZyMyQ/zoL2KTKF+3zB72WS
 DO8FLmKsFOwZNl6xDvLfwie4Hg==
X-Google-Smtp-Source: ABdhPJz+lpqSFP/bC0P1dcgwgKEazN9Jukrwj5RF43b+pqQlyNl/+OhuIaZ/k5zpE/0zaqVpYm6qmw==
X-Received: by 2002:a05:620a:12ab:: with SMTP id
 x11mr8992625qki.294.1618778655042; 
 Sun, 18 Apr 2021 13:44:15 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id c23sm679297qtq.97.2021.04.18.13.44.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 13:44:14 -0700 (PDT)
Subject: Re: [PATCH 10/26] target/mips: Add simple user-mode
 mips_cpu_tlb_fill()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-11-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c3f35c90-35e6-dac2-2ce5-3000a1e4d2f2@linaro.org>
Date: Sun, 18 Apr 2021 13:44:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210418163134.1133100-11-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x730.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 9:31 AM, Philippe Mathieu-Daudé wrote:
> tlb_helper.c's #ifdef'ry hides a quite simple user-mode
> implementation of mips_cpu_tlb_fill().
> 
> Copy the user-mode implementation (without #ifdef'ry) to
> tcg/user/helper.c and simplify tlb_helper.c's #ifdef'ry.
> 
> This will allow us to restrict tlb_helper.c to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/user/helper.c | 36 +++++++++++++++++++++++++++++++++++
>   target/mips/tlb_helper.c      | 10 ----------
>   2 files changed, 36 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

