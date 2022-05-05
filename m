Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0404951BD76
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 12:47:43 +0200 (CEST)
Received: from localhost ([::1]:35922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmZ1H-0004Gh-43
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 06:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmYaj-0008Gm-J8
 for qemu-devel@nongnu.org; Thu, 05 May 2022 06:20:13 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:43895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmYah-0003fQ-MW
 for qemu-devel@nongnu.org; Thu, 05 May 2022 06:20:13 -0400
Received: by mail-yb1-xb32.google.com with SMTP id g28so6790036ybj.10
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 03:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oCcmjq+KLY3vt2KkeOarmC/lBvM+SdG85UFm9C3o/18=;
 b=ck7isc8UC74dw3GSzMNIria59n0FzcjCIfneyg5km1ofMztVcCOVR2ciHZKKvSCkSv
 CNO0g0IeqQehbaojxDTcfT5pcKFypRnQB7UC/zs/jGl2EZco2oh88AEdSg4O0H8yNlbm
 wpjDkYopjDN9X3NGZlkBZoZy5f8inB+5kI7rJUMrmgtvPxMk4OgZPs2qKvjvUzIHB/BU
 s+OBalPrtMu44LTHa3B5gnvX+7ByeGXtR0kuuPxkQeB8kxkovzlJVnATuM5rE9PwDKtF
 Fzl8VbHMdA9Tu9Cx4d86QS3lU3nI2mXQKrtXa7ADvw4BjtukHIvFIfjyRIxqwCjNwOvj
 u0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oCcmjq+KLY3vt2KkeOarmC/lBvM+SdG85UFm9C3o/18=;
 b=dL+bi1DryJGcENZtO54qIaWW3Km0703eyELP5t5YFIIfPk71zp0dCNXOAZWWHh7sKb
 pPcltunNuvQCFplabu4eZNelvKNhtdlSvE/blAycmXc3AZCVGdU5S7kG9jOpg/Tz3r70
 wKg59T0x4PYOmPghrSJ/1gmCxeFbfyNdrp3M7NJUjGRMuveKj0RktCi6RBkrkRjXNiF3
 EFGxUM17ZdBE5MNg/zUatnPRLCI6ZND2tRvn6wKUO6ZeamWmumMj08NjRsPLt22LFLux
 p4a1myPmJkHeb7/oEHdb0DDs7OFaSID1eAbhrA2d9BDnpEBmfHKGC69TpaUf1wtpttQS
 psTQ==
X-Gm-Message-State: AOAM532EwDNmXBzKZ/2HCpxInG77xTnhtICm4tVuqiBQCzFdw9LKcTX2
 0+pUUny7gaYmdO+jrSLoEcv5B1nMgctlhMmVJFGbgQ==
X-Google-Smtp-Source: ABdhPJwV8+bKyFwTI3bkOMldBUVD3dU9ub0k9QnCo5l9lDiJwf+4KhXjoffBa5O8A+TmH2GUiYjTZKtyr6zK7Ui529Q=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr21107949ybq.67.1651746010440; Thu, 05
 May 2022 03:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <4ad779bc-09f6-4041-d671-624fd0e22cf9@web.de>
 <CAFEAcA-8Awh2jbKTBCig7C-oAfVhs3iuP3E6EzkW=DVAKSZ0=A@mail.gmail.com>
 <b46706e1-cf63-446d-f614-4c6adf16d72e@siemens.com>
In-Reply-To: <b46706e1-cf63-446d-f614-4c6adf16d72e@siemens.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 May 2022 11:19:59 +0100
Message-ID: <CAFEAcA_G_Ff6CNu9T2E2bj7UjovDy=DqPy79igoz=QVrh=TEpg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: virt: Add SBSA watchdog
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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

On Thu, 5 May 2022 at 11:17, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 05.05.22 10:40, Peter Maydell wrote:
> > On Sun, 1 May 2022 at 19:07, Jan Kiszka <jan.kiszka@web.de> wrote:
> >>
> >> From: Jan Kiszka <jan.kiszka@siemens.com>
> >>
> >> The virt machine lacks a watchdog so far while the sbsa-ref has a simple
> >> model that is also supported by Linux and even U-Boot. Let's take it to
> >> allow, e.g., system integration tests of A/B software update under
> >> watchdog monitoring.
> >>
> >> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> >
> > The virt board has a PCI bus, and QEMU has a model of a
> > PCI watchdog device -- the i6300esb. Can you use that?
>
> While one could do that, it implies using completely alien Intel x86
> host controller bits on this platform. And, thus, would require changes
> in firmware (e.g. adding a driver to U-Boot).

> > In general I much prefer it if we can support use cases in
> > virt via pluggable PCI devices rather than hard-wired MMIO
> > devices -- it means that only users who want the functionality
> > need to have the exposed attack surface area of the device
> > present in their VM.
>
> Valid point - would making this opt-in via a machine feature be sufficient?

I really strongly prefer the PCI device solution. If you don't
like the i6300esb you could write a model of some other
PCI device.

thanks
-- PMM

