Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2A73F4B90
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 15:19:50 +0200 (CEST)
Received: from localhost ([::1]:59860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI9rh-0004Mp-BK
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 09:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mI9n6-0008LP-Fv; Mon, 23 Aug 2021 09:15:04 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:36625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mI9n4-00027s-QU; Mon, 23 Aug 2021 09:15:04 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id f15so5694094ybg.3;
 Mon, 23 Aug 2021 06:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=spKdm9geKtE/E5yhEuEPimYw92h9jyC8g4zAbiYi/Xc=;
 b=DY86dlZqQPXDGKsl9c20bhgOKqHvcQXr8wbpP1BJge1vHTOJMnyKdFnhpszq8Mutsw
 Xa1gEeJYKJT45/7lVZ4OrlkqxXAkMZfleXpn7uanAj6J9wHe7+wD3mPMp2dECKo8ydWX
 rlB+IjQDvSw8ANm2re+jHBXDKUxd6i/+A5XJnZqEac/ZKQgaImO32oqOLK21etJI68DS
 WSYc1OvisvL4EowX5Y4voqJQKMNx8nf27v01f5QkbGV3yzbFQmA5PfbLrobPUGRt+KGN
 OCTRSe/k3uUVMGUa8IrWljDlG3qVcaC20lVeBgvkwDGMa2syxJkAj1Sz6FPOWWZQUrbh
 Au3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=spKdm9geKtE/E5yhEuEPimYw92h9jyC8g4zAbiYi/Xc=;
 b=ZB0J01vFcuODCuhZoFTv0+SnvYmFV1whaykl8Rlp8jakiekrv7lOhpk1lq8lR8SXE1
 e91mmSmzJOGw4DWgV9knJB/LrtfqZZbHMWMvRFuPRqcz0YWUI6CagoT87uIdccnF9jT/
 21dtcqK/WPMOCotvRrCEQGODTS005HnLS4PsihupcEJALijdi/1wIKwEUXu166dIpsYs
 GuQG1nxTtNo9o6xnvGbmC2IY8DkudepF/296IKhfxaSgMr6j3/lfp4AZyikVkEsx95Of
 fql0w1bdV7lx5rFHyFELARA2reB7zEt1JooOmoOpjvt0GOlUJqS89La1bhULY02uiXry
 vYSw==
X-Gm-Message-State: AOAM533IemDNooXIQ17G6thtC0H1ts5IhKE4+zOGX8b4ZxoMdmA0s+zW
 9nPjJeB6vCRny4QyIZ0V5cdI7YXGA0gMxhWkXMQ=
X-Google-Smtp-Source: ABdhPJzkb27hVEvYlQA33ZKvEC3WMQ+8RrfOZ7Cie01evw2oP3yJgxF8I67P0jtI6vpoViZJ4+SNrH/xnMzLB75tj/8=
X-Received: by 2002:a5b:304:: with SMTP id j4mr42814204ybp.314.1629724501331; 
 Mon, 23 Aug 2021 06:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210823020813.25192-1-bmeng.cn@gmail.com>
 <20210823020813.25192-3-bmeng.cn@gmail.com>
 <7997927e-3a66-aa0e-6099-f1efe3cbb9ee@amsat.org>
 <CAEUhbmVVRKebU-=k0WaxpaRe-E_UsLy_82K0PzRE=7xNHp9hGQ@mail.gmail.com>
 <abf7ac8e-c5bc-e239-ab9b-a9d868b477dc@amsat.org>
In-Reply-To: <abf7ac8e-c5bc-e239-ab9b-a9d868b477dc@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 23 Aug 2021 21:14:50 +0800
Message-ID: <CAEUhbmUbeYzbO0dnj2d6A58_Yb=Z9bWFd=1U=iP4GZTqDuz6xQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/char: cadence_uart: Disable transmit when input
 clock is disabled
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 23, 2021 at 6:43 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 8/23/21 11:57 AM, Bin Meng wrote:
> > On Mon, Aug 23, 2021 at 4:14 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org> wrote:
> >>
> >> On 8/23/21 4:08 AM, Bin Meng wrote:
> >>> At present when input clock is disabled, any character transmitted
> >>> to tx fifo can still show on the serial line, which is wrong.
> >>>
> >>> Fixes: b636db306e06 ("hw/char/cadence_uart: add clock support")
> >>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> >>> ---
> >>>
> >>>  hw/char/cadence_uart.c | 5 +++++
> >>>  1 file changed, 5 insertions(+)
> >>>
> >>> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> >>> index b4b5e8a3ee..154be34992 100644
> >>> --- a/hw/char/cadence_uart.c
> >>> +++ b/hw/char/cadence_uart.c
> >>> @@ -327,6 +327,11 @@ static gboolean cadence_uart_xmit(void *do_not_u=
se, GIOCondition cond,
> >>>  static void uart_write_tx_fifo(CadenceUARTState *s, const uint8_t *b=
uf,
> >>>                                 int size)
> >>>  {
> >>> +    /* ignore characters when unclocked or in reset */
> >>> +    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s)=
)) {
> >>> +        return;
> >>> +    }
> >>
> >> Incorrect handler?
> >>
> >
> > Sorry I don't get it. This patch is for the Tx path, while patch #3 is
> > for the Rx path.
>
> Sorry, I was not totally awake o_O
>
> -- >8 --
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index b4b5e8a3ee0..78990ea79dc 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -403,15 +403,20 @@ static void uart_read_rx_fifo(CadenceUARTState *s,
> uint32_t *c)
>      uart_update_status(s);
>  }
>
> -static void uart_write(void *opaque, hwaddr offset,
> -                          uint64_t value, unsigned size)
> +static MemTxResult uart_write(void *opaque, hwaddr offset, uint64_t valu=
e,
> +                              unsigned size, MemTxAttrs attrs)
>  {
>      CadenceUARTState *s =3D opaque;
>
> +    /* ignore characters when unclocked or in reset */
> +    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> +        return MEMTX_DECODE_ERROR;
> +    }
> +
>      DB_PRINT(" offset:%x data:%08x\n", (unsigned)offset, (unsigned)value=
);
>      offset >>=3D 2;
>      if (offset >=3D CADENCE_UART_R_MAX) {
> -        return;
> +        return MEMTX_OK;
>      }
>      switch (offset) {
>      case R_IER: /* ier (wts imr) */
> @@ -458,14 +463,21 @@ static void uart_write(void *opaque, hwaddr offset,
>          break;
>      }
>      uart_update_status(s);
> +
> +    return MEMTX_OK;
>  }
>
> -static uint64_t uart_read(void *opaque, hwaddr offset,
> -        unsigned size)
> +static MemTxResult uart_read(void *opaque, hwaddr offset, uint64_t *data=
,
> +                             unsigned size, MemTxAttrs attrs)
>  {
>      CadenceUARTState *s =3D opaque;
>      uint32_t c =3D 0;
>
> +    /* ignore characters when unclocked or in reset */
> +    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
> +        return MEMTX_DECODE_ERROR;
> +    }
> +
>      offset >>=3D 2;
>      if (offset >=3D CADENCE_UART_R_MAX) {
>          c =3D 0;
> @@ -476,12 +488,14 @@ static uint64_t uart_read(void *opaque, hwaddr offs=
et,
>      }
>
>      DB_PRINT(" offset:%x data:%08x\n", (unsigned)(offset << 2),
> (unsigned)c);
> -    return c;
> +    *data =3D c;
> +
> +    return MEMTX_OK;
>  }
>
>  static const MemoryRegionOps uart_ops =3D {
> -    .read =3D uart_read,
> -    .write =3D uart_write,
> +    .read_with_attrs =3D uart_read,
> +    .write_with_attrs =3D uart_write,
>      .endianness =3D DEVICE_NATIVE_ENDIAN,
>  };

Thanks, but I think the above change should be a totally separate patch.

Regards,
Bin

