Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FB54FAA7E
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 21:29:13 +0200 (CEST)
Received: from localhost ([::1]:43486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndGlk-00006w-CD
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 15:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndGkj-0007dK-SA
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 15:28:09 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:46676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndGki-0001v5-51
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 15:28:09 -0400
Received: by mail-pf1-x431.google.com with SMTP id p25so4505921pfn.13
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 12:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wWbaO7s/5QhMwQwY2g4Sg0C/7U6kLHuFCVT2mjPQPg4=;
 b=TC9BSCZJa6nG+I4LzD9QEIZXBUGnY81wMzhJljSKV6TaWGw/WQsPxLKCy15ccKFDZM
 fkkq78qG14+dKKqoDXrW9opJx8BLjQ1HUZXHp39It1RebE9P/rioLD4fCAZ5wCJArC0r
 zFTzcL1ZD9PIlztxUaRyoxDo8MSz9Us/UcOAm/G3PNBc3vpYdVfJQisFRIod2Rcsn3ng
 DBLN8fPo8zBqjLHihGdEWU994aP9egyg41f1e/+L5trYz0jtdV0NgWkgxlIRptRq2JDP
 7Oa8A1zuWmYA7dsGVc4GAJpahYnXqMDJOyX1FO6NTAUen9q2X7RATFio33+7KGr+X48X
 4asw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wWbaO7s/5QhMwQwY2g4Sg0C/7U6kLHuFCVT2mjPQPg4=;
 b=rjjvtM3Cz5L7tAHgQdY6v4PfPehow1W8IzbAgVdpQElZfZ4hNsDIeAVhQPJhEsOXvz
 fFg2cKwIYVErRZR7tCRjA0nyU4HsRUlzU690TjoI57n56yRv2j8XojDJgwg08J52rp19
 kt9hZ/GyveuZP4G0wZd7ntoAJkysK1kf5b/ZOrbnSaYYboWNdZVSR3zjH6AEKSk4qhiu
 mQqAY0QeJd+kbJtPRML8FFUa6OPYUABZr47Ma1kaEFLjJGoB16DDuCgxTln0iRjsODxO
 itUvHilzvemaeby0vlqjEeaw8UyVbMgSa3BtCPERxargbwMzknMUQ0Vg+cixhbnE4Mgl
 JBAQ==
X-Gm-Message-State: AOAM530aedSdU/+jZisi9qOuErI6gvKgMHSYGp1nJ6X/ElE9MTDZ4k9z
 m0Xg8TDHyE4RWwkz2u4oOPbZIQ==
X-Google-Smtp-Source: ABdhPJyd/Iz8nQRi2b7iqgp8oSjKte3dKMbTMQYY3ahTMR9TIOspelsXiVGw1qohRKfKhA/iqIKcWA==
X-Received: by 2002:a63:5756:0:b0:36c:67bc:7f3f with SMTP id
 h22-20020a635756000000b0036c67bc7f3fmr20646876pgm.389.1649532486702; 
 Sat, 09 Apr 2022 12:28:06 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 k92-20020a17090a4ce500b001ca69b5c034sm15366141pjh.46.2022.04.09.12.28.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 12:28:06 -0700 (PDT)
Message-ID: <b2693e52-0dc8-3399-e457-791ef2477c6e@linaro.org>
Date: Sat, 9 Apr 2022 12:28:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 27/41] hw/intc/arm_gicv3_redist: Factor out "update hpplpi
 for one LPI" logic
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-28-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-28-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
> Currently the functions which update the highest priority pending LPI
> information by looking at the LPI Pending and Configuration tables
> are hard-coded to use the physical LPI tables addressed by
> GICR_PENDBASER and GICR_PROPBASER.  To support virtual LPIs we will
> need to do essentially the same job, but looking at the current
> virtual LPI Pending and Configuration tables and updating cs->hppvlpi
> instead of cs->hpplpi.
> 
> Factor out the common part of the gicv3_redist_check_lpi_priority()
> function into a new update_for_one_lpi() function, which updates
> a PendingIrq struct if the specified LPI is higher priority than
> what is currently recorded there.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_redist.c | 74 ++++++++++++++++++++++++--------------
>   1 file changed, 47 insertions(+), 27 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

