Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AA8657261
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 04:35:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pANE9-0007u0-Np; Tue, 27 Dec 2022 22:35:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pANE6-0007tU-8u
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 22:35:35 -0500
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pANE3-0004gK-Ds
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 22:35:33 -0500
Received: by mail-vs1-xe2e.google.com with SMTP id a64so10961621vsc.2
 for <qemu-devel@nongnu.org>; Tue, 27 Dec 2022 19:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Tjo7n4g8k+2lVMq9n5hzYZv12YKdXxO+HlbRmxc/LF8=;
 b=PoJ2xsWh/rMfoFwQ2LpurPV5njdXpGc8N3hHDfZXge+Qxfb/fgqG0A6cN3zy9fP814
 RppLgDSoy4n6yI2HxP0r7DXM6boRRVkkSmvkTFYa9hwVuCVpHtUhVGZ2Zr5eW23/Xb2e
 Z++qtAs8pPF5WXSEKdPWFEBaizztr7FOIVp4EfQazX+5NuhoA5e2FuBV5N4EBaG4u1qu
 SsIhKIvUeNLB5/MOpL0f05jUFI5bcqT5M9lI7ImQjzLh42YqdkH722CA2LAT0zRk+hC8
 n2jpiqh/lqUOLHIvl+5wcVPe0PxNQC2NSkjnNiqbGWp+b9o24N0G1HuCfHDvu/cPRJ7P
 e/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tjo7n4g8k+2lVMq9n5hzYZv12YKdXxO+HlbRmxc/LF8=;
 b=b4/Yvde4LEqHy6RIe5hfnEqIqFUcW0w3K0WhmAplAEAuyC3qNRimxiwG0Dgaj4I1Lq
 dRgQWEmBSQqgKBNWpotFb0RhvJcTI+FZPTrYFkJr5ag57nUd2yA2LPedwmBTQixeJ/zq
 h5CsS2CUHWxKV9FJNzTwpzpCY+l9l2DQlkW8UKEBqWyVuNicQV7BQ+SOQWlx+R/E/3qN
 o5HQHSAvvnSkNpdOwwEu8fBSO4MOGx8ba644at2+bp3GxhDSMtNlLJeoEm/ytgxbEh2/
 o5OkKPUZmEGKJazuhZx5WncRFXB2o6/TGZfAmtR/ObBlvKwAif7MvoLaV9/CUzEvm6x4
 5E+A==
X-Gm-Message-State: AFqh2kqyPhntI3+tKnCUrgG0DqmSXn8b4nK9+kGvqLGje3HGUSw7dXXP
 Q0B1udytGs5UPzjpYtOA7jPI8zShleTlryoS0T0=
X-Google-Smtp-Source: AMrXdXtz+01NM85YOftkZ0KXUsvDo/kX/5WgbJr4enRuGPtNPWHQT6t9lfT0UFlhAil5/Hm7VUS6J2vba1nT1NeffeE=
X-Received: by 2002:a67:dc10:0:b0:3b3:7675:d423 with SMTP id
 x16-20020a67dc10000000b003b37675d423mr2670968vsj.72.1672198530348; Tue, 27
 Dec 2022 19:35:30 -0800 (PST)
MIME-Version: 1.0
References: <20221227064812.1903326-1-bmeng@tinylab.org>
 <20221227064812.1903326-5-bmeng@tinylab.org>
