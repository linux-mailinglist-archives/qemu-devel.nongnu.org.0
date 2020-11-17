Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FA82B70A6
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 22:08:32 +0100 (CET)
Received: from localhost ([::1]:55664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf8DH-0000yp-0R
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 16:08:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf8Bp-0000R0-LG
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 16:07:01 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:34641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf8Bn-0006Gz-8e
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 16:07:01 -0500
Received: by mail-ed1-x52a.google.com with SMTP id a15so24002223edy.1
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 13:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=UPZ4N/PbHcSEeUjGAkHe1Z5AmH5khM5WT1dVFqJnjBA=;
 b=HJwP7CPMzqtSYbVcNX+2FfLH2Z5VTYpewzHDzJw83F0EzV0R4n0sAskaocuGrYtmYU
 qK8xeT3ZIykNqM1xC7nVR6oIfAhCCTUysctUro1krdqdpq9FQAve/Qsk+pm0ASAFzlkj
 UfQq9NuY92myV0vQaEwnuNeyVSlEuQpcJxFBeodhHxhTwIqYqA87bSszVkeEHl47Uq74
 n5iF7ksU5EaSImoUPQ+1FQGVET2icxp856fo0H0emDA5SKLuhJPcB1zNR7rlQxiWjurn
 TCXeb6tsePGpV2f1hPo3Bh0nZpPtIysapMIrsYJYEX0r5ue/XUnhx2m1o4cW4mEjiMBI
 GuBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=UPZ4N/PbHcSEeUjGAkHe1Z5AmH5khM5WT1dVFqJnjBA=;
 b=SBIUt/Yo+VE18hR9r+8G9HE57FpeC5BtZMcahOvdMsR2Mb04RUQG5rTtbOK2VqA/YK
 uZAEqUFQucOtzAvg3s1lrcYqk13gdZ6k0xji1oUChLWbEa1mEY1ebmkPVEsiq7N4BsCN
 RJUG+uh1RTW6BF+Cq3zfbqN1yVwAmmdz+gb3TLOjZ6B6Z2eOfTH+4AB+Yh/jad/fI3r5
 YciMZa+ifRBPc5dDr7kGwRXPdSccSO0mabC3DEAZmwTh6fbw8UYS6mJ++ec8qOx3GOxn
 olIWsqMwfhyHh+SRTB7IoQ1BVUZG+kjE9qjnW4yDwmzstJFTTq2NpAzqBoeJT/NC69bq
 71pA==
X-Gm-Message-State: AOAM531Cnmtwz8zmqIAG+tO1VVPR3IrNySxt1cgubfLeFbMHPvz/QNxG
 hk1JXVIgFz+STLn9s7tMlbD/OmHl8jMIhPkGHFQw4Btv0do=
X-Google-Smtp-Source: ABdhPJy1e5fjwXhPSupCByLlhIJNeoGVO/bkt7Te2X+czB4ZBJQV0N63yBcnXBB7wS3ZMprUmmwaTum75G5NdaeDkMk=
X-Received: by 2002:aa7:d3cc:: with SMTP id o12mr23144591edr.36.1605647217337; 
 Tue, 17 Nov 2020 13:06:57 -0800 (PST)
MIME-Version: 1.0
References: <20201117134834.31731-1-peter.maydell@linaro.org>
In-Reply-To: <20201117134834.31731-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Nov 2020 21:06:46 +0000
Message-ID: <CAFEAcA-NA-q0ASuHjSzFcAsudtTHV=VyA_GFMf+mCBpuSwZMPA@mail.gmail.com>
Subject: Re: [PULL 0/9] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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

On Tue, 17 Nov 2020 at 13:48, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Arm queue; bugfixes only.
>
> thanks
> -- PMM
>
> The following changes since commit 48aa8f0ac536db3550a35c295ff7de94e4c33739:
>
>   Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2020-11-16' into staging (2020-11-17 11:07:00 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20201117
>
> for you to fetch changes up to ab135622cf478585bdfcb68b85e4a817d74a0c42:
>
>   tmp105: Correct handling of temperature limit checks (2020-11-17 12:56:33 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * hw/arm/virt: ARM_VIRT must select ARM_GIC
>  * exynos: Fix bad printf format specifiers
>  * hw/input/ps2.c: Remove remnants of printf debug
>  * target/openrisc: Remove dead code attempting to check "is timer disabled"
>  * register: Remove unnecessary NULL check
>  * util/cutils: Fix Coverity array overrun in freq_to_str()
>  * configure: Make "does libgio work" test pull in some actual functions
>  * tmp105: reset the T_low and T_High registers
>  * tmp105: Correct handling of temperature limit checks
>
> ----------------------------------------------------------------



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

