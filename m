Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7EE6A412C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:51:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWc1l-00076G-Nt; Mon, 27 Feb 2023 06:50:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWc1h-00074W-65
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:50:43 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWc1f-0008JP-35
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:50:40 -0500
Received: by mail-pf1-x432.google.com with SMTP id fd25so3358490pfb.1
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 03:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JiALn/yRBWGfOPOHq2rV+olCzk0qQ+8o+P6rZMm0J7Y=;
 b=gTuIJlqAuQ85BlSUKHle+4KkL2NdafDXRAuWqP+RJQ1aZj9K1AT9O6No9ioTve6hCn
 d3KUZyiAufk3phDBDtk4r9I00r0MDklJqJ8fr1R/SFZWwbeEYaINVZMBzaurCh56SIM9
 OilfpM26WdbDMLap04EBOKuCRgD3bOxQ5AW3yR2JVy7Cm2t8D0QyoJ8qgRYG8bXQfPzu
 TERaMe9BBfmTG7rqFfCQhxojr0pYVVVrM1RD2xA0PyIxBiP5jzo0LoREGrXVcWwpI0P5
 ntKyX+oe09QeHRm0vmgNuKd2kp40bzY1IvMoesq4qbwt+Y3/7ymjBrPfy0YpkWmzvIb0
 tlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JiALn/yRBWGfOPOHq2rV+olCzk0qQ+8o+P6rZMm0J7Y=;
 b=DTKoZGUzOsBjHIIN7YrIaAltkVif5twXTS/o5a8lufkhm+VG/TwnjQ9G7RfrjrKrJk
 ZSP8xopZ+CHWzIs17Ig6BoDl+UDiqBNg2G25CBBWDg3yMKOrwP8fV3fXeGRoJon9+CeD
 2nFYVQlOPAwH2B2J0FjHyiUJnSsAMo8pzPIrAWJz5Yi23V8XKEsO6yUL4OOCOCbqNoTD
 Q3wE0paYoSFdABq2S3DeUu+NEM/QEVX8bL92g2g7xUXMrCcQsGr8rlQr3xwaY464T407
 4yfK5cqtSYFovOrpyr5JY7FNYtLLYOEfXSt57FbaeIv1JWNx8yM++20pjBIpoddIojYH
 sSqw==
X-Gm-Message-State: AO0yUKVEbE6UTPdvunJesef/j35ytrH7hMbyYnD3tiu3kupEnP6kQ2ea
 H/1B5j28efVfD7XvRXK/Wv8oH1bwsE6ahTvv3x8GEg==
X-Google-Smtp-Source: AK7set/Rz+HyXdH5F1AGD8oxxM3oMsiczEBpcwFO0g4wNpnZd9R9FbohWjVMZhCp+1tTI5Hih+R2NIrId4i9PdyDuew=
X-Received: by 2002:a63:b959:0:b0:4fc:7e60:d09 with SMTP id
 v25-20020a63b959000000b004fc7e600d09mr5781314pgo.9.1677498637143; Mon, 27 Feb
 2023 03:50:37 -0800 (PST)
