Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1F94FBA52
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 13:00:43 +0200 (CEST)
Received: from localhost ([::1]:47240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndrmk-0000Ux-Ja
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 07:00:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndreb-0006Qd-Fq
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 06:52:17 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:37733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndreZ-0003Tf-Oq
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 06:52:17 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2ebebe631ccso75627757b3.4
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 03:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=06ZWhCrHCc7V8kivDU9cjKy+8lGFD7ZELA3yTgE6Omc=;
 b=QGuvFFrxsGHDbq/YaOSncuHYKZzibIbvQDm1/MdHtNGa5goQolXQjjKF2Gv63X6gtD
 qIy9rlZy6lj8m3GpeWJ6lZH/vtezeylpzvw0K6jx0ytxp5VuwPz5I8jqUtIkDBULqM+I
 9s6xtzWQA9+MRd0/WMIg9/s3+xb7i9vhWI4fOY5ivCTWcv3H+fVojMjBQBbfBgHrRDAe
 F4rQqQSuX08X/X51lo3H3VrgfhGOswbu1CwTa3dgO0FUSrmqPAlq42V4Cd6TXhjuhGKt
 cgQvgIRZxRegktirV2A+eAW5jxQBg4j20UFVRlqhDlL5I8Ehd7A3TI6pmbaPACLwzBxC
 aevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=06ZWhCrHCc7V8kivDU9cjKy+8lGFD7ZELA3yTgE6Omc=;
 b=4PUJqKU52a7pt1gyQKh3l0a8x/ftI2ffAi4He+oxZXCUaWBncBHFWkhjO3yW5dGMc/
 k7RrMsjiPioWrVrsVyeF4r1t7KF1NVU/Yk1tO6nc+OwMcgmiDSHDrvQruxF/qM2wpfpR
 yQ9Jc1bFQLC/Pl4nENPzVoEonMSm8vUVdybxHC9D9yDE6dIk6pO6E8/NDAe2kcev1Wm0
 VHfcp9EmPABSbxuwnFn4ga3hJtkg0ZrirjlDr1fbYn4nx71EBaHkVjI3Yiy1VWxX8vXj
 8iEIRQCfZJKPrMenI/G44peEIZ8AiSiZK4yt2pMEPx4JohbE+7/Oc5dynbdRHzbQEUAY
 0D5g==
X-Gm-Message-State: AOAM532B3L58Wm254j63zaJiStacYedOLFym0dIRKTnC2kz03o7DCogg
 EV+r91jrP1zZb3QXvpsvh30TTU3Pw3f4locUdJg/ag==
X-Google-Smtp-Source: ABdhPJzalE5McVm0SansRGPFfcbiqYfUPKJAOE4qVd9CIO8BmrUKh9IHz3u1HCpT2VF4G/5Cqvw9mlOB/5poN4e/1kc=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr25850178ywb.257.1649674334845; Mon, 11
 Apr 2022 03:52:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220406223440.2901032-1-wuhaotsh@google.com>
 <20220406223440.2901032-2-wuhaotsh@google.com>
In-Reply-To: <20220406223440.2901032-2-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 11:52:03 +0100
Message-ID: <CAFEAcA9x7zu5PnsUQmE-mHDs1n-tLWkJqNV_HczvD6Zs3=rmDg@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/misc: Add PWRON STRAP bit fields in GCR module
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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
Cc: Uri.Trichter@nuvoton.com, titusr@google.com, venture@google.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, Vishal.Soni@microsoft.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 6 Apr 2022 at 23:34, Hao Wu <wuhaotsh@google.com> wrote:
>
> Similar to the Aspeed code in include/misc/aspeed_scu.h, we define
> the PWRON STRAP fields in their corresponding module for NPCM7XX.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Patrick Venture <venture@google.com>
> ---
>  include/hw/misc/npcm7xx_gcr.h | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/include/hw/misc/npcm7xx_gcr.h b/include/hw/misc/npcm7xx_gcr.h
> index 13109d9d32..98da5d171f 100644
> --- a/include/hw/misc/npcm7xx_gcr.h
> +++ b/include/hw/misc/npcm7xx_gcr.h
> @@ -19,6 +19,36 @@
>  #include "exec/memory.h"
>  #include "hw/sysbus.h"
>
> +/*
> + * NPCM7XX PWRON STRAP bit fields
> + * 12: SPI0 powered by VSBV3 at 1.8V
> + * 11: System flash attached to BMC
> + * 10: BSP alternative pins.
> + * 9:8: Flash UART command route enabled.
> + * 7: Security enabled.
> + * 6: HI-Z state control.
> + * 5: ECC disabled.
> + * 4: Reserved
> + * 3: JTAG2 enabled.
> + * 2:0: CPU and DRAM clock frequency.
> + */
> +#define NPCM7XX_PWRON_STRAP_SPI0F18                 BIT(12)
> +#define NPCM7XX_PWRON_STRAP_SFAB                    BIT(11)
> +#define NPCM7XX_PWRON_STRAP_BSPA                    BIT(10)
> +#define NPCM7XX_PWRON_STRAP_FUP(x)                  ((x) << 8)
> +#define     FUP_NORM_UART2      3
> +#define     FUP_PROG_UART3      2
> +#define     FUP_PROG_UART2      1
> +#define     FUP_NORM_UART3      0
> +#define NPCM7XX_PWRON_STRAP_SECEN                   BIT(7)
> +#define NPCM7XX_PWRON_STRAP_HIZ                     BIT(6)
> +#define NPCM7XX_PWRON_STRAP_ECC                     BIT(5)
> +#define NPCM7XX_PWRON_STRAP_RESERVE1                BIT(4)
> +#define NPCM7XX_PWRON_STRAP_J2EN                    BIT(3)
> +#define NPCM7XX_PWRON_STRAP_CKFRQ(x)                ((x) << 8)

Comment says clock frequency is bits [2:0] but macro definition
puts them in bits [9:8]...

> +#define     CKFRQ_SKIPINIT      (0x000)
> +#define     CKFRQ_DEFAULT       (0x111)

These don't need parentheses around them.

thanks
-- PMM

