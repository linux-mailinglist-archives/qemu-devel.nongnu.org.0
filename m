Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC85534354
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 20:48:00 +0200 (CEST)
Received: from localhost ([::1]:48742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntw35-0006zm-74
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 14:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntw1D-0005X4-5N
 for qemu-devel@nongnu.org; Wed, 25 May 2022 14:46:03 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:36757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntw1A-0005j6-VE
 for qemu-devel@nongnu.org; Wed, 25 May 2022 14:46:02 -0400
Received: by mail-pf1-x436.google.com with SMTP id f21so7629052pfa.3
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 11:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IcIqUraCI1NPmU+tCziApz/bOxvyZa4HP/5o4vY+DjQ=;
 b=ONbP/RSA5dx+INjpInxpmNzjsjyvxuOpGxB7ztZW3I5SRUrhKfmWehAxSipIlOFPI5
 AuN/MEFZKoMpD/l2FcgFM2AXxJ1qh9q2pHNlfzifmHYvizdtTonaFopTtAplz/CQWRQQ
 i2J0oOLJM3NHNg6IpZeM3V9xP1qWj2cLyQW+JJlVSifhDXVLIiLF7e9QjfqeEfs+6+jI
 K9Sg6eQGVy+SCQaRA9OZQUnxUAzfnWZgIZPoMcPzMeeEmdCVcPA+aknUIADAy2bor/7G
 mODvVa97hYD11GdYoPN03DPXF2/WHuXEPs7/vfNFi3q7oFKj0Mxc1NG4BsInFYT6hPo/
 pUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IcIqUraCI1NPmU+tCziApz/bOxvyZa4HP/5o4vY+DjQ=;
 b=iWgBsLGBEO3UZUbfmofiubHmTXWpZsX+0cxkLrlcysvZDAlW+xoRq39LzSm1IDaIFF
 hE3WhTr+rZLXq9fAzfDEYKqGKKQYCs7eNHtFzQ0bcWAW2ErdKkJzaL/0db5JHyeRSe5+
 rAGgFzUST8Rwnso4ExGefSHTmbMIcr/tw3VdPnbMbihP2TrOd/BrNuwY7wYdM1h4ZLTo
 4q8HWLkdzBe39LY40RutKo2LgkIn/il7dKwtprbDTrxCwrMr7lgaLdB0nxru+WdTq4YR
 vlxOAAWQKEedvxabMBiJS7y7iGOEmNwmuX7bh8VEsnIv8RvVQ43QpUEivzqFbQfd1jBM
 Q+uQ==
X-Gm-Message-State: AOAM533rz1rcD0iEuBwp5y7+XO1qNBpma4tZ1ApV/LYFYtMt85yZ10dj
 IXz0H/AW/3jct2XfJAiBD2zWBw==
X-Google-Smtp-Source: ABdhPJzF5Ix/JnoKuwWyGwyVFMjkRVqJV+nW8A1XYpi2TAYlfNs9iyhztWi3ttTO63kYHufOBmq5Dg==
X-Received: by 2002:a05:6a00:138e:b0:518:86b6:5214 with SMTP id
 t14-20020a056a00138e00b0051886b65214mr22229740pfg.38.1653504359338; 
 Wed, 25 May 2022 11:45:59 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a170902e5cc00b00161a40b2135sm9758862plf.104.2022.05.25.11.45.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 11:45:58 -0700 (PDT)
Message-ID: <b864b8b9-e88f-788b-6011-abd2b750b949@linaro.org>
Date: Wed, 25 May 2022 11:45:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/arm/hvf: Include missing "cpregs.h"
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@fungible.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Duncan Bayne <duncan@bayne.id.au>
References: <20220525161926.34233-1-philmd@fungible.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220525161926.34233-1-philmd@fungible.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

On 5/25/22 09:19, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Fix when building HVF on macOS Aarch64:
> 
>    target/arm/hvf/hvf.c:586:15: error: unknown type name 'ARMCPRegInfo'; did you mean 'ARMCPUInfo'?
>            const ARMCPRegInfo *ri;
>                  ^~~~~~~~~~~~
>                  ARMCPUInfo
>    target/arm/cpu-qom.h:38:3: note: 'ARMCPUInfo' declared here
>    } ARMCPUInfo;
>      ^
>    target/arm/hvf/hvf.c:589:14: error: implicit declaration of function 'get_arm_cp_reginfo' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>            ri = get_arm_cp_reginfo(arm_cpu->cp_regs, key);
>                 ^
>    target/arm/hvf/hvf.c:589:12: warning: incompatible integer to pointer conversion assigning to 'const ARMCPUInfo *' (aka 'const struct ARMCPUInfo *') from 'int' [-Wint-conversion]
>            ri = get_arm_cp_reginfo(arm_cpu->cp_regs, key);
>               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    target/arm/hvf/hvf.c:591:26: error: no member named 'type' in 'struct ARMCPUInfo'
>                assert(!(ri->type & ARM_CP_NO_RAW));
>                         ~~  ^
>    /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/assert.h:99:25: note: expanded from macro 'assert'
>        (__builtin_expect(!(e), 0) ? __assert_rtn(__func__, __ASSERT_FILE_NAME, __LINE__, #e) : (void)0)
>                            ^
>    target/arm/hvf/hvf.c:591:33: error: use of undeclared identifier 'ARM_CP_NO_RAW'
>                assert(!(ri->type & ARM_CP_NO_RAW));
>                                    ^
>    1 warning and 4 errors generated.
> 
> Fixes: cf7c6d1004 ("target/arm: Split out cpregs.h")
> Reported-by: Duncan Bayne <duncan@bayne.id.au>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1029
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Oops, sorry about that.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

