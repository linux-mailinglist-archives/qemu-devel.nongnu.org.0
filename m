Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F743FE7BA
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 04:35:47 +0200 (CEST)
Received: from localhost ([::1]:53808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLcZu-0002SE-MO
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 22:35:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mLcX0-0000SX-99; Wed, 01 Sep 2021 22:32:46 -0400
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:36578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mLcWy-0000RD-R0; Wed, 01 Sep 2021 22:32:46 -0400
Received: by mail-il1-x131.google.com with SMTP id x5so294772ill.3;
 Wed, 01 Sep 2021 19:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YjuKy3HbY3EHtLLd6vGP28y0Qj6j8DN92zTt9E/Wjyc=;
 b=lE6K2GNnjIrHy7V8AaNuuzgl0WKxMBT8Tkf74niVi3Ua3rYVR0Pc0okMk4PG95w2jR
 IZsSr5Eaq6C4MZj4TuV7d10ZMXEFAUQxTf2piK/D05Mteb20eGNrkDuivfZNOnFpIwao
 6erDbDeFdCK4LvH+EDfGIfCj1Jm848rjeYNDsKqshP3wkdHMe07H9kaPoio+aG2AwFe+
 iPBoYoVnxqBEiTR4U0QasvC4lRiC+4zh43+wCTfm1AH4fkRT5klwu2KGsiu434r3AlgU
 LFhwWU/OyknIO41Y3+XGCM2oY9ZL9fAouLLerBvXuSHcQwlGVtwF8yZYMWgfihvslUmx
 lGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YjuKy3HbY3EHtLLd6vGP28y0Qj6j8DN92zTt9E/Wjyc=;
 b=fvlBXEFggl+1DrExo8YcLaPEvT4cu0Mx+aRNHMXTJcM+HgRUbMk+86sEAWAntdSkK7
 OYmdTyqCt9g/lYtwfVYlb03qvJIer5dXxT+VXadjDIThgVKp7FRLpORFxcayOvyJYNKx
 7EOpu1YEVye6s0GlZMZsGo21RP2B/hZ79sj9mtHP3cdFhN3d9UoFQmkz+9dZs9fLAu4r
 MgM9WRXGQ0/Bs1xzbXZiUM+h3r8gHjDkcrnxPxHp11ILP9MiOpva9U9twTdAMsS1UQcg
 iaBorFS3tOH3Tok+O+LvPE5RPiSTMI6hcVuZBuEya8oPbcNuptkaC3HDuQ0xYE9+PiJe
 v36A==
X-Gm-Message-State: AOAM533M5GGZNahM+Vr8OLzfUX+5Ga+Q6WtPM+UPE+aOojUMYn5OU0d0
 vfYOK82ciVnR99wZHDmoYuHEgPBaVqT/uwV0IJ4=
X-Google-Smtp-Source: ABdhPJyk83b2A0wVWD+o4JYmgkgVXx6RtSWBn4Xpnd0q/iYsqwEwRMg4OXfUIpSCdFyaK4kV3A6cOI3miM3kgS5f9ZY=
X-Received: by 2002:a05:6e02:1044:: with SMTP id
 p4mr582453ilj.227.1630549963152; 
 Wed, 01 Sep 2021 19:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210901032724.23256-1-bmeng.cn@gmail.com>
 <20210901032724.23256-5-bmeng.cn@gmail.com>
In-Reply-To: <20210901032724.23256-5-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Sep 2021 12:32:17 +1000
Message-ID: <CAKmqyKON_E3Pgds3B8UV6_E-ZvVRNE=UYCdkEmX2Rw1a=zc-3A@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] hw/char: cadence_uart: Convert to
 memop_with_attrs() ops
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
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

On Wed, Sep 1, 2021 at 1:30 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> This converts uart_read() and uart_write() to memop_with_attrs() ops.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> Changes in v2:
> - new patch: hw/char: cadence_uart: Convert to memop_with_attrs() ops
>
>  hw/char/cadence_uart.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
>
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index fff8be3619..8bcf2b718a 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -411,15 +411,15 @@ static void uart_read_rx_fifo(CadenceUARTState *s, uint32_t *c)
>      uart_update_status(s);
>  }
>
> -static void uart_write(void *opaque, hwaddr offset,
> -                          uint64_t value, unsigned size)
> +static MemTxResult uart_write(void *opaque, hwaddr offset,
> +                              uint64_t value, unsigned size, MemTxAttrs attrs)
>  {
>      CadenceUARTState *s = opaque;
>
>      DB_PRINT(" offset:%x data:%08x\n", (unsigned)offset, (unsigned)value);
>      offset >>= 2;
>      if (offset >= CADENCE_UART_R_MAX) {
> -        return;
> +        return MEMTX_DECODE_ERROR;
>      }
>      switch (offset) {
>      case R_IER: /* ier (wts imr) */
> @@ -466,30 +466,34 @@ static void uart_write(void *opaque, hwaddr offset,
>          break;
>      }
>      uart_update_status(s);
> +
> +    return MEMTX_OK;
>  }
>
> -static uint64_t uart_read(void *opaque, hwaddr offset,
> -        unsigned size)
> +static MemTxResult uart_read(void *opaque, hwaddr offset,
> +                             uint64_t *value, unsigned size, MemTxAttrs attrs)
>  {
>      CadenceUARTState *s = opaque;
>      uint32_t c = 0;
>
>      offset >>= 2;
>      if (offset >= CADENCE_UART_R_MAX) {
> -        c = 0;
> -    } else if (offset == R_TX_RX) {
> +        return MEMTX_DECODE_ERROR;
> +    }
> +    if (offset == R_TX_RX) {
>          uart_read_rx_fifo(s, &c);
>      } else {
> -       c = s->r[offset];
> +        c = s->r[offset];
>      }
>
>      DB_PRINT(" offset:%x data:%08x\n", (unsigned)(offset << 2), (unsigned)c);
> -    return c;
> +    *value = c;
> +    return MEMTX_OK;
>  }
>
>  static const MemoryRegionOps uart_ops = {
> -    .read = uart_read,
> -    .write = uart_write,
> +    .read_with_attrs = uart_read,
> +    .write_with_attrs = uart_write,
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>
> --
> 2.25.1
>
>

