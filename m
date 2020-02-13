Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2625415BCDE
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 11:32:42 +0100 (CET)
Received: from localhost ([::1]:50250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2BnV-0004dL-6u
	for lists+qemu-devel@lfdr.de; Thu, 13 Feb 2020 05:32:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53141)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2BmE-0003tp-EN
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 05:31:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2BmD-0002Kt-2O
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 05:31:22 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:40943)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2BmC-0002KV-SY
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 05:31:20 -0500
Received: by mail-oi1-x241.google.com with SMTP id a142so5253546oii.7
 for <qemu-devel@nongnu.org>; Thu, 13 Feb 2020 02:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vPnIuKWia6CtJo/YREmFI/mm5v7pZMNAaOW40R6D2Ns=;
 b=eVcpgn00J+RsZe2gGNKpbbdSQkF1wuxmdlvxLdD3/IzWjF4VP2dg30aI96NOc+Dw2J
 xn6HCPxRDU3sTSSWgdxSIo7jEQ/RgOBlD4o8EHK2uqZ0WTzeOSnhZN0+IoIGlPIteEct
 92Tze59B05hWhuI1dY8z3/aXfA9u+ppEc6GZNc6ebO9sMJrTjyhjTemTqqjy3c0t5iLc
 1yVbCSec7loZpcESoILVGGz/AG9zFXVobXmXszNymM0/durYCNh1uj0rp7YJz+G2b6Rb
 q9AfFpelCGs9eg0pUNLqdjeQoZeAkv9shGIOYH0E5UEFms3PZdwcI6UJeLhFDOKvoaw/
 Ae5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vPnIuKWia6CtJo/YREmFI/mm5v7pZMNAaOW40R6D2Ns=;
 b=bYBzW9N3PUr4Dx3A2MHXVRJpTZCTU0rlXutSp/Uf7vBe0PQDZi09ozKnFbxuLJbPU8
 +Vpu9dziu1EWvSuQHZ07FWSWK5VEa4Fnf0qfR96JVVpGOh7gAorQf48oHoB59BlghHf8
 LXZTmsgJNCIvkk8XAYzVIAkPrI3++gz2TV4KDwqCwZGG1SJ3vRXePYy32BUeK/SFsah8
 GKeBowfNUxESzufn+Qjn+VsLEJoV7FBqYTyTZi8kKXx5XjODB29pjPor/ZWY5dQFEeU2
 s5R0T0h7mhiHVgSC5k2/Dezt2Qt5Jk90lCOcqwnyBFv3i04jni2Q+b2kLQMW7odNMEYs
 +khw==
X-Gm-Message-State: APjAAAWRjWYa5rqBNXNqm3sOtY/hU+x3HSTvDlzKjg6iUn40R6ikO6gr
 kTxYPNJ7aeLj1fd9AafH/em8jlv5CbF5qvjBNbIegg==
X-Google-Smtp-Source: APXvYqy45+9RMf2vG7PQ7ER+BivF4KbRiyoEHrPqWeAw8kMmadfXeVhBYFqtNf6CIqt4zJI2xsw0OeGuN5wCzfOvzMk=
X-Received: by 2002:a05:6808:3b2:: with SMTP id
 n18mr2312819oie.146.1581589880051; 
 Thu, 13 Feb 2020 02:31:20 -0800 (PST)
MIME-Version: 1.0
References: <20200205110541.37811-2-gshan@redhat.com>
 <8dce7dbe-c6c1-122a-f960-0fc29257dd1c@redhat.com>
 <CAFEAcA-RiVfrFFkxppB=z8x76rjorF-5onyGwVAdsHY7W1U88g@mail.gmail.com>
 <21e4051a-4d06-03cb-6d8e-5331b5b570c4@redhat.com>
In-Reply-To: <21e4051a-4d06-03cb-6d8e-5331b5b570c4@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Feb 2020 10:31:08 +0000
Message-ID: <CAFEAcA_zyMgG5SQpVCwUTx3CyU=S=enSZCLCU=2NurukHNM=AA@mail.gmail.com>
Subject: Re: [RESEND RFC PATCH v2 1/2] target/arm: Allow to inject SError
 interrupt
To: Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: Andrew Jones <drjones@redhat.com>, jthierry@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Shan Gavin <shan.gavin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 Feb 2020 at 03:49, Gavin Shan <gshan@redhat.com> wrote:
> On 2/12/20 10:34 PM, Peter Maydell wrote:
> > Yeah, this is on my list to look at; Richard Henderson also could
> > have a look at it. From a quick scan I suspect you may be missing
> > handling for AArch32.

> Yes, the functionality is only supported on aarch64 currently by intention
> because the next patch enables it on "max" and "host" CPU models and both
> of them are running in aarch64 mode.
>
> https://patchwork.kernel.org/patch/11366119/
>
> If you really want to get this supported for aarch32 either, I can do
> it. However, it seems there is a long list of aarch32 CPU models, defined
> in target/arm/cpu.c::arm_cpus. so which CPU models you prefer to see with
> this supported? I think we might choose one or two popular CPU models if
> you agree.

I don't think you should need to care about the CPU models.
We should implement SError (aka "asynchronous external
abort" in ARMv7 and earlier) generically for all CPUs. The
SError/async abort should be triggered by a qemu_irq line
inbound to the CPU (similar to FIQ and IRQ); the board can
choose to wire that up to something, or not, as it likes.

thanks
-- PMM

