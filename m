Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 850DE308D98
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 20:45:50 +0100 (CET)
Received: from localhost ([::1]:54406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5ZiH-0005pS-BC
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 14:45:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5Zfl-0005H2-U3
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 14:43:13 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:37385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5Zfk-000510-63
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 14:43:13 -0500
Received: by mail-ed1-x529.google.com with SMTP id g1so11902880edu.4
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 11:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=l0VBKN5PZjFDNLH2W6CWvi2oVuMYx9slnlJt4jCEElw=;
 b=Wn6Q6Y7R9PYuSy1RN+BLUgrOMymcb8KGMSmvSFcrNG43kXDi6g0E7FziicWCK80uIs
 ZAZonWOFhH25wmFqOWGbYgKxOrw0hAGeWPc08JaGpOVVdoi+ZN7YSJJzVwLkaI34arQ8
 bnv+gpThB0mPztxnT9o1J1W7Asi/t3pdq8Z/S2/J2P7/1bieBMaUlwe8E30Ot9LrUxXk
 XNTmGv03ncmntm9ZXnx4dyeCln7wqNL5RBz0mqEA4gKjSEXC1hYEUt0d5UT7Vd0MYm4p
 HQYNqqwLIK/wiKb1YhelzT+5nQ68Bvzer/2rrLQ/5hIZOAqjSNk+xxxijli/ZOlYIn7e
 baZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=l0VBKN5PZjFDNLH2W6CWvi2oVuMYx9slnlJt4jCEElw=;
 b=ZmqaAVwffQvS5rJi7wYUUalgCm6Q3OggvTuSZOFI8rEwkTBjZOd3HK6hqbfSjVCsWm
 WdsTyGAeniczWTMUHD2miX/vkeDMq439AKnRE+kc7EQXiDM17R+Ip2eMHeDBxBVbYaWY
 Yasx+OtRd2u8jHZCrd3rOkGhQFYVDDmONUSzrR9PqEYRLkUZb4Puj8YK/YqpZC5ajH5B
 8uerRbZSpyp40glxtbOfT5kcH+LNB2bRH0GKYfhrvUsAUwvX0J2QzZcPRVjiivlhUfY9
 aQHp/SnbLwI+CXsNdnHGIqpnyUEAByO2ATtDpu1Jdc95Xr6ldoIAEMQaaYCswGDZEa66
 s+3Q==
X-Gm-Message-State: AOAM530BBV6F27cnuL/a2/EZHfbwrrpsfhgMg5hYzEYtXXuYoeeS4lbh
 TZvm+vsE5wPUaegeGhEiwEt5WY09CG0C7yVtJQKt/HTC8TE=
X-Google-Smtp-Source: ABdhPJxu5nfaB6Z4LcRSSLvo3hGKmncDHzhDGxcIecG+EHjULalKauFBxqWWk/Y1rphDGomvQHCZUoUY9FWXseOHLlI=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr6959990edd.52.1611949389850; 
 Fri, 29 Jan 2021 11:43:09 -0800 (PST)
MIME-Version: 1.0
References: <20210129160854.11445-1-peter.maydell@linaro.org>
In-Reply-To: <20210129160854.11445-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jan 2021 19:42:58 +0000
Message-ID: <CAFEAcA9tMJ2ZjbGJXzAKkP3t1yt4-kmC4xZGi-3bKkWXWocQrQ@mail.gmail.com>
Subject: Re: [PULL v2 00/46] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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

On Fri, 29 Jan 2021 at 16:08, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> v2 update: fix memory leaks in pvpanic-pci test case spotted by
> oss-fuzz gitlab CI run.
>
> -- PMM
>
> The following changes since commit 7e7eb9f852a46b51a71ae9d82590b2e4d28827ee:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-01-28' into staging (2021-01-28 22:43:18 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210129-1
>
> for you to fetch changes up to 14711b6f54708b9583796db02b12ee7bd0331502:
>
>   hw/arm/stellaris: Remove board-creation reset of STELLARIS_SYS (2021-01-29 15:54:44 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * Implement ID_PFR2
>  * Conditionalize DBGDIDR
>  * rename xlnx-zcu102.canbusN properties
>  * provide powerdown/reset mechanism for secure firmware on 'virt' board
>  * hw/misc: Fix arith overflow in NPCM7XX PWM module
>  * target/arm: Replace magic value by MMU_DATA_LOAD definition
>  * configure: fix preadv errors on Catalina macOS with new XCode
>  * Various configure and other cleanups in preparation for iOS support
>  * hvf: Add hypervisor entitlement to output binaries (needed for Big Sur)
>  * Implement pvpanic-pci device
>  * Convert the CMSDK timer devices to the Clock framework
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

