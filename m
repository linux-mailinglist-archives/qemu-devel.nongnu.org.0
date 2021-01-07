Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380702EE748
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:56:21 +0100 (CET)
Received: from localhost ([::1]:55650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxcKS-0002Yl-2Z
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:56:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxc4R-0007gR-Sn
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:39:49 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:38502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxc4M-00019e-FV
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:39:45 -0500
Received: by mail-ed1-x52f.google.com with SMTP id cw27so9043037edb.5
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0tOad4p4g9xxCxz+2A1NsHx49ZOrVhPXaqsHUq1scno=;
 b=aZcqVUW2PFjQgWmUQwjQiWKLnei/9GaTYb5HZ4bAiLsjR5RpkW/dpLJM31yw+Dj+nJ
 Qa6fajhBBQN05E90wGwkFIEclx4FuLhPOK7F+z6BEfo96dm1sbUynRV7svHZTy1l/MhK
 QCWCIv6fwrmn3ikyVSFyvzQEIEhZsjJDnA7vmhUsG+DUcEOCzQK0bhS+79TngaoxZoRC
 nOX0om1zzsHRGGk7Bo81IoIyIVLnaUSkuAwN1A6NuwkypXWfLQPv8/6xVYWxA7DptxwU
 82Y6ytBusGyTmx/DijWQjMrdJJgykweg4KK0uZSrH7hE0LGOk6BKYrtD6zyqV0ECJ2vc
 iiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0tOad4p4g9xxCxz+2A1NsHx49ZOrVhPXaqsHUq1scno=;
 b=sXqX8irIlogrtmGtSPF9NXsNxSbZR8ctU3c931ZL5n+VOzqBrP6juxg9oFJd8VVviO
 Dm/WJtlVqEJIerPL4W7lVbiJ6N561NBF75mSuwZagYhpI1HxjmjaE7B/owgpREdMjsC1
 e89mx79PaNaWmNIlY+5OWd5OlbQN/tF3uyDs/9dNiIvjClbEux2yApE3FEXbv4ZKJugy
 Cwl/Tc4G02CWCzYaRWW7gKlHb1LMFsUQ5kVwfBHTeJTwipjsVEbm9rLfZqT52HaAyahI
 84izfQ29DSvFaBHN9pObrJBZwSvsmYHr9qd9bG9mrPc1oTQiT+kpueLx9CbZ6ALoeN+Z
 52Rg==
X-Gm-Message-State: AOAM533n5tSMZrLrv3KuR2U2Zk+qTTeWb+FqYD7S/qdTQluk4rtsdO5w
 g3Cf0e5d0Urelw1Mg17A80u5AnTkvwCoxXR+4eLC6A==
X-Google-Smtp-Source: ABdhPJwmDq14EHxkFhJkH+usdywR800KsfwOkyhanHW3r8SbQQb49/H3oD+3RcJZS/r5xAa8tZ1te87WDBagEJT5v/4=
X-Received: by 2002:aa7:c353:: with SMTP id j19mr2960208edr.204.1610051979194; 
 Thu, 07 Jan 2021 12:39:39 -0800 (PST)
MIME-Version: 1.0
References: <20201217004349.3740927-1-wuhaotsh@google.com>
 <20201217004349.3740927-2-wuhaotsh@google.com>
In-Reply-To: <20201217004349.3740927-2-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 20:39:28 +0000
Message-ID: <CAFEAcA_EfWw796RvMsKouo5w4JegwN8ZtUXYNgonVrW6+Y36TQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] hw/misc: Add clock converter in NPCM7XX CLK module
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Corey Minyard <minyard@acm.org>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Dec 2020 at 00:45, Hao Wu <wuhaotsh@google.com> wrote:
>
> This patch allows NPCM7XX CLK module to compute clocks that are used by
> other NPCM7XX modules.
>
> Add a new struct NPCM7xxClockConverterState which represents a
> single converter.  Each clock converter in CLK module represents one
> converter in NPCM7XX CLK Module(PLL, SEL or Divider). Each converter
> takes one or more input clocks and converts them into one output clock.
> They form a clock hierarchy in the CLK module and are responsible for
> outputing clocks for various other modules in an NPCM7XX SoC.
>
> Each converter has a function pointer called "convert" which represents
> the unique logic for that converter.
>
> The clock contains two initialization information: ConverterInitInfo and
> ConverterConnectionInfo. They represent the vertices and edges in the
> clock diagram respectively.
>
> Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

