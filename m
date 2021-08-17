Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1393EEFEB
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 18:02:35 +0200 (CEST)
Received: from localhost ([::1]:37528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG1Xu-0006ka-Mm
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 12:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mG1VM-0004oN-DC
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 11:59:56 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:35646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mG1VK-0000fz-O1
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 11:59:56 -0400
Received: by mail-ej1-x632.google.com with SMTP id w5so39618053ejq.2
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 08:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zd0HpYx8oc6AV+sdvyoyC3xuiywtdczlSgu8G+DjCck=;
 b=OZ2PteizhSAHnRtpfBw69QpHay/SJTWvix1PyGNC+YWMxvKb6QlVw421herTR9Blb6
 AWyHcgEFKm0YNQrZVUVwWpLOFy/TxNrmIQOJIfojXQybU/98o2RY2rC83gUEwNm0p8ea
 LkMjk1mPcwLrvVh4pYGGcgesR4alA6Emqd8Ojj9L6ZhYu2kuXPWUllN9wAbmVDm+G7+A
 kgpuhmWuciYRq4s0YCP2rik2o4ZxMeiR1lGtD8Xb53H9mjfsw061QHieFsL3ikw8yRvd
 HTNjlcwBamz7F0lvO7OobndgVHwByklAnI0tspJ6Ow5j9McIQ8end6KKL0zgm/hQObad
 dIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zd0HpYx8oc6AV+sdvyoyC3xuiywtdczlSgu8G+DjCck=;
 b=CuUvUF61icMhqelt5wcnqAURck5CS+i7ta8PAfdABtPVZnaNx0BJPWQDV3k4gAkA68
 69e33JYwdUBcpSvts6ICUXy2qGlAfFQXKmEnyavtsUgzc5S3eH0JrXCHSkr6X7TZ/7bY
 Mfj4BQj5sGoBqHDFRzShMQkk80N8TwJKbhg1qtk+86ds9BJIJQDCyzImg4w/Ph5YywTd
 gNjjwk+L9fg+u1KKFhVVQkwZ+uktUAg1UPZd0YIAgODEemfz3uH6NwlBdrtFSHStLxWr
 aP2rLHNNJRfET0jN46MtWN7dgm6OMcnWYFxBFipkVDlFS+ZbwjCXLHbQK/bo7MYTZmU3
 a9yg==
X-Gm-Message-State: AOAM530jsGRssXSKHsUjZjjvnybprhyFWcWcDIr1RgdZYSNSXrrJVLzl
 tRdwMobH0gWxhi5F4ImHaPmIMfq56Un/TpxcK/3neg==
X-Google-Smtp-Source: ABdhPJx+hTdgniMehOFWiTz6gWGDFIgSIvz6C5Dqr/XccBbEpQ5gCVJIhdNzBho7QKD+JXEwLHCUI7q2s9WIcaiBTJ8=
X-Received: by 2002:a17:907:1048:: with SMTP id
 oy8mr4670637ejb.382.1629215992805; 
 Tue, 17 Aug 2021 08:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-22-peter.maydell@linaro.org>
 <fabba7f1-1607-8cda-00e5-77f656deef55@greensocs.com>
In-Reply-To: <fabba7f1-1607-8cda-00e5-77f656deef55@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Aug 2021 16:59:07 +0100
Message-ID: <CAFEAcA93OvhA2_e52dZA-Thfkp8APRn9SkOGwfEe0oVkcrh5GA@mail.gmail.com>
Subject: Re: [PATCH for-6.2 21/25] hw/timer/armv7m_systick: Use clock inputs
 instead of system_clock_scale
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Luc Michel <luc@lmichel.fr>, Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Aug 2021 at 16:55, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
>
>
> On 8/12/21 11:33 AM, Peter Maydell wrote:
> According to
> https://developer.arm.com/documentation/ddi0403/d/System-Level-Architecture/System-Address-Map/The-system-timer--SysTick/SysTick-Calibration-value-Register--SYST-CALIB
> , the field is 24bits wide.
>
> Should we prevent an overflow into the reserved bits and other fields ?
> by doing something like this:
>            val &= SYSCALIB_TENMS;
> with the following #define with the other ones, above.
>     #define SYSCALIB_TENMS ((1U << 24) - 1)
>
> Note, the overflow would happen around ~1.68GHz refclk frequency, it is
> probably a config that will never happen. I'm not sure if we should care
> or do something if this happens because it is probably an error
> somewhere else.

I guess we should do something, yes, though pretty much anything
we do will not really provide the guest with sensible data...
I suppose masking out the higher bits is no worse than anything else.

-- PMM

