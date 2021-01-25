Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F623023BD
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 11:38:06 +0100 (CET)
Received: from localhost ([::1]:49688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3zG0-00052R-Sd
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 05:38:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l3zEE-0004HS-7a
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 05:36:14 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:39456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l3zEC-0000Ju-DU
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 05:36:13 -0500
Received: by mail-ed1-x536.google.com with SMTP id b21so14612375edy.6
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 02:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zifX26TFrULAFIPYxUDhieaYUaqKkXNz8UEnknCJSV0=;
 b=ovgR6L7GT/Tx5VjCWw0zrZH+/52GGqElbjPI6cv+CggXRKZaA/BKwvl+bJk/X3eO7t
 43klTAF6DgCOZgk0E7Lzcdvz8XiN0pYJY/Wri8/gPRXgbX4t96LG0RXN/aoiwWYaeHXI
 ggm3PM4DOc8SWWIkJOp8vqsWw0bFjw1RnJgHYbvc7VPMeDbAyr2ISICfHfj0k3BWCs3Q
 iV1tUTkkNENkpCINkJI3mAHQOjB3m4b7vuV6xlheYKH3UlSu+NOMUm8pSFqsHFwl3WFt
 D6QcrYnZ6bDPYf6l5AfJXWgC36DY6036dFpclRvsgAqAW6rDZ7SW2CXkuiTCrfIPWUTn
 WJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zifX26TFrULAFIPYxUDhieaYUaqKkXNz8UEnknCJSV0=;
 b=UpTSPfJrnc1Kq+TWaPA8RhIA4Emu/RBKJzH6sZRsDUE3d1X+3Ovy5+lhA3EHEENawy
 W2wACxFxpqxOMfRsWCXpsjpkEDmffYek5bM8PGIOp//chPxJfzYP66I05TioiEjUyJJ9
 nJhTTyojGvuOaJYLXdfPi5BISvAS7QIpeUIT6X4QvaKYcoQ06TVYBfMUMWkQCtWguPGW
 vS4OBg02LKGGELGIa6sFaG0jelDfVK16R/Bdk64mQtrD+HeSWkKsNKK+Q/kvcIrojsvw
 Dz4iscoHNSpv5eWW8BZs1cD6OkVztQul15Mr+FEZV6uuVVwA/sYXwESUDNyYOaQ/uadA
 hyxA==
X-Gm-Message-State: AOAM530YxcllSzfIbfGScg65Qjy4bSmM0poCKgpy0k3jeQ28KBQDJ1Oo
 SZDEGda2sHAZGv4Vl1IMC2seBEgP65lRmLLcwMlbBA==
X-Google-Smtp-Source: ABdhPJzBwL9eQBsYOyD5u0CNOh7JGYlnTdppnHlcS7xMDk3B2wojUwHa16lomeph+Jzz+BD/Yt2btDyfG8GrssT/vpM=
X-Received: by 2002:a05:6402:31ac:: with SMTP id
 dj12mr1078259edb.44.1611570970191; 
 Mon, 25 Jan 2021 02:36:10 -0800 (PST)
MIME-Version: 1.0
References: <20210124181122.5447-1-richard.henderson@linaro.org>
In-Reply-To: <20210124181122.5447-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jan 2021 10:35:59 +0000
Message-ID: <CAFEAcA_CVY9aKGVWme1RE=FX0bnWEJV_zYnmQVqN790xXbXA3w@mail.gmail.com>
Subject: Re: [PULL v2 00/10] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 24 Jan 2021 at 18:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
>
> V2 replaces the tcg const temp overflow patch.
>
>
> r~
>
>
> The following changes since commit 0e32462630687a18039464511bd0447ada5709c3:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.0-pull-request' into staging (2021-01-22 10:35:55 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210124
>
> for you to fetch changes up to ae30e86661b0f48562cd95918d37cbeec5d02262:
>
>   tcg: Restart code generation when we run out of temps (2021-01-24 08:03:27 -1000)
>
> ----------------------------------------------------------------
> Fix tcg constant temp overflow.
> Fix running during atomic single-step.
> Partial support for apple silicon.
> Cleanups for accel/tcg.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

