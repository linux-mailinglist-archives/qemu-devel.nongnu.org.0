Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E0FB7744
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 12:22:57 +0200 (CEST)
Received: from localhost ([::1]:41946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAtaS-0002kk-CN
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 06:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50718)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iAtRX-00048K-SI
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 06:13:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iAtRW-0003Bd-Sb
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 06:13:43 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:40229)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iAtRW-0003BC-NH
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 06:13:42 -0400
Received: by mail-ot1-x32e.google.com with SMTP id y39so2565332ota.7
 for <qemu-devel@nongnu.org>; Thu, 19 Sep 2019 03:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uyAyULeZ/lfdoeG/aOU+yeLsvvzhqnAPkluREammeJI=;
 b=WHGMNt8vJ9MDu8tVuXqWXryPtJQYFaD+pnI8o3nB9T0evafHd3dv360YJYI5CvC5Ai
 ea2sRzxNZPuaHH/VeGBky02d9hesm8/VcfPgd22kRS/zb0UpAUPMXQqAF/xsOueVquXr
 8aaxS/0fnu9vgAwnP6PdWyXiu/cfQQGUuc5+w4AheySzqh4K545bSCJb7cBXj5MhB+mk
 Y3CqrBfTzpzegwlwURL3n/HZ3gAyEght4jcxcB/kIoLcq93pDlKOrwu9fyDgJ/UNS5Nf
 XzIQXXpMYPbOoDmJJ72/trusD86T1xMVnNg0+/hGv+pwHAsy6RHoMK0dKmk9flyqE1Z2
 4ReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uyAyULeZ/lfdoeG/aOU+yeLsvvzhqnAPkluREammeJI=;
 b=PiERwOHtU481rAas/vQdmT1GrWbeErtJwW9pydHgi1IHbZVP9zoFbuddIzIG0unuan
 uXQhvpJnEFUj/SbyYKJZdYDxVNzBuEpsF5BSF60BVIHoq6N4Tok+F3z/H3Lx5atewjC7
 nIVDyjol18jIwN9eysDXWKrkQjiy27lVWdgf11QEbSwqsQkUlJtnRe3zAsil2GtCCyiK
 Ys6anWW+YgEEzsPz/uVAy6o2Hr4yR82+kbcdi6CNl/UCNXFSB11ioWTWbnVYZwUT8qqw
 a1ZRl68CXX2J07bTQUK2t8ryErZfXVFrk3OS2vAFVq2dhrZLKhyEerLUCcMLP1OvLx5D
 sscg==
X-Gm-Message-State: APjAAAW6dy/cgrMmAvCKy+M0RjphU+ruBKp80laeYyb9Vmc4YThUxCkK
 D4mCkD2TR+wVEnRaXhQmub4cYlZVFZxnBZTR0OB+AGd89bY=
X-Google-Smtp-Source: APXvYqwJn+bUnzLm7tdZkQQ1Ej6gBaQP23Jiss1a5IOgBomx94Hd0aofQ9UXU7cbGrNGPdw+QYSHCP/c7GUHNIIWz3A=
X-Received: by 2002:a05:6830:16c9:: with SMTP id
 l9mr2993619otr.97.1568888021738; 
 Thu, 19 Sep 2019 03:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190919070918.16059-1-kraxel@redhat.com>
In-Reply-To: <20190919070918.16059-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Sep 2019 11:13:30 +0100
Message-ID: <CAFEAcA9+xzQx0tFuXWzM7CpGFvVEivhZ_d9QMbCaDP2tgmeaOg@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32e
Subject: Re: [Qemu-devel] [PULL 0/4] Ui 20190919 patches
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

On Thu, 19 Sep 2019 at 08:11, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 89ea03a7dc83ca36b670ba7f787802791fcb04b1:
>
>   Merge remote-tracking branch 'remotes/huth-gitlab/tags/m68k-pull-2019-09-07' into staging (2019-09-09 09:48:34 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/ui-20190919-pull-request
>
> for you to fetch changes up to 6bf21f3d83e95bcc4ba35a7a07cc6655e8b010b0:
>
>   vnc: fix memory leak when vnc disconnect (2019-09-17 13:45:10 +0200)
>
> ----------------------------------------------------------------
> ui: add barrier client.
> ui: bugfixes for vnc & egl.
>
> ----------------------------------------------------------------
>
> Gerd Hoffmann (2):
>   ui/egl: fix framebuffer reads
>   vnc: fix websocket field in events
>
> Laurent Vivier (1):
>   ui: add an embedded Barrier client
>
> Li Qiang (1):
>   vnc: fix memory leak when vnc disconnect

Dropping this pullreq because Li raised an issue with patch 4.

thanks
-- PMM

