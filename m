Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E4141689B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 01:51:19 +0200 (CEST)
Received: from localhost ([::1]:53842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTYUm-0007DT-2J
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 19:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1mTYTE-0006HM-7D
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 19:49:40 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:43894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1mTYSy-0004YW-SB
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 19:49:40 -0400
Received: by mail-ed1-x52f.google.com with SMTP id v10so24567369edj.10
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 16:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=SiaPm7VFghtWYEpTBCmszHKT8zGjlYK3NfQjXWsN1yo=;
 b=Kxcd9cJH9fMsA8AuFzjFsd1gdums9pIaKDY/Gx7zPnQabOBct18DEvgY2rYm4smvlj
 kyphQriSWwSyNDp93HaSRcw7WAwVniclImvPJrHP8DxxNlbn6u8/bZPMNnTnQzSViIuj
 dzoJgjUQpGnKjtjZdZ4r2AuH2X/UYxCGqomAHAimo4gLLCyvaJdRSrM7LuaLNxTZWLTd
 z1nU4mpT0EUEt+hGWYNJRa88lSCymkcoxQhOAZ7Ly0jc0UiZtv1C5CB3XxBaPrqIIHRG
 AoyrikoEuRMrTaA1g8/qP4I3zOCpdGkZeZppkdfmAuqqZHV4j6yxftEWcuOAVlcwzKJZ
 /SUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=SiaPm7VFghtWYEpTBCmszHKT8zGjlYK3NfQjXWsN1yo=;
 b=MC3NGQ8XL0awh0YGmy/0pBXZ3qzJfcWBcFIkCyok0X6UBH4uGeeYNDIjM6LaieTlcN
 0BRvEJK3h75i4hHfAvGGRkxM6LHXK/A3JXx5A4beXpy+I6ltla4weE6nkB1KvYjnLzwM
 wIQHo5QzD+/iur2upaXf4FD8rw7eBXQfD47S058PIvwlAA8v66xX2+MUUrX2ixvp9kBk
 ctmQyuJs0XBZ9cBRGVyEKEzSBrwrUuQsghhT/p7NP5OwXtcI1YACG2dND6Dpl6roIwT2
 46unmS6yLlUZXD7ZTo+3uiqu8j40d81t/njPN4sAUMZQDL3KZ6FiOSbRuRMRtmKMumAl
 joPw==
X-Gm-Message-State: AOAM5302qoGl3tziklmH80nnwmBYKWnwKfapmt07HPC7G1YGWZHbDvRU
 L/N7ZnxBjXu4FLQn+5AXrytFOb1HT5pClF4QyNKEjA==
X-Google-Smtp-Source: ABdhPJzi/iNlNs8BdnUKu+3Yl4+7Lt4t2CoiQVhE/4u/IEWoRy44r/C9PaOoM+RLnBbRHkqt69cjf6/8VBby/Qh25GU=
X-Received: by 2002:a50:d98d:: with SMTP id w13mr1849483edj.51.1632440961715; 
 Thu, 23 Sep 2021 16:49:21 -0700 (PDT)
MIME-Version: 1.0
From: Titus Rwantare <titusr@google.com>
Date: Thu, 23 Sep 2021 16:48:45 -0700
Message-ID: <CAMvPwGr-FuQWHTQYxppAyT9uPhzCUDcezgz+jV=GwHGoQF4N6A@mail.gmail.com>
Subject: Re: [PATCH] hw/misc: Add an iBT device model
To: clg@kaod.org, "andrew@aj.id.au" <andrew@aj.id.au>
Cc: qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>, 
 Hao Wu <wuhaotsh@google.com>, Corey Minyard <minyard@acm.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=titusr@google.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Hello all,

I'd like some clarification on how the following code transfers irqs
back and forth:

> b/hw/arm/aspeed_soc.c
>+    /* iBT */
>+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->ibt), errp)) {
>+        return;
>+    }
>+    memory_region_add_subregion(&s->lpc.iomem,
>+                   sc->memmap[ASPEED_DEV_IBT] - sc->memmap[ASPEED_DEV_LPC],
>+                   &s->ibt.iomem);
>+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->lpc), 1 + aspeed_lpc_ibt,
>+                       qdev_get_gpio_in(DEVICE(&s->lpc), aspeed_lpc_ibt));
> }

and

>hw/misc/aspeed_ibt.c
>+static void aspeed_ibt_realize(DeviceState *dev, Error **errp)
>+{
>+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>+    AspeedIBTState *ibt = ASPEED_IBT(dev);
...
>+
>+    sysbus_init_irq(sbd, &ibt->irq);

I ask because the code in aspeed_soc.c seems to connect to the
lpc->subdevice_irqs[aspeed_lpc_ibt], initialised on
hw/misc/aspeed_lpc.c:408.
I noticed that bmc firmware running in qemu was checking the BT_CTRL
register less frequently than I'd like while editing this patch to use
the IPMIInterface.

Thanks,
Titus

