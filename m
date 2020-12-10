Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2772D5C85
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:57:40 +0100 (CET)
Received: from localhost ([::1]:56288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knMRv-0003Q1-HZ
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:57:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knLQF-000229-EH
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:51:51 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:33598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knLQD-0001Wm-Hy
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:51:51 -0500
Received: by mail-ed1-x532.google.com with SMTP id k4so5369179edl.0
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 04:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=ypiR7fzwu+wG2uRp8JrqBLJ8UoDRb/3rQXyVfP3ttoA=;
 b=EudD6YX/1s7gP7ThlTAEu39SyGQDbq2On9fgO7+XNqbpAwKWQtAE2v4DCdQrCnh+1O
 fSTgbt+0GKfq8ZdFATTThTJ8Fxv6UoMXZHkLgQjszpNP3f8QGU0A+/uixiPBJ/dbp6e7
 MwWQe7LsfRT8PFrjtpXQGCb2YQs1q+DRN4l1vkujZGFkJku84cBQ01TFjGEsz5ffX1uM
 w3LpI81MDAbylA8P8cynzjnW/qzEq/NVZvTwsv9nOFTIaUtPO/vpNIvjRo1uwEkBQXLo
 FYMBXkfxaBL+XNyco/ZM8LU1vIUcafTcYotjVzidaOroA+vGaHmCYlWxFW/zcBUwRJq8
 lt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=ypiR7fzwu+wG2uRp8JrqBLJ8UoDRb/3rQXyVfP3ttoA=;
 b=rnk84ze+b6x2XFtN1C4LKQQQKF/gUtPbuUJkubGxZ/PGtZcT5NMePpci5inUSWg5V1
 2ayKuhXLi+RBKkSCUIqxuroerTmSMEdJmdUuogM7sYkjvYEO+QcQKOHakN+vIMCWzxOi
 iBr+dj52SkYHwQHJ7WgYM1sI8RBK9frtzDJeWpOkP/s0sVQ/HUV1+a3A6pjsdlWKenOJ
 lYMJs+LovPHj41PL4Afw3j1OEyIna1KjtOusG6U/sSuOn+IxU4/nqAIOGprHlfNCX4zh
 ruvq/XQ8CJwfRjJZ1qZMLCelNmbYnHPqpuu6xMRZyYVRPDDOrzwMuZ/AsiepqVO802/h
 sMJg==
X-Gm-Message-State: AOAM53002v+ZddpYB5S8HnSbwWpqxjqBe+DBYdxjb7hdBIA6Y/OrFn6w
 fsQTolGcxIJ49sH4XlFM1H0Etn/rvgIJv5C54NGjMeT/NKI=
X-Google-Smtp-Source: ABdhPJzECdZP5kKFiCaDSXAwXDFYXpSqmbwQQLLURqIPNq9J8AtNAtKCbXfgTEtYsZiAblyUOL/IQI+2SCr6aneLeEw=
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr6533993edw.52.1607604707278;
 Thu, 10 Dec 2020 04:51:47 -0800 (PST)
MIME-Version: 1.0
References: <20201210114756.16501-1-peter.maydell@linaro.org>
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Dec 2020 12:51:36 +0000
Message-ID: <CAFEAcA-OKbhteQOFzFpyHOGeko6kA6XB7vecmZyJBDCz1xtoVw@mail.gmail.com>
Subject: Re: [PULL 00/36] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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

On Thu, 10 Dec 2020 at 11:47, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> First pullreq for 6.0: mostly my v8.1M work, plus some other
> bits and pieces. (I still have a lot of stuff in my to-review
> folder, which I may or may not get to before the Christmas break...)
>
> thanks
> -- PMM
>
> The following changes since commit 5e7b204dbfae9a562fc73684986f936b97f63877:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2020-12-09 20:08:54 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20201210
>
> for you to fetch changes up to 71f916be1c7e9ede0e37d9cabc781b5a9e8638ff:
>
>   hw/arm/armv7m: Correct typo in QOM object name (2020-12-10 11:44:56 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * hw/arm/smmuv3: Fix up L1STD_SPAN decoding
>  * xlnx-zynqmp: Support Xilinx ZynqMP CAN controllers
>  * sbsa-ref: allow to use Cortex-A53/57/72 cpus
>  * Various minor code cleanups
>  * hw/intc/armv7m_nvic: Make all of system PPB range be RAZWI/BusFault
>  * Implement more pieces of ARMv8.1M support


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

