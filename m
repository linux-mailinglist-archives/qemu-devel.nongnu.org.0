Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D5229B3FC
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 16:02:02 +0100 (CET)
Received: from localhost ([::1]:58502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXQU5-00048d-Dr
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 11:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXPyi-0000aa-Kf
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 10:29:36 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:42591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXPyg-0000j0-7B
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 10:29:35 -0400
Received: by mail-ed1-x52f.google.com with SMTP id v19so1638027edx.9
 for <qemu-devel@nongnu.org>; Tue, 27 Oct 2020 07:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uhUv/Z96+q/nq6d7GN6i8Kdl/+mxeTyQ+WVQpwGK2VI=;
 b=BWUry88leXXszZq4+eVNCZWhJTKCmE8+WudTtaWtXCTiXzzrvWaisLFDMJNQp/Ra4H
 SmR8pDdqdV0RphRpOgIuingR8W7fxSGYaBZOXKa9F2KIFTV0ZajCfie0P38Lg81wkrKf
 /oO5fhjU8H9tOoJfPTmgh1ihBzdNCrXOuYeS5rTKhWgv7jNRWjXc2sgql7u9ZsyEuRNT
 4C1ynT3dPf/qUjEFdrI1qOa03U2OoMKKOfU7CHvK9d9w4O8LOi0eBGBDofdpkre0RNAx
 j0iig4fGnqC4gBNWUuKN/cGYJ6UcY3HMKoijWVXN+7TVKKtioP0hKyVrvueFoNF/b/SI
 2UwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uhUv/Z96+q/nq6d7GN6i8Kdl/+mxeTyQ+WVQpwGK2VI=;
 b=DcfA8u7tWqAillz3r9iDdq8A0K3XVVCUURfafuZVo6mn0DDgWbXU+J00BYSj+6nRuG
 a8m3a3cmMcSDzMPbV9iXcvjSURR5fd3QSX28LlD5QaQEkvFSxt7ADF8fJP6/YcTiu5sk
 ZpZw3PMdRIPwyxFX0Rma5ubvyvAbM5InQPUlXyuh5pAXGeU7UXkCOvDgXoaAKzYxiQfh
 XA9l2Uf52h8rm1BAUA60FpTyyrqRTLhsX02LZi94zO6xWjSv25pi7FVaXne9hrAmZYJm
 G/41vFI/eJMjIqbmXRPEV7wWpUxwfPLfC2IQQGnxiEg/QBywJcFkaTCBI6RKJU4/Z/IA
 cngQ==
X-Gm-Message-State: AOAM533fRGdBKHPV0w330OZ1EIXw7Czb2PvwDH92JxWd3F2oESF2nIpp
 l/bBfq58NVlHiw/PLdToab0n0YjJR7zPnVvOQXuKpQ==
X-Google-Smtp-Source: ABdhPJxt9A6dqreXeh1bfItk7UZE+WLXspRqRl5HBxbKyKzHK2rp32dcDgVoly4ZQvj/KS7VWXB2CeHDScFUDNO1Ip8=
X-Received: by 2002:aa7:c683:: with SMTP id n3mr2503273edq.146.1603808971262; 
 Tue, 27 Oct 2020 07:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <20201026170502.65786-1-stefanha@redhat.com>
In-Reply-To: <20201026170502.65786-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Oct 2020 14:29:20 +0000
Message-ID: <CAFEAcA9vPfYW9-UaW6i2NeANy6eohYnhmjKx-CBBBrhaGiyraA@mail.gmail.com>
Subject: Re: [PULL v2 v2 0/2] Tracing patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Oct 2020 at 17:05, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit a46e72710566eea0f90f9c673a0f02da0064acce:
>
>   Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20201026' into staging (2020-10-26 14:50:03 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/tracing-pull-request
>
> for you to fetch changes up to ee8041013a574b4f88e05472f321e50e1f4be733:
>
>   Add execute bit back to scripts/tracetool.py (2020-10-26 17:03:26 +0000)
>
> ----------------------------------------------------------------
> Pull request
>
> v2:
>  * Fix Anthony Perard's email address [Philippe]
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

