Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E66704B83C5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 10:14:31 +0100 (CET)
Received: from localhost ([::1]:32990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKGOM-0003j0-PO
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 04:14:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nKE4r-0001i7-8O
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:46:13 -0500
Received: from [2a00:1450:4864:20::42e] (port=37484
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nKE4n-0001jv-5g
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:46:12 -0500
Received: by mail-wr1-x42e.google.com with SMTP id w11so1778659wra.4
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PK0DPwTnZJWnTMrBxp9jjSD+w+wBQBR5N79KrwCU7UQ=;
 b=Iy7G9SX6ZSJ47O+bWcRPR+hxId5CphQtsDfxaZ15s8MVaod5aaLZnURzsXg+kpC7FZ
 /UkhkAaH+eizefNFVNtyA9jOAm7vsxn1TfQPBgG7/1aUoQfier+2mOhE9jmGHGEkm/op
 vUJoEWObTcyLCdJyMU1KW85LTDW2AFwL5KEdcYYBKTVxVP64AfE7Ul+lX3mbAZK7I7DX
 SIQgQUD4Erg1qqcqGM+8cKK8EHswAHrvKYD1OX4hGrmTP/tV/g/yKhOq6CwUnHctq+Lr
 Sf0feB9ThOOQLL0fAG2N+XNYwHnPELOtuKMul08JY7NDtsASb3zaishQpTX/SXLel3h0
 NUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PK0DPwTnZJWnTMrBxp9jjSD+w+wBQBR5N79KrwCU7UQ=;
 b=z8D6YcO3qOe9VX4/M3p/IBG9Z8DC5GHQsauftvhR0VOBr3Za5+6QZr0G4WBc4okbhO
 nNH3FAr7xzZkSC4/EdOTRkRhLNv3c2wrzzg7i9dFjUPBVIvOGc0zLrf99vyLlDt6+aGs
 AsMtq4edFSTNH4rPxDT680nCDA6bxDF68BKyPi7HC6U4hGynC0oL/goHS+rWKYM1Q8Ye
 jdrkngCQOaZg0s73XSFDSz8UVCZ0yxkdg0z3F2sONhvJcRPPe3FPwsNIEL0OS0kgOt5p
 hshr4FM6p6CbKtaM+c6O1BBqmpYRx1P7ioTZOth+hLw0F3Qc2ghjMCf2NdtRTj6OqqFy
 UX7A==
X-Gm-Message-State: AOAM533oaxgtc6wChx6KfR/JDVUJUgBjwMqNQpxH1UADntRTiS1FBLCr
 xauo1t30VeM4oct/+L/LQr1kezHB39IXOU5GrGUBRg==
X-Google-Smtp-Source: ABdhPJxul0DYXKDYjq/7PsViAGEwfEq09GcpujA3PnTsZ//pYox5Dl9QroCOKjL3cAaDGLBytVT8AjeBfn0cuBqaNpQ=
X-Received: by 2002:a5d:6a02:0:b0:1e3:392b:7447 with SMTP id
 m2-20020a5d6a02000000b001e3392b7447mr1175558wru.214.1644993967266; Tue, 15
 Feb 2022 22:46:07 -0800 (PST)
MIME-Version: 1.0
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
 <CAFEAcA96Jir1xbWSjhtXJhJkKQ3oR2ck=OFM06OWsyZJep0ecg@mail.gmail.com>
 <CAKmqyKOr6bHz6PaaR+SopbhMrhEBzYc-naeCmfSjVtot9LO2mg@mail.gmail.com>
In-Reply-To: <CAKmqyKOr6bHz6PaaR+SopbhMrhEBzYc-naeCmfSjVtot9LO2mg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 16 Feb 2022 12:15:53 +0530
Message-ID: <CAAhSdy3VZhn8TJ0DU7SVh85LSftuKBY=vR4A1zgimPmh5FAybQ@mail.gmail.com>
Subject: Re: [PULL 00/40] riscv-to-apply queue
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::42e;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair.francis@opensource.wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 16, 2022 at 11:59 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Feb 15, 2022 at 9:39 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Sat, 12 Feb 2022 at 00:07, Alistair Francis
> > <alistair.francis@opensource.wdc.com> wrote:
> > >
> > > From: Alistair Francis <alistair.francis@wdc.com>
> > >
> > > The following changes since commit 0a301624c2f4ced3331ffd5bce85b4274fe132af:
> > >
> > >   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220208' into staging (2022-02-08 11:40:08 +0000)
> > >
> > > are available in the Git repository at:
> > >
> > >   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20220212
> > >
> > > for you to fetch changes up to 31d69b66ed89fa0f66d4e5a15e9664c92c3ed8f8:
> > >
> > >   docs/system: riscv: Update description of CPU (2022-02-11 18:31:29 +1000)
> > >
> > > ----------------------------------------------------------------
> > > Fourth RISC-V PR for QEMU 7.0
> > >
> > >  * Remove old Ibex PLIC header file
> > >  * Allow writing 8 bytes with generic loader
> > >  * Fixes for RV128
> > >  * Refactor RISC-V CPU configs
> > >  * Initial support for XVentanaCondOps custom extension
> > >  * Fix for vill field in vtype
> > >  * Fix trap cause for RV32 HS-mode CSR access from RV64 HS-mode
> > >  * RISC-V AIA support for virt machine
> > >  * Support for svnapot, svinval and svpbmt extensions
> >
> > Hi; this has format string issues on 32-bit hosts:
> > https://gitlab.com/qemu-project/qemu/-/jobs/2092600735
> >
> > ../hw/riscv/virt.c: In function 'create_fdt_imsic':
> > ../hw/riscv/virt.c:519:49: error: format '%lx' expects argument of
> > type 'long unsigned int', but argument 2 has type 'hwaddr' {aka 'long
> > long unsigned int'} [-Werror=format=]
> >
> > ../hw/riscv/virt.c:569:49: error: format '%lx' expects argument of
> > type 'long unsigned int', but argument 2 has type 'hwaddr' {aka 'long
> > long unsigned int'} [-Werror=format=]
> >
> > Printing hwaddrs needs the HWADDR_PRIx macro. (%l and %ll are
> > usually the wrong thing in QEMU code as we don't often deal
> > with real 'long' or 'long long' types.)
>
> Argh... Sorry about that Peter.
>
> I have already fixed a few issues with that series and I would like
> this PR merged soon, so I have just dropped the offending patches.
>
> @Anup Patel You will need to rebase the last 5 or so AIA patches, fix
> the failures and re-send them once the v2 PR is merged.

Okay, I will re-send.

Thanks,
Anup

>
> Alistair
>
> >
> > -- PMM

