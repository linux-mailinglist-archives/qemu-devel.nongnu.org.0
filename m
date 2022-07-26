Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309ED5814CC
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 16:08:58 +0200 (CEST)
Received: from localhost ([::1]:41142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGLF2-0000p3-Mi
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 10:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGLBq-0007S6-0P
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 10:05:38 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:46618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGLBn-0001fk-Ju
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 10:05:37 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-31f445bd486so24980627b3.13
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 07:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O/IsjDxVyOsxpf8S4+/+yGtEeA/Cwn3k2GE/zxqxqsc=;
 b=USbaBvFBjmvSPLgvss74ByLRWMF9cGAg/47K6rLhJ7GFeRJFs7oZGvlyka0QPufjr0
 pV5RPJgRRoiYaaFJzpgfbUABd8xpYUE4Ua/Ekj3oPq8esudsoX2IoV4H0MRsjE5edsaG
 R52xRlEqe3ynRPxxILB/Ix86+xjSQzYp8ubo+5HTpn+JLdrCAES/pjzcAaEH7j7GjL4v
 JPBbiHDZAD0+MqhblPMKm4smG40FoRKUcqF20E6T+3X3Roiy6i8ajfxeEwJTeO9Q6Uwk
 J+gjVFS5IowbRoSBr5lP5uhMZRWGK6UfPbc61rJUvkWu+lk+oFhXyyU5Vc1FbrPbvw56
 c5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O/IsjDxVyOsxpf8S4+/+yGtEeA/Cwn3k2GE/zxqxqsc=;
 b=5XAckiFLHmGiMLgiHkCKHiP8clk33X/FgDf2m4B8MmEb13MYe1zCO5tHnT89isPRLk
 vrkEYMVAf3A6pZWRrnDa2ZlQFKDj9/XMeEEYvWVgfC5DXayGnyuFke7NZZNIxROq3mYI
 Yb1BhX81bWz9UPco0Qw/NAW4IJ8EZaqOX/7iQqapbKN61pqIsDdtjFYAd5yTcNOmrLWr
 REK5ypvNHmzo1Rhd0pA19MuYk5gV7GjbAYk7DDd4C0YXFdFG9jkyAtU4mBwqHTpxIjgn
 48Bdw3G6FPImg7W4TuO6zqkSOC27GkXKkEIU0N9uDaohbx902Ws7Z0gETjtnZKBNGoKU
 gjcw==
X-Gm-Message-State: AJIora+/3yD7r7iNburBa4Cqsyc9f0+aLAvfbzChObQMUBSIsz4e3jzQ
 41uIGOGrSTaamw8L4nIXJFVYiUkHCnKbfNh+q9vpIA==
X-Google-Smtp-Source: AGRyM1spAKYJlA+d1y51EPU7gUSTTSNKKRJ31q5+SZWjHVZr5nSXy0o6goVJxNDryHhsLImksHRcxoDIArcT/2t8CXM=
X-Received: by 2002:a0d:e004:0:b0:31f:311d:2351 with SMTP id
 j4-20020a0de004000000b0031f311d2351mr5818042ywe.10.1658844334253; Tue, 26 Jul
 2022 07:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220725145838.8412-1-alanjian85@outlook.com>
In-Reply-To: <20220725145838.8412-1-alanjian85@outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jul 2022 15:04:54 +0100
Message-ID: <CAFEAcA_LXAcWcUr9ajFTaGFCpw0Vnmf8Ya25ZM2JO35jEdhU7w@mail.gmail.com>
Subject: Re: [PATCH v2] hw/display/bcm2835_fb: Fix framebuffer allocation
 address
To: Alan Jian <alanjian85@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Alan Jian <alanjian85@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On Mon, 25 Jul 2022 at 16:06, Alan Jian <alanjian85@gmail.com> wrote:
>
> This patch fixes the dedicated framebuffer mailbox interface(marked as
> deprecated in official docs, but can still be fixed for emulation purposes)
> by removing unneeded offset to make it works like buffer allocate tag in
> bcm2835_property interface[1], some baremetal applications like the
> Screen01/Screen02 examples from Baking Pi tutorial[2] didn't work
> before this patch.
>
> [1] https://github.com/qemu/qemu/blob/master/hw/misc/bcm2835_property.c#L158
> [2] https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/screen01.html

Thanks. If examples which work on real hardware don't work on QEMU
then we presumably have a bug, and the documentation of this fb mbox
https://github.com/raspberrypi/firmware/wiki/Mailbox-framebuffer-interface
doesn't say anything about using the top bits of the config-struct
address for anything, so the current code definitely looks wrong.

This was the only place where we ever changed the config
struct's .base field to something other than s->vcram_base + BCM2835_FB_OFFSET.
If the .base field is now effectively constant then it's pointless
and we can clean things up a bit by getting rid of it. I'll send a
followup patch at some point.

Applied to target-arm.next, thanks. (I tweaked the commit message
slightly.)

-- PMM

