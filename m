Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44C62C5987
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 17:47:49 +0100 (CET)
Received: from localhost ([::1]:47600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiKQu-0007Sq-ER
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 11:47:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiKPb-00070y-NV
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 11:46:27 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:34169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiKPa-0006mu-2E
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 11:46:27 -0500
Received: by mail-ed1-x52a.google.com with SMTP id a15so2960615edy.1
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 08:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SGAr6aa+IGUgk0PsF2IXKk0VGAUTw21whbGQ1ep6dQo=;
 b=WZauV92wHHYE+Xt+Z5SpXIwLsr7+U1IcVLZiu9ySapvvLNlMkk3nOb9YxSucjfMy2C
 PzybYfNgE+oLBYW/eAjFRSlDTvQzTGzv/M5hlprezui0A8OlEIYs4kWISqLJ4YhgcmqD
 THoED2S7Tm2Y1RpauRlvPbslLq7izryy0huqHWRxWahknu3nRW6F3/bBp4N8ESOzq7aQ
 FrqMVu84jnQ9lol6kk+thtUU6pLOKE950YWhw552wuS49tzEEQJbp8wnj6h5rHwUKNhP
 5QGDGAat38ezUVSp/8xI2TczmdHtEU6dACweMnZjzam7Fn46147xlDS+9Ef9YycsuOhw
 Irsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SGAr6aa+IGUgk0PsF2IXKk0VGAUTw21whbGQ1ep6dQo=;
 b=TrJuQZsbbOtXB3fOXlo46sz8dLMCqVw0gB0x3z0Lfm0IJwu7AQZ5abA8K3IA1sjzSB
 Ja1WHvCdco8aiY8HF2p9sbdoCbKwMHqgRnQus5y2mKtooE+UlnMw3UvU40hlVTwWzvTM
 nd9Ow/pNGLsZ+kKTpV8l2qtq2GTVfoWmty3lts7VshcQcExvnN0QYXwUE8/X/yfAFdE5
 6nRzx560D8lS1Xxde2oWkjtd15dGACtQ8VkVDXAS3lPTuvFxQ25L/kc49V6PWn4yYPpk
 JJGodHrI1iOvjLW00G5jSfOOWIXa1SY5HjvkD4LMCX3H2qU63gzymZxaoT2/xOyDztTA
 q/kw==
X-Gm-Message-State: AOAM531WVM4lhjPqlOv2Kcn3OunhfqUSdXu9/UmAJLjSc2uxzFshrn16
 EgfMYgWBa3h5iuFPB/8SuTufWnxlZbZ+vT/hmMlfUA==
X-Google-Smtp-Source: ABdhPJxGgPSGj7Yfu4kHxJdTSA6JYkN9wP7DclBkTmXPJ8WYXirb6oZVKJCS7CmNv3kexxm4Gyr4z0zGHi8aEgB3BiI=
X-Received: by 2002:a05:6402:30b5:: with SMTP id
 df21mr3436420edb.146.1606409184164; 
 Thu, 26 Nov 2020 08:46:24 -0800 (PST)
MIME-Version: 1.0
References: <20201126142218.3121595-1-pbonzini@redhat.com>
In-Reply-To: <20201126142218.3121595-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Nov 2020 16:46:12 +0000
Message-ID: <CAFEAcA-gX4nqK+vDFW145P0jhKKr0Mns1BSNhQKvQZ6UkPYL1w@mail.gmail.com>
Subject: Re: [PULL v2 0/4] Final (?) batch of misc patches for QEMU 5.2
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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

On Thu, 26 Nov 2020 at 14:24, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 8cc30eb1400fc01f2b139cdd3dc524f8b84dbe07:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-sparc-20201122' into staging (2020-11-22 15:02:52 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 24bdcc9608fad3dce2bcf3362722493f1ba0f3eb:
>
>   nsis: Fix build for 64 bit installer (2020-11-26 09:20:48 -0500)
>
> v1->v2: dropped i386 patch
>
> ----------------------------------------------------------------
> Remove obsolete setuptools dependency and fix Stefan's
> Win32 builds.
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

