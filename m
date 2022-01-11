Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4794548AC7D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 12:33:10 +0100 (CET)
Received: from localhost ([::1]:50594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7FOn-00068W-0g
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 06:33:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7FM7-0004sh-LO
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 06:30:23 -0500
Received: from [2a00:1450:4864:20::334] (port=40532
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7FM6-0005hB-1N
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 06:30:23 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so1214937wmo.5
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 03:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wLPR7c7cgvtR1237GY+x66fg6e3v+7KhN5kt+EvjKwU=;
 b=BrPTq+HHC8AReXCuZBfXPxKHIcLTx2ry6t08ZT9X6r9/RIBUWjv4g1pDyfNHmdOXH5
 5O7XS0zeJ972gHLukSC6XrNNEqcbi9A0bg4aR3Gg6d2H9po7fig7+lTwOwuegkQpQdDy
 UiXUGjnzxNdOC7UMZxwZ/bbb4n+LFzoJWfLS3fAr74GJ/q26JpY/hjAKVBqieUpgDt25
 wVvoIRhjn4eFLc1IvfKKKvJeLiDR8qImCXi5puZf6kAO6BZJuHiO9Q/KcBzuf+TO3UG2
 +4kcfDQR1W8yTNjKux/r8V2OlYbXQ1WVMG1mhnDo9HrhvwNbT8HlQCQsZjxx0GyQ2nEZ
 LVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wLPR7c7cgvtR1237GY+x66fg6e3v+7KhN5kt+EvjKwU=;
 b=71ka5gcrvbAZrLNZ+niD9QspJH8hHlHDLjznQ/KK9G9vwfe4cTK1x90INhZucrilS8
 YdPgICo2m8ss3h1n82QZZUuy9T76kZP+RV3ZS6PCiDdZlMe1pEL3iYR89hImKoewKyPD
 hl3B315F61nZL/5T1aXiDqmHYXkYX2VnnkJbSu/vgkFLEGWmRl1csaULDxldTWs+8nx3
 g/LFzNIwlKH/h/iG6AC5TlrEeWC7xSEiJrZ0ymTCbUlTj46VoulnJyx4aWngfCm9YuYL
 36LQVGDZUi4Gr62kBEEoIKkUWIZLYwxSTT7oRGV1CPVQI+N2EdCo1d1xQm95VPvHn9Ol
 tcfQ==
X-Gm-Message-State: AOAM533U5m+RGP5XX82NK1zlFxUPbWPHxXsbhr0nK0Wot9+Bpj0XvEJj
 BHURYgAvQ4KupRbJWSfRqCYBbS2oMPL3CWOYKfuClQ==
X-Google-Smtp-Source: ABdhPJzwvJvboh01bskwZZOtFS3zGloSrQIeiIgoiCDM1M4DzA1FB66OhX2JXINPuWVVA1tr9kHz2uH7/b8U+WNKDRA=
X-Received: by 2002:a05:600c:1991:: with SMTP id
 t17mr2057861wmq.21.1641900620590; 
 Tue, 11 Jan 2022 03:30:20 -0800 (PST)
MIME-Version: 1.0
References: <20220108063313.477784-1-richard.henderson@linaro.org>
 <20220108063313.477784-4-richard.henderson@linaro.org>
In-Reply-To: <20220108063313.477784-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jan 2022 11:30:09 +0000
Message-ID: <CAFEAcA-qHdSm2BZ-Zdnrip+ztU8+FPo7V+AC9KbzGWD05q-4ZA@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] tcg/arm: Remove use_armv6_instructions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 8 Jan 2022 at 06:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is now always true, since we require armv6.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

