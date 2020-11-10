Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AA02ACE77
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 05:15:36 +0100 (CET)
Received: from localhost ([::1]:46326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcL4B-00041A-7K
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 23:15:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kcL1C-0000U1-CG
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 23:12:30 -0500
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:43766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1kcL1A-0001di-GS
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 23:12:30 -0500
Received: by mail-io1-xd29.google.com with SMTP id m9so12309101iox.10
 for <qemu-devel@nongnu.org>; Mon, 09 Nov 2020 20:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xH5VqYAQavdIokg5eITIYxl5rblccIieJGUAMztIdEw=;
 b=V9QVVpCc8BolY1uIcDFAGy1AACLRKQQCiEl40L89anvq6gJDtjqp8qthQrgVYYMCHZ
 Zm5Jcqf88gx5VUWcGMigcDXYgl0r6nTVuKbcA8O0LqgsG56dKjpsSQNhi6lPSdNBgjOn
 c+61peZdK0C1CZlKlTBrwoiTO3N2N54/zkJWCE99xvnDNqXTRKr0LzvGSiAZcGOUEoNA
 t5SBVCo9du5qh3P2TJbd7vwIT7dbWm6hHv56DRTvNy92A+CDYwYS1+UPSlG2RuuQOM6V
 uKLTsY3qfyl5VsYEoUt6N+G34V1pQ0BZFk8UGniOFeJYeWEyP7NTR+b5knDVV9DSitDZ
 QPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xH5VqYAQavdIokg5eITIYxl5rblccIieJGUAMztIdEw=;
 b=IEU1lQtAMKxNF4TEGJYObPH1Inxv2A6dLoY84tjvK+EIiZQSJ6XTTgRifwzlJlrOIc
 0FNQxKbYu74lo/JHoP080uO453Rv7K4cfPTM6aTH74QJO4eqT67kyWCi3iyWe8NvZFMc
 zF7HK4gaSszg0HYU4PXiwZFq++DGY4GNR9WIO7sHCB4Rr60EjVh8UzdZkx69aVv+xkXv
 poX984luPkS6PZAZsQqnC5dKINqfELzfATp8hhwvjX6NJONOwOTKDqLVsKazlHk0noFN
 t37eF2z+w5Ve0WQp5qjOw/IEyfqa3/1PRP98cVV66jjGZk+61iN52FE0amAiX7tv7mOY
 2dBg==
X-Gm-Message-State: AOAM530zVbYmqOGDAgeY7kCIo3cLkf7nfzi/GG715o8+xp6VkhDcHJsm
 H6cmgzgGm5+7TpZGBeNhLbUGFt+GkScud/P2e9E=
X-Google-Smtp-Source: ABdhPJwurTloHCN+UvtRXhOR2AW3d3mswAA8NM3JNXgNGHM8eWxvqEfHgI8EyadvOuoi4znwZomWHyd5EmbeBPZhMbg=
X-Received: by 2002:a5d:9a8d:: with SMTP id c13mr12123996iom.176.1604981547347; 
 Mon, 09 Nov 2020 20:12:27 -0800 (PST)
MIME-Version: 1.0
References: <20201110035703.83786-1-alistair.francis@wdc.com>
In-Reply-To: <20201110035703.83786-1-alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 9 Nov 2020 20:00:26 -0800
Message-ID: <CAKmqyKP0=xMxY7BHLXsJs8+EjP5m98GZPXC9CppA2WZ9_EYNzg@mail.gmail.com>
Subject: Re: [PULL 0/6] riscv-to-apply queue
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 9, 2020 at 8:09 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> The following changes since commit 3c8c36c9087da957f580a9bb5ebf7814a753d1c6:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/ui-20201104-pull-request' into staging (2020-11-04 16:52:17 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20201109
>
> for you to fetch changes up to 96338fefc19a143abdc91f6c44f37683274b08d4:
>
>   hw/intc/ibex_plic: Clear the claim register when read (2020-11-09 15:09:53 -0800)
>
> ----------------------------------------------------------------
> This fixes two bugs in the RISC-V port. One is a bug in the
> Ibex PLIC, the other fixes the Hypvervisor access functions.
>
> ----------------------------------------------------------------
> Alistair Francis (6):
>       target/riscv: Add a virtualised MMU Mode
>       target/riscv: Set the virtualised MMU mode when doing hyp accesses
>       target/riscv: Remove the HS_TWO_STAGE flag
>       target/riscv: Remove the hyp load and store functions
>       target/riscv: Split the Hypervisor execute load helpers
>       hw/intc/ibex_plic: Clear the claim register when read

Just a note, the hypervisor related changes look like a big diff for
this late in the cycle. That is true, but the current implementation
(added in this release cycle) is broken and this fixes it. Also most
of the changes only affect the Hypervisor extensions, which are still
experiemental.

Alistair

>
>  target/riscv/cpu-param.h                |  11 ++-
>  target/riscv/cpu.h                      |  19 ++++-
>  target/riscv/cpu_bits.h                 |   1 -
>  target/riscv/helper.h                   |   5 +-
>  hw/intc/ibex_plic.c                     |   3 +
>  target/riscv/cpu_helper.c               |  62 ++++++--------
>  target/riscv/op_helper.c                | 124 ++-------------------------
>  target/riscv/translate.c                |   2 +
>  target/riscv/insn_trans/trans_rvh.c.inc | 143 ++++++++++++--------------------
>  9 files changed, 115 insertions(+), 255 deletions(-)

