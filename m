Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAE24000A1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:38:05 +0200 (CEST)
Received: from localhost ([::1]:51860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM9OO-0005S6-Av
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mM9AQ-0002pk-Fz
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:23:38 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:53914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mM9AN-0007nI-JI
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:23:38 -0400
Received: by mail-wm1-x333.google.com with SMTP id i3so3504621wmq.3
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 06:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OJaxIOJAAKfHE4hL68I6p1KxAs+vholqzxNQZ6yTkgM=;
 b=xVdZhITs3E1JNbcQdWNxCxfNaUzSm5NmamkLFA3kE5XR5+A/7gsT//ldU7k7HC+RsY
 WXJuKxZNVAaMQdWcYSiirZLgF/BsyfRfJaXa9suXB0hVTj5AuOTL9FJniksk1C67wIMj
 Bp1jITIxCy3omUPIQHuFGgF+rOoImoV9cIRY8/6AOFWCv9WKuP6ycxazCsv5WzMgVtMC
 qX7TP3VuepuB7Ta87b/tUV/90RcSsA/dV3Nq+EsX1Npmzx6QIusIN75qF8Kzcibv8fIb
 sGXEVPMcJ47yQiRfBiMLZ3qj59IHyPM/MMdSmwHnpmiKb1ogbp9tqht8HmfUBF55ou+k
 0GWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OJaxIOJAAKfHE4hL68I6p1KxAs+vholqzxNQZ6yTkgM=;
 b=MG+s2gcraJaoS3GJsHpS5PYbkcIBXTvYu8UdTM9VDoMG5KykLWRQoHeyE57Nr4sAtW
 7fFXHBeK/jNE8xkV3T6/pGZOX2zK2Gdej7mWKo74vbXLim4/8WAmA0GnRv+Q3mB+yhi0
 CIYgv3NwEYVpz2YOs3D29wu6nCp0bc3pAkypJW9X6Juwe8bou1kdU9yi5QYhp1oMasp9
 IP+i4ZUUwBNTQN82BPeUZ/ORLdMK/Bb/fnpB81jJLtctP2zSmd/cbTXn9/ZUQmBfs/ne
 ar0JuHuRvmE8B/8BFpGZh5xvJImWMxcOQrobKgC2euzk72qpa54ZUDIuPKzdZ7AIQH7h
 ZCpw==
X-Gm-Message-State: AOAM533ok1nBNsnE14j1KY9rH6Ngb4rmbjdmB3bj8k5mssIdlyYuwVlO
 bCCelolxk3EtkcQG5ZMaib4aFtPzE7vCioXTC9/59g==
X-Google-Smtp-Source: ABdhPJwiJRR5v+qoqINJSTN4/d5AN1Vg0HI4MEbpYmHHAqOBQdn6XdKsrw8WbJTdtQ81cGwRUe03xhSqXs3iw9Fm7Ww=
X-Received: by 2002:a05:600c:4f46:: with SMTP id
 m6mr332636wmq.133.1630675411564; 
 Fri, 03 Sep 2021 06:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210902124911.822423-1-thuth@redhat.com>
In-Reply-To: <20210902124911.822423-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Sep 2021 14:22:42 +0100
Message-ID: <CAFEAcA89mGzirJWyzH+-c3WtH3G=XYV0MqRfBK+5SnA+Hob-eA@mail.gmail.com>
Subject: Re: [PULL 00/13] Testing, build system and misc patches
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_XBL=0.375, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Thu, 2 Sept 2021 at 13:49, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter,
>
> the following changes since commit 59a89510b62ec23dbeab8b02fa4e3526e353d8b6:
>
>   Merge remote-tracking branch 'remotes/stefanberger/tags/pull-tpm-2021-09-01-1' into staging (2021-09-02 08:51:31 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2021-09-02
>
> for you to fetch changes up to c72dc94b74fb1686decc0ca4c2b05e5bf2e5b74b:
>
>   softmmu/vl: Deprecate the -sdl and -curses option (2021-09-02 14:43:58 +0200)
>
> ----------------------------------------------------------------
> * Add definitions of terms for CI/testing
> * Fix g_setenv problem discovered by Coverity
> * Gitlab CI improvements
> * Build system improvements (configure script + meson.build)
> * Removal of the show-fixed-bugs.sh script
> * Clean up of the sdl and curses options
>

This provokes a new warning from meson on a linux-static build:

Run-time dependency appleframeworks found: NO (tried framework)
Library rt found: YES
Found pkg-config: /usr/bin/pkg-config (0.29.1)
WARNING: Static library 'gbm' not found for dependency 'gbm', may not
be statically linked
Run-time dependency gbm found: YES 20.0.8
Dependency libpng found: YES 1.6.34 (cached)
Dependency libjpeg found: YES unknown (cached)

If we're building statically and we can't find a static
library then (a) we shouldn't print a WARNING and
(b) we shouldn't then conclude that we've found gdm.

thanks
-- PMM

