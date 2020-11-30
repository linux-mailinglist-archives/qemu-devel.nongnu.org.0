Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 950F52C84E4
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 14:17:35 +0100 (CET)
Received: from localhost ([::1]:45636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjj3e-0008Ar-Cy
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 08:17:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjin2-00066V-ET
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 08:00:24 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:43855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjimx-00049I-NH
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 08:00:24 -0500
Received: by mail-ej1-x643.google.com with SMTP id jx16so21039689ejb.10
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 05:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CPo73sHR4PRMlUPYlJHzAwKVQCvRQFhfEQOLwdmgRLg=;
 b=Hj0gXJgaqbI7J28JoNWmJHxQBACMF625URmWKommOeQko/KEskan6JrfaYQWkGKG2z
 V5PNhMLHK3wAy2/8kqg/dMXMd22HH9Pz7s5dFnRy6BfCexH44c2G7jHviUu5+C6NVpiY
 liVfJanspoFCxppCHLCSSJNrkZ9vHwr2ctim/1l1K0BU7fT6p9Cv295Sx83es7tTbvi5
 uhFVF97cRw5HbvBq5Xt30JIsZHmRHDk2PpgpkJc1UfAQgGgOfHzddoLP60XQWi0Qho3p
 RpX9M5eFlxRrmwnxTRUtg2PPN7fHgFySy7MWh7HtUei5KiLWqcyDpF3yLygMnES+Bq15
 UckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CPo73sHR4PRMlUPYlJHzAwKVQCvRQFhfEQOLwdmgRLg=;
 b=bsyhLm+VZCFVvlTE23Kgzwmu+7ym+0BqkxylAP7QZqCCIuGbyU4ew4Lixog0GHShYr
 iJkXCcuREalsvg1fZLGyifSyibTLxZrK30Qr0BYUlNxuVeglx5RpQWam1giKHWQ+6sUx
 lNwI3aBH68J7aIqR/QFCW6RAskh8s6iZo5sPtqTOGh+HY5/9PvygKoEeqjqqsdhdUYfU
 ff+2GE41vqOXq/Sr18jH3dt6A2jognvq/cd0SXUFb4BmwpggAVzHZhKGcULOyDbf9O0p
 k1kKemF8qwKu1o90FYKP+QuC48fXocybhWO+SSx7bloeJ6m46ecuGF+LQ9KjtKjGLpL+
 rVag==
X-Gm-Message-State: AOAM530K6M8LMpGvCIptzbd6ufs4Q9rweSpgOSWbHGdOZmpjfm9ZIMYm
 rrwvgrjlf29goFcsLRlDbVg6QDtKaYz012x/sn0rSQ==
X-Google-Smtp-Source: ABdhPJwCyHQ1+H7NWoGrWnhhxjUettZ4UnNwP9wTWySHSeUNXoyNEhewMrUpk/1t5J8IErW0vFliYR76P6zZTADfcho=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr3633403ejf.407.1606741217346; 
 Mon, 30 Nov 2020 05:00:17 -0800 (PST)
MIME-Version: 1.0
References: <20201109030452.2197-1-fangying1@huawei.com>
 <20201109030452.2197-11-fangying1@huawei.com>
In-Reply-To: <20201109030452.2197-11-fangying1@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Nov 2020 13:00:06 +0000
Message-ID: <CAFEAcA-CuagYtA_9c7KrkvoBJqKnUNnT7M=C_MN1EnU4k1kAxQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 10/13] target/arm/cpu: Add cpu cache description
 for arm
To: Ying Fang <fangying1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
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
Cc: Andrew Jones <drjones@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Igor Mammedov <imammedo@redhat.com>, salil.mehta@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 9 Nov 2020 at 03:05, Ying Fang <fangying1@huawei.com> wrote:
>
> Add the CPUCacheInfo structure to hold cpu cache information for ARM cpus.
> A classic three level cache topology is used here. The default cache
> capacity is given and userspace can overwrite these values.
>
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> ---
>  target/arm/cpu.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>  target/arm/cpu.h | 27 +++++++++++++++++++++++++++
>  2 files changed, 69 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 056319859f..f1bac7452c 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -27,6 +27,7 @@
>  #include "qapi/visitor.h"
>  #include "cpu.h"
>  #include "internals.h"
> +#include "qemu/units.h"
>  #include "exec/exec-all.h"
>  #include "hw/qdev-properties.h"
>  #if !defined(CONFIG_USER_ONLY)
> @@ -997,6 +998,45 @@ uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz)
>      return (Aff1 << ARM_AFF1_SHIFT) | Aff0;
>  }
>
> +static CPUCaches default_cache_info = {
> +    .l1d_cache = &(CPUCacheInfo) {
> +    .type = DATA_CACHE,
> +        .level = 1,
> +        .size = 64 * KiB,
> +        .line_size = 64,
> +        .associativity = 4,
> +        .sets = 256,
> +        .attributes = 0x02,
> +    },

Would it be possible to populate this structure from the
CLIDR/CCSIDR ID register values, rather than having to
specify the same thing in two places?

thanks
-- PMM

