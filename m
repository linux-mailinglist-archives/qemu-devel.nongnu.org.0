Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B39A3FE7D4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 04:55:01 +0200 (CEST)
Received: from localhost ([::1]:40866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLcsW-00058h-JE
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 22:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mLcqP-00038B-Dh; Wed, 01 Sep 2021 22:52:49 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:33712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mLcqL-0007Rh-LQ; Wed, 01 Sep 2021 22:52:49 -0400
Received: by mail-io1-xd31.google.com with SMTP id f6so679383iox.0;
 Wed, 01 Sep 2021 19:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/aFGk5Km2g1C0UyWEoBpFRGsVtI/lw5n9ljC9IvxDBA=;
 b=U4mUcolGNVTp530KITyTrJ+6hAT2WaT4jcm3BI1fdcBp7/um5hEVQLsT5odMhriGo4
 Mbfa9redDQ4YpGIx56Mg+OXHY4RuqEwYXiOubeEFdha4UOcHghHlfETLCShaYW5kShOf
 w52I5uOTRr+cWl2Iwc3hIVkCuP8INYycKAo047+pyYaedjuTzBcgMMoFMd2Dlf4CLTao
 nQS0OYFyJwgn7Nfk+SLQCv/2FapxfggkozljFNX10BMc3/6Ib6fDg4FLfbeExTvn1yjQ
 pE/VXCsrUHHyw/19DGLNa1TgaEYGcCA0quV94dleWHheMuHzS7dGeKT7MWvEtWJ/kxYD
 G9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/aFGk5Km2g1C0UyWEoBpFRGsVtI/lw5n9ljC9IvxDBA=;
 b=OC9ENRdPJVcqvJJFvY04Y5qOjG9Cqjy5SYc/1OTeeViuL8FVvUAJQbAqxDkKmFNA1y
 JkYtHTx8kKCVajjzCmHbcQtkK6CcChuBjMUbAe5r4x0NBbmJ+gyuGcqF+ovnv/YskeqT
 orFgTyGO8mbZgZil+sahM7p3BVkagg1t2hc9keC1Pi1Q+kFAb+VJlgD+G6FLHPG82j6M
 LbOMXosKzCfgaLnD9ZHLw+q1MxKEjwcNL9rcN6qbIDjsh/2eTYLL3Q14cZzc2wR6m0lu
 XpZLnTqorDhOjtAnw98XEZ2kS4d5dCwJ9au4A7lsXEJq/dDCFVtx68uLn36YgCWbGboK
 +qYA==
X-Gm-Message-State: AOAM530l8lFlVlCdic83F73NjT4vOs6iDkoBG33+HJgE+cLNzK1iBQ5C
 jvpe93YUr87gVPeWWrSurDDoYMCOTYX0R+iensw=
X-Google-Smtp-Source: ABdhPJzm/jCPGh3AIHICKO8ynpRaTo91LFpq+CVoKjPh7kQkP9+IkJaA2G3LGgG9eBxHvEsZ8SwhQ3psldbqIDAqLLo=
X-Received: by 2002:a6b:8e87:: with SMTP id q129mr896514iod.176.1630551164045; 
 Wed, 01 Sep 2021 19:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210901124521.30599-1-bmeng.cn@gmail.com>
 <20210901124521.30599-7-bmeng.cn@gmail.com>
In-Reply-To: <20210901124521.30599-7-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Sep 2021 12:52:18 +1000
Message-ID: <CAKmqyKOFoNDXksQtWkF8BgGzNH+sirFMb_0TV3Qu82CB0L2Asg@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] hw/char: cadence_uart: Log a guest error when
 device is unclocked or in reset
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 1, 2021 at 10:52 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> We've got SW that expects FSBL (Bootlooader) to setup clocks and
> resets. It's quite common that users run that SW on QEMU without
> FSBL (FSBL typically requires the Xilinx tools installed). That's
> fine, since users can stil use -device loader to enable clocks etc.
>
> To help folks understand what's going, a log (guest-error) message
> would be helpful here. In particular with the serial port since
> things will go very quiet if they get things wrong.
>
> Suggested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> Changes in v3:
> - new patch: hw/char: cadence_uart: Log a guest error when unclocked or in reset
>
>  hw/char/cadence_uart.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index 5f5a4645ac..c069a30842 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -240,6 +240,8 @@ static int uart_can_receive(void *opaque)
>
>      /* ignore characters when unclocked or in reset */
>      if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: uart is unclocked or in reset\n",
> +                      __func__);
>          return 0;
>      }
>
> @@ -376,6 +378,8 @@ static void uart_event(void *opaque, QEMUChrEvent event)
>
>      /* ignore characters when unclocked or in reset */
>      if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: uart is unclocked or in reset\n",
> +                      __func__);
>          return;
>      }
>
> @@ -413,6 +417,8 @@ static MemTxResult uart_write(void *opaque, hwaddr offset,
>
>      /* ignore access when unclocked or in reset */
>      if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: uart is unclocked or in reset\n",
> +                      __func__);
>          return MEMTX_ERROR;
>      }
>
> @@ -478,6 +484,8 @@ static MemTxResult uart_read(void *opaque, hwaddr offset,
>
>      /* ignore access when unclocked or in reset */
>      if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: uart is unclocked or in reset\n",
> +                      __func__);
>          return MEMTX_ERROR;
>      }
>
> --
> 2.25.1
>
>

