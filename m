Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7022036B7
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 14:28:31 +0200 (CEST)
Received: from localhost ([::1]:59320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnLYt-0003aW-1E
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 08:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jnLXz-0002ki-Sd; Mon, 22 Jun 2020 08:27:35 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:33214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jnLXy-00016M-3r; Mon, 22 Jun 2020 08:27:35 -0400
Received: by mail-yb1-xb41.google.com with SMTP id o4so9000880ybp.0;
 Mon, 22 Jun 2020 05:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dbgCV2QuhV7by47lTsxGvt9QQgdOQSbItV55nFxX3Hc=;
 b=A4ylWXtO+WUCwDryuywF2HBBIUFlXfS7hZVcwq/xqHxJLhzlGXDusxQnVihBBNkh5B
 yuK9ORO1jpiGa37L7VL5Dm8Vx4tX184ooWNx22qt5WGTdFEPaPRdiLwfkd36XS0sKvJl
 2P2DGx2Qb2ybT0DvM5HKI28DviOP5BPr3D1xdZH0TNxW8waHl1yXjq6kxo3SvAzTp8po
 vdiOqSsv2nqXmk8MZlYQBbR39omj9qzUFU5vLvcMX95UgoqVa/t/MWwHJU4I9B7UOLLh
 8KXc1iIsofTcvXmUqr7BHTABnVVCTe9tAX/4pZEc4e7KlyVuBJOhJL1vXtWOktodmlAk
 jakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dbgCV2QuhV7by47lTsxGvt9QQgdOQSbItV55nFxX3Hc=;
 b=QlkHnN0SbUDyW6ajhEnvqJ3U1Gja3oQ+PoEKA7mX1PN6TSGDTbUKCL7f0mr0B9aS69
 IbXKkIeOpdfGhDCeX+v+VSNYomHqlE47pLQ2Mz4gXqxtTCWxc3jUwT30RDwK/oNehojD
 ndVcRxjnQsy0l3NHuX4OgTdhzD/hSlvpCkF0Un3Z0wM6mmN57rMW2Rqq0o5f/5Tv1TGZ
 rebs9l921/0WmT7F6nG9niz9p58SWcZUEhuaGGhim1kuq42ZY0vIqHDRRmHISRqcue3q
 O4gbin6qVwDjjnb+5ay3imh2Ne78RdEdIxPDtH747BxulFkfHxbj2k04CfBBs/apfDlh
 t4wA==
X-Gm-Message-State: AOAM532mjs78z7v+v4T3UHyW4n3Rs0wtNQ97wp4jQHbMCYpWyOyUCzCM
 Frtc8pRDggicSx6etoCe/PxmxGVKc2EZrIcTQWc=
X-Google-Smtp-Source: ABdhPJxx50hlcMEIpxjrLpSe8F5MZTlyfAcOKIqWdeZZj9keV+f7esdy3tTlCeG2rdgL7KdZySrJxy/X6Qis+Arpqy8=
X-Received: by 2002:a25:da44:: with SMTP id n65mr29302786ybf.387.1592828852576; 
 Mon, 22 Jun 2020 05:27:32 -0700 (PDT)
MIME-Version: 1.0
References: <1592807604-20805-1-git-send-email-bmeng.cn@gmail.com>
 <DM6PR04MB620142B152292DD3945E4D3C8D970@DM6PR04MB6201.namprd04.prod.outlook.com>
 <CAEUhbmVhHKy70dA5dyQCiWeYk1nbhXHnZH8JBxmRJP6EUb2z9g@mail.gmail.com>
 <DM6PR04MB62013393F37DC653A1D3F1B28D970@DM6PR04MB6201.namprd04.prod.outlook.com>
In-Reply-To: <DM6PR04MB62013393F37DC653A1D3F1B28D970@DM6PR04MB6201.namprd04.prod.outlook.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 22 Jun 2020 20:27:21 +0800
Message-ID: <CAEUhbmUQKv9tJfCeWYnO59AoqOHah8J6T0g2zVBnujmSdYtAfg@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] riscv: Switch to use generic platform of opensbi
 bios images
To: Anup Patel <Anup.Patel@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b41;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Anup,

On Mon, Jun 22, 2020 at 8:20 PM Anup Patel <Anup.Patel@wdc.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Bin Meng <bmeng.cn@gmail.com>
> > Sent: 22 June 2020 17:43
> > To: Anup Patel <Anup.Patel@wdc.com>
> > Cc: Alistair Francis <Alistair.Francis@wdc.com>; Bastian Koppelmann
> > <kbastian@mail.uni-paderborn.de>; Palmer Dabbelt
> > <palmerdabbelt@google.com>; Sagar Karandikar
> > <sagark@eecs.berkeley.edu>; qemu-devel@nongnu.org; qemu-
> > riscv@nongnu.org; Anup Patel <anup@brainfault.org>; Bin Meng
> > <bin.meng@windriver.com>
> > Subject: Re: [PATCH v2 0/7] riscv: Switch to use generic platform of opensbi
> > bios images
> >
> > Hi Anup,
> >
> > On Mon, Jun 22, 2020 at 6:09 PM Anup Patel <Anup.Patel@wdc.com> wrote:
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Qemu-riscv <qemu-riscv-
> > > > bounces+anup.patel=wdc.com@nongnu.org> On Behalf Of Bin Meng
> > > > Sent: 22 June 2020 12:03
> > > > To: Alistair Francis <Alistair.Francis@wdc.com>; Bastian Koppelmann
> > > > <kbastian@mail.uni-paderborn.de>; Palmer Dabbelt
> > > > <palmerdabbelt@google.com>; Sagar Karandikar
> > > > <sagark@eecs.berkeley.edu>; qemu-devel@nongnu.org; qemu-
> > > > riscv@nongnu.org
> > > > Cc: Anup Patel <anup@brainfault.org>; Bin Meng
> > > > <bin.meng@windriver.com>
> > > > Subject: [PATCH v2 0/7] riscv: Switch to use generic platform of
> > > > opensbi bios images
> > > >
> > > > From: Bin Meng <bin.meng@windriver.com>
> > > >
> > > > The RISC-V generic platform is a flattened device tree (FDT) based
> > > > platform where all platform specific functionality is provided based
> > > > on FDT passed by previous booting stage. The support was added in
> > > > the upstream OpenSBI
> > > > v0.8 release recently.
> > > >
> > > > This series updates QEMU to switch to use generic platform of
> > > > opensbi bios images.
> > > >
> > > > The patch emails do not contain binary bits, please grab all updates
> > > > at https://github.com/lbmeng/qemu.git bios branch.
> > >
> > > It will be nice to have this series updated to for fw_dynamic.bin .
> >
> > Do you mean we include fw_dynamic.bin for virt & sifive_u, and
> > fw_dynamic.elf for spike?
> >
> > But previously we agreed to include only generic platform BIN and ELF files.
> > See https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg00664.html
>
> I am suggesting to use Generic platform fw_dynamic.bin and fw_dynamic.elf
> for QEMU virt, QEMU spike, and QEMU sifive_u machines.

Do you mean we replace fw_jump.bin with fw_dynamic.bin in QEMU? If
everyone agrees this is the way to go, I can rebase this series on top
of Atish's fw_dynamic.bin support series.

Regards,
Bin

