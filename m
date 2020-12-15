Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3712DB5BE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 22:17:39 +0100 (CET)
Received: from localhost ([::1]:50794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpHhS-0004Q6-32
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 16:17:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpHfz-0003JS-9X
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 16:16:07 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:33571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpHft-0003JU-Lr
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 16:16:06 -0500
Received: by mail-ej1-x62f.google.com with SMTP id b9so4821638ejy.0
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 13:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0nPVIi9ULHuVWhM92nHFIbquHtECXvikIIyG7vgAWvo=;
 b=FW6FpBKCPT7YdVnA/qRM0z4xniqDVvreFOH0ZmK/Eiyq5ckKDMQxFXo7PdYehRkHMh
 v33nzYrfTI4R5ubyt8zyyzPKbPJs//ys7eeM8MQTAe06ItnRH/Bdn9Ml1EKXfnv1YrNL
 qu/IR946ED8ULaNeaakfdTRr7Kjnvw4qUIx/j1sRvQ014L5dHqMFAJbTHxeA55OA6Pv+
 1c6WaJ5K+W1S3MMNk8JEWWVyBDfTHC+ZGesmULjziuJyV6enVf+bAX+3JjCnfsZwOtfN
 lklM6JIPZ+Wr9Q3J3tU8YZoQuXwc+Cj26lTFHQ8jEklclAaVJ6sRI62Cxd/Wimr0/gFO
 sKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0nPVIi9ULHuVWhM92nHFIbquHtECXvikIIyG7vgAWvo=;
 b=CC2OA90sS5uuEiUq3vgVeY8yHK5t8p9RR5ubdHSyPxwA9PTJFIbkHKwVAuPLi03OJY
 x7BDcF6Va0UtZb7t0k2YKN9sRbTBQSEhjERyPlSC73XO7B1F1KexGWDMKstaHzyLbOzl
 7adycyI8RTDEiIBzOc75GESlmBJIBKQ7Q6V1MkIL6dxB8VsoYhFHQeMBmh+NLj5zfdEv
 0wqboxlNKtN7kjfqUVopL3ixX7MZy8INrv88nXlgcPItseihH1sGHwIl34SNoJixAqaT
 1DLEYlBZfrWdzE6EBDfzUG+MKMYPdm9TAcAuhHtReHNwzwEo2KuY4LLzkBUYOL5jk1OS
 d7cw==
X-Gm-Message-State: AOAM531GZ8bRrg96w0o/PG2v6bYS+dciwuNsr1udCGokZJXdFP2qMquu
 r2cX9LE+VsnLyLuNSpsGYKWWwQYjBteEg0flU/lazQ==
X-Google-Smtp-Source: ABdhPJx4LvO/0CZfcKHT0ZQ3oiOz/J3jrqiQTnRsyL3tYg2a7kcsaXuglYvJ0WPSOQJZ0gyFOKZtjqXJxjSUG3X6EVw=
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr27823810ejd.382.1608066959466; 
 Tue, 15 Dec 2020 13:15:59 -0800 (PST)
MIME-Version: 1.0
References: <20201215141237.17868-1-peter.maydell@linaro.org>
 <20201215141237.17868-21-peter.maydell@linaro.org>
 <CAEUhbmUgROy8OTSkz6hv7YexMXT_U-iAF2O5Y_9RdZJcco_WGw@mail.gmail.com>
 <CAFEAcA93oDGjpmW4T4Qa5WLswui6C_dfVYxzW3UaJCSPi_XrDA@mail.gmail.com>
 <20201215154218.GA19541@fralle-msi>
In-Reply-To: <20201215154218.GA19541@fralle-msi>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Dec 2020 21:15:47 +0000
Message-ID: <CAFEAcA8xmO2uf0wT+nhciQt7ewHfEF79viKkVnsLOaRFtVz9UA@mail.gmail.com>
Subject: Re: [PULL 20/20] hw/block/m25p80: Fix Numonyx fast read dummy cycle
 count
To: Francisco Iglesias <frasse.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Bin Meng <bmeng.cn@gmail.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Joe Komlodi <joe.komlodi@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Dec 2020 at 15:42, Francisco Iglesias
<frasse.iglesias@gmail.com> wrote:
>
> Hello Peter,
>
> On [2020 Dec 15] Tue 15:11:00, Peter Maydell wrote:
> > On Tue, 15 Dec 2020 at 15:06, Bin Meng <bmeng.cn@gmail.com> wrote:
> > > I believe you tested this with Xilinx SPIPS but not some other controllers.
> > > Francisco and I had a discussion about dummy cycles implementation
> > > with different SPI controllers @
> > > http://patchwork.ozlabs.org/project/qemu-devel/patch/1606704602-59435-1-git-send-email-bmeng.cn@gmail.com/
> > > I would like to hear your thoughts. I think we should figure out a
> > > solution that fits all types of controllers.
> >
> > I don't have an opinion on the technical question. Do you want me
> > to drop this patch from the pullreq ?
>
> The patch is correct, it hasn't changed anything regarding how dummy cycles are
> modelled in m25p80 (nor this command currently works), it just corrects the
> situtation for when the volatile configuration register contains 0x0 or 0xF (as
> the commit message mentions).

OK. I've applied the pullreq (partly because this is my last working
day of the year and I don't have the time to respin it). We can
always revert/add fixes in January if necessary.

thanks
- PMM

