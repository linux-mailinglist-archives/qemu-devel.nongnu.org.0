Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D6E69E506
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 17:45:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUVkK-00070t-CI; Tue, 21 Feb 2023 11:44:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUVkI-00070O-Pc
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 11:44:02 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUVkG-0007j0-Pu
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 11:44:02 -0500
Received: by mail-pf1-x42a.google.com with SMTP id f11so2915820pfe.2
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 08:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676997839;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jjdSKPp9FxkPWOd21Y9/AorZCY0zNQLE4fvgnvwAo20=;
 b=GqIW6HyaFX0Pbuut2kStDzPM7zb7/6MdDLitbI9igHXwMlExTCa7E/HxQG08CKMI19
 Ygxcm6vfCC5qyjDmyOhVQhCreqhjDGKIKBVV3cZYNZhcHC9ryfeMW0SOT4fkVJk4017B
 T4OTOX50cdv62VuEBgMpmMH0A2QfJ6KxzGNG92iV6V2easODMB16hJpzteumUOhqXWSR
 qsr2SZj2lGCC7f/QQdE+rQ7u4wogBLNM/M1xlMKLAIXJ8Y92pj+YjmIAUYmj9R+kFE+S
 WFfYCVkcCWQsjAuQmRUq2C+GQg1GdJFcB5PJirz1UvwsAeeCJmB51cWYFTwb0DHQ94Us
 oRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676997839;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jjdSKPp9FxkPWOd21Y9/AorZCY0zNQLE4fvgnvwAo20=;
 b=Cu6wjzbNDVkvnVm8iNdWTUBZXDiCbXPBxgdWXF0y/eJ5OATGXREFUq05kRQk/HL4ps
 fHGxAnJ7bXvRXeUGOvothZnb1WdCkAtyOMwvazr7esmkz98XWIQnDDVT97NzxGgpjP2Q
 BeYz6WtB3M2lo5OEKDJHPQuZ7roWa5oC5iMHzg6w5UD9wW4n9kPq04LQGOaKm1Jdashs
 PgKyWinJNiLUZhxhH/SKgWmtgp7FR6pLSJEVkN+3QDlO5yajWA7eZR1N3lsayKZfSpGF
 ZymoYYJkO8hlh142O0ZaGpd8PEx8HCQ62gKktgCG5ALso9Hb6fWipuhZ+DwQdNvpIFTL
 J4KQ==
X-Gm-Message-State: AO0yUKVQP8IRVS6YwuudVD5P+1B29KRCvxeqzvjo4fw3qHFbB1WxBkFV
 /BO4KQF3OC86+kvQDL2S1gohMbpAO80tHRq2AJ88UQ==
X-Google-Smtp-Source: AK7set+tzR40SWZ1x2c387tU0IZplq0ivnAhKZSQGhQE8C9oihZaRrRiHqQPCMuLC7OFQhlOcpGrQIM42G7zfsKSLgU=
X-Received: by 2002:a62:164f:0:b0:5a9:babe:6cb9 with SMTP id
 76-20020a62164f000000b005a9babe6cb9mr907879pfw.48.1676997839026; Tue, 21 Feb
 2023 08:43:59 -0800 (PST)
MIME-Version: 1.0
References: <20230217175203.19510-1-palmer@rivosinc.com>
In-Reply-To: <20230217175203.19510-1-palmer@rivosinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 16:43:47 +0000
Message-ID: <CAFEAcA_DvrOgKAdVcF8OxpxUv9aPB5hOWjWryOt_SpFiNzY12A@mail.gmail.com>
Subject: Re: [PULL 0/9] Fourth RISC-V PR for QEMU 8.0
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Bin Meng <bmeng@tinylab.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 17 Feb 2023 at 17:53, Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> The following changes since commit 417296c8d8588f782018d01a317f88957e9786d6:
>
>   tests/qtest/netdev-socket: Raise connection timeout to 60 seconds (2023-02-09 11:23:53 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/palmer-dabbelt/qemu.git tags/pull-riscv-to-apply-20230217
>
> for you to fetch changes up to e8c0697d79ef05aa5aefb1121dfede59855556b4:
>
>   target/riscv: Fix vslide1up.vf and vslide1down.vf (2023-02-16 08:10:40 -0800)
>
> ----------------------------------------------------------------
> Fourth RISC-V PR for QEMU 8.0
>
> * A triplet of cleanups to the kernel/initrd loader that avoids
>   duplication between the various boards.
> * OpenSBI has been updated to version 1.2.
> * Weiwei Li, Daniel Henrique Barboza, and Liu Zhiwei have been added as
>   reviewers.  Thanks for the help!
> * A fix for PMP matching to avoid incorrectly appling the default
>   permissions on PMP permission violations.
> * A cleanup to avoid an unnecessary avoid env_archcpu() in
>   cpu_get_tb_cpu_state().
> * Fixes for the vector slide instructions to avoid truncating 64-bit
>   values (such as doubles) on 32-bit targets.

This seems to have caused CI to decide it needs to rerun the
'docker-opensbi' job, which doesn't work:
https://gitlab.com/qemu-project/qemu/-/jobs/3808319659

I don't understand what exactly is going on here -- Alex,
Bin, any ideas?

Why do we build the firmware in CI if we have checked in
binaries in pc-bios?

Should .gitlab-ci.d/opensbi/Dockerfile really still be
starting with Ubuntu 18.04 ? That is already older than our
set of supported platforms, and falls out of support from
Ubuntu in a couple of months.

(.gitlab-ci.d/edk2/Dockerfile is also using 18.04.)

thanks
-- PMM

