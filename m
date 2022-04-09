Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 317D74FAA4C
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 20:42:12 +0200 (CEST)
Received: from localhost ([::1]:38874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndG2F-0000eE-3D
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 14:42:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndG19-00081W-BG
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 14:41:03 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:33301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndG17-0003k1-LG
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 14:41:02 -0400
Received: by mail-pf1-x42f.google.com with SMTP id y8so6018146pfw.0
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 11:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=z/zNhIr2tF8jdNUwxbLggHirJiP5wOEHRoW4tPiBUlg=;
 b=pbjSqmdbI3PGplNcKo5eSEpZFXm2MiBRMglx/r4z9SQnNpqok/sPxxqeR46ngwiHAq
 qOwSyhSdWYPDeInmK8KfdmgM/JHRWWE4Ofrp+u38NYTgfUaCqdOtzDLd/aH6NAqmq/Nk
 31H5g1ci5sDAn/mX4fV02bu5TWCUNZepN4HJ641CJFUGKPMdhlCFGSl0440J3zcNQfQn
 H0Rn1TEODP7+rSXQhhfJ9Y0yruwyx0tyWmbQsUSFI9vZJFt2hPoc2Wss+HjGjW9aobn4
 dFOY5CDfYRS7X/fSexVpLM7FD4bZNKRn4irkpqOWvgdIrGJcaiHDZHegYg6iKZrzx+q8
 d/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z/zNhIr2tF8jdNUwxbLggHirJiP5wOEHRoW4tPiBUlg=;
 b=aIGhyOXk3CpB+aEaT3sMyf5YDqULVUzWyGcWO2vgByBd4DN1Fhdw5gO9RnLIBHbApC
 S8wiMYOL/BxUpwfABmaNYRkzEil28Kxl0k2pee49KkgqmZFFMDQxMHsOC82yAxQ5Iz8X
 u0RagjHV1osTVMFpjxNXHHN5LxucpWHpcD07od9ukhvWgvWeGdS5C1ENXZ26UuhmewH8
 DSGT4Jh2Y6vQeClm7trW+Ku42bNvJun7AffaThVkLuHWvrjY4YkkobRXP+KLp6zAog+c
 5Oa4jToYxGky4nrtqmROKzz5zCtZQz2DvTsn7+9lcLrk3uAEnyN5eXUoLHebpnv5tkBc
 qmwA==
X-Gm-Message-State: AOAM532+H+W5VDjKp9TzXWLLgsHU9SdsakNIEmR1m5tOYi7synyXB/KO
 sDPjDvp4Nc7TolcVKliRyFoZOA==
X-Google-Smtp-Source: ABdhPJzWcjrZ3HT9gDYbaTxKNs1HkaIsXezeUfn5qmVKNVja/x9cj5LuhXRDeznMH+PGnrlZ15k+Yg==
X-Received: by 2002:a62:82cd:0:b0:505:7ab3:e11b with SMTP id
 w196-20020a6282cd000000b005057ab3e11bmr9504874pfd.43.1649529660057; 
 Sat, 09 Apr 2022 11:41:00 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a63dc0e000000b0039cc76bda79sm8130210pgg.40.2022.04.09.11.40.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 11:40:59 -0700 (PDT)
Message-ID: <57156691-8ea9-7d03-11c9-9b056a5f1823@linaro.org>
Date: Sat, 9 Apr 2022 11:40:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 23/41] hw/intc/arm_gicv3: Implement new GICv4
 redistributor registers
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-24-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-24-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> Implement the new GICv4 redistributor registers: GICR_VPROPBASER
> and GICR_VPENDBASER; for the moment we implement these as simple
> reads-as-written stubs, together with the necessary migration
> and reset handling.
> 
> We don't put ID-register checks on the handling of these registers,
> because they are all in the only-in-v4 extra register frames, so
> they're not accessible in a GICv3.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> GICv4.1 adds two further registers in the new VLPI frame,
> as well as changing the layout of VPROPBASER and VPENDBASER,
> but we aren't implementing v4.1 yet, just v4.
> ---
>   hw/intc/gicv3_internal.h           | 21 +++++++++++
>   include/hw/intc/arm_gicv3_common.h |  3 ++
>   hw/intc/arm_gicv3_common.c         | 22 ++++++++++++
>   hw/intc/arm_gicv3_redist.c         | 56 ++++++++++++++++++++++++++++++
>   4 files changed, 102 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

