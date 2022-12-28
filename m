Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BCB65725A
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 04:33:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pANBM-0005C0-K4; Tue, 27 Dec 2022 22:32:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pANAy-0005Ao-Aw
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 22:32:25 -0500
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pANAw-00047l-E6
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 22:32:20 -0500
Received: by mail-vk1-xa35.google.com with SMTP id h4so2073365vkn.3
 for <qemu-devel@nongnu.org>; Tue, 27 Dec 2022 19:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=q9lEtzsofOvApyr7xMmOiWpT/W8cGVdouS/VsmjC6yg=;
 b=RZWzlEd3QAxDiNrE85oGkb9ZjqIRB3V716enpzZk+cE4WQ101n8RcwVZ725Tp7wcnp
 BU4Dr64hGeTeAu7c2l2x05WXCbzYztZ5uMsBjQTrb3lg9Bq3yyf6EapA+6b2MoMTR7i7
 tUaEwE65O7lrcP24LGZwmwiJZp9Xw6OK7JSp6rN1ZlbiE5TGUZgEx5yNsCZxRxhQ6CdD
 3DKIH7xgeYpp9THqCJh1IL2O7yN1f17vdSBksqYeF10qIha0hHhA7HU920jgYhgopf/j
 /UYR6C8Jc47/6Qsf/7NJyyaA8XFL2Gb6Sv4jLpX0r0gmMRehwLL6+aKL9josPqI4s0D/
 FgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q9lEtzsofOvApyr7xMmOiWpT/W8cGVdouS/VsmjC6yg=;
 b=YfBlfkQ1SGDoQddI+jgKEOUGR1mCeR3+gWBi2ARezg1bt2ThWPTDuUSwYnB4WsH7Y7
 we4r6dNB+AwSGGRHelmoFDWlaCuzKKMKIwHpZSn6vKY2aAyYIV1NK1zUihKdHtlXYPo8
 vYVcAaOaHrA7ZRFntJn/81mSjhNUNftiBp94V7cvic4GeoewYgHh/iilAeoXvysxHg0E
 akyAHyUc9fi/hghbQsEXWSj0vzTM+6ut0p5wIqGq5aXmkxhCba6bQYnhwSkZ4sS7c9H4
 cHc5CtEgel38FriGMc/jcBl9q14XO1Z3ejBfXgJASvcO3Na1weVZCb9FxLqT7yi+VyME
 +4Dg==
X-Gm-Message-State: AFqh2krb9B5m4b3K0JHOos9WBCMQo9NHuQoN3AdEuHrhbq61pVRlZiGb
 A1dyhalao97D97qzKBxcj56CrXhR58ccKf2iasQKVQmEBKU=
X-Google-Smtp-Source: AMrXdXs34eezcFjO+JzHA+TfYG9QxvjZc9IJQvNU8oLDYdg4FyI3x0DgxYQJ34aqk00kHnx/2VEfVn9zaZfCMefZoMw=
X-Received: by 2002:a1f:a954:0:b0:3b8:ba98:bd43 with SMTP id
 s81-20020a1fa954000000b003b8ba98bd43mr2631668vke.34.1672198336800; Tue, 27
 Dec 2022 19:32:16 -0800 (PST)
MIME-Version: 1.0
References: <20221227064812.1903326-1-bmeng@tinylab.org>
 <20221227064812.1903326-2-bmeng@tinylab.org>
In-Reply-To: <20221227064812.1903326-2-bmeng@tinylab.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 28 Dec 2022 13:31:50 +1000
Message-ID: <CAKmqyKNMt+ccSque7h74ijaTm_OScDY1rkN+cBpV+ZYSi+gihQ@mail.gmail.com>
Subject: Re: [PATCH 01/12] hw/char: riscv_htif: Avoid using magic numbers
To: Bin Meng <bmeng@tinylab.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa35.google.com
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

