Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9072E80C2
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 15:59:11 +0100 (CET)
Received: from localhost ([::1]:45536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuzPy-0001Fo-5G
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 09:59:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kuzOK-0000o7-G7
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 09:57:30 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:39431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kuzOI-0006vg-MY
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 09:57:28 -0500
Received: by mail-ed1-x52e.google.com with SMTP id c7so18384101edv.6
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 06:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Co8CGFyF2XjgzT2nkIWbAlfFr+ZT4chPJEWK5n1lKWQ=;
 b=mLweCfybXX05GB0400wBE+gAbpRnLqZf38FY8xvjnYEoShe2/YsuFk5MJZDbVb5Lka
 WQfEdKHIN6JBHU4iN7npyKesZPczr4IH6+nN8Lsye6moQpw2AARRcjkc6Lq1Vsjv1Blu
 TEACq/5b/oqmpigAQVCRAe2zAfU3mvRG69/2SHxsyv59IQCYfCV34zaJEEYAuYXXP+tv
 KL7rGqiTDxHxbC7jvHy/ohZMNXXM0bZV4/g6bvmpSfqrc/r7lGw3ddC6fcoCshmgQ2Ps
 Bol/G8pSYKJCZiGrysR1uM6LMOp9sqvHh0RY9oAMG00QevaYHZiIgoKcWdw6LNEb0m79
 iaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Co8CGFyF2XjgzT2nkIWbAlfFr+ZT4chPJEWK5n1lKWQ=;
 b=jMWGnyyVbDJ/Qfov4xiK9us4Ic1emMK+/9YLnM1LXMtZXdkvQt8MErvHfEzLzLXBJv
 OV19m7C7IkKcX8An3UidfXeGVkW4RAK8/dSVdbmc0y00Bj6IdWngMzWbt3t8GsB0tQFO
 FAN23sVugQm3nvnuuBLKnTpxW5lVjJMO/YOe9dXsBfQQ5oQ9Iv1wKALtQJ0EptRfnGxk
 ZVvpbrlH1asWFcLyHAzUrOUtRmU2SDeTONgBWVo8SR8lII9HaNx0yxJP894PxoYfYaHj
 b7iAS5Q6UoOZo/AxK8EIewoeXGMdehbNsPEA2uIHTEVeS6W+wRnvxRQAllnV1iwE/ezl
 Aqcw==
X-Gm-Message-State: AOAM532XimkNXYCl+1YyfNn4yKRt0CYlasVbULX/aKif11KmFbukFtvC
 YzsnXEEUpRrWJSgjQM1zlBbFHWG05Jx+X/pVk9I1jA==
X-Google-Smtp-Source: ABdhPJwrSNujNpEbEeZ7/G8aZaPEKbeGeqFzLLlniihzQlX4YtCXf47X5+jwIeNI0DQbSRnZNitSf1kB91TDRJ1qDLA=
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr751165edw.52.1609426645003;
 Thu, 31 Dec 2020 06:57:25 -0800 (PST)
MIME-Version: 1.0
References: <20201216160923.722894-1-stefanha@redhat.com>
 <20201216160923.722894-4-stefanha@redhat.com>
In-Reply-To: <20201216160923.722894-4-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Dec 2020 14:57:14 +0000
Message-ID: <CAFEAcA8_cFGtU=_6a7XzD6ky-fvn1k9_usjaKrwjBxAP2Ls3Yg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] trace: recommend "log" backend for getting started
 with tracing
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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

On Wed, 16 Dec 2020 at 16:09, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The "simple" backend is actually more complicated to use than the "log"
> backend. Update the quickstart documentation to feature the "log"
> backend instead of the "simple" backend.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  docs/devel/tracing.rst | 35 ++++++++++++++++++-----------------
>  1 file changed, 18 insertions(+), 17 deletions(-)
>
> diff --git a/docs/devel/tracing.rst b/docs/devel/tracing.rst
> index 76cc1b24fa..e60058bf55 100644
> --- a/docs/devel/tracing.rst
> +++ b/docs/devel/tracing.rst
> @@ -11,22 +11,22 @@ for debugging, profiling, and observing execution.
>  Quickstart
>  ==========
>
> -1. Build with the 'simple' trace backend::
> +Enable tracing of ``memory_region_ops_read`` and ``memory_region_ops_write``
> +events::
>
> -    ./configure --enable-trace-backends=simple
> -    make
> +    $ qemu --trace "memory_region_ops_*" ...
> +    ...
> +    719585@1608130130.441188:memory_region_ops_read cpu 0 mr 0x562fdfbb3820 addr 0x3cc value 0x67 size 1
> +    719585@1608130130.441190:memory_region_ops_write cpu 0 mr 0x562fdfbd2f00 addr 0x3d4 value 0x70e size 2
>
> -2. Create a file with the events you want to trace::
> +This output comes from the "log" trace backend that is enabled by default when
> +``./configure --enable-trace-backends=BACKENDS`` was not explicitly specified.
>
> -    echo memory_region_ops_read >/tmp/events
> +More than one trace event pattern can be specified by providing a file
> +instead::

Does --trace really not let you specify more than one pattern
without resorting to putting them into a file? That sounds like a
deficiency compared to -d (which allows -d trace:PATTERN,trace:PATTERN...)
that we could look at fixing...

Anyway,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

