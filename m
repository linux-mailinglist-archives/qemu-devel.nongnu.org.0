Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC19D509F49
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 14:07:13 +0200 (CEST)
Received: from localhost ([::1]:39280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhVaa-0007Lf-Sd
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 08:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUyx-0000Qi-SN
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:28:19 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:35412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUyw-0005Ig-5F
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:28:19 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id t67so8203338ybi.2
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PFFa6K3zug0VPXPEIBmy+xyMxywEYUdRgjqzX9LBOic=;
 b=taVyFISfuh6Zik7b/CAn3yP1ihc5CD3bQHx+M0lFxm1gHaJI1cuJQs2T/EiCM6bjX6
 9nM+Q051xljVq9+Qa4MiziFNp/2Uke6UDdWE+QiogfijYkAwsJW9hJAvt55T8LBhVdUK
 avl6uk8d7PmiOPjrvPQVjWT5qcMOSS9tHNu4JbVBNkpQOrLOtYoRCLAYyF19iWEonCaV
 pG+D5QqHNl2pBc6q67y5UdicN+TYHiSB1AQjOjTd88YvYcofb1HQa9sSBQ3iMtOKPe/t
 B1yTtc89rkHSXYhm/kGoJSeHNyVva/h9zXiEniOBUNoIvhtNiwazvVHpnwXZOVPKpPjy
 egQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PFFa6K3zug0VPXPEIBmy+xyMxywEYUdRgjqzX9LBOic=;
 b=6RttlYLxxZHoPpL4d95Ylazf/a40jki82aiZdBxU5LLNUYZtCIomlIqOiq0Og0lhic
 Lgl2Fnja2FP4yk9OmjJ9kjMx6h7Qvqmk64R6aDPY4nic4elIlCP6LS9Jzp+dWCxuqDI+
 IxiESyP/qmCpNf5fXVponRrTH9OH7Oo9lC3K6IcEiQJ6qChMdPzIl6Oq9jXePNrT/7Y1
 0wX9S/FiEVv5PWM2Wv0Sjk0KqrYOpULpkFnWGov+ugRTRCN39RXxzRAk5kROxPDLjBym
 b004J9tsPepX+gEA+/q7ExCUXwoHiK7OjnytX2CnscpwAObcNk1nQ90SjVCJ4SfDF9JW
 81XQ==
X-Gm-Message-State: AOAM532UjSGCff1jEerl8AK+850FZFl+Jt0oL9p8XotrK7PCSGeFWwk5
 r1luz50NML5nQN0H1rCM95Q0gFWRLzAVq9DIwo1oJg==
X-Google-Smtp-Source: ABdhPJzpmzBeRGHfqcX3zE/UWlTSizEoHLUqmPxx4HxE+uCXwha4w+kMiKriHkp6bekFBMrgbppH1g4bY0UNsPnmNJE=
X-Received: by 2002:a05:6902:390:b0:645:7d46:f1db with SMTP id
 f16-20020a056902039000b006457d46f1dbmr493447ybs.85.1650540494606; Thu, 21 Apr
 2022 04:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
 <20220405223640.2595730-12-wuhaotsh@google.com>
In-Reply-To: <20220405223640.2595730-12-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 12:28:03 +0100
Message-ID: <CAFEAcA-7u_MNBb6XoXvNpRe00BJg-L9m+2hbaZe3GPa_D4B8ag@mail.gmail.com>
Subject: Re: [PATCH for-7.1 11/11] hw/arm: Add NPCM845 Evaluation board
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Uri.Trichter@nuvoton.com, titusr@google.com, venture@google.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, Vishal.Soni@microsoft.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 5 Apr 2022 at 23:38, Hao Wu <wuhaotsh@google.com> wrote:
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviwed-by: Patrick Venture <venture@google.com>
> ---
>  hw/arm/meson.build       |   2 +-
>  hw/arm/npcm8xx_boards.c  | 257 +++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/npcm8xx.h |  20 +++
>  3 files changed, 278 insertions(+), 1 deletion(-)
>  create mode 100644 hw/arm/npcm8xx_boards.c

> --- /dev/null
> +++ b/hw/arm/npcm8xx_boards.c
> @@ -0,0 +1,257 @@
> +/*
> + * Machine definitions for boards featuring an NPCM8xx SoC.
> + *
> + * Copyright 2022 Google LLC
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> + * for more details.
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "chardev/char.h"
> +#include "hw/arm/npcm8xx.h"
> +#include "hw/core/cpu.h"
> +#include "hw/loader.h"
> +#include "hw/qdev-core.h"
> +#include "hw/qdev-properties.h"
> +#include "qapi/error.h"
> +#include "qemu-common.h"

Don't include qemu-common.h unless you really need it (if you rebase
on current head-of-git you almost certainly don't, as it now contains
only a very few things, most of its previous contents having been split
into more specific header files). There are some patches in flight which
rename/delete it entirely, so if you don't #include it you'll avoid
a conflict when they land.

thanks
-- PMM

