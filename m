Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 598622923D9
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 10:42:21 +0200 (CEST)
Received: from localhost ([::1]:41642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUQkG-0000Sj-Ew
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 04:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUQiu-0008Hg-8U
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 04:40:57 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:36033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUQir-0008OJ-LX
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 04:40:55 -0400
Received: by mail-ed1-x52d.google.com with SMTP id l16so9382513eds.3
 for <qemu-devel@nongnu.org>; Mon, 19 Oct 2020 01:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=53o8E0r2LzzvMpF0bcR7lVIiPq40cQ1K1WqhO5yt6nA=;
 b=YFhsj8LKaMpKUTHpd3Hfv/SO3i+adoAHqDB12c+CHZazsCpMmov+kTfFX3+X0LXhXW
 KRZzNRXvqmLp9d2kJvG1rHRWgK6xLu2hlg7znVj/yCHtyEqdaP8APoOX6wgXq8yvCVR2
 ajlxwsp0cLKYywXQHSqI73G0qnp022oeV0HueozH480gw4yjiBBQCa3zjpswNveWtt/1
 oRLSlm8gBa+My7gIhuejxj3VsLph/MnwcKrXdxAJ7uEtGpI11tEGun5zHjdaWarQUyYx
 BzwZNNtErsoD2vrunCcAi7QDVrfnQb6hjaE+USNpeS98V9wDpoVm0CyDN22PN9KChFDS
 4kdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=53o8E0r2LzzvMpF0bcR7lVIiPq40cQ1K1WqhO5yt6nA=;
 b=Em9DryscCekDK3IIKqvLOgvHVINv9HVxX+GuDYM1REQhgLLJ0aM/mWpUG895VZc+6B
 pAThUq+oKmR9273nfMJHP75xt9z8kEjt1tqWqmQBAukgDKjGPIFNuyCVZG+3sl40fnSp
 nTmvHKqOuk145Qe8h6eOanAX4sznYWC3/vaL0prPrMZjd+q7dUpty8NSq2FUUkNNav6t
 kgW1JcfRk9XIJeEZhddgDWxZ8+GfeOQjABkn+k4Z4sJxSZ1Q73O42L06avRkU+M3W94B
 FSrkUJFMBO+jC9LCp75TLIBKDpv1uJ8ZLYtU8bAFZKKdzr1a/oyq1Bi0ECM1xo/7oLfm
 nfww==
X-Gm-Message-State: AOAM532sZzR+LsG+NIcZrcOszAPQ6NCcAYCNc52RbPNKn6+7XtH3uomz
 9ZBWD4HsrpkJ7JH05vlQzYmP28rzzXdSSKG81s5udQ==
X-Google-Smtp-Source: ABdhPJxZIlCMq51UmLgyJjkTP70iApoMb85Ykohgn1BB5JNGzSA/32nnpd4TcqcHcVE5s5dX2+E/VvdvcQd/ZyfMqUE=
X-Received: by 2002:a05:6402:3133:: with SMTP id
 dd19mr17375951edb.100.1603096849087; 
 Mon, 19 Oct 2020 01:40:49 -0700 (PDT)
MIME-Version: 1.0
References: <20201017144805.1641371-1-pbonzini@redhat.com>
In-Reply-To: <20201017144805.1641371-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Oct 2020 09:40:38 +0100
Message-ID: <CAFEAcA9wPceN2P2SpxkwmcPakHAEXSYLOFAgZVAoEDLKj-GOwA@mail.gmail.com>
Subject: Re: [PULL v3 00/22] Build system + misc changes for 2020-10-16
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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

On Sat, 17 Oct 2020 at 15:50, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 3e40748834923798aa57e3751db13a069e2c617b:
>
>   Merge remote-tracking branch 'remotes/rth/tags/pull-mb-20201014' into staging (2020-10-15 20:30:24 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to c47110d90fa5401bcc42c17f8ae0724a1c96599a:
>
>   ci: include configure and meson logs in all jobs if configure fails (2020-10-17 10:45:53 -0400)
>
> ----------------------------------------------------------------
> * Drop ninjatool and just require ninja (Paolo)
> * Fix docs build under msys2 (Yonggang)
> * HAX snafu fix (Claudio)
> * Disable signal handlers during fuzzing (Alex)
> * Miscellaneous fixes (Bruce, Greg)
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

