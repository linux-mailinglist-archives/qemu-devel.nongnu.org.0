Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA252DB5C0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 22:17:58 +0100 (CET)
Received: from localhost ([::1]:51750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpHhl-00057p-9c
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 16:17:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpHgE-0003c2-SQ
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 16:16:22 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:46594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpHgC-0003K8-Tf
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 16:16:22 -0500
Received: by mail-ed1-x531.google.com with SMTP id b73so22557429edf.13
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 13:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=F3TC44xU1wQpQLigd9NNiDpBLvLhqJKyQJKKbgPm2Lo=;
 b=EyMWhTQk47zon9Ui0igR+TIoilc/T1sbjU1Bji9/mYK+TrSfZJ1wCV8gQrolwBsgQD
 9soGRl1HZre+YpbboYo9rXlH9lzT2dFg4p8FY0mv7a59U8qwGCukBnxA1WVJB0W9yvVQ
 blqOZylcwUrmtYEhfnDVDTMf8gtYfMNeCX1b00FKF0XzDXAMpikgX6QMjWrh8lM1e80H
 b6fda4JZIx9zgNvksGIeJGvDwfKINPXIZSt1EmSqpB6F5BbHqYb4RAk26LONnkzG0nDX
 4tugECTyGhLSNXSc/CMd07KcTSjmRzW46LRT3ZQs8JwL/tl+dxOndNT/isXcprPhgsGn
 sthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=F3TC44xU1wQpQLigd9NNiDpBLvLhqJKyQJKKbgPm2Lo=;
 b=NhceNY/kYbiLOu38lzWm07DCkZNp9Jlq6+pEn38fmfgen9PbRuv+KGnq1++sQLh8By
 z3jqTJqBBGItCslfXYgsNquD8jpICge9uHVcQD1mXqyqT/+g6EkD0bLAy6J0k/gU4iVZ
 1ay4x/8zMyt5NbR0GDcwEn1QTlWZCsRvUFOZFu3PUeXaq8cm/fT8zl6+XBPgR4v7Sg6E
 1dAYlPpA+Vgf8Ufo66YmN84aHviMTJCkgsVdpqiTvp9DZ7cG70R81JjinapnrcdrM91a
 P2f9tuWqIvpw5CDk27tI529L1VPqyk7OHEdwt6RL+p3vAkdo2THYU6+iWHxonU5SF0Iv
 xHzQ==
X-Gm-Message-State: AOAM533FOBCWDgCuuWatp3zEVpaSRkUjUCly9G4ugxu1Mc+KrAwpmH7g
 fn/lJBn+hXlmW9CFgZ0LEl9yoFww3Be0ZLSBAaLYYBtv8bc=
X-Google-Smtp-Source: ABdhPJw/9SfKlBw82HVCiERKHKKQgo7gX4SLAdt0TVVHok71ZJuet+1LxG9UQOJKtQoewa8MNDYA8HEk9DyoSrRiDM0=
X-Received: by 2002:aa7:d915:: with SMTP id a21mr30834404edr.251.1608066979309; 
 Tue, 15 Dec 2020 13:16:19 -0800 (PST)
MIME-Version: 1.0
References: <20201215141237.17868-1-peter.maydell@linaro.org>
In-Reply-To: <20201215141237.17868-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Dec 2020 21:16:08 +0000
Message-ID: <CAFEAcA_GxtAJ6o+abe6DKbr1LpbLsxVM0bbjwPL-3JT1PMSKeQ@mail.gmail.com>
Subject: Re: [PULL 00/20] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Dec 2020 at 14:12, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> A grab-bag of minor stuff for the end of the year. My to-review
> queue is not empty, but it it at least in single figures...
>
> -- PMM
>
> The following changes since commit 5bfbd8170ce7acb98a1834ff49ed7340b0837144:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6.0-pull-request' into staging (2020-12-14 20:32:38 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20201215
>
> for you to fetch changes up to 23af268566069183285bebbdf95b1b37cb7c0942:
>
>   hw/block/m25p80: Fix Numonyx fast read dummy cycle count (2020-12-15 13:39:30 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * gdbstub: Correct misparsing of vCont C/S requests
>  * openrisc: Move pic_cpu code into CPU object proper
>  * nios2: Move IIC code into CPU object proper
>  * Improve reporting of ROM overlap errors
>  * xlnx-versal: Add USB support
>  * hw/misc/zynq_slcr: Avoid #DIV/0! error
>  * Numonyx: Fix dummy cycles and check for SPI mode on cmds


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

