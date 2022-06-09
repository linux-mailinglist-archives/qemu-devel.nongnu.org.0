Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1AF5453B8
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 20:09:37 +0200 (CEST)
Received: from localhost ([::1]:41140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzMbA-00066p-Mg
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 14:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKfI-0005q2-AJ
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:05:47 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:36047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKfF-0008F3-03
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:05:43 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-30c143c41e5so246082787b3.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W1eZeSLTwKkrvIeTP0WqrQdKj7CWhHK0y0yXcwNChMI=;
 b=E/pzjpbdnXVHXQwj8mmZuoI5UltV8CUUhEBjwTP58NrehUuAy3xyX0/H1avdICWqkY
 pEU3fQYJfKLlWCrmUm5uJADnkPBEnGCDHWe6XjKhzUo7x8OgOPgHnZA+ctEArW0fddbW
 X78qoDGvG0dZPxUUpOUpF31PH4MuoeFWxmPTkQH+tB4RwB1Qej84bmRkd4BXIisDp1KM
 +zNO9dFt1j0kuYuJRyJUNaKS256moCQGe6PMZYtY1qMmxEcM58+9kt1V943Vxyxqmovy
 /2UpM2L/WJPACUoRidbN0ized2ybjiy+FiOPgWnXy326yR5Ze0VEJqRA6VCZrdkYTe2Y
 6jCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W1eZeSLTwKkrvIeTP0WqrQdKj7CWhHK0y0yXcwNChMI=;
 b=WjH2SFue/ML9vGyertKPpOFpPVVt976nhRnV6qUbQpubP2Pg49hYbFDvt/De1l5tsB
 RAVhI26tQLB5JGVSfXFvd2ebRKuoDKrtGgqYItvJg3QfULV+6ejBjLf0x6pQNVZQ4232
 LVD2SWs0FIlivRKhBSobJJDulamNu3O4VeFNiprz7F16jbHp5SvWsA1mjTb+cer57mtb
 EuxvP8JVXyvW66p2cjw9wqGzKhGdtWnKQsnXdYdm9E0C3JNIaWsLyxeGmuhg/KDV9jbR
 OOG9XMx9qz/bVgPZZzZurahTtDnfYn47wrXa5W9BiT8EkOE8hk8lHpOPkuXoQHEHZLFd
 X7Tg==
X-Gm-Message-State: AOAM533ndRsbl4xjh1zcK0xQq/sOmBaTpJ8uQzerjOfF2A2UhutIgaro
 xIiPBwouyHMxJTle6J7/hiAGz7n72V1M3Il8i76qcg==
X-Google-Smtp-Source: ABdhPJytGWmHi7XBKjxFJ9ZFulQtY0Li+m8vLEGU8aJbFy68Gf5wrU5lK7Jm17x0a457aSNxxamkoId4CrR2M34fSPc=
X-Received: by 2002:a81:6589:0:b0:2ff:e11d:3fb3 with SMTP id
 z131-20020a816589000000b002ffe11d3fb3mr43259606ywb.10.1654790738926; Thu, 09
 Jun 2022 09:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-13-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:05:28 +0100
Message-ID: <CAFEAcA8QVv16QPjnDdBFhw--2fHHVV3U8v+jg2Zan=mT3hGmvg@mail.gmail.com>
Subject: Re: [PATCH v2 12/25] target/arm: Rename gen_exception_insn to
 gen_exception_insn_el
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Tue, 7 Jun 2022 at 03:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.h        |  4 ++--
>  target/arm/translate-a64.c    | 30 +++++++++++++--------------
>  target/arm/translate-m-nocp.c | 16 +++++++-------
>  target/arm/translate-mve.c    |  4 ++--
>  target/arm/translate-vfp.c    |  4 ++--
>  target/arm/translate.c        | 39 ++++++++++++++++++-----------------
>  6 files changed, 49 insertions(+), 48 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

