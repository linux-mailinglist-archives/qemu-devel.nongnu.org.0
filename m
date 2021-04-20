Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1014C365935
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 14:48:07 +0200 (CEST)
Received: from localhost ([::1]:35884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYpnS-0003WO-3I
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 08:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYpfj-0008HO-DM
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 08:40:07 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:41841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYpfh-0008OU-PD
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 08:40:07 -0400
Received: by mail-ed1-x52e.google.com with SMTP id j7so7966526eds.8
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 05:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a2XHWKLD5lxI17OV8Z1HMszFDbeXH9zC+F+5aHYxxkQ=;
 b=l2XA9RYv2G02YbXrJqDm9D2SCgYZail6i4sIayFdac10+RNHVxgTGMI35tMKhE8pgx
 jioiWJk1v42PoZNockDV88o8plnN890BQrCA4iFkLEoZj+PGijuMTxi5mN5amR5fwlAL
 d9Lv16ZYJtKCdY7FXtghuDjAWvTZVbmKKxmEyahJmvy5L8afxS6k6tX5WvyGYklONgvY
 JoGJQRYk7cL+2qhysrlwMG/GZpD7QBTHitfdNVg0oGY4RAK8qjnjyZUZeE14+6pEe4XY
 OtRSOTiBC8UG1pvJTKjaQepymjbYmOpKG0vn0/c68+LWL1M9q8+ToPfwC6S4WPdVARU0
 afSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a2XHWKLD5lxI17OV8Z1HMszFDbeXH9zC+F+5aHYxxkQ=;
 b=L/EKcEebhMq7yr+N08xiUHCfaEwbMI+Ixh3+Iuj0IwHb/Yijv9i7Hx5Xq04cwTPE/h
 8a9B9/Hz/l/xmLNIh3JZPJ44ZCcuX1Sk5EVIDQvoz265WoGcAS1pUQlqo6ZYjkUFotm9
 tKHH8C/yYOxAmOWKC5cq/aSQH2GqZ5t2+E3GVoXFopscxhb9sdfzb86yd1kE4Wkb0R7Z
 OuQr64oQEk5Tw78plVc8o1bk6NbF71n1+vRpuD/yXxhgSIL6YEG/b6Lo4oQXo8hAhJJ4
 LlAcPOWdqauYzvF+cnezsxxe6RXgwI8KJL8Aw2nW8wHc5jEW4o+BuYAgTX/U83z4WCzu
 1Leg==
X-Gm-Message-State: AOAM531tXuUYNbzS0vWRWt+7ealAU779UVmTnY4L6mFtVPCSnv5keJ2I
 O1thBfvlXksvjkA5Ax65ox0nG/3oFhXHgXURTvZyyA==
X-Google-Smtp-Source: ABdhPJwr4zeKCKwKqFzaoXTkzNyDwXl8FtQFzpBN+kC59ZqAI/bWI4D4L+mwFJqVLRN2PFup5gWTpJtoQ7FogA8Gsrg=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr31792707edv.44.1618922404127; 
 Tue, 20 Apr 2021 05:40:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210325163315.27724-1-peter.maydell@linaro.org>
 <20210420062357-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210420062357-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Apr 2021 13:39:12 +0100
Message-ID: <CAFEAcA8Cye=jxLX+wKFimov8bo=F_6VF=tFbjskDo3Qe=6O8+Q@mail.gmail.com>
Subject: Re: [PATCH v2 for-6.0?] hw/pci-host/gpex: Don't fault for unmapped
 parts of MMIO and PIO windows
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Arnd Bergmann <arnd@arndb.de>, qemu-arm <qemu-arm@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 20 Apr 2021 at 11:24, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Mar 25, 2021 at 04:33:15PM +0000, Peter Maydell wrote:
> > Currently the gpex PCI controller implements no special behaviour for
> > guest accesses to areas of the PIO and MMIO where it has not mapped
> > any PCI devices, which means that for Arm you end up with a CPU
> > exception due to a data abort.
> >
> > Most host OSes expect "like an x86 PC" behaviour, where bad accesses
> > like this return -1 for reads and ignore writes.  In the interests of
> > not being surprising, make host CPU accesses to these windows behave
> > as -1/discard where there's no mapped PCI device.
> >
> > The old behaviour generally didn't cause any problems, because
> > almost always the guest OS will map the PCI devices and then only
> > access where it has mapped them. One corner case where you will see
> > this kind of access is if Linux attempts to probe legacy ISA
> > devices via a PIO window access. So far the only case where we've
> > seen this has been via the syzkaller fuzzer.
> >
> > Reported-by: Dmitry Vyukov <dvyukov@google.com>
> > Fixes: https://bugs.launchpad.net/qemu/+bug/1918917
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
>
> Looks ok superficially
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>
> Peter pls merge if appropriate.

Thanks; I'll take it via target-arm.next for 6.1 (it'll need
a tweak to use hw_compat_6_0 rather than hw_compat_5_2 so it might
need to wait until the patch adding hw_compat_6_0 hits master.)

-- PMM

