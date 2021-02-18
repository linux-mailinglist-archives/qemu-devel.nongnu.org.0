Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A2E31EAC0
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 15:12:11 +0100 (CET)
Received: from localhost ([::1]:48882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCk2M-0001UO-4l
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 09:12:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lCjxw-0005xj-6V
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 09:07:42 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:46069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lCjxt-0004as-IS
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 09:07:35 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id l8so2220562ybe.12
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 06:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OCS3VXJIbmhXsSszcRhYPRNN7L0sgwQClqP4G39oCv8=;
 b=HKl3HQjU2DYBBit6vTFGs6AQKJ+z9YyYu415nVkadQdQN/4lDKqu88pZCy9lOd4BTN
 R4d6/4KFZfV7t/1VBRNSCfif7kIJ697aw14YZ4fKSWwKkgZpGrNVtHMazNTyW+NxQ8g7
 zasI56ggLI3rqYzLKHYYUINnXIacUapiLSNyXR3J7ILZvVy6o2MSGD4E7JuBclrzpbFb
 JRMIavmz6o478o9YKNCGdjXcZcSJCjLlouosqek+Pgpx4xsiuBCypzk8Lqq2KOyA+zQm
 3Fsi4frXLPVTo3hi/kgrxzu98CTVqxJkR4vjlh+9rmXjmA4FnvdF6RPQFLun1plvKjQ1
 91HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OCS3VXJIbmhXsSszcRhYPRNN7L0sgwQClqP4G39oCv8=;
 b=S/emTJKQyP/O5zmV1TsMXNn0/g1n1/bxrISESYIH4teLxtZMfwI4kl7uReCheqztP4
 i6XvyPKqXfveKzFXZlBRro/h1cG/TP/go8TC0i2+dp+PNGljEnNY/4O1BrLZNF05FbcP
 dGyWQk/zPItA9MOY0zY/+6Z6dOyWfHaIZHDYvqk4380qyK6irZfq0ZveXe7JnbZCbKhh
 NBltXX3vtxLDFv+zYrzqVQXyUWsv5Mj0Sag2dqfoYjdfiBVtrzjcszc8odVx4zyxcTnz
 5Nq7gJrSBfLPPUdPyFgVfo9fyzW2nYBeBW7CLN2MVCtkWiz7E3TmufRf6Ro7/dQd/oeT
 7jPA==
X-Gm-Message-State: AOAM531zFmu+G5N3km2OsYW0aJHEZiBVk+d1umqJglcvhvS7P+dCTVrq
 9oWkX3sReBmz3lclDsGIORJg/nTxeXoRa3xRvSc=
X-Google-Smtp-Source: ABdhPJwOBmWhU6ksj0LeFOta3mTVv3AzOOGuOe4MQQhd7nO+R0EkMxbFSZKQJxrL0AWtTkSV/FHvdDuseCOw7kRX/58=
X-Received: by 2002:a25:8712:: with SMTP id a18mr6779053ybl.306.1613657251856; 
 Thu, 18 Feb 2021 06:07:31 -0800 (PST)
MIME-Version: 1.0
References: <20210218015934.1623959-1-alistair.francis@wdc.com>
 <CAFEAcA_aEtpfMScS3uzrpbBqAgqGWsWjeisUXCSpqdJJ7=uCYw@mail.gmail.com>
In-Reply-To: <CAFEAcA_aEtpfMScS3uzrpbBqAgqGWsWjeisUXCSpqdJJ7=uCYw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 18 Feb 2021 22:07:20 +0800
Message-ID: <CAEUhbmXeYDkKiNnkffRoE8dZc_=-vByoQfr6gdSSUNubkCaB8Q@mail.gmail.com>
Subject: Re: [PULL 00/19] riscv-to-apply queue
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Alistair Francis <alistair23@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 18, 2021 at 9:26 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 18 Feb 2021 at 01:59, Alistair Francis <alistair.francis@wdc.com> wrote:
> >
> > The following changes since commit 1af5629673bb5c1592d993f9fb6119a62845f576:
> >
> >   Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-20210216' into staging (2021-02-17 14:44:18 +0000)
> >
> > are available in the Git repository at:
> >
> >   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210217-1
> >
> > for you to fetch changes up to d0867d2dad4125d2295b28d6f91fa49cf034ffd2:
> >
> >   hw/riscv: virt: Map high mmio for PCIe (2021-02-17 17:47:19 -0800)
> >
> > ----------------------------------------------------------------
> > RISC-V PR for 6.0
> >
> > This PR is a collection of RISC-V patches:
> >  - Improvements to SiFive U OTP
> >  - Upgrade OpenSBI to v0.9
> >  - Support the QMP dump-guest-memory
> >  - Add support for the SiFive SPI controller (sifive_u)
> >  - Initial RISC-V system documentation
> >  - A fix for the Goldfish RTC
> >  - MAINTAINERS updates
> >  - Support for high PCIe memory in the virt machine
>
> Fails to compile, 32 bit hosts:
>
> ../../hw/riscv/virt.c: In function 'virt_machine_init':
> ../../hw/riscv/virt.c:621:43: error: comparison is always false due to
> limited range of data type [-Werror=type-limits]
>          if ((uint64_t)(machine->ram_size) > 10 * GiB) {
>                                            ^
> ../../hw/riscv/virt.c:623:33: error: large integer implicitly
> truncated to unsigned type [-Werror=overflow]
>              machine->ram_size = 10 * GiB;
>                                  ^~

This kind of error is tricky. I wonder whether we should deprecate
32-bit host support though.

Regards,
Bin

