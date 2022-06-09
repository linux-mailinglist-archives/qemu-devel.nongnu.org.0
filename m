Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A1F544D46
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:15:14 +0200 (CEST)
Received: from localhost ([::1]:52580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzI0G-0001Iq-B7
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:15:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFn6-0004kw-Ei
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:53:31 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:44200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFn4-0006zT-Rm
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:53:28 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-30ec2aa3b6cso236397237b3.11
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 03:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=twoIaDQGo7IO7tLSZBCdsHybIfo61vQYmCYuEG26Lrs=;
 b=sIpfySLApKHz8WDHPQcdMoh++nmpw3/JSK505m3x6iY7+WZ4wv6abD0ypS+zDFPs4M
 t6vW6DdkWOkm4jWBiE1U3f9gHLTum8pllg/s00oISyFV2Viv3rys9oPkwrc41TLiKNkA
 8FYEPcYugEWbXlOn2S07PLQhgTYh//n8F385C5J4tz7+bCyZU28J5IPsaQMtB7zlXmWM
 22Yuc+Gc+ODEZAdyJdVabhdO1xsyo766O/YIrdw/CzSvsfiGjbcn8NkIb1liqvKzG1al
 6P30Trep7E79phxBtlbKTs6UiAvK5gvIFtBtsymY4tAQZgFFfaHdQk4Fl3Q2nBjvR9Gk
 mPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=twoIaDQGo7IO7tLSZBCdsHybIfo61vQYmCYuEG26Lrs=;
 b=6sIM6EoggEgyBrAoeFZVZiEYrCfdogNc/UYCj13OUma1pZs3fLr5RMhI7iIhaVoKZb
 eljhm8mCJ5DH/8EssS3+ysAI2ilAS3mw8665MwBtfpgt0esvXhVEdxDNix89mAbTSf5C
 VMm97dxPSJo4xkjEknhEjeVFlBZfogjP6d9f5mn0+eBvikn+1WDwg5FisFsOL78YA1PS
 afvd1SfEIHiqqJZD6KDapUs3uX0TA2Puw2za8pCfF+TPXwRypaJeljaUBCs94s229RzK
 P7QoqLBUhEQkomxg8p8j/r+UiTQvTM4o6/WR7SpXQzZ6XZYVsuH9vsf8wI0iyCNcCsZ5
 gfQw==
X-Gm-Message-State: AOAM5301GLQkj0OYv/kwv7BewV5rDvmArBhwBtAviMibpr9WVG6Bb1AC
 PByhBAnpTVEa55d4Qjk03f+QpCL8JCP+sTO9rvLJ6A==
X-Google-Smtp-Source: ABdhPJyCiUi+7ubVLBIvYjKAddRKc9w7hsAu4l6fVt/AK2OtDxP1TyM9d8Fpsu3RS8g7T9hXBbxwh1HkI0Q/+f9hdYw=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr42442863ywb.257.1654772005845; Thu, 09
 Jun 2022 03:53:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-27-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-27-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 11:53:15 +0100
Message-ID: <CAFEAcA-VHn9qWQdUgOHDy6QQwuGwf5p2BXUOjG-zq4NPenf2PQ@mail.gmail.com>
Subject: Re: [PATCH 26/50] pckbd: implement i8042_mmio_init() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Sun, 22 May 2022 at 19:19, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This enables use to expose the register memory region of the I8042_MMIO device
> using sysbus_init_mmio().
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/pckbd.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
> index addd1f058a..c407c082e2 100644
> --- a/hw/input/pckbd.c
> +++ b/hw/input/pckbd.c
> @@ -683,6 +683,13 @@ static void i8042_mmio_realize(DeviceState *dev, Error **errp)
>                            "i8042", s->size);
>  }
>
> +static void i8042_mmio_init(Object *obj)
> +{
> +    MMIOKBDState *s = I8042_MMIO(obj);
> +
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->region);
> +}

You don't initialize s->region until your device realize function;
you should only call sysbus_init_mmio() after that, so this line
belongs in the realize function too.

thanks
-- PMM

