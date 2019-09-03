Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E86A7118
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 18:54:47 +0200 (CEST)
Received: from localhost ([::1]:49386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5C4s-0002ba-GO
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 12:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43900)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i5C1O-0007e4-A5
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 12:51:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i5C1N-00029K-4e
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 12:51:09 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:46624)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i5C1N-00028d-0B
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 12:51:09 -0400
Received: by mail-oi1-x241.google.com with SMTP id t24so13274321oij.13
 for <qemu-devel@nongnu.org>; Tue, 03 Sep 2019 09:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YZqwi0aq+endEwrYnx1rYuf1Fjf4SeGrg361AKCqgXo=;
 b=wV9SaMOY6QXjf1U1U7+5YURAL+kLo5JXLd1hHTF0tpxX8OLTw2rU0FDSdIJc72EhjJ
 T437tQiP6EnlTOZQ3WG1J7EtwFDkjW6s9NMArz2kTNUAfLC/Tno+3xak/oeIWren9B46
 OsgT3pwJC4jFru0+HrPxpJ8T3JhWewqyL9Fv9+9lQY99w/ZtfeqYZ8YzgVb7ipl8ejQO
 IntBm0DP06TTOv4Q0FOV23jaUSqQ0vfDyqEN0SzYrXcA6cSR2YhhRRaang2GB9jBQK52
 GOQ+cwjBIqKS8ETX1gyxrmvYFf7M+CS/MFGq4HTKe6oP9FhFuft9a5KLwQELcmv2TzT1
 LlDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YZqwi0aq+endEwrYnx1rYuf1Fjf4SeGrg361AKCqgXo=;
 b=IC5BMdqzkHxr1og0wEVINvsk58VmGQRLygQWp602H3hrFtWbr1eVLYcz4FUXFYzqso
 7rQJJxu3kRS+c9qn4zGeXv3Vi64PC7nFRjR/KDeNpB4TL26WmSbH6GMRXuXwOs48V/8H
 NVNm8F9tqO+JGybdtqyAluP1iw1Ump8F3/FXUiEpV7ClrLDVDvIjNRgCChatgJjAJSW3
 FSwv5mJsfRd7jIp85OhRd9kXTHEo6ij06OKA6UesIFv0fU6NZes/Pdtz9z1+5IGbkf8x
 7esL6VcMMajK8ZU/NjzHP5fkXQdZAAYtvJE+v4ouYv4zCNSfwuQttRHZ90YTEurhiyQK
 8Guw==
X-Gm-Message-State: APjAAAVNPMK95A11Aviy2XmCBQ1qIWPHUGjSjZBG8CPYahXmEgZbe0dE
 fjHI1N5EduGkmjh4KKJsIyOTRQ+HKfvlyQBoMAEV0Q==
X-Google-Smtp-Source: APXvYqx30iv1NUjlPQ3nd+KV6kXa3QDXchfULRkvrzxlZaRNrbfPNQQxpaDv7ckies1qTzKKPUpdDfIx7DnFCYFcZMU=
X-Received: by 2002:aca:50d8:: with SMTP id e207mr197089oib.48.1567529467757; 
 Tue, 03 Sep 2019 09:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190902012647.1761-1-tony.nguyen@bt.com>
 <CAFEAcA-4Tpa4qTCBXMTX+1n3fDK48d3ZFYn5CckOD7weqAWrcA@mail.gmail.com>
 <20190903164712.GA85777@imac.local>
In-Reply-To: <20190903164712.GA85777@imac.local>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Sep 2019 17:50:56 +0100
Message-ID: <CAFEAcA-FAJV1XEAZ7bcrstOWPv6wpAuZ4WjVo8bf+ewiWQYopA@mail.gmail.com>
To: Tony Nguyen <tony.nguyen@bt.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH] memory: Set notdirty_mem_ops validator
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 Sep 2019 at 17:47, Tony Nguyen <tony.nguyen@bt.com> wrote:
>
> On Tue, Sep 03, 2019 at 11:25:28AM +0100, Peter Maydell wrote:
> > On Mon, 2 Sep 2019 at 02:36, Tony Nguyen <tony.nguyen@bt.com> wrote:
> > >
> > > Existing read rejecting validator was mistakenly cleared.
> > >
> > > Reads dispatched to io_mem_notdirty then segfaults as there is no read
> > > handler.
> >
> > Do you have the commit hash for where we introduced the
> > bug that this is fixing?
> >
> > thanks
> > -- PMM
> >
>
> ad52878f97610757390148fe5d5b4cc5ad15c585.
>
> Please feel free to amend my commit message.

Thanks.

> I do not understand why sun4u booting Solaris 10 triggers the bug.

Do you have a backtrace of QEMU from the segfault? I'm having trouble
thinking of what the situation is when we'd try to invoke the
read handler on io_mem_notdirty...

thanks
-- PMM

