Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 512DF545288
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 18:57:44 +0200 (CEST)
Received: from localhost ([::1]:44118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzLTb-0000pZ-8Q
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 12:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLBQ-0003VC-7h
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:38:56 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:36583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLBO-0004rx-R6
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:38:55 -0400
Received: by mail-yb1-xb35.google.com with SMTP id k2so3325563ybj.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MRdONRNPBquLQoLccmkJ9L0j/gtfkT4nRWrdIHaWtC4=;
 b=t0P9cFlRe5yBcp6smE8xpUqiE/jYlPeCBoyATdNyd7Vw6DSmTjIFxWAaSn3UXIYFyQ
 il/9AdKyhoSx4fnZ+AhgIeRroilVid2Gwhvbr1FQpi8RYVZV+Uk92EjNAm0EacRkeWZ8
 49G6Uqxg5mf+pAJxSXlei+fmFxovASV777szKKrQkjQI1hzuTAtQESKIRtZq79CNf4qO
 Ak7+V56dyyrhAe1IoNnk2rC60UAsKZBO789Wrqy1F1SypR8grthHC9dAI6Ms06Kd74XN
 taqf7cR0Luq0CBSz1J2SYIJT/GLmFdTl6Xohw3Vgz6d44PBxkpFvz90BBbg5ujw2xx/p
 nkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MRdONRNPBquLQoLccmkJ9L0j/gtfkT4nRWrdIHaWtC4=;
 b=2OhbvJty/V5OApx/ZmEAWK8bW0ZNotSNaGGwYwVol6CFUmnQhQpXxmMWvbqkbjNf03
 RMOKMZAOoutsUNYC+09qFMXdaRAASk3YgouCvfg5x5LIjlW8g0y5krPZhxdquvcp3+yv
 toVAcGjyOERq15S3J4xiW8XxPKtX3pg1KsDHDEUcBXGq0KwqGAiLaR2n2qjClnc5hNq9
 aO0OszvIJcMYu3wu3mHMRzQzms9XaXYfjZiMzsiWQ+3/5a0uqWvIF+4WpMkHSVXVrFnc
 WfG7zAughnBcOAoQwc+87c1CrruW0z6FUqHq7SV+1mUhC9gj0PJ1NWj7Gg8b3lRNtaZz
 nOQA==
X-Gm-Message-State: AOAM533JHEUQB18ls+m3HMEOwRDRXVeRBk9d+mV6apOMYtnuKu4cLdWv
 oGUVYtP5Wxc5G3q7IhadILcj7b14SedSUf4E0XsMPw==
X-Google-Smtp-Source: ABdhPJyRuew4EIccAFxdesbCGsiNkrxfOP0CJYenlltAnpauWC2lE14NzVWB59J+/M5t8PmI+QOy+Vbd3FA7zwup5yU=
X-Received: by 2002:a25:47d4:0:b0:65d:510e:c8de with SMTP id
 u203-20020a2547d4000000b0065d510ec8demr40683979yba.39.1654792731837; Thu, 09
 Jun 2022 09:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-20-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:38:41 +0100
Message-ID: <CAFEAcA8tzjdH-wOyYLbw-3wf4Bf=DuskD_Nc0ANO4VmjwvhfSA@mail.gmail.com>
Subject: Re: [PATCH v2 19/25] target/arm: Introduce gen_exception_el_v
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Jun 2022 at 04:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Split out a common helper function for gen_exception_el
> and gen_exception_insn_el_v.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

