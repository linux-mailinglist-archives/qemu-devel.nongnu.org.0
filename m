Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB765E6804
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 18:04:03 +0200 (CEST)
Received: from localhost ([::1]:45752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obOgE-0004mM-4Y
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 12:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obNTv-0000uh-AH
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:47:15 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:35700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obNTh-0004iJ-98
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:47:15 -0400
Received: by mail-ej1-x633.google.com with SMTP id sd10so13214428ejc.2
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 07:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=GkWxW+owXfuzmLHw4aDN3rkB+vhpc7rTMfWkm6p4Ht0=;
 b=HGJhBSuoBz/2YcsTW61tzR/ejIxlVsvOf+MWUp/n0pqebANc+VHEx2X4J6e4Vg9K9Z
 BqDZHk8J3K3T83N4oGvWitB+0MUSKugulSfWZ6eWrBzs8Uggrle2MR+vcLN+pxFTDpFf
 PdKD3a2DxAEVIbaKC7QfGvfcN2dSSwm0j0Sm6/yOEz1yNQQE5IW0CGZ5+jSE5uXnpE/l
 TxrAqR9gdMF2uyoV7z6IEBaPcP5tPCDbMDE4LBqQoz7WdWi+PqehRi8iP7zoPXUe6Q76
 /4Pw/2N6yUnH8VIdoxQB1Auv9h+B/5ht47KoAy3VdaC0xwh0Q9jtAPJJm0ki8GGU8+J4
 iqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=GkWxW+owXfuzmLHw4aDN3rkB+vhpc7rTMfWkm6p4Ht0=;
 b=rmz4Ci9dKzUBo3q+O6nSCbbSPaFaDEVwePeUr9dqg+eaPxessNsTTdX5zRjXI3ykJ6
 NCU7/8ouPzFW6lA4E6okCxRTZnEArXflnjkpCxNIxki7cmcf1sXLOS4UP0zI9/aAfNGL
 tobj9grnl06Seflb3mge0aGMN+9yP70XQ7nhDs9IkU+FxVbynt/Z3/Jbcgyv24ye7B19
 OknNj9hMX8Hujxl2+BK6Ebqa7Hbrow1o/wYuuxd/Xb+yDAQCtmbuqNpKXveyf2p08i+/
 wKTKOzV8uURorWwy/PV5sOUyKl1zW5+AL05ViFHmflCQg2Sec5/KrTxzOim4qARDRn6q
 61Kw==
X-Gm-Message-State: ACrzQf0yBaqHbOj9udy30xVziS8Bq3DHyswZOyczWZG8JkeenmF5OM5L
 Z3MscM0JNwYf9J+Y4+QLHm/shb9SxlDcJFXwzgMLgQ==
X-Google-Smtp-Source: AMsMyM73I+7MvQWIMCpziNRESqsmVCXjb7JxkhZZYOlI7QI6Sr9N3Luz3a3WOsJpbei5ZqJw6T2wIIa3AKfXPoZXU9Y=
X-Received: by 2002:a17:906:db05:b0:741:5730:270e with SMTP id
 xj5-20020a170906db0500b007415730270emr3031555ejb.609.1663858019363; Thu, 22
 Sep 2022 07:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220910061252.2614-1-vikram.garhwal@amd.com>
 <20220910061252.2614-2-vikram.garhwal@amd.com>
In-Reply-To: <20220910061252.2614-2-vikram.garhwal@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2022 15:46:48 +0100
Message-ID: <CAFEAcA9=O6yPo9RdFWgq6eJZ=7vX4bQFuaoV6y+JCoM-=+TSTg@mail.gmail.com>
Subject: Re: [QEMU][PATCH 2/5] hw/net/can: Introduce Xilinx Versal CANFD
 controller
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, edgar.iglesias@amd.com, francisco.iglesias@amd.com, 
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sat, 10 Sept 2022 at 07:13, Vikram Garhwal <vikram.garhwal@amd.com> wrote:
>
> The Xilinx Versal CANFD controller is developed based on SocketCAN, QEMU CAN bus
> implementation. Bus connection and socketCAN connection for each CAN module
> can be set through command lines.
>
> Example for using connecting CANFD0 and CANFD1 to same bus:
>     -machine xlnx-versal-virt
>     -object can-bus,id=canbus
>     -machine canbus0=canbus
>     -machine canbus1=canbus
>
> To create virtual CAN on the host machine, please check the QEMU CAN docs:
> https://github.com/qemu/qemu/blob/master/docs/can.txt

That link is a 404. You could just give the relative path to the
docs in the repo, which is docs/system/devices/can.rst

For the machine specifics, you should include (either in the patch 4
where you add this to the xlnx-versal-virt board, or in a separate patch
if it seems too big) updates to docs/system/arm/xlnx-versal-virt.rst
which document the new functionality, including, if it's useful to users,
some documentation of how to use it.


> +/* To avoid the build issues on Windows machines. */
> +#undef ERROR

What ?

> +static void canfd_config_mode(XlnxVersalCANFDState *s)
> +{
> +    register_reset(&s->reg_info[R_ERROR_COUNTER_REGISTER]);
> +    register_reset(&s->reg_info[R_ERROR_STATUS_REGISTER]);
> +    register_reset(&s->reg_info[R_STATUS_REGISTER]);
> +
> +    /* Put XlnxVersalCANFDState in configuration mode. */
> +    ARRAY_FIELD_DP32(s->regs, STATUS_REGISTER, CONFIG, 1);
> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, WKUP, 0);
> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, SLP, 0);
> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, BSOFF, 0);
> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, ERROR, 0);
> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXFOFLW, 0);
> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXFOFLW_1, 0);
> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXOK, 0);
> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, TXOK, 0);
> +    ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, ARBLST, 0);
> +
> +    /* Clear the time stamp. */
> +    ptimer_transaction_begin(s->canfd_timer);
> +    ptimer_set_count(s->canfd_timer, 0);
> +    ptimer_transaction_commit(s->canfd_timer);
> +
> +    canfd_update_irq(s);
> +}
> +

