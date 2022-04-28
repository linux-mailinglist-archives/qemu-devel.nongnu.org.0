Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6110D513220
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:09:47 +0200 (CEST)
Received: from localhost ([::1]:57864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk21q-0003FY-E9
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1PO-00013A-OY
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:30:03 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:39818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1PN-0007TB-53
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:30:02 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2f83983782fso47663747b3.6
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yWPuXtzKR8NrbQsAseRUGHCCQ/+FLftvfMJUvkYkCO4=;
 b=WSD10rOIjJ9ux6W6y7HO/BUubP27V9qvzf+HOsRwPlwHg55bHHtEES027kSNZRIr96
 fz/IQo/Hjmnrt4EymFGhipdR2IhV98U8GWzkW3v+lCqynIyvd0rYWT4hlJS1K/OZqWLe
 r1ZpmMYEE9L+KqlfiYgzrhFFO/BCD4vY2wYRv6dPRBaY8iCFJOejVotD9bkO7Rj1MjWU
 yygenMUKXlMCBWnB/xxMrKjzq7dwzrjWkjVVOkg4vbvq2p36W2rmJt7eDZRO2Mi41ruR
 t3Q6ZUrX0SlYvZQatTHVWj3NDCT5c8jE4hPVru7RgdyoH23XmRSlNTajPPITW3rfszaG
 7uJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yWPuXtzKR8NrbQsAseRUGHCCQ/+FLftvfMJUvkYkCO4=;
 b=4QI2PlkcLR98rZegOkb4bgQdNerQFulZy1uRtkuxugG2nILbFTGZ3l0DTp/ntxZrcQ
 3B9tdIMAm1uc1a/IE+M8lgmdiwROg115Ur6dmodIcIoMafi/ZXwmfUoHHCITCAYbf2F4
 A5eRKCJ9DA9MobLKT6LbrVrk3Ws5HVWAH1Irnpj6a52AT49fa8CP7z1JCcZW5uRB9ghP
 lv60uBxBXzrXjTJTxwxnxWzJ+JylPU523AmGcc1DahMYfSgMORUg5rfnDj7d+SZBUDzF
 RPXmF6eZk8E2doXCpOtXwqNkyo2OH+1NLG93U7DbtKVh/DLt/idLoPvKwjvuj+VG6iMC
 2xUw==
X-Gm-Message-State: AOAM530HgN3Q77smwdFNIb9etpdjmlOvzWwmNHp3kJXUaicGazZ29kCG
 8rIWp8n5hzEhRBcLOvId+MfVR1LdnXua+euyH/eAMQ==
X-Google-Smtp-Source: ABdhPJxpx6890x/pT4CGrlicQzkVHziEfIaWQzJnsU45t6VEm7bXmZ4Vr9+kxlndadSKmyQPl5fmym0Hpug6XvBcNvc=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr32178150ywf.347.1651141800104; Thu, 28
 Apr 2022 03:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-29-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-29-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:29:48 +0100
Message-ID: <CAFEAcA-HuGb327xRRNp9bxOKH1KHthM4J7V48Mt=jAdHEFajfQ@mail.gmail.com>
Subject: Re: [PATCH 28/47] target/arm: Use tcg_constant for op_s_{rri, rxi}_rot
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 at 17:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

