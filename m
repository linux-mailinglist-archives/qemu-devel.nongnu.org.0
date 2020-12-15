Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D082DAA0D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 10:27:40 +0100 (CET)
Received: from localhost ([::1]:34844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp6cM-0007pO-71
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 04:27:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kp6bO-0007LY-6W; Tue, 15 Dec 2020 04:26:38 -0500
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:43571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kp6bM-0001up-K7; Tue, 15 Dec 2020 04:26:37 -0500
Received: by mail-yb1-xb43.google.com with SMTP id r127so18281381yba.10;
 Tue, 15 Dec 2020 01:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=edWerIJ48mREiTIvEB2cJ/VYO5sih7fadhS7qmEy2tE=;
 b=c69DM4lFtc4PaxM2Ku86s7dNWz/v/g13jKkAF5BwV5tZjHgv3L5CvBLXeKJfJk3Wi7
 cs7AWvCOuL+FgLbucj3V6szlTb+KNr16XfYwzneG4xBpcxsjhGQVrRh656jpofGHgtOA
 lC/72uYMhgDc2VHnvJe9WbQr+DqW9Z7EZNW2vUkrAdtu2svo3wnZnD5oY3RXHS8yLDg/
 aX+YgIGY/zN3f7xPJjI0D/I61nygwi+4SOeYd53cTLivvuX3yIRkAjj0hI2bgRznFKNu
 VfpuAJvGhi7C89egGXCLIfwdU+mvlgrf9rSt+/NAY7bqLxPdjpkcGqX9IbjPEIywmeeg
 iBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=edWerIJ48mREiTIvEB2cJ/VYO5sih7fadhS7qmEy2tE=;
 b=se5MapEGhT+EsaMKSMMbrOcUesHwEa0BLcGfgD8m2cpWDP1cJ56A5C3kmwnAbyS0Ls
 /CsCKcH4bhFDI29d03E7X+IoPZ0N24X7KbcgM2AtBOrlXr4Npr7n0b65CO10s8N5fRgI
 0HvYROsivYhi7RHWfVOmxmm8vXqGauY847pIeNtUioTQjZpdiEg9DXg1pqNSkZOW+66v
 k3R16BiVU+0rwgaPerqSj8ayeJlfTH2aHOZVZ2WxrigUYCzXhThVtoob01nei2y1XhEh
 srzWyJlu4G/A+QGlhILgwYLlkQvsqQx7ofrJvbgBLzQou/SvQZiFDelWytJOOYOpwraM
 9CGA==
X-Gm-Message-State: AOAM533rY6L16T3mQpFLCDTMYAOxxzL/RZQgK8Ocg1Ypd4vEFUUq4lT/
 g8VPQYzNkUv/STJvuod1qIy5+PaM9n36q+f/f54=
X-Google-Smtp-Source: ABdhPJz+t0wN549A9GcLUkCCgp8nFyxBufLHdUn7AxXTK1Uwpzygf0rzB1fUz1pFSkW3hVUFOJ/OL0kda0VmC1rGSnQ=
X-Received: by 2002:a25:690b:: with SMTP id e11mr40632566ybc.314.1608024393506; 
 Tue, 15 Dec 2020 01:26:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1607967113.git.alistair.francis@wdc.com>
 <3b6338af937d0d3aa0858ba1a4ad0fd9e759be66.1607967113.git.alistair.francis@wdc.com>
In-Reply-To: <3b6338af937d0d3aa0858ba1a4ad0fd9e759be66.1607967113.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 15 Dec 2020 17:26:22 +0800
Message-ID: <CAEUhbmUHE3vSvsz3JCSmgApCpJfs598FJkXsZBYVuP09u8x9tA@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] hw/riscv: Expand the is 32-bit check to support
 more CPUs
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b43;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb43.google.com
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 15, 2020 at 4:34 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Currently the riscv_is_32_bit() function only supports the generic rv32
> CPUs. Extend the function to support the SiFive and LowRISC CPUs as
> well.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/boot.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index d62f3dc758..3c70ac75d7 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -41,7 +41,17 @@
>
>  bool riscv_is_32_bit(MachineState *machine)
>  {
> -    if (!strncmp(machine->cpu_type, "rv32", 4)) {
> +    /*
> +     * To determine if the CPU is 32-bit we need to check a few different CPUs.
> +     *
> +     * If the CPU starts with rv32
> +     * If the CPU is a sifive 3 seriries CPU (E31, U34)
> +     * If it's the Ibex CPU
> +     */
> +    if (!strncmp(machine->cpu_type, "rv32", 4) ||
> +        (!strncmp(machine->cpu_type, "sifive", 6) &&
> +            machine->cpu_type[8] == '3') ||
> +        !strncmp(machine->cpu_type, "lowrisc-ibex", 12)) {

This does not look like a scalable way. With more and more CPU added
in the future, this may end up with a huge list of strncmps..

>          return true;
>      } else {
>          return false;

Regards,
Bin

