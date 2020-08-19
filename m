Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B5A24A5C8
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 20:17:35 +0200 (CEST)
Received: from localhost ([::1]:40760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8SeU-0006pq-GD
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 14:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k8Sdg-0006Oz-0s
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 14:16:44 -0400
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:33448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k8Sde-0000KJ-84
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 14:16:43 -0400
Received: by mail-ej1-x644.google.com with SMTP id jp10so27461619ejb.0
 for <qemu-devel@nongnu.org>; Wed, 19 Aug 2020 11:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ANMMOVsnMoO2eYzlWiEzP4qTBnlBNp1tq6TGPNzIs9w=;
 b=oyPIb17poglMc3NAJ+r5b/l3q/rJpJ9N+jjN+OK+qtSfzQnuFbZ3kdmhqAd5X/yNf6
 7QKwmfxrfjkFH0lmMMyfuyt+7B6xXB7qUro5dhPJDvNFB9Yt+lRbb9acHsTiMegCtyvX
 j9wSw3hl96j+bW0xHvlh99rTA39qLY+HsYQue3CHGzKRm/iOEtTyiSsQ1LMHxiuHxAng
 UjOELXyhNG7uc6ucRKf0G6VkX4S6coP/IRE8Y2FxysnGhPXRATzeJ/TEwy81BxrK4bno
 s5PpUniJmV2+iORFSdi8LTStmP9n6YYCx1OKJBBIMxr9emoJd7pm/+MXqOWsAiYx1pg4
 egSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ANMMOVsnMoO2eYzlWiEzP4qTBnlBNp1tq6TGPNzIs9w=;
 b=jUjQep/oNrCfdXqqisakX+XYG7JCB4/dE6LC1qPRYJW68KPe+BzthNGElGukptPdrt
 Ojhtf3LRmzLBGjelBZccIpuS4QEUeNmGgo/15g5lCH78pMjPxZy1BAyU15rZn8JBxUrH
 3FU1EZgKlOd99/wxokiJGLCXRm2vhmPQhqjs4QI9hbdr+KrbUUAgDYaI45LloXczm7nD
 +n5FMfAo2bfb/036qBIMbb0U4+g2d2BrHwJzri/mLvj2BPwF9Oaa7Nl9eXx9AswbjHd2
 jI68hI3ZbuEV36Nhs2HHjApKCV5GC7O/K08azGQ6UKqGwmlTEqKZ8M9GVhg/iQooeIu7
 VWCg==
X-Gm-Message-State: AOAM531p1CyOOwJr0+TzjNIPmTUQl9YBHpRa4cGEiAiYdZ30KrVy593e
 H7Zv8OTkiDEXeIUzk7kPbUP26Gnh0T52iEXdTtnx+w==
X-Google-Smtp-Source: ABdhPJzCpo7Vn9cX+s/lcCBQej/0stEu0rjFtdvgREcQqi1Tx/0SHVpdoygaY+mF2ke/xElS3y7gMX1Q01QcMbS9QrM=
X-Received: by 2002:a17:906:2cc2:: with SMTP id
 r2mr25773132ejr.482.1597861000256; 
 Wed, 19 Aug 2020 11:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200819143525.2175-1-pbonzini@redhat.com>
 <CAFEAcA_8VJecDyK8FR0ty=pknmo+Hc5s0OFj+-Y1Ah-OJ01FDQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_8VJecDyK8FR0ty=pknmo+Hc5s0OFj+-Y1Ah-OJ01FDQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 19 Aug 2020 19:16:29 +0100
Message-ID: <CAFEAcA9jt21RHiu1eqAzK_PJAj9i6Ej27jT2=gfjSRZVjJsDKw@mail.gmail.com>
Subject: Re: [PULL v6 000/150] Meson-based build system
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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

On Wed, 19 Aug 2020 at 19:12, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 19 Aug 2020 at 15:36, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > The following changes since commit d0ed6a69d399ae193959225cdeaa9382746c91cc:
> >
> >   Update version for v5.1.0 release (2020-08-11 17:07:03 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/bonzini/qemu.git tags/for-upstream
> >
> > for you to fetch changes up to f5b5ef3b9f94d744f514f5469c97d3f80305111e:
> >
> >   docs: convert build system documentation to rST (2020-08-19 10:01:48 -0400)
> >
> > v5->v6: improved incremental build
> >
> > ----------------------------------------------------------------
> > New build system.
> >
> > Missing:
> > * converting configure tests
> > * converting unit tests
> > * converting some remaining parts of the installation
>
> Testing with what I think is the later commit 84264b99322

> Everything else seems to have passed.

Spoke too soon; "make --output-sync -C build/all-linux-static check-tcg"
failed with:

  BUILD   TCG tests for mips-linux-user
  CHECK   debian10
  CHECK   debian-mips-cross
  BUILD   mips-linux-user guest-tests with docker qemu/debian-mips-cross
  RUN     TCG tests for mips-linux-user
  CHECK   debian10
  CHECK   debian-mips-cross
  BUILD   mips-linux-user guest-tests with docker qemu/debian-mips-cross
  RUN     tests for mips
  TEST    threadcount on mips
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
timeout: the monitored command dumped core
Segmentation fault
../Makefile.target:153: recipe for target 'run-threadcount' failed
make[2]: *** [run-threadcount] Error 139
/home/petmay01/linaro/qemu-for-merges/tests/tcg/Makefile.qemu:76:
recipe for target 'run-guest-tests' failed
make[1]: *** [run-guest-tests] Error 2
/home/petmay01/linaro/qemu-for-merges/tests/Makefile.include:450:
recipe for target 'run-tcg-tests-mips-linux-user' failed

Which doesn't look on the face of it like it is a build system
issue, but on the other hand it's not one I've seen before with
the old build system...

thanks
-- PMM

