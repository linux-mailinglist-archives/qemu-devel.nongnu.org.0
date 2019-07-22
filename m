Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C626FFEB
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 14:40:54 +0200 (CEST)
Received: from localhost ([::1]:33184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpXcb-0007eN-Ar
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 08:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38843)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hpXcM-0007G3-Fc
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 08:40:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hpXcL-0008D6-KS
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 08:40:38 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:37444)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hpXcL-0008CN-9z
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 08:40:37 -0400
Received: by mail-ot1-x341.google.com with SMTP id s20so40009313otp.4
 for <qemu-devel@nongnu.org>; Mon, 22 Jul 2019 05:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HsTdmCxgXi+6pijpOM2b0mxeR19GyIVc32F3yPha3LQ=;
 b=rliV6h3d7Ul9cIlXJrwaCTtQNDxRg6R6p4BnbqdTLIEXPielXIou0a10WyCl6jW4j4
 zgDOlIp90Pe0DWIyPnO7SHyBDS+j+P/CvehdKWV/WTWERuBi6zdSQrupxV1G2nOAt7ms
 qEKo4DAQKrI+/a/GoW0DpjCalRbq2MRSU+f1R/EAUk+JLgRJmcgnCxjHaiAI98b6p6CH
 BqAmBoi0WO9eTTAuTLseayPU5XU3S/dwhZcArYW/dIxqwrTr/7Gk7u6KH1PQ4TUTcn5X
 +4hCs9zbdHDu8vAXNEHFWqQUqaMl4Hj8sDipRs1+lfD6CuPsiev/qRcX/9PWjBP8TiTS
 WmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HsTdmCxgXi+6pijpOM2b0mxeR19GyIVc32F3yPha3LQ=;
 b=cCB2SIIQT+fYKOliMHRCFOFtRfz73yl4m8JO2uXcN7pX42+w2TOQ3Lq7xKHtlfA2XM
 ENA0Qvrzk9Kzwufqte+DC7Ihof+65Rh0Omo4tkX6b92o8sy69iwWWxrzNIVmruafpsIs
 qwpCrPxceyGVZ10tDffNbI5SxJz5MpZlgsjsjGCp6FFeGTR1QWSUReK/xysU4kaFJN43
 KxOWKnaSxhGVsCOuek4z5lflHDojQzUb7Vl8MAXNNUvgXlOhZ1zNqVQiIKcUmehr80D2
 H2mgMeuu0eAcW7eertsTe/RMFtiY69I7JbVrLRAcHOgUAVO7pbZXRSg28EGYTbZMpzgw
 0vOg==
X-Gm-Message-State: APjAAAW0eL+l9TbS9cnm/WQr0huPtBHPEr2tU6Yg6ifmpjKcqZv4dCIC
 NOvHTH77Rst5fQYRRhU8noNRQoK+kB72Cw/9Ye6kFw==
X-Google-Smtp-Source: APXvYqzv2CoTab7T3++BeXH5E6uy3tZVdfVqM8g7ax6QORRqHbbDP86nYyr+8mYKe+cz5YcwExs3uv9fKvLcATlFTbQ=
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr15464455oti.91.1563799236755; 
 Mon, 22 Jul 2019 05:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190719082647.18113-1-mrolnik@gmail.com>
 <20190719082647.18113-9-mrolnik@gmail.com>
 <da64fd46-c0f0-b6b6-3b8f-d3da9041605d@redhat.com>
 <aa9f5be1-3451-7f58-a868-bd31bf2af236@redhat.com>
 <CAK4993ggAtRYDHUe3KpdC8UfSmofNuoeT346inD7_AG45xFMDw@mail.gmail.com>
 <0a74e963-8465-e45e-b5af-6c543c2c7454@redhat.com>
 <CAK4993i6uGJahzxRFGHyBqSzNrfb3Q=kUbQkjcLmTQSVem63dA@mail.gmail.com>
In-Reply-To: <CAK4993i6uGJahzxRFGHyBqSzNrfb3Q=kUbQkjcLmTQSVem63dA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jul 2019 13:40:26 +0100
Message-ID: <CAFEAcA_duMOwnWd+941zLDVEAMTWgz=Ojo5FSfSiLCxUnOZXdA@mail.gmail.com>
To: Michael Rolnik <mrolnik@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH v27 8/8] target/avr: Add tests
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Jul 2019 at 13:33, Michael Rolnik <mrolnik@gmail.com> wrote:
> I changed it to info_report.
> raw binaries are totally fine, however if a user supplies a damaged elf he
> will never know if no warning/info is reported.

I find a good rule of thumb for architecture specific/board specific
code is that if other boards/architectures don't do a particular thing,
it's usually better to be consistent with the rest of QEMU, rather
than introducing an innovation.

"Try to load as an ELF file; if that didn't work fall back
to loading as a raw image" is what other parts of QEMU do,
and they don't complain about doing it. Otherwise, every
user of raw images gets a spurious complaint that their
raw image isn't an ELF file...

thanks
-- PMM

