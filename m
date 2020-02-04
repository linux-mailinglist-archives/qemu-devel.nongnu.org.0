Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D88D9151DF4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Feb 2020 17:13:56 +0100 (CET)
Received: from localhost ([::1]:32836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iz0pn-0004KC-TR
	for lists+qemu-devel@lfdr.de; Tue, 04 Feb 2020 11:13:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40065)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iz0oP-0002xk-Ej
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 11:12:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iz0oO-00026b-1s
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 11:12:29 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:47066)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iz0oN-0001yz-RH
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 11:12:27 -0500
Received: by mail-oi1-x242.google.com with SMTP id a22so18908434oid.13
 for <qemu-devel@nongnu.org>; Tue, 04 Feb 2020 08:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XziSHugXOIjLqqAPsWOlY3trUdeMQp0RVEbYtjUUHCM=;
 b=e6BZWctoSe3Z0ZbvyEBpbo/NSyC66VaAwdOu8Ya0hrxB7DTMpuRsAJgGyd50auZydL
 lB6c9a6mxGZB2zoMiAMbMS6K/3TPX7+Q49wJDGsGmVFbEJpr/kYRCKiASPl0mRq9iG0h
 0Th7qV2FrRZYgV7yfb83tkpY+FINexUmo8Dnlxz4ygjPTJ5ktPcrGn3RA4HUrhf6VdYc
 mibUqMRxEYyo0IH2M1s0HpcHkkIFJczzG3gZtCFzNdbUJo8M2TVhy9GdHy8pNlWg+wr7
 aYDyh4Kdru1ojQDjvG2eF+cXL1n+/mfo3oQp72XZ2X3TXMOYr8G5eIDF1V+Y4aStPHWt
 xP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XziSHugXOIjLqqAPsWOlY3trUdeMQp0RVEbYtjUUHCM=;
 b=OGJctWnt5JNL4XygxsCN3aaMjUGhm2XVDPxIGohHjyKOCgTGqsHgof3XyrE15Yr2SC
 rykO4iHhtEKB5dvJ8GEO9g4UV/5dXHt+qOUQRc0lZeQNYTdEfdA8mHZmE5g/s/yh53CX
 +wnLw0X7/6cazRQS/btO5JNB4o80MnfGV8Z2nTVtU89l1emuBZ0ErLEaL7FH59V2GU8F
 qnCPsseUl2+Bly8Yo1cpVKShmLwDfhG9XI0x8sgIXPWUdsBf3Jo7ZZHAgfzuXZto778i
 R8/CCFzNmRndnNv0S212sgQ1sR72t7XpnjI9y9m7/jcR7FQbMhw9fImVJlz8Z+fhBCvy
 Lp4g==
X-Gm-Message-State: APjAAAWhxCJU9SRmgAv1m7Os7wTpxowHPiOnnjgX0r3oPvnA69CAGV7X
 uPBWiHgIwCpTvVqOecReBVx82o1zSW+PF8a1Sv7C9PAi
X-Google-Smtp-Source: APXvYqySHDGLjpJeb80sT1Rk0+w8oLVVUH5V262XhZj0lBHyj2/WTBIqFvMQxgXNkjIcYqNWPm/5leIca4m7md+ToKk=
X-Received: by 2002:aca:3d7:: with SMTP id 206mr3960405oid.98.1580832746502;
 Tue, 04 Feb 2020 08:12:26 -0800 (PST)
MIME-Version: 1.0
References: <1580803317-4422-1-git-send-email-aleksandar.markovic@rt-rk.com>
In-Reply-To: <1580803317-4422-1-git-send-email-aleksandar.markovic@rt-rk.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2020 16:12:14 +0000
Message-ID: <CAFEAcA86sDNv7hvbbTRc_u_7K1nDEOy5wASKm=Xd3AK9uoAQvA@mail.gmail.com>
Subject: Re: [PULL v2 0/3] MIPS queue for February 4th, 2020
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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

On Tue, 4 Feb 2020 at 08:02, Aleksandar Markovic
<aleksandar.markovic@rt-rk.com> wrote:
>
> From: Aleksandar Markovic <amarkovic@wavecomp.com>
>
> The following changes since commit f31160c7d1b89cfb4dd4001a23575b42141cb0ec:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-docs-20200203' into staging (2020-02-03 11:14:24 +0000)
>
> are available in the git repository at:
>
>   https://github.com/AMarkovic/qemu tags/mips-queue-feb-04-2020
>
> for you to fetch changes up to 7b77f048e21af71da7b82155f1f205ca7cebf1b4:
>
>   target/mips: Separate FPU-related helpers into their own file (2020-02-04 08:53:54 +0100)
>
> ----------------------------------------------------------------
>
> MIPS queue for February 4th, 2020
>
>   Content:
>
>     - fix for a recent regression in LL/SC
>     - mechanical reorganization of files containing helpers
>
>   Notes:
>
>     - v2 was sent because of a mistake in a comment in patch #3; the
>       commit message of patch #1 was improved as well
>     - six checkpatch errors and two warnings are benign and should be
>       ignored
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

