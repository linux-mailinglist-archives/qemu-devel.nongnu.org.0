Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B824ECEE1
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:32:32 +0200 (CEST)
Received: from localhost ([::1]:49096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZfvb-0001TO-AH
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:32:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZfuS-0000f3-5B
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:31:20 -0400
Received: from [2607:f8b0:4864:20::b2f] (port=42815
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZfuQ-00043z-DS
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:31:19 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id u103so38988955ybi.9
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zzuJdtbaXp4bFC3paHZ0d5+MXZ+EwlzUY3RvZayZokg=;
 b=TbfsSM6Ts24NgZGiGNJQqFcT04w04fjOB/M67UUY4enfoNWunhkhTOKU9LxVmKzpYz
 JDrB6ELIEAjGfNmSZt3/wNldpfFc/32P95MlYavQT5UdN0L2tAnY0XTcnhPFl77w6knr
 8J2gCsF+j6eOGGYwhnwSL1nYiLDtryM2CmUukxGFTZmp24ybHdlx8/1+0mxGvZFcHjmg
 XT+rMfISwyraxfIKDVQtoIOFlcVlEssyJldx2vajWK9DBJ9aICs7unOh6f/tBWsuZ2rH
 LG2/6DCUZt2/aKonuvQrKg7GEH3xC8/Ir6+46zmU6SSoHcTaVCQkudraIBW+1kmf7qyX
 YN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zzuJdtbaXp4bFC3paHZ0d5+MXZ+EwlzUY3RvZayZokg=;
 b=1v1OLpi+cAXjPFhf6peTY+7y0xpv6/eDhhY9WSMxBltWD4596QScxJ0vmWbpcrt4LJ
 A6pZIL/4fudiClwXJGG+PvsfSIMg3DrMr4W/WSQ96v6YlDaBqArbVOcQY9aLV4VX9HYA
 x60xKVQllWXHKNf0iP1Xk0zA56OlacWBYLaeFIWfZdYzXCK5cHlBioYbrbXIUdoMqLo/
 iP83GnxGn+/fG+ltjk2sEh5fuOMntIs+UvUY3YyVga2QhHp1u6EXOhOkO+x34PYH+L/B
 RDR71cKsLtkem+RrDGSqrPS6+I48GIXGeW4lUoKH13lFMeJ2TDDk9mpPSum0MsdlbMt0
 WCCA==
X-Gm-Message-State: AOAM533gOj8YPn19muuO9fmWPeQ5DbvTBXtKfDtmOCzA38CWDbYh/kza
 tHz0lXXKPsAGx1+qIeo7uTNJExVYw6K91xSSrA45og==
X-Google-Smtp-Source: ABdhPJzZ9NJ1vd7SpSK8crMWjfjgtH1m1VsHIkC1am2NxnJKNN1ZhDIfMhsfLRbantdhwj+7czTNM7VB83BDkwMLqAw=
X-Received: by 2002:a25:d8c3:0:b0:633:c81f:737d with SMTP id
 p186-20020a25d8c3000000b00633c81f737dmr1630287ybg.193.1648675877358; Wed, 30
 Mar 2022 14:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220330181947.68497-1-wwcohen@gmail.com>
In-Reply-To: <20220330181947.68497-1-wwcohen@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 Mar 2022 22:31:06 +0100
Message-ID: <CAFEAcA-a8BUqGGGMPexauFq-DEwSy6SQc9G9MuH=WX3P2H1a1A@mail.gmail.com>
Subject: Re: [PATCH] 9p: move limits.h include from 9p.c to 9p.h
To: Will Cohen <wwcohen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, fabianfranz.oss@gmail.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, keno@juliacomputing.com, reactorcontrol@icloud.com,
 philippe.mathieu.daude@gmail.com, hi@alyssa.is
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Mar 2022 at 19:26, Will Cohen <wwcohen@gmail.com> wrote:
>
> As noted by https://gitlab.com/qemu-project/qemu/-/issues/950, within
> the patch set adding 9p functionality to darwin, the commit
> 38d7fd68b0c8775b5253ab84367419621aa032e6 introduced an issue where
> limits.h, which defines XATTR_SIZE_MAX, is included in 9p.c, though the
> referenced constant is needed in 9p.h. This commit fixes that issue by
> moving the include to 9p.h.
>
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> ---
>  hw/9pfs/9p.c | 5 -----
>  hw/9pfs/9p.h | 5 +++++
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index dcaa602d4c..59c531ed47 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -33,11 +33,6 @@
>  #include "migration/blocker.h"
>  #include "qemu/xxhash.h"
>  #include <math.h>
> -#ifdef CONFIG_LINUX
> -#include <linux/limits.h>
> -#else
> -#include <limits.h>
> -#endif
>
>  int open_fd_hw;
>  int total_open_fd;
> diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
> index af2635fae9..0ce4da375c 100644
> --- a/hw/9pfs/9p.h
> +++ b/hw/9pfs/9p.h
> @@ -9,6 +9,11 @@
>  #include "qemu/thread.h"
>  #include "qemu/coroutine.h"
>  #include "qemu/qht.h"
> +#ifdef CONFIG_LINUX
> +#include <linux/limits.h>
> +#else
> +#include <limits.h>
> +#endif

Is it possible to do this with a meson.build check for whatever
host property we're relying on here rather than with a
"which OS is this?" ifdef ?

thanks
-- PMM

