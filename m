Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A0013A87D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 12:36:18 +0100 (CET)
Received: from localhost ([::1]:37552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irKUb-00030C-Je
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 06:36:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54548)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1irKTn-0002TE-E2
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:35:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1irKTl-0001gT-U3
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:35:27 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:39387)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1irKTl-0001fa-No
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:35:25 -0500
Received: by mail-oi1-x22a.google.com with SMTP id a67so11490234oib.6
 for <qemu-devel@nongnu.org>; Tue, 14 Jan 2020 03:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nIDZx/ICiufZa86DEDMRnf4j5HOKJfhnpO2Xtv7xT7Q=;
 b=NDYauaegRP7500sgBL4UIA5/tr345ThyjmP0EgKisd7wE2WqZ9UQV607LD85o1TQf9
 Z6iE1fFchaZcfV0URv8dzndKqZoFMHyVSAa6NPrTyADRp5mWslLU2sIupN07qxzjqFjv
 J9jq19537nTY9ZgaysI5LaQ7WyXOWDv1GGGZ6vC7x5DXIo6v05GloLKLT2+8ToR0CMaL
 Pllz3QlbfKqg7dfNjzz8FvIMtK2C76FcateCmWp61RxD4gDme6T/RsSNL8VFgTV//pLc
 lekSJek00xJ307XIIRaO4f3qigOfRIniD2jeRxS/Ue7+VRdAatee7FEM/60ddUEJ3OEc
 Vy3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nIDZx/ICiufZa86DEDMRnf4j5HOKJfhnpO2Xtv7xT7Q=;
 b=uQlYHDfjYzGy1LKCygtmuJPueyNXhghSIfoCnDByF/3OEVbJNF/tG6no0gycOD2ovn
 lNh5tpB3unq+TgAFo50c42c4mPSNMLoSqgXLuJXAhoBTp6MFWyvQ471yct9Lhrv7XWWz
 jqCDKKiv7KY3BHDZqer+d1NNJ+X65nFhrNh51/DAxyXFGAkB7ZXtb+CN2sctrKkMeCqI
 xIsRMELA6FjE3sZ+yZax9d9BSQJmCz4MpKYjxQNiLht4tPdsMmsP7Fbf53f8eERXNq5g
 82n2z12+BYfwJw8OqVAr+glkvkWWNdPQBGrvjAWXqRynEwwVgyTQ6yzfzSjo6Mc0z6HQ
 +T7w==
X-Gm-Message-State: APjAAAXi5BW8zoe4rgdNVRhH3lJNHw0MUdsuMz+HfaTfZULRRf73Fn4z
 M7FI9sUK3+GpbqoNXvo9OiilqrDw9vvF5wC0i+r51w==
X-Google-Smtp-Source: APXvYqyoDeEPSMMR9XD5A7DpsHqVQLWsGoFtK4XtDmRulGIkC7D65fuqBZa1YekNo7HGVJSGwERrbdriQkXbhAJdiA0=
X-Received: by 2002:aca:3d7:: with SMTP id 206mr16609419oid.98.1579001724598; 
 Tue, 14 Jan 2020 03:35:24 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA-dz7f_12QU1_YSkfuKKEk9YYcq8jwLRu90Z85UZ+YKRQ@mail.gmail.com>
 <CAJy5ezpLwSMFzzt-wBUak89RJWQYC-4yyKrADsp6y6Q6oSRsvA@mail.gmail.com>
In-Reply-To: <CAJy5ezpLwSMFzzt-wBUak89RJWQYC-4yyKrADsp6y6Q6oSRsvA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Jan 2020 11:35:13 +0000
Message-ID: <CAFEAcA_ENpdUA+y0UV=JvJsa2xuk9JKQc=W1dHV1rigaTG-inQ@mail.gmail.com>
Subject: Re: xlnx-zynqmp doesn't set psci-conduit on the R-cores
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22a
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
Cc: Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 11 Jan 2020 at 21:36, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
> On Fri, 10 Jan. 2020, 08:42 Peter Maydell, <peter.maydell@linaro.org> wrote:
>> Hi; somebody pointed out to me that hw/arm/xlnx-zynqmp.c only
>> sets the psci-conduit on the A-profile cores, not the R. This
>> means you can't set the boot-cpu to an R-profile core and
>> use PSCI to wake up the other one. Is the omission deliberate?
> I don't think this was given much thought.
>
> AFAIK, we don't have any r5 software that implements PSCI (should that be done over svc? Hmm not sure if that's possible). The ATF port that runs on the a53s only handles the A cores IIRC.
>
> I'll need to double check but in our sw stack the R5s are controlled via EEMI, a SoC specific smc interface that runs on the PMU (MicroBlaze).
>
> Do you know how other SoCs with heterogeneous cores handle this?

I think usually in hardware they do some non-PSCI thing to
wake up other cores (and probably implement PSCI themselves
in the A-class firmware). PSCI itself doesn't really
contemplate the idea of heterogenous cores. But for QEMU's
xlnx-zynqmp model, every core except the 'boot_cpu' one
is started in the powered-off state so presumably the
only way to wake the other cores up is to use PSCI ?
Unlike the 'virt' board, there doesn't seem to be any
code to allow an "all CPUs start powered up and the
firmware handles putting the secondaries in a pen" approach,
and unlike the imx6 there's no model of a real-hardware
power controller whose implementation calls arm_set_cpu_on().

(The question came up because somebody was trying to do a
quick hack test-case of "start on an R core and wake the
A cores up later", but found they had to bodge several things
(including adding the psci-conduit on the R cores) to be able
to do this via PSCI. The use of the Xilinx board here is
mostly just because it's the only one we have which has
a separate R or M CPU as well as the main A-class cores.)

thanks
-- PMM

