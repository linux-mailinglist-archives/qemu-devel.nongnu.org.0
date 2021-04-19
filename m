Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C037D363E38
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 11:06:37 +0200 (CEST)
Received: from localhost ([::1]:53036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYPrY-0002FZ-TW
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 05:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYPpT-0001PZ-50
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 05:04:27 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:44588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYPpK-0005jE-Iw
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 05:04:26 -0400
Received: by mail-ej1-x634.google.com with SMTP id r20so1934974ejo.11
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 02:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ipQB4+alHv2cP8fxiMkzxQOBfEDxtYP2sFF3ecbjIYc=;
 b=Pa1UPbHHxfo5skYtSBStpCC5JK2VWDXUXDNVGrzYlj2JHY44UvfIM9nJHcY91tudpV
 kRC2QFkFiwjZljHLrwPnmzC//6sVNf+OKgSN8cW14fxci0U1E8fs99dsaKBS0ZxehbbX
 pOY+s1fGhg1HdgqKjddL7FDmypn21XmgNvQhn7cL/qfDIcZ8cxYbQFVgAe2zV5uotmjq
 6zWdc2qhqhfJAJTVc7D61tHfq+Ft0EbyCIx+JILIhyDQukQayufaOd+hgnGHy0C0Uuzr
 CnOsRLv+0DdoVoB+a8QBAbK9XY9LSA2DfftiNzRU/okHdyO37Bc9s2cvzzCUy8R2zXhy
 lNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ipQB4+alHv2cP8fxiMkzxQOBfEDxtYP2sFF3ecbjIYc=;
 b=QF/IGIa30+JClgLwLn0SOOK6eQ/1u+f1fWmcXDYLlDOooPNYa+GoThbHhxAMJEOpg7
 3tWRql+92nZIvx0mu6/Nl+tVGBnsZmbyJZP7XcTbhhTwi2EuRl1lxA3At21mpXyiYGw2
 CCbBsHANx2NjadHxNAvFpDGeg/VP1NJEgEq8iLUXfU7JoHodZLArUtSZUMS/t1bupgd2
 9XVxTdLDOiIyTujUBMnh5+OZzvfZ3znzS9siGEXeEiA7sZIebOGsTmf0PLzhdoqLhxOU
 B8dIeOmTl085ziliPFbe6VPf6GYfnZoB5eIyqi5WmvEIRwPlDzIViv6r/B3TS/VhOAqF
 AqPg==
X-Gm-Message-State: AOAM533veiYZC4xFico4RQAZNHy6c3U8hSXJyox6nwqxNNI9Rlpfrn9J
 gN1z82ol6XOrEos+0nSBSvgDHLkbnm2bWeUoSgtseg==
X-Google-Smtp-Source: ABdhPJxiVqolhZbu0z5C+nw1AG3iJpcU05u1JoBRS8yfxmK4AojmVmHdChwpIdoTjuHeW1CdlDEV8Ca1YCPtOAFynQw=
X-Received: by 2002:a17:906:6d41:: with SMTP id
 a1mr13808255ejt.482.1618823055130; 
 Mon, 19 Apr 2021 02:04:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA8k+RUNhAOzCeefBs+vcyAgrtHwHMH9KfQb6OJg0su_7w@mail.gmail.com>
 <fc080508-9b82-8a2b-79bb-ab4e9f812cce@amsat.org>
In-Reply-To: <fc080508-9b82-8a2b-79bb-ab4e9f812cce@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 10:03:24 +0100
Message-ID: <CAFEAcA8hs3Uw=8-_CFa_GoMhmqxCcHw5t751oKzicd0_+Dh8kA@mail.gmail.com>
Subject: Re: Resetting non-qdev children in a 3-phase reset device
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 18 Apr 2021 at 21:16, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> +Markus
>
> On 4/9/21 8:13 PM, Peter Maydell wrote:
> > Maybe some mechanism for marking "these things which are my
> > QOM children I want to be reset when I am reset (so make them
> > reset children of me and don't reset them as part of the
> > qbus-tree-walking)" would be useful. I do think that in a
> > lot of cases we want to be doing something closer to "reset
> > along the QOM tree".
>
> Eh here you mention QOM again... Shouldn't it be qdev?

No, I meant QOM, ie the relation you see below in the "info qom-tree"
output:

> I know the LED is just an example of a broader problem.
> I indeed took care to add the QOM parent relation:
>
> (qemu) info qom-tree
> /machine (mps2-an385-machine)
>   /fpgaio (mps2-fpgaio)
>     /mps2-fpgaio[0] (memory-region)
>     /userled0 (led)
>       /unnamed-gpio-in[0] (irq)
>     /userled1 (led)
>       /unnamed-gpio-in[0] (irq)
>   /scc (mps2-scc)
>     /mps2-scc[0] (memory-region)
>     /scc-led0 (led)
>       /unnamed-gpio-in[0] (irq)
>     /scc-led1 (led)
>       /unnamed-gpio-in[0] (irq)
>     ...
>
> So looking at this qom-tree, the reset tree seems to me
> more natural than the sysbus one, but IIRC not many models
> set this QOM relationship.

> QOM objects aren't enforced to have a relation with a parent,

I thought they always got parented into somewhere, even if it
was a catch-all bucket somewhere ?

> as opposed as recent changes from Markus to always have a qdev
> on a qbus). But even without parent they end in the /unattached
> container below /machine, so if the reset were there, the
> machine could still iterate over the /unattached children.

...yes, /unattached is what I was thinking about.

My current half-thought-through view is that where we ought
to try to end up is something like:

 * "real" buses should continue to propagate reset
   (A "real" bus is like PCI, SCSI, and other buses where the real
   hardware has a concept of a "bus reset" or where the power to the
   plugged device comes from the bus so that powercycling the
   controller naturally powercycles the devices. Sysbus is not a
   "real" bus; I haven't checked the others to see if we have any
   other non-real buses)
 * reset should follow the QOM tree for objects not on a "real" bus
   (that is, the qdev "reset this device" function should do
   "iterate through my QOM children and reset those which are not
   on a real bus" as well as its current "reset myself" and "reset
   every qbus I have")
 * instead of reset starting with the sysbus and working along the
   qbus hierarchy, we start by resetting the machine. That should
   include resetting all the QOM children of the machine. Any
   device which has a qbus should reset the qbus as part of its
   reset, but only "real" buses reset their children when reset.

That means that, for instance, if you reset an SoC container object
it will reset all the sub-devices within the SoC and the miscellaneous
bits of glue logic like OR gates it might also own[*]. It also means that
CPU objects should no longer need weird special casing, because they
are part of the QOM hierarchy and get reset that way.

[*] Fun fact: TYPE_OR_IRQ inherits directly from TYPE_DEVICE which
means that pretty much no instances of it ever get reset.

There is of course a massive unsolved problem with this idea, which
is the usual "how do we get there from here" one.

(Eventually I think we might be able to collapse TYPE_SYS_BUS_DEVICE
down into TYPE_DEVICE: there is no particular reason why a TYPE_DEVICE
can have GPIO inputs and outputs but only a TYPE_SYS_BUS_DEVICE can
claim to have MMIO regions and IRQs. "Only sysbus devices get reset"
is a big part of why a lot of devices today are sysbus.)

thanks
-- PMM

