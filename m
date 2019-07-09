Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED3B638C7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 17:40:21 +0200 (CEST)
Received: from localhost ([::1]:51206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hksE8-00047G-G8
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 11:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48033)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hksD6-0003XI-EE
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 11:39:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hksD5-0007qT-Is
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 11:39:16 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:46530)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hksD5-0007pq-C3
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 11:39:15 -0400
Received: by mail-oi1-x241.google.com with SMTP id 65so15654431oid.13
 for <qemu-devel@nongnu.org>; Tue, 09 Jul 2019 08:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EZD+FKbUTy91OJ/9zCawi2dH8EYShLi8oFWLpCPUlTE=;
 b=f0gK7I+FLW05Cse9+wM1Vc95muKzlefu45ddiwtPn854OF/s/dPSMT108Be3LqhFro
 nB0NKYhlern+GNiElhCYMcWcr0/eJ+yrht1Fk5wucpSnGKbFbdcsiGEqeTwuWetCG51Y
 EmutFPqH4Noi7zJiXQryMdxmo+BtyP5hag9PHKqhIJU/HeLQaAku2fsuzxhSJrqzQyP7
 e/F8AvelqKLlz5BER1rAkIkSvWWFEkNNub6Jl/qJ5CLCh/nRJSbBlMrrYVJNnoCpTWDy
 qI2nX8W6RX8b3m35H77/Qvm7Y7dvILK4vBNvJERqWDSbyrGTzU/1l77canW6T9lfhI6D
 4rYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EZD+FKbUTy91OJ/9zCawi2dH8EYShLi8oFWLpCPUlTE=;
 b=GYBySyy6WV1ZDOsDXV9h9Mqgc9zbHlv2ONJKzReaQCLlwDvOtlNAitgy5GKBvX59mj
 zPbvbMEARdivaIL85WKssXuPuX4hx7LfX+d1cWeE3QlWArtA1E5RqBcslBbtVb83Wfly
 eHV8RfJxmy4c/7Q0UOJI1L+fiVm86KWtfuhZHA4nyCxjOX8KIsmVeZuRqW49/z338yfy
 WbqmLRP9OU4/jd7MktJ357i45seGb1I1w7ha9VhxQ3Jza/LBSJYNWvn77o4NrT1x47pL
 ckybwvziqukqQl1p6hCOXdxU4HVT0uCvqsrY4X7eWM0k7znHirFgqT0iFf18F8lDxkuL
 9O0A==
X-Gm-Message-State: APjAAAXtBk4Oh0WYgKu/vT7t7pxwkFkP47LkXGWmZqofI5Yhev0x3yTw
 UH3AvcdnL9QBGlS1rWKEcVFYBPDISMcq+uhiTNjZyQ==
X-Google-Smtp-Source: APXvYqw8n1pwsEfFvnCID0GpnwX/T3m94u/YNu09dhxHGcIsFbgmOtj7O6uYaDzsvS3hwoNo82qssPtm3jeyCr4sUqs=
X-Received: by 2002:aca:ac48:: with SMTP id v69mr390535oie.48.1562686753962;
 Tue, 09 Jul 2019 08:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190709143801.4517-1-armbru@redhat.com>
In-Reply-To: <20190709143801.4517-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jul 2019 16:39:03 +0100
Message-ID: <CAFEAcA-aKwoA7jjd1_bnKeuqqEVOSOM+9c7CsD02oM-AXrP0cg@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH] Makefile: Fix "make clean" in
 "unconfigured" source directory
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Jul 2019 at 15:38, Markus Armbruster <armbru@redhat.com> wrote:
>
> Recent commit "Makefile: Reuse all's recursion machinery for clean and
> install" broke targets clean and distclean in the source directory
> before running configure:
>
>     $ make clean
>       LD      recurse-clean.mo
>     cc: fatal error: no input files
>     compilation terminated.
>     make: *** [rules.mak:118: recurse-clean.mo] Error 1
>
> Root cause is missing .PHONY.  Fix that.
>
> Fixes: 1338a4b72659ce08eacb9de0205fe16202a22d9c
> Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Applied to master, thanks.

-- PMM

