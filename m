Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA7014BAA1
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 15:40:51 +0100 (CET)
Received: from localhost ([::1]:60040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwS2s-0001TI-AN
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 09:40:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52961)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iwS1b-0000Os-Qw
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 09:39:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iwS1a-000682-Qz
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 09:39:31 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:36120)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iwS1a-000679-K0
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 09:39:30 -0500
Received: by mail-oi1-x241.google.com with SMTP id c16so10503230oic.3
 for <qemu-devel@nongnu.org>; Tue, 28 Jan 2020 06:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CN7VxOhO/caLtYv8EGjJx7mFrIMnwh9l70+NnoDf8mI=;
 b=LturW7HUuds0AxmBnGinoWhh0CezpPYrPvAnwnJhL17EPBMIgYYhr6G01Pwov2fAry
 V4mOaaHPcoj5Qs1JELqjsJHEAIPzjrPfi8HLS+kLn5+D/9FwtqwX9AGBJgssjinxokxi
 LyyVM1FKk7xvWN9LJXcrQQUIug7Xni3hJyPzDTL1ytrkMJG1m3Q/vAY1874+UWzCcpf0
 JbLqIehTh0lrzZtNppZn9yiVq+K+COKG8u03hQCQ0XNtJDpkqzc9KyOJ9XypAQQI34gn
 4MZtnSi2qXM4UnXvpv0Ursz+pIhIEljPuyxtzhB064pSuRf9++UCuJiZYZUXFIbccY1o
 oZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CN7VxOhO/caLtYv8EGjJx7mFrIMnwh9l70+NnoDf8mI=;
 b=ui7f0u8QXYLyOSg7I2nqLOOu8WilTnHm/jOHii3kHAIFpnfd/5EzfFqce2stRLDdyY
 57Ot08CZLggigj4XF4X6Of3OSn52Lk6TBESKaihCJjFUJyzA6TebuD4sSiuDfEWTq1u8
 wHQiEcgsQylWchLClsc2jmm0efHKwpbH5z5Wo0ni2JxTxayNkHuqW+ml56LtF5ZM1aRI
 /JiQLj6aVoQNvYQpzNLjEamROOFA6hQD0ZeKFpoFZpz3kx+4B9fwWAb/l6QUcnn2HD2h
 YuuXA8qr9pPD9eVXGLeDiVEIQmQ0bzxwqU4bEON12fZRqkx4kKZHaGDh71mZ4aAV9bY7
 600g==
X-Gm-Message-State: APjAAAU6K8KeHmxAuLVKoI6FLv2Z9xIUdgX2xkIihna6SO4Q2afTeRTK
 FXJNPIAEt/gUObl2H/g4xuk3YgbQUGUh0iFoi+MrEEZnE9A=
X-Google-Smtp-Source: APXvYqxzoeNlqzauVNN/WwmQs+SGhe1ij2QwQ/+Pn8LfsOTt1YHRz+cYhaP4+qF8nweAQSd6FaBPnQ+Jsv6LnVk6R4o=
X-Received: by 2002:aca:b2c5:: with SMTP id b188mr3022863oif.163.1580221943915; 
 Tue, 28 Jan 2020 06:32:23 -0800 (PST)
MIME-Version: 1.0
References: <CAL1e-=j5WJkV=X+KkfBuS3pjf6z3aJrtu4xpYeVbjEUYiWxxTQ@mail.gmail.com>
In-Reply-To: <CAL1e-=j5WJkV=X+KkfBuS3pjf6z3aJrtu4xpYeVbjEUYiWxxTQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jan 2020 14:32:13 +0000
Message-ID: <CAFEAcA8E9s2wZWVxanUDXu=5qcjn6XY5_6t8vUO+LjuJnA7nOQ@mail.gmail.com>
Subject: Re: [GSoC/Outreachy QEMU proposal] Extend support for ioctls in QEMU
 linux-user mode
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
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
Cc: Laurent Vivier <laurent@vivier.eu>, Stefan Hajnoczi <stefanha@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 23 Jan 2020 at 15:33, Aleksandar Markovic
<aleksandar.m.mail@gmail.com> wrote:
> PART III:
>
>   a) Develop unit tests for selected ioctls that are already supported in QEMU.

These should probably just be part of the external Linux Test Project
test suite.

Incidentally a related topic would be to look at recent
new syscalls added to the kernel and see which ones we
could/should add support for. But maybe you're interested
in ioctls specifically.

thanks
-- PMM

