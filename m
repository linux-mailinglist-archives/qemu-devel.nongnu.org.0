Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 166165F6DAA
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 20:44:20 +0200 (CEST)
Received: from localhost ([::1]:36210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogVr1-0001fH-1W
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 14:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogVNh-0002pm-Po
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:14:02 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:39425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogVNg-0008LJ-60
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:14:01 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 v10-20020a17090a634a00b00205e48cf845so5056519pjs.4
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 11:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5HvEw5JkXmpR706M+L+SS+52Zw8qNa0L+at6Hxs7y7U=;
 b=VqReS+JPM6jAeSeBUD+dpBgFt8nTk7PbPNR57omMppnes27zPFhkXAsqy0y2Hx6qpT
 DIl8Q0DHxQIsalaVblx8BDAAO3PFhyFo6u+1J3GeTMIsuOvSOoszfWf6eeuFqOwKhbZs
 x2WDy59vq9kl0Z0ekWq1CMBGm17glhF6Xrzh25F3Bm7sTwGuQZHZIryfNPpttD9XqU3Q
 JO2hDmLesPMKnP1+6HVt41cDgSRQzJtAclajj6QKWHVdMZ8oogQcjNPzDdc9I64RcQhe
 RhE4P39k61KRrsoj3BMKdLlhAQkw2v0PtdIO85L7n680humksWmTYJoorFCT92KRgiKX
 Mr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5HvEw5JkXmpR706M+L+SS+52Zw8qNa0L+at6Hxs7y7U=;
 b=ybR5g0bjrfR8BP0glXn7tWfJR7L8HfTMD481e4izRY7NT54h6pvbBpitoO81blQPgp
 5RMPisy6rALJZ9Jbn6lSX66J4ayDLB99e4GhsmvZHW80cq58vjin+VEJTwotMBdh/rBM
 O52DpKFCIObKXbEiXj5agODdgI9lN9SL7JBFxO7QMXZYvFNaSztsdJmIo/ebEznLcVxQ
 XZuTRB9/dMHd6UjdrDKamQatfb3sPCS1nf0XpimHxIm0Z0xCTKK95eNlUMyXbBqA2QMZ
 Wviw9rFpH/IJez0Ud2tzUhnoSfoU2UpP83fsCtL1MnoPZ69MPntxEnC81TOWzWkdQHw0
 r4kg==
X-Gm-Message-State: ACrzQf1byxRCvPOEkjzRAxsNxSS0RJJCIuSSf6UomrxYYx+RkuUEPBfd
 szJANWHpBHg/2drUSEmi9ufVzJO0kHqiG2JqZL5p9w==
X-Google-Smtp-Source: AMsMyM76FjHhqqnW9g2+gXTDx02850lPYbqEyXtMHOBPSAuSF/er9rBH38ODzNAASIQIOw9og7SwZPPXEkA6MbRkh0Q=
X-Received: by 2002:a17:90a:fe92:b0:20a:daaf:75ea with SMTP id
 co18-20020a17090afe9200b0020adaaf75eamr11570326pjb.221.1665080038105; Thu, 06
 Oct 2022 11:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221006153841.10750-1-sisshiki@mac.com>
In-Reply-To: <20221006153841.10750-1-sisshiki@mac.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 19:13:45 +0100
Message-ID: <CAFEAcA-fXq47T2kNUcjbpZ9fQbLdc=jzkT_phMqJ5wyKrdXNmg@mail.gmail.com>
Subject: Re: [PATCH] linux-user: mprotect() should returns 0 when len is 0.
To: Soichiro Isshiki <sisshiki@isshiki-clinic.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 sisshiki1969 <sisshiki@mac.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 6 Oct 2022 at 19:05, Soichiro Isshiki
<sisshiki@isshiki-clinic.com> wrote:
>
> From: sisshiki1969 <sisshiki@mac.com>
>
> For now, qemu-x86_64 returns ENOMEM when mprotect() was called with an argument
> len is 0 from a guest process.
> This behavior is incompatible with the current Linux implementation,
> which mprotect() with len = 0 does nothing and returns 0,
> although it does not appear to be explicitly described in man.
>
> This is due to the following function which always returns false if len = 0.
>
> ```C
> static inline bool guest_range_valid_untagged(abi_ulong start, abi_ulong len)
> {
>     return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
> }
>
> ```
>
> This patch fix this incompatibility problem.
>
> Signed-off-by: sisshiki1969 <sisshiki@mac.com>
> ---
>  linux-user/mmap.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index 28f3bc85ed..1ed79459ea 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -130,12 +130,12 @@ int target_mprotect(abi_ulong start, abi_ulong len, int target_prot)
>      }
>      len = TARGET_PAGE_ALIGN(len);
>      end = start + len;
> -    if (!guest_range_valid_untagged(start, len)) {
> -        return -TARGET_ENOMEM;
> -    }
>      if (len == 0) {
>          return 0;
>      }
> +    if (!guest_range_valid_untagged(start, len)) {
> +        return -TARGET_ENOMEM;
> +    }
>
>      mmap_lock();
>      host_start = start & qemu_host_page_mask;

Cc'ing Richard -- is this the right fix, or would it be better instead
to make guest_range_valid_untagged() correctly handle a zero-length
range ?

thanks
-- PMM

