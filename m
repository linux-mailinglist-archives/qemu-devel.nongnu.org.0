Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B76C31D7C30
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 17:02:46 +0200 (CEST)
Received: from localhost ([::1]:39820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jahHx-0006Ni-H5
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 11:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jahGD-0005Iq-HA
 for qemu-devel@nongnu.org; Mon, 18 May 2020 11:00:57 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:37816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jahGC-0002BZ-8T
 for qemu-devel@nongnu.org; Mon, 18 May 2020 11:00:57 -0400
Received: by mail-oi1-x242.google.com with SMTP id r25so9220614oij.4
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 08:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ii1AnzEvzSMZmxK7quxS5plWooN7Tke86O9bHVaUtW8=;
 b=dPwV67BgHodDWR/0s1Zf8I4B6r9s7PhufLTrAIeK65V7w1gru+Ux4Ksfn6Vn9VtIaz
 wtXXelnLdFU2f9EZj0t2WeAfgQYRu8U2JYzOjRLk/0jM4qdFYEEt2yne7XlIHiaaCSYf
 lskmmGegMIABZRJDYX3JKWoSYzN3rwWdcg3M4DY5q4xKseyCmXhLNV3tkAk3H9KLet2i
 kQSA+azxR2r5mkWIddxIbC1EKZuCCx8sjK7AZzjuTDEz8CZ31HizrQa/i91VKyfG+/us
 kQ66fi5citcn09WugZv/1gROM4rcv778ORIYcv0iTnX1jehPqFe4wgWNqIDVMxq1BBjW
 Hjcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ii1AnzEvzSMZmxK7quxS5plWooN7Tke86O9bHVaUtW8=;
 b=YtpXqXb7UpsSfZ2g4aV+p3Mvrb7Vm+o8VjHkr2nqpH/F/YweBdOlianuwoShe8RCc5
 R4uxJ+5PlVBojoZN9QNJ0phM/Bbmn+ItSjjEXMafdU76TUrypyD3jb7DfjuV5moX07qD
 p2SzuYD6ACNblgxGRLl6cVfBhE2Mm73dW4vp4zt9ZIpwWuyMSEp9NOMMFQw5ao6qJLx1
 InrBOut+wH9PyEdnLR/1yZS12rauneAjbab3LobTtsSfpfPqUZhPay2SQH50vVrUqbXK
 CiPdyZOMWafkmtqS0A2hlcASlIkfSVahzbh6e5BiEy4miyP84z+aA99b2FEeFHZVHxQv
 tCfw==
X-Gm-Message-State: AOAM530R3Drl86XyveZ/O8lyujcpxnzu3qypSGA4jfxFHOx+rUoKYxvB
 zAdr3fPKQiUhM7ulPiaOgrfaTkAX/1kj5TVq97AHkQ==
X-Google-Smtp-Source: ABdhPJxpuHdr42fbp+CdhrBL6TKdyVVdXbDsA3lMthvKiYoAIqkWnQZ1qqzwlzK6M9LJfWDNnJRnVoj2P8fu5gePSIg=
X-Received: by 2002:aca:eb96:: with SMTP id j144mr10329944oih.48.1589814053716; 
 Mon, 18 May 2020 08:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200420212206.12776-1-peter.maydell@linaro.org>
 <CAFEAcA_T+07JhcY8rGLW6dchsfyez54fenZtJAYV++d+dxzn9A@mail.gmail.com>
In-Reply-To: <CAFEAcA_T+07JhcY8rGLW6dchsfyez54fenZtJAYV++d+dxzn9A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 May 2020 16:00:41 +0100
Message-ID: <CAFEAcA-mLdOqi2oc12vz26OryLT7FvhQ9EV=yTHpWAGXofD8Dg@mail.gmail.com>
Subject: Re: [PATCH 0/4] linux-user/arm: Fix BKPT, SVC immediate handling
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: omerg681@gmail.com, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 May 2020 at 13:43, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 20 Apr 2020 at 22:22, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > This patchseries fixes issues with the code in linux-user/arm/cpu_loop.c:
> >  * it incorrectly thinks BKPT is a syscall instruction
> >    (https://bugs.launchpad.net/qemu/+bug/1873898, reported via irc)
> >  * a stale line of code means we incorrectly NOP SVC #0xf0002
> >  * we don't implement the distinction between 0x9f0000..0x9f07ff
> >    (should return -ENOSYS if not implemented) and higher numbers
> >    (should cause a SIGILL)
> >  * we abort() for bad immediate values to SVC (ie not the 0 of EABI
> >    or the >0x9f0000 of OABI); the kernel delivers a SIGILL for these
> >  * for Thumb mode, we never use the immediate value from the insn,
> >    but we always read it anyway
> >
> > This patchseries fixes all those things. (I started out fixing the
> > BKPT bug; everything else is problems I spotted along the way while
> > I was reading this bit of code...)
>
> Laurent, do you want me to post a v2 with the -2/-4 thinko fixed
> so you can put it via the linux-user tree, or should I just take
> this via target-arm.next?

I've applied this series (with the fixup) to target-arm.next; thanks.

-- PMM

