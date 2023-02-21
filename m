Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F023769E2A0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 15:48:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUTvr-0003Cr-5A; Tue, 21 Feb 2023 09:47:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUTve-0003BZ-SJ
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 09:47:38 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUTvd-0006gt-9p
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 09:47:38 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 i1-20020a17090ad34100b00234463de251so5064942pjx.3
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 06:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wH6S+y/2dEY3lRWuIwNXIrJYDqXQYWmx8QMQlR52HF4=;
 b=clUIGi9MW1BfPAwoLVqHXZWCLTttADczLWNJ8N5zHYS6FgDEoj0bGEo+QpjG63YYl1
 OjTJTybpcaf+Eb3qvQSy++sub0hYLFJqdp8Y3IFJt8FWl6MkpG8+9yxYQs20m097rWv/
 p9AaNArgfEO8CQ/v22xRoFPZY9QtShl/8WUUf+m1yC9IYaA91z/9yEvCrgo647uifAe+
 bslxSwJLezFIkEgh33J/8yBwZANPS7s4rAV2t0SznfWaCGzzsrw3ff67QdaYgKYOP5oJ
 VOJBxoH2ZHMLFc+nGZmhYmcGo61C7c5bztLidvtC7WzvP0azfgj1oDgcYUahvRIBD6sq
 olbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wH6S+y/2dEY3lRWuIwNXIrJYDqXQYWmx8QMQlR52HF4=;
 b=TVU7wYQT3HeVCFMEtjWJmuk3g55QSSee5vQAbEBBCY+Dvc6dqPh/5Z4uwroRXmm3zp
 8WksENBe+b5XMGsW6qD0uc8Wfiy0Mc6J/3DHihD+x67OByhLjtbJC7vu5UauTUcNMuU8
 hxqHlXX+PKtx77DT7JeFK3GkOt1+9zhJwTwmiXtje0mxww2f4cfHqVFz+xYdJsABT1iS
 tJYPtqIIWTABbDRBGakngf8vjsPnAmBHtyjaJyI/+5p5NKF21VRGwWgAmdO92IZcKsDl
 PtW1ep/ysnzyScuowHkaBBdBOVbsxzRTBOz1WUoYaLVqY3fdpVWZVk6uo72geFfKAcis
 Pfag==
X-Gm-Message-State: AO0yUKWS+MfNVHqCGTn7jZw9LTvWwClvFaXCJvux/6ZEBy+1kFejK/Vb
 HrEMI34BSRLLhzVj3U39LRjBpVSrWIbYr38xvNbYSQ==
X-Google-Smtp-Source: AK7set+gR6/QkQOJdug2e01hhGnbxH7Ab00IJjny3u/EAOaeJeKazyIDAAnl7R/zt0tCvP1iAHuUZCQSe1irPU6HUsw=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1800199pjb.92.1676990845782; Tue, 21
 Feb 2023 06:47:25 -0800 (PST)
MIME-Version: 1.0
References: <20230220032338.5619-1-richard.henderson@linaro.org>
 <CAFEAcA_89gi6r-fmPSohpho2fOMu_oh-kBG6oQO+6uC0mZR1TQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_89gi6r-fmPSohpho2fOMu_oh-kBG6oQO+6uC0mZR1TQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 14:47:14 +0000
Message-ID: <CAFEAcA_VqoEQKN4Guo=PVm_6usvz-HDW3Lb672P16rKNOEmf2g@mail.gmail.com>
Subject: Re: [PULL 0/7] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 21 Feb 2023 at 14:04, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 20 Feb 2023 at 03:23, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > The linux-user patches are on the tcg-ish side of user-only
> > emulation, rather than the syscall-ish side, so queuing here.
> > Solving the deadlock issue is quite important vs timeouts.
>
> aarch64 host, aarch64 guest, segfault on bti-3 in tcg-tests:
>
> https://gitlab.com/qemu-project/qemu/-/jobs/3806772144
>
> TEST bti-3 on aarch64
> Segmentation fault
> make[1]: *** [Makefile:170: run-bti-3] Error 139
>
> Might be a pre-existing intermittent :shrug:

It didn't happen on a rerun. But here's another one, clang-user build,
on the new test case:

https://gitlab.com/qemu-project/qemu/-/jobs/3806772115

TEST linux-fork-trap-with-libsyscall.so on s390x
qemu: uncaught target signal 4 (Illegal instruction) - core dumped

-- PMM

