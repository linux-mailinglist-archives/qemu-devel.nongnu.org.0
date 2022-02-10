Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4CD4B1934
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 00:14:27 +0100 (CET)
Received: from localhost ([::1]:58558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIIdu-0005Sc-Jq
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 18:14:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIIbz-00042Z-Ki
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 18:12:27 -0500
Received: from [2607:f8b0:4864:20::430] (port=44723
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIIbx-0002LN-Ml
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 18:12:27 -0500
Received: by mail-pf1-x430.google.com with SMTP id y8so10274711pfa.11
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 15:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Htivp+qC7npXd3G722SJK/B5CRl7Ufa/Dq7/JlkctC0=;
 b=BPWtpL4tT1X5g4yaA2LDQegfiSqONPsLeHyDLq+uNv3AYNXFqk8RDXM9ptkRBAzXTG
 7jBMhUEi/f+oJyB4FDZCaEqQDW3AqO0/My/GIig8MHl3FC+V0Ztz2561bunRjeTwKZlW
 grU+MOvesGCoqGIRhV2U/d97vsjMt0o/NWwmr0Hypsp5aYtL+AD3ElV17pTOL61Y6zK2
 qN2wDtp/dk7iJob7xewKSTTAv0S0F+bCZLSO1KYtIkZZwW1KZbmGAu49Nm2lg2LFHT2R
 VEyLNGlH1fvq/EA/qPuYAr4SfnR5Fo7HBADQIpv/kTa1TNi9UKBqFt5ahgsYrNjrQ9LY
 bkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Htivp+qC7npXd3G722SJK/B5CRl7Ufa/Dq7/JlkctC0=;
 b=iY4KseE5qFpjb9eFU6yGB732o1sPOqZT9qhWbJwiO34JqdFDxbSjNywknjhOU/aQrw
 Ek95xJl3lwJxe6wsbmYeQXyYcu5kB8RZ2pl7ALhmJGALEpm5FBHSBM/kbRPhYYMnYa5B
 CnUtesV7wXKqAdZU13BACWiKUhH8REEj6YVfRcBdpbokGThCyOs+Q+3FU6LJyJAPqiGN
 AxfHoawN6fJh0Ts1W5TszDc2PtJCfFekZqugaLmez00uOyKn/93uGB4zYs3+6Tafb1b2
 FITcZbXytO3JBKwDH9evZaCxILgXmR8q0LeaTHJ0wIMcNVURerR2a3NScmryI26qQEPd
 qhJQ==
X-Gm-Message-State: AOAM5306tqW6yzIffOTVtzd0w1mJ6HamLyGSJ/wwahwfnxGOkluO4MKH
 +KXW5AXXid84skKE1uEiwKbNrg==
X-Google-Smtp-Source: ABdhPJwQifqR7tDObAQfCUGdft3FhiQ01pEJ1nawrWg7cGLuAvTdJQcSPcBkzlrFmXuA0AGPxW7cJg==
X-Received: by 2002:aa7:86d1:: with SMTP id h17mr9505465pfo.3.1644534744292;
 Thu, 10 Feb 2022 15:12:24 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id o8sm25034669pfu.52.2022.02.10.15.12.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 15:12:23 -0800 (PST)
Message-ID: <a05e0ef9-c5ba-0cce-3813-4e16546b3802@linaro.org>
Date: Fri, 11 Feb 2022 10:12:12 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/9] include: Move exec/user/ to user/
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220209230030.93987-1-f4bug@amsat.org>
 <20220209230030.93987-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220209230030.93987-4-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 10:00, Philippe Mathieu-Daudé wrote:
> Avoid spreading the headers in multiple directories,
> unify exec/user/ and user/.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   bsd-user/qemu.h                     | 4 ++--
>   include/exec/cpu-all.h              | 2 +-
>   include/{exec => }/user/abitypes.h  | 0
>   include/user/safe-syscall.h         | 6 +++---
>   include/{exec => }/user/thunk.h     | 2 +-
>   linux-user/qemu.h                   | 2 +-
>   linux-user/thunk.c                  | 2 +-
>   linux-user/user-internals.h         | 2 +-
>   scripts/coverity-scan/COMPONENTS.md | 2 +-
>   9 files changed, 11 insertions(+), 11 deletions(-)
>   rename include/{exec => }/user/abitypes.h (100%)
>   rename include/{exec => }/user/thunk.h (99%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Something I noticed in passing: abitypes.h doesn't need all of cpu.h, only cpu-param.h.


r~

