Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BC01153E2
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 16:08:15 +0100 (CET)
Received: from localhost ([::1]:39360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idFDJ-00078c-La
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 10:08:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43239)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1idEXa-0002qt-CY
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:25:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1idEXY-0007CK-9r
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:25:06 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:35444)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1idEXW-000798-9H
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:25:02 -0500
Received: by mail-ot1-x342.google.com with SMTP id o9so5940928ote.2
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2019 06:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8W6n0kR1bFwEF85pvn2wG6pk2VseIJva/P+1Sid05Ck=;
 b=C5BwTg0N0cLIemU9LmFGcOSdiqFyMuYJQZ5ZHKz0Cjn4bXHy3oNoY0TRgNcxkfLmlc
 abWDdeqGigWC4/qqEL+gGScnLmmbrdHbewdt3fn5+RnpIRQ0MYAdSnlNPEIixTQgQGYz
 n/QoZHFXTYWSGOW56fJJzOqVfCX2PALnpdaZ7ZteUrdaJwcrINbttNQ9weXd+lbEuTNJ
 WB98kIC6Wbyl2QplcvyLO2VcE9bhSaSIY08aC9YNo12pErbruZWIP7d6hVigkgEaZHF0
 MoKe4cYRwJ9uQGmlhU1GDEV6+pwIIBEaYhg0y7Z31uaG9WkTgqh50O3S3ROKh6Sjcn8U
 rAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8W6n0kR1bFwEF85pvn2wG6pk2VseIJva/P+1Sid05Ck=;
 b=GgcIYCiH5GY/m/Gou68dWv2Jw4Sg3dABCuEO8nZXtFcThqYBO/CoSwA2lzONaO68Vd
 v4cFhYduf4l1YJ4YTAmQGBriWvEHYSPjZTFXrXQXrT4bHzXC7rj1U4KvTIBLBNAY8yAh
 qA9daoqogH/TCcM8J2PcFJlZFBmJ42DV5fjC9a9gULnj01v5sus059R7QIfHHDz7nA1g
 D0uE7CvFajxiF4fZqef1FkXpM4Jyv75VBnHVF6v28FPHygeqydPOQfHQQsNZcmEJupJ5
 MF61L57FbOHFZjLbOoflWsruxWyyuD0yzFgPaQxFgnnc4JTzu4SKzkM89ofaZItffiuM
 usuQ==
X-Gm-Message-State: APjAAAXH9pgv+n8TmLORL32xRaadxXNhNFs4QftwEOoK/gFGzKY24lUp
 G3JaKRdi2LMj3iZPEtZbKQofb23+vU3vG1unW3kuig==
X-Google-Smtp-Source: APXvYqzzTBy2ONOQ/mNa4QskKxAUjTeT3fk2vxqCng1mGL3g5x1Gp1TinrINyvb69lcPZ3/LKmU/9n2rg2Y7OlSrWrU=
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr5197606otd.91.1575642300952; 
 Fri, 06 Dec 2019 06:25:00 -0800 (PST)
MIME-Version: 1.0
References: <20191202210947.3603-1-nieklinnenbank@gmail.com>
 <20191202210947.3603-7-nieklinnenbank@gmail.com>
In-Reply-To: <20191202210947.3603-7-nieklinnenbank@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2019 14:24:50 +0000
Message-ID: <CAFEAcA9XxH7zSmm6=KR-2ttfuqdauXxq05SWw++WgGEWw06NEQ@mail.gmail.com>
Subject: Re: [PATCH 06/10] arm/arm-powerctl: set NSACR.{CP11,
 CP10} bits in arm_set_cpu_on()
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2 Dec 2019 at 21:10, Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>
> This change ensures that the FPU can be accessed in Non-Secure mode
> when the CPU core is reset using the arm_set_cpu_on() function call.
> The NSACR.{CP11,CP10} bits define the exception level required to
> access the FPU in Non-Secure mode. Without these bits set, the CPU
> will give an undefined exception trap on the first FPU access for the
> secondary cores under Linux.
>
> Fixes: fc1120a7f5
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---

Oops, another place where we failed to realise the ramifications
of making NSACR actually do something.

Since this is a bugfix I'm going to fish it out of this patchset
and apply it to target-arm.next with a cc: stable.

Thanks for the catch!

-- PMM