On Tue, Dec 27, 2022 at 4:50 PM Bin Meng <bmeng@tinylab.org> wrote:
>
> The Spike HTIF is poorly documented. The only relevant info we can
> get from the internet is from Andrew Waterman at [1].
>
> Add a comment block before htif_handle_tohost_write() to explain
> the tohost register format, and use meaningful macros intead of
> magic numbers in the codes.
>
> While we are here, corret 2 multi-line comment blocks that have
> wrong format.
>
> Link: https://github.com/riscv-software-src/riscv-isa-sim/issues/364 [1]
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
>  hw/char/riscv_htif.c | 72 ++++++++++++++++++++++++++++++++------------
>  1 file changed, 52 insertions(+), 20 deletions(-)
>
> diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
> index 6577f0e640..088556bb04 100644
> --- a/hw/char/riscv_htif.c
> +++ b/hw/char/riscv_htif.c
> @@ -38,6 +38,16 @@
>          }                                                                      \
>      } while (0)
>
> +#define HTIF_DEV_SHIFT          56
> +#define HTIF_CMD_SHIFT          48
> +
> +#define HTIF_DEV_SYSTEM         0
> +#define HTIF_DEV_CONSOLE        1
> +
> +#define HTIF_SYSTEM_CMD_SYSCALL 0
> +#define HTIF_CONSOLE_CMD_GETC   0
> +#define HTIF_CONSOLE_CMD_PUTC   1
> +
>  static uint64_t fromhost_addr, tohost_addr;
>  static int address_symbol_set;
>
> @@ -81,9 +91,11 @@ static void htif_recv(void *opaque, const uint8_t *buf, int size)
>          return;
>      }
>
> -    /* TODO - we need to check whether mfromhost is zero which indicates
> -              the device is ready to receive. The current implementation
> -              will drop characters */
> +    /*
> +     * TODO - we need to check whether mfromhost is zero which indicates
> +     *        the device is ready to receive. The current implementation
> +     *        will drop characters
> +     */
>
>      uint64_t val_written = htifstate->pending_read;
>      uint64_t resp = 0x100 | *buf;
> @@ -110,10 +122,30 @@ static int htif_be_change(void *opaque)
>      return 0;
>  }
>
> +/*
> + * See below the tohost register format.
> + *
> + * Bits 63:56 indicate the "device".
> + * Bits 55:48 indicate the "command".
> + *
> + * Device 0 is the syscall device, which is used to emulate Unixy syscalls.
> + * It only implements command 0, which has two subfunctions:
> + * - If bit 0 is clear, then bits 47:0 represent a pointer to a struct
> + *   describing the syscall.
> + * - If bit 1 is set, then bits 47:1 represent an exit code, with a zero
> + *   value indicating success and other values indicating failure.
> + *
> + * Device 1 is the blocking character device.
> + * - Command 0 reads a character
> + * - Command 1 writes a character from the 8 LSBs of tohost
> + *
> + * For RV32, the tohost register is zero-extended, so only device=0 and
> + * command=0 (i.e. HTIF syscalls/exit codes) are supported.
> + */
>  static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
>  {
> -    uint8_t device = val_written >> 56;
> -    uint8_t cmd = val_written >> 48;
> +    uint8_t device = val_written >> HTIF_DEV_SHIFT;
> +    uint8_t cmd = val_written >> HTIF_CMD_SHIFT;
>      uint64_t payload = val_written & 0xFFFFFFFFFFFFULL;
>      int resp = 0;
>
> @@ -125,9 +157,9 @@ static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
>       * 0: riscv-tests Pass/Fail Reporting Only (no syscall proxy)
>       * 1: Console
>       */
> -    if (unlikely(device == 0x0)) {
> +    if (unlikely(device == HTIF_DEV_SYSTEM)) {
>          /* frontend syscall handler, shutdown and exit code support */
> -        if (cmd == 0x0) {
> +        if (cmd == HTIF_SYSTEM_CMD_SYSCALL) {
>              if (payload & 0x1) {
>                  /* exit code */
>                  int exit_code = payload >> 1;
> @@ -138,14 +170,14 @@ static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
>          } else {
>              qemu_log("HTIF device %d: unknown command\n", device);
>          }
> -    } else if (likely(device == 0x1)) {
> +    } else if (likely(device == HTIF_DEV_CONSOLE)) {
>          /* HTIF Console */
> -        if (cmd == 0x0) {
> +        if (cmd == HTIF_CONSOLE_CMD_GETC) {
>              /* this should be a queue, but not yet implemented as such */
>              htifstate->pending_read = val_written;
>              htifstate->env->mtohost = 0; /* clear to indicate we read */
>              return;
> -        } else if (cmd == 0x1) {
> +        } else if (cmd == HTIF_CONSOLE_CMD_PUTC) {
>              qemu_chr_fe_write(&htifstate->chr, (uint8_t *)&payload, 1);
>              resp = 0x100 | (uint8_t)payload;
>          } else {
> @@ -157,15 +189,15 @@ static void htif_handle_tohost_write(HTIFState *htifstate, uint64_t val_written)
>              " payload: %016" PRIx64, device, cmd, payload & 0xFF, payload);
>      }
>      /*
> -     * - latest bbl does not set fromhost to 0 if there is a value in tohost
> -     * - with this code enabled, qemu hangs waiting for fromhost to go to 0
> -     * - with this code disabled, qemu works with bbl priv v1.9.1 and v1.10
> -     * - HTIF needs protocol documentation and a more complete state machine
> -
> -        while (!htifstate->fromhost_inprogress &&
> -            htifstate->env->mfromhost != 0x0) {
> -        }
> -    */
> +     * Latest bbl does not set fromhost to 0 if there is a value in tohost.
> +     * With this code enabled, qemu hangs waiting for fromhost to go to 0.
> +     * With this code disabled, qemu works with bbl priv v1.9.1 and v1.10.
> +     * HTIF needs protocol documentation and a more complete state machine.
> +     *
> +     *  while (!htifstate->fromhost_inprogress &&
> +     *      htifstate->env->mfromhost != 0x0) {
> +     *  }
> +     */
>      htifstate->env->mfromhost = (val_written >> 48 << 48) | (resp << 16 >> 16);
>      htifstate->env->mtohost = 0; /* clear to indicate we read */
>  }
> @@ -196,7 +228,7 @@ static uint64_t htif_mm_read(void *opaque, hwaddr addr, unsigned size)
>
>  /* CPU wrote to an HTIF register */
>  static void htif_mm_write(void *opaque, hwaddr addr,
> -                            uint64_t value, unsigned size)
> +                          uint64_t value, unsigned size)
>  {
>      HTIFState *htifstate = opaque;
>      if (addr == TOHOST_OFFSET1) {
> --
> 2.34.1
>
>

