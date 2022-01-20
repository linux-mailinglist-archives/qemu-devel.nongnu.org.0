Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0510D4954D0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 20:18:05 +0100 (CET)
Received: from localhost ([::1]:55394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAcwd-0006LY-T8
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 14:18:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAYFg-0002LB-9h
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 09:17:25 -0500
Received: from [2a00:1450:4864:20::32d] (port=43950
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAYFL-0001nm-Cu
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 09:17:09 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 e9-20020a05600c4e4900b0034d23cae3f0so14112642wmq.2
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 06:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RgRyEsErmpFPfkH/P7s/6kF8LwjDTQUfQLuqwdBKRm0=;
 b=jF898bbQHaSZSD22iFNWelpnu2fw3+Edm2ch8RUTvGNV/gb+Q5mqMb04ExO+Fk8oDh
 ro8Ul1Kqie2eaVIh1Iug+bDwXqG/YOM2IyGzkdLYIAlE+CnnqTvHU4REWG22X+/3vTP9
 8Ra5JOpcObQcO0HVxZpUK/PXkWGatga65YAZKpfT3NI7IJh0oaYVagqQ1fg8WmI/p5BM
 z9yUJ+FZEtbSJL6TwXf+c/q/4NRricx/PxyAUDPwBHBIMQnw260nHKAWEcrPoZVUE9FH
 4XwYMmbURbwk3kTezamLp6IugEFMNhIcveBIIRTRKCKCy2vEdTsrB8dbVAskOd+ulF41
 2+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RgRyEsErmpFPfkH/P7s/6kF8LwjDTQUfQLuqwdBKRm0=;
 b=tfL56tKAF00kmE4VjT44fJ4cM+ZV+LgSqMhwiz1h3qlzQKPUy5U4SlqfuaoH5w5U2h
 VsbSYzjK/pF3XEzMuxFhjA0srhy3xTdfi/a5RipTL+uwFtgiZKAD8/iaUSyCIM1JA3D9
 FgIDARt4wodNDEZnlxnX1jBxJsvFvwuEaopmwmE1SUs9c447uvns7ksTyPZ2GhHOIrYm
 6j1tm7OTEi1s1T4wdLBS/fdSctqfQeC/E/Ppw6JDtkQoZjcnO1id8zlUOi1ROEdkQex4
 TA5uL9ZmHsng9MH6hwejYcA2rxv3+wJDxbVD9VWw/nE9ki9vvyZ/tYRyV8jwD9WOgL6+
 u9Cw==
X-Gm-Message-State: AOAM5305qTmQwwwlq7UrcS83nc2EyO+yac+Xa00x/p7CitsVRvW7Q8zl
 hdcrDf/NmG2HBQenbmRT9gviD4AGpyG2kEHMp6ClaA==
X-Google-Smtp-Source: ABdhPJzUoiM2/gabXxwxjjsW/EmaCFVKFOXar6af2xDaL3V2buLXUZ9HDuWi1v1uiNs/Fcn7vNLkDfvVILv2hRkyWcY=
X-Received: by 2002:adf:bb52:: with SMTP id x18mr3930484wrg.319.1642688216176; 
 Thu, 20 Jan 2022 06:16:56 -0800 (PST)
MIME-Version: 1.0
References: <20220114004033.295199-1-idan.horowitz@gmail.com>
 <CAFEAcA96gKH8r_a2aV0bfcOR418WnRkmEsV73Uss0kDEQ2Tx4w@mail.gmail.com>
 <CA+4MfE+nh4LRAbmT2GnNiZWTU=xfmkReNWWTgOhqWLddXdV_hQ@mail.gmail.com>
 <CAFEAcA-MnRazq5GNZSbK_a_LmF3F4dcaJWadR9ni6JeS9wPhug@mail.gmail.com>
 <CA+4MfE+EGpnXn5WHwCgT+-bE7u7ZOdNqK2bjenuheoskFZqSMw@mail.gmail.com>
In-Reply-To: <CA+4MfE+EGpnXn5WHwCgT+-bE7u7ZOdNqK2bjenuheoskFZqSMw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jan 2022 14:16:45 +0000
Message-ID: <CAFEAcA-Vdhh-soGuQfUh0kB0SJovKa9BPbHSRC6wHsU8gDczTA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Allow only specific instructions based on the
 SCTLR_EL1.UCI bit
To: Idan Horowitz <idan.horowitz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 20 Jan 2022 at 13:25, Idan Horowitz <idan.horowitz@gmail.com> wrote:
>
> On Thu, 20 Jan 2022 at 14:32, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> >
> > But the code you are effectively removing is never executed
> > for the instructions where you're changing the access function.
> > If you're proposing this as a performance improvement, can
> > you provide before-and-after benchmarks demonstrating that
> > improvement ?
> >
>
> I wanted to say that in my micro-benchmark of DC IVAC I saw a 1%
> decrease in runtime, but I failed to replicate it again now, so I must
> have accidentally ran it together with one of my other patches last
> time.
> Sorry for wasting your time with the review.

No worries.

Incidentally, it's not surprising that if you microbenchmark
the cache instructions the trap-checking appears as a large
component of it -- for QEMU cache ops are NOPs so trap checking
is the *only* thing that the instruction has to do. It's probably
worth looking at benchmarks of real workloads to try to identify
whether any particular instruction is a significant component
before spending much time on trying to improve its performance.

-- PMM

