Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 835D64FA013
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 01:21:53 +0200 (CEST)
Received: from localhost ([::1]:33838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncxvM-0006T5-BW
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 19:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncxuA-00053K-MH
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 19:20:38 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:39735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncxu9-0004Ni-0e
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 19:20:38 -0400
Received: by mail-pg1-x535.google.com with SMTP id q19so8999676pgm.6
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 16:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gEBMjtUlvyZrFoITGh51DTO9a1HWqcgSWUbZR3gfsr8=;
 b=yCb+yrfYTPaKmWfheWxp9zujtqnrGwpZW6Ws/ohtQJeOKcVjmQXhtM0GO1Q6i9TvGy
 GITjyu+3/FZ1ATbzfyXsQ8KCBca7L0+S3vyfn0RvukMAuUDAoUug8jHTfTtS+wYWXPKN
 T+FfrF/WJMFO/G9sxqrEKS8kh0wegPlmX4jEmX8jIp3gCQifc/PUfypm+zblTC0TGqeN
 49wn/opILqLFTZuP8yiJv+Lc8o7ofhnnFqXYdmciKoBopbqRj2OZeIift9tVOvdJS0xj
 ydXqiJbNI8zfCjYWPbDyhJOdh+nZmeW0sFWDPPzQziJNUhqY9/NL+FFHWPWK2Nm6LHYE
 EMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gEBMjtUlvyZrFoITGh51DTO9a1HWqcgSWUbZR3gfsr8=;
 b=B7ehT0IZBfZetz/bSt71uNYXKkY+c+7REAHOc8XvX97p+59rLau29EesAmvHoqBK+g
 xeWEKLuNOZqBkXfZPVlhP07qlRBR6NtPi4+k7nzKo1Y3HuRJKWSPmlb5DhMn2hxC/WAD
 FKLeBedVCJszAbrtFGenIA0KuhY0SO+7zr6cAuO2FF/Ueuz4lWqpGDkMm1/qXD0b4FHa
 hTivjZ+vh1i2jBvIlAvmcPJIrUe5Ue/nOLit+OxYRnA+eUXPffhzXGa0pEDVtQjNbC3e
 QW0L4H5dThNCQhavXgH44TJSWHTJLvymLOjoqG40NXEAEHPNiWmtRcailkhLWfhXSmen
 doYA==
X-Gm-Message-State: AOAM532IuhRbigxGsKermoK8JucDUDOOWzz61htWLwVRt+QE8nm7qkd+
 dF595YOLEE6wpaJyn6rxLU6Atg==
X-Google-Smtp-Source: ABdhPJww/mU404lb/vKEqNWKR4xtCXAxwSxqrX4sy5Q5v/aEqmLWxIow2bxm9Mf2bDDpo/8wmxwrTQ==
X-Received: by 2002:a05:6a00:14cb:b0:4fb:2c72:1fdc with SMTP id
 w11-20020a056a0014cb00b004fb2c721fdcmr21974057pfu.55.1649460035646; 
 Fri, 08 Apr 2022 16:20:35 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a056a00088900b004fe1a045e97sm16663514pfj.118.2022.04.08.16.20.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 16:20:34 -0700 (PDT)
Message-ID: <e6830d42-f3d3-3020-17c9-61db21e1d63f@linaro.org>
Date: Fri, 8 Apr 2022 16:20:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 03/41] hw/intc/arm_gicv3: Insist that redist region
 capacity matches CPU count
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> Boards using the GICv3 need to configure it with both the total
> number of CPUs and also the sizes of all the memory regions which
> contain redistributors (one redistributor per CPU).  At the moment
> the GICv3 checks that the number of CPUs specified is not too many to
> fit in the defined redistributor regions, but in fact the code
> assumes that the two match exactly.  For instance when we set the
> GICR_TYPER.Last bit on the final redistributor in each region, we
> assume that we don't need to consider the possibility of a region
> being only half full of redistributors or even completely empty.  We
> also assume in gicv3_redist_read() and gicv3_redist_write() that we
> can calculate the CPU index from the offset within the MemoryRegion
> and that this will always be in range.
> 
> Fortunately all the board code sets the redistributor region sizes to
> exactly match the CPU count, so this isn't a visible bug.  We could
> in theory make the GIC code handle non-full redistributor regions, or
> have it automatically reduce the provided region sizes to match the
> CPU count, but the simplest thing is just to strengthen the error
> check and insist that the CPU count and redistributor region size
> settings match exactly, since all the board code does that anyway.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_common.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

