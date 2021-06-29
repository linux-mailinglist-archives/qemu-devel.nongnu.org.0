Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D61FB3B7237
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 14:39:09 +0200 (CEST)
Received: from localhost ([::1]:40744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyD1A-0006em-Hn
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 08:39:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyCzs-0005u2-Qm
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 08:37:48 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:43871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyCzr-0003qN-5X
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 08:37:48 -0400
Received: by mail-ed1-x52e.google.com with SMTP id w17so15584571edd.10
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 05:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6KX+kcqlfyLALs1Wxlh30HoYIEF0k5WnmKeki2SfnpQ=;
 b=PQNm29GlOK/jir4rjekS5q1iZPPUxRwWKHPpJjzPEjny/e9q8rlYRh7qJ3A1JXdDx6
 warCiiMdIMjiR3YLU2wx37j1fozdajIyp8b2hl55tMxJ9qpCUKJtmMRAFgMtTRVk2iib
 X9dwoq10WiDg7Un5zk5Fv3B4YjC+EOLg56E9MmqZkUBw6BSVkq9ytsEzv8R58sBv2ocI
 fLCVqS5kMo5yVg78YzVZ3j0Bix+U3jlm5htktJq3LoHkyq3Nm+tAfiLorDQbHm99ip9J
 Gk6MKW6jaS8C95+KDez1JCi83Y89CNiDJ/AjR5pH07g8csftzlZ+RvD0YOIx8ejYhFSb
 bpvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6KX+kcqlfyLALs1Wxlh30HoYIEF0k5WnmKeki2SfnpQ=;
 b=eWmX24j7FMI+nqGMvR2Oukobr5HY9GTzD4TUx423h58PqnP21KOHNz3Qh0ZBpGS/F4
 0E85yIbaA6d2I2h4liv4vStRx/tduixaM/1zJXsGjwdEqA3zoHSKBn1iLy979SxWuOWz
 y7nn2zzeQIWuBdmNfMM68KPqiuJewhAMKGX6qgTEPP/ji1zwHf1SxN/xdMC9tPQTx1+A
 PS1Kz4WDC0Rfz+Ttcsg7z6XFDRE/dbganI339Y8pmVC6RpDZiXjq0nvtAEoRaYq6XrGe
 TfMRvVwMIDVzrRWkpO6y0gYQ7bz1rsNgDXAE+vfVamaAL19fMo1aCTHlPI8fqx00Agcn
 dWHg==
X-Gm-Message-State: AOAM531TxiFOMypLs8iApJTnAWymkTfUreh9LGiNvUENaMDLlUJ9JEq7
 QHRcs/tc5okpSvV4jqpGQlhV9/uKwmJ8l38lD1pMFOukV9es6g==
X-Google-Smtp-Source: ABdhPJzVz9MmqFB93ZPXHenh6xM3/5YE1n+7vDQzK7YCuhdH1KezrI/bDr5+FmtQA8st7uZs/98iTeu3/2eQeXvs5/0=
X-Received: by 2002:a50:fd0a:: with SMTP id i10mr39679082eds.251.1624970265655; 
 Tue, 29 Jun 2021 05:37:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210616091244.33049-1-ysato@users.sourceforge.jp>
 <20210616091244.33049-3-ysato@users.sourceforge.jp>
In-Reply-To: <20210616091244.33049-3-ysato@users.sourceforge.jp>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 13:37:08 +0100
Message-ID: <CAFEAcA_paLV8eeEyAb=-TtxdA=3_Lc8191huZ8riHSHr8kDXKg@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/char: renesas_sci Add SCI and SCIF support.
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Jun 2021 at 10:20, Yoshinori Sato <ysato@users.sourceforge.jp> wrote:
>
> This peripheral using SH7750.
>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  include/hw/char/renesas_sci.h |  43 ++-
>  hw/char/renesas_sci.c         | 489 ++++++++++++++++++++++++++++++++++
>  2 files changed, 531 insertions(+), 1 deletion(-)

>  enum {
>      ERI = 0,
> @@ -32,6 +38,7 @@ enum {
>  };
>
>  enum {
> +    RXTOUT,
>      RXNEXT,
>      TXEMPTY,
>      TXEND,
> @@ -49,13 +56,14 @@ typedef struct RenesasSCIBaseState {
>      SysBusDevice parent_obj;
>
>      MemoryRegion memory;
> +    MemoryRegion memory_p4;
> +    MemoryRegion memory_a7;
>      QEMUTimer *event_timer;
>
>      /*< public >*/
>      uint64_t input_freq;
>      int64_t etu;
>      int64_t trtime;
> -    int64_t tx_start_time;

It looks like you added this field in patch 1, where it wasn't used,
and then deleted it again in patch 2...

thanks
-- PMM

