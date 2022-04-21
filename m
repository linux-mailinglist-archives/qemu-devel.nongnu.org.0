Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F5F50A8E1
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 21:17:19 +0200 (CEST)
Received: from localhost ([::1]:38804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhcIo-0001HM-5o
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 15:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhcD0-0007X8-HA
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:11:18 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:39800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhcCw-0002TU-0i
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:11:18 -0400
Received: by mail-yb1-xb29.google.com with SMTP id r189so10461165ybr.6
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 12:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MEzVHx/Y2iKUerFjo7IpeEzxX8eVxH/Clvq316RbT/s=;
 b=vuwFuvTZksJaDghQgQeIK6eigL90sHlf2K6CfDB1y4jVqneQzX52Buhlrkv2gXb0ku
 ueB9s2T8O8pJyu4W3UXlswPZm+k54DjZZBJcPwU3tGMGpEUg5nOluIA6fIn5/cSUloCl
 7a8H3A/hwhkTK6o+TPFzes2uevCa6Qaa6/jdpBLbu6WXlCGEakDTl+5GOjrvjhgBaomY
 79xgs91nRKoyGuyqnwJlIrlHPwQQJZ72MpVvk7G/8+4Zl5av82Exmzw9boYNXZ0Gf8QX
 hVXN0/YwbRf1Pm7N0RnrweYS9Cniq4Vjww1hfdrWLQo4AACBvZpwOYNWyNlj0aT138Ug
 RXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MEzVHx/Y2iKUerFjo7IpeEzxX8eVxH/Clvq316RbT/s=;
 b=DWG4Kb40ZeTIwCLQ/reNgp1xf5xwhqCUjiZg1f/4IcvO7HwuR9iqSAdXLVj5hAdGVW
 tNNZ+R21hNH2vkTtOYqau3IumI6XXItxxeY1E8/vg7DAlVz4yGIDUtATX4QLokCKx+o4
 ATQXtH6cu80WWeiKIfuBou+qP4CZQP3TudSPIR1uS8eRsgLBpgX+XSZCFM3knEfo5ww6
 lJUwbdv0TBEnwjiJMqiPXWyt1gT8DXe2NVaQO7GwPB4ZNLDx87wShnKxCpMmtSIe+rs8
 ovPkafPV3eOY/xSL+SRQ26cfhCtvJevwZEti+9Oad8iPOwBQsy5lLgRU+mx3vlbYpTCe
 u1Fg==
X-Gm-Message-State: AOAM532BzIAW2MCUZEKoXusdfJ7Oe2T5Y9FCQItnZrSmMX8P7rtCXyZW
 vRU+8hrCx4K5M1vXRUiBeFZIsQs2TCRU/c+OJq1K3g==
X-Google-Smtp-Source: ABdhPJxqHQ+XWY/oGrz078JGb8mGifLKN8C8ucrcQYWAUFVy7ko/NnU0Q461DavXJ9+9q7wyqqb4ioSif0i8xXs9ixQ=
X-Received: by 2002:a25:a287:0:b0:645:3c4f:7dec with SMTP id
 c7-20020a25a287000000b006453c4f7decmr1186355ybi.479.1650568272076; Thu, 21
 Apr 2022 12:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-24-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 20:11:00 +0100
Message-ID: <CAFEAcA8x8Rj9VjujUn88GP9ZVsAs0UqR74MhR0T11uVyvGhEWg@mail.gmail.com>
Subject: Re: [PATCH v3 23/60] target/arm: Use tcg_constant_i32 in translate.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Sun, 17 Apr 2022 at 19:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.h | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

