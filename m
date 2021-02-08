Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD58313E71
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:06:06 +0100 (CET)
Received: from localhost ([::1]:36370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9BrJ-0004lJ-Jh
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:06:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l97G4-0007LV-5m; Mon, 08 Feb 2021 09:11:23 -0500
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:34125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l97Fi-0004TB-6m; Mon, 08 Feb 2021 09:11:11 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id d184so3368578ybf.1;
 Mon, 08 Feb 2021 06:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+NZVrLQiR9rMMA5raR/lycz7gXFOlEhREhf0TIHPsh8=;
 b=lsRdNtvKDAoJVGRCzka/7BxPGZzzhgr7yPyIZKtoRlvUEsKNTnIpt62MVlc1IfKCE4
 Yhbr2VM3ON/skM8HGEoFCgD5sQmHMB/Mcop8J0GzGw7iUZO3wW5Jq3B6j0G06kOci/ru
 jvDk0iE0PD9LuvWTjSe/4QLWtfK7Trh9zxj6QE8D08+9Vkgn/81xnY671zFybPTy2EW8
 YzzSyNb3lvZB5Uhvkdpo1tRQR58xAlk8G2x9+gusFI2MWIiimibRDA6bCmeR+BHuTymb
 +hkDovqcKFN4I86ek13XVTy/J7WMcwiAJKSFATtgk24EJwW/iZOVCXS1z74nM/DnUew+
 Czgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+NZVrLQiR9rMMA5raR/lycz7gXFOlEhREhf0TIHPsh8=;
 b=mzYHqYX+5gln+WaRTohVguG+FLIcxCib8fLltgd4JUQNVnPRYcYk5U7fVpmVVqF2WP
 KIBJsWPeKxY6ewM+vrbqWDwWRoHuOK+4Li8lXCiDddcC+DersMlMos3g264fOfNNoDbW
 sUJaqwIYqG+APTG6Ej7ZuHGiQFiryJMVfFXBu+mErYHkaVFtodE10a32Y6RIlWrq0MRz
 U/rUkIwS6YPCFginyYXFEyT1nf0zsMruwidjj9r6GFCBfPhczLATJ56NQ54J9e1XaP4Z
 7SAupREMWlzXSLCjO8VZIUtSY/OdUIxAfBOTUuEROJyNkHkgEa9ARxa3X/tcMBY5TaQs
 UnLQ==
X-Gm-Message-State: AOAM531RnDkhDzgqjXrE3BpcYjvo3u903AcS0XxjFtcM+3kCG6Ops3oC
 6cCSeXYgKCZlCgMxposevkk91SMshrFKdMJMDuA=
X-Google-Smtp-Source: ABdhPJwHIIebY9gBMipCaPT5xVbNV90zL93vxDQPxEl2UNCLC6Oz8cVC+Wdxewpm9+ox8R3YK85+LrCfbcUWZ6eyW4I=
X-Received: by 2002:a5b:5ce:: with SMTP id w14mr24860877ybp.314.1612793455443; 
 Mon, 08 Feb 2021 06:10:55 -0800 (PST)
MIME-Version: 1.0
References: <1612761924-68000-1-git-send-email-bmeng.cn@gmail.com>
 <1612761924-68000-3-git-send-email-bmeng.cn@gmail.com>
 <20210208124425.GI477672@toto>
In-Reply-To: <20210208124425.GI477672@toto>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 8 Feb 2021 22:10:43 +0800
Message-ID: <CAEUhbmV=QLCuk5_bymrVNPO_vEU=R1A3urAaqhnNAgSGpiTsGw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/ssi: xilinx_spips: Implement basic QSPI DMA
 support
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 francisco.iglesias@xilinx.com, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Edgar,

On Mon, Feb 8, 2021 at 8:44 PM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> On Mon, Feb 08, 2021 at 01:25:24PM +0800, Bin Meng wrote:
> > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> >
> > ZynqMP QSPI supports SPI transfer using DMA mode, but currently this
> > is unimplemented. When QSPI is programmed to use DMA mode, QEMU will
> > crash. This is observed when testing VxWorks 7.
> >
> > Add a basic implementation of QSPI DMA functionality.
> >
> > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> + Francisco
>
> Hi,
>
> Like Peter commented on the previous version, the DMA unit is actully separate.

Is it really separate? In the Xilinx ZynqMP datasheet, it's an
integrated DMA unit dedicated for QSPI usage. IIUC, other modules on
the ZynqMP SoC cannot use it to do any DMA transfer. To me this is no
different like a DMA engine in a ethernet controller.

> This module is better modelled by pushing data through the Stream framework
> into the DMA. The DMA model is not upstream but can be found here:
> https://github.com/Xilinx/qemu/blob/master/hw/dma/csu_stream_dma.c
>

What's the benefit of modeling it using the stream framework?

> Feel free to send a patch to upstream with that model (perhaps changing
> the filename to something more suitable, e.g xlnx-csu-stream-dma.c).
> You can use --author="Edgar E. Iglesias <edgar.iglesias@xilinx.com>".
>

Please, upstream all work Xilinx has done on QEMU. If you think the
DMA support should really be using the Xilinx one, please do the
upstream work as we are not familiar with that implementation.

Currently we are having a hard time testing the upstream QEMU Xilinx
QSPI model with either U-Boot or Linux. We cannot boot anything with
upstream QEMU with the Xilinx ZynqMP model with the limited
information from the internet. Instructions are needed. I also
suggested to Francisco in another thread that the QEMU target guide
for ZynqMP should be added to provide such information.

> The DMA should be mapped to 0xFF0F0800 and IRQ 15.
>
> CC:d Francisco, he's going to publish some smoke-tests for this.
>

Regards,
Bin

