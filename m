Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 459D32B03BC
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 12:21:30 +0100 (CET)
Received: from localhost ([::1]:49466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdAfR-0006uO-AO
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 06:21:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdAe4-0005vU-FT
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 06:20:04 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:42291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdAe2-00078k-OG
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 06:20:04 -0500
Received: by mail-ej1-x641.google.com with SMTP id i19so7132399ejx.9
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 03:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mtwx3yW8Bx9Eq+J79CcgK1B8BYkrAaVYqOyBWsnkb4E=;
 b=wkXzMSiRcDwuXW+/+bAtM94LLteDSvraggq73XdG2UadnYKFW8QUYgkjftDhagivct
 pgWl+ArErdZsV8eT+PjWkEWXmxrVKGy95UeMj8F/X80iuRSt9WNhXmXbHm1ULjTXtpi3
 rGUx95RNfO+A3r7cz3KrA9bFlJB1x1SspFcgDycfHxA1k9t6dxzsrhsim/I11L6jRtzX
 9s2PqvASdezwlmJKrLvI1nVv+iTpxXNHot+p8O9WUs0JPnPROZXlWn0gJcIFMXiUYwIX
 z5pIVROBCbo+aY9zAujFc0rqaEX7kS2uKzEfYna9RpRfaW4dk3kULu0AOgG5JqJ4EP1t
 VN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mtwx3yW8Bx9Eq+J79CcgK1B8BYkrAaVYqOyBWsnkb4E=;
 b=atO2lSbA8VqzXKgMug2SFdAPuIh/kSLXT/9OSNaSX1zHfV6sPoBy0rNyPtrNiXCbtJ
 zHK8mFa01iU+PRjBH+4YRuKfpkIT5HjM9q/MBPQCc5BHQK0XHH/UWwVLawM76TwpYFNI
 /hpvbuPJMKe9KYJ2MkETI1+mFQOHKl+gimkEuYhjJbcTa1x90Q2d5W2iOB7jb2aSg1I9
 cxS8e9HTR7f7ac3kGbUFkz3BawsOlcHYRMXgQizKa0P1SQYTZwqhb5RKuuyTxcjmve4Q
 8oeqC/jZIw4Ty6jcOKzlzaCwF+uDzIkXBwVOWVEDJoKMmjwt5+7dtbrDz+S1Hrgh9quE
 YCVg==
X-Gm-Message-State: AOAM531mh/aAAQ9mdufVH97fP87WfroHG/2oJPzSdF/gccfWZA16M9MO
 z2FXDgEG6BpSwO8eDH2QzGArR+1LBVWMW+/hDr8itg==
X-Google-Smtp-Source: ABdhPJy90I8XF8T6wt34SnOAorSBg1rpHSqL3Ijr8HYB1zL1art1pLylVr42eU/E/BxANRjkWNUtXFgGxgghbt44jE4=
X-Received: by 2002:a17:906:7254:: with SMTP id
 n20mr28360990ejk.382.1605180001080; 
 Thu, 12 Nov 2020 03:20:01 -0800 (PST)
MIME-Version: 1.0
References: <20201111164710.644863-1-ganqixin@huawei.com>
 <20201111164710.644863-3-ganqixin@huawei.com>
In-Reply-To: <20201111164710.644863-3-ganqixin@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Nov 2020 11:19:49 +0000
Message-ID: <CAFEAcA85O_q2KzNW1mJevEvM0kO1u0vDgpfVnbFBkk_qovExnw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] ads7846: put it into the 'display' category
To: Gan Qixin <ganqixin@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 12 Nov 2020 at 07:25, Gan Qixin <ganqixin@huawei.com> wrote:
>
> The category of the ads7846 device is not set, put it into the 'display'
> category.
>
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
>  hw/display/ads7846.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/display/ads7846.c b/hw/display/ads7846.c
> index 023165b2a3..b455cb5acd 100644
> --- a/hw/display/ads7846.c
> +++ b/hw/display/ads7846.c
> @@ -163,10 +163,12 @@ static void ads7846_realize(SSISlave *d, Error **errp)
>
>  static void ads7846_class_init(ObjectClass *klass, void *data)
>  {
> +    DeviceClass *dc = DEVICE_CLASS(klass);
>      SSISlaveClass *k = SSI_SLAVE_CLASS(klass);
>
>      k->realize = ads7846_realize;
>      k->transfer = ads7846_transfer;
> +    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
>  }

This isn't a display, despite being in hw/display. It's a
touch-screen controller, so it ought to be in hw/input
and be DEVICE_CATEGORY_INPUT.

thanks
-- PMM

