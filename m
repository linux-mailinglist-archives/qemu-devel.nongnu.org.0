Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E8E2D7784
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 15:13:43 +0100 (CET)
Received: from localhost ([::1]:57504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knjAz-0008Nh-EJ
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 09:13:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knj8o-0006zx-N3
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:11:26 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:41598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knj8m-0004LY-UA
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:11:26 -0500
Received: by mail-ej1-x642.google.com with SMTP id ce23so12508408ejb.8
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 06:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zrOIYUDGKg9yWGtAGdW6NetyK3rkXZfZe1mj/vQicY8=;
 b=zlcnOL09smIQcOpRmKMn77tCCYaBVsL1IDrOXu0XoNTM6GvlEyz5rl8d2w+6n3vQXE
 xzJ8dpl775EIg7wS3pmcJj2/4+obwn4CkGj7XzGMtGDyKH+ZnHckJv69LmKyoaewp9x7
 HLExE+RyTEloIW11ucoGPcXd6dvvx7a6Jxs8Zgp4Bos+n4DW5Y9+lgExLO7nEpQ5CKUZ
 1/2zAhdWn/zM2jP6orjODirEHHE350MPd2QEhksfGx1Zr1/zuJdX3cBaodzKzx9c7kRW
 63wlxk0VPN5rgptN6vrhO+DfLsg94c5Rtj1rV1PzEZ3mzpNxDW7jSa7j8X2S8h+9MKYx
 20KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zrOIYUDGKg9yWGtAGdW6NetyK3rkXZfZe1mj/vQicY8=;
 b=n5zt8BI/9TgNJK22kOeO2J7vY3WHR6as0Hc0cujZOAG8eP0TYPBM/uDXLxkC/R0mos
 57MSOpVOLjbhV4U1fud01TqFAVRFCfomMLYCrIjO9U613THiGXgg9ZWN9+CUjTwDhfHg
 T3LF0LgB3QqqwEtQ1vm/V82gKqpYdW89ZGDnOyduWt29OP5klknCwMUGd7vZ95aIHavT
 +Lf+q3wcCTlr3VzVBS4G4KlJ083w7Cmwq7VFkkUJQMB9iqiYaytldLPmXnh5x0uEZFlz
 4JhopITThvug7NkKx6R/B6GE6jium+iaxC/hoH+i3Ii6l2TFRCPSWg5mZo+cWlS/DTZd
 iG+Q==
X-Gm-Message-State: AOAM530/YT2Svw6SRKyhSD2dH3NcV+LmBznskkU8waWgig2hiHuLnhgN
 OZAMvsHap3Yc3LeU66W+p+vvn5/6vDZdP1DdYbTI7v/J91o=
X-Google-Smtp-Source: ABdhPJz/Juzo25q8D2/R40M3Gn1rIRbelAFNU/jVWe/vnL3KoaMicd1FMMRNRMOuZoLVd7NBHWj2d1QZe4yEhxMN4VQ=
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr11377131eja.250.1607695882376; 
 Fri, 11 Dec 2020 06:11:22 -0800 (PST)
MIME-Version: 1.0
References: <20201106235109.7066-1-peter.maydell@linaro.org>
In-Reply-To: <20201106235109.7066-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 14:11:11 +0000
Message-ID: <CAFEAcA8CaZshQtW_KGq5JQ5obzJGH2yB0DtRjgKJNgY9Ca=Gew@mail.gmail.com>
Subject: Re: [PATCH 0/2] m68k/q800: make the GLUE chip a QOM device
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 6 Nov 2020 at 23:51, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This series is 6.0 material really I think.  It's a bit of cleanup
> prompted by a Coverity issue, CID 1421883.  There are another half
> dozen or so similar issues, where Coverity is complaining that we
> allocate an array of qemu_irqs with qemu_allocate_irqs() in a board
> init function -- in this case the 'pic' array in q800_init() -- and
> then we return from the board init function and the memory is leaked,
> in the sense that nobody has a pointer to it any more.
>
> The leak isn't real, in that board init functions are called only
> once, and the array of qemu_irqs really does need to stay around for
> the life of the simulation, so these are pretty much insignificant
> as Coverity issues go. But this coding style which uses a free-floating
> set of qemu_irqs is not very "modern QEMU", so the issues act as
> a nudge that we should clean the code up by encapsulating the
> interrupt-line behaviour in a QOM device. In the q800 case there
> actually is already a GLUEState struct, it just needs to be turned
> into a QOM device with GPIO input lines. Patch 2 does that.
>
> Patch 1 fixes a bug I noticed while doing this work -- it's
> not valid to connect two qemu_irq lines directly to the same
> input (here both ESCC irq lines go to pic[3]) because it produces
> weird behaviour like "both lines are asserted but the device
> consuming the interrupt sees the line deassert when one of the
> two inputs goes low, rather than only when they both go low".
> You need to put an explicit OR gate in, assuming that logical-OR
> is the desired behaviour, which it usually is.
>
> Tested only with 'make check' and 'make check-acceptance',
> but the latter does have a q800 bootup test.

Laurent, did you want to take this series as an m68k patchset,
or would you rather I just put it in via the target-arm queue?

thanks
-- PMM