In-Reply-To: <20221227064812.1903326-5-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 28 Dec 2022 13:35:04 +1000
Message-ID: <CAKmqyKMwW3k0Df3QxbPQUXEqJsp9=9W46vi9t+jagtW7zx1LZQ@mail.gmail.com>
Subject: Re: [PATCH 04/12] hw/char: riscv_htif: Use conventional 's' for
 HTIFState
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2e.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Dec 27, 2022 at 4:52 PM Bin Meng <bmeng@tinylab.org> wrote:
>
> QEMU source codes tend to use 's' to represent the hardware state.
> Let's use it for HTIFState.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/char/riscv_htif.c | 64 ++++++++++++++++++++++----------------------
>  1 file changed, 32 insertions(+), 32 deletions(-)
>
> diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> index e7e319ca1d..f28976b110 100644
> --- a/hw/char/riscv_htif.c
> +++ b/hw/char/riscv_htif.c
> @@ -85,7 +85,7 @@ static int htif_can_recv(void *opaque)
>   */
>  static void htif_recv(void *opaque, const uint8_t *buf, int size)
>  {
> -    HTIFState *htifstate = opaque;
> +    HTIFState *s = opaque;
>
>      if (size != 1) {
>          return;
> @@ -97,10 +97,10 @@ static void htif_recv(void *opaque, const uint8_t *buf, int size)
>       *        will drop characters
>       */
>
> -    uint64_t val_written = htifstate->pending_read;
> +    uint64_t val_written = s->pending_read;
>      uint64_t resp = 0x100 | *buf;
>
> -    htifstate->env->mfromhost = (val_written >> 48 << 48) | (resp << 16 >> 16);
> +    s->env->mfromhost = (val_written >> 48 << 48) | (resp << 16 >> 16);
>  }
>
>  /*
> @@ -142,7 +142,7 @@ static int htif_be_change(void *opaque)
>   * For RV32, the tohost register is zero-extended, so only device=0 and
>   * command=0 (i.e. HTIF syscalls/exit codes) are supported.
>   */
> -static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
> +static void htif_handle_tohost_write(HTIFState *s, uint64_t val_written)
>  {
>      uint8_t device = val_written >> HTIF_DEV_SHIFT;
>      uint8_t cmd = val_written >> HTIF_CMD_SHIFT;
> @@ -174,11 +174,11 @@ static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
>          /* HTIF Console */
>          if (cmd == HTIF_CONSOLE_CMD_GETC) {
>              /* this should be a queue, but not yet implemented as such */
> -            htifstate->pending_read = val_written;
> -            htifstate->env->mtohost = 0; /* clear to indicate we read */
> +            s->pending_read = val_written;
> +            s->env->mtohost = 0; /* clear to indicate we read */
>              return;
>          } else if (cmd == HTIF_CONSOLE_CMD_PUTC) {
> -            qemu_chr_fe_write(&htifstate->chr, (uint8_t *)&payload, 1);
> +            qemu_chr_fe_write(&s->chr, (uint8_t *)&payload, 1);
>              resp = 0x100 | (uint8_t)payload;
>          } else {
>              qemu_log("HTIF device %d: unknown command\n", device);
> @@ -194,31 +194,31 @@ static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
>       * With this code disabled, qemu works with bbl priv v1.9.1 and v1.10.
>       * HTIF needs protocol documentation and a more complete state machine.
>       *
> -     *  while (!htifstate->fromhost_inprogress &&
> -     *      htifstate->env->mfromhost != 0x0) {
> +     *  while (!s->fromhost_inprogress &&
> +     *      s->env->mfromhost != 0x0) {
>       *  }
>       */
> -    htifstate->env->mfromhost = (val_written >> 48 << 48) | (resp << 16 >> 16);
> -    htifstate->env->mtohost = 0; /* clear to indicate we read */
> +    s->env->mfromhost = (val_written >> 48 << 48) | (resp << 16 >> 16);
> +    s->env->mtohost = 0; /* clear to indicate we read */
>  }
>
> -#define TOHOST_OFFSET1 (htifstate->tohost_offset)
> -#define TOHOST_OFFSET2 (htifstate->tohost_offset + 4)
> -#define FROMHOST_OFFSET1 (htifstate->fromhost_offset)
> -#define FROMHOST_OFFSET2 (htifstate->fromhost_offset + 4)
> +#define TOHOST_OFFSET1      (s->tohost_offset)
> +#define TOHOST_OFFSET2      (s->tohost_offset + 4)
> +#define FROMHOST_OFFSET1    (s->fromhost_offset)
> +#define FROMHOST_OFFSET2    (s->fromhost_offset + 4)
>
>  /* CPU wants to read an HTIF register */
>  static uint64_t htif_mm_read(void *opaque, hwaddr addr, unsigned size)
>  {
> -    HTIFState *htifstate = opaque;
> +    HTIFState *s = opaque;
>      if (addr == TOHOST_OFFSET1) {
> -        return htifstate->env->mtohost & 0xFFFFFFFF;
> +        return s->env->mtohost & 0xFFFFFFFF;
>      } else if (addr == TOHOST_OFFSET2) {
> -        return (htifstate->env->mtohost >> 32) & 0xFFFFFFFF;
> +        return (s->env->mtohost >> 32) & 0xFFFFFFFF;
>      } else if (addr == FROMHOST_OFFSET1) {
> -        return htifstate->env->mfromhost & 0xFFFFFFFF;
> +        return s->env->mfromhost & 0xFFFFFFFF;
>      } else if (addr == FROMHOST_OFFSET2) {
> -        return (htifstate->env->mfromhost >> 32) & 0xFFFFFFFF;
> +        return (s->env->mfromhost >> 32) & 0xFFFFFFFF;
>      } else {
>          qemu_log("Invalid htif read: address %016" PRIx64 "\n",
>              (uint64_t)addr);
> @@ -230,25 +230,25 @@ static uint64_t htif_mm_read(void *opaque, hwaddr addr, unsigned size)
>  static void htif_mm_write(void *opaque, hwaddr addr,
>                            uint64_t value, unsigned size)
>  {
> -    HTIFState *htifstate = opaque;
> +    HTIFState *s = opaque;
>      if (addr == TOHOST_OFFSET1) {
> -        if (htifstate->env->mtohost == 0x0) {
> -            htifstate->allow_tohost = 1;
> -            htifstate->env->mtohost = value & 0xFFFFFFFF;
> +        if (s->env->mtohost == 0x0) {
> +            s->allow_tohost = 1;
> +            s->env->mtohost = value & 0xFFFFFFFF;
>          } else {
> -            htifstate->allow_tohost = 0;
> +            s->allow_tohost = 0;
>          }
>      } else if (addr == TOHOST_OFFSET2) {
> -        if (htifstate->allow_tohost) {
> -            htifstate->env->mtohost |= value << 32;
> -            htif_handle_tohost_write(htifstate, htifstate->env->mtohost);
> +        if (s->allow_tohost) {
> +            s->env->mtohost |= value << 32;
> +            htif_handle_tohost_write(s, s->env->mtohost);
>          }
>      } else if (addr == FROMHOST_OFFSET1) {
> -        htifstate->fromhost_inprogress = 1;
> -        htifstate->env->mfromhost = value & 0xFFFFFFFF;
> +        s->fromhost_inprogress = 1;
> +        s->env->mfromhost = value & 0xFFFFFFFF;
>      } else if (addr == FROMHOST_OFFSET2) {
> -        htifstate->env->mfromhost |= value << 32;
> -        htifstate->fromhost_inprogress = 0;
> +        s->env->mfromhost |= value << 32;
> +        s->fromhost_inprogress = 0;
>      } else {
>          qemu_log("Invalid htif write: address %016" PRIx64 "\n",
>              (uint64_t)addr);
> --
> 2.34.1
>
>

