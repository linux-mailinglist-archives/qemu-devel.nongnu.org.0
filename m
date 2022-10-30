Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CBA612B44
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 16:40:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opAOX-0008La-Ll; Sun, 30 Oct 2022 11:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1opAOQ-0008LC-Ik
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 11:38:34 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1opAOP-0006iJ-6o
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 11:38:34 -0400
Received: by mail-pf1-x42a.google.com with SMTP id b185so8711100pfb.9
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 08:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F+2AAXW8pcA9EEN5P9+YGXGUy6ri6k2H90uAmMmQadU=;
 b=bqhJYK9HXI5Al+6g6W/Dn7WcSbiJsBrzXeYNCEQCrcy2/l6pwWHUc+7o7MJm20Trn9
 7bK9I5/r7tWTWq0JP/URkreuuypQouqCXWzDNvdfwkMMYBH29LiQaXxPKRKKUFbDZ2+T
 nOtkY7zE8iQGCOjNSYJItZXYJMm0AUXOTu9Q3/32zc3WNn5fMUaN/tbkU3Lqf6epyJY+
 e74G1CePKNBY+M2fBbJrKeh75S/HLtK2HUW0vsn7jnqihwaS/omFlbY0AEaHgCJqL87g
 hNXmOXNftnsMdWF6x1QI/ZbmM+J3wgmj0mvQZUcL7UA2fVVEyi5TTP++pF/01KpBtYzW
 vVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F+2AAXW8pcA9EEN5P9+YGXGUy6ri6k2H90uAmMmQadU=;
 b=zWrjmVnvp8y+vfRKqHt8Ik6MPwYCucMLx8veefEjT7MnIPBMt0HyllW+kZVhAitOAl
 uaInsWkuFJLF/8nv1V6qKkvXLIgmR8RBtcDn7DpBTWuGB/+/OObRy07r9rhVgfqVPiah
 U5M81ENIE4jB1R8uKQ0FceGs69KmAK+fP4WeEg6+ZXUmT6AZzzvEBu/4FWjkB5/WXR8A
 8gS7aZb6vRf3W5I5iJSZyn7LCD0skamFRVxYfxRV7kSnbm0ECSck0fb/zapJU3Q/TudE
 5rgvaWwqOcW/3KLSklRw/FZycB9ft4y2TR2mVvKDyFnX7EM1a4+n+f0u0ilJOL1bNavh
 inuw==
X-Gm-Message-State: ACrzQf0RDgn5SyvSXeTSnYZqF9WJkMKNKQdllFRTX+g7Lzb3XvZQtuom
 LqwVskDtE9Pgz8BLujSCH55pxcSuN4fkyYf5QN+DiA==
X-Google-Smtp-Source: AMsMyM4AQKsOmiRoJN4bpxZG8nAtCVTH5bLUxbX2you+lpSbig58O90p9wRKjtkYh7QdAPnDo3JbLHt+98HUeZKRH6g=
X-Received: by 2002:a05:6a00:b54:b0:566:917:e57e with SMTP id
 p20-20020a056a000b5400b005660917e57emr9790744pfo.26.1667144311293; Sun, 30
 Oct 2022 08:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <20221017062445.563431-1-richard.henderson@linaro.org>
 <20221017062445.563431-4-richard.henderson@linaro.org>
In-Reply-To: <20221017062445.563431-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 30 Oct 2022 15:38:19 +0000
Message-ID: <CAFEAcA_M+_uWEoVa_2vfz7GpDhUZ9mMfNnsbrpCvCxEf7+-r3g@mail.gmail.com>
Subject: Re: [PATCH 3/3] tcg/sparc64: Remove sparc32plus constraints
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 17 Oct 2022 at 07:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With sparc64 we need not distinguish between registers that
> can hold 32-bit values and those that can hold 64-bit values.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc64/tcg-target-con-set.h |  16 +----
>  tcg/sparc64/tcg-target-con-str.h |   3 -
>  tcg/sparc64/tcg-target.c.inc     | 109 ++++++++++++-------------------
>  3 files changed, 44 insertions(+), 84 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

