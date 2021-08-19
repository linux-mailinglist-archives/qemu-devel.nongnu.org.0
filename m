Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C1F3F1C78
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 17:17:06 +0200 (CEST)
Received: from localhost ([::1]:34186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGjmz-0002Ag-V3
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 11:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGjkj-0000DS-Hj
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:14:45 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:40499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGjkh-0002Wu-TA
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 11:14:45 -0400
Received: by mail-ed1-x531.google.com with SMTP id d6so9385259edt.7
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 08:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nK4hYCm/G/HSi/PLxMM1rA/LJmu+WgH6WHZ9OhLv8ws=;
 b=jNz93p/fD7AICNx1r3K+HaBXwUFHzHURoV+v76FGsVINVal2atx583xyRg5RtbFNx+
 uekyKpumklETmRJKdjXEFddkdq2aFpE6Nd4jX1h+Ten/nUFUhrOV4BLajCH2YxvLgE5r
 Wnx9BckUFaFKHZS2Vazpo56tES+v4AONnlIYu0i9FWiNTn8mRQanDV7RHi8TUdIG7PMS
 qQnD+wJ3qewiiw4WZxdCpeEvT4hZO3TzVbZxvZJfXO7y/7wty4aHBDm58LVKUQeUqaCk
 Lgvmrxmk2Epo+eYLJ7TvDfxrFT7aMeqC2Y0R21T4IFiG6mgs8NHVRR8dsrpHiHzOaUwb
 RasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nK4hYCm/G/HSi/PLxMM1rA/LJmu+WgH6WHZ9OhLv8ws=;
 b=keHciSbIhgdPxSzyDPxugDLM+yPUBPb5TvizWmUlWqhtUHe8KTrIgKlTp4CyG6D5vz
 4gPmS/fUpinlfpJzYp+Kz9qLCtjuQBTKvTFGLtWN+YfKQjUhtP3t8Fobum3kgywlx/1t
 YAaFTw61dq+taYI8X8aG3JlrM4CS4hwMEIHtabWDXPIi0SwT+QmAzad9lDK5nMEVhdXf
 Zp57AfuYZySfdjZe9UcBrZ3ggsEgLvUBELpKD7akWd/nxgdtg5VqOhA/BKGbTt240aVw
 tDi/gHTAPqrM+xkG0hivWSwhDgGSr0aXAGDhNNtg+UgVaQiL+UsOq28z+K6OItJ4kd7Z
 CQqw==
X-Gm-Message-State: AOAM533Vwd+lKnqFxJmYarrGhA6zwOacwKoCNj1S3PY8/ZCURK8xhDHi
 LKcPmN22xVFg41IpFHCqEi5J4d05E0NMx5ORKPgQyw==
X-Google-Smtp-Source: ABdhPJzB98X1j+N1yQmh2KYJJtcSTX/ZeORL/wXKSwKszoNKyuiOZATdeSNRYrOB1XZx9qeSoVvCxoSOy/95H+Q2gRg=
X-Received: by 2002:a05:6402:4387:: with SMTP id
 o7mr16903881edc.204.1629386081916; 
 Thu, 19 Aug 2021 08:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-2-richard.henderson@linaro.org>
In-Reply-To: <20210818191920.390759-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 16:13:55 +0100
Message-ID: <CAFEAcA8vyfxfkAZyFoREO_OpCsGeaU9oFrU4e3g0Vp=9aHab4g@mail.gmail.com>
Subject: Re: [PATCH v3 01/66] util: Suppress -Wstringop-overflow in
 qemu_thread_start
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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

On Wed, 18 Aug 2021 at 20:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This seems to be either a glibc or gcc bug, but the code
> appears to be fine with the warning suppressed.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  util/qemu-thread-posix.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
> index fd9d714038..6c5004220d 100644
> --- a/util/qemu-thread-posix.c
> +++ b/util/qemu-thread-posix.c
> @@ -537,9 +537,28 @@ static void *qemu_thread_start(void *args)
>      QEMU_TSAN_ANNOTATE_THREAD_NAME(qemu_thread_args->name);
>      g_free(qemu_thread_args->name);
>      g_free(qemu_thread_args);
> +
> +    /*
> +     * GCC 11 with glibc 2.17 on PowerPC reports
> +     *
> +     * qemu-thread-posix.c:540:5: error: =E2=80=98__sigsetjmp=E2=80=99 a=
ccessing 656 bytes
> +     *   in a region of size 528 [-Werror=3Dstringop-overflow=3D]
> +     * 540 |     pthread_cleanup_push(qemu_thread_atexit_notify, NULL);
> +     *     |     ^~~~~~~~~~~~~~~~~~~~
> +     *
> +     * which is clearly nonsense.
> +     */
> +#pragma GCC diagnostic push
> +#ifndef __clang__
> +#pragma GCC diagnostic ignored "-Wstringop-overflow"
> +#endif
> +
>      pthread_cleanup_push(qemu_thread_atexit_notify, NULL);

Fixed in glibc in commit
https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D548f467fa14ffe7d95=
5beeb31b30e2aeae4467e0

I think.

I found this mailing list thread:
https://www.mail-archive.com/dm-devel@redhat.com/msg20144.html

which suggests that another workaround would be to include pthread.h
before setjmp.h. For us that would mean we'd have to pull
pthread.h in in osdep.h, though...

>      r =3D start_routine(arg);
>      pthread_cleanup_pop(1);
> +
> +#pragma GCC diagnostic pop
> +
>      return r;
>  }

With a link to the glibc commit in the comment,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

