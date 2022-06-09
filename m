Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BB4544D7D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:24:27 +0200 (CEST)
Received: from localhost ([::1]:37336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzI9C-0002Iq-6w
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFzH-0007Hi-Ci
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:06:05 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:40836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFzE-0000a3-MB
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:06:03 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id w2so41160653ybi.7
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 04:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FF+lW4l1rD3/qhWWyTh2XRqKAU4PcKOj5x+FeJQwbbA=;
 b=FahmkrRl1IEYLDmKQFKtHxJ3ZlKSXxVmsIP69If/CELeHHDfihvisZS0RwTp0mZLFc
 fA0mu+EAtdmn1NelQDzC0Ii82Mjfee6xtIFDYl9/jlcQVijABgNyWDeI7sO9P31mkmY5
 tUCW5HQSchY2AzSadcutMahp9aHha0KTGv7KmDK9xGDMjBdkmc34c+5LGH0PaV+FLGHa
 6iYSu5hNGf3Yr4ae5QvF1cgIASjHWUQGygwxuKc4tD3ClcKOL8j1aVkGTSLfUnc6vBZu
 eyBr5hBrUWVK+Cj4SlJFgEEwcvvO85W53VTPoy8yo69wWoggREm0V5wp3X/e/lNi1ViM
 VpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FF+lW4l1rD3/qhWWyTh2XRqKAU4PcKOj5x+FeJQwbbA=;
 b=7iMnpn3kMqIRTPYcw/Z5soNUHVzyVxqNZPFfwa7cOblbWnI1M2eOVP9snWXzUms45J
 xB6w71AXiabEa86TpzZxrczvItY9BwLE1mtzq4CDRrWXIsC2lhI+9G6090ruRa67IC3j
 1LPI6OBnO0eaXDmzvhqKwrR70icJ6v+NvF7hkHcuy+21Dk4WYgcgTP80fhgtTQI56mr8
 mXVS99HrJwiv8zIEI+U8VU3tqRPp+nyKUN+ozTXj0Taq5WnLrjE8aLarZ9ico5vXmJLh
 00lWn1SKOY98rIkSKAOMkRD+aI29h4pLt4zbnlgr1dA1rDFIMm07z0qTCqe8WADoHz8d
 w8YQ==
X-Gm-Message-State: AOAM532rwskP3TXSwRAlNqeGaw25eL3kz22r/52eAQkGPX56+Y3iF2Z7
 8rvPkFzcccgN6yK05DhzQN3bv6qIQgVqOYn/OwmSQw==
X-Google-Smtp-Source: ABdhPJzutjsOtzaNsX8vmTd3Csp5u7UbVRnZINr0ky1H0PGpcxWdlq2qmROHbSHHr0vazBVrTLh1YUVLqmHwpb5e8D8=
X-Received: by 2002:a05:6902:728:b0:663:5591:aa2c with SMTP id
 l8-20020a056902072800b006635591aa2cmr24938238ybt.288.1654772759681; Thu, 09
 Jun 2022 04:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-35-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-35-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 12:05:49 +0100
Message-ID: <CAFEAcA8dW9dAez-jtjiTiDN27DiqfbkOL5epp9PG_ibvsaQhwg@mail.gmail.com>
Subject: Re: [PATCH 34/50] ps2: add gpio for output IRQ and optionally use it
 in ps2_raise_irq() and ps2_lower_irq()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Define the gpio for the PS2 output IRQ in ps2_init() and add logic to optionally
> use it in ps2_raise_irq() and ps2_lower_irq() if the gpio is connected. If the
> gpio is not connected then call the legacy update_irq() function as before.
>
> This allows the incremental conversion of devices from the legacy update_irq()
> function to use gpios instead.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/ps2.c         | 21 +++++++++++++++++++--
>  include/hw/input/ps2.h |  4 ++++
>  2 files changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/hw/input/ps2.c b/hw/input/ps2.c
> index 214dda60bf..891eb7181c 100644
> --- a/hw/input/ps2.c
> +++ b/hw/input/ps2.c
> @@ -24,6 +24,7 @@
>
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
> +#include "hw/irq.h"
>  #include "hw/sysbus.h"
>  #include "hw/input/ps2.h"
>  #include "migration/vmstate.h"
> @@ -174,12 +175,20 @@ void ps2_queue_noirq(PS2State *s, int b)
>
>  static void ps2_raise_irq(PS2State *s)
>  {
> -    s->update_irq(s->update_arg, 1);
> +    if (s->irq) {

I know this code is going to go away in patch 50, but cleaner to write
 if (qemu_irq_is_connected(s->irq))
rather than directly testing for NULL.

> +        qemu_set_irq(s->irq, 1);
> +    } else {
> +        s->update_irq(s->update_arg, 1);
> +    }
>  }

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

