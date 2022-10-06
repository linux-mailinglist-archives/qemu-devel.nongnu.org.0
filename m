Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 939355F6BE5
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 18:37:32 +0200 (CEST)
Received: from localhost ([::1]:39112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogTsJ-0004ty-CA
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 12:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogSp0-0007eI-Gu
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:30:06 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:35667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogSor-0007tj-So
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:30:01 -0400
Received: by mail-pl1-x62b.google.com with SMTP id h10so2040251plb.2
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2Db+IieIp+SxzevFp8Y7+Cx1EdI83HTA/ANNUomJSOg=;
 b=pnzuVXYrGx8jRuFb2p4TIiP5tccHdEhoERPh8K6cyWgVojKuIRhnrTY3YsOJ2bTyjT
 qzMzeOOvxUWFmMBdSaFxXay5DC0TZmKb+tz3l6fcqn3lfDZLakVE0p8uuSw1lU7rjbmu
 y4Cjf5A8e/PK6+lHGYcEQMlgUKWrsC17BDyupbGQEHgTlsGWLrnZQnDruMlvxMWjn3f6
 q33HC4GuNjC0XQaon6tprFGS0zSjPnd6OksAu8eiEjfNLpw3qfz5xvwTjprt7oc4eao5
 zytU9JC1GeAIRezLdd1dflUQO/UI6aKoPxYU0vgpb0pJAIqVyEzteOAvDVct2mK4jiIL
 enbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2Db+IieIp+SxzevFp8Y7+Cx1EdI83HTA/ANNUomJSOg=;
 b=VsDA/Aatl2sm0mNA8ofLOr5EjM3KU/i7ZBmAI9AaBzLkBTz5kWuGaRNN0Ps02Hy3yN
 NxUgdx71upl7ut0OlT1W1oc9t2ajU+TIpc4/eOIJO9Vv3KogPJDYmpBugFAe/g3b7QVN
 pCBVKDiODaKlYwUQBxNA6T6+NXuY/8KPm7ruc9uomFzswpHNRZb8QcjiL5IbY4iswzbB
 x3JRr1iI5SHqYS5V9JWIvZAsNrFhxMSDmcrMHkefF9wQ1eTzJ9OEn+dA5YqBFO/+GNlw
 u5w89T336t/1KRBqS75t0BgMneIMBDK50WCDcnk+vybANTp3pwnqSBT4JuzZlIftxO4F
 IA/A==
X-Gm-Message-State: ACrzQf2sU9ekCX3nP6CYpFUTuwJL26iF8PLW3Ac+z80y3XZ++GJNdyYg
 JMYwB8ludCfEd1q7pyylCAcoFjgiM8kFF2PCLnDQaw==
X-Google-Smtp-Source: AMsMyM4JVCYQyYbCzG/etl4f4gcEr5wbnaZ7e9uYFH9sdmDjbwuwV4cuxgdcQpOh3KEaR6OrSHux3hxT8fpEWB5Rc6w=
X-Received: by 2002:a17:902:7c97:b0:17f:5abf:9450 with SMTP id
 y23-20020a1709027c9700b0017f5abf9450mr425355pll.19.1665070192351; Thu, 06 Oct
 2022 08:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-25-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 16:29:40 +0100
Message-ID: <CAFEAcA9+Z_f8WmU-MJgs-Yc4Mmfa8X1tR99HmzH1a6v1c1K_cA@mail.gmail.com>
Subject: Re: [PATCH v3 24/42] target/arm: Add ARMMMUIdx_Phys_{S,NS}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62b.google.com
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

On Sat, 1 Oct 2022 at 18:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Not yet used, but add mmu indexes for 1-1 mapping
> to physical addresses.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-param.h |  2 +-
>  target/arm/cpu.h       |  7 ++++++-
>  target/arm/ptw.c       | 19 +++++++++++++++++--
>  3 files changed, 24 insertions(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

