Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68266316327
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 11:06:03 +0100 (CET)
Received: from localhost ([::1]:35166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9mNk-0004WW-Ly
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 05:06:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l9mMK-0003al-Do; Wed, 10 Feb 2021 05:04:32 -0500
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:35518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l9mMG-0008TH-K4; Wed, 10 Feb 2021 05:04:32 -0500
Received: by mail-lj1-x231.google.com with SMTP id a17so2043140ljq.2;
 Wed, 10 Feb 2021 02:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=G7GwhJERZajw60iemLfcKQOoxmLOGrUm1082hHt/4RA=;
 b=gHQ7Ux0uqBw7J3KwJMmEceu8JQ7K6toAbwEjeB7dugtN8DZI4L1RAajftSeH8zQJbv
 SjRYn4URCb70MTwprVL1AdnPc7vBBc9qlfljGLmHqkOBCBW1/QJOhiWVKxSTeJ3LP6bZ
 vmGLKXQKHOd4+apvzsCLfvPUN9GTP5qm8ey/HKvF3CdoXYnzfz3tV8bqBMSaAZCP+772
 lhGsX4KAugbZ777CMg4sNEgEV6RHTz1fX63qsB9bpAD9G+rDKEg4jHhYJ/VXcoWlx6o7
 Psx6er0mStKWTZ/8FKAyjwVVwbrNtx9up39cJ9lCpDvKZ8TFIW779k6mD8spPvHU7Iaj
 BnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G7GwhJERZajw60iemLfcKQOoxmLOGrUm1082hHt/4RA=;
 b=aLM0wvOU0RQyI+FYZmPEPPoquqvQ74x0s99EqF+VD/oLYLEKtX9EYyo/lW9j93Rj+8
 1JFpVDdJ1NwifEiwA7lRWH+VZW3cD5ofyl+m6sVGQgRHa/8Q/G5XD+Nr5jH6l+NC1nvf
 +UE/By8YaE9SchZp7m0b0eFgL/OskfZhiytfVkQDqnj0RpiZOBHLLebml1iBVP+S8wXV
 6zpIKWUnFw3hjbW0yecu7fE56gfg8Vxh3ZCdU20vXOYR/A9+LCFf1Yfq8FfxY37cYbws
 E49e5q4JyFeGSwKudkTH/FjANJ1k1vM9aQwXt8YdHJ4N0x1sFHjGBTwu0gbBs9v3MGa0
 CsWw==
X-Gm-Message-State: AOAM533mrASHJ5f/yyAa/d8ameaUPvLoViAJscjZYgLbiN/PKpuCzOw1
 a2C3kDe8sibYq2TIV6JR1kE=
X-Google-Smtp-Source: ABdhPJzOC4UONclbZB2aMz6QeAC1c2UjyEKD/X7XHk2KkOICQMdEXucki7pmubv+3YR6GhudJfKY2Q==
X-Received: by 2002:a2e:984a:: with SMTP id e10mr1415385ljj.160.1612951466042; 
 Wed, 10 Feb 2021 02:04:26 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id t27sm369693ljo.93.2021.02.10.02.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 02:04:25 -0800 (PST)
Date: Wed, 10 Feb 2021 11:04:24 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v2 2/2] hw/ssi: xilinx_spips: Implement basic QSPI DMA
 support
Message-ID: <20210210100424.GJ477672@toto>
References: <1612761924-68000-1-git-send-email-bmeng.cn@gmail.com>
 <1612761924-68000-3-git-send-email-bmeng.cn@gmail.com>
 <20210208124425.GI477672@toto>
 <CAEUhbmV=QLCuk5_bymrVNPO_vEU=R1A3urAaqhnNAgSGpiTsGw@mail.gmail.com>
 <CAJy5ezooJ21SAFhR2Pf=1aAwBkPEUivbCawZy-geCx+g36EP2Q@mail.gmail.com>
 <CAEUhbmVZr0pAW86kYjiXryN3cOaPc2LmrH9=fqLQUUdJrKX4Cw@mail.gmail.com>
 <CAJy5ezqPC365CAjzMmAfSyKw9uL+ur48bD4=WmMQWHA+_fCE=A@mail.gmail.com>
 <CAEUhbmUfwOwkcLhW9X0R46rAX3R7ygu2osgCqmuY0cne706MtQ@mail.gmail.com>
 <CAEUhbmXuEa4J45fi0yjpC81uP5DZ0DuZxjpFbffNqWUAjr_v9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUhbmXuEa4J45fi0yjpC81uP5DZ0DuZxjpFbffNqWUAjr_v9g@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x231.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 10, 2021 at 05:08:01PM +0800, Bin Meng wrote:
