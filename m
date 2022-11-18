Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A63AD62F995
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 16:43:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow3Vs-0006f9-C5; Fri, 18 Nov 2022 10:42:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow3Vo-0006ec-Fc
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 10:42:40 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow3Vj-0000uz-1J
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 10:42:39 -0500
Received: by mail-pl1-x630.google.com with SMTP id 4so4920270pli.0
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 07:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KPQxCp0nDUndTIOOn4qJmlBsDTJ9eVNzbLVediVE5q8=;
 b=JVieQgjt/0Vg8QsU4SXHU1c3A9NaXK4fiSN6MSqpWJ9nep4nkKVgmqtGBZwjsQuuM7
 NyP1k3H/y00rDdsoB4pNV6GZHdL3OudeWe72xYwuqLjs6vYT0p1fJe3TaJ86Tcq0WyEl
 HRBC4SJzBUgR42mpYh1X/Cw20GGXXPlzubZ6TGJqv7xkDZEDPX4niIJ4fNXWcWLfWugE
 v6XLXypSBuPfN9xBHDKhp8dQcshAhTDuMZzQf7EZUEAdo9VFaVpngcYQxM1t07kH+Nc1
 C0FuHTa4NeKEDBb2fxYBgRAQ0OfeT4QPkf9+86HiQbpvtoDHrMr+fEg8Mpxy9TmrZSbw
 7rsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KPQxCp0nDUndTIOOn4qJmlBsDTJ9eVNzbLVediVE5q8=;
 b=NFjIXF6fYnUwY1oMHJP3gwQh+1UglaS797JS/O+WNjMuBEhLE0GcjE7HXZYHDcpBFz
 RMfvTv+yFa1SY/QbFyXS2Sy7ILfECGV21QsvkXv9mDE+VER2/U1Y158RpDX/gHWg3CCG
 FmTfsI2AsihkYtsp7JTZq6Oo9HgvehYVZH1iJj5Pp4WqEsxLlpuP7vmq57wV2lVhhGDT
 FMcmZ642fce2k5vMjEmoD9I/9CtfeaZ7H1bUmbIFjvAc6BmW5oBVs1qvNEfEu9s84CVw
 cZg7Cxh90ZYJ9NixgifCyya0rQb0E8w5H7Fq6nBgwuns4pyLKu2oEYrpyFa+/AWTP040
 QTPA==
X-Gm-Message-State: ANoB5pni5z4C7DrKY5DQal4C81OhwrdVEbq80G5mX6Uo7GeUKX8wZLjY
 hmjWVFkLVhzs6IjszCevfJoIrLxh5W1ZYZUuU5qBLQ==
X-Google-Smtp-Source: AA0mqf7kfjiUHXZZ/tbTTEyagcEK8stjMn8hE0FBChmTh9Q9TZcDc3BC+40JYxoVAdTzF1Y5xGfMxujHqNDJrzMBD9Y=
X-Received: by 2002:a17:902:b18a:b0:188:5240:50ec with SMTP id
 s10-20020a170902b18a00b00188524050ecmr8029711plr.168.1668786153667; Fri, 18
 Nov 2022 07:42:33 -0800 (PST)
MIME-Version: 1.0
References: <166783932395.3279.1096141058484230644-0@git.sr.ht>
 <166783932395.3279.1096141058484230644-4@git.sr.ht>
In-Reply-To: <166783932395.3279.1096141058484230644-4@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Nov 2022 15:42:22 +0000
Message-ID: <CAFEAcA-RoriU5nz3LYmHgQ3ah+50PeGqpWuYL=zE8nfPSCf82w@mail.gmail.com>
Subject: Re: [PATCH qemu.git v2 4/9] hw/timer/imx_epit: software reset clears
 the interrupt
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, 7 Nov 2022 at 16:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
> ---
>  hw/timer/imx_epit.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
> index 2e9dae0bc8..5315d9633e 100644
> --- a/hw/timer/imx_epit.c
> +++ b/hw/timer/imx_epit.c
> @@ -94,6 +94,10 @@ static void imx_epit_reset(DeviceState *dev)
>      s->lr = EPIT_TIMER_MAX;
>      s->cmp = 0;
>      s->cnt = 0;
> +
> +    /* clear the interrupt */
> +    qemu_irq_lower(s->irq);
> +
>      ptimer_transaction_begin(s->timer_cmp);
>      ptimer_transaction_begin(s->timer_reload);
>      /* stop both timers */
> --

It's not valid to call qemu_irq_set/qemu_irq_lower from a legacy
reset function (because whether it has an effect or not
depends on whether the device on the other end of the line gets
reset before or after this one, and there is no guaranteed
order for devices being reset). The convention is that if the
post-reset state of the IRQ line is 0, then you don't do anything.
The device on the other end will reset into a state corresponding
to "the input line is 0".

thanks
-- PMM

