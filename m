Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 133754CD3DB
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 12:56:29 +0100 (CET)
Received: from localhost ([::1]:45700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ6Xs-0003lP-6q
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 06:56:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ6Uy-0006t4-Jh
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:53:28 -0500
Received: from [2607:f8b0:4864:20::112e] (port=34456
 helo=mail-yw1-x112e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ6Uw-0005No-DC
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:53:28 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2db2add4516so88767957b3.1
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 03:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gLIvz9QKtJ7n1hgwuOlCbujSVYqtQLwekK7mffqhgsk=;
 b=TCZ+ubJrG6Qf91DOpA2iKiOHVfhKfGAMx5VBZpjhi9PsSTgkYZf/4Po2az1xYkSLUT
 1chOVFEDTbcfLKdxJS6jULyPkvw094lqVfb68iYhhXpDWkHwA7AzIPICIkx+Zv93Tdy5
 ftUJYi74yj2AETC3vHdediIr4Eda2mFJZBb8osskC7xj6knD9lmn0bmi5NGaiaITn9OI
 /o3bx6LCYDYcovQ3lBlU40QvAeFipYn9Q1v7XO43HAMMW6APshQhCAjJpEolaXiaoqyB
 VAUQAZauddDVKJqpOFrZV+t0Fe3MgvLUtGN+9tYoHowIuVNwnhkcxRE6rSw5Hmwwsx2N
 tUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gLIvz9QKtJ7n1hgwuOlCbujSVYqtQLwekK7mffqhgsk=;
 b=cCfTXo9MevE9h9+1tOMl52PG0kP6SMwkGbDm9zshGmwKQYtsBzCx4tgQt34KRZh8cr
 A8w1E4EA7ipPU1NGqy+JIH5CUz25HKLtgBQGN0cT/XJzcFqGjkM896ZEvSG7bQma01Xw
 SbmlL0BMwKTNZ+pB06bRaluDU+6XDBTB6rBsUnh9xaIsRgJSvEjUOeenuKZspX12uRCF
 +A27uga0hgerdMBFO2KoD/qaXMlZKIHNkdjwLFXgaU/riSv43NW9m3bFYElgFUDx+V4t
 OIMK1Y97HPYw/8mKOioLENlhrjwFT3J5mob8XHvWN8eY8vx2vpEPxuBpT3Y3goO2fjYP
 Beag==
X-Gm-Message-State: AOAM532K4PhS7FgFh/+pw1VukYqIZwUVsqsAnXwiI04iDnN65veiVRkR
 8FOC9Q64TfuAvKr/on9UAp5ZqR6xIIKn62NnBp1d9Cd60HwJaw==
X-Google-Smtp-Source: ABdhPJwaxnQuz8GdwqyeENQqwuhdTr8/NERdEBFE2DJ0DoQyvgJDRmR4KULmvpGPJjkLtO83yXaWwR1cipTAHyNZEiU=
X-Received: by 2002:a81:b49:0:b0:2db:f472:dfca with SMTP id
 70-20020a810b49000000b002dbf472dfcamr15890394ywl.455.1646394804847; Fri, 04
 Mar 2022 03:53:24 -0800 (PST)
MIME-Version: 1.0
References: <20220301215958.157011-1-richard.henderson@linaro.org>
 <20220301215958.157011-18-richard.henderson@linaro.org>
In-Reply-To: <20220301215958.157011-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Mar 2022 11:53:13 +0000
Message-ID: <CAFEAcA9_z2RB0xvKWzSVQqopZ2-QCY-2GtQ5ES70vPApQ-KN_A@mail.gmail.com>
Subject: Re: [PATCH v4 17/18] target/arm: Provide cpu property for controling
 FEAT_LPA2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Mar 2022 at 22:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There is a Linux kernel bug present until v5.12 that prevents
> booting with FEAT_LPA2 enabled.  As a workaround for TCG, allow
> the feature to be disabled from -cpu max.
>
> Since this kernel bug is present in the Fedora 31 image that
> we test in avocado, disable lpa2 on the command-line.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

