Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 335F75BEF08
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:16:27 +0200 (CEST)
Received: from localhost ([::1]:52540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oakbS-0003go-4J
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oag0K-0004Ij-35
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 12:21:48 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:38654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oag0I-00008O-HR
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 12:21:47 -0400
Received: by mail-ed1-x536.google.com with SMTP id e17so4618779edc.5
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 09:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=5lUHutovwYwYSb4tFgPAdhsfX+qZcwHYtDiahs/qvAI=;
 b=t2YgrFb4EBlba1TVfrCQU3f8fJUs7YpW6rxQWTDndN3jL2EHKgrLuLNmkGd8z+cmrO
 TtiBtcMDTElJfNEb7fRz1jRrR/T+pkow+9daCMHfrLtJA83+4nOQbpAR9Gfxa0Oq6Jb3
 RMv15iSSdwzQznizXdVPRHTcCZ9Z/QvrBmW7rNDbnpnsi+nB60+9BqTrnP+bpFRqx+H5
 NheiICGSD6oOLenqivgMQRnUvuDaWtFX/SeRepMqQvFwF18BIUsW3OhWkd98+e9HFXlV
 YhlygcAwDoeQPZYxfZ/RcqAIihcVQ8WxW/amEHuPIZn18oQ5y5bQ+5OkdOc2PxjvAT3D
 1xEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=5lUHutovwYwYSb4tFgPAdhsfX+qZcwHYtDiahs/qvAI=;
 b=Ny0q5v+tSCsNtscDHA28xbEtv3jRyrOnfG7o9PMZW79AJdo2iGMj3s5pOYq1lcx85a
 0CYxEu0yL2xYhNIs6zsCzK04Ni8CJc7BMBh/rsKexl3ePzAu42J3PeuIeZ8HxwKtYu11
 bFDV+98pVq1xWPl5l7BHgUYI/Geai07TgfgbtpwHuA1ymkPXXO/3YTFW9L35tfPUgnL/
 o1AiZXeEAts6m+4Bc6qfcC+rqj/LZWL/CMfBiDxlVg0j4gtVJ/4a2JSV8or/9OyM7M+H
 5S5mKe7L7WiIZNxYSSjf5qDjNkqC65e2GNJaBEQYn65kwEBDKwFyqcYnppWssGg1fXV4
 ba0w==
X-Gm-Message-State: ACrzQf2fGDiuinB7fGrTqT16RfmaUX5KNWc5Je8OlbZ4zpaR/dLBmyV4
 oy8mdKqhDkscA8jPMwbzTTHHNYbTpYpV+BJl+HOsxQ==
X-Google-Smtp-Source: AMsMyM6BG4tKbgiLx/4PzIg9P97ADGxuZdB48ZRkZbht4aRIuPcfGEyFtNBImlOSzWWynB6yG3bVdBsppsBjte8TCl4=
X-Received: by 2002:a05:6402:2787:b0:451:d655:9269 with SMTP id
 b7-20020a056402278700b00451d6559269mr20879248ede.375.1663690904620; Tue, 20
 Sep 2022 09:21:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-37-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-37-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 17:21:33 +0100
Message-ID: <CAFEAcA9u1yYeDFxWUwvQUHgpEkMWqR3NhqHsuv_8J0obMjS9Rg@mail.gmail.com>
Subject: Re: [PATCH v2 36/66] target/arm: Reorg get_phys_addr_disabled
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 22 Aug 2022 at 16:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use a switch.  Do not apply memattr or shareability for Stage2
> translations. Make sure to apply HCR_{DC,DCT} only to Regime_EL10,
> per the pseudocode in AArch64.S1DisabledOutput.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


> +    check_range:

I'm not super keen on this goto label lurking in the switch
statement -- I would rather we keep the "how do we decide the
memattr and shareability" logic separate from the
"which mmu_idxes do we need to do the range check on" logic.
The simple
if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
    range check logic;
}
that we had before seems clearer to me than this use of gotos
and fall-throughs.

thanks
-- PMM

