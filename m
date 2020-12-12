Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5430D2D837F
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 01:38:31 +0100 (CET)
Received: from localhost ([::1]:41560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knsvd-00084z-Sn
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 19:38:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1knsaX-0003BI-55; Fri, 11 Dec 2020 19:16:41 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:33029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1knsaV-0005yB-38; Fri, 11 Dec 2020 19:16:40 -0500
Received: by mail-ot1-x341.google.com with SMTP id b18so9930170ots.0;
 Fri, 11 Dec 2020 16:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=HGLJ0XFr2eycSdONf5XaKpiYmQbvEjGPa2F44v0a9B8=;
 b=VwdVfDjPNG8Qv53oJ++Qpu3EVwKs74cYDnqqFD1Mx1mQvzwNYLaBfdJOewmKgs0tV4
 y+86LI8FKzJczUTmRIW1tATQD/gNC2cFi8DCbry4DcypBhwHEJgz3coZHcf92HPcsmjT
 dn/QeJNjseb1mTU5gF5vFwcFt/gLeC7sqxKZ3wwg4cQ9t2eLaqf5MTibnkjXJLmItyS4
 hawkGqRiAeI5KJ1dFMD2+Ia2fVDWnqAVgMNVgwcBYw9FueflHvfVf2LIOzA2ZkwVgBkx
 5nvgVBsqMbfRO6h5z2jjW4GcT36F9tVMKjkyjhZnOn2T9Pv/zTKeMmghs47e4co3/wJB
 TiKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=HGLJ0XFr2eycSdONf5XaKpiYmQbvEjGPa2F44v0a9B8=;
 b=gZ6etnF3/5LA5BQgmHBblOOQq5YWb2DhCQ0NarHsCDL639JiNm0R2lVHWIoMyzhZhY
 Xbhl9cfCk7XYQmrqcobFpzCyCaJCN6nof0aOweQu8LvwOD1UYmmeeDAs9mQv49KgcAND
 q7RhNWmyo2PIFnpSH+kz5ZU8riJzi/U2hJgJodm1V19i+6BijvowlVm9Zn/2ZriXSpPA
 FT8+apyxnMWulyYz3l783KVYuFKgK4Jr41BFuGnKING/uGBpsYtnqbwumfeiLuPEKlP3
 x7vXXhTwfxk1417zylploWpHy4roCFyO3khr3SvyDqFrDFV4Iv3nUumPZbsHXeEz9Ycf
 iT9w==
X-Gm-Message-State: AOAM532Kxq+iu4nuDfaiNKxoS0j0vBgwZYue3FQST9ms8I9AXaST1M+U
 bsgBLdrUdEaoMJ7YxEYJ/g==
X-Google-Smtp-Source: ABdhPJx0ElMrZh+bLw5RNwuo9sr/rRH4m4Kv+UhKj+r/5S1cKxurPFFSnrR38lomqPavPxGDWSgukw==
X-Received: by 2002:a9d:614f:: with SMTP id c15mr11736686otk.362.1607732197282; 
 Fri, 11 Dec 2020 16:16:37 -0800 (PST)
Received: from serve.minyard.net ([47.184.170.156])
 by smtp.gmail.com with ESMTPSA id 60sm2208673otn.35.2020.12.11.16.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 16:16:36 -0800 (PST)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:cc8:2ec7:33ae:b2d9])
 by serve.minyard.net (Postfix) with ESMTPSA id 63E28180048;
 Sat, 12 Dec 2020 00:16:35 +0000 (UTC)
Date: Fri, 11 Dec 2020 18:16:34 -0600
From: Corey Minyard <minyard@acm.org>
To: Hao Wu <wuhaotsh@google.com>
Subject: Re: [PATCH 0/7] Additional NPCM7xx devices and IPMI BMC emulation
 support
Message-ID: <20201212001634.GK11017@minyard.net>
References: <20201211015156.2053372-1-wuhaotsh@google.com>
 <20201211030435.GI11017@minyard.net>
 <CAGcCb12UyiPoU=cPd3W3Mwj+jZHbWWESEPY-dhaSWXDqGdhM0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGcCb12UyiPoU=cPd3W3Mwj+jZHbWWESEPY-dhaSWXDqGdhM0w@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=tcminyard@gmail.com; helo=mail-ot1-x341.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm@nongnu.org, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 11, 2020 at 12:56:07PM -0800, Hao Wu wrote:
> Tl,dr: We'll remove the IPMI changes from the current patch set and
> refactor
>           them in a separate patch set.
> 
> Thank you for your review! On high level, we are trying to emulate the BMC
> side of the IPMI protocol. So we cannot directly use the existing IPMI code.
> However, they do have a lot in duplication as you pointed out. So we'll
> refactor
> the existing IPMI code and update in a way that we only add the required
> functionality.

Ah, I didn't figure that out from what you posted.  So the idea is you
can create the BMC side of the system in one qemu session with your
changes and then you connect it to a host system running qemu with the
host side of the interface.

The wire protocol is basically symmetric, but the command handling will
need to be separate.  So you probably want to split out the base
protocol from ipmi_bmc_extern into its own file and use that from your
own file, to avoid the duplication.

You need to do proper ATTN handling on the BMC side.  And you will also
need ties into GPIOs and whatnot for doing the reset, NMI, etc.

"ipmi_host" is probably not the best name.  At least to me that implied
the host side of the interface.  I'm not coming up with something I
really like, though.  Maybe "bmc_host"?  That's more descriptive, though
I'm sure a better name exists.  Then you could have "bmc_host_extern"
for the protocol.  If you come up with a better naming scheme, the
existing files can be renamed, too.

Thanks,

-corey

