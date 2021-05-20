Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7BD38AFFE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 15:31:02 +0200 (CEST)
Received: from localhost ([::1]:42964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljilR-0007uC-LZ
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 09:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljihe-0004Nd-Td
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:27:07 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:45734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljihd-0004GK-2D
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:27:06 -0400
Received: by mail-ed1-x533.google.com with SMTP id a25so19364282edr.12
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 06:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fZ2Vkng0XpOtvMTBpyhvkOO+SzE5TIyduVzbsQrgIZ0=;
 b=GRlP+EnA8DJeCYh7WdQ2FCHwNnP3P4NDjNiM2oHjFyzuiVLPv1aHrTffTbcckwExi6
 eGRZnC1jFP5au8CoYcOF0PHbfOEpLYFKoqjvxBDthqXC7thOU2lYenVOvH1GlkGVLq2S
 Yl8lLIR9BOKSawTRDg9ClOtfpbRo0WGZfbF6BmDnBypVY+UhtNOcKWWf0Dm5QibyI1v9
 hPnDYTTK6tmvdrrq7NU7qOqy4X0i9y1aYfeuJnyz/NuVZfhn4j0ZYSRlTx6UHWTuKCYI
 gdiLpXnpez1HWBbeFeFWwufWLMI7xofNX6QLM07IGmHUBJXw8H+FFoV4EreHDQ2J4qZV
 mRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fZ2Vkng0XpOtvMTBpyhvkOO+SzE5TIyduVzbsQrgIZ0=;
 b=p8MtWyxGE8XKFDQ8rX1MX5GZsre7615X6CKfwIML4UcYpcNO1s+EVjMUGjZNqZIdMB
 ELGgNJ6C2Ai84dMa//sWH6KFd0n0nQW8kese1AZ8fhuam9wX0lDvV3CM3F67y8gE8djp
 h832zhVkFEliFBANf6+Xbe7SG62otIR5UjQvWTzl6jXw5e+2QaK/Z5uJze2sPm8ObiT4
 O7ASyYBttHjQksxmQk1B2AplWEXW9Uapk+YAKEJXx1X868F8ezYpiYdKceoGd75pSxug
 vCP8rgONSLjlSPLxlESFQjbzB9B5unU0ddQXRV/sTJcLxEgE1uZHQh0WJsVUjYbIxRx6
 Q66g==
X-Gm-Message-State: AOAM531b1Zg03wlaIHlccTmfxl+aDpJ6RHj9CchBRkCivCN7XJRVbc2i
 r1mpw0Qp4MONCGWOvOwrKX8nNN7spsl+Ir5iZBHb4w==
X-Google-Smtp-Source: ABdhPJytV0n9jIqqM01zR+au3Pja6orNwzsxKjZx674/DLHOVIC0Cv4lpIzo+HOt9bHJPkeyfGadKYUkH7SrEwRr2sY=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr4962484edt.36.1621517223537; 
 Thu, 20 May 2021 06:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210520082257.187061-1-pbonzini@redhat.com>
In-Reply-To: <20210520082257.187061-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 May 2021 14:26:45 +0100
Message-ID: <CAFEAcA_MV=UiHW4Kp3Zb4iT_5BHgqVwj9Qem1xjmp1AJ++K=sQ@mail.gmail.com>
Subject: Re: [PULL 00/26] Misc patches for 2021-05-20
To: Paolo Bonzini <pbonzini@redhat.com>
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

On Thu, 20 May 2021 at 09:31, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 15e147b3c778f9f4c08c79b99747b848b6e2117b:
>
>   Merge remote-tracking branch 'remotes/nvme/tags/nvme-next-pull-request' into staging (2021-05-18 12:22:16 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/tags/for-upstream-v2
>
> for you to fetch changes up to 976551ba504a3284f9ab9862d9434b422c6841a1:
>
>   scsi-generic: pass max_segments via max_iov field in BlockLimits (2021-05-18 17:51:15 +0200)
>
> ----------------------------------------------------------------
> * submodule cleanups (Philippe, myself)
> * tiny step towards a usable preconfig mode (myself)
> * bump Meson submodule (myself)
> * Kconfig and LOCK_GUARD cleanups (philippe)
> * new x86 CPUID feature (Yang Zhong)
> * "-object qtest" support (myself)
> * Dirty ring support for KVM (Peter)
> * Fixes for 6.0 command line parsing breakage (myself)
> * Fix for macOS 11.3 SDK (Katsuhiro)
> * Fix for scsi-generic handling (myself)
>


Fails to build on PPC64:

WARNING: Project specifies a minimum meson_version '>=0.55.0' but uses
features which were added in newer versions:
 * 0.57.0: {'test() timeout <= 0'}


ERROR: Could not detect Ninja v1.8.2 or newer


(This system has ninja-build 1.7.2.)


thanks
-- PMM

