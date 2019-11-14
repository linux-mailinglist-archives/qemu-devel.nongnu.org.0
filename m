Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA526FCA9F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Nov 2019 17:16:34 +0100 (CET)
Received: from localhost ([::1]:59336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVHnN-0004rk-GW
	for lists+qemu-devel@lfdr.de; Thu, 14 Nov 2019 11:16:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42577)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iVHm0-0003sl-Mx
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 11:15:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iVHlz-00037R-43
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 11:15:08 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:45897)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iVHly-00036e-RC
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 11:15:07 -0500
Received: by mail-ot1-x341.google.com with SMTP id r24so5304884otk.12
 for <qemu-devel@nongnu.org>; Thu, 14 Nov 2019 08:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VwL8QfY+UNehgVpcATaUCRif3W2irHX5KXIWSic+YOI=;
 b=jQQhqisFHaqoHMgogLS2QC4nY8pdITfnqAo1qIgsoP7Qa3gP1QlK9MFMQrS+xKEw2g
 i3ui6k541BETz9T4VGuIAYPEGczhBbkZ2MNt9Cza7vva7VZwjXOb5BDl6PXyrMlp8E65
 cUDD0Ger5QvFNcbzwhO1Hfga2DezelY2BQy6y8JEg1P9QU93vZc2grxik2COYDssBVPu
 8/J/r41rjHjHEctXihINyIsr4vl8497Mdd8GVLAWt81aBkT+x5yFianYiCJe/U0bIliP
 1ZBK3MZm8+zurs+MVEbFQIZnVTBphq0SMFDLSfYQxKjBuyuGYCQjxDREvVmoLFtIqSL9
 /SoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VwL8QfY+UNehgVpcATaUCRif3W2irHX5KXIWSic+YOI=;
 b=t5EOabw8c9/0PKcnunRRjPgq0wZaC5NlDQTHutpGz/4sUKGeUS6VH7XCtFVZdPr7ka
 rQ8w7e1R5qYnuFkJXYxYfttJ4y9O4ZmHoEqfdGDwjw0GFbe/yLN3861fPl6aVjcl9HPa
 hZYszN2+2G3PbrF5yD0/zly6ptBCzyW3lNMij1+amLWaMU9Jn+dzMFGW+TrD/MmsV29h
 TQ2ZTWBDxhmxxKlFscKbH8KL8s9xFie0k1NHZCamMj4GkGM4bX+tBCMsojdJ6WDTxWqc
 5bvK9v62ewZTgNwDbq1MRZeIWOVt0dYZWiYGgLoXm5ElddYqpwbrDS2L6ePo+RiDCsfV
 WLsg==
X-Gm-Message-State: APjAAAWxUOS1KHpXy1ji6uQBbP9plCWDm3ZPTPZFWFEJqF9aRAL30Jgl
 J2HVVNnZS/pqFL9R3ZztYZhSJRexgeFLcEMOtPEs2A==
X-Google-Smtp-Source: APXvYqyeo6X5oTRc7ysuWDBjSOH2MBci27ou1FGmdYAlRQYMrwqeLcqGia/s1dbtkqET9trOpKwMZv3XWelFQI2XZh4=
X-Received: by 2002:a9d:7ac2:: with SMTP id m2mr8209841otn.135.1573748105609; 
 Thu, 14 Nov 2019 08:15:05 -0800 (PST)
MIME-Version: 1.0
References: <89ada4b1-ee3d-a512-07c2-9bc1ba5806da@redhat.com>
 <20191024224622.12371-1-keithp@keithp.com> <8736fhm9tw.fsf@linaro.org>
 <87pnik4w9n.fsf@keithp.com>
 <CAFEAcA-g+RkvYjseDE=1Z=gnLum0Cjvn_7bqB3ti+cBq9UZ3Eg@mail.gmail.com>
 <87mudo4owu.fsf@keithp.com>
In-Reply-To: <87mudo4owu.fsf@keithp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Nov 2019 16:14:54 +0000
Message-ID: <CAFEAcA-MRtr9WUpqqwJiX9kc+ybGdgfv7ZB5Tc6_q9xwHwebsQ@mail.gmail.com>
Subject: Re: [PATCH] Semihost SYS_READC implementation (v4)
To: Keith Packard <keithp@keithp.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Oct 2019 at 20:15, Keith Packard <keithp@keithp.com> wrote:
> There seems to be convergence on a pretty simple interface which uses
> ebreak surrounded by a couple of specific no-ops:
>
>       slli x0, x0, 0x1f
>       ebreak
>       srai x0, x0, 0x7
>
> There are implementations in rust and openocd, and I've got one for
> picolibc. The risc-v semihosting code is sitting on a branch in my repo
> on github:
>
>         https://github.com/keith-packard/qemu/tree/riscv-semihost

I had an idle glance at this implementation, and this:

   uint32_t pre = opcode_at(&ctx->base, ctx->base.pc_next - 4);
   uint32_t ebreak = opcode_at(&ctx->base, ctx->base.pc_next);
   uint32_t post = opcode_at(&ctx->base, ctx->base.pc_next + 4);

(where opcode_at() is a wrapper for cpu_ldl_code()) has
some unfortunate side effects: if the previous instruction
is in the previous MMU page, or the following instruction
is in the next MMU page, you might incorrectly trigger
an exception (where QEMU will just longjmp straight out of
the cpu_ldl_code()) if that other page isn't actually mapped
in the guest's page table. You need to be careful not to access
code outside the page you're actually on unless you're really
going to execute it and are OK with it faulting.

I'm not sure what the best way on QEMU to identify this kind
of multiple-instruction-sequence is -- Richard might have an
idea. One approach would be to always take an exception
(or call a helper function) for the 'ebreak', and then
distinguish semihosting from other kinds of ebreak by doing
the load of the preceding/succeeding instructions at runtime
rather than translate time.

Does your semihosting spec expect to have the semihosting
call work if the sequence crosses a page boundary, the
code is being executed by a userspace process, and one of
the two pages has been paged out by the OS ?

thanks
-- PMM

