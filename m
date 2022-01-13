Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0386C48DF35
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 21:51:03 +0100 (CET)
Received: from localhost ([::1]:44824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n873l-0007Zr-Ul
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 15:51:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n86tz-0006sX-BV
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 15:40:55 -0500
Received: from [2a00:1450:4864:20::335] (port=52038
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n86tx-0007EI-KR
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 15:40:54 -0500
Received: by mail-wm1-x335.google.com with SMTP id e5so4746582wmq.1
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 12:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y1DB1apbtxl2D9I9dSyF4ahS5YNjQcFy7BT+6GH72GM=;
 b=tD127z2wQ3lBjZg0lj5UIHuTSyauU99h0yAMllhHDBbHK5j/KgjwLKbAZ94s87R+Ps
 yj9grzX8VgqzkAhrbZMr1Nr3Vnq2RdbDmw68rsPQk1BXCc2VvIr+2KDT3zhrtzWbT6EW
 TbVeobthCoUEE12Pk9GlvM3yCHCIkv0VAlVR4wiO6UWd0cabaV/UVth7ekLF/1toT/Xs
 rImQhPmL8ls2Sxal1YVICNGkGRYYbZzo7Jfh8ywBTbpa8K5TaraPwJ4Rucchar3ZOCcH
 ZKroz7AyrwzHSMq7ToazKWFePs05I6lPpPQXmYvDedKaYIU3HPiWwaB1yaU+sKTa7T18
 fQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y1DB1apbtxl2D9I9dSyF4ahS5YNjQcFy7BT+6GH72GM=;
 b=U/hZwVQmo1742Ig72x636T2VKiC3q+3mUZr/5F/YSTDnzG7vf1+2S8ZN6WDemS11LG
 L04P08+qmAPDgTNiKd9CsXk20b0y2uIcqLycyfcb6GwNu5I6wcUhrNsKM5N+hXjfNz2E
 Qt8G0lc1QWjdWqqiEQ96qSOLmDFddYIVqYALk0gtjiZsgnPz1vCs1+y3a6ZeKHZIMyWJ
 KvwL71LXHRfhgj30h+FKZ15Cf2cO1FZveKQM5wIDF9/bMhtlcH3rn0hqB7gtyFJ4PlmL
 g4K4YZrk9q3u59c1AC9Jl1rhl8G/ywl3Bim6VF6cL2bZGgG1FP+Q/ATCyEgJNbdciMbH
 OqSg==
X-Gm-Message-State: AOAM531PG60s3Mh3UhNyfZT+OMplP8umMSTLw4ef3yRlFIeqqfygTU1O
 Vw1kkqJkaa7McK71j9yMbSzf63oN20z0jeWC8uXHgg==
X-Google-Smtp-Source: ABdhPJxQrIwShF2sAInzAm4nuj6smqTipSIZHT8+PjLzXhNNnrWQQgZDK0zVST2d5kO5Kx2+RiImFU09L/R7PmRw5hY=
X-Received: by 2002:a05:600c:1991:: with SMTP id
 t17mr12603123wmq.21.1642106452348; 
 Thu, 13 Jan 2022 12:40:52 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-21-imp@bsdimp.com>
 <CAFEAcA8ZMSuxyJiHEBbwnZ3cGyBdUrzSBiigLn7=8jWaH1YO4A@mail.gmail.com>
 <CANCZdfqcxgaukAiSFyDMqG3q_XOonu_gUbJGYFrHen0JQDvrFg@mail.gmail.com>
In-Reply-To: <CANCZdfqcxgaukAiSFyDMqG3q_XOonu_gUbJGYFrHen0JQDvrFg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 20:40:41 +0000
Message-ID: <CAFEAcA-G=Z5UcGFPnUnhNs3Pwx9q98cj5QZ3ESh6Ybx4V87A5Q@mail.gmail.com>
Subject: Re: [PATCH 20/30] bsd-user/signal.c: core_dump_signal
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 Jan 2022 at 20:28, Warner Losh <imp@bsdimp.com> wrote:
> On Thu, Jan 13, 2022 at 1:22 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>> Code is fine, but since this is a static function with no callers
>> the compiler is going to emit a warning about that. It's a small
>> function, so the easiest thing is just to squash this into the
>> following patch which is what adds the code that calls it.
>
>
> Sure thing. I'm still trying to get a feel for right-sizing the chunking...
> Since the warning didn't fail the compile, I thought it would be OK,
> but can easily fold this in with the first patch to use it.

Ah yes, we don't currently default-enable -Werror for BSD hosts
in configure (only for Linux and for mingw32). So in this particular
case it doesn't matter much, but we might as well do it the way we would
for code that's not BSD-specific.

thanks
-- PMM

