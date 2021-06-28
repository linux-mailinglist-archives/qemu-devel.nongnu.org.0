Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DAE3B65AF
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 17:31:25 +0200 (CEST)
Received: from localhost ([::1]:38612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxtEK-0002jt-Fb
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 11:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxtCO-00012y-V0
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:29:24 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:41520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxtCM-0001Tl-Bk
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 11:29:24 -0400
Received: by mail-ed1-x533.google.com with SMTP id n20so26531130edv.8
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 08:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mSnLWmhaD8LMz8ECtNPS+/DL0UXNQW+XEgF6PEoaYwE=;
 b=EXg2kSZlEyCB7lX7UIM7qovMv35PFV1X8DjFDB/y0SfIK7tOxTdc8oyqg/S97vZ0z1
 o9JMT/PV4RglkcK0+78E6fBaXyNwR1DRiHGvdrpjAYdu8YLVum9z0bN8Atd3eLxgOolD
 8x7mczkj6BPzvP8NZClrlN4TtnbkCZiM3cIYQIfkXyzvFQhYSr6gPuYn9T8LU3Y7IiVz
 NXd2zQyQ1WG7/ZeO99AsosX+bMMA+d+zKJVResPedke4RHbO++ke42rVfZ4giIX8/KlX
 01+qzCyoAkmDeCEiEdhG3tDBe3ImZq2oXUWMqGg2jiaUdt6Nqw0/56vPaXaJsqBi1bxd
 BFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mSnLWmhaD8LMz8ECtNPS+/DL0UXNQW+XEgF6PEoaYwE=;
 b=PZT4r7K58eWMvlZYLG5C6vw3K+AqPCD3deWcnONCzau+z6hJUXmKpsU/HA1db/1GOn
 eL+iwHVXukIj9ymMAGS5tN7fZoRB4ZOQZ3jpredEs0CLyaCa6+1tzGan+p4d44aj1W4J
 mJp15puCeyg5EBuPgFkUAcgDXOsQeqwlTChIcJHWL+ZAFjAq0C35+snckh40WCTTnt4L
 i1wrMddXXkPApr234P4ROfyMTgXb6p+dc+idsHOtO0Iq3gYTydquU+q1EAsLSwmYGs24
 a+tAN1JL8wAEzJx2AZn+pwXy9d+mb80N+0QHZ+OrHacnQibtxZZaY1XrkV8Ocgxn7zpV
 5z7A==
X-Gm-Message-State: AOAM53169eMzgZXeHatumZzUF8MGaNuY3EuWc6DDQNvMjebTDc/3YnlO
 awGuyYhEBU2BRcnyrXcc+wEL1d25TIiYCJLJlWF2kg==
X-Google-Smtp-Source: ABdhPJwSXpxmVVfgmKG8KIYdt9y/e4qw/drPl0Q//j8uJzEnqPavkdKSRgpccwnGPWPkafgS5MJZTMPAJ3fiv1Be0lU=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr32941583edt.100.1624894160888; 
 Mon, 28 Jun 2021 08:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210620221046.1526418-1-richard.henderson@linaro.org>
 <20210620221046.1526418-5-richard.henderson@linaro.org>
In-Reply-To: <20210620221046.1526418-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 16:28:44 +0100
Message-ID: <CAFEAcA9p79qy6OOBTeZwmdt98zWpi+RryrAc5mCXyZRJ+uwegA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] target/nios2: Add DisasContextBase to DisasContext
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 20 Jun 2021 at 23:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Migrate the is_jmp, tb and singlestep_enabled fields
> from DisasContext into the base.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/translate.c | 51 +++++++++++++++++++++-------------------
>  1 file changed, 27 insertions(+), 24 deletions(-)

Bah, clicked on the v1 email again. Comments from over there apply
but anyway
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

