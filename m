Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A46F369E5D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 23:33:52 +0200 (CEST)
Received: from localhost ([::1]:43968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn8bW-0001bS-9S
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 17:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47349)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hn8bE-0001DB-B4
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 17:33:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hn8bD-0004jU-BI
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 17:33:32 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:45777)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hn8bA-0004hQ-Ua; Mon, 15 Jul 2019 17:33:29 -0400
Received: by mail-lf1-x143.google.com with SMTP id u10so12052430lfm.12;
 Mon, 15 Jul 2019 14:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WrVS+nAb4G+m4rvJ9ZBDRm5D2QLrdybuhMzs4rxbkMg=;
 b=oChMtOkfuya7ES1PZIC+KMd0bLyWe77kTEBIjFgCtlTXhbbYvZNDQcUmePsXtLxVMW
 hM7voGQfab+1EJdrNg53rKFdQtneRvZV2I8dMwPOCgCb2p1LDMYxUWWDpmgsTtc4MNH/
 PCC4fZ4CBvok6IdDeQ9ycT4DMDkMn+I2/lcbKkzEUzwU0kuNIfsFXUY689GGFfewVY1v
 1hkIp4OYjfDphLAyXmQ1JixQaG3xnCgsVOnRg6X81nAsldW+Mhdir71Y2hSGFE192MBu
 CH5fxGZ1fkFAnwVbxbAF5vOAk/+sq1ik435R2IG/h8jDU5QjVhkP9WbWa1y2jfjE0hHM
 qbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WrVS+nAb4G+m4rvJ9ZBDRm5D2QLrdybuhMzs4rxbkMg=;
 b=IUYj9niqILPNiaT512aZbHSdJqEaZ4aNP4fD5gT5/NUEyrMJhQXfL3yQQJ7CSh17LM
 gas5FUeoT2Kzfzarawl3u2HGYUHSCDd7HZY1vtPD/JwCPEywuYHjwSfnY2Y3POxUDyTP
 JoIHDhAxdxkilVI5G4WtR3MIw+MkDryqcjw34Ff/uZ4gKhTAyDN0xn8aCfKDit8EYshp
 oHSbmHZcuMXzS9+ZhldsZWWpiqZqwuzIJe1piuqKWCIGSZHPCcRMzxLp1D0HWnPGRDxp
 /61rbg+64jifSCay8CLE8SPsPIxHAbyKHIyqhZXeHLKoFdlUOGrN7tD0s3zWJK++qpZd
 eWdw==
X-Gm-Message-State: APjAAAVvQWt3fK29gOktD4HvxkasM7YNGUyo16XagUYlDCcnFP3cDR/U
 cXAvMtjHX+GYCVL78S9P0Li1w44K2O0CgWnozsM=
X-Google-Smtp-Source: APXvYqyLAkfsaAm/GsktmcmTBO2mh0DCA6evA6AD0qwMYZzA18BF+2b3tRsKTdvMxMYcmssIQlqJ67JMLE/ce1GS7m0=
X-Received: by 2002:a19:6a01:: with SMTP id u1mr12474675lfu.141.1563226407433; 
 Mon, 15 Jul 2019 14:33:27 -0700 (PDT)
MIME-Version: 1.0
References: <1558108285-19571-1-git-send-email-bmeng.cn@gmail.com>
 <1558108285-19571-2-git-send-email-bmeng.cn@gmail.com>
 <9338c7b4-6a05-2189-b93d-25cb2bd4dd54@adacore.com>
 <CAEUhbmUtdvkYPm4DZL4MSeV5imaj82x2xtPkQ0yLKF599N=vXw@mail.gmail.com>
In-Reply-To: <CAEUhbmUtdvkYPm4DZL4MSeV5imaj82x2xtPkQ0yLKF599N=vXw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 15 Jul 2019 14:30:08 -0700
Message-ID: <CAKmqyKP1BcTOQJDJoFiEL4NhMwTHQHmSDn=ZPiq8eDMB_hVSkw@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::143
Subject: Re: [Qemu-devel] [Qemu-riscv] [PATCH 2/2] riscv: sifive_u: Update
 the plic hart config to support multicore
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Fabien Chouteau <chouteau@adacore.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jul 13, 2019 at 8:23 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Fabien,
>
> On Tue, Jul 9, 2019 at 12:31 AM Fabien Chouteau <chouteau@adacore.com> wrote:
> >
> > Hi Bin,
> >
> > Thanks for this patch.
> >
> > I know I am very late to the game but I have a comment here.
> >
> > On 17/05/2019 17:51, Bin Meng wrote:
> > > +    /* create PLIC hart topology configuration string */
> > > +    plic_hart_config_len = (strlen(SIFIVE_U_PLIC_HART_CONFIG) + 1) * smp_cpus;
> > > +    plic_hart_config = g_malloc0(plic_hart_config_len);
> > > +    for (i = 0; i < smp_cpus; i++) {
> > > +        if (i != 0) {
> > > +            strncat(plic_hart_config, ",", plic_hart_config_len);
> > > +        }
> > > +        strncat(plic_hart_config, SIFIVE_U_PLIC_HART_CONFIG,
> > > +                plic_hart_config_len);
> > > +        plic_hart_config_len -= (strlen(SIFIVE_U_PLIC_HART_CONFIG) + 1);
> > > +    }
> > > +
> >
> > This will create up to 4 MS PLIC devices. However on the Unleashed FU540 the PLICs are M,MS,MS,MS,MS because of the monitor hart #0.
> >
> > This means a different memory layout than the real hardware.
> >
> > For instance address 0x0C00_2080 will be hart #0 S-Mode interrupt enables in QEMU, instead of #1 M-Mode interrupt enables for the real hardware.
>
> Thanks for the notes! I agree to better match the real hardware, it
> should be modeled like that. However I am not sure what the original
> intention was when creating the "sifive_u" machine. Both OpenSBI and
> U-Boot list sifive_u as a special target, instead of the real
> Unleashed board hence I assume this is a hypothetical target too, like
> the "virt", but was created to best match the real Unleashed board
> though.

I thought (Palmer correct me if I'm wrong) that the sifive_u machine
*should* match the hardware. The problem is that QEMU doesn't support
everything that the HW supports which is why U-Boot and OpenSBI have
their own targets. The goal is to not require special QEMU targets, so
this is a step in the right direction.

Alistair

>
> >
> > To fix this I suggest to change this loop to:
> >
> >     for (i = 0; i < smp_cpus; i++) {
> >         if (i != 0) {
> >             strncat(plic_hart_config, "," SIFIVE_U_PLIC_HART_CONFIG,
> >                     plic_hart_config_len);
> >         } else {
> >             strncat(plic_hart_config, "M", plic_hart_config_len);
> >         }
> >         plic_hart_config_len -= (strlen(SIFIVE_U_PLIC_HART_CONFIG) + 1);
> >     }
> >
> > This will make hart #0 PLIC in M mode and the others in MS.
> >
> > What do you think?
>
>
> Regards,
> Bin
>

