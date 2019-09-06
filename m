Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A76BAB61C
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 12:37:43 +0200 (CEST)
Received: from localhost ([::1]:54382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i6Bcc-0005gy-Jq
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 06:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51649)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i6BbD-0004bB-8M
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 06:36:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i6BbB-0004q5-O1
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 06:36:14 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:34434)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i6BbB-0004pi-H2
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 06:36:13 -0400
Received: by mail-oi1-x241.google.com with SMTP id g128so4555842oib.1
 for <qemu-devel@nongnu.org>; Fri, 06 Sep 2019 03:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4q0ZsE8JB9tBhkMnXJiBoiVAJqTnzerVQBKDgZkbqI8=;
 b=BRAAjWQUSOET0RGETYjKRx8DJXBxfBzk6RFcjVs2ErQI70YRfAv2l2ejVjpVPyETnC
 xHO1U5pzne5aLuMf9LdaCvLAfCqkt2Sg325kDSSq9wiFyNjbs+/EonDGCOs30XVgpLX5
 cZsE4u8kHaodwSb913xzbN1hISzm/uxlu6UXuIzP8SEWXRrU+uCGsJlyp+olkV4X8+cT
 evITaQPa3vTnADvcl+lRHIU5FC+q/sFVwwHh4vRx9dYbPG7hib/ljLjYBjn4UUkF45Xk
 UktRxmW9qCrORyeWxifUnpHTcnRTs/FPag9MM9vShbWHppCOigyU0vrSMGJpjMer2C91
 DhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4q0ZsE8JB9tBhkMnXJiBoiVAJqTnzerVQBKDgZkbqI8=;
 b=cWco4qJ4Yy0a9lD3z7hGf3gXKR+dO5Xl7DMxB98rreHwc4eRQR9fGtVKEDMKGPREGR
 yqeBHhYWckF7TGkEfF8xuy3JMjcjyuhlLQa8R3e+3G9Y+/tbPWoQKXhwoGYmmkLDztTe
 tLxbyLvEet2Pt6+o96I3z+T6LEaOQoNOllQIicQb7BkZIlskg1akL+STkcwm6eTlBz1+
 cvOkshZMO7ppW/iicLFkEZK9wYAkzzIdcMyB1txSK+mYir2a/gVB1pKHUe3/BpAIWN+h
 IoN6mcIG3lBhTTblcGl75jwBaEwWAq+ljFMrHsvO1z/4qWSyeDkjgV6vz0VjoaLTzk0h
 KupA==
X-Gm-Message-State: APjAAAW2h/0y3ZMesop3nJEqNkbpJqsn2lkFYBoIOvqjJJp4WqusFQ0u
 wQERO2OJGmk65bGDFHo1iGzjJUO3n+fQwZVU2Kcd5A==
X-Google-Smtp-Source: APXvYqx+TAD2g9yB7KZ+6p9mB7MhiaYlLmZZ04f3L9zC+S9Y2elCWy5zDJHeoB7MXuB0R+dmcFLMEFZ1clLK6M/ipDw=
X-Received: by 2002:aca:53d4:: with SMTP id h203mr6088251oib.146.1567766172441; 
 Fri, 06 Sep 2019 03:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190904162247.24095-1-damien.hedde@greensocs.com>
In-Reply-To: <20190904162247.24095-1-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Sep 2019 11:36:01 +0100
Message-ID: <CAFEAcA89q8mwNyhivbrCcTP7c208dbwmVBjF2mmOT5s+dyQ4sQ@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH] hw/arm/raspi: avoid reparenting the sd
 card during qbus tree reset
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 4 Sep 2019 at 17:23, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> In the raspi machine, the sd card can be on several sd bus (in reality
> there is one bus but several controllers). It is initially created in
> the "sd-bus" child in the gpio peripheral. Then is moved (parent bus
> changes) during machine reset in the "sdhci-bus". It can be moved again
> by software between the "sdhci-bus" and another bus ("bcm2835-sdhost-bus").
> Here's the corresponding qbus tree of the raspi machine:
>  + sysbus
>    * bcm2835_gpio
>      + sd-bus
>        * sd-card
>    * bcm2835-sdhost
>      + bcm2835-sdhost-bus
>    * generic-sdhci
>      + sdhci-bus
>
> During the initial machine reset, the sd card is moved. Since reset is
> based on qbus tree, moving the card during the reset seems odd (it changes
> the qbus tree). In this case, because of the order the qbus tree is
> walked, the sd card ends up being reset twice; the effective reset order call
> follows:
>  1 sd-card
>  2 sd-bus
>  3 bcm2835_gpio        -> move the sd-card to sdhci_bus
>  4 bcm2835-sdhost-bus
>  5 bcm2835-sdhost
>  6 sd-card             (again)
>  7 sdhci-bus
>  8 generic-sdhci
>
> This patch adds a raspi machine reset method which moves the sd card
> to the sdhci-bus before doing the whole reset (which will try to do the
> move too). By anticipating the move we avoid changing the qdev tree while
> resetting it.
>
> In consequence the step 1 is skipped in the previous list: when reset starts
> the sd-card is already not a child of bcm2835_gpio.

The solution proposed in this patch pushes something that should
really be the business just of the SoC model out to the machine
model level; it would be nice to be able to avoid that.

thanks
-- PMM

