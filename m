Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 948B12C1356
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 19:52:49 +0100 (CET)
Received: from localhost ([::1]:57622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khGxE-0006rT-MY
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 13:52:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khGvm-000643-VV
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 13:51:18 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:42143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khGvk-0004za-6G
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 13:51:18 -0500
Received: by mail-ed1-x52f.google.com with SMTP id v22so18193990edt.9
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 10:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WWO/8mrDF1WLAAP5I1XV1UHU/YKdeoZScwl7Z5bBUuQ=;
 b=usu0I7z/nfyvW5jNkUKmoXfzJIcO2I5aMUFgAx5FHdUYYnXuUojTh6AxjOfTxzw7nS
 Z6D4wpIfKvVtgXVB0PHzhgcWJrKFft+SJWEnuLjrxqHhIr0TBPCFHqouHvGu5JRvmIFa
 K4ER44mCX4aXL1vf1tRVkn3HbrFvfxO124PFsv7+LZ9bqxXrpvIs5RaJLqM1qjFWvkGl
 2yq17ig7GDHayJ4GhnWW15lsIgw0mxNOK4hV8RlZZRBvGD0J2fP6DZql+YTt7GQSrZzo
 QDL5cezG0MpXAeSOLMODAEJ5eCZm7Wd2L7gSqj4ZDjIne3kOtxwECgG5WaknfhMZ8kYM
 fRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WWO/8mrDF1WLAAP5I1XV1UHU/YKdeoZScwl7Z5bBUuQ=;
 b=bGGuZhuPrzTPTOV2gHfRQUDZh36Ll+9otK4XjBdexvq4+hHWmECRYLfqXRQ+0ncDEs
 z4j7ZyP3UTrKJrQd4MFrwQj+gPa/uxnyAyQgBNOD7YGCHHsEUfX15L1hO5nwQ3Ld2kjq
 ZZr1fKk/Zxhwg/jBpV33H0uxsLmwoV5+lqDLc43LshoJShDBVvW9k5V5zWHOB50MdB2K
 +1YKZQiIqiUirSxjyRWZMyAKNlkQuE2Y5p19o46EOvK54/NMhQsPIRkkx1iBmmiMF9Bx
 ZVLXFXxseTVUX4wtv9rZsNq4ni4mi1Fyt48FZlJcC+XZlGUyd+PHaSKxKraHQNUOoDgM
 c1Ww==
X-Gm-Message-State: AOAM5306rrHYmjDPZEU9ENg3lzypxjMAJYZg11E1JSArzN6AF4fW+r0R
 uAlRmAF2B8gRthb4zguoHq39vuGwJyg9HXCUjE6cbw==
X-Google-Smtp-Source: ABdhPJzyLXv3e6ViGb2H0lwolNPv93rMTX0KB7w5jNjseU2QyFELGJLlISxp+s1ei56S391hDmOvyDA1Qw1uVkr/jec=
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr608691edb.100.1606157474635; 
 Mon, 23 Nov 2020 10:51:14 -0800 (PST)
MIME-Version: 1.0
References: <20201123115155.232335-1-thuth@redhat.com>
In-Reply-To: <20201123115155.232335-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Nov 2020 18:51:03 +0000
Message-ID: <CAFEAcA-yHMgC+ZN=oQZM9TCg8d55ALewoy4-kkVqd3VmTk_1AQ@mail.gmail.com>
Subject: Re: [PULL 0/3] s390-ccw bios reboot fixes
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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

On Mon, 23 Nov 2020 at 11:52, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter,
>
> the following changes since commit 8cc30eb1400fc01f2b139cdd3dc524f8b84dbe07:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-sparc-20201122' into staging (2020-11-22 15:02:52 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/huth/qemu.git tags/pull-request-2020-11-23
>
> for you to fetch changes up to 7a3d37a3f2335e18539e821d0c72abe0b22480bd:
>
>   pc-bios/s390: Update the s390-ccw bios binaries (2020-11-23 10:16:09 +0100)
>
> CI runs:
>
>   https://gitlab.com/huth/qemu/-/pipelines/219883736
>   https://travis-ci.com/github/huth/qemu/builds/203497483
>
> ----------------------------------------------------------------
> * Two reboot fixes for the s390-ccw bios
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

