Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8868A4FA020
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 01:28:05 +0200 (CEST)
Received: from localhost ([::1]:36998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncy1M-0000Tt-IZ
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 19:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncy06-00080G-Ep
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 19:26:46 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:50863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncy03-0005q4-Sc
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 19:26:46 -0400
Received: by mail-pj1-x102e.google.com with SMTP id u14so10019125pjj.0
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 16:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4WrceAjHZws/RC7AapXeXTIvMbFv9TuH+0j/xCxFGnQ=;
 b=gnVXnMp0FzCQIk9IwHnEBs+p8YjtDktesB1MPKtYNht4Xrc/be8uxn74RQD9tqway2
 UGWyLpkk9Jzw362PhaDn33bV33WTk1JOr0wDsONf4GlcF5te/+TOJaXTCvVjbWTtc9eK
 jCu/ub/ArAhCKxwHHOEpw/duBf9Aan7js7PHEwDB6idPnEcA9eG2CjQ6eYi2ZE8B/NXp
 tmaPgxcMrH3/IfEDJnHJOD5ffeFII/6HOm+OHm/bk5Kl25NPMjWakUc6WBawfN+jOHQw
 lx52B3CogUimuWy1kh7NRIpXfgJ6NrlI26whtxroaTolLo14OKAcIz6g1UMYVRabgy9T
 3O7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4WrceAjHZws/RC7AapXeXTIvMbFv9TuH+0j/xCxFGnQ=;
 b=0TLR/EiHIf0YF4Ie4LS5NWNmzTOU6eovTle9nnnqdKp6AbXMs4msL+jaFcgIbQlHw+
 Pwm7KNnTAavDl6qnGkfdtK2ydouTt5ewH5ywNkAKmXuHcRGcX6gg8vUurJOTmOpqfH9s
 0/7yyFazkAjUwSt1io38CZvMEXW8EtnJ/+XV4Nl6K7DupTZu7tbmnyGbatH1cqzRGrdy
 zsbKDsxTvuVcamcLUj9Dc8GqZtVWdGPRHH6FOwmepNf5KiAnF1/xylyCC4b0ZHU/795E
 Xfbap38X88EljCnjLVcuCniAmK+59HBu4OhfQ2lB+TNyw88jCe87lZVurAuN7KmgCZwg
 LSVw==
X-Gm-Message-State: AOAM531z3HCQkd57vLLSRPUfXA0h9pg0GzjrRsANUxcak8Kf9lUuU0Xj
 4SAAzAj5eC03fyPvlX010ED2cg==
X-Google-Smtp-Source: ABdhPJwpICI17sc91YEbIWAx2Qqyn6hOG3BKiblpzZkimIFwdde7lJB2W7hCxEJTbOTvu7qRFwtNig==
X-Received: by 2002:a17:903:230a:b0:156:9c66:5cd2 with SMTP id
 d10-20020a170903230a00b001569c665cd2mr21233030plh.57.1649460402097; 
 Fri, 08 Apr 2022 16:26:42 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a63350f000000b003992202f95fsm15861597pga.38.2022.04.08.16.26.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 16:26:41 -0700 (PDT)
Message-ID: <84dfb42c-8bad-c66e-34a4-a240977ab2a8@linaro.org>
Date: Fri, 8 Apr 2022 16:26:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 04/41] hw/intc/arm_gicv3: Report correct PIDR0 values for
 ID registers
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
> We use the common function gicv3_idreg() to supply the CoreSight ID
> register values for the GICv3 for the copies of these ID registers in
> the distributor, redistributor and ITS register frames.  This isn't
> quite correct, because while most of the register values are the
> same, the PIDR0 value should vary to indicate which of these three
> frames it is.  (You can see this and also the correct values of these
> PIDR0 registers by looking at the GIC-600 or GIC-700 TRMs, for
> example.)
> 
> Make gicv3_idreg() take an extra argument for the PIDR0 value.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h   | 15 +++++++++++++--
>   hw/intc/arm_gicv3_dist.c   |  2 +-
>   hw/intc/arm_gicv3_its.c    |  2 +-
>   hw/intc/arm_gicv3_redist.c |  2 +-
>   4 files changed, 16 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

