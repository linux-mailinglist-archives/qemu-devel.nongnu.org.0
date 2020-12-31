Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD962E811D
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 16:53:12 +0100 (CET)
Received: from localhost ([::1]:55582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kv0GE-0006QB-QH
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 10:53:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kv0Ei-0005kK-59
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 10:51:36 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:43237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kv0Ee-0000rP-BQ
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 10:51:35 -0500
Received: by mail-ed1-x535.google.com with SMTP id y24so18469739edt.10
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 07:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=we+Ixhg61SrCGwt2OOlUJpjobPsqcw5gTklhlfKKOxg=;
 b=U/JXeXIFFK5FRuF1lQVpJaVGVUfWIUfKQZ6uX8V0ot7flH2PyhxJiEKd0J7W8bkR/t
 OW2wIS/1REZRYvFjbgWdgnqbY/JblSzIyeJ9HmekZ6wGTw1zxV5OdKHG9FXolHbqtFBE
 kMg0k5+9O0uYCre5IP5KUAOj0tj+zCx2bcPy1iGxrn4td37OOBTHyfPPboCu+nRJYUub
 A6PUdYlJRwmxHZx6wwsVvteaT77sOuL8I4e+5sAqGp4bLmEJXnFQn5DplIy/m7LPgqHF
 vjH57YeqbqVrkj5rI4am1QMjtEVAbTgEspESTWF1z46AO9ENgVFDkXTwBU15zWAko5i0
 p5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=we+Ixhg61SrCGwt2OOlUJpjobPsqcw5gTklhlfKKOxg=;
 b=jxrYoUNf1wNLQMnZBV8gjqNUlH6q8bPY4luVO3yU41/7kQeLPHY4U9oDahTEKwpSY/
 zKW+/r07nnO4zGFyxqNd/jQWJwVkwO9t4efY5bopIasKLdVUc/s6/KKNyT2e/heCF41n
 6a0FTZ6AAU61q59BrtSpJ2Tvv/9lYjshkMUOUYx8SqmeDDLGONLwgFk2iDaBmiH4xYgU
 qAaJEIEqLaiJNVt+JDuac8F3wzIvtWbRWho3SHFQoi5BoURwXClj0y75qdh6YAhEpqv5
 nfa+or/VFJCfWv6h492/jcNuEvK9B5yJZOSABdyd2UH9FZX2fK7GYN+0oF/Sf3yRNJyR
 Ea+A==
X-Gm-Message-State: AOAM533B0FAtFccAj79/vtpFCD6elPOUcc0owKTO0WbnHbfoxEy3NlIM
 5weIj0urRscBgiChhKORj+ozSmhufcCiFLGesu8LeA==
X-Google-Smtp-Source: ABdhPJy0Un8WHBJlmWMkYU0+YiirKqiol60LJb6VrZ8Q9VdQoxJu5VDV9SH/SLAyQj1oKwiw36VtvMnWSQtIl4dibx4=
X-Received: by 2002:aa7:c353:: with SMTP id j19mr55723845edr.204.1609429890542; 
 Thu, 31 Dec 2020 07:51:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1609413115.git.balaton@eik.bme.hu>
 <6892fc8ac57283bf7ba27fe89ea9dbdd6a37f988.1609413115.git.balaton@eik.bme.hu>
 <CAFEAcA96wr_+DmXfR5ba_MEPB+sBow-QR1wpvSvKawus7qzKVg@mail.gmail.com>
In-Reply-To: <CAFEAcA96wr_+DmXfR5ba_MEPB+sBow-QR1wpvSvKawus7qzKVg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Dec 2020 15:51:19 +0000
Message-ID: <CAFEAcA_bAjvx1oWO1DGimmThE7BhGHE0EqCoCR4nhuO3DMY_2g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] sam460ex: Clean up irq mapping
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Guenter Roeck <linux@roeck-us.net>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 31 Dec 2020 at 15:11, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 31 Dec 2020 at 11:20, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> >
> > Avoid mapping multiple interrupts to the same irq. Instead map them to
> > the 4 PCI interrupts and use an or-gate in the board to connect them
> > to the interrupt controller. This does not fix any known problem but
> > does not seem to cause a new problem either and may be cleaner at least.
> >
> > Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> > Tested-by: Guenter Roeck <linux@roeck-us.net>
>
> So, this patch is a behavioural change, but I think it's
> probably a change to the right behaviour. The difference
> is relatively slight, but you would see it if there are two
> different PCI cards and they both assert a different PCI
> interrupt, and then one of them lowers the interrupt
> before the other:

This turns out to be wrong -- I hadn't looked at the QEMU PCI
code, but it has an internal implementation of logic that
gives the same behaviour as an explicit OR gate. Basically
pci_change_irq_level() tracks how many assert/deasserts of
the (mapped) IRQ lines have happened, so it only calls the
controller's set_irq function when the count of asserted
inputs goes down to 0. So both the current code and this
patch's change are functionally correct.

I'm not sure which would be nominally closer to the "real hardware":
the 440ex CPU/SoC datasheet lists a single PCI0INT signal, but
it says it is an output, not an input, so I'm pretty sure there's
something I don't understand about PCI here. (Also, unlike the
440EP it provides PCI Express as well as PCI.)

thanks
-- PMM

