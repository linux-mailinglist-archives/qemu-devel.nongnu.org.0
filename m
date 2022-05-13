Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62309526620
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 17:29:57 +0200 (CEST)
Received: from localhost ([::1]:52600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npXEq-0006Jx-8n
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 11:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npXCy-0005TS-DW
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:28:00 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:41710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npXCu-0005fl-Ay
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:27:57 -0400
Received: by mail-yb1-xb29.google.com with SMTP id o130so351246ybc.8
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 08:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DfOg2jlpQ5iUXnWEzQWk74iahYnkjJzUz6MRobResk4=;
 b=i8HXGPG6+6gB8isiY+Sz+38Sa+4EMubVhgxDoGAwYyrB5Wc3TGV0RAZ8Q0T8zxA6qo
 aXnfgWsr+QLrhk9viy0xBNElExJP3S5Pt8bAr8NyJXTCgGlJrnPOUdbNRCX+eB3YWyTe
 uXz2bsKawyZ7l2XK6L89vvWBM1+4PMnYAtlcHyIRlNiCzQmiRSaVksn7NMEJZOEnr4Ok
 sxHUkY+blNurG09IB3U+bu0xXo+9ja4rmQXTaunXyug0Aj0PcEkdz8bZTJ6M4h3WCtxo
 VGB1P8ebKqNgs/VFuw2rJaqZhiT1z9FZj9eRUR+pjQwLHMT0m9jRiXCOapW/WpJHcFFF
 Xalw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DfOg2jlpQ5iUXnWEzQWk74iahYnkjJzUz6MRobResk4=;
 b=H4AIZk3dPQufXVteqEwkKGpVPOLW6Cr2vGm1pjZOVGV4zED8gkyXiD2A/SbXyVQuqo
 CWL1nC/hfwMaRNkxTtKx6gP6nB0V48wVf/Lxbk5ZOWNxTCG0nuc9S7ALi06B8syM+h7X
 e5TI9pBmi9ezUSnHuxCDygJocTUF0cAzHgCvadWwcquS6T+rjJ77U3W7zVpFl6SLQS+V
 RRDsDK6pyBu1qwrA87Ml05NYyaKy50RQb29lwk5CeKep10gf7i3QKzy5LeIhqT0NQmQZ
 rFgyTKKhfOazKwRr5ZcE8J9UUua4s7sbY+C6tMnUjDWnEo+YHzyTlndPKow+HP+9Isq/
 OxXg==
X-Gm-Message-State: AOAM5322lytK3wjEAvl0FzzaBJlerGwSW9YlWLjGMxvxp0WIjTr1ahzv
 QTER3Q6bFzIF41WysRayYbxpLKgDtp41VwBK85CLAg==
X-Google-Smtp-Source: ABdhPJyiihms4DAzI3KGQZcCmhL7UAemccnDAjjVyYxHCR4pcm6vZ3FMlfbw+svhUUobA7tIJDSTEnYT1bHaMc1tHJY=
X-Received: by 2002:a25:6f85:0:b0:64a:8b67:d3b2 with SMTP id
 k127-20020a256f85000000b0064a8b67d3b2mr5320345ybc.85.1652455667412; Fri, 13
 May 2022 08:27:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220504142522.167506-1-kwolf@redhat.com>
 <20220504142522.167506-12-kwolf@redhat.com>
In-Reply-To: <20220504142522.167506-12-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 May 2022 16:27:36 +0100
Message-ID: <CAFEAcA-bsFEpw-eqKo2pGcXxGRxpiE1_wG6u64mxxCAN-ay5=w@mail.gmail.com>
Subject: Re: [PULL 11/13] coroutine-ucontext: use QEMU_DEFINE_STATIC_CO_TLS()
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, 
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, 4 May 2022 at 15:34, Kevin Wolf <kwolf@redhat.com> wrote:
>
> From: Stefan Hajnoczi <stefanha@redhat.com>
>
> Thread-Local Storage variables cannot be used directly from coroutine
> code because the compiler may optimize TLS variable accesses across
> qemu_coroutine_yield() calls. When the coroutine is re-entered from
> another thread the TLS variables from the old thread must no longer be
> used.
>
> Use QEMU_DEFINE_STATIC_CO_TLS() for the current and leader variables.
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Message-Id: <20220307153853.602859-2-stefanha@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  util/coroutine-ucontext.c | 38 ++++++++++++++++++++++++--------------
>  1 file changed, 24 insertions(+), 14 deletions(-)
>
> diff --git a/util/coroutine-ucontext.c b/util/coroutine-ucontext.c
> index ed368e1a3e..ddc98fb4f8 100644
> --- a/util/coroutine-ucontext.c
> +++ b/util/coroutine-ucontext.c
> @@ -25,6 +25,7 @@
>  #include "qemu/osdep.h"
>  #include <ucontext.h>
>  #include "qemu/coroutine_int.h"
> +#include "qemu/coroutine-tls.h"
>
>  #ifdef CONFIG_VALGRIND_H
>  #include <valgrind/valgrind.h>
> @@ -66,8 +67,8 @@ typedef struct {
>  /**
>   * Per-thread coroutine bookkeeping
>   */
> -static __thread CoroutineUContext leader;
> -static __thread Coroutine *current;
> +QEMU_DEFINE_STATIC_CO_TLS(Coroutine *, current);
> +QEMU_DEFINE_STATIC_CO_TLS(CoroutineUContext, leader);

Hi; Coverity complains about this change (CID 1488745):

# Big parameter passed by value (PASS_BY_VALUE)
# pass_by_value: Passing parameter v of type CoroutineUContext
# (size 304 bytes) by value, which exceeds the medium threshold
# of 256 bytes.

thanks
-- PMM

