Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CE82D78CE
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:08:12 +0100 (CET)
Received: from localhost ([::1]:55970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knk1j-00031i-3g
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:08:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knk08-0001sq-8s
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:06:32 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:43588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knk06-0007uT-C4
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:06:31 -0500
Received: by mail-ej1-x641.google.com with SMTP id jx16so12760800ejb.10
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 07:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xuAJqAOcxP8T8FKeW9g2d58aSGCAwZ6psuOS3a6hOT8=;
 b=mwmnApxQMrWJr62Ki5srffosdroeRrwYVaM+HtaQb8EKZDi3EpgGTxklqykhobPyfN
 PJhmmQgY0bSr6rwegTovtwPMk8TTiqlCqQWO24qZTR6reSBNvyT0rllyrNZaOpjXX/4x
 zVnkJT5c62dIcpHovqzhm+DiaCElU7qSnJA7ABuAS+lxukjRFJA3msO6Z36BJrrRB4qy
 S/F/UT34jg+KXX8/O+yfx+xeOAexIkn0x8tkFyw0LG30DiiUz1LKWWQCR2UbeUB/e3Ak
 frr9WZvzMWgy1nwOKZ5av2zU0K8/rMSBS3UhNLu4IVnlNnPWuL5vwWhKLlPeUmpvCRH4
 zqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xuAJqAOcxP8T8FKeW9g2d58aSGCAwZ6psuOS3a6hOT8=;
 b=YzNhiHup2ffGAesNgMp9rLzvs6avYCGbzhkFHns35fcxWp8W4S4nms8Alhop1Q1cvR
 uUQ/3glYMees9NSShK7Xs6PYHOLspGR5/6E8GpOGhdajLFKB4YJ0tS9vhJ6oEOVCEaA+
 hfYb6GVwalMJBRqu/iezCxxPkrHVKUp2+EkwjvBJ5UTPhrphF92Vwxrx0wOfsqxz7vLd
 q+0Gp40C9w6YW46AzkQ7b+TEl4nF8Yx/mW+KCLcw4NzKj21+2GZaVHoK2Cr1ghkmulOS
 ewTp892GX/iRVtoNf9V1f8c8FaMZ1PJ2Y3Uguuo99fuGex8LDSBnZEygTNilBgUzz984
 D/Ew==
X-Gm-Message-State: AOAM531F3CVEmquDPYGEeZd+V9aduwiXGG0YmSd/sFiiIy/yA0PNBve2
 KYnfBVOrvVbiunESaT27dFkWa1+Af+sm/g6iRp/3aA==
X-Google-Smtp-Source: ABdhPJxmJZw38YrZlYCUeNsg0d5l25V2FIQ55hbXsosDL3JZayksQhpgk+fKq+p0voFTTvVLIdOMaeIuLBmPFNTSwaU=
X-Received: by 2002:a17:906:e94c:: with SMTP id
 jw12mr11459891ejb.56.1607699188714; 
 Fri, 11 Dec 2020 07:06:28 -0800 (PST)
MIME-Version: 1.0
References: <20201209174225.401337-1-stefanha@redhat.com>
 <20201209174225.401337-4-stefanha@redhat.com>
In-Reply-To: <20201209174225.401337-4-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 15:06:17 +0000
Message-ID: <CAFEAcA9nwUtgVF3-n=tfJ6JDTViP-G2XQhSWk-n-tEuV_aGvyQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] trace: recommend "log" backend for getting started
 with tracing
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
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

On Wed, 9 Dec 2020 at 17:42, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The "simple" backend is actually more complicated to use than the "log"
> backend. Update the quickstart documentation to feature the "log"
> backend instead of the "simple" backend.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  docs/devel/tracing.rst | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
>
> diff --git a/docs/devel/tracing.rst b/docs/devel/tracing.rst
> index 76cc1b24fa..039a0bb267 100644
> --- a/docs/devel/tracing.rst
> +++ b/docs/devel/tracing.rst
> @@ -11,9 +11,9 @@ for debugging, profiling, and observing execution.
>  Quickstart
>  ==========
>
> -1. Build with the 'simple' trace backend::
> +1. Build with the 'log' trace backend::
>
> -    ./configure --enable-trace-backends=simple
> +    ./configure --enable-trace-backends=log
>      make

Isn't this the default ?

It seems to me that the real "quickstart" is
"your QEMU binary was likely already built with the log backend,
so all you need to do is pass it '-trace eventname -trace eventname'
or '-trace some-pattern*'" (or whatever the syntax is: I
usually use -d trace=something but I assume we'd rather suggest
-trace to new users ?)

We can suggest also "if you have a lot of events you might find
it useful to put them in a file and use --trace events=file"
but IME that's not the common case for "getting started with
just outputting trace events" because you can usually enable
a whole device's trace events with one suitable glob pattern.

>  2. Create a file with the events you want to trace::
> @@ -24,10 +24,6 @@ Quickstart
>
>      qemu --trace events=/tmp/events ... # your normal QEMU invocation
>
> -4. Pretty-print the binary trace file::
> -
> -    ./scripts/simpletrace.py trace-events-all trace-* # Override * with QEMU <pid>
> -
>  Trace events
>  ============
>
> @@ -195,7 +191,7 @@ script.
>
>  The trace backends are chosen at configure time::
>
> -    ./configure --enable-trace-backends=simple
> +    ./configure --enable-trace-backends=log

'log' is the default so we don't need to specifically suggest people
select it as a configure argument.

>  For a list of supported trace backends, try ./configure --help or see below.
>  If multiple backends are enabled, the trace is sent to them all.
> @@ -227,10 +223,11 @@ uses DPRINTF().
>  Simpletrace
>  -----------
>
> -The "simple" backend supports common use cases and comes as part of the QEMU
> -source tree.  It may not be as powerful as platform-specific or third-party
> -trace backends but it is portable.  This is the recommended trace backend
> -unless you have specific needs for more advanced backends.
> +The "simple" backend writes binary trace logs to a file from a thread, making
> +it lower overhead than the "log" backend. A Python API is available for writing
> +offline trace file analysis scripts. It may not be as powerful as
> +platform-specific or third-party trace backends but it is portable and has no
> +special library dependencies.
>
>  Monitor commands
>  ~~~~~~~~~~~~~~~~

thanks
-- PMM

