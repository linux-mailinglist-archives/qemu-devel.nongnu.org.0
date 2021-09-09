Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 666ED405A05
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 17:05:01 +0200 (CEST)
Received: from localhost ([::1]:48696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOLbo-0002XY-AH
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 11:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOLYS-0006lb-7j
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 11:01:34 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOLYL-0001d1-3P
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 11:01:29 -0400
Received: by mail-wr1-x434.google.com with SMTP id g16so3011088wrb.3
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 08:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uw3a+TzsPJLGYbFpgbSnxC/aUE3bhcn4QKMxlXNJOdI=;
 b=KmZdEo7iB9ETuCPjMxZTvl1/3wEgOXHaRTdaGiNo1YpBqH47/scXVFI6EyS4Dv/AyT
 HM5ERuApkoKcX+e60NQuIR2gsOCA5iyHhgVlLcTBHhtXDVzp0QsaBJjHjz4wTV7/crRF
 a8ygugac4fk5qolD3J4AUGJEo07dEl85cobzY9lFpqOCO9oToggdazC++4gmjG0rjYXG
 K8G7pmmmysM2InC07S2s8eh8SKKg7dipZgtYTo1Y+2mD5QHzh+tq22XUR2lwW3xZ3p+9
 NJ9d4Ncpp45Nc/B9eDtdAOZ4tue30gHxq0xni3hXOtswopa1NjX+h1RY+qBqVljsI79r
 TjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uw3a+TzsPJLGYbFpgbSnxC/aUE3bhcn4QKMxlXNJOdI=;
 b=qr6opcBHogedVhwNGL4Y9RKfW+ocCRRMnJxXEnbPw0OGqCLCYwJalXAewdv/cK4m1J
 yZSVSWkdJY3vjCBVgLDNnCf3RVTf5j6dQ7st/V4y+xdIG5om3/FhkSGtii4WW0nANZer
 GGIrUsNUhjMZz0x1DRZVYKuNhn0rFct4fLqoRjji+c/shojKInHAs9qBAH+rzrctSTlO
 djaQXEDypqgLsOi6qOvSNiWLUJzs5+r+9bLZBsoKtLhbpJ6Z0tU6VyQ+fIVZZIXdNUwY
 NPEkSzcdztL7J1UJeg55XEdrqtH3xbLGGQDDNKMWrk8F2h9iut3VCETiG6hdZJNJiItb
 1Pcw==
X-Gm-Message-State: AOAM531DwuW+gQ/p2J1czArr37T54mOst6F/GIxISgNfnNRcrNaUQoRq
 umNT/AYfdENLVPkoQtBWtD0lgAo5ejVJ5kYahC7mY698Gzs=
X-Google-Smtp-Source: ABdhPJyCWH1VYMc89q1zSLD0+9T0rXHTz0FSxNoKMgd4iy2P3NQAfuq9EcRi6vz6XOxAIg0VG4nVPaY24Pyx3tgHIRA=
X-Received: by 2002:a5d:6cae:: with SMTP id a14mr4243390wra.275.1631199682969; 
 Thu, 09 Sep 2021 08:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210907215332.30737-1-imp@bsdimp.com>
In-Reply-To: <20210907215332.30737-1-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Sep 2021 16:00:33 +0100
Message-ID: <CAFEAcA9kF08A1PyPmBXfWykWZwP4+MoPOvTn4diu13Dkq04SVg@mail.gmail.com>
Subject: Re: [PULL 00/42] bsd-user updates to run hello world
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Sept 2021 at 22:56, <imp@bsdimp.com> wrote:
>
> From: Warner Losh <imp@bsdimp.com>
>
> The following changes since commit f214d8e0150766c31172e16ef4b17674f549d852:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210826' into staging (2021-08-26 18:03:57 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bsdimp/qemu.git tags/bsd-user-pull-20210907-tag
>
> for you to fetch changes up to dc96376e46a52ac63a27ea185c3f0a6fd54e3c82:
>
>   bsd-user: Update mapping to handle reserved and starting conditions (2021-09-07 08:26:53 -0600)

>  slirp                                         |    2 +-

A bogus submodule update seems to have crept in here...

-- PMM

