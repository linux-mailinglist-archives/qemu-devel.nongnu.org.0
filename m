Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DDC30777B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 14:55:13 +0100 (CET)
Received: from localhost ([::1]:46104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l57lQ-0005lt-2i
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 08:55:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l57iJ-0004OB-Mj
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:51:59 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:36001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l57iC-0007dS-Bf
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 08:51:59 -0500
Received: by mail-ed1-x529.google.com with SMTP id d2so6706286edz.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 05:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mdfMHvHalYSR0XyKeDsdIX+AReyjSJNYN5Pz1VQ3A9I=;
 b=xnI2+13zFHB563xKjxw6dEhAAJvAN9NhCoKrf9c/4ATzLS98yrlCOxiAFH6u6tmNl1
 Duvx0Op33030b+lc5Fv8wUiHCoCvG4hkeV8NbJrZ1dR1ZCXJwSGEQ76IIs/3JtHf6BBp
 b0YXV3K9onVnIS4nKDvTSReOIshZ4gAAGOBaJmxidVcCc79tX/2/1XFYvUSJaLRVcocZ
 hFxVteMTv2oFHhGjZqK8GjtPChukmKimdVeFabAfr6xESdEqSE6+kKNBHBow5CA1MC0+
 0R0l0Fx6mEBxke/cu1nW44EHEQZQ/owoKlw7Y2VqgazBDk3rANea6Gsgn/JbdR2O5Rxf
 RKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mdfMHvHalYSR0XyKeDsdIX+AReyjSJNYN5Pz1VQ3A9I=;
 b=RIUHcNoqzmLZpKHpMyL7jTgIY97lqGVekftt5qt1XvEO5M5s7VTZbb/jEYTLAP/yJA
 euVltu8hdXcGenTj1MRHahQSrIV9nI6hBjZFCDguLIawDkSHpH/fDBX5v3CKizV9Q/tU
 OyNun84Qp7KscT9bbt3JX1q6NimAyhvuJBqCcIjQhEa21IKXvuhUW9Yjo6PLYWxiMavJ
 okjb5McsfK0T2stTWH5AlNcGB5ALvY/wCWOPvCKwNV3EGfPp8Tpahj15Wt632wh37iNo
 hSjtrJtUwbiSz7FWPk1N0/0cZeAEGwukgv/I9E9HGV/QlZOGhzj5HbSE9i3/QDduly5B
 Zv4w==
X-Gm-Message-State: AOAM532MGhGnagX845E80LiHN7aiyvnR6YtZ+qfZL1pu0dFAhtnjJkwm
 l6eOOAnD2mzwhP4NBxVHR1kbQt56fug+7Y1b92RkQQ==
X-Google-Smtp-Source: ABdhPJzUkKrfSfYH2Zc+gVGVwGM+dVhjK8iL05GJnnXs4PXM9yvoVRYFlsJ6ZNDRcPv3oDvjmIb08tI3TaY/+qERw+w=
X-Received: by 2002:a05:6402:b2f:: with SMTP id
 bo15mr14592397edb.146.1611841909180; 
 Thu, 28 Jan 2021 05:51:49 -0800 (PST)
MIME-Version: 1.0
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
 <CAEUhbmWXTdL=DU0bRNJqx--2_=qa7kLpru7PE5jK4GxZRMWU3w@mail.gmail.com>
 <CAEUhbmWutywRhPNRQJccfo+ojUFL=P4K334zG7L=ZtdjwM_tTA@mail.gmail.com>
In-Reply-To: <CAEUhbmWutywRhPNRQJccfo+ojUFL=P4K334zG7L=ZtdjwM_tTA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 13:51:38 +0000
Message-ID: <CAFEAcA-yMfP27RKyDyUqNcnwArxnPcSV6z2U3AC-FCM4WisbpA@mail.gmail.com>
Subject: Re: [PATCH v8 00/10] hw/ssi: imx_spi: Fix various bugs in the imx_spi
 model
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jan 2021 at 07:15, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Jan 22, 2021 at 9:36 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Tue, Jan 19, 2021 at 9:40 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > This v8 series is based on the following 2 versions:
> > >
> > > - v5 series sent from Bin
> > >   http://patchwork.ozlabs.org/project/qemu-devel/list/?series=223919
> > > - v7 series sent from Philippe
> > >   http://patchwork.ozlabs.org/project/qemu-devel/list/?series=224612
> > >
> > > This series fixes a bunch of bugs in current implementation of the imx
> > > spi controller, including the following issues:
> > >
> > > - remove imx_spi_update_irq() in imx_spi_reset()
> > > - chip select signal was not lower down when spi controller is disabled
> > > - round up the tx burst length to be multiple of 8
> > > - transfer incorrect data when the burst length is larger than 32 bit
> > > - spi controller tx and rx fifo endianness is incorrect
> > > - remove pointless variable (s->burst_length) initialization (Philippe)
> > > - rework imx_spi_reset() to keep CONREG register value (Philippe)
> > > - rework imx_spi_read() to handle block disabled (Philippe)
> > > - rework imx_spi_write() to handle block disabled (Philippe)
> > >
> > > Tested with upstream U-Boot v2020.10 (polling mode) and VxWorks 7
> > > (interrupt mode).
> > >
> > > Changes in v8:
> > > - keep the controller disable logic in the ECSPI_CONREG case
> > >   in imx_spi_write()
> >
> > Ping?
>
> Could we get this applied soon if no more comments?

Sorry, I think I missed this re-send. I've reviewed or left
comments on the patches that were still unreviewed.

thanks
-- PMM

