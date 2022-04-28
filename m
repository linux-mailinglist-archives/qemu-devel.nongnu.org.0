Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0CF51319D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 12:50:59 +0200 (CEST)
Received: from localhost ([::1]:54812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk1je-00057j-9C
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 06:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1Jc-0004rK-H8
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:24:04 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:33500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1JZ-0006MV-UI
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:24:04 -0400
Received: by mail-yb1-xb36.google.com with SMTP id j2so8249759ybu.0
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8GHuTyGTsG+ui2L7BcLZabr3LVXp346Ndj5PrITvJ2A=;
 b=WiIkaTq+nVfgLV56L4UgDqSXOGhFNdm6+W5dgq+YTvCGeEEoDbc6p+bd2hs4dnwKb9
 P5K74B6oBElJY61BxlPUxfeV8f84QbbXkUqhDmK9f7I9aaJgH+JV1hBTIt64M2tOd28U
 h9SYBRTjx8dhLgrNMKyrnH4cMittea0/uMMTPKqIjbFu9GM4YGDs/KpfsGUlPpd72CH4
 jiCk7kdsToaZTFWfb3A8LoRVO5Z5U5HYtK0xcYLdvYAZC7J11ozSSdAgpEQFjSj6M+uT
 HvhbvTPiJriMNy9bHPhz4h87F8TppHCJMr53qsFs5m8c4T2l3lDn6eVTZkxeUuQL/MMU
 MGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8GHuTyGTsG+ui2L7BcLZabr3LVXp346Ndj5PrITvJ2A=;
 b=ZQOLuSgQn55SrfwhtXDAtUwOrzf00KyFStvoOOYri2/t+obWdrLpUlHEnMN7cujZL1
 awoKjR0Vbu8sNbtQYXPeoKXVQCZ+82m4JGy5erme1kEPuTuRVmRBp+R+g1RYgp10jKvE
 CG7qUdkv9Rd4p20Rj7qQ9iacjlXZo0sAEKcTV689KXDNldR1AVRTYYOH7OAxioga8HCn
 ml1rwqOufhvAnRkDHKm6PySDqpssV2Yfm2KKgv/D8tmBj2YPXEZzitbcRp2hKtzcPe7m
 NxwoR+lIQ80a5MRIHfJIkqpRjhsP4iAbwxqVdYYYdqvbLE52FRJswfeOeOjwZmYy4sE8
 Ww8Q==
X-Gm-Message-State: AOAM532BIElnQKTVzY4aRvGgPqSSQsavGCtMlNG9qLAytrY5qng0WmU6
 l4YcyzzGY881PNybrU+zb8y2w6n33hR2oLpguGLBdQ==
X-Google-Smtp-Source: ABdhPJwmeTr8F6NVt0XKswM/3Du5DZmeEBHTQMVF1BEkl99Sybp1twJ7ygfOzuQPU6kIQbqKQvKxEnktOvUqiPYh/FU=
X-Received: by 2002:a05:6902:390:b0:645:7d46:f1db with SMTP id
 f16-20020a056902039000b006457d46f1dbmr29958545ybs.85.1651141439763; Thu, 28
 Apr 2022 03:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-24-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:23:48 +0100
Message-ID: <CAFEAcA_QS54vjUAL7U6m64V4g9GD3v6JSDGBcV3r+8o9in5HfQ@mail.gmail.com>
Subject: Re: [PATCH 23/47] target/arm: Use tcg_constant for disas_iwmmxt_insn
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 at 17:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 25 ++++++++++---------------
>  1 file changed, 10 insertions(+), 15 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

