Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D593630D6F7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 11:03:31 +0100 (CET)
Received: from localhost ([::1]:53370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7F0U-0008Hw-WB
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 05:03:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7Eyg-00079b-MN
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:01:38 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:36344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7EyY-0004yk-H0
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:01:38 -0500
Received: by mail-ed1-x533.google.com with SMTP id d2so26102010edz.3
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 02:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yVN67/CVCcSB08v8YolYJewiXoCyJXX5eHlBBMEPeRQ=;
 b=u3Y75tHajotr+yL1M/hq4POCzIUfufVz21nGn2s4GTuIdeEXEKBr+DptDfeiiRnkX0
 NFdZTK8ooDxONypnHBDaPFnX9rEbGGEUenEFhsYzJPYzmbcTHVXfVF9SESraFt9iJg98
 KI1oRTzvm6jl5rZaxWaNGUydmXTmEIQDhCJtXzE52j7+8OmY/TcLefEIpxsbLJ6raglR
 va+oJb2N0bGiv23XcEeSZdYdPcd6aVDb1z9+vDCQT8cCekpFj87zcCGgtzQb1Iyd7F8R
 ciorvdJ+luiG2ANlQOeH9Dho2uiOBjHj22rC49KYZoVWJvOSY04DYgNOtC+vFX0qm8IT
 /x0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yVN67/CVCcSB08v8YolYJewiXoCyJXX5eHlBBMEPeRQ=;
 b=rzTo78h9HfnE1h45T8rnsf2K7ASmvktYLb0GXdqntiNdJsObn3sGtB3c3R/b7QClhi
 Wupi6m7RKmhR6kMd/FaaftNRV67Urw4iBCDXemYMnhB7T5e29YKco5RE+pv7kMDoISyQ
 sdsqDM9HJi83SC9OpGAhNRrJ18q12dOBk7AMCQW3CmxxvdjipLhVU6V5AcpCPjhKnxY9
 K9c1Ck6OrQcJIKUgApX9dWUdJwLmFzhX3G/TuV/8uLcwqpi809+86d7r1DBYsYBAbq8/
 e+70wfIYuix07gVvY82UZs7ueOPiYDk3Z/vTDcs0pI0K7U4Vrmi5oNxpA2oZK/TkITHF
 kUUw==
X-Gm-Message-State: AOAM532FY1NxiE48S09CTns1MZuY1SnoQLj/QjIy9+y2fr7y141dG9ij
 cpaTiYZEMpKYqjPJPao+eSyvO9XEcrGs9JXGMYUW0w==
X-Google-Smtp-Source: ABdhPJxANdvjzMnIK7QAgATeAGYEUM5nNkEOjV10DH538+ZFUlQJY+boXrlzcbl3SqdKh2eJRvSa5EtEpYRfD0v0dWY=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr2131639edd.52.1612346488324; 
 Wed, 03 Feb 2021 02:01:28 -0800 (PST)
MIME-Version: 1.0
References: <YBogDGJRU5pcDKmi@strawberry.localdomain>
In-Reply-To: <YBogDGJRU5pcDKmi@strawberry.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Feb 2021 10:01:17 +0000
Message-ID: <CAFEAcA-_N2CiNtjPi3hnk285Xdy3RuL8dY8QFhF0TnCydng6yA@mail.gmail.com>
Subject: Re: ARM Snapshots Not Backwards-Compatible
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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

On Wed, 3 Feb 2021 at 04:01, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>
> Hello,
>
> I'm attempting to restore an AArch64 snapshot taken on QEMU 4.1.0 on
> QEMU 5.2.0, using system mode. My previous impression, possibly from
> https://wiki.qemu.org/Features/Migration/Troubleshooting#Basics was that
> this ought to work:
>
> > Note that QEMU supports migrating forward between QEMU versions
>
> Note that I'm using qemu-system-aarch64 with -loadvm.

You don't say what machine type and command line you're using. Strictly,
Strictly speaking, the intended guarantee only covers versioned
machines, eg "virt-4.1" on QEMU 4.1 to "virt-4.1" on QEMU 5.2.

> The third is that meanings of the bits in env->features (as defined by
> `enum arm_features` in target/arm/cpu.h) has shifted. For example,
> ARM_FEATURE_PXN, ARM_FEATURE_CRC, ARM_FEATURE_VFP, ARM_FEATURE_VFP3,
> ARM_FEATURE_VFP4 have all been removed and ARM_FEATURE_V8_1M has been
> added since 4.1.0. Heck, even I have added a field there in the past.
> Unfortunately, these additions/removals mean that when env->features is
> saved on one version and restored on another the bits can mean different
> things. Notably, the removal of the *VFP features means that a snapshot
> of a CPU reporting it supports ARM_FEATURE_VFP3 on 4.1.0 thinks it's now
> ARM_FEATURE_M on 5.2.0!

Ow. I didn't realize the env->features was in the migration state :-(
There is no reason for it to be, because it's a constant property
of the CPU. The easy fix is to replace
       VMSTATE_UINT64(env.features, ARMCPU),
in target/arm/machine.c with whatever the syntax is for "ignore
64 bits of data here". Then we'll ignore whatever is coming in
from the source, which we don't need, and we'll stop sending it
out if we're the destination.

thanks
-- PMM