> 
> As for the KCS module, the BMC side of the protocol is the opposite
> direction
> of the existing ipmi_kcs.c code which is on the host/CPU side. For example,
> in READ_STATE the CPU would read data while the BMC would write data.
> So we can't directly use the same implementation. (They're different files
> in
> Linux either.) However, we can refactor it to re-use some of the common
> definitions.
> 
> We would like to remove the IPMI and KCS stuff from the current patch set.
> We'll send the refactored code in a separate patch set after addressing
> your concerns.
> 
> Thanks again for the review!
> 
> On Thu, Dec 10, 2020 at 7:04 PM Corey Minyard <minyard@acm.org> wrote:
> 
> > On Thu, Dec 10, 2020 at 05:51:49PM -0800, Hao Wu wrote:
> > > This patch series include a few more NPCM7XX devices including
> > >
> > > - Analog Digital Converter (ADC)
> > > - Pulse Width Modulation (PWM)
> > > - Keyboard Style Controller (KSC)
> > >
> > > To utilize these modules we also add two extra functionalities:
> > >
> > > 1. We modified the CLK module to generate clock values using qdev_clock.
> > >    These clocks are used to determine various clocks in NPCM7XX devices.
> > > 2. We added support for emulating IPMI responder devices in BMC machines,
> > >    similar to the existing IPMI device support for CPU emulation. This
> > allows
> > >    a qemu instance running BMC firmware to serve as an external BMC for
> > a qemu
> > >    instance running server software. It utilizes the KCS module we
> > implemented.
> >
> > Looking at the IPMI changes, why didn't you just re-use the existing
> > IPMI infrastructure?  ipmi_host.[ch] is basically a subset of ipmi.[ch],
> > and the ipmi_host_extern looks like a copy of of ipmi_bmc_extern with
> > some names changed.  That kind of code duplication is not acceptable.
> > Plus you copied my code and removed my copyrights, which is really
> > not acceptable and illegal.
> >
> > I'm not exactly sure why you needed you own KCS interface, either.  It
> > looks like the interface is somewhat different in some ways, but
> > integrating it into the current KCS code is probably a better choice if
> > that can be done.
> >
> > -corey
> >
> > >
> > > Hao Wu (7):
> > >   hw/misc: Add clock converter in NPCM7XX CLK module
> > >   hw/timer: Refactor NPCM7XX Timer to use CLK clock
> > >   hw/adc: Add an ADC module for NPCM7XX
> > >   hw/misc: Add a PWM module for NPCM7XX
> > >   hw/ipmi: Add an IPMI host interface
> > >   hw/ipmi: Add a KCS Module for NPCM7XX
> > >   hw/ipmi: Add an IPMI external host device
> > >
> > >  default-configs/devices/arm-softmmu.mak |   2 +
> > >  docs/system/arm/nuvoton.rst             |   6 +-
> > >  hw/adc/meson.build                      |   1 +
> > >  hw/adc/npcm7xx_adc.c                    | 318 ++++++++++
> > >  hw/arm/npcm7xx.c                        |  65 +-
> > >  hw/ipmi/Kconfig                         |   5 +
> > >  hw/ipmi/ipmi_host.c                     |  40 ++
> > >  hw/ipmi/ipmi_host_extern.c              | 435 +++++++++++++
> > >  hw/ipmi/meson.build                     |   3 +
> > >  hw/ipmi/npcm7xx_kcs.c                   | 570 +++++++++++++++++
> > >  hw/misc/meson.build                     |   1 +
> > >  hw/misc/npcm7xx_clk.c                   | 795 +++++++++++++++++++++++-
> > >  hw/misc/npcm7xx_pwm.c                   | 535 ++++++++++++++++
> > >  hw/timer/npcm7xx_timer.c                |  25 +-
> > >  include/hw/adc/npcm7xx_adc.h            |  72 +++
> > >  include/hw/arm/npcm7xx.h                |   6 +
> > >  include/hw/ipmi/ipmi_host.h             |  56 ++
> > >  include/hw/ipmi/ipmi_responder.h        |  66 ++
> > >  include/hw/ipmi/npcm7xx_kcs.h           | 105 ++++
> > >  include/hw/misc/npcm7xx_clk.h           | 146 ++++-
> > >  include/hw/misc/npcm7xx_pwm.h           | 106 ++++
> > >  include/hw/timer/npcm7xx_timer.h        |   1 +
> > >  tests/qtest/meson.build                 |   4 +-
> > >  tests/qtest/npcm7xx_adc-test.c          | 400 ++++++++++++
> > >  tests/qtest/npcm7xx_pwm-test.c          | 490 +++++++++++++++
> > >  25 files changed, 4221 insertions(+), 32 deletions(-)
> > >  create mode 100644 hw/adc/npcm7xx_adc.c
> > >  create mode 100644 hw/ipmi/ipmi_host.c
> > >  create mode 100644 hw/ipmi/ipmi_host_extern.c
> > >  create mode 100644 hw/ipmi/npcm7xx_kcs.c
> > >  create mode 100644 hw/misc/npcm7xx_pwm.c
> > >  create mode 100644 include/hw/adc/npcm7xx_adc.h
> > >  create mode 100644 include/hw/ipmi/ipmi_host.h
> > >  create mode 100644 include/hw/ipmi/ipmi_responder.h
> > >  create mode 100644 include/hw/ipmi/npcm7xx_kcs.h
> > >  create mode 100644 include/hw/misc/npcm7xx_pwm.h
> > >  create mode 100644 tests/qtest/npcm7xx_adc-test.c
> > >  create mode 100644 tests/qtest/npcm7xx_pwm-test.c
> > >
> > > --
> > > 2.29.2.684.gfbc64c5ab5-goog
> > >
> >

