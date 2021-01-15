Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BB72F7E1C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:26:34 +0100 (CET)
Received: from localhost ([::1]:48228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Q3d-00066v-D8
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:26:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0PnL-0002Ha-D6
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 09:09:43 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:37596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0PnJ-0006Ap-Q7
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 09:09:43 -0500
Received: by mail-yb1-xb32.google.com with SMTP id z1so5134251ybr.4
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 06:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PlOpRunRBhSLKMFlGLlUe8ZY/PG138mMLWT5rGv+Hb0=;
 b=hpAU9en2R42DuWS2V7fcpYWmpvw1cuqcHdtoSpNJU6HxLZ70rVtlV+J+mAisbGG11T
 CRsAi8eTelOb/Pyl3XCNqM+lYdZHEdut0Ejal7EaP9KicvmuNl0MvZKZsO5i8WvH1GFh
 WZ444wUAjTlPtocbxa0MXagSVhmy22rHqUSA0tsPtru2qtS/J839Byt22ZneCsTAtJdI
 /q0uyn24jr55X3/nI6YD6p4PP0XUuDiuAd/S+0vU9ItKzi3EpkuLq9OgtsIuWD2jyN3d
 oiA93F94WLx2W7eOXjLKASf+SDk2kxGiWSoHTfmD/y2i2h6ExuQLsF7aSrJzsDXCkty6
 1XaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PlOpRunRBhSLKMFlGLlUe8ZY/PG138mMLWT5rGv+Hb0=;
 b=exk63vFrKbYJ2FlrgmJ7pn5Z3b2n7HQSabCzfwliM20NZJ0YRo85wAMQkCsQ8xNW4I
 /mVh0WLOr7fF0sOoyq2hJ5HLqe7ZVSUgjVo98/D5DmdSf/2BKl3qGnLOvvtZ5W0G3EGw
 or4CJpF5uqhs2woE+YxqB4br8yyL0xcL4ZFGcLhortXglQ/WDRyZrI1B8P/d/RPELo5/
 hOEgqWAjCl4D9Kb9gAPzcQLS1gvRW9UFPKGEdC9ayjX7Hrdr449ursC+7dqRl6St5Oeo
 jjKAcLBIw8bFkPpQe51NjLBzNL4ijAO0Mcd7MyMwef+gY1roL+GteNaF9yftjYxoLqBi
 PBbQ==
X-Gm-Message-State: AOAM531cGQ8+3HR4MJqdxUlFDbEJ1tuQ20YjMje51P/g8oWROLU6oooR
 IvSfKWy829UfZ6pJbuUZ429nX6QKuzCwW4xTPaY=
X-Google-Smtp-Source: ABdhPJwtPebr9sBPLi/az3MEYMEhRJ9p8wiIJUIjTUqJCyn4LoT8Q6LoC/GxQJ3qZuZggtUMYEm/VkjcUoAR8Hjypoo=
X-Received: by 2002:a5b:5ce:: with SMTP id w14mr4857424ybp.314.1610719780454; 
 Fri, 15 Jan 2021 06:09:40 -0800 (PST)
MIME-Version: 1.0
References: <20201104092900.21214-1-green.wan@sifive.com>
 <CAFEAcA_EykbnmTQuz4RT3qGMt-Atf=EAdaHd-QqBvJCPvwemqA@mail.gmail.com>
 <CAEUhbmULDEgfs0zkt6k1DWo+AD4T701xDp5TCyjQHFypmr037g@mail.gmail.com>
 <CAFEAcA9QrTA6bEiK608HfB9vfN66SGBPJw6pEDDk2YH3v4M8SQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9QrTA6bEiK608HfB9vfN66SGBPJw6pEDDk2YH3v4M8SQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 15 Jan 2021 22:09:29 +0800
Message-ID: <CAEUhbmX4GtWfU1Z+cbSb435MCgBo+OaLbSg0qP_mRgPxSJRLnQ@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/sifive_u_otp: handling the fails of blk_pread and
 blk_pwrite
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Alistair Francis <alistair23@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Green Wan <green.wan@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 9:55 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 15 Jan 2021 at 13:33, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Fri, Jan 15, 2021 at 7:50 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > > Ping! This patch was trying to fix a Coverity issue (CID 1435959,
> > > 1435960, 1435961) -- is anybody planning to review it?
> > >
> > > (I'm not entirely sure 'guest error' is the right warning category,
> > > but I don't know the specifics of this device.)
> > >
> >
> > I think we should just use 'printf' instead of log a "guest error"
> > because the guest does nothing wrong.
>
> printf is definitely the wrong thing... you need to either report
> the error back to the guest if the interface the guest is using
> has a facility for reporting read/write failures, or log or report
> it to the user using one of our APIs for that.

It seems the hardware does not have a mechanism to report to the
software when hardware cannot fulfill the task requested by software.

I checked all existence of block_pwrite() callers. It looks like this
is not handled consistently. Some indeed call printf(), some call
error_setg_errno(), some call fprintf(stderr), some call qemu_log()
...

Regards,
Bin

