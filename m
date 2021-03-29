Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6475D34D872
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 21:43:35 +0200 (CEST)
Received: from localhost ([::1]:33432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQxnS-0005J4-15
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 15:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lQxlu-00049E-Q7
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 15:42:00 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:38736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lQxls-0005H7-Qw
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 15:41:58 -0400
Received: by mail-ej1-x62c.google.com with SMTP id r12so21260259ejr.5
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 12:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LNwciN1+aKLrfAajIeX8oyDJ4fRN7O1tEYVPKp96JTU=;
 b=JebqtA6n0mG+MR0mx55xMpdLlg48O7eh2STrYuDILb8Z8OYveDo/4LmB43bLCzO746
 +5/8i7PfhJo8y66NoIqsdQZYLdwGUSERrZ30x+L7fQzHBE1L7X2B6VqjevHtDkF+WwAE
 NlUanZih8N+tOmHLPhFJ71R79cQ+pNY55VLwZRh6f1cz/Fp8hXEWQwSewCUMua8/YBIq
 fRgEyO5ps9QegstpWuKrQV8VBPJoecHBGlpVbLRoEe88VhOYxGZC3yDS1MkIkz9P+k2/
 gGbQMAb2FasCkHgUoiuELj3+KYq9WoXylS60kRrgABmWX+WRCwrI+YAb9HpqxWlptQBq
 y5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LNwciN1+aKLrfAajIeX8oyDJ4fRN7O1tEYVPKp96JTU=;
 b=bbocuSSTV5YnAq2i2W3Lqv/9PyQwpe+vDgO6eFy7cFN9kmY84OHzblKKUc0Lhmyw7h
 WwVG3lqyLx7VVQTHzrFk0R9AaW/QkxtlrTH1AWYKYeFpBTkR3Q9e0Xs03I6Y3LDZIYLK
 swmkyJKHoC+mEqV2er2MpUsGt0x+/+3OT1zAuNfdS34a5DqVp0Mey5X1gCqXB9THr4YG
 1+x9+fOi/lEa1KX273oauqh7INNSA9gdDymHFjakj/JuIua5S6pTQPeXofpQty4V3iuZ
 nHsewzmWZFKsnIBcC1oZkdpzPeP/9tw8VjnixnuTI60bl1kSZhd+oNX6Yq5t4u1JoqsC
 2gKA==
X-Gm-Message-State: AOAM5325j9OGPeEHD6szWQG3J7VJ5u/uOwleemU2gU8f07UnSWOfaoiu
 TJ9zskwiJYaxNpVspGsO8uhFFLPIzBiTPzl74BjBUA==
X-Google-Smtp-Source: ABdhPJxWJO2Uv9tI4iJCeNNkMldIGTiuNbrnyUesdunReGr7gRstV/EjgM3FksR6BGNwGI2LBvxiKhPDhEOH/IHjt9U=
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr29332463ejz.382.1617046915270; 
 Mon, 29 Mar 2021 12:41:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAKqicRBsCxFY=A=RD6kHaZa7bFag+hmUkwAJc-LSYy8XvsbGPg@mail.gmail.com>
 <889B1827-1FEB-4AC0-9002-278337D19ED5@citrix.com>
 <CAKqicRCiahd5bt1Qo=Mdh4DYRQbGWf410gF=CG51J9AD=4YwmA@mail.gmail.com>
In-Reply-To: <CAKqicRCiahd5bt1Qo=Mdh4DYRQbGWf410gF=CG51J9AD=4YwmA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Mar 2021 19:41:24 +0000
Message-ID: <CAFEAcA-bYZnxwCtOJxoDWsMxtjPqgc5n6Mq8Z5gbjDCqi6t_Hg@mail.gmail.com>
Subject: Re: An error due to installation that require binutils package
To: John Simpson <ttr9droid@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: "gcc-help@gcc.gnu.org" <gcc-help@gcc.gnu.org>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Community Manager <community.manager@xenproject.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 George Dunlap <George.Dunlap@citrix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 29 Mar 2021 at 20:20, John Simpson <ttr9droid@gmail.com> wrote:
>
> Hello,
>
> Kindly ask you to have a look at this bug.
> Thank you for your replies.

>> > On Sun, Mar 28, 2021 at 12:55:23PM +0300, John Simpson via Binutils wrote:
>> > >   BUILD   pc-bios/optionrom/kvmvapic.img
>> > > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)

This is a known issue when trying to compile with newer binutils,
fixed in QEMU commit bbd2d5a8120771, which will be in 5.2.1 and 6.0.

thanks
-- PMM