> On Tue, Feb 9, 2021 at 10:30 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Edgar,
> >
> > On Mon, Feb 8, 2021 at 11:17 PM Edgar E. Iglesias
> > <edgar.iglesias@gmail.com> wrote:
> > >
> > >
> > >
> > > On Mon, Feb 8, 2021 at 3:45 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >>
> > >> Hi Edgar,
> > >>
> > >> On Mon, Feb 8, 2021 at 10:34 PM Edgar E. Iglesias
> > >> <edgar.iglesias@gmail.com> wrote:
> > >> >
> > >> >
> > >> >
> > >> > On Mon, 8 Feb 2021, 15:10 Bin Meng, <bmeng.cn@gmail.com> wrote:
> > >> >>
> > >> >> Hi Edgar,
> > >> >>
> > >> >> On Mon, Feb 8, 2021 at 8:44 PM Edgar E. Iglesias
> > >> >> <edgar.iglesias@gmail.com> wrote:
> > >> >> >
> > >> >> > On Mon, Feb 08, 2021 at 01:25:24PM +0800, Bin Meng wrote:
> > >> >> > > From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > >> >> > >
> > >> >> > > ZynqMP QSPI supports SPI transfer using DMA mode, but currently this
> > >> >> > > is unimplemented. When QSPI is programmed to use DMA mode, QEMU will
> > >> >> > > crash. This is observed when testing VxWorks 7.
> > >> >> > >
> > >> >> > > Add a basic implementation of QSPI DMA functionality.
> > >> >> > >
> > >> >> > > Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> > >> >> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > >> >> >
> > >> >> > + Francisco
> > >> >> >
> > >> >> > Hi,
> > >> >> >
> > >> >> > Like Peter commented on the previous version, the DMA unit is actully separate.
> > >> >>
> > >> >> Is it really separate? In the Xilinx ZynqMP datasheet, it's an
> > >> >> integrated DMA unit dedicated for QSPI usage. IIUC, other modules on
> > >> >> the ZynqMP SoC cannot use it to do any DMA transfer. To me this is no
> > >> >> different like a DMA engine in a ethernet controller.
> > >> >
> > >> >
> > >> > Yes, it's a separate module.
> > >> >
> > >> >>
> > >> >> > This module is better modelled by pushing data through the Stream framework
> > >> >> > into the DMA. The DMA model is not upstream but can be found here:
> > >> >> > https://github.com/Xilinx/qemu/blob/master/hw/dma/csu_stream_dma.c
> > >> >> >
> > >> >>
> > >> >> What's the benefit of modeling it using the stream framework?
> > >> >
> > >> >
> > >> >
> > >> > Because it matches real hw and this particular dma exists in various instances, not only in qspi. We don't want duplicate implementations of the same dma.
> > >> >
> > >>
> > >> Would you please share more details, like what other peripherals are
> > >> using this same DMA model?
> > >>
> > >
> > > It's used by the Crypto blocks (SHA, AES) and by the bitstream programming blocks on the ZynqMP.
> > > In Versal there's the same plus some additional uses of this DMA...
> >
> > Sigh, it's not obvious from the ZynqMP datasheet. Indeed the crypto
> > blocks seem to be using the same IP that QSPI uses for its DMA mode.
> > With that additional information, I agree modeling the DMA as a
> > separate model makes sense.
> >
> > Will investigate the Xilinx fork, and report back.
> 
> Unfortunately the Xilinx fork of QEMU does not boot VxWorks. It looks
> like the fork has quite a lot of difference from the upstream QEMU.
> For example, the fork has a new machine name for ZynqMP which does not
> exist in the upstream. It seems quite a lot has not been upstreamed
> yet, sigh.
> 
> The CSU DMA model in the Xilinx fork seems to be quite complicated and
> has lots of functionalities. However right now our goal is to
> implement a minimum model that could be used to work with the GQSPI
> model to make the QSPI DMA functionality work.
> We implemented a basic CSU DMA model based on the Xilinx fork, and
> will send it as v3 soon.
>

We've prepared a patch with the QSPI DMA support using the complete
DMA model. We'll send that out soon. It's better if you base your
work on that.

Cheers,
Edgar

