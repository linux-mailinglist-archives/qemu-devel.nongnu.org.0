Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C9E68DC28
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:53:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPPLS-0006Pu-SE; Tue, 07 Feb 2023 09:53:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPPLQ-0006DR-4C
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:53:16 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPPLO-0004RV-G3
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:53:15 -0500
Received: by mail-pf1-x42d.google.com with SMTP id n2so10932052pfo.3
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 06:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aGuTl9qGfWZJy4CWkG/+2Wojw+hDzNXtCI6NfeCmXSw=;
 b=ROKHakSrzC7b/fkRZD9G2PsmDqMvnUL9DiJdyLLhZEZQzXKl+ltm9C79Es5auXI2pJ
 8Htfb2wbZRcDsY39Ky7umVktyXMqhXda2dRCWVCZdE5jPzFYvtrOHBgoZzDcIbivrkUr
 aX2CXgv9gmUXFs33+iLg6i+zV/BY45ouO4ML6xRn/Kv1stImOg/2bqbhrysZhnTZdD2D
 X6wUD9c11LqB9mV21UjzSNKNaMH5x8OogIEaMScyG0J5f1JYZdtwb+Wc1T3gKIaGsGIB
 ZXRqaw0AZ3FBNNDtzJaAaCw68e2w+FPtYZCOohsuhMfSUOW44dbERqgs58p6rFJNhqN/
 B6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aGuTl9qGfWZJy4CWkG/+2Wojw+hDzNXtCI6NfeCmXSw=;
 b=EgK8PNnl66+ZukWfBzsLp3rXbfMCszaUDQiU20bxQZ2y4rkW9sQELOl5GdWq1dwbkf
 5L847xEydSCn3NagNzxyBZxp5R5SBf7Ft5RzxWyX3nylkwiMt97xsSzctcV5zg/UK+Im
 w4BsWsjdVZ4uOy2WvXpBNV8LEzagPO6xyvOrSoITnX2o2W+6kxivsAskkZTDLTUvUtxk
 eP0SsFAFl7/+fiOfrTDHvKievX80j8LKC3CYQVrb2RyuGjyA/BjPXG7H/F6k4Lrp1f9d
 a1a/EfrQCs4ZBw8OalSso6lV8/VRMCpMiLyMoTxkW+T/qOnYvWu2/MyYWGKhrjFOtwWB
 05+A==
X-Gm-Message-State: AO0yUKWQObS9coLhbIHJxRWgBK6Qq2xtFjncvG47X/vxGy4jc2Z2sX8o
 Ph4F7Yhc4mxYqDSfuv64nbbzw7841Cwq0z3Tp2zosw==
X-Google-Smtp-Source: AK7set/4MZO2jS1ULz597TTpl2JWSJPSo3ibcBbd0tXfptNR+U6rHRO9/LesFg7dnxTO8XJHstcttzXodH8rIMToOQ0=
X-Received: by 2002:a62:53c6:0:b0:58d:a84a:190b with SMTP id
 h189-20020a6253c6000000b0058da84a190bmr836840pfb.48.1675781592931; Tue, 07
 Feb 2023 06:53:12 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-7-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 14:53:01 +0000
Message-ID: <CAFEAcA9vW1Z+6c7HWh+s-d74kFrpBm3JDMCzdY_pqQh7-JPjVQ@mail.gmail.com>
Subject: Re: [PATCH 06/22] target/arm: Add RME cpregs
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 24 Jan 2023 at 00:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This includes GPCCR, GPTBR, MFAR, the TLB flush insns PAALL,
> PAALLOS, RPALOS, RPAOS, and the cache flush insn CIPAPA.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h    | 19 ++++++++++++
>  target/arm/helper.c | 74 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 93 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

as far as it goes, but don't we also need DC CIGDPAPA when
FEAT_MTE2 is also implemented?

thanks
-- PMM

