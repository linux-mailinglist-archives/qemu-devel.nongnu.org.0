Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C55F4955CE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 22:11:46 +0100 (CET)
Received: from localhost ([::1]:35878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAeie-0007sA-Sv
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 16:11:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAa00-0007fp-3h
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 11:09:21 -0500
Received: from [2a00:1450:4864:20::329] (port=56149
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAZzy-0001HA-6E
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 11:09:19 -0500
Received: by mail-wm1-x329.google.com with SMTP id c66so13116013wma.5
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 08:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q/WHEW5E36JKzLBACM6CkARXwV2yFCuV8es/XmMhl/Q=;
 b=PyuuGfCyniSIzLadiQFnR6eF2oHtKh/T2tLuDVhv8akkZcJdWzww6y1nxlXT38z2gL
 LkZFWxWyGJonvcKrqd6iMOsBssFAHFk4u38+g55SB7Tl7jobDlH0+O9CtU2ORjOdlm9n
 ACh1SJI7Y5Ewl10cpXQsPS0nM1VASu1n3+3N6zTRbP4u/ZyEmZTneB83G2KgiCg71oDu
 RBnZ4+57SCefs+YcrXv+S2vvEdXokaIGQlH4+0gsvauaG7S0rfUJY4M8DvQVpoNH1kJu
 YflJAKFHO6qw++1HFgZZpOUwRJcshNE8764p2ZkoJ1KKi+M/ebwmCyJoP0Y0GuFYi/FY
 Pa7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q/WHEW5E36JKzLBACM6CkARXwV2yFCuV8es/XmMhl/Q=;
 b=bM8RSz8NILjUx4bdTk4ULDk0nmdq0BKb+poz9Mx3286A4q1VCGWrKTB371T0EaVvkR
 WKLcIfHuHxJfJ9wjW3OImpKTGZwejjdHwtLo5o9JTysEK30DOqRhjVHg54hfFKMPE8hX
 NdMl1b3oy+BZoOXCenuPW1jnz7YMHuc0zXqEbggnvNa+1zH6Q1DBJhjnG0JmsygwoDU2
 1rYN0v35yID1qNilOIpkbfBzUIsC7Ww9IkKaHlW+2vXMRr8oG6oG58Wiz9FZHWNBRJ4H
 k/bdK/HC9YUgKvMEDsB9P/GftEA7eQXQpn3jhvvtpJ7Zis4Swhu0Rc1hhDGlWr7XJZXR
 rF8A==
X-Gm-Message-State: AOAM533aX4lvUuqclM3FqvorhYuI47vay5aeEpYhEE4oWL/IkiGw2+Qf
 4rOci0p1zGwwYeZq9k6wqhwo4aEUg+/WiQ8hhGmjCg==
X-Google-Smtp-Source: ABdhPJwRrLv/AlQDm8FsHR/lgqSoDnPJPG2YzakNKHo3tvff+7RzDMzbmU/PBknLuRZVsGxtGXeOyjYEwrRZRE0KF2M=
X-Received: by 2002:a05:6000:1d87:: with SMTP id
 bk7mr2326805wrb.2.1642694956001; 
 Thu, 20 Jan 2022 08:09:16 -0800 (PST)
MIME-Version: 1.0
References: <20211208231154.392029-1-richard.henderson@linaro.org>
In-Reply-To: <20211208231154.392029-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jan 2022 16:09:05 +0000
Message-ID: <CAFEAcA9_mkk0aswR_fUOO+k1+rKrNqrTMzo9PO=Sn6qpsZKmRQ@mail.gmail.com>
Subject: Re: [PATCH for-7.0 0/6] target/arm: Implement LVA, LPA, LPA2 features
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 8 Dec 2021 at 23:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These features are all related and relatively small.
>
> Testing so far has been limited to booting a kernel
> with 64k pages and VA and PA set to 52 bits, which
> excercises LVA and LPA.
>
> There is not yet upstream support for LPA2, probably
> because it's an ARMv8.7 addition.



>  target/arm/cpu-param.h |   4 +-
>  target/arm/cpu.h       |  17 ++++
>  target/arm/internals.h |  22 +----
>  target/arm/cpu64.c     |   5 +-
>  target/arm/helper.c    | 211 ++++++++++++++++++++++++++++++++++-------
>  5 files changed, 204 insertions(+), 55 deletions(-)

I'd forgotten about this document too until a conversation today
brought it to mind, but when adding new feature support please
also update the list of supported emulated features in
docs/system/arm/emulation.rst

thanks
-- PMM

