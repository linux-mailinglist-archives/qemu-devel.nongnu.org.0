Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D99A380808
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 13:04:36 +0200 (CEST)
Received: from localhost ([::1]:40808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhVcR-00017G-DM
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 07:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhVbg-0000RS-Du
 for qemu-devel@nongnu.org; Fri, 14 May 2021 07:03:48 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:34310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhVbc-0001Xo-2b
 for qemu-devel@nongnu.org; Fri, 14 May 2021 07:03:48 -0400
Received: by mail-ej1-x62e.google.com with SMTP id j14so2764163ejy.1
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 04:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RmVGvOvvqhbamo6nkvjMd1PrfimZxlIyTo1LDHA9qTc=;
 b=uu303W7/r4xUing5BKN4ioZ/M8TMxlJ4xKhLIqs79iwTjahZN9P9KNrf2SiPT/JmlP
 NHPSx4Fm8PS+ZmF1Qdh9a9ikLCcnHYmIK8BjYBvpgJpWYZC7ieH2G0JDqZh74nuIOqhX
 nwfSkh5ypSdyYUbt0Y0RjpiRFNQzUoutqe/91E4NIuyIAwhxj7Zc1g0X1TI9fXmBTC93
 dBFGeQSFqhtXakMh7wkXLMEQgCP7AoloJBs/z7rffie+eT9YU0/cRHGW5psZpwYKT//y
 +Pmq6rQ+s+TRvMYfryU736jJAslcaK0ztrzLWGyX3mODCCz05HIL7eP72WfDZ8zCjdio
 ypRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RmVGvOvvqhbamo6nkvjMd1PrfimZxlIyTo1LDHA9qTc=;
 b=pauLY02vv4CzK8KM4QPjw+yFX1LhfyPsgJf7OVdr7SSgtheKCYXHGbrsaUpNbi8dal
 k2JkBjzAhf3FU8tDJ1lq/tkjexWhsfg1DRmBf10wD9zFywSHLtLvT0S/uUGWuxsya2aZ
 HaQNNdNJuOIMTiFuPI6eLpGiLhJq16Yv3qzb0qRZdTEBipfHa3k463gpZxgerq1E0Phe
 1Lw0v7fHre2EY1d2sg02zg+MQ77xFygtKnjYbRZ5oDa6woNs3K//+gBqN3HRUb4xK9Uk
 CqsV7uREdvVjbTt8L0tKPR1FUM4e//afZQ5qwemb+nbaWliiF+x61HQDHiBPhw7GZb6X
 uvqg==
X-Gm-Message-State: AOAM533hbudgDgdIAdRkQpZ8HI83bjir9XsrKqd4GVtCV5FhGTz1d0pH
 bgJPWhpy52XEEF7DCSDi/gsRK/vq1B/N6XeTji1cfw==
X-Google-Smtp-Source: ABdhPJywfZc3ssyjao+J5GpDlp5qmrTv8GIMIr0V5q26PV72eBVbxmggv3uXIeW9zIQ8leHj2mrPTFDLAeWLyOKX42U=
X-Received: by 2002:a17:906:d8cb:: with SMTP id
 re11mr3796242ejb.482.1620990219650; 
 Fri, 14 May 2021 04:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210513122008.207491-1-richard.henderson@linaro.org>
In-Reply-To: <20210513122008.207491-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 May 2021 12:03:27 +0100
Message-ID: <CAFEAcA-gMPaP5rT_CGqEFWJ6LP7S6Z9oA0OiFYrTWomRh+V36w@mail.gmail.com>
Subject: Re: [PULL 0/4] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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

On Thu, 13 May 2021 at 13:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 3e9f48bcdabe57f8f90cf19f01bbbf3c86937267:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20210511' into staging (2021-05-12 17:31:52 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210513
>
> for you to fetch changes up to 9bcf4c52f801966b10f802e65c3ecc8bbbd8c660:
>
>   tcg: Add tcg_constant_tl (2021-05-13 05:42:44 -0500)
>
> ----------------------------------------------------------------
> Minor gen-icount.h fix.
> BSD cpu_signal_handler fix.
> Add missing tcg_constant_tl symbol.
>

Fails to build on FreeBSD and OpenBSD:


../src/accel/tcg/user-exec.c:358:46: error: use of undeclared
identifier 'T_PAGEFLT'
                             TRAP_sig(uc) == PAGE_FAULT_TRAP ?
                                             ^
../src/accel/tcg/user-exec.c:334:31: note: expanded from macro 'PAGE_FAULT_TRAP'
#define PAGE_FAULT_TRAP       T_PAGEFLT
                              ^

thanks
-- PMM

