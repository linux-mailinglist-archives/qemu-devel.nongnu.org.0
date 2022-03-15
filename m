Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EF94D9284
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 03:17:19 +0100 (CET)
Received: from localhost ([::1]:43294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTwkQ-00033F-8S
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 22:17:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTwi4-0001em-TO
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 22:14:52 -0400
Received: from [2607:f8b0:4864:20::42a] (port=38431
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTwi2-0001eV-Pv
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 22:14:52 -0400
Received: by mail-pf1-x42a.google.com with SMTP id f8so17220394pfj.5
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 19:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hfVveEV5maIh1kzEXSmiBtku/9rh0RyDoCowTXu9vKc=;
 b=DLkyAEs1bhtUg+i3NKeOR+jADehPdzisB2sz3uQ0Y0p5W8ab3ZoiMqyjwALotD3ArV
 wslsuBPd4QdamDuZjlIgSLWbwWfvi+L2M73QBj+DRI/yLFOQAaI6sffQPwAM4s3jncvz
 VjjGEvLWSfltCaYguBlYmiiZQLhHSd/WkB9U7UiTiUKLUnowpiqB/LS50v0A9MjiaOMk
 DSbKF4qVaZsDrY3Te5EJGNX0WrrNwvZiPbSQgk1XPMdR/YBFdird+Sdw5UJxb55qZh82
 wUhQjeCnB4ydSCLYxSQCUnz8K1SodF9STpEgZXwaIyU4WyY23JeKHvsPI4UYw+xFaZwB
 MgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hfVveEV5maIh1kzEXSmiBtku/9rh0RyDoCowTXu9vKc=;
 b=DcFJXOu+qPESZ1z2NybHKMfysz+5rIpCiNz42d/mjS/bIWCffjWCBLAg+P2iGd2B8F
 ixeqUmG0dEGxAfADRu4GJgi5LAQAd2TX0AloiEOyIyR10jUdkGgVb0hZOoE6t1jC2OtC
 Xi44V+FzfWH5IdoCLLtN+ir/s7w0ZvQSlIFwBUJcwto5q4KPE1dBSzEuO8YNw9s/EitZ
 kA9ZOAskBJlRKdzPN+tb0x/4yxrMWx6c+saCkmbFxZ76ZojmjrP4Cy3AOHKNmY6LWB2t
 4Euu1pUZjHDnuTLdMZsA0Rsqnh6741pSXW1qBxEes3vOjcoctc1gSdQc1sU7wkN5gdlp
 VVFw==
X-Gm-Message-State: AOAM5301tkMRyzC+1ZYe0AMvZXQ0XATy7Mm2MSEdg1w9p5XEEJzcJ9Z9
 BYg3GQhV0XowOHxvcuio0O2nnA==
X-Google-Smtp-Source: ABdhPJwHhge8FccAS91o2pAbcdju57szkMeE6R1uTiTQ8KnD+aX9x5KiC386OZoVpoE47wM1gQqAug==
X-Received: by 2002:a63:4560:0:b0:370:1f21:36b8 with SMTP id
 u32-20020a634560000000b003701f2136b8mr21883283pgk.181.1647310489582; 
 Mon, 14 Mar 2022 19:14:49 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a056a0015c500b004f7988f16c3sm12964722pfu.30.2022.03.14.19.14.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 19:14:49 -0700 (PDT)
Message-ID: <71be7777-9888-18fd-bdd0-3cef3ada8728@linaro.org>
Date: Mon, 14 Mar 2022 19:14:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4] ppc64: Avoid pt_regs struct definition
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, qemu-devel@nongnu.org
References: <20220315015740.847370-1-raj.khem@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220315015740.847370-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/14/22 18:57, Khem Raj wrote:
> Remove pt_regs indirection and instead reference gp_regs directly, this
> makes it portable across musl/glibc
> 
> Use PT_* constants defined in asm/ptrace.h
> 
> Move the file to ppc64 subdir and leave ppc empty
> 
> Fixes
> ../qemu-6.2.0/linux-user/host/ppc64/../ppc/host-signal.h:16:32: error: incomplete definition of type 'struct pt_regs'
>      return uc->uc_mcontext.regs->nip;
>             ~~~~~~~~~~~~~~~~~~~~^
> 
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> Cc: Peter Maydell<peter.maydell@linaro.org>
> Cc: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Cc: Richard Henderson<richard.henderson@linaro.org>
> ---
> v2: Drop ifdef __powerpc__
> v3: Access go_regs directly and move the file to ppc64 dir
> v4: Use PT_* constants defined in asm/ptrace.h
> 
>   linux-user/include/host/ppc/host-signal.h   | 38 -------------------
>   linux-user/include/host/ppc64/host-signal.h | 42 ++++++++++++++++++++-
>   2 files changed, 41 insertions(+), 39 deletions(-)
>   delete mode 100644 linux-user/include/host/ppc/host-signal.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks for your patience.


r~

