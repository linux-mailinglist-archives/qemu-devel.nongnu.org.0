Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8569F5670AF
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 16:14:38 +0200 (CEST)
Received: from localhost ([::1]:37216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8jK1-00030C-KL
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 10:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8jI5-00012k-U3
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 10:12:37 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:45025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8jHv-0001il-0h
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 10:12:37 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-31cb2c649f7so35714827b3.11
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 07:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UqsobVuHM5F53h11JRDooFYJPVur6KDy5QXdIciqs7I=;
 b=yxv6JOV9rlORgTfxHCQc745Aw2SDyLvgy0ZwEpQRO20/j9Ojxb3NGWJe91/GC3YleN
 yO1Bils3vch93oxVVqCIkikPObLBlhsbFR/rHwY2JI6PoQZRV/kUUr1hDBcFctLO5My1
 +x+cIEd0XQfP8ldTfAuJ9KPR7dMlw4BqmQezHIJJB6F0YF6NJKt4KrXmbLzQPLKR7hHl
 MYYBghi/ioD7T1YVPYCzs2dKqRHNEtSE5lKkDFUx9jZHh0k3dO+cYKWLdCGfXf4t4Ejv
 7IeWh4YE0uIF5dOTn94Nr3ytAmpznUHIHZv2YqA9meol9uIrBRoVllfbQRDzcbDpPrUa
 QIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UqsobVuHM5F53h11JRDooFYJPVur6KDy5QXdIciqs7I=;
 b=goq34gf4f2CGeWbRj2gEGsqOJwoAOErh8lUa4AYzONgmkh0Ds3cSVYLehL5S4uqRX8
 oW4kTSVU3LL+4rrvqY3mnDp8VXrs8yVfgKtljx70JJCFsoYk3/dSCWfBU2YTlljOc7+M
 bTAo5TvHYd9a7sega2uJYuEpXnitV9dUHMvOkbfb/FYqLw6LRpUpt5SQftct3iUxPvZa
 dmhs/v2+eF714yDG+pnO4J6OFbuPMsaZ/60IoXOy5jXCXfN2Vzgf9XMUFA+xypXgQFwe
 F8UM7NRL/0BjizJlUduMOrG9i2QnTk0OdLvG12lfIyMrFJOWphBSKEF3Riacj80yGWIz
 zV7Q==
X-Gm-Message-State: AJIora812SUnmfVOnj8qsTT6mcTObT76gYW8HCv3t9XKjRmE0iA2ba+5
 Rx98sqOLz/s433mj2svdwTdhLjHX73Rf6J8okNmSLg==
X-Google-Smtp-Source: AGRyM1uBqEifq6cf04yFPg/iodR/OTcexcWStB7O/TtZFII8DQeWLL5wu7/82yn6I+XV64TlGe038yKz4MGaees9bZ8=
X-Received: by 2002:a81:6a85:0:b0:31c:8624:b065 with SMTP id
 f127-20020a816a85000000b0031c8624b065mr17948485ywc.64.1657030345691; Tue, 05
 Jul 2022 07:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-7-richard.henderson@linaro.org>
In-Reply-To: <20220703082419.770989-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jul 2022 15:12:14 +0100
Message-ID: <CAFEAcA8WN6DkZXFEXZFKQ3gN3GySCTVswhLiTSoeHvSCgjFtpA@mail.gmail.com>
Subject: Re: [PATCH 06/62] target/arm: Use PageEntryExtra for BTI
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Sun, 3 Jul 2022 at 09:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add a bit to ARMCacheAttrs to hold the guarded bit between
> get_phys_addr_lpae and arm_cpu_tlb_fill, then put the bit
> into PageEntryExtra.
>
> In is_guarded_page, use probe_access_extra instead of just
> guessing that the tlb entry is still present.  Also handles
> the FIXME about executing from device memory.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

