Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911BA345C3F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 11:52:27 +0100 (CET)
Received: from localhost ([::1]:38248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOeeA-0006RQ-ME
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 06:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOecP-0005bN-CA
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 06:50:37 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:35390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOecN-0001PM-PI
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 06:50:37 -0400
Received: by mail-ed1-x52c.google.com with SMTP id dm8so22912189edb.2
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 03:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kX2YP7uPIR0EPmEGBxIbUgT95Yx9gugBRiVibeU+rUY=;
 b=vrmrHsZlSygSw0aLOx8Z8oO3grTOcVZuedC/Uv3hYiRQg/R/aY18OlFpr7X+8fcS7N
 n7yZSLr5XTTCOxea62Kr0cQ5TpJftAjyJkgQIJb+HfpnFNuAnoY9W2vhITe6dJEQczHC
 HlQtO2LHT/8RSAaL5yGXf5+qAJgEoSdV06+O8EMT1nGhI2j1vegwigvQRCUiKp1oXHTe
 o5MxmSU15tV5m6oX3E/yokiUKSi/98JhPU0Hq43zzf5BmnmFy5DIdOhNLUExBs4df0jC
 dMXQEcQn+DIJcRibPjBNAmhJ5LGfF1VkPGXG0xVl3sjvIqZJJAJ1wN3R2LpG2idxYA+p
 563A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kX2YP7uPIR0EPmEGBxIbUgT95Yx9gugBRiVibeU+rUY=;
 b=qH90SJU4T7OIlCIXLZGJ+AfvM9Zo4PvKFPF0Al6leYjv+hQ4OZ9fR7Td5lakC5cLNL
 15I8G447o4KXCXHD7vxYClw7WKHEN2IrpYyuIspwEV1LkRTB2guEqHPS43JGa8bmZ8zK
 x0kQ4Vtsy7bbORDzumP1/a/9CEAbTMovJK98EuvuoS0oEEkY/a1HlBLwj7fV2l73tuUZ
 +PU40jMglLEaeIQv7zlB8u7ZwecjBn+fQfRqdXn95P9ZMlRywOhNncjrGVl0G+TYn91s
 OMZPvAS1MZ92nAONvldc3FOeDN2eGApbEa7XniY4p0bFONP0wrO5CzTBeX29X9fstF9y
 zFQw==
X-Gm-Message-State: AOAM530MhhiVQqLWw8DpKs1oOuUGbN27WlI3cSFcn95YHoSSqwHORbiP
 19TN1MmeJ9t00jX6y//n2O8i7ZsPkd+uZk+3lFdmcg==
X-Google-Smtp-Source: ABdhPJxWwaJt49zbz9NUrCvhZf7Kx7PzdbqszDGMQv/Y1rOCqTZFB0H7ZX/oXn1c0QAax56jtPm0MBA/XhNXCCfwl84=
X-Received: by 2002:a05:6402:1713:: with SMTP id
 y19mr3998162edu.52.1616496634466; 
 Tue, 23 Mar 2021 03:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210322154417.524229-1-mst@redhat.com>
 <CAFEAcA9xniNP73rbFLc_eUB2vi2N71vM2xKRMzqGWjXLEeLVag@mail.gmail.com>
 <CAFEAcA81p5aDj9CzuihLchX3QQB27Z7Jd6cNF9uo-2rh7EXx=w@mail.gmail.com>
 <20210322185502-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210322185502-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Mar 2021 10:50:05 +0000
Message-ID: <CAFEAcA-Kzt+y8r-6sms6Q6N3GHuDhpfc3cWL0gDoSej3bP5z-A@mail.gmail.com>
Subject: Re: [PULL 00/20] pc,virtio,pci: fixes, features
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Mar 2021 at 22:56, Michael S. Tsirkin <mst@redhat.com> wrote:
> On Mon, Mar 22, 2021 at 06:46:06PM +0000, Peter Maydell wrote:
> > This happens because pm_update_sci() calls pci_irq_handler(),
> > which calls pci_intx(pci_dev), which returns -1, which is not
> > a valid interrupt number to call pci_irq_handler() with.
> >
> > Q: given that pci_irq_handler() says it must only be called with
> > an irqnum in [0..3], shouldn't pci_set_irq() be a bit more
> > cautious than to pull a byte directly out of PCI_INTERRUPT_PIN
> > and assume it's valid? (Is this guest-writable, or is it read-only?)
>
> It's read-only.

Ah, so if a device model (a) doesn't set the value to a correct
interrupt number and then (b) triggers an interrupt for itself,
then that's a device model bug ? It might be worth assert()ing
that the irqnum is valid, just to catch this kind of bug a bit
more obviously.

thanks
-- PMM

