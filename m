Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A78C32DA62
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 20:30:27 +0100 (CET)
Received: from localhost ([::1]:32840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHtg2-00051A-CP
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 14:30:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lHteV-000421-G0
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 14:28:53 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:39116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lHteR-0001r8-MX
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 14:28:51 -0500
Received: by mail-ed1-x530.google.com with SMTP id h10so36387157edl.6
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 11:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KwJAPoKl3SYf3zrzot/xlP7HZPeG50bVh9ZpNeHTlXk=;
 b=MastUhiSlu87UCnKxRKyi/B1r5HFN3B99nH/5g8X5gehLiNfaprzBz+Wrqu3ICF23V
 Yt/jGRSWytD6oZE7bOJot/PCNrowfpfR4F4FhOXl6e+yjWj3v9UOUp3r4Phmo6tx5/7m
 qSK+R4QCXHtueWJBl0rb8cebUVde0If8JLg9ypkcLJExvigs0uMsS9WA0sXlDmFWaJs7
 ou4qbQcByB9Y7FclGOjEpglF+lzxogDLznLqFsn9W5oIvSNqxzou93MyzxNpFWvmPHpX
 woHRb3iNiab3t+WPvmFYNMu0v19C58CujyXnOy3wMylxgppIZGqKSGnLvDaT7u21ATCu
 dOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KwJAPoKl3SYf3zrzot/xlP7HZPeG50bVh9ZpNeHTlXk=;
 b=LzImxbzwNFpThFwTIPpItMqJQXFKoCoLEczgkxN1wLRRSGrRqrb6kVnk5S0pzecfuD
 Upfh6czAkP33QzCJymqlVTkWRC1kxbv3S1He8Xb9O/HvAn2eL8DRUpFdKEjFISdc8s/O
 vwVI0Ok2rmVgHR7sJU7Za7n6ttsS9iSmYWf+xPcUKM+uXHjUdL9Nfo4DLuM/3G8+ouQw
 iyE/mzG3mEZaVRovg0xfBjuSKAIKBB2gYk7cUrx7r5XqzWOm9sToAhKxC9R+mKYRUWfW
 thvqM2qotQvogo9VjAHLy45i2R3Q0ooWnYCEHKcZTGRlE4mGW/SGT9/MqkEdx/7E/aI+
 PvmQ==
X-Gm-Message-State: AOAM530MhitqTafOzDKi+P8W8CKJ/Q2MeXxdnrj5W9zmYpFBn2AfjIHU
 w9DCRn324qQp0tWkP84BcKRUbNrUK0360Vb4lgZvWhHQHJrTPw==
X-Google-Smtp-Source: ABdhPJzTnOhsfqg3U04rHj/t2OytLqY08hOlf1J+mwUxJBiUiXnsx9NdWY26UiZLIHP6fUnPK038ilDvSV6kIj5LJas=
X-Received: by 2002:aa7:c3cd:: with SMTP id l13mr6153236edr.52.1614886126269; 
 Thu, 04 Mar 2021 11:28:46 -0800 (PST)
MIME-Version: 1.0
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-8-peter.maydell@linaro.org>
 <0f167565-0af3-ee18-4f16-ec0a8aab12f9@linaro.org>
 <68619933-adfd-2240-8910-2d8e6e0ef6f9@linaro.org>
In-Reply-To: <68619933-adfd-2240-8910-2d8e6e0ef6f9@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Mar 2021 19:28:30 +0000
Message-ID: <CAFEAcA-JBnqJGqHnBpsU=f68p3WJbiCgatirG+je3=z5k-42_w@mail.gmail.com>
Subject: Re: [PATCH 07/44] hw/misc/iotkit-secctl.c: Implement SSE-300 PID
 register values
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 4 Mar 2021 at 17:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/4/21 9:29 AM, Richard Henderson wrote:
> > On 2/19/21 6:45 AM, Peter Maydell wrote:
> >> The versions of the Secure Access Configuration Register Block
> >> and Non-secure Access Configuration Register Block in the SSE-300
> >> are the same as those in the SSE-200, but the CIDR/PIDR ID
> >> register values are different.
> >>
> >> Plumb through the sse-version property and use it to select
> >> the correct ID register values.
> >>
> >> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> >> ---
> >>   include/hw/misc/iotkit-secctl.h |  2 ++
> >>   hw/arm/armsse.c                 |  2 ++
> >>   hw/misc/iotkit-secctl.c         | 50 +++++++++++++++++++++++++++++++--
> >>   3 files changed, 52 insertions(+), 2 deletions(-)
> >
> > Which document am I looking for here?  I found DAI 0547B "Application Note
> > AN547", but I don't see these register definitions.
>
> I finally found the sse-300 subsystem trm: 101773_0000_02_en.

https://developer.arm.com/documentation/101773/latest/

The URL does turn up in this patchset, but not til patch 42 :-/

thanks
-- PMM