MIME-Version: 1.0
References: <20230224185908.32706-1-palmer@rivosinc.com>
In-Reply-To: <20230224185908.32706-1-palmer@rivosinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Feb 2023 11:50:25 +0000
Message-ID: <CAFEAcA9k5Pz7skePKJWSxFk+DLqwgFjhjCAEDBEix8ma5E3WCQ@mail.gmail.com>
Subject: Re: [PULL] Fourth RISC-V PR for QEMU 8.0, Attempt 2
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 24 Feb 2023 at 19:01, Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> The following changes since commit 417296c8d8588f782018d01a317f88957e9786d6:
>
>   tests/qtest/netdev-socket: Raise connection timeout to 60 seconds (2023-02-09 11:23:53 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:palmer-dabbelt/qemu.git tags/pull-riscv-to-apply-20230224
>
> for you to fetch changes up to 8c89d50c10afdd98da82642ca5e9d7af4f1c18bd:
>
>   target/riscv: Fix vslide1up.vf and vslide1down.vf (2023-02-23 14:21:34 -0800)
>
> ----------------------------------------------------------------
> Fourth RISC-V PR for QEMU 8.0, Attempt 2
>
> * A triplet of cleanups to the kernel/initrd loader that avoids
>   duplication between the various boards.
> * Weiwei Li, Daniel Henrique Barboza, and Liu Zhiwei have been added as
>   reviewers.  Thanks for the help!
> * A fix for PMP matching to avoid incorrectly appling the default
>   permissions on PMP permission violations.
> * A cleanup to avoid an unnecessary avoid env_archcpu() in
>   cpu_get_tb_cpu_state().
> * Fixes for the vector slide instructions to avoid truncating 64-bit
>   values (such as doubles) on 32-bit targets.
>
> ----------------------------------------------------------------
> Alistair Francis (1):
>       MAINTAINERS: Add some RISC-V reviewers
>
> Daniel Henrique Barboza (4):
>       hw/riscv: handle 32 bit CPUs kernel_entry in riscv_load_kernel()
>       hw/riscv/boot.c: consolidate all kernel init in riscv_load_kernel()
>       hw/riscv/boot.c: make riscv_load_initrd() static
>       target/riscv: avoid env_archcpu() in cpu_get_tb_cpu_state()
>
> Frank Chang (1):
>       target/riscv: Remove privileged spec version restriction for RVV
>
> Himanshu Chauhan (1):
>       target/riscv: Smepmp: Skip applying default rules when address matches
>
> LIU Zhiwei (1):
>       target/riscv: Fix vslide1up.vf and vslide1down.vf
>
>  MAINTAINERS                  |  3 ++
>  hw/riscv/boot.c              | 97 ++++++++++++++++++++++++++++----------------
>  hw/riscv/microchip_pfsoc.c   | 12 +-----
>  hw/riscv/opentitan.c         |  4 +-
>  hw/riscv/sifive_e.c          |  4 +-
>  hw/riscv/sifive_u.c          | 12 +-----
>  hw/riscv/spike.c             | 14 ++-----
>  hw/riscv/virt.c              | 12 +-----
>  include/hw/riscv/boot.h      |  3 +-
>  target/riscv/cpu.c           |  2 +-
>  target/riscv/cpu_helper.c    |  2 +-
>  target/riscv/csr.c           | 21 ++++------
>  target/riscv/pmp.c           |  9 ++--
>  target/riscv/vector_helper.c |  4 +-
>  14 files changed, 98 insertions(+), 101 deletions(-)
> Subject: [PULL] Fourth RISC-V PR for QEMU 8.0, Attempt 2
>
> The following changes since commit 417296c8d8588f782018d01a317f88957e9786d6:
>
>   tests/qtest/netdev-socket: Raise connection timeout to 60 seconds (2023-02-09 11:23:53 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:palmer-dabbelt/qemu.git tags/pull-riscv-to-apply-20230224
>
> for you to fetch changes up to 8c89d50c10afdd98da82642ca5e9d7af4f1c18bd:
>
>   target/riscv: Fix vslide1up.vf and vslide1down.vf (2023-02-23 14:21:34 -0800)
>
> ----------------------------------------------------------------
> Fourth RISC-V PR for QEMU 8.0, Attempt 2
>
> * A triplet of cleanups to the kernel/initrd loader that avoids
>   duplication between the various boards.
> * Weiwei Li, Daniel Henrique Barboza, and Liu Zhiwei have been added as
>   reviewers.  Thanks for the help!
> * A fix for PMP matching to avoid incorrectly appling the default
>   permissions on PMP permission violations.
> * A cleanup to avoid an unnecessary avoid env_archcpu() in
>   cpu_get_tb_cpu_state().
> * Fixes for the vector slide instructions to avoid truncating 64-bit
>   values (such as doubles) on 32-bit targets.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

