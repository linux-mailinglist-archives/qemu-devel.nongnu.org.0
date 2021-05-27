Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CD8393055
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 15:59:03 +0200 (CEST)
Received: from localhost ([::1]:59646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmGXO-000392-DJ
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 09:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmGT3-0000uI-AU
 for qemu-devel@nongnu.org; Thu, 27 May 2021 09:54:34 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:38785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lmGSu-0002Xd-Pa
 for qemu-devel@nongnu.org; Thu, 27 May 2021 09:54:32 -0400
Received: by mail-ed1-x529.google.com with SMTP id o5so956888edc.5
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 06:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pV9i/MLYtuuCEwTNdVFWSWT9ZdqHMGoD+tlsWTecrNE=;
 b=riJMNyTVmsY2c6DuoREyYTyU2YybhCv8Cws7zTrnyEyi26oXnzKyVNhrmA2jzyjpiG
 dGAwM4eFWhiI04VHZyOP40TV6HwJKXASNua/10V91IK9TgWckam9st13ImfhRIM4aTjl
 F6WbI/iojpCLGaNDu781PsBKKJPb388evdlAVjxwlYgZoGyXUAFufzr0/aDs2gRilVAq
 o4iByoawTvsZ6bA8wA8rCe8i2bwuSX/oQWZkVzYd+AcUZIvpvNdmA1uFdnlBUznL53Hp
 aG2leSF6Nd4iQ6NJoHBuMT92jlPj9V76RbExZvznhtyYNLlk2zTT9hw+FtkoGhifvxLL
 EB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pV9i/MLYtuuCEwTNdVFWSWT9ZdqHMGoD+tlsWTecrNE=;
 b=lWatYrYOei2QZYRRLlVRZKCnnSv0Yl82dcNda72njEkdrHLngeDlKIbMPJV5AngvgG
 I67X+2bva2OYpzTVMn3+lGenCdO9ILn9wWQPdg8tI42NdVCyEChNXYrwUWaFke5VYESv
 +SNIHad2t8cXACi+UJOjvBvfqGJKsz61cwKqLIXZpfjWxBIDmTFi2ma0BTI9n/pcYk0Z
 AJcwAn99o0VOfUnSOaQryW4bLW5KlIqls4OrSn0ViOcZ4gi/pA+meDuGf+x17c6jvzDs
 7SIaeUqsiS3LMWuMK78gYN4170sF7rNsqvK5kVqRAxnTpS35bczZPtXYaMiY9W63thVk
 3zoQ==
X-Gm-Message-State: AOAM531PSoAEEmnqiM7UYltpSH9IHEx71ylv7d1KByejWECY8PQoS0KH
 +rSWKh6mhUGmTn9RXawDuElXLH1bmaweLGLynQcGjQ==
X-Google-Smtp-Source: ABdhPJwdH+TVOaNufIKx0JkrUrASnOkC3OwboM7ThiLIIlL2VwOn+rtI8JgzMJ3iLdiatbWiHzfAJKnJ9WRn2RhUUJ0=
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr4200716edd.251.1622123662978; 
 Thu, 27 May 2021 06:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210526163550.501367-1-pbonzini@redhat.com>
In-Reply-To: <20210526163550.501367-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 May 2021 14:53:57 +0100
Message-ID: <CAFEAcA_7T8yoibYbKkVhW61DF0PaWw-zaLSjpuFOLuHChJSDOQ@mail.gmail.com>
Subject: Re: [PULL v2 00/28] Misc patches for 2021-05-24
To: Paolo Bonzini <pbonzini@redhat.com>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 26 May 2021 at 17:51, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 92f8c6fef13b31ba222c4d20ad8afd2b79c4c28e:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210525' into staging (2021-05-25 16:17:06 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 7cf333a37260c4aafa465453adc8e073e408967e:
>
>   gitlab-ci: use --meson=git for CFI jobs (2021-05-26 14:50:05 +0200)
>
> ----------------------------------------------------------------
> * submodule cleanups (Philippe, myself)
> * tiny step towards a usable preconfig mode (myself)
> * Kconfig and LOCK_GUARD cleanups (philippe)
> * new x86 CPUID feature (Yang Zhong)
> * "-object qtest" support (myself)
> * Dirty ring support for KVM (Peter)
> * Fixes for 6.0 command line parsing breakage (myself)
> * Fix for macOS 11.3 SDK (Katsuhiro)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