A lot of this looks like it's just copy-and-pasted code from
the existing hw/net/can/xlnx-zynqmp-can.c. Is this just an
updated/extra-features version of that device? Is there some
way we can share the code rather than duplicating 2000-odd lines ?

> +#ifndef HW_CANFD_XILINX_H
> +#define HW_CANFD_XILINX_H
> +
> +#include "hw/register.h"
> +#include "hw/ptimer.h"
> +#include "net/can_emu.h"
> +#include "hw/qdev-clock.h"
> +
> +#define TYPE_XILINX_CANFD "xlnx.versal-canfd"

Should this be a dot or a comma? The codebase has examples of
both for xlnx devices :-(

> +
> +#define XILINX_CANFD(obj) \
> +     OBJECT_CHECK(XlnxVersalCANFDState, (obj), TYPE_XILINX_CANFD)

Please use OBJECT_DECLARE_SIMPLE_TYPE() rather than defining the
cast macro by hand.

> +
> +#define NUM_REGS_PER_MSG_SPACE 18
> +#define MAX_NUM_RX             64
> +#define CANFD_TIMER_MAX        0XFFFFUL

Don't use capital X in the 0x hex prefix, please.

> +#define CANFD_DEFAULT_CLOCK    (24 * 1000 * 1000)
> +
> +/* 0x4144/4 + 1 + (64 - 1) * 18 + 1. */

This comment isn't very informative. The #define itself is much
better because it uses symbolic constants.

What is the magic number 0x4144. It should either be defined via
some kind of symbolic constant, or if that's not possible at least
explained in a comment.

> +#define XLNX_VERSAL_CANFD_R_MAX (0x4144 / 4  + \
> +                    ((MAX_NUM_RX - 1) * NUM_REGS_PER_MSG_SPACE) + 1)

thanks
-- PMM

