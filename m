Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 897FE4AD98B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 14:21:24 +0100 (CET)
Received: from localhost ([::1]:41284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHQQt-0004nF-FA
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 08:21:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOjf-00017C-DW
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:32:40 -0500
Received: from [2a00:1450:4864:20::436] (port=45864
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOjc-00017m-JW
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:32:38 -0500
Received: by mail-wr1-x436.google.com with SMTP id m14so30081950wrg.12
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cg/VNhU72ECPMQPIzA17ca95eqK2z9+Qrah514wURKo=;
 b=cW3hnWvPZNkTKhsKh+fUKWf5CuyTesPHyLLdbOJDQIUBvRELQTHX9jL7a1RtjFpJTK
 9kzFTO5F5P7zGKMzX+WAiFfu8sYHYSIhvzoINRSBqoFb/6HyqTaqfa5Ao0YdBR0Gfcid
 1y36ubzqphyTmiChhbSUGV3WA6zvNCpCc2nakoaZ5WStA4+nawcgF7y+pbFPmdo8sZZL
 NRShUQPpiG0yq3/hq45rniR0pZBBpD7NVfD5fJxPpn+oGHro7mvWxraorb+B3QO3H75H
 XRBwcjpTfr3aCDaSkkGHEtVp/tgRZUIV7TysR1Y0eleThhVRUrEN7XEphiUzf14/Ves+
 eYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cg/VNhU72ECPMQPIzA17ca95eqK2z9+Qrah514wURKo=;
 b=kObdx1B+9wr8lIC/eLuivZyu0OV6tZPqJ1H7ve8h4MVwkc3CckQkbygZ6z6uNWo2fp
 ESWQP7EWWD03ZeS8sM/8Z7gAClmLW4lrlx5fVSUxc1FVS8ReK9+uS7pw0tfPSV21Pgwl
 skcyd3JIy+5h16ULvuDmnIND8ecBKTk4N1e7veOX5Tf1J03NbTgF9H0YNHmEs3j2A1Rw
 nGdWo7ZAEBpqqow2yHGwGMdv3ObzSm+bN1tY4LWjljyj4b3S6GzBn5J9IxAByFBbCwlg
 09Q/QjK6EF/LqKjg7iNMVzxwBa/2tahfSzs7qqumfenIIUaCetQfkgBnEVZ0+hN4p9ON
 lWBw==
X-Gm-Message-State: AOAM531E8vkplioIJ8Gbs5grIuse2zOhhVfCyiD6X/VqWYKyXZLPQ6nG
 n6o9vSisqwhGP4zeWMA4b1E+uUay6W0pPvD1eZI9Mg==
X-Google-Smtp-Source: ABdhPJzIutxam7NxX+o3PkH6YsZMAp2fEXEHGne+2uBKrOK7lbeNjd4QYeHPc1UnGVfgghNbp1J936oAM8RziFN/4zM=
X-Received: by 2002:a05:6000:15c7:: with SMTP id
 y7mr3227654wry.319.1644319953123; 
 Tue, 08 Feb 2022 03:32:33 -0800 (PST)
MIME-Version: 1.0
References: <20220208071237.319844-1-richard.henderson@linaro.org>
 <20220208071237.319844-3-richard.henderson@linaro.org>
 <CAFEAcA-Sy8wvO2h1tjNwPcK6j2Tfz-gGY2YTCeQZQEB_1jd=qg@mail.gmail.com>
 <16d22c7c-a81c-9a65-3d46-12ff19d89229@linaro.org>
In-Reply-To: <16d22c7c-a81c-9a65-3d46-12ff19d89229@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Feb 2022 11:32:22 +0000
Message-ID: <CAFEAcA_Ax6=9fhfCAWE11mX6BR9KbXnxBcJiUACAavM5xWwqLQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] linux-user: Introduce host_signal_mask
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Feb 2022 at 11:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/8/22 21:59, Peter Maydell wrote:
> > On Tue, 8 Feb 2022 at 08:03, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> Do not directly access the uc_sigmask member.
> >> This is preparation for a sparc64 fix.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>   linux-user/include/host/aarch64/host-signal.h  |  5 +++++
> >>   linux-user/include/host/alpha/host-signal.h    |  5 +++++
> >>   linux-user/include/host/arm/host-signal.h      |  5 +++++
> >>   linux-user/include/host/i386/host-signal.h     |  5 +++++
> >>   .../include/host/loongarch64/host-signal.h     |  5 +++++
> >>   linux-user/include/host/mips/host-signal.h     |  5 +++++
> >>   linux-user/include/host/ppc/host-signal.h      |  5 +++++
> >>   linux-user/include/host/riscv/host-signal.h    |  5 +++++
> >>   linux-user/include/host/s390/host-signal.h     |  5 +++++
> >>   linux-user/include/host/sparc/host-signal.h    |  5 +++++
> >>   linux-user/include/host/x86_64/host-signal.h   |  5 +++++
> >>   linux-user/signal.c                            | 18 ++++++++----------
> >>   12 files changed, 63 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/linux-user/include/host/aarch64/host-signal.h b/linux-user/include/host/aarch64/host-signal.h
> >> index 9770b36dc1..76ab078069 100644
> >> --- a/linux-user/include/host/aarch64/host-signal.h
> >> +++ b/linux-user/include/host/aarch64/host-signal.h
> >> @@ -40,6 +40,11 @@ static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
> >>       uc->uc_mcontext.pc = pc;
> >>   }
> >>
> >> +static inline void *host_signal_mask(ucontext_t *uc)
> >> +{
> >> +    return &uc->uc_sigmask;
> >> +}
> >
> > Why void* rather than sigset_t* ?
>
> Because it's not really a sigset_t, even when it is in ucontext_t.
> It's a kernel_sigset_t, as per the comment in host_signal_handler.

I guess. handle_sigsegv_accerr_write()'s prototype just calls
it a sigset_t, though.

One approach would be to define a typedef for this kernel sigset_t,
and have wrappers for sigdelset() and sigprocmask() which take that
type rather than the libc sigset_t (plus a sigfillset that wrapped
the memset). Then we would avoid the potential bug that the
WARNING comment is talking about, because code wouldn't have
a thing that it could pass to sigfillset() without getting a
compiler complaint about the type. But maybe that's too heavyweight.

For the purposes of this series,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

