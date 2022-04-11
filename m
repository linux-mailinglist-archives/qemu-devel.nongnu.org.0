Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CD24FC2E4
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 19:06:27 +0200 (CEST)
Received: from localhost ([::1]:60904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndxUg-0001RR-It
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 13:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndx9g-0002c1-P8
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:44:44 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:38374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndx9f-000273-8Q
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 12:44:44 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2ec0bb4b715so43936987b3.5
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 09:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k9cJN4QBG+VOBSEw0DcH5QWMFxSW4ZEr+daVJ5qfJkQ=;
 b=cXQnGPu/mgUZkt5EtPfD1iBF80a4R15md9R74JH5myFdLixpFrpuvLgO0OhtiZO2uD
 8EGUSBUcoFkrmWnFknpRKSzTmXzz3daVsXfnAoQ5MQ/me/Ef1lRfeTIEq+Rjqpx4wluh
 jrcwLhnBy3rTPZj5eDsQp/S5rbhKiYUYMxYjTGT4TGuomiMqzOYmvQTrDYDFeK2kcl69
 Ju+FcCk3Irv0ydQlaf22NtFCAlvVmroduAniRDfBsTHqgsZzmP3aMJjbcE7aRV3egeqz
 4mHn2u3YznoLdhVTud0Myz4ZV2jgyRc0LSEjWsb0nVnhp8FZ5Yo2SDLVczN4Ie41bu0H
 ZQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k9cJN4QBG+VOBSEw0DcH5QWMFxSW4ZEr+daVJ5qfJkQ=;
 b=LJDfHMEX7VDChcBwCjWQB0M+RlazqwrScEqxIDY3DJE6zOpqBXo/MoqExL8gDUBsJo
 UKiLd+1GBhVTYNxdjH1c6M28JQ0EniyqM5hiZwYfsqw0Aas9pay5UxF5YCldYvxO4JNw
 HtvagiYfO36PjbJf7r6ctKi1N7wvfP94hNYUoZRDrKBCfsFgMoGRmDptYFQyOQivOHwj
 5CkzU0dNBX7sUkYi1C4hYmcsbYynTNIabdY6uEYBnb2eaJucFg7Yu0FU0QwzpEtMJoCR
 xA3JaM4UDRvNmCeLWwu5gwnXqrhqJXdRn0hG3cnf+hfINwPrYmxsDvI5Dx7Gt04ZgGCQ
 G+TA==
X-Gm-Message-State: AOAM533nUyi5d7f/pHVkK8w4N3sndLsVR83/pWmUwigERqyodSgjlF/T
 tMT2t6Kr8juPcDoW4Plt+rZNv807kY6uecbKdZp0Nw==
X-Google-Smtp-Source: ABdhPJyKm3hfNzGqh/6hAo1yqlIn2c0r2+f4XqIty5zQR07EFdsukI38CmHOa8I04X+nBWMnp5oWURecR0zBVnBz3yk=
X-Received: by 2002:a81:6642:0:b0:2eb:c364:b8e1 with SMTP id
 a63-20020a816642000000b002ebc364b8e1mr17437431ywc.64.1649695482197; Mon, 11
 Apr 2022 09:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220410055725.380246-1-richard.henderson@linaro.org>
 <20220410055725.380246-6-richard.henderson@linaro.org>
In-Reply-To: <20220410055725.380246-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 17:44:31 +0100
Message-ID: <CAFEAcA_VYCDp3cF_XXfc-oWeM0WTqRJw63075Af8APF3SjQgdg@mail.gmail.com>
Subject: Re: [PATCH 5/7] target/arm: Enable FEAT_DGH for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Sun, 10 Apr 2022 at 07:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This extension concerns not merging memory access, which TCG does
> not implement.  Thus we can trivially enable this feature.
> Add a comment to handle_hint for the DGH instruction, but no code.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

