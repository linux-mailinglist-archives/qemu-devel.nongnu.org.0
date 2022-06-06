Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AA353E478
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 14:45:04 +0200 (CEST)
Received: from localhost ([::1]:57390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyC6R-0007iS-2v
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 08:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyBpp-0006Le-Cp
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:27:55 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:35564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyBpn-0001Rk-QW
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:27:53 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id t31so25412389ybi.2
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 05:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ltl3caQJxh/EIfkLlzcIoJbBLSHc6/ZB2lvJGACPr5U=;
 b=NdZHsxgmQGpBa555uL7cmwAeyU/yTN45nviHY9m2KU4jNr496/3XNkiqZwcfC0K7AQ
 72qNSegEkID8PyOdY97AqbjwYTVKWfvcUwOpdRmYzaz9WveIU+IiBfQ/QrwG0XLrOxpd
 jl39hKbOImru4+7iGjLxzDPAhFtjrXqwY/jP5CY+jhcAHxXdsS838A509W4twwdIl29o
 7L75IsaP+azXgX79mL17rZwCOzlIeNG7PEKqko5psOwGBTNm/pG9p76RpGsKZrWM7YwC
 jTKi5tObmF3FCyQjJhx/sTpCJgCxGsk1IhPUFMeJ9ko+gLHTlh0nMJIuufrGyxM9pK9K
 qAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ltl3caQJxh/EIfkLlzcIoJbBLSHc6/ZB2lvJGACPr5U=;
 b=CFpiYLK46yREhpwjhPpfEmbOGcZoH1iy84pUsctIC2DyA06ZPllE7sz3MMNfu2hF8W
 4LHZZ4QRHtIUvDB+Xjc6Qs39qgXT5rsRvzeu571/sSA+Vu0HpLANbCC1sKsdAMU2OWEb
 nvRxh5AqIghcvwbpJ6Z5HF1B7IexaKs2ttSY9343sX7pnhZ5SkHKSpG3Wp8ANxCHqkh9
 izjMhIiLYWWrqArnKX2Qkn0fDRl/8YqTxqVfvx8eGAeVRuNPAUdY+IMU+NjUhgVr6Qyi
 gfNlLW2Zg/reBBiyxI1XBzp4kJozXp+Ky2k4T59kgBkMW7uXLg9sYIka6MgmIrp4f4uh
 Db8g==
X-Gm-Message-State: AOAM532s8hgGFsi1B2dNHLFG23yGmKh6OgmkAHZNM5DQx9dHVIzUqnQt
 M/TRW2bwOnExIGs7ssZj/AKV1iW8h5qG8tsjM6PYvw==
X-Google-Smtp-Source: ABdhPJy34D2XT9pJV2dJM2JAahtuAqneLFoRfPI7yfMhnwJU3XCENGHSUW43weLfHbLfp0BwJvTn4lEySNiIU66ZS5k=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr24950897ybq.67.1654518470951; Mon, 06
 Jun 2022 05:27:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-10-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 13:27:40 +0100
Message-ID: <CAFEAcA_5sVZwk5hf6S27tNeRkiLz+htiTo3oZqP=SdBHciVcuw@mail.gmail.com>
Subject: Re: [PATCH 09/71] target/arm: Do not use aarch64_sve_zcr_get_valid_len
 in reset
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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

On Thu, 2 Jun 2022 at 22:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We don't need to constrain the value set in zcr_el[1],
> because it will be done by sve_zcr_len_for_el.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

