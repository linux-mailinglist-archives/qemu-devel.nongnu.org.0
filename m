Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8EF68BBD7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 12:39:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOzos-0004MS-H3; Mon, 06 Feb 2023 06:37:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pOzoq-0004Ll-Gg
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 06:37:56 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pOzoo-0006Xg-FQ
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 06:37:56 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 f15-20020a17090ac28f00b00230a32f0c9eso3471270pjt.4
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 03:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uexPtxvo2H1fL0NWmv1sLqATz9FzxkRRtFJFUqzDoU8=;
 b=lvTcTYQi43C+SNmgx86DJPomacvV3JuMNk4BuxbkwYBt1YT3l/1uzh/gJm/45BQGH2
 1eOWmTlbKUbdcvgkIh4TVGRmxQVA6AyTYQ7ZkhRZgOZXcm+k0d9H6rpx1LX+U3l4QZ9v
 PPxgiGg4xkuSdyZxMn50JYWBW3Nu9yJGco9vFqHqAFmkO7yJtE1Y/M70W4h214+P2OgP
 P7BupEkL7HtcYEvaEJgoPyJ2OR86J6l85ZA4yHCNqhQ0MDDy03amAw5K24EVYH0bJapY
 SpCQsD2FU8EtVEF7WJk4NokCOxSmJ7L9+py5DUAV5q3aHaUySpomvV4Q5qD7sTWb9SAQ
 31qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uexPtxvo2H1fL0NWmv1sLqATz9FzxkRRtFJFUqzDoU8=;
 b=pW7mVD7tu5ZZjMMQWfgSYR6HenxKgm3pu3BMsTrsS8xuiuXPgkwHZpA0iz8fZnKsZF
 frZkPDy/evweuXekdt5nRQ5OWmtrFsbAbWUSeCCsd2F/Prcb5YpWyCl9CGZxizc042wS
 oLoUPP46VXIyG+VdE1Qj0pbAPnyB00xTGIKDLSCKfW0aKu+t/OHD1xzAvnzDaMUiRn+y
 eZ8CWMYb/MDDJsMRGxbv43WBwMnC79i5PvWLgVq+WxWhVBCgKhadkTwXFpf+N3vNjxdf
 f7tFQquqqlOjF8aalPEqwkNvSR2Zb/Hp55S4iTrSqbk5IRQOxIOaGKQw0EdZh3pc9PGy
 F5vQ==
X-Gm-Message-State: AO0yUKXXgct3XP4dA5Ci68DXRwoJSMLLzTeyds1jysciY3GiqqKBPZP6
 XmKGOiPx8/ZyUTbFEsMALA/ZAJ+sGPXcYBoDJwFqLg==
X-Google-Smtp-Source: AK7set9QWuA2ED9m5P0ggumLvFgkwFQU3Dz/2yLcngHfLI8RmF9uQDZ6IIrpR6VekkYnNtI+qUY3CAVLX00Kp2e5VSg=
X-Received: by 2002:a17:90a:313:b0:230:c24b:f22c with SMTP id
 19-20020a17090a031300b00230c24bf22cmr549109pje.53.1675683472949; Mon, 06 Feb
 2023 03:37:52 -0800 (PST)
MIME-Version: 1.0
References: <20230205100449.2352781-1-danielhb413@gmail.com>
In-Reply-To: <20230205100449.2352781-1-danielhb413@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Feb 2023 11:37:41 +0000
Message-ID: <CAFEAcA-ffNmy4ZRyYhw5CGbo1BVuuX8nt3WO=GyM82yASaxKzQ@mail.gmail.com>
Subject: Re: [PULL 00/16] ppc queue
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 5 Feb 2023 at 10:04, Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
> The following changes since commit ceabf6e500570ecfb311d8896c4ba9da8cf21f2a:
>
>   Merge tag 'linux-user-for-8.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2023-02-04 17:17:15 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20230205
>
> for you to fetch changes up to bd591dc1b3c39b7f73b8d9f20be6e9001c905238:
>
>   hw/display/sm501: Code style fix (2023-02-05 06:40:28 -0300)
>
> ----------------------------------------------------------------
> ppc patch queue for 2023-02-05:
>
> This queue includes patches that aren't PPC specific but benefit/impact
> PPC machines, such as the changes to guestperf.py, mv64361 and sm501. As
> for PPC specific changes we have e500 and PNV_PHB5 fixes.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

