Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C376C65728F
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 05:32:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAO5R-0000oG-It; Tue, 27 Dec 2022 23:30:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pAO5M-0000nA-9M
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 23:30:36 -0500
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pAO5K-0008U3-8B
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 23:30:35 -0500
Received: by mail-vs1-xe34.google.com with SMTP id m2so14505474vsv.9
 for <qemu-devel@nongnu.org>; Tue, 27 Dec 2022 20:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HeOGVqFYJf+H8G5rRk02VKk2oKoA9VvwEIY/+CxGWjo=;
 b=W9Rw+MO6y2MBkz0dzD0AKqhtQH1hNKT7vKZdEQNqQ2AEaYj1nKTMBlfpWAymnIj8gj
 euTVlV1Qtdtpn5gqWJFa2QDKS/P6RskL0O9+oIMBTKGfCNVtBXRBb0IHglJMDenCrE4h
 491qDEd8gbCcyTJURo0UDOvhh+lHT1PsncmIhkzeAS+ccH/xtT2qf0MwAWfOdQ8AMb8+
 eaof/ikSMS4wNcwAgmu2rj9iyFBZpvNJiDWBawGgCgMxrsGsVSO57/sOENLNroFEejK7
 6+4Ig7715hIM37i+pgv+yPQ2xynMBDhRs3Rc07X/6cUDQSygjbzDdDm/AbeBFlVP4HhN
 GHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HeOGVqFYJf+H8G5rRk02VKk2oKoA9VvwEIY/+CxGWjo=;
 b=hsfkBY3px76WuRUyLK8gf4Bb3O8WTfu9IqCwdK5HTcWGlC2xlpuw3vS8cFe6YkpJ7p
 cX0UkB0L+WmFQZlo0MeOjr/TyrwID9xWbrAimgHJsDHhNzb4LPYzkWhvh0SphCAT277a
 gHN3J8bosJRKXpPy3C0jtDCAcvFnfIIhCKZNXI95k84yABp+MATS/ZcKWih8b89v/36B
 MAWre6Rxo1T5LbKjLcZjDWdVeHgX8FTCbhdsPTZYud6tQBUlvFXEwDwYnVcEJ4V5IQsH
 TW9tMawL6JixkiItpnKfqq2/3W8WNyTeX/zqWQDuQnNIMBlX4t4qeQpkP84YZhD0SLJI
 Zo/g==
X-Gm-Message-State: AFqh2kqiFdRcgIaq1QAh15PETsTk6XBUP+3Z785zywR4Zr59ite0LQQe
 qIg82WIXOcUCACp4FXwT6tGlGuyVtvtPrfaeIWBlA490ewM=
X-Google-Smtp-Source: AMrXdXs0EZhd6ootUvB0RJznZxDMQ9HrCimsRj/aHY+Z5BENLOfuqrGiu9aBjPXpPwSfGuQBSlZCFI7miJl5oZt1p7I=
X-Received: by 2002:a05:6102:f8c:b0:3c9:8cc2:dd04 with SMTP id
 e12-20020a0561020f8c00b003c98cc2dd04mr637345vsv.73.1672201833276; Tue, 27 Dec
 2022 20:30:33 -0800 (PST)
MIME-Version: 1.0
References: <20221227064812.1903326-1-bmeng@tinylab.org>
 <20221227064812.1903326-8-bmeng@tinylab.org>
In-Reply-To: <20221227064812.1903326-8-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 28 Dec 2022 14:30:07 +1000
Message-ID: <CAKmqyKOwKC8HVMmPMgga-w7k+3PdPW1=vp0EV23exGL7Guvy=A@mail.gmail.com>
Subject: Re: [PATCH 07/12] hw/char: riscv_htif: Support console output via
 proxy syscall
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
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

On Tue, Dec 27, 2022 at 4:49 PM Bin Meng <bmeng@tinylab.org> wrote:
>
> At present the HTIF proxy syscall is unsupported. On RV32, only
> device 0 is supported so there is no console device for RV32.
> The only way to implement console funtionality on RV32 is to
> support the SYS_WRITE syscall.
>
> With this commit, the Spike machine is able to boot the 32-bit
> OpenSBI generic image.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/char/riscv_htif.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> index 3bb0a37a3e..1477fc0090 100644
> --- a/hw/char/riscv_htif.c
> +++ b/hw/char/riscv_htif.c
> @@ -48,6 +48,9 @@
>  #define HTIF_CONSOLE_CMD_GETC   0
>  #define HTIF_CONSOLE_CMD_PUTC   1
>
> +/* PK system call number */
> +#define PK_SYS_WRITE            64
> +
>  static uint64_t fromhost_addr, tohost_addr;
>  static int address_symbol_set;
>
> @@ -165,7 +168,19 @@ static void htif_handle_tohost_write(HTIFState *s, uint64_t val_written)
>                  int exit_code = payload >> 1;
>                  exit(exit_code);
>              } else {
> -                qemu_log_mask(LOG_UNIMP, "pk syscall proxy not supported\n");
> +                uint64_t syscall[8];
> +                cpu_physical_memory_read(payload, syscall, sizeof(syscall));
> +                if (syscall[0] == PK_SYS_WRITE &&
> +                    syscall[1] == HTIF_DEV_CONSOLE &&
> +                    syscall[3] == HTIF_CONSOLE_CMD_PUTC) {
> +                    uint8_t ch;
> +                    cpu_physical_memory_read(syscall[2], &ch, 1);
> +                    qemu_chr_fe_write(&s->chr, &ch, 1);
> +                    resp = 0x100 | (uint8_t)payload;
> +                } else {
> +                    qemu_log_mask(LOG_UNIMP,
> +                                  "pk syscall proxy not supported\n");
> +                }
>              }
>          } else {
>              qemu_log("HTIF device %d: unknown command\n", device);
> --
> 2.34.1
>
>

