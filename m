Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A8D38F267
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:41:28 +0200 (CEST)
Received: from localhost ([::1]:54100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llEZz-0000UW-Tu
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llE4G-0008IW-6X
 for qemu-devel@nongnu.org; Mon, 24 May 2021 13:08:40 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:43785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llE4C-0005XX-Ai
 for qemu-devel@nongnu.org; Mon, 24 May 2021 13:08:39 -0400
Received: by mail-ej1-x629.google.com with SMTP id f18so12746159ejq.10
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 10:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hY+at+cXLMke96FHw6uEdJVgOHp3wUN4zIMeBRXrGos=;
 b=v63ULEOzAjr4kd9QTtB+7Wn1UUCDXEcU8yU+Xw3qKmZbdbXNHm1mVp3TXvjHteCo4Y
 PXk5dJLyKFBe5s3HlmvDfGTqMOPps18wqAdiO/eFmxcFrX3ilLLeg7G2BCiwITDhsyb1
 ustglpeu3TXjmQuQVceF6B96xi90bnSyasB9eLUXnZVTDvt6fHVK7eone302oJzCstly
 SRWljOYL13yrjMHI7kJ3R4/WYWVp9KBedMG6ElVaYjlXYJ6j2HE9eBrT5SODkRD9WP2q
 CeVGzlpdErgCr4cvSQ5hKzfgjgOtgn9IjY2cLTnwX+lNW+mdr3HESNizPWFwloc5pc+O
 boaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hY+at+cXLMke96FHw6uEdJVgOHp3wUN4zIMeBRXrGos=;
 b=ErlLM+gmdVIYYi+wh0V6ZHshMDbzljns+UyTpsc4kYXNIsLrNKmRMymyj9GCkEA++a
 Tllx/KTJDdBbrdGPgziwqyD5qKptk+p/bhrtJK32eOPFaiffnYjuGzsqF7i/UZyN02PP
 RgYTRCvfwjMnkTrVE5L+W/AoXBcRQuQbLvvDSHsHQVhxnCyqA8GMg2HWXsFJpZOkfXk+
 MxsjR+9wu16u/YicRVPn2ygymrECgb5HYyRTvb4Yr07mszgfwaDkmm+mi3113Qk9h4Ak
 SOj862MVpwEgD7F/hwNopvetKRKspsJ6+HWeMK5jI+ad9MJxeYtjz5HSzLqKJc3RcksU
 33dg==
X-Gm-Message-State: AOAM5311jQwJRKlhydlPMr0aoTIjGroOfQJRZgdKP6/NKepWnva7FW2c
 4CdTpfERAz/eT9+2aclq1tNqll3YJkuR1LP70DY9cw==
X-Google-Smtp-Source: ABdhPJxdg5NSDuKUdlmiofEDKpMfdiJk1vcH9joMd7mUC6zFK1jvsgXFU3VELARzh1OSOWCTn4gZoa0ylA9PQms+Rl0=
X-Received: by 2002:a17:906:bcd6:: with SMTP id
 lw22mr24789309ejb.250.1621876114775; 
 Mon, 24 May 2021 10:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210520152840.24453-1-peter.maydell@linaro.org>
 <20210520152840.24453-9-peter.maydell@linaro.org>
 <02b5ed61-fbb7-0086-a615-8ef375b23e9f@linaro.org>
In-Reply-To: <02b5ed61-fbb7-0086-a615-8ef375b23e9f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 May 2021 18:08:12 +0100
Message-ID: <CAFEAcA_dV-AqhcNXwKE9k68ZmXV9VJVgwuhAMpaTNCb5tvL-Wg@mail.gmail.com>
Subject: Re: [PATCH 8/9] target/arm: Enable FPSCR.QC bit for MVE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 24 May 2021 at 17:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/20/21 8:28 AM, Peter Maydell wrote:
> > MVE has an FPSCR.QC bit similar to the A-profile Neon one;
> > when MVE is implemented make the bit writeable.
> >
> > Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> > ---
> >   target/arm/vfp_helper.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

There's a followon bit to this patch which I didn't notice
at first, which is that the handling of ARM_VFP_FPSCR_NZCVQC
in the "fp_sysreg" code also needs to be updated to read/write
the QC bit (currently it has TODO comments about this.)
Given that this patch is currently a one-liner I think I'll
just respin it as a single patch with all the accesses to QC fixed.

thanks
-- PMM

