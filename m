Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEA55D0F6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 15:49:05 +0200 (CEST)
Received: from localhost ([::1]:53552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiJ9b-0003JS-LL
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 09:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37231)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hiJ82-0002Zs-QW
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 09:47:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hiJ81-0003Hf-7S
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 09:47:26 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:33326)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hiJ80-0003Eg-W8
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 09:47:25 -0400
Received: by mail-ot1-x32b.google.com with SMTP id q20so17205560otl.0
 for <qemu-devel@nongnu.org>; Tue, 02 Jul 2019 06:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VJaf5QiQw12UXFs71Dtz5sRrxskdcL8jkomFVtXibP0=;
 b=q1CppeXPB23L5qEJCrLxNvAWu5zZmHgRYRtgC9tY9i3QyjTOIDTNHYMWcN3d0OGMfP
 N4qYZAo8Q6qvzxB+wQPX+naN6LVI51CoYkWrRGNrTTw8ltS286itUPymNHF4Dos0uDaz
 gk+OJFRb653oC9Nx8tLl84Oh3u4jlfp879ItP8dVK8/NeLz0lc/+LSljpiryIkrHB9YQ
 6F3hlyV28UvcPolV5L/BpVeODECCn/VTqU9nRGvZPcHQi/nJEy5WkMZ7ynJBo1ExrReg
 bIgAGLRZlthjjrPKYW0Qz/xmO5eDtR6MtyRNHDgx9lgEqiNolEQoTYz2KDp2/NwPShP6
 zIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VJaf5QiQw12UXFs71Dtz5sRrxskdcL8jkomFVtXibP0=;
 b=fAzZF1yhYqWTEMjR4BhoFtOGy9UaQzBTT4vJmS1XK4gi76s0HR1YiP8BY8cUHs/jN0
 rTTenDanrvbJajHiafArMkFfhn4xlnsCDRB5sfrOx7vScqJrQP7KY1YwV4tVgFzGb0X+
 mlriyiHcmikJbPIqYgL4r44rEi1+bwf7UPH5SJ/kYKAgY+kQ8nDPTtUULBPNZhFRn8lP
 6KJl46MG6I97MSLPSvlKJeE5FZEfZjAUaJ6sJ2bHAQQ7SV6Msu+TS7k8VpGMvLjAUNoL
 rs5P2u+5hPU00UdNXX3h/Qb6KOd9iG/PC5AY6SsoKYrIv7gYEr63SneY/QoAvWPUSgPq
 tnPA==
X-Gm-Message-State: APjAAAXnQxkVqTme6JSOIs79QjqxFuoDAQ+Mr1Ci2GE61fcow9rJMRyN
 nmSJr1oXGBoF3mbKzpI1pfj9yyZmqiOoUyzvuXrANA==
X-Google-Smtp-Source: APXvYqz8BqUHYOX0tvvCbxi7FGogYjoMgqD/xeHmXwNikCm/dO+ojYNplWb2ARy9mGsr/drnBt9hkXcm/ktqXoeoDIc=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr25069542otn.135.1562075243729; 
 Tue, 02 Jul 2019 06:47:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190628103957.9504-1-kraxel@redhat.com>
 <CAFEAcA9Dh2EaPkcDmErEdJN+BknuRHvZKe5veOcY_7hMVEXiVQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9Dh2EaPkcDmErEdJN+BknuRHvZKe5veOcY_7hMVEXiVQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Jul 2019 14:47:12 +0100
Message-ID: <CAFEAcA8W6OkDa8cY-YWq7dFeFoZENFiEPNfB3Hy3XQPe6GN2rw@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32b
Subject: Re: [Qemu-devel] [PULL 0/6] Vga 20190628 patches
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
Cc: Corey Minyard <cminyard@mvista.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Jul 2019 at 10:17, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 28 Jun 2019 at 11:40, Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > The following changes since commit 474f3938d79ab36b9231c9ad3b5a9314c2aeacde:
> >
> >   Merge remote-tracking branch 'remotes/amarkovic/tags/mips-queue-jun-21-2019' into staging (2019-06-21 15:40:50 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://git.kraxel.org/qemu tags/vga-20190628-pull-request
> >
> > for you to fetch changes up to 263807f4e85e94f2d4e988d61d2fc0319b1dd36b:
> >
> >   ati-vga: switch to vgabios-ati.bin (2019-06-28 10:49:36 +0200)
> >
> > ----------------------------------------------------------------
> > vga: ati fixes, add ati vgabios.
> >
> > ----------------------------------------------------------------
> >
> > BALATON Zoltan (3):
> >   i2c: Move bitbang_i2c.h to include/hw/i2c/
> >   ati-vga: Implement DDC and EDID info from monitor
> >   ati-vga: Fixes to offset and pitch registers
> >
> > Gerd Hoffmann (3):
> >   seabios: add config for ati vgabios
> >   seabios: add ati vgabios binary
> >   ati-vga: switch to vgabios-ati.bin
> >
>
> Applied, thanks.
>
> Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
> for any user-visible changes.

Hmm, the bitbang-i2c changes in this pull seem to have broken
patchew's asan build:
https://patchew.org/logs/20190628103957.9504-1-kraxel@redhat.com/testing.asan/?type=message

(probably because now we're using and testing the buggy
code in a way we weren't before)

thanks
-- PMM

