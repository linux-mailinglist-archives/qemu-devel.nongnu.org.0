Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 578B13C1911
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:15:09 +0200 (CEST)
Received: from localhost ([::1]:60036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1YYG-0001lz-Bj
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:15:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1Y8S-0002jp-Ar
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:48:28 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:41565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1Y8P-0004Fe-P8
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:48:28 -0400
Received: by mail-ed1-x52c.google.com with SMTP id m1so9699570edq.8
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 10:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tB6Kn0HoWYECRjlZB7Zwu29dcbSg04VgmDYeKQVwPSw=;
 b=hwUm3j08PHIIs8GMELCjzzJpG6MT3yBVKU1Un9eI+p2J5Zj3SepAwycWbRBZurmEpu
 7XHp3/dOooUG2sZbfTcKQJzBGvZx+im8W2mbhy6CDIRjb3t/Tw2S1AJy1BFgQjCfJ1lV
 pc9ugahFIaEVVq1KjCv07w/JlecMrhT6uBzwuf5kcfNID9e73LWawOxasRC9gW/Axawi
 vghNrdiaApCEArdODrr3mZOcuR/LvDsE1OElaoU6UScisqM8o/+p0AJM8CwDjzlCxbte
 hBXiGtq/E+MTaEyELiL1LAxY+luIpdP3U9UKP30slW+s6LSI5HC+9AySjdut6R8uCWJu
 fYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tB6Kn0HoWYECRjlZB7Zwu29dcbSg04VgmDYeKQVwPSw=;
 b=hmbaCYFxJRzMQfKi/hcwBAHRTV7HQWZzxl5K8IAueStfH0BaKJAzX9ChlVB4aAhuNv
 BixR9JB5kVe5yowQmBf6frE3WODq200YPS5s0DyFub+H3j8/WOCY5Dkd9OMvd+tZ61bM
 R3/urC7X4Bu8vykMwEYX6BhuHpY08Trv8Lx23/mJFpE+Laz7AzqO44uBiuxVhl/ubAN/
 zyFsrZ6j2fZpW2ji71OhYDwbeKGx8SkS+ixw7zsFksw+3gKpRKhavGgQtEIJ4bXCy2/x
 CZKK/IfXywayaLwmfD6yp2EKlWcnLgde8gpun03uLP/zxH7HFKpCoq383FogwQHfcZvn
 JsLA==
X-Gm-Message-State: AOAM531UHKXTQ4SeIXRwQX8aW1jN/XfZXWMVBvBGjUAbVQ0Ox7bT8GW4
 T0mO2RH9otan70K7BXswdpd1olK9tpURMZG5we70Jw==
X-Google-Smtp-Source: ABdhPJxggrlIhCZMNHP6Z5i9wmP6hnHuCynRCBn8u6NyNBOFclMmXLEUwC/GBRNCfJzvphy5En3zPRvzGBaI0m8+SFY=
X-Received: by 2002:aa7:c6d4:: with SMTP id b20mr15934437eds.204.1625766503266; 
 Thu, 08 Jul 2021 10:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
 <20210630183226.3290849-6-richard.henderson@linaro.org>
 <CAFEAcA_EkW7a6SFuAHxdYvu_gdcdDwY4xQVOFnmtatcx+T1qGg@mail.gmail.com>
 <88562e08-3d6c-3224-5d84-67e3ffd3774b@linaro.org>
 <CAFEAcA8Xs0Ct6hDBAk-N7TVhb66dwv2EJudo83XzJ5dQn9k7VA@mail.gmail.com>
 <589d27e5-58e5-6af2-dfd8-11130fdbc2d9@linaro.org>
In-Reply-To: <589d27e5-58e5-6af2-dfd8-11130fdbc2d9@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 18:47:44 +0100
Message-ID: <CAFEAcA_JFx3g0rOqeHOuoryuwvhHwMUzjrSDw=BqH40rj6UATQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/28] target/arm: Use gen_jmp for ISB and SB
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Jul 2021 at 17:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/8/21 9:11 AM, Peter Maydell wrote:
> >>> Why isn't it enough here just to set is_jmp to DISAS_NEXT ?
> >>
> >> You mean DISAS_TOO_MANY?  That would work, yes.
> >> At the time I was just thinking of replacing one jump with another.
> >
> > You've implicitly answered my question, which is that the main
> > translator loop code treats DISAS_NEXT as "keep adding insns to
> > the TB" :-)
> >
> > It feels slightly like misuse to use DISAS_TOO_MANY, unless we
> > renamed it to something like DISAS_END_TB (which is what it's
> > actually doing).
>
> Yeah, better naming would have been a good.  In this instance I think I chose an odd
> colour for the bike shed.
>
> The problem with just DISAS_END_TB is that there are many ways to end a tb, with at least:
> (1) goto_tb next, (2) goto_ptr next, (3) exit_tb.  We wind up replicating these three
> across many of the targets, so it would be a really nice cleanup to standardize, and with
> good names.

Mmm. Anyway, for this change

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

