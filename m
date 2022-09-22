Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7B95E67B8
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 17:56:39 +0200 (CEST)
Received: from localhost ([::1]:60042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obOZ4-0002U6-5B
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 11:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obN4e-00042e-3S
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:21:13 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:36590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obN4Z-0003wH-O7
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:21:07 -0400
Received: by mail-ej1-x630.google.com with SMTP id 13so21440766ejn.3
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 07:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=/Wc0mgLFRHUmFhl7MpUsY0s+PYtOfdXYF77TOXT470E=;
 b=SAUy/LIFBFt4SP/cN/CjThiLiKsNk0fX46jSwd6etGZn0N6+76SJokvOevHHkg8ugF
 QGU98UeWBNu7fcoJKUFzenkgbK4NfKhbgvpnmA9g9NfPVbzv3Iwfj3qXdZwxgPqNvyPD
 5HobpkvaULYtA7Pan81Dgz+y5F40aOxKz5nzmtbrK5oYdUnOn3VHRDdbO1rYBvlfNwLZ
 zBvFXhRCorvUOSjlaP+KOAaubhAsTBOnIsVR/sbn2g/oD6TEzfGZCWA6fNfT8M/0/8GC
 P7dae5eIa5VwjqPAzKW7nv2aea4Xndblf0hZG5LO5EaOZv+NJp2SKdIVCgDiYtrDsMEE
 /MAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=/Wc0mgLFRHUmFhl7MpUsY0s+PYtOfdXYF77TOXT470E=;
 b=Iwg1wwHj8qCbkWNfMF7gcKLC3huXVRG0NSzeXWxgk47HHIu1a+SEHtFOaDeSAuo/tQ
 bcFVub/VdribLw+1uSY+C+jvD0yc9Bk1d+WH0Qk4XTlpEutRzdO2iWEjaB2YpfSIAy2Z
 aQb8OD8cF6NG3cWFuMtS7JYjtNE2jH/Rl2/iu+NjoxOeMedOPYBktkPCo27lrJnpKLXZ
 5dD1G7yO/noQHibrAYBvt/E5878FVpssI1OZ4zSGLCos5qq3MOUZLd4FpNe5gBQ/Vj8p
 ZQSJvrmofB6+pTSrFRc/nVUVq0aykLq5GOceWh2KlXENJJI7/nAQd7x2KE9KCxT5vMYc
 U+MQ==
X-Gm-Message-State: ACrzQf3BwYwW/qmALSfbm8PB591amPKr09rTFk9UATFgjterDastWje6
 ernlNX5pfh9s8x5jO4ixaXmg8QUWUdOxYi/a3IzBbg==
X-Google-Smtp-Source: AMsMyM6uYFz2RyUBPQgFSIzOCwETzpdyOZUCyfkpTVeK0CbK06v1G+ZaqgUJpaVYJP6mQ/AQE7EhlTiJP19meY4aAUg=
X-Received: by 2002:a17:906:730f:b0:781:6a70:ea4 with SMTP id
 di15-20020a170906730f00b007816a700ea4mr3102320ejc.36.1663856462094; Thu, 22
 Sep 2022 07:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220910061209.2559-1-vikram.garhwal@amd.com>
In-Reply-To: <20220910061209.2559-1-vikram.garhwal@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2022 15:20:50 +0100
Message-ID: <CAFEAcA-KKNwCn0aJqZgXLM5XMH0WFYqC3i-Eyqomda=m2KfqCw@mail.gmail.com>
Subject: Re: [QEMU][PATCH 0/5] Introduce Xilinx Versal CANFD
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, edgar.iglesias@amd.com, francisco.iglesias@amd.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sat, 10 Sept 2022 at 09:15, Vikram Garhwal <vikram.garhwal@amd.com> wrote:
>
> Hi,
> This patch implements CANFD controller for xlnx-versal-virt machine. There are
> two controllers CANFD0@0xFF06_0000 and CANFD1@0xFF07_0000 are connected to the
> machine.
>
> Also, added basic qtests for data exchange between both the controllers in
> various supported configs.
>
> Regards,
> Vikram
>
> Vikram Garhwal (5):
>   MAINTAINERS: Update maintainer's email for Xilinx CAN
>   hw/net/can: Introduce Xilinx Versal CANFD controller
>   xlnx-zynqmp: Connect Xilinx VERSAL CANFD controllers
>   tests/qtest: Introduce tests for Xilinx VERSAL CANFD controller
>   MAINTAINERS: Include canfd tests under Xilinx CAN

Hi -- something odd seems to have happened with the cover letter for this
series: the patches haven't ended up as followups to the cover letter.
You can see this in the lore archive where the cover letter ends up
here on its own:
https://lore.kernel.org/qemu-devel/20220910061209.2559-1-vikram.garhwal@amd.com/
but the actual patches are here, with 2,3,4,5 showing up as replies to 1:
https://lore.kernel.org/qemu-devel/20220910061252.2614-1-vikram.garhwal@amd.com/
This means that patchew couldn't find the patches:
https://patchew.org/QEMU/20220910061209.2559-1-vikram.garhwal@amd.com/

If you could look at what went wrong in your config for next time it
will make the tooling happier.

thanks
-- PMM

