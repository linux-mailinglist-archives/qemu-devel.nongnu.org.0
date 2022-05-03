Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4275189EC
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 18:29:14 +0200 (CEST)
Received: from localhost ([::1]:53538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlvOj-00073E-Iu
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 12:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvL3-0002EX-HR
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:25:27 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:33393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvL1-0007sH-1u
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:25:24 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id j2so32056009ybu.0
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 09:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1fiALV16VmK25BHaY7dI492agzHdhAmJ3CtIdS0HzSU=;
 b=yWf6tqfXqFugsYiN8JQ1ujwIsXpC2gNejdUS0EB/rEW8IZxugcw4bY1XqK9oQnOrmo
 grFo/g64JzqAlmDvpKVHWc4x7QIgK/NRaWqSaE7O2casMRza3JMmMugYCMTrUP24Cb/g
 taYN6nYO3bhFowBG59DvFrPKf2kdcsnwIAX6wVWx5h+6vt84g/tB3YlSCLpXn1Cu8aBK
 e4ebiPjwIAve8OWNrTf+viH6of36FpSNLceRTiVomN+Y8gTIIuLVEf3G3LWG6QbEJgcs
 P8IhwqqqGDioCIV2MTdzdWNuPw3/Q8EBhazEGx8+EITgQ+nfxp7I+F7seACwFX/W52Bs
 h6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1fiALV16VmK25BHaY7dI492agzHdhAmJ3CtIdS0HzSU=;
 b=UkdaAZXAqIhqG3Ol6y4WeevVfFbLMOOiFucjK9tImt4sb8M76GIyR+sYNvV8ElHQAN
 z0kTCGw21d965580xJvMc5D/qUF9UlbhYRjr3XdSrHUIn7A7GCpp8z9E7jTSPgNw5pme
 /9a8mR8KE+P/p8J3U22ZO66bG5JXWtugFIx00u853WPEuuXUuT5vZ4yoJqVksL306Dmz
 ZqFmSnA/6xx4GnsbXccNA1dZXGO6PnM8cKc7xb5I3McbBoD4k1E8ZOibe1ssIj7TNS4s
 nK6OFGBCh6m0EFBcHnokXUXS03AyzmjbVncRbPm9Ysrc69FtysSLrUxam5Uq8HBg7otL
 hp1g==
X-Gm-Message-State: AOAM532f04RjIY5AAAZHaJ/3OWBb8CzDT5pkufGzN6WhFnY3XZ5MyhS7
 eXVQEIWSRJ4iKtf5RHumh29GceaEW7r0zRHVz8sybw==
X-Google-Smtp-Source: ABdhPJwcF3wnkQBmdHxKnzqXLC/4BiBgtY60fpfaQ/uOPhBqtPQG11oxFb2Y80JcH7UG7/krRLvCrdgwR0fEtthmdZc=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr14572879ybq.67.1651595119915; Tue, 03
 May 2022 09:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-20-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 17:25:08 +0100
Message-ID: <CAFEAcA9LNL8B9Bwo0O5cdwJ1GGri=D=_-dgLX=S4y_3_ObyxYw@mail.gmail.com>
Subject: Re: [PATCH v4 19/45] target/arm: Remove HOST_BIG_ENDIAN ifdef in
 add_cpreg_to_hashtable
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 1 May 2022 at 07:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Since ee3eb3a7ce72, our host endian indicator is unconditionally
> set, which means that we can use a normal C condition.

You mean e03b56863d2bc (ee3eb3a7ce72 is the TARGET_BIG_ENDIAN commit).

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

