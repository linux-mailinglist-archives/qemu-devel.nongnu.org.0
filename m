Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7118B38B197
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 16:22:39 +0200 (CEST)
Received: from localhost ([::1]:39978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjZO-0004mk-Ad
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 10:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljjYD-00044t-QN
 for qemu-devel@nongnu.org; Thu, 20 May 2021 10:21:25 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:38757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljjYB-0004sl-VF
 for qemu-devel@nongnu.org; Thu, 20 May 2021 10:21:25 -0400
Received: by mail-ej1-x632.google.com with SMTP id i7so7756327ejc.5
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 07:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aIkcRg+BkstxsI1wOzS6+z64N/LD97NJ/eVglxhiPzU=;
 b=RGiHHffpZzKAU83uqnMbc/3Btl9U2eOMarbwOm213b3XvgG4jn2l+XbJsIbKjP2EIK
 I3lwX4MKLLQSdnAVY+IvwPeQXckC2mmXu3/Odffl1KB0lTpwnGQHMVmk7t1+Ljod5ZmX
 9Y6VZH9oRVMrCUA1HIRxVBmyq70tdX30jfWkJTh2p7qkj4tSB8n7nM8S5jK18m06Zff4
 J/fBfB3s/2EHLIiD12cmBz5aZImxls01omLLnAEvmK7ofQqowr0YsiteV5guCOcCvmwe
 IvKOT0epNflgDh/cMd+9EnPcmgM+BmfH0mJO7PdVDhQmER1r4is/1GMkn9+waPrd0NvB
 F8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aIkcRg+BkstxsI1wOzS6+z64N/LD97NJ/eVglxhiPzU=;
 b=kat2R5BIN8IhEuP9joXIyZIB5BNs0yHPWrZRlbnGhXCwKyQ096QVzt5XMyRVaOv5UL
 5POY0zXuSbh+UthNAlT+UHBHbAFPdO4iMvDIzLo5wYdDRG2bKjAimC/gxjEYYoY5zmmJ
 YufNDiGFTf37HDSsL+oH7O9G1+C+4RNCKtObrK+KnNqMpQOGipsGFVzmKtPAnKrxDuRt
 OrvLksJNssw4io8noIn9R0fJ5CtV93GhFEXZbDbd68Ue+olTXNc9dn9yyKrwnR9xjc/G
 q1WizQR+8x/DDCwch7eS0B8JucIcDsKbWrw/N0oPG8gBZTW1At4TSBkpWq6UBTLXMQ/w
 4qnQ==
X-Gm-Message-State: AOAM530cwhYRTzDiE/sC8dSl4AoB4eYZZkrOlkJBAGWkp5KqDLYxI+IM
 oHQYTy1xGCb3nLwIKUAP5L2WQ1qccVvmpQZjoDY7Wg==
X-Google-Smtp-Source: ABdhPJydvWZvovEHKLBWB59C/zqRk+8wE3xKrmHKYP0iym4qO0kJ6Lk4ZEUmLX8ov+n6npB4iKl/M4ND6bIZzy9TXW0=
X-Received: by 2002:a17:906:9bd6:: with SMTP id
 de22mr4883785ejc.382.1621520478323; 
 Thu, 20 May 2021 07:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210520082257.187061-1-pbonzini@redhat.com>
 <CAFEAcA_MV=UiHW4Kp3Zb4iT_5BHgqVwj9Qem1xjmp1AJ++K=sQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_MV=UiHW4Kp3Zb4iT_5BHgqVwj9Qem1xjmp1AJ++K=sQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 May 2021 15:20:59 +0100
Message-ID: <CAFEAcA-w-EtshAEcx0u-k_iWjt8ynurpWB7nMdDZRHLcBaHDJA@mail.gmail.com>
Subject: Re: [PULL 00/26] Misc patches for 2021-05-20
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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

On Thu, 20 May 2021 at 14:26, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 20 May 2021 at 09:31, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > The following changes since commit 15e147b3c778f9f4c08c79b99747b848b6e2117b:
> >
> >   Merge remote-tracking branch 'remotes/nvme/tags/nvme-next-pull-request' into staging (2021-05-18 12:22:16 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/bonzini/qemu.git tags/tags/for-upstream-v2
> >
> > for you to fetch changes up to 976551ba504a3284f9ab9862d9434b422c6841a1:
> >
> >   scsi-generic: pass max_segments via max_iov field in BlockLimits (2021-05-18 17:51:15 +0200)
> >
> > ----------------------------------------------------------------
> > * submodule cleanups (Philippe, myself)
> > * tiny step towards a usable preconfig mode (myself)
> > * bump Meson submodule (myself)
> > * Kconfig and LOCK_GUARD cleanups (philippe)
> > * new x86 CPUID feature (Yang Zhong)
> > * "-object qtest" support (myself)
> > * Dirty ring support for KVM (Peter)
> > * Fixes for 6.0 command line parsing breakage (myself)
> > * Fix for macOS 11.3 SDK (Katsuhiro)
> > * Fix for scsi-generic handling (myself)
> >
>
>
> Fails to build on PPC64:
>
> WARNING: Project specifies a minimum meson_version '>=0.55.0' but uses
> features which were added in newer versions:
>  * 0.57.0: {'test() timeout <= 0'}
>
>
> ERROR: Could not detect Ninja v1.8.2 or newer

Also, my OSX build which I configure with
../..configure --extra-cflags='-fdiagnostics-color=never -Werror
-Wno-error=deprecated-declarations'

now triggers a meson.build warning:

../../meson.build:118: WARNING: Consider using the built-in werror
option instead of using "-Werror".
../../meson.build:120: WARNING: Consider using the built-in werror
option instead of using "-Werror".
../../meson.build:122: WARNING: Consider using the built-in werror
option instead of using "-Werror".

thanks
-- PMM

