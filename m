Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBA25D3FA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 18:12:28 +0200 (CEST)
Received: from localhost ([::1]:54882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiLON-0006JV-Sf
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 12:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34311)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hiKcy-0005Rn-Fz
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:23:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hiKcv-0002TJ-VM
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:23:28 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:35576)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hiKcv-0002Rw-Fm
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:23:25 -0400
Received: by mail-oi1-x241.google.com with SMTP id a127so13344687oii.2
 for <qemu-devel@nongnu.org>; Tue, 02 Jul 2019 08:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sdlUlz3+Hpw3vHFFzmWRyobbrzu0f+uChCMbem+yFT0=;
 b=HLLGDnSLAyq6szSPrUcV3fw8KP1ILSpMRCsO5uZIRF+TKYQqm71dRfgwQk+bMDTyzb
 HQCodhcIEvdnBaKR/Lj2j9Jphc2o5/9HauYRatVQxfAGf4zDpuiRZPeB8Y2b5x2F/5lH
 RiHo6aJqic0hgRdP9s81LfJTpzcdL2/O9xw28+BdVpSGQBeG1qN8NlDzifIO3ecVmpZO
 lTHtiBAj2tIdgEofPr+mh/6AH1rwIUPPQN+tmqoVzdOFlya3ViT3QsSYHSVW2ummNXUq
 oRd/tqghNO9EtFKSQzNmvv6/2Lz7N/LAjUy2CUfUd8aF7/pBUVFYkD3UBywgZ71N0GpV
 TPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sdlUlz3+Hpw3vHFFzmWRyobbrzu0f+uChCMbem+yFT0=;
 b=bElrT4++gLjw46nJ2qaUhkFR0n/O1KiRj7+m/maVw5m14SpaQoQVOfoEK2qG7BiSM/
 P98bCLKot5QjLLiVpvip/sz2L9ZbHzbwogU8oCLvu88PGS7yZhm0MNVUqqEvvtoeL5IV
 RtuSL5AqNkJ1G/tCVEja/P2JTDFoMw89Dt91H7vA8+AMvbwFCJh6Vhs2Agmn+eZATRxc
 HRxwAy8fhP8wPY44Z2Nbo3rU8Mt84eMq2YKAn9/S0UoISU4gGd0jq0byr8kUdo8KV8vE
 2DtTy/P2GuoMUJ0U560i6WNfhu+vFlqv4Rge964rgdeXmnf1Liqo3FxfD/MHsCB6IZbu
 kqpg==
X-Gm-Message-State: APjAAAWrN6JsiqMsbUVO5Pf+44UCDEAcvPYhbawwhr7yrnPPByNjLXkN
 rWuchSXZ/VW51hNcUlq+6VYSQ/60GLj1toj5rWRlDQ==
X-Google-Smtp-Source: APXvYqzYrzB8FFxyXtEZ2z+EwP5LoGbOzMBe0LpC9K4BWwTnzlxgQsbbHEoiLKe+r3W6TUHIkVolC1LcwSYsRQTV/QQ=
X-Received: by 2002:aca:6185:: with SMTP id v127mr3485563oib.163.1562081004203; 
 Tue, 02 Jul 2019 08:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190702121106.28374-1-slp@redhat.com>
In-Reply-To: <20190702121106.28374-1-slp@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Jul 2019 16:23:10 +0100
Message-ID: <CAFEAcA-k76t9_TJnYSF_kocgba9dYMyf=Q6OBY2VVuhiWsbqrw@mail.gmail.com>
To: Sergio Lopez <slp@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH v3 0/4] Introduce the microvm machine type
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, maran.wilson@oracle.com,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Jul 2019 at 13:14, Sergio Lopez <slp@redhat.com> wrote:
>
> Microvm is a machine type inspired by both NEMU and Firecracker, and
> constructed after the machine model implemented by the latter.
>
> It's main purpose is providing users a KVM-only machine type with fast
> boot times, minimal attack surface (measured as the number of IO ports
> and MMIO regions exposed to the Guest) and small footprint (specially
> when combined with the ongoing QEMU modularization effort).
>
> Normally, other than the device support provided by KVM itself,
> microvm only supports virtio-mmio devices. Microvm also includes a
> legacy mode, which adds an ISA bus with a 16550A serial port, useful
> for being able to see the early boot kernel messages.

Could we use virtio-pci instead of virtio-mmio? virtio-mmio is
a bit deprecated and tends not to support all the features that
virtio-pci does. It was introduced mostly as a stopgap while we
didn't have pci support in the aarch64 virt machine, and remains
for legacy "we don't like to break existing working setups" rather
than as a recommended config for new systems.

thanks
-- PMM

