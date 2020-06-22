Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6183C203684
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 14:14:44 +0200 (CEST)
Received: from localhost ([::1]:38762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnLLX-0000h7-71
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 08:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jnLJw-00088i-FX; Mon, 22 Jun 2020 08:13:04 -0400
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42]:35680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1jnLJu-0007Fi-L1; Mon, 22 Jun 2020 08:13:04 -0400
Received: by mail-yb1-xb42.google.com with SMTP id 187so8984364ybq.2;
 Mon, 22 Jun 2020 05:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/NN/9u77e9B+qXaVahDiUEE7BSunPhSjs0zadeZbxpY=;
 b=MlERDvQO7WjxcKiIsBzKp9AgiSk3Y4ZTYK2CQcj3cWLFGShZJNq8rEt/vYv42edOwk
 mL8a/56RH+tPSR/oRP1CaIdM14eT4R7jmy/UoCdPft/z0ReRr3jxWrDQ3K6jY4Dd9CmQ
 xnlcqY9dfQBROe6qshe5IVPFU5PUbHtmuBiyN5W+FMDWRKcXMMTINQHFBZffAT4mCf+L
 lXJPvBjKMBw3tw2/YCkbssiVbg2Jb+1urb8FGKwXgsxdJTy6IZxNGQp0CCHQJ1j/BNf9
 I8Cip/LMkwXE1vf+WJzzkK19MM8JUb4077oG8gm1kgZm48AdhriUOMNWOVuTmBUqh/04
 o34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/NN/9u77e9B+qXaVahDiUEE7BSunPhSjs0zadeZbxpY=;
 b=NFYWoT79XqMmsmAWXcOTir9Li0CZ7Yk8ZnrW02DyEGXx1CDEAQE7Oxg2sQUiS/YUdF
 xIa6VNWDwKKwpDuB3l1OzQ2L78SA0Vl0z5Bxp0FUYzIXbVP12warkecFYy94ojPZAl+0
 wRSG9NlxwzNKLRQMpHjfIfFx7rGm8rsynnhb/GinMR4nI82l2VyZbybtXGXboRyke7U/
 fXeMpw6flIwZx6MwOtYrPJf1IQpwE/G+BdQovUyyEdMq4VsAJetznRs9lMsm7tznSJ8+
 oRbljQ/+PcJNXL7Pz5dnTH4RfLP5SCFbosdUDdZ5hSdAcDwbEtMnSIiyYzYvPwsCjeFq
 6xKg==
X-Gm-Message-State: AOAM531vLOv1lTLJByETWBYY3VQhNY1pVadwaPaiYJUVKGb3HxSMQ6Td
 81R9VyFcPrnAjTdkVa8DsPveZqchm6YOQv3pV9U=
X-Google-Smtp-Source: ABdhPJzttXwSNeg2qZd84dunUK+aTi1nsKoTGmOD1Fd9ujZC/ZaYn3lAwiUbx+ZARzwJbBeVEhgYlnlrnoFfZ1MP4uw=
X-Received: by 2002:a25:38c5:: with SMTP id
 f188mr27878031yba.332.1592827981324; 
 Mon, 22 Jun 2020 05:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <1592807604-20805-1-git-send-email-bmeng.cn@gmail.com>
 <DM6PR04MB620142B152292DD3945E4D3C8D970@DM6PR04MB6201.namprd04.prod.outlook.com>
In-Reply-To: <DM6PR04MB620142B152292DD3945E4D3C8D970@DM6PR04MB6201.namprd04.prod.outlook.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 22 Jun 2020 20:12:49 +0800
Message-ID: <CAEUhbmVhHKy70dA5dyQCiWeYk1nbhXHnZH8JBxmRJP6EUb2z9g@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] riscv: Switch to use generic platform of opensbi
 bios images
To: Anup Patel <Anup.Patel@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b42;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb42.google.com
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

On Mon, Jun 22, 2020 at 6:09 PM Anup Patel <Anup.Patel@wdc.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Qemu-riscv <qemu-riscv-
> > bounces+anup.patel=wdc.com@nongnu.org> On Behalf Of Bin Meng
> > Sent: 22 June 2020 12:03
> > To: Alistair Francis <Alistair.Francis@wdc.com>; Bastian Koppelmann
> > <kbastian@mail.uni-paderborn.de>; Palmer Dabbelt
> > <palmerdabbelt@google.com>; Sagar Karandikar
> > <sagark@eecs.berkeley.edu>; qemu-devel@nongnu.org; qemu-
> > riscv@nongnu.org
> > Cc: Anup Patel <anup@brainfault.org>; Bin Meng
> > <bin.meng@windriver.com>
> > Subject: [PATCH v2 0/7] riscv: Switch to use generic platform of opensbi bios
> > images
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > The RISC-V generic platform is a flattened device tree (FDT) based platform
> > where all platform specific functionality is provided based on FDT passed by
> > previous booting stage. The support was added in the upstream OpenSBI
> > v0.8 release recently.
> >
> > This series updates QEMU to switch to use generic platform of opensbi bios
> > images.
> >
> > The patch emails do not contain binary bits, please grab all updates at
> > https://github.com/lbmeng/qemu.git bios branch.
>
> It will be nice to have this series updated to for fw_dynamic.bin .

Do you mean we include fw_dynamic.bin for virt & sifive_u, and
fw_dynamic.elf for spike?

But previously we agreed to include only generic platform BIN and ELF files.
See https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg00664.html

>
> Maybe you can rebase your series on top of Atish's patches ??

Regards,
Bin

