Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3CE37A3ED
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:42:58 +0200 (CEST)
Received: from localhost ([::1]:49378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOun-0004YR-8S
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgOXe-0006rW-2f
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:19:02 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:46946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgOXX-0003Rz-6C
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:19:01 -0400
Received: by mail-ed1-x531.google.com with SMTP id r11so7164841edt.13
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 02:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lhz56OwpPmoQjO5Hh2ImHsrmO0lfpzx/pg+tMbFJhA0=;
 b=YqX69Z5K2dnzk0E1iaTDftLZjmLSmfbCdjGz2Np9xvSP1vvL2iZ4uFfRgOcSE+Vqis
 4/GaD1GkWHHct3dw6+3uBqEAf5Ww04ZxvukkH8BGU8niMqsivo9Bwaf331mWzU9ZY0WU
 9I5NwdBkN2PKSvwl8qd/g/2fPEOWu+rroKgb85E/CyHNPxrSCm952j4NYH1FB/nakeG3
 GsGLSULA4kTSRUfIZpNX5Sjib084YHmTL36vJfA5DpW+P/B+0srB2/JaoFE03WAigkm2
 37DAhQIS5Sccjn0hcTMuHz+Qm+FjS3lMp5Uhh0Uj5aVKElrTTXnGPBfO7A11A/1S2pNi
 nzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lhz56OwpPmoQjO5Hh2ImHsrmO0lfpzx/pg+tMbFJhA0=;
 b=UxaUFfbN1OeWR0hXdQwTWqCfkrRZcTAYroVUO5xaUC7RLK8Y+WU43ga1wCj4/7TeNL
 j+H5iykXnu7TR70maM/gWvMc1HdFyYAFFeDPV6kmp6Lp96dmvrc0b5ZZIqTR6/AW/Hra
 S/Mp7U0qynXNYq3s1NAA3j9+wPEreXuBLq0uLjjtxqD8xAh7X5ZwmxNO6dzE9nhQChAS
 waailRpwP/I7Sv8ZMiM+hpXKeb0sodNBrAkbFNzL+C1j5Oly+azE5W8ILi9n2R9GptGL
 dMKN2HlrB7WZTllUadbT72jMZbp7UTCPXlN4wxKNUBXDq7WDmR8HjzI0qs84p3vQmh4h
 EDZw==
X-Gm-Message-State: AOAM530e7pZz+kpE4xwaAro9TCsZbKE1SRwgjkXoUvw8a1ZuSGCJjs09
 qwqAdSr8Mdk7ItvGxozRmu/nbYbUayEc+KO2DSPuUA==
X-Google-Smtp-Source: ABdhPJyPdFgFxEw6YJhmZvjZ9vYaUgawuwPr4Y4UffuvcrgkQkPxWUQvvMCiEzlJJrGMvjCE2pL89XbYhUZl5ruzne4=
X-Received: by 2002:a05:6402:1d8f:: with SMTP id
 dk15mr32514452edb.146.1620724733449; 
 Tue, 11 May 2021 02:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210506193341.140141-1-lvivier@redhat.com>
In-Reply-To: <20210506193341.140141-1-lvivier@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 10:17:41 +0100
Message-ID: <CAFEAcA8d6BQGHWUPp2cu-8eqYpXh5S6uV8va2A0KSq=f+9aWaw@mail.gmail.com>
Subject: Re: [PATCH] scripts: add a script to list virtio devices in a system
To: Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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

On Thu, 6 May 2021 at 20:36, Laurent Vivier <lvivier@redhat.com> wrote:
>
> Add "lsvirtio" that lists all virtio devices in a system
> the same way lspci does for the PCI cards.

This is cool, but it's not really QEMU specific -- it should
work on any Linux guest running on some hypervisor or hardware
that exposes virtio devices, right? So I'm not sure it really
belongs in QEMU's source tree...

If you're a distro packager you'd probably want to have this be in its
own package or at least not in the same package as the QEMU binaries,
for instance, because this lives in the guest, not the host.

thanks
-- PMM

