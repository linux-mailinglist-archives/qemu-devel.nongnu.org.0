Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88601400BEF
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 17:38:08 +0200 (CEST)
Received: from localhost ([::1]:36618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMXk7-0005vW-3r
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 11:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mMXgG-0002fi-Qm
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 11:34:08 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:44873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mMXgE-0005dH-Er
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 11:34:08 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so1593668wml.3
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 08:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HVh+9RvnGn7NIBk54PLky8vsQeCLZfudzFHWpOrO1vE=;
 b=FS8PK/RvTbCsTHX8MiIBLaBf1ecwP8zBAXJEcIEwhlD321GMCRXdD7ACLeOinQwwSi
 +i29loS7ohImyNWpDmyUz9cJCYdE5LcU+ZBC8lgp2CvnhUfet4tL28QUttLx9o6e9+//
 ziD4CayGN46cE6b68PgiBlKWmdeRsWRX7LFD4fYEo+CHmQiEtIG1q8IlfRtGgGOyG+ex
 rLRaPAxPgi+M9fUs1xJxEoo4AcjHRk2Xqq529bGrOnSMCAASzesM2Feq35uuYkj6Oeth
 VCFTEfFFeqUl0hPUZDmaKrGY8Ddxvi8E7wxLNG9NS3rJj8pdaK6f85b0FWhqf7itdy7v
 RIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HVh+9RvnGn7NIBk54PLky8vsQeCLZfudzFHWpOrO1vE=;
 b=auuf/vvVlpLMoQpTBooM24qZGTfPMsyC1zWd5hhd6Q9lk48N326lAimaCPcG6CZUbB
 KLJHaqwePSPItflSoHojgKQoiFk4Y0LV6prqPhLn2eS8+bm6txda9K7oXqYJvkggNPi1
 8d/Zof0fbzzwN1g97MPYhSLRf7M4TagYo7vUVhJy1prZE1aBJaClSLLzepOhe1frK4Ic
 LTgOv1Y3KY3hixJ4hq6qrV2rljoW8rNeHDZLylTxSV2/owYYoNKOtLF1nxW3GOpwAeBV
 ci0vzbWZS7yZhhdWXNTK8/87AnN3A4yFELjmZPd6wrAaoalMXfEefX33ok3MfKh+TAKr
 m5MQ==
X-Gm-Message-State: AOAM530AHE02R5+hOhvy0ooi4HXUOtgy0gM9lrPAar5xfrWSEfyxQaBQ
 9TWNcaHr42Kohsijsyv35w6+dowPV1VUC1Xm0mdapg==
X-Google-Smtp-Source: ABdhPJwOvZQx3qr95Fj8PAO2LxJXrIgAH1NgbJi4/yIUAdREb51Ppyw4izkXFjXDl7YXvm5kYMKDdJzhFkk3TcEtM0k=
X-Received: by 2002:a1c:730a:: with SMTP id d10mr3692163wmb.59.1630769643702; 
 Sat, 04 Sep 2021 08:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210902112520.475901-1-anup.patel@wdc.com>
 <CAEUhbmUXxacAcojk+nExh-KjrdAyuEBG0U0P_fu=m3JY4Z2Ttw@mail.gmail.com>
In-Reply-To: <CAEUhbmUXxacAcojk+nExh-KjrdAyuEBG0U0P_fu=m3JY4Z2Ttw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 4 Sep 2021 21:03:52 +0530
Message-ID: <CAAhSdy0PLeTGf=aiLC9B97JVG+St5Bj_OChMhBfMG2ZfsOKVaA@mail.gmail.com>
Subject: Re: [PATCH v2 00/22] QEMU RISC-V AIA support
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::331;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Sep 4, 2021 at 7:21 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Sep 2, 2021 at 7:26 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > The advanced interrupt architecture (AIA) extends the per-HART local
> > interrupt support. Along with this, it also adds IMSIC (MSI contrllor)
> > and Advanced PLIC (wired interrupt controller).
> >
> > The latest AIA draft specification can be found here:
> > https://github.com/riscv/riscv-aia/releases/download/0.2-draft.24/riscv-interrupts-024.pdf
> >
> > This series adds RISC-V AIA support in QEMU which includes emulating all
> > AIA local CSRs, APLIC, and IMSIC. Only AIA local interrupt filtering is
> > not implemented because we don't have any local interrupt greater than 12.
> >
> > To enable AIA in QEMU, use one of the following:
> > 1) Only AIA local interrupt CSRs: Pass "x-aia=true" as CPU paramenter
> >    in the QEMU command-line
> > 2) Only APLIC for virt machine: Pass "aia=aplic" as machine parameter
> >    in the QEMU command-line
> > 3) Both APLIC and IMSIC for virt machine: Pass "aia=aplic-imsic" as
> >    machine parameter in the QEMU command-line
> > 4) Both APLIC and IMSIC with 2 guest files for virt machine: Pass
> >    "aia=aplic-imsic,aia-guests=2" as machine parameter in the QEMU
> >    command-line
> >
> > To test series, we require OpenSBI and Linux with AIA support which can
> > be found in riscv_aia_v1 branch at:
> > https://github.com/avpatel/opensbi.git
> > https://github.com/avpatel/linux.git
> >
> > Changes since v1:
> >  - Revamped whole series and created more granular patches
> >  - Added HGEIE and HGEIP CSR emulation for H-extension
> >  - Added APLIC emulation
> >  - Added IMSIC emulation
> >
>
> Where is v1 of this series? It seems I cannot find it on the ML.

The v1 series was pretty basic and only implemented AIA local interrupt
CSRs.

Here's the link:
https://patchew.org/QEMU/20210514143242.377645-1-anup.patel@wdc.com/

Regards,
Anup

