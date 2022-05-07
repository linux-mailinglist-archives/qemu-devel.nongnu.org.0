Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4BD51E6AA
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 13:36:58 +0200 (CEST)
Received: from localhost ([::1]:50108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnIk3-0004tL-V7
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 07:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnIix-0003Zk-8a
 for qemu-devel@nongnu.org; Sat, 07 May 2022 07:35:47 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:45614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnIiv-0003zU-Ny
 for qemu-devel@nongnu.org; Sat, 07 May 2022 07:35:46 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 7so8139781pga.12
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 04:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=0kNJxZo9QLFT9KImKMLTly0BKNLLWrGa+Lo2WmHiETc=;
 b=ooSUleBDbB64FGK/3QYMixlAtX5KkrmfhsaRh1Xeps6oFi1uDTnhPNSNSaPySXiTPT
 wuY1CteV2DraCHjvLl45cCjsB6UY5Gapihr/EGwe4dDDIR9mlzqywMqxhdEFA2nMyHV0
 /EAV/5JlXICShO0iyQ4Z4s7aetiLnvol2Td69OiwYriz/Q81sLZHoLhE1gCzYsQ7UVpo
 6qDm2CQZ4A3nI1wjBlaogU9X5A+cIG+YeKjtjYshJJe9UxnAuIwWfhVjE/SjoRVdC/jh
 Gu5rIoGfyuiPj2SjGpoz7HlHgGDqL5PxW9wNGkCq58LknmjuYHeMVuY6Qyj3MR9hcA88
 kOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0kNJxZo9QLFT9KImKMLTly0BKNLLWrGa+Lo2WmHiETc=;
 b=wY2yODqs4mrhH/cJLH5si5dDRp+/I5II1K+3fzFQs5PH86NGKNxJS7z6zJyFpr5KXU
 LAGp4ekWWDBwaYm4rhdUbHNQUV/93Md3NbdQdhpIgz/mu8cWrOeR+Gd8Y7s44Tkn+4yV
 ILYFjh9L0avEm5JDlrZgvbT3uHEfFu9i2ss5vzE016hiivRxZgZbfqs1RTpSI/aMGhj6
 1IvOv4uL+tlh0cdCTqBX6u7SstvQ8Tm5NHDkiEbWpN8b+nahdlm6/sLpSI/6vtNSWKLQ
 apj8ee3r6SehQ/rYT9Fo/uZtJuIsFGZ3fZZOt8uJuQcRb15r8qRli26rfBWvij+zYBx9
 6L4Q==
X-Gm-Message-State: AOAM530hfoHfi1BWkpEd7mPG8EQnT2k4bQrtmV5NjOUTACWa/rU/MJTX
 z5ceyGN4OjjRXH7/1JhCUHqksg==
X-Google-Smtp-Source: ABdhPJxd+ugwjGFNysMhl/S/xUBqKCOpn59oLWGftU41g6AdwR+WiunUzlxOGlD1KStOzKlZ1mtwmQ==
X-Received: by 2002:a63:1b5e:0:b0:3aa:593c:9392 with SMTP id
 b30-20020a631b5e000000b003aa593c9392mr6240379pgm.470.1651923342712; 
 Sat, 07 May 2022 04:35:42 -0700 (PDT)
Received: from [192.168.138.233] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 gg7-20020a17090b0a0700b001d97f17f9b5sm9045435pjb.35.2022.05.07.04.35.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 04:35:42 -0700 (PDT)
Message-ID: <b27e80a2-56e3-8197-a1a6-0b62e3f20c5a@linaro.org>
Date: Sat, 7 May 2022 06:35:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/5] gicv3: Use right number of prio bits for the CPU
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220506162129.2896966-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220506162129.2896966-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

On 5/6/22 11:21, Peter Maydell wrote:
> This patchset fills in an odd inconsistency in our GICv3 emulation
> that I noticed while I was doing the GICv4 work. At the moment we
> allow the CPU to specify the number of bits of virtual priority
> (via the ARMCPU::gic_vpribits field), but we always use 8 bits of
> physical priority, even though to my knowledge no real Arm CPU
> hardware has that many.
> 
> This series makes the GICv3 emulation use a runtime-configurable
> number of physical priority bits, and sets it to match the number
> used by the various CPUs we implement (which is 5 for all the
> Cortex-Axx CPUs we emulate). Because changing the number of
> priority bits is a migration compatibility break, we use a compat
> property to keep the number of priority bits at 8 for older
> versions of the virt board.
> 
> There is one TODO left in this series, which is that I don't know
> the right value to use for the A64FX, so I've guessed that it
> is 5, like all the Arm implementations.
> 
> Patch 1 is an independent bugfix; patch 5 is cleanup.
> 
> thanks
> -- PMM
> 
> Peter Maydell (5):
>    hw/intc/arm_gicv3: report correct PRIbits field in ICV_CTLR_EL1
>    hw/intc/arm_gicv3_kvm.c: Stop using GIC_MIN_BPR constant
>    hw/intc/arm_gicv3: Support configurable number of physical priority
>      bits
>    hw/intc/arm_gicv3: Use correct number of priority bits for the CPU
>    hw/intc/arm_gicv3: Provide ich_num_aprs()
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


