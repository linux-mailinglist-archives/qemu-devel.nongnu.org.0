Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D609C120F3A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 17:21:25 +0100 (CET)
Received: from localhost ([::1]:56456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igt7c-0006eF-Hu
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 11:21:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51915)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1igt6N-0005iU-JU
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:20:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1igt6J-00023v-4t
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:20:07 -0500
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:41825)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1igt6I-00022O-CL
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:20:02 -0500
Received: by mail-ot1-x32d.google.com with SMTP id r27so9799877otc.8
 for <qemu-devel@nongnu.org>; Mon, 16 Dec 2019 08:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gCIRaN1UuvOgZhPkDYpy63lrQByRR00K0QSaIQbaMso=;
 b=hOETTWNTWZ4ptnrPJWjK7RP+fCfuKeFUcyqVOonrJi0SOP9dfTb8jY/eQxiUg2Tpbj
 P1EKrgNn7h6S1e87ET1liF49AtxCGZU1xRtUBfKmL7z4pIpnlss8G64BDw6K5LUtnvRG
 M6hEd64bagIxYaSvRFmbozk6Z9/4HxLaCXVsiqjBgvZ9N9QMnekiSexTs5Re8cvwhsrk
 nOCDYoWS8qlf5vwOvtZA5EOwtTLMRFFf+L30vTVv7UlbE9MEQg4jQRx6t+4ysenilkbS
 ftosW0HE5pa9EVL9euLEaHs3cudxfvqw0rDZooFfy05pX/qaTqQC9Rg386CPye7Smt/j
 Xf8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gCIRaN1UuvOgZhPkDYpy63lrQByRR00K0QSaIQbaMso=;
 b=VvvIo3ouil3aRUHUK1gddzo+CisHrjLlK8mgImm0EPI4Lsjqx+E7kn4Lo8VEdTAfcy
 nlCQmVG657RtYWXxiRG3G5sKdcLe4GSJVpEDDmFgk7D8y+44FtOWOKgdDpOvlMYvbKAv
 K6y0nvD8xHa5HqicoEP5zJaGzfYqFSytBeXbbhJ8UNJS/oC404ffOnmmPUd/27O9UguY
 UrmyKxzNbJMhe6KXYRcA+OJ2I1RPU7UJbgXUq4oFrNUh35pmxWdqZSzkqqgPSmc6me0s
 u0lE/Y7fM/JlFHphhdDLW0MdsHgfo5XZcPlezMsdW2ZM9V0+HO14odxkA1j4sjF86BRt
 mngQ==
X-Gm-Message-State: APjAAAVgMfxMqs1pggsKTT/qN3Wqs9U+gosmIW9YbtjL1BHK1IjUzkiE
 QdjkoZ5dhnO4a/vFYYUniuO40nZCdSyU+EbqQG3A2A==
X-Google-Smtp-Source: APXvYqyinavNKZee2cVgDto2N7r5vtoTT0yI8huaUAj/DC8cAPfzySPb5R/o7fZB/wz/DiEKkUMseZURlKrDW6cQnlc=
X-Received: by 2002:a05:6830:13d3:: with SMTP id
 e19mr32886229otq.135.1576513201126; 
 Mon, 16 Dec 2019 08:20:01 -0800 (PST)
MIME-Version: 1.0
References: <1576500172-11264-1-git-send-email-aleksandar.markovic@rt-rk.com>
In-Reply-To: <1576500172-11264-1-git-send-email-aleksandar.markovic@rt-rk.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Dec 2019 16:19:50 +0000
Message-ID: <CAFEAcA-6Cab0Yc_nQ9m+iq73GsmbBc7mF-h-uOnwOs2BgTi2iA@mail.gmail.com>
Subject: Re: [PULL 00/11] MIPS queue for December 16th, 2019
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32d
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Dec 2019 at 12:43, Aleksandar Markovic
<aleksandar.markovic@rt-rk.com> wrote:
>
> From: Aleksandar Markovic <amarkovic@wavecomp.com>
>
> The following changes since commit 084a398bf8aa7634738e6c6c0103236ee1b3b72f:
>
>   Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request' into staging (2019-12-13 18:14:07 +0000)
>
> are available in the git repository at:
>
>   https://github.com/AMarkovic/qemu tags/mips-queue-dec-16-2019
>
> for you to fetch changes up to 5d480ddde36649a652152bf35f57ccad38f052d6:
>
>   MAINTAINERS: Add a file to MIPS section (2019-12-16 13:16:15 +0100)
>
> ----------------------------------------------------------------
>
> MIPS queue for December 16th, 2019
>
>   - contains only maintenance/cleanup items
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

