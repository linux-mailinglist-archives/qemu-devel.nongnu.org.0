Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1E73CA228
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 18:19:39 +0200 (CEST)
Received: from localhost ([::1]:45696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m445K-0000GF-4H
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 12:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m443b-0007P8-AD
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 12:17:51 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:38535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m443Z-0003L7-Nt
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 12:17:51 -0400
Received: by mail-ej1-x62b.google.com with SMTP id gb6so10231815ejc.5
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 09:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+DVF9iDQUP8zMyD1U3L0WcixIgIXqzHxhu59IFwXeVg=;
 b=NlwbRWFVQJVgMjkRNI2uxaaQEeetlFBTSA4Fv0XoO774w2lG482EGJpxB/gXKJCGJG
 4uf44ANiOC0VpaKvm6decvCvQPNEnncAphi0QZeghAx7r1zkDbI3YTi8XX5ynivBsvng
 ynrYXBRvQ6R5i0XQjIzRFvingnFnBkxb2c4BnJNNZNy1B4ih4GFfpaf/mRPL1N4473LH
 oMCAZ4OsSvx1sy2qQF31VaTqn+RLxCK2XMAkTYf8mn8PwKO7O2wocQ5lhSg0Gw0H/qet
 XznZ4twEcSei56OkHD4dEgEc7DhReQtudpTLoCRWt0vIo7pAfMvfHEDVjsFdxa2xtfeE
 XU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+DVF9iDQUP8zMyD1U3L0WcixIgIXqzHxhu59IFwXeVg=;
 b=fvgeAuNJ74SUFZk+naw/49xMIOYUocSqnwxeP1ieGlTqOoYAPCuZy43qbhNYam+7NU
 zYAP/l6P34mEEfYfy5LT+uGcwgeKkoW8EvVWl6ddsJ1RNlj0KY1IhRO74v0tBYa/tKq/
 9ovhFaLwI5z1PUBlRDFrIMgBxjD3PCPeyKi2wUvD+3W6rp1xyUVFSaRpHljti9UumqvC
 RQwOJxFPq2YzruscNNARNZ7AzJZk48ml0ba2ipJcMxg7ttw/l5MQLLT+PvYTY4iX3XUh
 mJlVvQt4Ra2sW4D5J10EXUCjpSwJxOfdc6LWjAUJdvX5ercI9BYP+IvEiPTEQN/bWgxq
 0/tg==
X-Gm-Message-State: AOAM530z9JuRWAAdzstE4UpIKuvWdNTeE3EPMXVmWDPevRZkoEasvzMo
 CG/rZJOlEh8MJceITKWRbkAfT5KymrPGKCl9fu5KmQ==
X-Google-Smtp-Source: ABdhPJz1XnDYq6l3UJmVQ9sLGs9rIWjozX+B6Y/SlQPgd8itK9nWiimPd+cabHKx6eue5LjxHIqSculOXUlKr4xDTdA=
X-Received: by 2002:a17:906:a2d7:: with SMTP id
 by23mr6321359ejb.382.1626365866811; 
 Thu, 15 Jul 2021 09:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7rcp_5vmoL1xFr6rVUzbyb2LyxyndOrxKMsyvgkqq_EX=hOg@mail.gmail.com>
In-Reply-To: <CAK7rcp_5vmoL1xFr6rVUzbyb2LyxyndOrxKMsyvgkqq_EX=hOg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Jul 2021 17:17:06 +0100
Message-ID: <CAFEAcA_jBPwqHCyCAq6yJPfHtwV-h2xdNARX=GTe6gn1Cao97Q@mail.gmail.com>
Subject: Re: QEMU System and User targets
To: Kenneth Adam Miller <kennethadammiller@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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

On Thu, 15 Jul 2021 at 16:59, Kenneth Adam Miller
<kennethadammiller@gmail.com> wrote:
>
> If I am right, the softmmu/system build target for each architecture subsumes the source of the user target.

I'm not sure what you mean by "subsumes" here. Some code in
QEMU is compiled into both the system and usermode emulators
(eg most of the CPU emulation code). Some is system mode only
(eg the device models). Some is usermode only (eg the emulation
of various system calls).

> What I was wondering is, if the user layer of qemu is used by the
> user target, and by user layer I mean the using contents of linux-user,
> then how does the system target receive the user programs instead
> of the qemu user emulation layer even within a guest that is an
> entire OS?

qemu-i386 and qemu-system-i386 are different executables.
They're built differently, and what happens when a usermode
program running inside a Linux guest inside qemu-system-i386
executes a syscall instruction is completely different from
what happens when a program running on qemu-i386 executes that
instruction. Specifically, there are different versions of the
x86_cpu_do_interrupt() function: the one for system emulation does
"update the guest CPU state in the way that the real CPU does when
an int 0x80 is executed", and the one for usermode emulation does
"raise a fake exception that will cause execution to return from
the call to cpu_exec() in linux-user/i386/cpu_loop.c:cpu_loop()
so it can emulate a syscall".

thanks
-- PMM

