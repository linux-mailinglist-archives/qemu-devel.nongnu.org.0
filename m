Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926E830772C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 14:33:54 +0100 (CET)
Received: from localhost ([::1]:44080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l57Qn-0000gm-3I
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 08:33:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l57PI-0008TG-Uv
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:32:20 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:45736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l57PH-000138-7q
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:32:20 -0500
Received: by mail-ed1-x52e.google.com with SMTP id f1so6578422edr.12
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 05:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VCbuhUgseEdIad8g+kRBzhDOBtgRomK/CWVMXG9z46I=;
 b=ZHCuhA1pfHPUhmCrOZ8pZbPZJA4a31dvwGvdo+Vp3bXo04SyWV0SW1fIhzkqoICYNN
 Tk0C7E0nt+dTnzkLLhWUSV0k8yQsIVkDjCc6VgAPT4jBeRyJQVoH+Dppih+s+tN2D+XI
 FHTifIVbtS6HzEfQZ/iqV7gjfCkDQMvY7ep4TZOzsmOudq6oH3wwpVljRIL7ZKimdLE5
 2XsbW9Sr0RVBQL98sVsy0HPHR0iM6Z0Gp6S6e7/n7fxRT1sLaAruBW2RCOmvPbbeo6RI
 VrJCFjtvPD6GQIsvh7JGoqPV1QRJfrv0aZu3elqFOKLredqLsgmgmfKq6NrlWe6mRjPa
 w96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VCbuhUgseEdIad8g+kRBzhDOBtgRomK/CWVMXG9z46I=;
 b=LKU1pCufbSQkkhoLMQzGZ837W6iMsa7sbNNgsEM8Y/NRmsb1NwOpqW73+8g6mOUKEN
 LUM8JYeEbTI4+hJZW4+GXcRm+5osX1qyK1Fxm4Y0B7BcyuDnw4JvCAXtrpcQ/7Bvtc93
 4qEFVcDgoYsYuTZmnFBdHP7cpc+yj3BbzoIbUawmF7IZ37JMRdZEDtdHKZwVI+PgJA3k
 DLuX3MSNObNwi+PaKKq0v2NM+pqT6RQ0Ljx0Z9B4M5kKD36iPIJHDHH5uEcyw9p/Fd0b
 XsJsTbg3rY2e9ropWjB2u/jJyovuB3oYTeGwJJ+rCCdNDX/cXqVnA4KjjyieOjNFnAoA
 8GMA==
X-Gm-Message-State: AOAM5333tWjHgAvcy/Cd4NLZvzfCt51TfNMf6DZAbW4ZiQmnXi9dafdv
 uhTyHBeP79N9P0DKEGUkFaVxatHBOZzce3zGfzryww==
X-Google-Smtp-Source: ABdhPJwRFN8Vvj4rBzEwdtQ9QhJ8BrqAOfexyhaE68IkIGKlwyQRJ2fgY9UyJaz5ILCHbTfqGcfwFLneN5kW4drO7lo=
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr13117066edd.100.1611840737400; 
 Thu, 28 Jan 2021 05:32:17 -0800 (PST)
MIME-Version: 1.0
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
 <1611063546-20278-11-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1611063546-20278-11-git-send-email-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 13:32:06 +0000
Message-ID: <CAFEAcA9Dr5Wkd0KSvieX+smcGg51DNvt+DhBxibnNDGNHSsCtg@mail.gmail.com>
Subject: Re: [PATCH v8 10/10] hw/ssi: imx_spi: Correct tx and rx fifo
 endianness
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Jan 2021 at 13:40, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> The endianness of data exchange between tx and rx fifo is incorrect.
> Earlier bytes are supposed to show up on MSB and later bytes on LSB,
> ie: in big endian. The manual does not explicitly say this, but the
> U-Boot and Linux driver codes have a swap on the data transferred
> to tx fifo and from rx fifo.
>
> With this change, U-Boot read from / write to SPI flash tests pass.
>
>   => sf test 1ff000 1000
>   SPI flash test:
>   0 erase: 0 ticks, 4096000 KiB/s 32768.000 Mbps
>   1 check: 3 ticks, 1333 KiB/s 10.664 Mbps
>   2 write: 235 ticks, 17 KiB/s 0.136 Mbps
>   3 read: 2 ticks, 2000 KiB/s 16.000 Mbps
>   Test passed
>   0 erase: 0 ticks, 4096000 KiB/s 32768.000 Mbps
>   1 check: 3 ticks, 1333 KiB/s 10.664 Mbps
>   2 write: 235 ticks, 17 KiB/s 0.136 Mbps
>   3 read: 2 ticks, 2000 KiB/s 16.000 Mbps
>
> Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

