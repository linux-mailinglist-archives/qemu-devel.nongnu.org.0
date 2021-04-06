Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F40355EBB
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 00:23:16 +0200 (CEST)
Received: from localhost ([::1]:48570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTu6N-00045h-8k
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 18:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lTu4q-0002zx-S5
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 18:21:41 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:41491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lTu4h-0003XT-Kn
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 18:21:40 -0400
Received: by mail-qk1-x730.google.com with SMTP id v70so16739185qkb.8
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 15:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mOOs9B24dquaTw9u7ucAlJx0xIUpDacBR/EZbefXg+4=;
 b=gKMjCCv4OmKAAEOetsJcVaZhjOoHEyUaronzmJ+JOeZNGHJhssJN94iRC9DoxoTr32
 yoDDXEg4r67a6sU3D5pQSGxHhadnNKyig/rPIbvnGn6MdBRNnUKi2x+P0ri/yxg7u0JI
 SDEGlgWk+ci1b8xaGEqSOF7vT3l/8ONpy7OUe8NWwidBQ7/v4wX5EeiHbYfL1DhhN137
 2kM+nRXjUGJRfcrWo2iJ3CgpbF/K2WH84Rz3yrWTBSD6NpYaYbVb00xbR8HcE6gaqB1z
 BPXnLLA0UeAL6IYGn/PQuH0MjVh/M7ViLRa3XaQQEofhFpybPDApRFp2U4+lAmK9IgBs
 B5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mOOs9B24dquaTw9u7ucAlJx0xIUpDacBR/EZbefXg+4=;
 b=YDk57N+IR0vAKwEonlC1GSQIReCYz8kCCT77OSGA7i97GlM6K3d5hU1UVEUPQD0HUH
 VkiW2fvzMyO0m8+ZGhe+geKXxY0hIi06gh+GAIhnUA3GiWlqomK03B7z5dumJYof0/cE
 sDl8/7mm72mzaMO8iDpTVpeqplII02X497xzRsSMOIJmNfypESPzyApKMpXdfb2Qgqxd
 83rZP+Qnay5u7TgTYF1uYNba8Ln0ZwGq65HwSpAT/F2Lha/Np/gEWz8TdDfde0wLJsf5
 rEJJkIfKF6y0tKhdJRtmTuFQL6Tpz6v/bDeIfkLmoqZr4BSpdB658aVh67+MBwzbugl0
 QcWw==
X-Gm-Message-State: AOAM533rlNNDFXMXAW/G37pkzYosDhDNxXTeO8EX8IBS+vRwkcISdOWu
 1Njb6IYPkN8sJXi3oSSM28sROWep3DJBI33gkkAG9w==
X-Google-Smtp-Source: ABdhPJy3EO6xX/G6Eka1l5nTW4NBBE0cPlbcvh2p6l8Mwicu3J+QbJVTr6wV2CHly7zJS8C7jVgGWo6DJJF6Rt9aAy4=
X-Received: by 2002:a37:b103:: with SMTP id a3mr123514qkf.261.1617747689113;
 Tue, 06 Apr 2021 15:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210403222810.3481372-1-venture@google.com>
 <20210405195834.GF7167@minyard.net>
 <CAO=notzJbWTn-KNurHs6HdzoLkFQRaKeNSdzBmufSu-eViRfww@mail.gmail.com>
 <CAO=notyrcWX59UqVP4=jueUvenx9b4NiTzk-wifa1s7wPypJsQ@mail.gmail.com>
 <20210406183601.GB7166@minyard.net>
In-Reply-To: <20210406183601.GB7166@minyard.net>
From: Patrick Venture <venture@google.com>
Date: Tue, 6 Apr 2021 15:21:18 -0700
Message-ID: <CAO=notyM82Xzco4gdpmJBJQxV_CkgH=9i8A_OXaksDdei8HebQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/i2c: Adds pca954x i2c mux switch device
To: Corey Minyard <minyard@acm.org>
Cc: Corey Minyard <cminyard@mvista.com>, Hao Wu <wuhaotsh@google.com>, 
 Havard Skinnemoen <hskinnemoen@google.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=venture@google.com; helo=mail-qk1-x730.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 6, 2021 at 11:36 AM Corey Minyard <minyard@acm.org> wrote:
>
> On Tue, Apr 06, 2021 at 08:55:14AM -0700, Patrick Venture wrote:
> > On Tue, Apr 6, 2021 at 8:41 AM Patrick Venture <venture@google.com> wrote:
> > >
> > > On Mon, Apr 5, 2021 at 12:58 PM Corey Minyard <cminyard@mvista.com> wrote:
> > > >
> > > > On Sat, Apr 03, 2021 at 03:28:08PM -0700, Patrick Venture wrote:
> > > > > The i2c mux device pca954x implements two devices:
> > > > >  - the pca9546 and pca9548.
> > > > >
> > > > > Patrick Venture (2):
> > > > >   hw/i2c/core: add reachable state boolean
> > > > >   hw/i2c: add pca954x i2c-mux switch
> > > >
> > > > Looking this over, the code looks good, but I have a few general
> > > > questions:
> > > >
> > > > * Can you register the same slave address on different channels?  That's
> > > >   something you could do with real hardware and might be required at
> > > >   some time.  It looks like to me that you can't with this patch set,
> > > >   but maybe I'm missing something.
> > >
> > > If I understand the hardware's implementation properly you can have
> > > collisions, and this allows for collisions.  I'm not sure what you
> > > mean by having both accessible.  For instance, on hardware you can
> > > have a switch with N channels, and on two of the channels there is an
> > > eeprom at 50.  But you're unable to talk to both eeproms at the same
> > > time, because the addresses collide -- so how would the hardware know
> > > which you're talking to?  My understanding of the behavior in this
> > > collision case is that it just talks to the first one that responds
> > > and can lead to unexpected things.
> > >
> > > There is a board, the quanta-q71l where we had to set the
> > > idle-disconnect because there were two muxes on the same bus, with
> > > conflicting addresses, and so we had to use idle disconnect explicitly
> > > to make the software happy talking to the hardware -- not ideal as
> > > having two devices behind different channels, but ultimately it's the
> > > same idea because the devices are conflicting.
> > >
> > > >
> > > > * Can you add devices to the secondary I2C busses on the mux using the
> > > >   standard QEMU device model, or is the function call required?
> > >
> > > I added the function call because I didn't see a clean way to bridge
> > > the issue as well as, the quasi-arbitrary bus numbering used by the
> > > kernel isn't how the hardware truly behaves, and my goal was to
> > > implement closer to the hardware.  I thought about adding an I2cBus to
> > > the device and then you'd be able to access it, but wasn't sure of a
> > > nice clean way to plumb that through -- I considered adding/removing
> > > devices from the parent i2c bus instead of the boolean reachable, but
> > > that seemed way less clean - although do-able.
> > >
> > > >
> > > > I ask because I did a pca9540 and pca9541 device, but I've never
> > > > submitted it because I didn't think it would ever be needed.  It takes a
> > > > different tack on the problem; it creates the secondary busses as
> > > > standard QEMU I2C busses and bridges them.  You can see it at
> > > >
> > > >    github.com:cminyard/qemu.git master-i2c-rebase
> > > >
> > >
> > > I'll have to take a look at your approach, but the idea that it
> > > wouldn't be needed sounds bizarre to me as nearly all BMC-based qemu
> > > boards leverage i2c muxes to handle their PCIe slot i2c routing.
> > >
> > > > If you design can do the things I ask, then it's better.  If not, then
> > > > I'm not sure.
> >
> > Corey,
> >
> > looking at your design, I should be able to do something similar with
> > a small tweak.
> >
> > I think my design follows the hardware where there can be conflicts,
> > etc, but what I didn't know how to do was add the faux I2cBuses in a
> > useful way -- but if I add the I2cBuses to the device, and then on
> > add/remove it registers the device on the parent bus -- i can still
> > use the reachable boolean to control whether it's present.  The faux
> > I2cBuses would be a simplification for adding/removing i2c devices --
> > and would act as the device list in my object.  So then setting the
> > channels would change to walking the devices held by the bus that
> > corresponds with the bit -- but _still_ using the reachable boolean.
> >
> > If you'd like, I can update my patchset to use an i2cbus for the
> > purpose above, then it would satisfy the requirement of leveraging the
> > normal device process and no longer require the special function call.
>
> That sounds reasonable.  Your implementation is quite a bit simpler than
> mine, which is a bonus.

Corey;

I will send out the updated patches tomorrow, but I had to cherry-pick
your patch: https://github.com/cminyard/qemu/commit/c7f696d09af2d55f221a5c22900c8f71bc2244be
so that I can get the callbacks for the bus actions, in this case, did
you want to send that patch to the mailing list ahead?  Otherwise,
I'll try to incorporate it as a predecessor patch.

Patrick

>
> -corey
>
> >
> > Patrick
> >
> > > >
> > > > -corey
> > > >
> > > > >
> > > > >  MAINTAINERS                      |   6 +
> > > > >  hw/i2c/Kconfig                   |   4 +
> > > > >  hw/i2c/core.c                    |   6 +
> > > > >  hw/i2c/i2c_mux_pca954x.c         | 182 +++++++++++++++++++++++++++++++
> > > > >  hw/i2c/meson.build               |   1 +
> > > > >  hw/i2c/trace-events              |   5 +
> > > > >  include/hw/i2c/i2c.h             |   3 +
> > > > >  include/hw/i2c/i2c_mux_pca954x.h |  60 ++++++++++
> > > > >  8 files changed, 267 insertions(+)
> > > > >  create mode 100644 hw/i2c/i2c_mux_pca954x.c
> > > > >  create mode 100644 include/hw/i2c/i2c_mux_pca954x.h
> > > > >
> > > > > --
> > > > > 2.31.0.208.g409f899ff0-goog
> > > > >
> >

