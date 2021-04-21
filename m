Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8323662CD
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 02:02:56 +0200 (CEST)
Received: from localhost ([::1]:52876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ0KU-0005nc-Ep
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 20:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lZ0Im-0005OI-SD
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 20:01:08 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:44648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lZ0Il-0004Bg-0R
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 20:01:08 -0400
Received: by mail-il1-x136.google.com with SMTP id i22so28811486ila.11
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 17:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dS1dWBQDGVZl/gAf6VJmsBrOoYOCG6dpxUozG06ZWKQ=;
 b=U6sADDXDZmc5v4dnypalcV0EWCieZbjETuNVJpEgOC2mxuGgCkmmgiYG5z9dPOTRkQ
 gc7XkI7BL3/1+cE4oraym2QJKNm3oXIHc0sCPHXqEtbIyxd3OMWXx2oAn9wV/quSx4uz
 Va/H+rOyh3fsX/EAuVHgiS2MrYkh7NOsIb9HS6Sl76q9j13BGh3+p8UAiT47IFgVMrpn
 CCfx0TMPXrf1wKLAklAfwdMFJQSIcHN35NAT7PlXuIYRI6bueabmxiNlu0GFUA2LkKb7
 EzKhkpHCZ9uPYTtwt9GADXcH6L41dlxd5r/G7besEDB1GYU+iNVpuYyY0bllpSxwVoVB
 g5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dS1dWBQDGVZl/gAf6VJmsBrOoYOCG6dpxUozG06ZWKQ=;
 b=ks2hMFPn9O52vhnJP1zvMxS7nH4rGnGqW5pbtdKilPB+Cjv15tMGuQ7ilIrnT5TqTw
 h8RGFot4y6e0yWM0A3tGWT4GX9H9ZyRGM9AOF/Mpnyzub/HwEsPWRTWG9eH/8jHTk5f4
 rD3a8PzvXUAONTS8UlL3I2J3LM5ocYpk5zoMZYVrBCGTsDu0X36F/YudftK6VGoB5a7Q
 8R0Cnyc1VKgt+buNtMmxB/PBBdexCLigCJFFaqZFl1IRsRIgsxXVWca56MZBloZwnIAS
 qGqyA/Aib1Ok4c5cnUp66x88ll5nJlVx7J7OhzdhvJfY1AtxVi1uLFJzpS7zBzsfp6Dc
 AtKw==
X-Gm-Message-State: AOAM531uYz8JTeVkYyytrgbF3sC8Mpn9oZ79Bjy1tAC6KC9N/lf8A2K6
 qaORyf4r7rmZGXIgBnSWPKbya2N+2FmMfRFc/xc=
X-Google-Smtp-Source: ABdhPJwNVxqAvAA1prryH3aX8gS4enYlRzZu0pQcd3RVVZv4irSQrehM0nkq4fRZY268kun3o/rtscqfKg63spwtZQw=
X-Received: by 2002:a92:d68a:: with SMTP id p10mr23683026iln.40.1618963265825; 
 Tue, 20 Apr 2021 17:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210420080008.119798-1-alexander.wagner@ulal.de>
In-Reply-To: <20210420080008.119798-1-alexander.wagner@ulal.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 21 Apr 2021 10:00:39 +1000
Message-ID: <CAKmqyKNhDyO+jLgKnH6ixZkfzCCJYhVG7KUfrs5vzSSKwjCSTw@mail.gmail.com>
Subject: Re: [PATCH v2] hw/riscv: Fix OT IBEX reset vector
To: Alexander Wagner <alexander.wagner@ulal.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x136.google.com
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 20, 2021 at 6:01 PM Alexander Wagner
<alexander.wagner@ulal.de> wrote:
>
> The IBEX documentation [1] specifies the reset vector to be "the most
> significant 3 bytes of the boot address and the reset value (0x80) as
> the least significant byte".
>
> [1] https://github.com/lowRISC/ibex/blob/master/doc/03_reference/exception_interrupts.rst
>
> Signed-off-by: Alexander Wagner <alexander.wagner@ulal.de>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/riscv/opentitan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index e168bffe69..ca4c1be6f6 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -120,7 +120,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
>                              &error_abort);
>      object_property_set_int(OBJECT(&s->cpus), "num-harts", ms->smp.cpus,
>                              &error_abort);
> -    object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x8090, &error_abort);
> +    object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x8080, &error_abort);
>      sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_abort);
>
>      /* Boot ROM */
> --
> 2.25.1
>
>

