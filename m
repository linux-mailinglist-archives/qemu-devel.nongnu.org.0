Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D688152D1E9
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 13:58:49 +0200 (CEST)
Received: from localhost ([::1]:44026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrenf-0002HI-Po
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 07:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nreko-00018p-Fo
 for qemu-devel@nongnu.org; Thu, 19 May 2022 07:55:43 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:40029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrekm-0006Mq-GU
 for qemu-devel@nongnu.org; Thu, 19 May 2022 07:55:42 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2fedd26615cso53917077b3.7
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 04:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pexNsgLGVTeWsKeHsOqPzecARyUJ5Vf+WroJOUF151c=;
 b=tQ3FsqojiZI1KcTubQ00VUZY6n3yMEDqnRTh1azCVKWKTIICO06DSjvRJXcpBRRGBT
 wz4ocvjG0pZUJiezO9cYyk+uWCx2zli9h8u5U5H5ho3FV/Ogex78aFb8XWqNougRR2dD
 SRQxh0HXE0tZ3+6B6cgh2es/FIdzPvA5drxvCQE1fuYIVh7HGdCNi+OBWYHtiPKKQFqu
 6J/+6MxBrzlWUp/kKVemhlEHOnHwzXD3cUlgmUi67kOrPqx2rp2MBRgvgnkYn/rvOGX4
 zOjb4TvmydR/qpDDk53+4u/NUDrTxfNxx4WoTNxV17gJ9QBRpSix8UoDjEaZVLsR1sS0
 JSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pexNsgLGVTeWsKeHsOqPzecARyUJ5Vf+WroJOUF151c=;
 b=c8Z6lbBgVtdoq0sB0lL4TkxxN+lSfP2o5KEXDqzbiiMHx90HfDu+OQf7gkQQJx8EwX
 e4aYCrTCyFT/glaseA3XM6KkhU0d120jSC/XoOhkZCojfxYN+HxFmzIZ50UJtfHvb9vG
 QMcruG50uHOzKWLvSY9+RB5cWUZnBQATgMkWWkF1GaMIlCYS4sR2hckF+OPjhMXdzqdr
 ofIhXe6qlmcTjq+eqczLEIGLvhnszOYCP68UA8eiqrMl4aeHn7FbeL4UgaG+HhVcJnAI
 t76xxWOsS5SFkw/Abc6OIwavsr9x7xayQvYnlXtYa7JYAqlDow+p5ZCRL+LELGfznc/j
 TCYA==
X-Gm-Message-State: AOAM53207fBsJqtNWSzTyyRpYnea9hLCR2l2xtwQBpEE6Kj3xV/zMvQ0
 0e38Tpti9aqzANFOmotsorRLVOs9bk+zfc4lClDPHA==
X-Google-Smtp-Source: ABdhPJwDQ1FzQFMumEpMjwzRvrVg+6HnzbHbt14bZeGX0ldbQqUxKyCp0cRxkQuW9pebecw/bfKodr5+upXMG7Od3r8=
X-Received: by 2002:a81:1dcf:0:b0:2fa:d094:14ff with SMTP id
 d198-20020a811dcf000000b002fad09414ffmr4263490ywd.10.1652961339431; Thu, 19
 May 2022 04:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220518090438.158475-1-thuth@redhat.com>
 <c3fdc5fa-9bb1-dfb8-d763-1a0946f15aa5@linaro.org>
 <47c757d4-5576-cb24-6f90-027892a30720@redhat.com>
In-Reply-To: <47c757d4-5576-cb24-6f90-027892a30720@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 May 2022 12:55:28 +0100
Message-ID: <CAFEAcA9JjSy2BE5FHaGY+JVRX7QHQnA43i=sRndtADfBE1yWuw@mail.gmail.com>
Subject: Re: [PULL 0/8] Misc patches (Gitlab-CI, qtest, Capstone, ...)
To: Thomas Huth <thuth@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Willian Rampazzo <willianr@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On Thu, 19 May 2022 at 07:32, Thomas Huth <thuth@redhat.com> wrote:
>
> On 18/05/2022 18.12, Richard Henderson wrote:
> > On 5/18/22 02:04, Thomas Huth wrote:
> >>   Hi Richard!
> >>
> >> The following changes since commit eec398119fc6911d99412c37af06a6bc27871f85:
> >>
> >>    Merge tag 'for_upstream' of
> >> git://git.kernel.org/pub/scm/virt/kvm/mst/qemu into staging (2022-05-16
> >> 16:31:01 -0700)
> >>
> >> are available in the Git repository at:
> >>
> >>    https://gitlab.com/thuth/qemu.git tags/pull-request-2022-05-18
> >>
> >> for you to fetch changes up to 83602083b4ada6ceb86bfb327e83556ebab120fc:
> >>
> >>    capstone: Remove the capstone submodule (2022-05-18 08:54:22 +0200)
> >>
> >> ----------------------------------------------------------------
> >> * Remove Ubuntu 18.04 containers (not supported anymore)
> >> * Improve the cleanup of the QEMU binary in case of failing qtests
> >> * Update the Windows support statement
> >> * Remove the capstone submodule (and rely on Capstone of the distros instead)
> >
> > Fails centos-stream-8-x86_64 test,
> >
> > Run-time dependency capstone found: NO (tried pkgconfig)
> > ../meson.build:2539:2: ERROR: Dependency "capstone" not found, tried pkgconfig
> >
> > https://gitlab.com/qemu-project/qemu/-/jobs/2473935684
>
> That's a custom runner ... who has access to that one? Cleber? Stefan? I
> didn't spot an entry for it on https://wiki.qemu.org/AdminContacts ...

The 'Runner' string on the web page says:
"(Managed by Red Hat - willianr/clebergnu)"

> Anyway, somebody needs to install "capstone-devel" on that machine - or we
> need to disable capstone in scripts/ci/org.centos/stream/8/x86_64/configure
> now if the machine can't be changed...

-- PMM

