Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C67E63A3C3C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 08:49:04 +0200 (CEST)
Received: from localhost ([::1]:40042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrayV-0001c6-Bj
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 02:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1lraxM-0000v3-2h
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 02:47:52 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1lraxK-0005gB-3P
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 02:47:51 -0400
Received: by mail-wr1-x435.google.com with SMTP id r9so4786755wrz.10
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 23:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3Bd2NZE1Sk7x2047U4M4zakom3EbzUuPXqQtNvmUczE=;
 b=NMdS4PtGQUZ6lrgeZYyec4PCs6QeJOPOikzvpo6dTrC/WTzgoodX+Y1M7UAHNJUcAI
 mXZsnuCfSjGHIoukVf1lC1pzPl/8ASFRtvFjbcBJ8NBMazKPMEfuG9JokWuTOwJulK4P
 dyy88DWX1aVqxrsKvFA3WeHpOMekkc4CrtY7bJFmY8+vRuhrf255Hb7WgMDbDCO24PJr
 94sDbNljKa035vRX1fMpOAAw/XzS2FpNvYTxipvJx+yvGeAWsdKJm+b82DLUEoBbEmpO
 R+VnaDQznvcZV8AnE/XrsFhiMr28OzDpq7lWeKMTGHqGFMnvGKkGJZa+rCJsixG8e1Du
 mweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Bd2NZE1Sk7x2047U4M4zakom3EbzUuPXqQtNvmUczE=;
 b=gL0cPWknPuowgqjsv04IAlGOAgMppj3eQmu81RdUxv49BBmomluVAJhIwEZq+4STro
 fTCAMSht6HpI39Cyh5RBnDnH+u3pl1htax06F8dqAejiGS3H1Zz6t+c39WG+5SF5zvca
 QlGpMyBB3mmbUpfguwQpOn5TkA3iYDDRQZZTLoUoCJ05cJ10EXUZs1bLYzHZGmCJoW7g
 ToxgdsU4NKhMDZLK9ayD0idruYGiRQKt4E62jGH9amg+PuMmx8jyJnnG3s/rbN9Wy2Km
 +qZGEOCpna2O9HOlief6sX4S25HdUonrH7eevAtpTPQd4M8CLbnhBqYyHDucTCSYCBaA
 nOfA==
X-Gm-Message-State: AOAM533OjTHCBvFIW0jGnV3KSSn5Y93BpdgDl/ZZVDTFP1FBc+O9HGAx
 6g2yHo1JpFLUw4yBt2IEOB0Tot4FTc7w2RQzLqqZjQ==
X-Google-Smtp-Source: ABdhPJwvppV3BASe58axCt8OFBWOSG5vZkyYnuLhZ+8Kq9pVIMwUaDZXJfmsRw+2VUNevP2b9Bmq8KgCZeA1ArbN3Oo=
X-Received: by 2002:a5d:540b:: with SMTP id g11mr2287072wrv.390.1623394068168; 
 Thu, 10 Jun 2021 23:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210514143242.377645-1-anup.patel@wdc.com>
In-Reply-To: <20210514143242.377645-1-anup.patel@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 11 Jun 2021 12:17:37 +0530
Message-ID: <CAAhSdy3KmvjR8hnMz2UXomA45FcEV9fmiCXRBFGMRQus5=c6Lg@mail.gmail.com>
Subject: Re: [PATCH 0/4] AIA local interrupt CSR support
To: Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::435;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alistair,

On Fri, May 14, 2021 at 8:03 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> The advanced interrupt architecture (AIA) extends the per-HART local
> interrupt support. Along with this, it also adds IMSIC (MSI contrllor)
> and Advanced PLIC (wired interrupt controller).
>
> The latest AIA draft specification can be found here:
> http://jhauser.us/private/RISCV-AIA/riscv-interrupts-021.pdf
>
> This series adds initial AIA support in QEMU which includes emulating all
> AIA local CSR. To enable AIA in QEMU, we just need to pass "x-aia=true"
> paramenter in "-cpu" QEMU command-line.
>
> To test series, we require OpenSBI and Linux with AIA support which
> can be found in riscv_aia_v1 branch at:
> https://github.com/avpatel/opensbi.git
> https://github.com/avpatel/linux.git
>
> Anup Patel (4):
>   target/riscv: Add defines for AIA local interrupt CSRs
>   target/riscv: Add CPU feature for AIA CSRs
>   target/riscv: Implement AIA local interrupt CSRs
>   hw/riscv: virt: Use AIA INTC compatible string when available

The ACLINT specification will be frozen soon (probably early next
month). The ACLINT QEMU support patches are also ready and don't
depend on the AIA QEMU support patches.

Is it okay to target ACLINT support in QEMU first ?

I can rebase this series on ACLINT support patches and also include
more AIA emulation patches (APLIC and IMSIC) in the AIA series.

Regards,
Anup

>
>  hw/riscv/virt.c           |   11 +-
>  target/riscv/cpu.c        |   32 +-
>  target/riscv/cpu.h        |   56 +-
>  target/riscv/cpu_bits.h   |  128 +++++
>  target/riscv/cpu_helper.c |  245 ++++++++-
>  target/riscv/csr.c        | 1059 +++++++++++++++++++++++++++++++++++--
>  target/riscv/machine.c    |   26 +-
>  7 files changed, 1454 insertions(+), 103 deletions(-)
>
> --
> 2.25.1
>

