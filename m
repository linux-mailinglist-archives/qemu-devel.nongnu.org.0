Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B29CB40111C
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 20:14:25 +0200 (CEST)
Received: from localhost ([::1]:39090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMweu-0007Sf-OF
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 14:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMwe0-0006lz-QV
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 14:13:28 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:37882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMwdz-0007DF-3S
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 14:13:28 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso3353143wmb.2
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 11:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zgGrHeLSD09tq2tqoVdwArMEXdFKGo42NtBdBREhS4o=;
 b=t/dGou+4NzQVnX8EC7Xii5OhSqxn2jtpn5RfAXCPMdKcTWJJKyI1Iv8vvQoM61e1Pv
 HSLxdDbcI2qXStlEbjiqXnvmrH8is6snzDG6+GMI524qoY3AJLhLVsVy6B5qHi01ev+M
 KzyPExzUQgLstSxNLYAAn2U+v+hIKuO5CcbtGjFi3XerRYwFMSA9YDunzwQPQEL5bu4G
 ESmGsrcJpKD8yhUJwhOP6TRHI10XRorK1GjdMYtj+bb3Qyb2t9EDtrzkYvj34KPFvjKR
 P0GhsQ/esZPJ7lLuvuMRqzWKeOzj6t+gvVsFQWCmXqdF3+o8HWtav8ja7X5GqUEwuADn
 6IYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zgGrHeLSD09tq2tqoVdwArMEXdFKGo42NtBdBREhS4o=;
 b=Cxpnk4ylaMZWKqOFh0w7r1N9OmJ/sbIYBkIg/OZrNJ+LC+rexUfz2dnEesF4k1rMDd
 W1Hh5gAUAYfomAtBg5yeH5iz7uc8SIalWaRAPcADO2nz0PTNIfDs2k9l/TqRByvHt7/g
 78llyMMlJgf5Jh2bZwcfBCpGXTek2cDEy/OkcNUzzvwo0d5VOBSRc2yEfRwTmeZx0eQD
 e77gIWJqeh/6OOHr78Da2pylvInBxkiRzhcZHwuB5nAebMrOdXpPzz8lQ2DjbrOVDEgn
 86O+mlLkZAlsArxIu0rsek/YTzFW3wyCND9IobsxI57Rji3dB3m9YC/BZuUnWvKqcraT
 gd+g==
X-Gm-Message-State: AOAM533WBibNQzD5NT8CrZrOmNp/lI7QnrEh5Cu0x48NHpKDRMlnWbBf
 mb5JW5BZblHF7MnVDPT7DbSRAKGjCt1cnSzCYuK4/w==
X-Google-Smtp-Source: ABdhPJwpHDQ8hpluW3Af+SujFO+qRHZE7UDkXDCnlyHJPlpLNDadOq0r+og3805kL/oBFK8UizjBY5DdWSed8ckJgRc=
X-Received: by 2002:a7b:c246:: with SMTP id b6mr7971276wmj.37.1630865604816;
 Sun, 05 Sep 2021 11:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210905154049.7992-1-bmeng.cn@gmail.com>
 <CAFEAcA8frUy2wmQjj=Bk_GGT9O=qHzb5pjSFupc7SaEyDUvYZg@mail.gmail.com>
 <CAEUhbmVjuYhk=Ebh6VeaPtC816Dssys3g8+dwMo5rv4yHMeHSg@mail.gmail.com>
 <CAFEAcA9JDN-bGSyjqauKsjJH43TUwk7YTSN0mSvPg9obd9yCUw@mail.gmail.com>
 <CAEUhbmWh=8MntXf=TJr8g8FPB2oQJfGhw7Kqs+Tb_ZqpmXUthg@mail.gmail.com>
In-Reply-To: <CAEUhbmWh=8MntXf=TJr8g8FPB2oQJfGhw7Kqs+Tb_ZqpmXUthg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 5 Sep 2021 19:12:35 +0100
Message-ID: <CAFEAcA8x2rnFXao1z-751hvZ=oQWNxKm0APzwpSJA1wfxhsLSg@mail.gmail.com>
Subject: Re: [PATCH] softmmu/memory: Validate {read,
 write}_with_attrs before calling
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 5 Sept 2021 at 18:07, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Mon, Sep 6, 2021 at 12:54 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> > I mean that before commit 62a0db942dec leaving the pointers all
> > NULL was not allowed, and after that commit leaving the pointers all
> > NULL was still not allowed. It's been a requirement that you
> > provide at least one function pointer for read and one for
> > write ever since the MemoryRegion APIs were introduced in 2012.
> > You're proposing an API change; it might be a good one, but it
> > isn't a 'Fixes' to anything.
>
> Where is the requirement documented? I don't see anything mentioned in
> docs/devel/memory.rst

It's not documented, but lots of fiddly details of QEMU functions
aren't documented...

> If it's a requirement since 2012, then I agree "Fixes" can be dropped.
> But a doc fix should be made to document the "requirement".

Agreed.

-- PMM

