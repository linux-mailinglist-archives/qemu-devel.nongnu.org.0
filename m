Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF125F6C3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jul 2019 12:41:29 +0200 (CEST)
Received: from localhost ([::1]:44452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hizB9-00058z-K2
	for lists+qemu-devel@lfdr.de; Thu, 04 Jul 2019 06:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49942)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hizAN-0004aF-5D
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 06:40:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hizAM-00020s-2x
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 06:40:39 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:43029)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hizAL-0001z9-Pk
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 06:40:37 -0400
Received: by mail-oi1-x244.google.com with SMTP id w79so4587750oif.10
 for <qemu-devel@nongnu.org>; Thu, 04 Jul 2019 03:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y9CAyTJXaq+MpCvQ1USfwRHoo0rx3PObrCX2gXwIu1g=;
 b=HJRqSLBW2Xv+H0iWQ6gj26MGLsI+QoKf6xdx8uCcyVDBD/BrnkAIjOr34Cr1eOkvMl
 jNIcN27ZwdcdCaqCG7TFrtOXhIDoVaMc+UlBNlnFE+NpInhpq4uTQ1nPAWzigg39Cy0D
 g8q+GMEkXjIsp7zIVcQlxTe5OQAHtmE5VM5gGWjsWTy9rWbl8esNtybjZz3QTnIrjKCS
 m1sOTTOwbluWYogD7kyQVPFL7u0ubRWpYIP4i66g40pReKhjYjPoGqms/nCJ6Dg+9K06
 jMRUpVoCIsvWf3AGXxpgkbbd1nIVydqwd8CnRcCmIjZXlGtRNJFLG1SBmHO09hBVi7n7
 Le6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y9CAyTJXaq+MpCvQ1USfwRHoo0rx3PObrCX2gXwIu1g=;
 b=n+SOTkLLzFjcQKvKmIIb7Y/5dMM2HNOe6catnaDBgXecl/GvCYlXWw4Z6MVfSw+wGB
 8qG+RP9d3EobzlBjTyJLNnP6fPZ5RHy0sQz40MaK1+L4ltknJSf7NTWDzuQMDJ1rC5MR
 pn2DtgWG0JZTlESedG02SPPEroHdyiKUSGWmXX1mGni8fkj+L071a9eBc4y9d3oAhv47
 /1Q18jMx3r/JVZEyrP9nIwpk4im2igp8w1+4dk7SakGaWrfl3z9jrUHN2c4HiWq5Y3gq
 AEm4Lh6ddMOHlqudU+ujED87naMsW7IvJ/99zzkc2ThbiiTMe0zydp7ylUjVYOKcZT6a
 zU3w==
X-Gm-Message-State: APjAAAVJvd53LMZxHV73J8fwlOcG3LR6w295qyids+Z5rJuOUQII/3gJ
 AE1AWBwOdRoOMPCeMYs+WcmAVHzsCBfnYA1DR8Img8485Jk=
X-Google-Smtp-Source: APXvYqx4E34zK/8BmbG/RxSDpm17G53Rsk3c96Dw5LSVKrkAnyn3P/zqqqwKWDkQHJb8sgNVzAK50goTuo6TUU+cs6k=
X-Received: by 2002:aca:6185:: with SMTP id v127mr1538981oib.163.1562236835991; 
 Thu, 04 Jul 2019 03:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190703084048.6980-1-palmer@sifive.com>
In-Reply-To: <20190703084048.6980-1-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Jul 2019 11:40:25 +0100
Message-ID: <CAFEAcA8tN1pUPWUyZbbo2UsaUmOHMLiipW2qEODYPJ9ZB5n+XA@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-devel] [PULL] RISC-V Patches for the 4.1 Soft Freeze,
 Part 2 v3
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Jul 2019 at 09:41, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> merged tag 'mips-queue-jun-21-2019'
> The following changes since commit 474f3938d79ab36b9231c9ad3b5a9314c2aeacde:
>
>   Merge remote-tracking branch 'remotes/amarkovic/tags/mips-queue-jun-21-2019' into staging (2019-06-21 15:40:50 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-4.1-sf1-v3
>
> for you to fetch changes up to 395fd69582a00b76a89c12d9c074055a9d207997:
>
>   hw/riscv: Extend the kernel loading support (2019-06-27 02:47:06 -0700)
>
> ----------------------------------------------------------------
> RISC-V Patches for the 4.1 Soft Freeze, Part 2 v3
>
> This pull request contains a handful of patches that I'd like to target
> for the 4.1 soft freeze.  There are a handful of new features:
>
> * Support for the 1.11.0, the latest privileged specification.
> * Support for reading and writing the PRCI registers.
> * Better control over the ISA of the target machine.
> * Support for the cpu-topology device tree node.
>
> Additionally, there are a handful of bug fixes including:
>
> * Load reservations are now broken by both store conditional and by
>   scheduling, which fixes issues with parallel applications.
> * Various fixes to the PMP implementation.
> * Fixes to the 32-bit linux-user syscall ABI.
> * Various fixes for instruction decodeing.
> * A fix to the PCI device tree "bus-range" property.
>
> This boots 32-bit and 64-bit OpenEmbedded.
>
> Changes since v2 [riscv-for-master-4.1-sf1-v2]:
>
> * Dropped OpenSBI.
>
> Changes since v1 [riscv-for-master-4.1-sf1]:
>
> * Contains a fix to the sifive_u OpenSBI integration.

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM

