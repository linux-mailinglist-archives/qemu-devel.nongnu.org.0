Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6A641D491
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 09:33:16 +0200 (CEST)
Received: from localhost ([::1]:35940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVqZ9-0006PU-7L
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 03:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mborgerson@gmail.com>)
 id 1mVqX7-0005G5-SD
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 03:31:09 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d]:43805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mborgerson@gmail.com>)
 id 1mVqX5-0008Nj-Ug
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 03:31:09 -0400
Received: by mail-ua1-x92d.google.com with SMTP id 10so3485898uae.10
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 00:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uglwuAT98Kb8/QpNwv/caJmSV1CoolOnDQW9SFdYcSQ=;
 b=eed7MhKDG+BLI+NoYebAdTz98xgo1uNqFTHo1L9kBPbkdTX1FwZ6d2Yw2e4AkADfSS
 7qm2WOu2I+b6rjo0B7SsWDhyKCYWUmcPc9NLCxGjp0dGeUD9bxS5vSitcJnrg5UR11Gd
 8iuEIJjOsg+okk58g3rVcpUbhaZapMi6ySODD3uJvUP/egTdkMqSX4hQPALPAfEUGlM4
 WP6Ucac0c6D73J1X0bkbZ6QyJxBJxmXBFEkzOUyjHIwNe4zwrw4SRJdzlK32+KanqJ5j
 +qJ67gC4PSe8fdnjOMnOllCXpHNpbZn/4OyW1xaZDL6CWqIJVzlN8OWdIuy+bvaoU2NB
 vqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uglwuAT98Kb8/QpNwv/caJmSV1CoolOnDQW9SFdYcSQ=;
 b=2MksBF4lBofAfnG2vHqL5BetvMHE9O34psvKcoN5pfFxuJ2qLNXgfJ58A5cNX0zBFV
 XYJdYtLoW4/an5ZcCf/PUPEW8D3GN7PCbs6ChNFTQsGbOqlyBSjGJnwzHyB7X7fYSFZy
 fX+6PumQuFHG30PSP78vrXMwr+4qQlEieLTW+HuHt0dPN2qu9J0OGy+I1PmF6YZIP492
 fdtFYNG4nnMoAcr+vY+myX5rn7km5hEeIipuyQVFElwfzdBNJ+INFJj9jVqvyGpAVifm
 7gTCHTpEg7EtLW91Tc+WSLne3orfkxipaMtEHZcdSnD+q7BbivYjHKDbOhr9PrvxIE7k
 Y03w==
X-Gm-Message-State: AOAM533f+e+PGoLr9zht2VctAm1ZqrC22vkm+VjhuOO0uBaGVPHfQAKY
 6qRRZuGqJOWT9IF5U6pRORS94+PCRKi+9XUvQfbn94YQ
X-Google-Smtp-Source: ABdhPJxg9WvWGx5oBgZTNeyKE6lZzOq06mmA5mHtseA3bswUMyONKCTumwOAqVT7IuTGfwaScpXJzGGzcT7TYRsjOrs=
X-Received: by 2002:ab0:5bdc:: with SMTP id z28mr3984796uae.35.1632987066723; 
 Thu, 30 Sep 2021 00:31:06 -0700 (PDT)
MIME-Version: 1.0
References: <CADc=-s7RifpTSQ_6tYY4B4pze-wy6KprPo=J6Jvv0VVV3PU8DA@mail.gmail.com>
In-Reply-To: <CADc=-s7RifpTSQ_6tYY4B4pze-wy6KprPo=J6Jvv0VVV3PU8DA@mail.gmail.com>
From: Matt <mborgerson@gmail.com>
Date: Thu, 30 Sep 2021 00:30:55 -0700
Message-ID: <CADc=-s6R_R-5uW8sGUjNppxDeOg03WSQsiNeVY4wsmwb6wwJRA@mail.gmail.com>
Subject: Re: TCG Floating Point Support (Work in Progress)
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=mborgerson@gmail.com; helo=mail-ua1-x92d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clarification: In my previous message, I talked a lot about x87
emulation; I want to make clear that x87 is merely my motivator. The
eventual goal of this TCG FP support is not only to enable fast x87
emulation, but to be generic and robust enough that other QEMU targets
could be modified to utilize it for accelerated floating point
emulation, and be able to be implemented for various TCG targets where
possible, with x86-64 and AArch64 being my priorities.

Thanks,
Matt

On Wed, Sep 29, 2021 at 10:39 PM Matt <mborgerson@gmail.com> wrote:
>
> Hello--
>
> I'm excited to share that I have been developing support for TCG
> floating point operations; specifically, to accelerate emulation of
> x86 guest code which heavily exercises the x87 FPU for a game console
> emulator project based on QEMU. So far, this work has shown great
> promise, demonstrating some dramatic performance improvements in
> emulation of x87 heavy code.
>
> The feature works in concert with unaccelerated x87 FPU helpers, and
> also allows total soft float helper fallback if the user discovers
> some issue with the hard float implementation. For the TCG target,
> I've opted to implement it for x86-64 hosts using SSE2, although this
> could be extended to support full 80b double extended precision with
> host x87 support. I'm also in early development of an implementation
> for AArch64 hosts.
>
> There are still some significant tasks to be done, like proper
> handling of exception flags, edge cases, and testing, to name a few.
> Once in a slightly more mature state, I do think this feature would
> make a natural addition to upstream QEMU and plan to submit it for
> consideration.
>
> I'm writing to the mailing list now to inform FPU maintainers and any
> other interested parties that this work is happening, to solicit any
> early feedback, and to extend an invitation to anyone interested in
> collaborating to expedite its upstreaming.
>
> My initial TCG FP work can be found here:
> https://github.com/mborgerson/xemu/pull/464/commits
>
> Thanks,
> Matt

