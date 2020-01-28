Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8325214C11E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 20:36:58 +0100 (CET)
Received: from localhost ([::1]:36430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwWfR-000401-8p
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 14:36:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41324)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iwVAG-000782-Gg
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 13:00:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iwVAF-0005lK-Ai
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 13:00:40 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:41605)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iwVAF-0005kB-3v
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 13:00:39 -0500
Received: by mail-oi1-x230.google.com with SMTP id i1so11191769oie.8
 for <qemu-devel@nongnu.org>; Tue, 28 Jan 2020 10:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LKXPvC+p6OQlTCxKFg/IxmMxOX9bOxXpNgR/W/sbhKY=;
 b=mHp6kcjv2s9gDQ9Lkh4aaKOaKgdIicfEyUSy6z6CV6ma8Q6L8aUIaIHDNMejOguW3r
 deF8GRaGNz0GRWvV4OtatGyR6HhUh6rCYLBMXPc0JE0+vi+pk5vXR3snaSNCGZGo35jO
 xMZBDHYPmKxTmyCC13ronY0i74UAchdh2E2YgwgjuIDxHZx/ib+lSaxtYvuNP7V+0crl
 TREJiEvbDYU8RJYUvykdKlkxBNy77/+9bJV/n3Z2ZdYVKIougLM9q4kHmeH7kftVIDn7
 C0fOJ3FBXRpGhNHxXEpv307n1jqTPPT0Gsur9AgByIQODc1aXbpqwa55hjZcBk8/PsL4
 da5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LKXPvC+p6OQlTCxKFg/IxmMxOX9bOxXpNgR/W/sbhKY=;
 b=VUslBv9al2BqNaIU4chl6sqGLAeec7OV75FmyTuTmwHxKM4A4M1c3o8yuyOJvBm886
 DkijQCFf1xVVWCoCgZCoziPUd8YpXz4VPrMmfYCwQBbeM5uPlwq1WVCqkgyd6FH+C5W/
 P0eAmrDxE+ohxIHSet3k8zfEBPocGc0cX66oMaC1ln/Gf2DbpvYRqwAwnpJrRudrzaPg
 mj6+r3//vrHH0CUJc+Y9xCr9IqXOhJVEhbD3FcXGCBlR/XwHlzl1hY8Et+Vnhs/n2cst
 bGQ7T1/cMPxGAfGqzE25i1QXxmG/04BtCVtKFmZeZP1KihtcFcE4pmeVDT/ROHchN90f
 V7aQ==
X-Gm-Message-State: APjAAAW68civZMGcXp1y2EajzZI1CeUVJEmf6Wxm1WKDlMailPHOjB1Z
 4hoyJpJeFndK1MRjt5B1fC1K7251i9q07g01S8gUMg==
X-Google-Smtp-Source: APXvYqyPHfIlWsMtBqb/W3ZAJliG7A3N57tfwxHSRbn06LjOW5K1D0G3wny0HifBa1cBRBpIuyzBDm8feMm1vcErCgM=
X-Received: by 2002:aca:3d7:: with SMTP id 206mr3709996oid.98.1580234438208;
 Tue, 28 Jan 2020 10:00:38 -0800 (PST)
MIME-Version: 1.0
References: <CAL1e-=j5WJkV=X+KkfBuS3pjf6z3aJrtu4xpYeVbjEUYiWxxTQ@mail.gmail.com>
 <CAFEAcA8E9s2wZWVxanUDXu=5qcjn6XY5_6t8vUO+LjuJnA7nOQ@mail.gmail.com>
 <CAL1e-=j=nVJd9Q3JmZsimgSPy=noYhqE8hz4r5RjwgTPw9WwuA@mail.gmail.com>
In-Reply-To: <CAL1e-=j=nVJd9Q3JmZsimgSPy=noYhqE8hz4r5RjwgTPw9WwuA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jan 2020 18:00:27 +0000
Message-ID: <CAFEAcA_FbFub4_z+e0YPMT8UTbm1SWmfovkKnLKODvMZMfGa+A@mail.gmail.com>
Subject: Re: [GSoC/Outreachy QEMU proposal] Extend support for ioctls in QEMU
 linux-user mode
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::230
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
Cc: Laurent Vivier <laurent@vivier.eu>, Stefan Hajnoczi <stefanha@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 28 Jan 2020 at 17:51, Aleksandar Markovic
<aleksandar.m.mail@gmail.com> wrote:
>
> I am personally interested in both. However, learning about syscalls and =
implementation of support for them in QEMU would require more ramp-up time =
from student (as is the case for any new employee in a similar situation fo=
r that matter). In the worst case, the student would spend much more time o=
n learning than on productive work. My impression is at it is better to lea=
ve the student focused on just one area - ioctl support.

I think they're about the same, really. The level of difficulty is more
in what the syscall or ioctl does and what its arguments are (ie does
QEMU have to do much mangling on the way past) rather than whether
it happens to be a syscall or an ioctl. Some syscalls are hard, but
some are trivial; same with ioctls.

thanks
-- PMM

