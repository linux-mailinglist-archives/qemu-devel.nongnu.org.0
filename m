Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 512A0565781
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:37:22 +0200 (CEST)
Received: from localhost ([::1]:44918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8MGP-0003w2-Dp
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8LvP-0000ag-55
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:15:39 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:36840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8LvF-00021N-Db
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:15:38 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-31caffa4a45so10313637b3.3
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x8l7CpSDvTNLg1xYA72wI592g9/7VsLjTL8FFY8OsZ4=;
 b=Q3UsC/4JLlhLcXolYjrkAXbdQz5ATdy8eIGEmusaxaSSBT6sqCWkRW7/VEU415guRG
 RMeetJf7175SYP/gdgldY5JU9xNGw8X5qc3gEETUJXBStUxms635PZXOVC4+solhIdcG
 z4GU6g+KT8ePywDumXvQYGzFFb4qvfuZjRmakzQaCVfZTKoqXUfp6EEs1Qo+6U6Se0p5
 lyoV9c40Ao7DAMDf/2hnF7VXQceMRyLwWf3A70eWkQZ6zUF8nYLJYyVLbXutp0OhLM33
 3S0itqOq9ZhsJ2mVBC3Pit2UA/4fgi3lKA5XKdfBtNiembAkKm3sP0ie62Oc/tRnbs8o
 Jm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x8l7CpSDvTNLg1xYA72wI592g9/7VsLjTL8FFY8OsZ4=;
 b=J7nI9D3Kgdb+zmTyaA9q+zx+QywQwUKUTSE9G31m/p3h1DQy87jok22bEve0EIT5nE
 +z5+FgcvHHuggliUiDUzSI0OnkkLYtw8HR9uaEZqABm0U82RqfNqke29gJg6FSgZvwEC
 p34B2ujd5+ObXd1bFulWeGK1cTsyugicqBDBYBZ0L/58+z+gPF52UdGk7gzNfLcg01ER
 BKSjymDb1Ap5Zku9XuTAOZQbetV7Y5QgMwn6OkPrHiPPC3bEfdPagkUz0i8Z8QUah9QO
 rWn/Ke/f0VILAZuTR/xE8KTec1s/lhoun5t7rYOFtFsY6TBTUpCzJ7+nUVS51VfGk0Kd
 GVeQ==
X-Gm-Message-State: AJIora8XuHcPuET6WJboJTsaHmT8BrFq4hM6VIcbcb+1ljfHWw9uTI55
 sgiVNcLDoVGLld3KTw41ynRfGaqQcHzcJc9xQGgMzQ==
X-Google-Smtp-Source: AGRyM1sRuFPQdVHOqMD1wqyWzjmi4JFDwBRg97S4PRWfpvLPnzUgCjIlzxARIxwU5+q0PgrNt+JViSJNdiqNv9NOIwU=
X-Received: by 2002:a81:6a85:0:b0:31c:8624:b065 with SMTP id
 f127-20020a816a85000000b0031c8624b065mr11252237ywc.64.1656940528466; Mon, 04
 Jul 2022 06:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-5-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-5-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:15:17 +0100
Message-ID: <CAFEAcA_yTVPzWmN1kvDay0+6A4ds+2_rWRdcSZchX_Du7v6Yqw@mail.gmail.com>
Subject: Re: [PATCH 04/40] pl050: introduce new PL050_KBD_DEVICE QOM type
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 29 Jun 2022 at 13:40, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This will be soon be used to hold the underlying PS2_KBD_DEVICE object.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/pl050.c         | 3 ++-
>  include/hw/input/pl050.h | 7 +++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/hw/input/pl050.c b/hw/input/pl050.c
> index 0d91b0eaea..7f4ac99081 100644
> --- a/hw/input/pl050.c
> +++ b/hw/input/pl050.c
> @@ -182,9 +182,10 @@ static void pl050_mouse_init(Object *obj)
>  }
>
>  static const TypeInfo pl050_kbd_info = {
> -    .name          = "pl050_keyboard",
> +    .name          = TYPE_PL050_KBD_DEVICE,
>      .parent        = TYPE_PL050,
>      .instance_init = pl050_kbd_init,
> +    .instance_size = sizeof(PL050KbdState),
>  };

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

