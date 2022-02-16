Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5544B80D3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 07:54:16 +0100 (CET)
Received: from localhost ([::1]:49984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKECd-00022k-Qg
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 01:54:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nKDoU-0004Af-CX
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:20 -0500
Received: from [2607:f8b0:4864:20::d35] (port=42563
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nKDoS-0006Fv-8t
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:17 -0500
Received: by mail-io1-xd35.google.com with SMTP id s1so1038980iob.9
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MvdejXplEQ5UnzKYWFwwJXdyYtCCS8Tds6ytlf327YA=;
 b=PSHVSFpqu+IqnTC9iYRvwXzHUzz63cIlRJRYop/THWgnPaZBTbLFlLqrikuDSeNG6k
 va1jvOqHlAlDu+oyTOP891HxpEHe5LjufQYnDhXq9rhuDf5fvv31lr3v7lAzNvDtqiHE
 QFyg5c6YMo9PST4Ofi6TyZbRZTRDot8G4ZY5f4Vp1rn9yi/ShmeK4knJPF5c4r+rKHH5
 NZjCwnSQU9ZRAwnKMXTG3ARF/TiyHaeh7POOr8JifEfu7hwpaDZ596qg+wc4KeWHtTfK
 tthUihkotqS4w5G6MgCirqspsGF9Kycah2I3Nk8HK28xn/tiByz0KDW/rmoTk9XQvnXs
 sNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MvdejXplEQ5UnzKYWFwwJXdyYtCCS8Tds6ytlf327YA=;
 b=J0WaFYnAW/ScWVe+MtXj+Gy3CWMwH1qI1tnaXaeHF7WGYFbMUWU6IWiUfNcj06VW3I
 SpKKnxTuW5Vd8c5PNkwjkvoJOi38FfrE07FUoFUSKEQNxGPE/ZvB/KtIdSwAkd3+hHLO
 wDtnE6LNzieEXaUTrs/tbWo1JkoyW7dimnWlhHprPmK/fOJzOCsH5L+hF6XBxzoLyR/m
 xVoNRNFG4zUiTqYabC/BtsOB3DU2Xn2IT7+WdiZBNQ1xLyGptbZI+ucH26ka94WTtE0i
 rzelys9rXFQ3Op4xZp40FgpadQ3/spLvXSFhnYkEfeIkiJ0i2phY066Mo3JrNzsUGbb4
 PG3w==
X-Gm-Message-State: AOAM532k5ITOPAnUDxLzpyIgQLPyPxx5hvFv6oHk/hB/Aj2cHD3f1/L8
 ckHYcMYYxBDVrjNXpC760Fm5FvJxLCGOUx5bOrg=
X-Google-Smtp-Source: ABdhPJzpY9UxV1kuapZRepqQ+cRKfL/jmgShB5snvHJSpK3BY5V415BfaGP3ImGdKrEhciA4yUwXz1WkiQTMxCbz12c=
X-Received: by 2002:a05:6638:300f:b0:309:14a1:48f with SMTP id
 r15-20020a056638300f00b0030914a1048fmr791892jak.63.1644992955012; Tue, 15 Feb
 2022 22:29:15 -0800 (PST)
MIME-Version: 1.0
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
 <CAFEAcA96Jir1xbWSjhtXJhJkKQ3oR2ck=OFM06OWsyZJep0ecg@mail.gmail.com>
In-Reply-To: <CAFEAcA96Jir1xbWSjhtXJhJkKQ3oR2ck=OFM06OWsyZJep0ecg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 16 Feb 2022 16:28:49 +1000
Message-ID: <CAKmqyKOr6bHz6PaaR+SopbhMrhEBzYc-naeCmfSjVtot9LO2mg@mail.gmail.com>
Subject: Re: [PULL 00/40] riscv-to-apply queue
To: Peter Maydell <peter.maydell@linaro.org>, Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair.francis@opensource.wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 9:39 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 12 Feb 2022 at 00:07, Alistair Francis
> <alistair.francis@opensource.wdc.com> wrote:
> >
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > The following changes since commit 0a301624c2f4ced3331ffd5bce85b4274fe132af:
> >
> >   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220208' into staging (2022-02-08 11:40:08 +0000)
> >
> > are available in the Git repository at:
> >
> >   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220212
> >
> > for you to fetch changes up to 31d69b66ed89fa0f66d4e5a15e9664c92c3ed8f8:
> >
> >   docs/system: riscv: Update description of CPU (2022-02-11 18:31:29 +1000)
> >
> > ----------------------------------------------------------------
> > Fourth RISC-V PR for QEMU 7.0
> >
> >  * Remove old Ibex PLIC header file
> >  * Allow writing 8 bytes with generic loader
> >  * Fixes for RV128
> >  * Refactor RISC-V CPU configs
> >  * Initial support for XVentanaCondOps custom extension
> >  * Fix for vill field in vtype
> >  * Fix trap cause for RV32 HS-mode CSR access from RV64 HS-mode
> >  * RISC-V AIA support for virt machine
> >  * Support for svnapot, svinval and svpbmt extensions
>
> Hi; this has format string issues on 32-bit hosts:
> https://gitlab.com/qemu-project/qemu/-/jobs/2092600735
>
> ../hw/riscv/virt.c: In function 'create_fdt_imsic':
> ../hw/riscv/virt.c:519:49: error: format '%lx' expects argument of
> type 'long unsigned int', but argument 2 has type 'hwaddr' {aka 'long
> long unsigned int'} [-Werror=format=]
>
> ../hw/riscv/virt.c:569:49: error: format '%lx' expects argument of
> type 'long unsigned int', but argument 2 has type 'hwaddr' {aka 'long
> long unsigned int'} [-Werror=format=]
>
> Printing hwaddrs needs the HWADDR_PRIx macro. (%l and %ll are
> usually the wrong thing in QEMU code as we don't often deal
> with real 'long' or 'long long' types.)

Argh... Sorry about that Peter.

I have already fixed a few issues with that series and I would like
this PR merged soon, so I have just dropped the offending patches.

@Anup Patel You will need to rebase the last 5 or so AIA patches, fix
the failures and re-send them once the v2 PR is merged.

Alistair

>
> -- PMM

