Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2D01507D1
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 14:56:02 +0100 (CET)
Received: from localhost ([::1]:41100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iycCn-0007In-FL
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 08:56:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55500)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iycBq-0006YV-Ki
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 08:55:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iycBp-000805-Hx
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 08:55:02 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:44225)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iycBp-0007xt-AJ
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 08:55:01 -0500
Received: by mail-oi1-x244.google.com with SMTP id d62so14732256oia.11
 for <qemu-devel@nongnu.org>; Mon, 03 Feb 2020 05:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+8v7EeefAckCpSchrg2zCS+Ozg9pedNSAQvdk5WFsI8=;
 b=I6OvhEtTBXf/k/urycen3rNiNJkDhm7QZYr/60K9fI8oWjqbBmByxTo5bXmY23u34G
 EiexG9EwpjmtpV7l8mARfZGflh3XGxpLKAl3Ll6JTsRYlcyP+x35PecapqE+klps34eO
 7xXr0RPCdRWBCITTcrlhDJZAlQVxyCbTkINaBXde8fNkiZJssezaQgdXHP2pXO4CSKce
 vLxHvE6XVADOPsOgyy1ez2xofvEMrQX8/Fs5Ni++prqLM6r6Bc84yOSTKl22UiRxGvxK
 l+JOM1Vgl4EkWZbiOvTf5pyd6GOfGZBIIp4ZSoY5ezMmXeHtBc2GkLKLtChRB+rsjnsz
 MJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+8v7EeefAckCpSchrg2zCS+Ozg9pedNSAQvdk5WFsI8=;
 b=i8oA8o+vDxjk9aDxU3GXYl6+Wpi8d0wduaS/dWYWxmVi1puun7wuKQkMV5xkVKbuIa
 irLbM+I2PfBfOBO1iS+Mg88uSBs4GfpRsZbAGg0b+/VmWYyAvRgYB2HgjH1Hzhf8zR4W
 3IsxlHyNCAHwELRTtIxt5UdcOCJRUs9g4LokHFMrfvMbeZWVcJABCF2SyXRb6dLDuFFY
 2ftTPyLCStT6oRpMDrnvEB3siJY4BcVPSjvux+I7Th2Sw9R7HYUNu8hCFNOTLjCjYeqZ
 iMOg9YHFYWzCVx+1mRBl8VeHjjA8v1BcgTMg/9J0Q1ZwppCy+Unk4adiGA54GkbMkuy/
 zsHw==
X-Gm-Message-State: APjAAAWjLMy5ZdGcCqMblbRfKIduwVP2C16+AlUcjcEQQCxAijGfCAJK
 PxixLR9uu7/vKqoC9Ef11WlDfSpmlIcMnr7RfiJ1nQ==
X-Google-Smtp-Source: APXvYqzQraWc2TLciyjPjGHKCApOC6cA4XuHWCUNLP1/9vFisa1uCTr8o5LYE0hOWKhY4cHrYyCICeZpPOUQurBrk0s=
X-Received: by 2002:aca:b2c5:: with SMTP id
 b188mr14899401oif.163.1580738100327; 
 Mon, 03 Feb 2020 05:55:00 -0800 (PST)
MIME-Version: 1.0
References: <20200203134251.12986-1-lyan@suse.com>
In-Reply-To: <20200203134251.12986-1-lyan@suse.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Feb 2020 13:54:49 +0000
Message-ID: <CAFEAcA-CcNwozBBFWenjnBpRPYhxe_sDiKffwO+SZk38xtY4VA@mail.gmail.com>
Subject: Re: [PATCH v4] target/arm/monitor: query-cpu-model-expansion crashed
 qemu when using machine type none
To: Liang Yan <lyan@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Andrew Jones <drjones@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 3 Feb 2020 at 13:44, Liang Yan <lyan@suse.com> wrote:
>
> Commit e19afd566781 mentioned that target-arm only supports queryable
> cpu models 'max', 'host', and the current type when KVM is in use.
> The logic works well until using machine type none.
>
> For machine type none, cpu_type will be null if cpu option is not
> set by command line, strlen(cpu_type) will terminate process.
> So We add a check above it.
>
> This won't affect i386 and s390x since they do not use current_cpu.
>
> Signed-off-by: Liang Yan <lyan@suse.com>
> ---
>  v4: change code style based on the review from Andrew Jones
>  v3: change git commit message
>  v2: fix code style issue

If a reviewer says "with these changes, reviewed-by:", or
"otherwise, reviewed-by...", then you should add those tags to
your commit message, assuming you've only made the changes
they asked for. That saves them having to look at and reply
to the patchset again.

In this case I'll just add them as I add this patch to
target-arm.next, but if you could handle tags across versions
for future patchset submissions it makes life a little
easier for us.

Applied to target-arm.next, thanks.

thanks
-- PMM

