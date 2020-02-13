Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0696E15C96B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 18:27:18 +0100 (CET)
Received: from localhost ([::1]:56356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2IGi-000149-U1
	for lists+qemu-devel@lfdr.de; Thu, 13 Feb 2020 12:27:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34321)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2IFU-0000Mz-L3
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 12:26:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2IFT-0005yP-Bu
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 12:26:00 -0500
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:46114)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2IFS-0005vJ-F0
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 12:25:58 -0500
Received: by mail-ot1-x32e.google.com with SMTP id g64so6301905otb.13
 for <qemu-devel@nongnu.org>; Thu, 13 Feb 2020 09:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+98N7OoIbditdKgPdch9oUGAD+8N5jvirqmUOcBmzVY=;
 b=WsWqLQdT3a/LF+ZCZUQFIGTESqOXA756jygFliD7ADx+wdiQ0uWwvJA5jb0eas4neu
 PoKrvr+skJ62ujHd+w7Xmxr17+EK5E5uO4PyNdlNwdK1Rm8ILEnqwafHAw+HcBcbuYdo
 3gHJDe1II+cWW12VV5DNYSq+Id6WRJyK+TpVEIzkxzsvrCQDOpHrk0ZI1BUCvRVgSzlB
 N8QlkClOAhAsDJIm88Yo9HCcXzdGA51DUqVcC3+RTYJMEmvokNm69BDmJQmyS1uAVz6O
 q++RVvd2cecP7RGiLANF/xFiPp70T8BGKWP562lRorwotHUrnnSLj1oJ7vsbN9lGKNAu
 S+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+98N7OoIbditdKgPdch9oUGAD+8N5jvirqmUOcBmzVY=;
 b=tWr0QAdiJjylV26GouEH3ltlJ/3pLuxLSkkkzHpbtx1tIOfsWOpQt4FzjSpqAZZvP6
 nIACPSFwLKUCIpAiWQByM/K9llsLbo+oGQJOxGpw9SbfnwYtuAxuboPIpoRq0L5iwqrr
 p3n/FMzY73OowGLUKDHoBTkYcvoh4klw4prumEs1R2t5Ll/0/m2dxkpVWf+PzIZQ72eE
 J0P3OQb/5vnpkNXi9sXBMvARruBgZfKaQ4N8H1Pw6TN3bPLFt1jOZMl0pm0gvpqdF8Wf
 Ucr1SI/6g20m90R8/XBEyEINYiINSQ9CVgGo/uQARbYZoaevOQgg4+0rNafJbiLSEc6L
 qycA==
X-Gm-Message-State: APjAAAU8vHLmcQOT1Q7yoKiR6tQAntVlOZRyg8r19elgrP5JcJHMfTYm
 segMuNZZItfvfLOOH7JFpUGrtrCEWe0y/aJY9/cFnw==
X-Google-Smtp-Source: APXvYqx35v/qUYdhy79QpK1wCKXbuBTDHzcGuU+AsgIjG5Rm4tUr25vPNUa24slBU3k5J2Y91Wf7DnliZD2m0myAVpI=
X-Received: by 2002:a05:6830:184:: with SMTP id
 q4mr14383622ota.232.1581614756798; 
 Thu, 13 Feb 2020 09:25:56 -0800 (PST)
MIME-Version: 1.0
References: <20200212205757.5608-1-kraxel@redhat.com>
In-Reply-To: <20200212205757.5608-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Feb 2020 17:25:45 +0000
Message-ID: <CAFEAcA9GJHBSNv1_8QKcUVRV6weWRV+x9BSK4Uf+d=c3DuVt1A@mail.gmail.com>
Subject: Re: [PULL 0/2] Usb 20200212 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32e
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 Feb 2020 at 21:00, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit e18e5501d8ac692d32657a3e1ef545b14e72b730:
>
>   Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-20200210' into staging (2020-02-10 18:09:14 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/usb-20200212-pull-request
>
> for you to fetch changes up to 8ddcc43592f215a7523774704df6c60d12d9f647:
>
>   uas: fix super speed bMaxPacketSize0 (2020-02-12 17:20:41 +0100)
>
> ----------------------------------------------------------------
> usb: bugfixes
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

