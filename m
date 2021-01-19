Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD932FB68C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 14:58:34 +0100 (CET)
Received: from localhost ([::1]:50370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1rWh-0005Db-Ld
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 08:58:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1rSM-0001Ey-VI
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:54:03 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:33943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1rSL-0005ki-32
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:54:02 -0500
Received: by mail-ej1-x62e.google.com with SMTP id hs11so26269795ejc.1
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 05:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dwcOo5I8i9D7jyhtNQQGFi72Mf09BQ6iVKlC93ntk4U=;
 b=n2wTgtnD2ifVLtGvzr6G10jos1noqN6DmcXGTCKDAnP/7n8xtWEwGkIYycMLYKaHF3
 cMbvI5PlP9c9yuVt616JslmL60oxIeK1htD1AsMyyn92Jugw9TPMLDz62PlidBgQYM+B
 +qD5kv/Nr1D+OymUfrXJY0kJ4pS2PJBgeBmHinbdXc2F+7hXUhZRZuVO0pVvWWa1xy24
 RwBYxifbIzpv3sFmhmgsO+RuNY3atJS4lsKC6hCyyOT7AGPl3UoR3NpXqCgSQRrdcYfG
 GWBt/nEiW3SW08grvUAqyGU/w1xLsC8D/Mb1m2j62IzvZAQtBv4Srwtw1iLj8kHRZfAN
 8EjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dwcOo5I8i9D7jyhtNQQGFi72Mf09BQ6iVKlC93ntk4U=;
 b=Ki3hRhfht6nT7zRL0892jEK4TGLefEdOwvaMXg7Dcs3WvGE0bvMvT8pGjmarMwibg9
 d5A6lpzXGJvPuMPi1EvfuRVXUBMyxpDVRxgZjI6Hvsrb1ooLCqWophJ4oJ5IuDBzMy2n
 Q9OUSZxGlkh+cIOIUY1iCXIC4Iiu74K28iwR/OVMihKjtXgn03+S2qAZ+E4FSxY6eUzJ
 c1fkaqtyW45hKy+1D6SZWmK27lnf9bwHL+/mLVtmSn4mgllXHeKrBzcMnG7QlLO6+aYr
 4UqCbg7eynOfGvF+pCDbxrcW4DYD5AazFbH0o6YS3g6mgPvXnhpg4YQLDPN09Gx4Heop
 u7NA==
X-Gm-Message-State: AOAM532tfP1SLle2yMiKRcvrUhUQ5HAaIVxYQ1clfMNbQ/0FWD8hYi4o
 SjzyUaXdc7rK7YLZL4yO6Ta6LIFI/QAhBswvWmvyqlNsEEs=
X-Google-Smtp-Source: ABdhPJxxfKUR8/lHoHC6Ot7CROdBuqi+zaLmhS8rQDREJm3dicR6TPYggincONlKDxv/AaEGQXYfULAjWogbfrJt23M=
X-Received: by 2002:a17:906:4bc2:: with SMTP id x2mr2993866ejv.4.1611064439776; 
 Tue, 19 Jan 2021 05:53:59 -0800 (PST)
MIME-Version: 1.0
References: <20210119083617.6337-1-huth@tuxfamily.org>
In-Reply-To: <20210119083617.6337-1-huth@tuxfamily.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 13:53:48 +0000
Message-ID: <CAFEAcA-k=g2KetBTSO=4zFdZYEyxRiVX6fdivZfQ8gVJp4Jnmg@mail.gmail.com>
Subject: Re: [PULL 00/11] m68k next-cube patches
To: Thomas Huth <huth@tuxfamily.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Jan 2021 at 08:36, Thomas Huth <huth@tuxfamily.org> wrote:
>
>  Hi Peter,
>
> the following changes since commit e43d564fa3a0d1e133935c8180ad4f4ccf699f33:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6.0-pull-request' into staging (2021-01-18 15:19:06 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/huth/qemu.git tags/pull-request-2021-01-19
>
> for you to fetch changes up to 41da32471183d7ca4756ad3ed8bb11c1d0c37a32:
>
>   hw/m68k/next-cube: Add missing header comment to next-cube.h (2021-01-19 09:11:52 +0100)
>
> ----------------------------------------------------------------
> * Refactor next-cube interrupt and register handling into a proper QOM device
> ----------------------------------------------------------------
>
> Peter Maydell (11):
>       hw/m68k/next-cube: Make next_irq() function static
>       hw/m68k/next-cube: Move register/interrupt functionality into a device
>       hw/m68k/next-cube: Move mmio_ops into NeXTPC device
>       hw/m68k/next-cube: Move scr_ops into NeXTPC device
>       hw/m68k/next-cube: Make next_irq take NeXTPC* as its opaque
>       hw/m68k/next-cube: Move int_status and int_mask to NeXTPC struct
>       hw/m68k/next-cube: Make next_irq GPIO inputs to NEXT_PC device
>       hw/m68k/next-cube: Move rtc into NeXTPC struct
>       hw/m68k/next-cube: Remove unused fields from NeXTState
>       hw/m68k/next-cube: Add vmstate for NeXTPC device
>       hw/m68k/next-cube: Add missing header comment to next-cube.h


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

