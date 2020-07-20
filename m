Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9EF22704F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jul 2020 23:25:54 +0200 (CEST)
Received: from localhost ([::1]:41798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxdIH-0000PM-2S
	for lists+qemu-devel@lfdr.de; Mon, 20 Jul 2020 17:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jxdHQ-000834-Fr
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 17:25:00 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:32994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jxdHO-0002vT-OO
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 17:25:00 -0400
Received: by mail-ot1-x343.google.com with SMTP id h13so13420278otr.0
 for <qemu-devel@nongnu.org>; Mon, 20 Jul 2020 14:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=g9qju1uPvd4T1Xo3tAfWVPeervabIPnxL0a/CgNDmNg=;
 b=F5OEpDLKDo3hk5tm2E78ZykTXx2JnDvIqOVdvh+YyWTIghHKIPEnWCAgOn30diXf+f
 7ZuDDBn0R93i3PBLXF/fUz12CuM7/ooHoZZGSlPUAbbf6P6+vnnzweWiwJbj7ps7QN5m
 xhGo872DDnAAhdl789qEEYWrE47+9Bnvjn3+UKQIEJa3lQOJkmyzhHtCUxanEwMYSNn6
 1+VtPfnrx8mPHkMc+SuCDSLwkYYlJRjTF702rfqOxgCDpdWklZtHIh2Mxky0EcPLhFP0
 lTO3EoHwwAtGl4LoIqDJcvhxIZoE0JjF4F7rVXXnU5F2wB9zeCswipGnFCOKqP8IhIwB
 oV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=g9qju1uPvd4T1Xo3tAfWVPeervabIPnxL0a/CgNDmNg=;
 b=gIzuRgLKQVRGJ+oShWH7pNYDu7mESSgrA5udhWQlISJISJGtBi51c7e/rR2YHzZD4l
 6VhcIg/UB2V75/L4oSYkjmNVA0YabIj0Jm3hM2KAK/pwZ1DE+V5ZtdIcJOcUWecClcBu
 6Prm53boVGnbPGOiV+1LXxDqYzsbsz0h00fWCQAH91ZTXOWiA382WwmdAqsCMYSgbIKU
 hXtngfgG2I9rJHG3Dw0W0CBdwPHGRCxDV2j9fu86B88mT9z0hmQjYlgyVWcbUuyBKrRY
 6thnGfL43j1Rl4Zs8Oqa1SEHRqm26eL2dV5pjS3inFiUdrFj0zCGKtunEL9CzS70Qw/g
 NPUw==
X-Gm-Message-State: AOAM533Hxj/0tNO66VGjrQHnoYp60FAjVhfKex+kobOWXIlqf+//stYq
 ekwODmJPXgzJ3As+jUiFGgopGBTHJQVrggLNjpWukZG8
X-Google-Smtp-Source: ABdhPJy4CvdCY8aWDyjqqFpaeVFJ9i77EIW07P06PUgOH1b5z6x6VddgHOAUzVEr+Ok9Fv07zuuPde1nXgcP/WJUqd4=
X-Received: by 2002:a05:6830:1bd3:: with SMTP id
 v19mr21491269ota.91.1595280294504; 
 Mon, 20 Jul 2020 14:24:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200720125621.13460-1-peter.maydell@linaro.org>
In-Reply-To: <20200720125621.13460-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jul 2020 22:24:43 +0100
Message-ID: <CAFEAcA_DAyWwZen227OMh9_AxsQUzKSBCrzr9tUECOWM4JfdDg@mail.gmail.com>
Subject: Re: [PULL 00/12] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

On Mon, 20 Jul 2020 at 13:56, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Not much here, mostly documentation, but a few bug fixes.
>
> thanks
> -- PMM
>
> The following changes since commit 873ec69aeb12e24eec7fb317fd0cd8494e8489dd:
>
>   Merge remote-tracking branch 'remotes/cminyard/tags/for-qemu-i2c-5' into staging (2020-07-20 11:03:09 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20200720
>
> for you to fetch changes up to 6a0b7505f1fd6769c3f1558fda76464d51e4118a:
>
>   docs/system: Document the arm virt board (2020-07-20 11:35:17 +0100)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * virt: Don't enable MTE emulation by default
>  * virt: Diagnose attempts to use MTE with memory-hotplug or KVM
>    (rather than silently not working correctly)
>  * util: Implement qemu_get_thread_id() for OpenBSD
>  * qdev: Add doc comments for qdev_unrealize and GPIO functions,
>    and standardize on doc-comments-in-header-file
>  * hw/arm/armsse: Assert info->num_cpus is in-bounds in armsse_realize()
>  * docs/system: Document canon-a1100, collie, gumstix, virt boards


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

