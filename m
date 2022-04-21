Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B577A50A87B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 20:52:09 +0200 (CEST)
Received: from localhost ([::1]:59308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhbuQ-0003ES-Vk
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 14:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhbrp-00009A-Ti
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:49:25 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:35534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhbro-0007BB-Cr
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:49:25 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id w187so983062ybe.2
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 11:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wRid2AqeSdOaPCfFNX4wZP0NqHljwOt+Q1+Mh4UwFZs=;
 b=BkUBy54hWQjF2txgqWQbXEkQzw/xFkqSsbPvoNJDGbO6CFJR7W+m7OLyqPi4wpEuFH
 TsUJPgmr/6NTTmqR5na/OanxZxvSKIUra7LEL8zTbdNpcJ2rYvwjl/f4XEQFNhkVDt41
 jyCc1KzjX18J6GAe3hFRjvbiT5m+FBuF/F/ZLmk7LbuA0I49ZiCSsTFMDHFHMD9mSpCk
 EHjES8wcpJheqpt2aJ1YTxWAFiCll7VCVAGZuWvmFgB1f4Wii4IojFQfCxQXnrrXoF4p
 Gt/XKBOiUnwJMyjfiJg8cLG8+na1MDAa7mCrmOnJ83ArikiJIINJ56wWLtNzgisBXKSx
 h2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wRid2AqeSdOaPCfFNX4wZP0NqHljwOt+Q1+Mh4UwFZs=;
 b=wmj4kklO9JID4MwJhoDfENM1cVqFcEv/4YNoY0uHAd/5raZPgA1dHN8MN2THn016CR
 s6iVAWpIPESvdWLFK+6mIExZpczrRfLAlUC2SPdhlrrvlqKZbhG/8Mahje4az8uItBs3
 BkGXzKlIxVsGYwvFkdK+ZlGuc9ryG2vL1ShMHngCRt6p0YK6aoe1rx4K0FBXB7RXNmtf
 gygPuHJwZ9EAKODuUI4nrQja3Zja8XTQJG6n/zxXyug8hQjcCzLPd02WdfzeZ3iEklta
 xfMhGFa3o4E0Yfa08MyEwOprF5cYOzeWpGgIWlLab/XShbeManjtDrOaeALvF9zo1K0T
 Gpaw==
X-Gm-Message-State: AOAM531ICRgfIMLTY3QT2wWsNabo8zly6VJQXZI/k2fIjR9uR8F9baAQ
 UkkYQD3dcj9MuOvkQ5GYKjkvbPkiso5y3pQ4nG5oTA==
X-Google-Smtp-Source: ABdhPJzIuzdTghF0ynwvVwXfMU7X0+sw3Q+r81BMmjfUEYZ39ocsk1bSbSFPOB25eQrre05euo9VbmIDDdsSnUos+c8=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr1114863ybq.67.1650566963380; Thu, 21 Apr
 2022 11:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-14-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 19:49:12 +0100
Message-ID: <CAFEAcA-SSTrYqB3ASJYWsAAoiV2BXwLusxON_+C0CziutWT+BA@mail.gmail.com>
Subject: Re: [PATCH v3 13/60] target/arm: Use tcg_constant in translate-a64.c
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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

On Sun, 17 Apr 2022 at 18:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use tcg_constant_{i32,i64,ptr} as appropriate throughout, which
> means we get to remove lots of tcg_temp_free_*.  Drop variables
> in many cases, passing the constant directly to another function.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 302 +++++++++++--------------------------
>  1 file changed, 90 insertions(+), 212 deletions(-)

Split this one up a bit, please. It's not too hard to review because
all the changes are local, but if we find there's a regression
in here later I don't really want to have to wade through a 300 line
diff to find it...

thanks
-- PMM

