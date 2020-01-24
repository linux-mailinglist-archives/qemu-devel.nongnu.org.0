Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5A8147FB8
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jan 2020 12:07:35 +0100 (CET)
Received: from localhost ([::1]:40726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuwoH-00014C-Tn
	for lists+qemu-devel@lfdr.de; Fri, 24 Jan 2020 06:07:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58607)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iuwnS-0000cq-Hj
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 06:06:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iuwnR-0003O1-AE
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 06:06:42 -0500
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:42739)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iuwnR-0003Mz-4p
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 06:06:41 -0500
Received: by mail-ot1-x32d.google.com with SMTP id 66so1223036otd.9
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2020 03:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mu6OXC1D/3o7W0kYymejGOHoomBxeFFaYqIJ/H5MjJI=;
 b=umDIGJAJx5HiyPPG5ChZMFY88SBYoYLCJVzjqI3jk5zUeRvIBUyFmyQu+zkO8C/bnb
 h1FrN79fYSjBa4hbJVWyRvU4OhnewRTjJ6NV9QZ2czIMnKMl9emgXqUArPX32H5lZJCr
 Ffo7PSXqelEcJe7kQVUszZFmSTsXs5sDfZYXMu2CfK3f2OfsWm7/UiQPl7H6q3vlTwR/
 yCezSRZ24re5jveS+Je2A5x/zw+taQgtZ8KjHM8FfnxO2EvoS0MxNrcl0I/0qMgysKpP
 dftqcxtIEcQTA3WnPC7itS9XPoEhJpLB2hQjbG/BhqmNJ7tMGzGor7drm7fBKgMPolf1
 9HmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mu6OXC1D/3o7W0kYymejGOHoomBxeFFaYqIJ/H5MjJI=;
 b=spS3fl6uOePwRa+dqz0bmo8UMafUgruq1NyFBf+/Q/vrQZkIIObDxP77WHVCMCtq2r
 N95Ao+t0KgC1t8LgHpguD9PB0ODHKni1w0pIpcnf+ygKzswxQUuIkNfI25gkfib6Oggi
 n7gPDg1u7BkY0T0zpw51aTwK1pdoTI2bGxEKnWQlVVFvmKFT0ZLyDlpNOq7K+wMCIgGs
 LP5b0mAw58N6tMnyHhi2JyVadpVbQzeGPeyKW4hbTGOVknftweBG02N5z3DpC1iHz3B/
 xzMuV5d9ckfMgJKo2UFnVnQ+1mQQ+gVUkDtUfBL9UDxrpEsv/NtTfxl+SuVQy+e5D9fl
 z13w==
X-Gm-Message-State: APjAAAVfcaCpPKyfxdw+CZmzaYuEcWJi/5asdf1POpK8xKQlJbCB+88Z
 mf2nvicZ+DtFsdaqhViQaQYw/j3O09N75m0lWdPcrQ==
X-Google-Smtp-Source: APXvYqyBsHsrBGOuaoxpreYt5y6Mqgio0l6QEvT2krHYBwHwPazZ8fwtKR9y/zdnjTFn3bUYoKYaNsC2xdfN1/UGCTQ=
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr2248302otd.91.1579863999807; 
 Fri, 24 Jan 2020 03:06:39 -0800 (PST)
MIME-Version: 1.0
References: <20200123164630.91498-1-dgilbert@redhat.com>
 <20200123193237.GD2778@work-vm>
In-Reply-To: <20200123193237.GD2778@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jan 2020 11:06:28 +0000
Message-ID: <CAFEAcA-6c9S3uTWC=t5=fzDu7B76kVB70_PBvzeTKQtr-9ES2g@mail.gmail.com>
Subject: Re: [PULL 000/108] virtiofs queue
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
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
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 23 Jan 2020 at 19:32, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> >
> > The following changes since commit b7c359c748a2e3ccb97a184b9739feb2cd48de2f:
> >
> >   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-5.0-pull-request' into staging (2020-01-23 14:38:43 +0000)
> >
> > are available in the Git repository at:
> >
> >   git@gitlab.com:dagrh/qemu.git tags/pull-virtiofs-20200123b
>
> Note the public URI is:
>
>   https://gitlab.com/dagrh/qemu.git



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

