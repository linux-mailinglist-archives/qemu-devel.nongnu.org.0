Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E04111471DF
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 20:39:53 +0100 (CET)
Received: from localhost ([::1]:60300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuiKW-0004Om-T5
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 14:39:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50701)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iug5I-0003qs-UX
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 12:16:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iug5H-0003ck-HJ
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 12:16:00 -0500
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:36947)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iug5H-0003bN-BC
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 12:15:59 -0500
Received: by mail-il1-x131.google.com with SMTP id u14so91051ilj.4
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 09:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=PGuXk7eNvrl6hMLchdM6URLXUGs/pNlqs13qQqDvC+o=;
 b=qHVlYabaNHETB/RZkeiOkVivJPUIpOkBZU1nr8aD1ALgee1k5ZPdWh6JqJpaZlr208
 +NofE/mNkW6YciWQ2XEqHOJ7OZxTF6Otthg4peYAU6iV94RWanCgHeuvfx9d75JitA8E
 J/WCXo3wrsvvLoeEyGoHgse3aLUBtAdKbyP0D6yQf7QXmD3ocZt5FtWJotUQOh4si+zI
 E2zL/Gl8JOI5CaDCVfxTZ0dvSeTnsUcLbyyLYVZMmmtrMjeIk9W8e1A5QxieKlituKxr
 WpoikwRwoUoALNdDwdK9JfO3/mXJr0ZRtGM0XKKP8jrd+tdw834dDBzCVwOHDAFW8BTb
 ii5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=PGuXk7eNvrl6hMLchdM6URLXUGs/pNlqs13qQqDvC+o=;
 b=LjBQGo9FRQepl6b/7lrT46Io9yLQcSE4P6qm6HvAuFNotrglzTvckd512wqZ6sh29d
 A23J0PwSGm9QqZvCOVozbYKeeZpjl1JIqe1vUKEMQbjJYIlLyS4rY3tXi++27aVjPZRb
 ErrcMvULF+YC8l97swf6NKoaQ29VMuwcVxH+qwgHRcQm+OSqR2n69ag53GuKhdt8/S07
 r2I6gVwbpC+BcsURAGbpehsAEuBcr0c8qbZl3wZ/c+c121giiy3jLzoFvhkxPfqaiYWL
 yVrI6nribT2dkGjhRQUZH747H+tn9SftCo3n/SCBvtsO1zobTUMC1VILxlk0qqq3glof
 nEmw==
X-Gm-Message-State: APjAAAWU2jJJST4Bt2QG3MpUuw1osTqMcMkGESdvN4eOPgUPLg601h3c
 RbRfXvnrHND7sxD9yuKdRT5dRIFefcchdkCynLNJUKTwaZs=
X-Google-Smtp-Source: APXvYqz8iodsc6FBHmk52rFE/7vke6vGsHhiy9tScCibO5q/rxrKZfAlJPIl56WBNk6YlyLsd8ifbJizNuMsRi/JDb4=
X-Received: by 2002:a92:84ce:: with SMTP id y75mr13069650ilk.93.1579799757900; 
 Thu, 23 Jan 2020 09:15:57 -0800 (PST)
MIME-Version: 1.0
References: <20200123163637.18230-1-peter.maydell@linaro.org>
In-Reply-To: <20200123163637.18230-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jan 2020 17:15:23 +0000
Message-ID: <CAFEAcA9+UWAmQgqP73gLonmQX1RTOsDC9yF3czNSjb3WF06JSQ@mail.gmail.com>
Subject: Re: [PULL v4 00/20] target-arm queue
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::131
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 23 Jan 2020 at 16:36, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> v1->v2: add system/index to docs/index.rst
> v2->v3: fix format string issues for OSX
> v3->v4: actually fix format string issues, somehow
>  I failed to actually put the change into git :-(
>
> The following changes since commit b7c359c748a2e3ccb97a184b9739feb2cd48de2f:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-5.0-pull-request' into staging (2020-01-23 14:38:43 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20200123-4
>
> for you to fetch changes up to e9d20b55b2e4c8400143554f0e83e4e1fcb9bd0f:
>
>   hw/arm/exynos4210: Connect serial port DMA busy signals with pl330 (2020-01-23 16:34:15 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * fix bug in PAuth emulation
>  * add PMU to Cortex-R5, Cortex-R5F
>  * qemu-nbd: Convert documentation to rST
>  * qemu-block-drivers: Convert documentation to rST
>  * Fix Exynos4210 UART DMA support
>  * Various minor code cleanups


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

