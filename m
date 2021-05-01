Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D17370577
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 06:29:43 +0200 (CEST)
Received: from localhost ([::1]:51316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lchGA-00087b-Gg
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 00:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lchFF-0007YO-7w; Sat, 01 May 2021 00:28:45 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:45866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lchFD-0003zN-FS; Sat, 01 May 2021 00:28:44 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id g38so575559ybi.12;
 Fri, 30 Apr 2021 21:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KBOrlFh7m+qPBZ0bW2VfLECFPg8kJKYqGnFplvrHa34=;
 b=uWAaW1CyhSQINLIktbuxRY2oZup04jmk19ET6sNxRRd9xgsPzrS6DZmtGbF/c1+yCQ
 1bmdtMeb/XldC8v1ilYfdwvoLnpvFMcXGLdNOQLxn/8fTt7MvC+IuphjnEK+OrsPRjNl
 Wgb8rE6p3jsvXLm0eHyj1C3gWdgWD20bLtTCQL5Blq+6MXh3lj2oApvCMtng0DL3ViL/
 OKekcRABOZ012DiruUrVVTGcE0iKddKEGbOUM2BwqixGeOUdtxO4C6KA89f4GWOv0iad
 ZqTWXDCBJViTlGgoT7D7GXfZ1Zwv6kSak2Py8PGbsR0pZcuGWQEZlTqHdeqaHVrZgXYg
 CHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KBOrlFh7m+qPBZ0bW2VfLECFPg8kJKYqGnFplvrHa34=;
 b=uiBmvz/ZWUo+quUaF//NqtckZdD9yTUlpGEDIqiGbXHDkHN6xu+sbrVpfCUnD63KIm
 B7zarnhEgq+6DhZGnxM12zTASKReT5TNP9MGUoR7IWClW3m0T//JkqOF3R+hDIqkG/9P
 JF/KfSyW/pqbKs4wXs/9BigJY11zrt/bHvwJGuc1KyUeYX/XVoxSPB2aLlz0gr2hID86
 d1GhR/d+7y1ZwjHNV/yXNJizxXV3EahVsTNgjvyGfeOLg6nteBIpC7qPa5EFEcpN/WJH
 ESlbFeBRVcw+Sik5FqTk3kcv7I2SJhfwzODUZbgiWsZPOMguUM7lRIuafI1jrT3HeQfF
 2Z1g==
X-Gm-Message-State: AOAM530C119sZjCaF8ADWOGyGU8cQZT84dHo4PHiBCuFOk8pelSyap3V
 tEJxdnAdIDmuurFCpNLF291U/Mb7FYdfUm5XbPU=
X-Google-Smtp-Source: ABdhPJxy7urPtcoIFbbUfYpDKJYZOdjeEcRc+MB44zbEzCmwVKP7LcG5rcYuyhIWusPObDuSNNCC+FlMH8h+woifh7w=
X-Received: by 2002:a25:db84:: with SMTP id
 g126mr11812176ybf.122.1619843320843; 
 Fri, 30 Apr 2021 21:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210106063504.10841-1-bmeng.cn@gmail.com>
 <20210106063504.10841-4-bmeng.cn@gmail.com>
 <20210430144136.GA2880420@roeck-us.net>
In-Reply-To: <20210430144136.GA2880420@roeck-us.net>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 1 May 2021 12:28:30 +0800
Message-ID: <CAEUhbmUTLecMcr0=vmBeYJZeK6CdZY4SZcYiOu0E9AawY41+Cg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] hw/arm: sabrelite: Connect the Ethernet PHY at
 address 6
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 30, 2021 at 10:41 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Hi,
>
> On Wed, Jan 06, 2021 at 02:35:03PM +0800, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > At present, when booting U-Boot on QEMU sabrelite, we see:
> >
> >   Net:   Board Net Initialization Failed
> >   No ethernet found.
> >
> > U-Boot scans PHY at address 4/5/6/7 (see board_eth_init() in the
> > U-Boot source: board/boundary/nitrogen6x/nitrogen6x.c). On the real
> > board, the Ethernet PHY is at address 6. Adjust this by updating the
> > "fec-phy-num" property of the fsl_imx6 SoC object.
> >
> > With this change, U-Boot sees the PHY but complains MAC address:
> >
> >   Net:   using phy at 6
> >   FEC [PRIME]
> >   Error: FEC address not set.
> >
> > This is due to U-Boot tries to read the MAC address from the fuse,
> > which QEMU does not have any valid content filled in. However this
> > does not prevent the Ethernet from working in QEMU. We just need to
> > set up the MAC address later in the U-Boot command shell, by:
> >
> >   => setenv ethaddr 00:11:22:33:44:55
> >
>
> With this patch in place, the standard Ethernet interface no longer works when
> booting sabrelite Linux images directly (without u-boot) using the following
> qemu command.
>         qemu-system-arm -M sabrelite -kernel arch/arm/boot/zImage
>         ...
>
> The Ethernet interface still instantiates, but packet transfer to the host
> no longer works. Reverting this patch fixes the problem for me.
>
> Is there a qemu command line parameter that is now necessary to instantiate
> the Ethernet interface when booting Linux ?

Enabling "guest_errors" shows that Linux kernel fec driver is trying
to read PHY at address 0, which is not what we want.

[imx.fec.phy]imx_phy_read: Bad phy num 0

The device tree blob of the sabrelite does not contain a node for the
ethernet phy specifying phy address, so I suspect Linux kernel driver
is using default phy address 0 instead.

Could you please test on a real hardware to see what happens?

Regards,
Bin

