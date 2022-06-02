Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5333C53B0D5
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 02:40:27 +0200 (CEST)
Received: from localhost ([::1]:51024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwYsz-0005Er-Hu
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 20:40:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwYop-0003o8-J4; Wed, 01 Jun 2022 20:36:10 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:39886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwYon-00040X-PQ; Wed, 01 Jun 2022 20:36:07 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 w19-20020a9d6393000000b0060aeb359ca8so2407857otk.6; 
 Wed, 01 Jun 2022 17:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2h7+pDxxHVmgE2R/UdwCACCYRRU9YglMv2eX0ZE7HWM=;
 b=icchz9qVEzjES+Tn3jqWz/ngfLCLr9k3rWPIZLtIMsXtcvZej02IxW4QUpYYfMgVxY
 ZiNQGJpfDGzbhJC4MPbwBiRDOhNGradZE0PxQulBf5gDQew94w5PDtIkXkHS8rjoAftz
 KoyM1jOmRV6Y2pAUFU4tU+4lX12waqfcoJ5ENEw0SLmGcedgQiroLNPgESkG1JbrRcSX
 WmaKYCFQlOaAaBXhem9BU6/HvU5EnA3BR0pb79GQsMEp8QjTS1sNvPm0yeUtARO2b0lv
 glE/ifi/P0YVgN/hBY5TudwxuH9AXCnr1FWF7Y1ILaa4nOzpe/Bg2IHQ/eBYXIQYmOza
 jw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2h7+pDxxHVmgE2R/UdwCACCYRRU9YglMv2eX0ZE7HWM=;
 b=UKpnFWM0rfp9UPRuglKiaVnB/uBOsC8AnZY29YLpVVqCVwb7TAgKb4UaXHrbLnAyly
 vw3hOoqONDxSJPrSR9VvVfsEO7IyUcAtvzmxROuCYWUAM7JGovyWb5dJBbLeX/akRfoB
 b5X/3CJNIyne3klphH5dlooBVDdNrXSkw3LJa0jMhhHnkU4KAI0ImOolUpwLK0xTQHLN
 f8rzq/JJLoWh2AU/5aUL3oBw9qjK6DKcRwIZEB+ZdBV+gb/4kWbM11ZR/jggxDv7/0Fn
 +sSy8MPS5t34O01d7SEiMFWZ8u0xuLJoZlANUTYbjGezJ9K2BYCyVhwEwJKZhnfGe09g
 Jcjg==
X-Gm-Message-State: AOAM532avQh06mreISVEvW2O3/9OPMwDrFRUMhvIVQYbfRs/cyES+scx
 4dMtwGvUIve7Dsa/tKmWNoLLp4DYq2Rrf+JZkkE=
X-Google-Smtp-Source: ABdhPJwj2MhOsBUZL2WI3eKB4CBuQyx3X13kkZYJl/RjeLxYKDWYE9qtMTH5cLsV6r7GlL8WJ5xNQCFoC+FZQMWfYYw=
X-Received: by 2002:a05:6830:18dc:b0:60a:e7a3:dbe7 with SMTP id
 v28-20020a05683018dc00b0060ae7a3dbe7mr1071853ote.186.1654130164264; Wed, 01
 Jun 2022 17:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220601172353.3220232-1-fkonrad@xilinx.com>
 <20220601172353.3220232-3-fkonrad@xilinx.com>
In-Reply-To: <20220601172353.3220232-3-fkonrad@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Jun 2022 10:35:38 +1000
Message-ID: <CAKmqyKMCHDTOd4Qenmd3K2LNk-OZ89rtETvTK3UHAJH57jPxSQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] xlnx_dp: Introduce a vblank signal
To: frederic.konrad@xilinx.com
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
 Edgar Iglesias <edgar.iglesias@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>, Sai Pavan Boddu <saipava@xilinx.com>,
 Edgar Iglesias <edgari@xilinx.com>, fkonrad@amd.com, 
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=alistair23@gmail.com; helo=mail-ot1-x336.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Thu, Jun 2, 2022 at 3:29 AM <frederic.konrad@xilinx.com> wrote:
>
> From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
>
> Add a periodic timer which raises vblank at a frequency of 30Hz.
>
> Signed-off-by: Sai Pavan Boddu <saipava@xilinx.com>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Changes by fkonrad:
>   - Switched to transaction-based ptimer API.
>   - Added the DP_INT_VBLNK_START macro.
> Signed-off-by: Frederic Konrad <fkonrad@amd.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/display/xlnx_dp.c         | 28 +++++++++++++++++++++++++---
>  include/hw/display/xlnx_dp.h |  3 +++
>  2 files changed, 28 insertions(+), 3 deletions(-)
>
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index 0378570459..d0bea512bd 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -114,6 +114,7 @@
>  #define DP_TX_N_AUD                         (0x032C >> 2)
>  #define DP_TX_AUDIO_EXT_DATA(n)             ((0x0330 + 4 * n) >> 2)
>  #define DP_INT_STATUS                       (0x03A0 >> 2)
> +#define DP_INT_VBLNK_START                  (1 << 13)
>  #define DP_INT_MASK                         (0x03A4 >> 2)
>  #define DP_INT_EN                           (0x03A8 >> 2)
>  #define DP_INT_DS                           (0x03AC >> 2)
> @@ -270,10 +271,15 @@ static const VMStateDescription vmstate_dp = {
>                               DP_VBLEND_REG_ARRAY_SIZE),
>          VMSTATE_UINT32_ARRAY(audio_registers, XlnxDPState,
>                               DP_AUDIO_REG_ARRAY_SIZE),
> +        VMSTATE_PTIMER(vblank, XlnxDPState),
>          VMSTATE_END_OF_LIST()
>      }
>  };
>
> +#define DP_VBLANK_PTIMER_POLICY (PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD | \
> +                                 PTIMER_POLICY_CONTINUOUS_TRIGGER |    \
> +                                 PTIMER_POLICY_NO_IMMEDIATE_TRIGGER)
> +
>  static void xlnx_dp_update_irq(XlnxDPState *s);
>
>  static uint64_t xlnx_dp_audio_read(void *opaque, hwaddr offset, unsigned size)
> @@ -773,6 +779,13 @@ static void xlnx_dp_write(void *opaque, hwaddr offset, uint64_t value,
>          break;
>      case DP_TRANSMITTER_ENABLE:
>          s->core_registers[offset] = value & 0x01;
> +        ptimer_transaction_begin(s->vblank);
> +        if (value & 0x1) {
> +            ptimer_run(s->vblank, 0);
> +        } else {
> +            ptimer_stop(s->vblank);
> +        }
> +        ptimer_transaction_commit(s->vblank);
>          break;
>      case DP_FORCE_SCRAMBLER_RESET:
>          /*
> @@ -1177,9 +1190,6 @@ static void xlnx_dp_update_display(void *opaque)
>          return;
>      }
>
> -    s->core_registers[DP_INT_STATUS] |= (1 << 13);
> -    xlnx_dp_update_irq(s);
> -
>      xlnx_dpdma_trigger_vsync_irq(s->dpdma);
>
>      /*
> @@ -1275,6 +1285,14 @@ static void xlnx_dp_finalize(Object *obj)
>      fifo8_destroy(&s->rx_fifo);
>  }
>
> +static void vblank_hit(void *opaque)
> +{
> +    XlnxDPState *s = XLNX_DP(opaque);
> +
> +    s->core_registers[DP_INT_STATUS] |= DP_INT_VBLNK_START;
> +    xlnx_dp_update_irq(s);
> +}
> +
>  static void xlnx_dp_realize(DeviceState *dev, Error **errp)
>  {
>      XlnxDPState *s = XLNX_DP(dev);
> @@ -1309,6 +1327,10 @@ static void xlnx_dp_realize(DeviceState *dev, Error **errp)
>                                             &as);
>      AUD_set_volume_out(s->amixer_output_stream, 0, 255, 255);
>      xlnx_dp_audio_activate(s);
> +    s->vblank = ptimer_init(vblank_hit, s, DP_VBLANK_PTIMER_POLICY);
> +    ptimer_transaction_begin(s->vblank);
> +    ptimer_set_freq(s->vblank, 30);
> +    ptimer_transaction_commit(s->vblank);
>  }
>
>  static void xlnx_dp_reset(DeviceState *dev)
> diff --git a/include/hw/display/xlnx_dp.h b/include/hw/display/xlnx_dp.h
> index 1ef5a89ee7..e86a87f235 100644
> --- a/include/hw/display/xlnx_dp.h
> +++ b/include/hw/display/xlnx_dp.h
> @@ -35,6 +35,7 @@
>  #include "hw/dma/xlnx_dpdma.h"
>  #include "audio/audio.h"
>  #include "qom/object.h"
> +#include "hw/ptimer.h"
>
>  #define AUD_CHBUF_MAX_DEPTH                 (32 * KiB)
>  #define MAX_QEMU_BUFFER_SIZE                (4 * KiB)
> @@ -107,6 +108,8 @@ struct XlnxDPState {
>       */
>      DPCDState *dpcd;
>      I2CDDCState *edid;
> +
> +    ptimer_state *vblank;
>  };
>
>  #define TYPE_XLNX_DP "xlnx.v-dp"
> --
> 2.25.1
>
>

