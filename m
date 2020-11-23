Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9C02C1152
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 18:06:24 +0100 (CET)
Received: from localhost ([::1]:52934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khFIF-0003uT-1V
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 12:06:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khFGA-0002Xp-Ny
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 12:04:14 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:38100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khFG7-0003oT-Sc
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 12:04:14 -0500
Received: by mail-ej1-x62a.google.com with SMTP id a16so24367401ejj.5
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 09:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=GW+zT48ECPsFS8XBnNf1GqNycHssqaXGK1E6yUmHOpU=;
 b=L8+0C4/0lBtqxQ8aFdVgQ7KT9BYH1jD0pX9frHlJ0g8aXSsPTn6PFlfY0heuxRxagr
 b4gYK6pOdNIw6jYW8aJAHg9vqyg4CUdP1sTaKcpONiAKcTVM9Ah9zgsK97IzNZE8PHAo
 Dy7ovMzj8wMWkFv1lgeIxuQD5VPJ1d7KGnnX0+JZCHLIm5l0CdAPnK2y+JA21S/nWIFN
 4/fx0H8thB/NF64T2lMecPCObQl6BgjhV81GRwG7zCzsFWt7MmhYpyat0DwIwBa26Pzg
 b8Yl7wlRTR98Z7SiN7MPI60tP3SP/coOMPfBJsbhRsbB3uBCbziQZQ9h1RoUMMVpVTkr
 DaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=GW+zT48ECPsFS8XBnNf1GqNycHssqaXGK1E6yUmHOpU=;
 b=gRqzHmZejmgGfYMS/aWtjf4a/K+m/khQcnp+0qHgCUObqLYR9UAt0wgKKu3wUf0Gj9
 y+2ZM05ZCvaJOr+WdKGvRbV9kU2QL/P86/xEIQfgWNtAOZOteSHrZELilfPR8RLJD2LP
 NilNmNgcKSG1lsG8f6MlDZ630lDeTyWDaLFBqAILz6GSYvZEROEyiihRl1+2vR5IsOAM
 cS6ieF8/4g6LzIynZHSw3bhcFCWJOnXpk7fxQg+se4aJbtXyFIQVmisRNr6+DwVUHSJP
 C5RrW8nDokutv9+b/P5S15ANTWU5aqqkPtKDzh3ie5fFVV2OIqIC/c7yINWmmFAkxQsK
 VTpw==
X-Gm-Message-State: AOAM532T9Fhl4PQKRpiLOkefI47t2hkxqVXEmqYbFc206blJ8CGO6zdc
 LEQNgukpsislH7TWzK/eI0n/Mx0un/M2Le8Ky3+bip6V0xQ=
X-Google-Smtp-Source: ABdhPJylSyOM0NGA2Wt17csKQn4FYiUfeisZ2s7SMVQ2b+cBCRaqUMI17UY5wrWGcd6iGDYbSAd0H2wgNNhPAK5GGvE=
X-Received: by 2002:a17:906:6896:: with SMTP id
 n22mr567445ejr.56.1606151049480; 
 Mon, 23 Nov 2020 09:04:09 -0800 (PST)
MIME-Version: 1.0
References: <20201123114315.13372-1-peter.maydell@linaro.org>
In-Reply-To: <20201123114315.13372-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Nov 2020 17:03:57 +0000
Message-ID: <CAFEAcA9Q5EKPiWKhsBhSp+72YdyF3Jk6nCryB1U0mnAjtxWZ3Q@mail.gmail.com>
Subject: Re: [PULL 00/24] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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

On Mon, 23 Nov 2020 at 11:43, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> A big pullreq by number of patches, but most of them are just docs
> updates or MAINTAINERS file fixes. The actual code changes are pretty
> minimal bugfixes.
>
> thanks
> -- PMM
>
> The following changes since commit 8cc30eb1400fc01f2b139cdd3dc524f8b84dbe07:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-sparc-20201122' into staging (2020-11-22 15:02:52 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20201123
>
> for you to fetch changes up to c6ff78563ad2971f289168c7cae6ecb0b4359516:
>
>   docs/system/pr-manager.rst: Fix minor docs nits (2020-11-23 11:10:04 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * incorporate 'orphan' rST docs into manuals
>  * linux-user/arm: Deliver SIGTRAP for UDF patterns used as breakpoints
>  * target/arm: Make SYS_HEAPINFO work with RAM that doesn't start at 0
>  * document raspi boards and tosa
>  * docs/system: Deprecate raspi2/raspi3 machine aliases
>  * docs/system/arm: Document OpenPOWER Witherspoon BMC model Front LEDs
>  * MAINTAINERS: add lines for docs files for Arm boards
>  * hw/intc: fix heap-buffer-overflow in rxicu_realize()
>  * hw/arm: Fix bad print format specifiers
>  * target/arm: fix stage 2 page-walks in 32-bit emulation
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

