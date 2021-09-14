Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9F940B5C5
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 19:18:06 +0200 (CEST)
Received: from localhost ([::1]:46400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQC4L-0001fg-6j
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 13:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQC1A-0007Zl-QV
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:14:50 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:44612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQC18-0008Cb-Sb
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:14:48 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so71735wml.3
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 10:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hyaSOIbReSL6tUsH+Skzy33KPfP0HGHCZLyG/jrv3FY=;
 b=BKwnVpwRqgVpx/XhjbW3e6Pj5B9oEnd7i+vvJm+6uBG3Yomc1OCzx2r3n4JxZYQGi5
 mo9T6zDqcMF64iHHLR/6JK3OhEsl6ad96+ymiRjAglD5S1ZcqOPuUvUBJ83nYl9t+n1L
 zWX76F0gG1kePVkfuFMflvJYqSg38bUBeS9CA455uUqo6xJku4Yi+jHmiTL+Mgc2WeQ8
 hvPDspbCZ8+b9jYfq0HBODIitTZjgKQg76IOYBkk56k1x7dt6+7l6XunlZXuB3DpOxBq
 jKtj8qN+99PkVEMWZ8viC5EcAgNYU+hgOlOAAsdXrL114pqTzJNXeJE4o1T3+5NNUJK8
 aBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hyaSOIbReSL6tUsH+Skzy33KPfP0HGHCZLyG/jrv3FY=;
 b=Y/mIubioQF26/V42PaLKn0MsZmupbG+T35M8NqPjc0kbyfYUP/D98ueZm5NsZkMbNn
 iZCDDLNFOdBr7mrXPY+9jvlX2IjxOydFKWoSnmCfg+pfKrTooRwPMMeEF6YKu9ueSh11
 puf1bc2pnGap7rPbL1GXMdJcfCG3Se1z/Z/CVJPIRzTJ/aexWKSafvOqEZKFjF6+AmOc
 FpcpRGdJX3ztGyY41F7WhRAzoBveSlTQ4iuVlL1kDPToipm/Rqr+drPRF4EXnx1+OIsb
 xFVnRoA823uPPzhiHe9IjeBzJ1wKl43O6iTU8Kwq8gzaWdAgKbVJ6nqJ7fJw9qmMK/ph
 vYhg==
X-Gm-Message-State: AOAM531WiMSandi0MU8MN0It5PgvCs6ru45Xu9dBxYWwAYy+7Dl8NqG8
 43Hpi61JSGpjGzArmwXvnUCi4sYc92aTrHZ7iII8Bw==
X-Google-Smtp-Source: ABdhPJz1yhDsrjxt5iuUJSYxaKW7TUYTFXji5+EQlJTuYxpwOcJOBpSvgqPIa2hCJQeH5AJ23YPp1XdJB/XTrAg6C9Y=
X-Received: by 2002:a05:600c:2259:: with SMTP id
 a25mr120560wmm.133.1631639685000; 
 Tue, 14 Sep 2021 10:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210914155342.1296339-1-richard.henderson@linaro.org>
In-Reply-To: <20210914155342.1296339-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Sep 2021 18:13:54 +0100
Message-ID: <CAFEAcA-f=n6XHp5Cj7=tH8NWO1GLA50i34=5GyaHrZELyr0bjw@mail.gmail.com>
Subject: Re: [PULL v3 00/44] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

On Tue, 14 Sept 2021 at 16:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Version 3: Rebase and fix a minor patch conflict.
>
>
> r~
>
>
> The following changes since commit c6f5e042d89e79206cd1ce5525d3df219f13c3cc:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210913-3' into staging (2021-09-13 21:06:15 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210914
>
> for you to fetch changes up to a5b759b6dca7daf87fa5007a7f5784bf22f3830f:
>
>   tcg/arm: More use of the TCGReg enum (2021-09-14 07:59:43 -0700)
>
> ----------------------------------------------------------------
> Fix translation race condition for user-only.
> Fix tcg/i386 encoding for VPSLLVQ, VPSRLVQ.
> Fix tcg/arm tcg_out_vec_op signature.
> Fix tcg/ppc (32bit) build with clang.
> Remove dupluate TCG_KICK_PERIOD definition.
> Remove unused tcg_global_reg_new.
> Restrict cpu_exec_interrupt and its callees to sysemu.
> Cleanups for tcg/arm.

This throws up new warnings on FreeBSD:

../src/bsd-user/main.c:148:1: warning: function declared 'noreturn'
should not return [-Winvalid-noreturn]

Unlike linux-user, where cpu_loop() is the direct implementation
of the target-specific main loop, on bsd-user cpu_loop() seems
to just call target_cpu_loop(). Since target_cpu_loop() isn't
marked noreturn, the compiler complains about cpu_loop() being
marked noreturn.

Easy fix would be to just drop the bsd-user part of
"user: Mark cpu_loop() with noreturn attribute" I guess.
Otherwise you could try marking all the target_cpu_loop()
functions noreturn as well.

-- PMM

