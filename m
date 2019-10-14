Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE69D6474
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 15:54:01 +0200 (CEST)
Received: from localhost ([::1]:49900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iK0nQ-0008F9-Pk
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 09:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40023)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iK0k4-0005nL-1C
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 09:50:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iK0k2-0000bj-W5
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 09:50:31 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:35009)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iK0k2-0000bL-QF
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 09:50:30 -0400
Received: by mail-ot1-x334.google.com with SMTP id z6so13853157otb.2
 for <qemu-devel@nongnu.org>; Mon, 14 Oct 2019 06:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dQnIOFT4HxKVrSlg0t7FdGNr0AmA/RYL7/afaKi+44A=;
 b=ATNTym6mpVyj5Zm7zr5Cmo2Obgmx7kCwTW6gY0cRWOjFIMAMPJP0L3vCoJQsOvYfcG
 OXPssbZc5NuhUZ9oG7T8NqgyxXoBonvFzydm4EEv7Bkav811/Ya2ZaADd8yfWZT1USn6
 kV+0fmgmi3eTD2QH6iavrFOn/BQCm6dKJBl7YomnkH82bVupkbtvmWFWbo9tQYBNQAGy
 IKV/84Omi/XNgeR7+Xjj2MfEOOWy3J9o4ITbCMMPkJ+aWJ8ssxTXf6lSjCrCUm5xyO99
 y/kTFUeRCBKpdE9DHOscHnOZctNWuMUBQvOvol7HNBEPH3fBVxa782iMZ5hrWVx+wRB/
 6G5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dQnIOFT4HxKVrSlg0t7FdGNr0AmA/RYL7/afaKi+44A=;
 b=DYmjBLJqytJoPn62t14ZqDfGG5Wf+ipdqmK7ZghdmhhtVxNJPlT0GmHKmzzCnziWn/
 e5r96XRESuuoDPIpONgoq3rqkhlFVJO1SRg9rW3e3vhDAe7UxbwVIXUcWnUAulfiuI4/
 qLB1MBMukVno54PtwKbZ8LUmvfJPNQAM5NzaG7pEzD6+w96624QcCpc3Smk8Bz0TKhLE
 MfjTJRzrMRr09seakGLgr7VeIS1kmXgYWEGrVfMzTKaJgWThNxQ7xZVYvHS8NNnXFQDw
 nbYAsrV57yC3XD23rXPboE54k0MojuZ9AVQNdkx4ztu9pNLxdQjUX8JpmRRXdK5mCzEc
 J24A==
X-Gm-Message-State: APjAAAXFYC4Na7dehYj+GUBOQ1+zhFJvV7cc55rlpvHMtQkOqkRVbd2u
 u/IsyyMfPIc/OHr/oMdOlEXFWyiScrKKckR4rxJauw==
X-Google-Smtp-Source: APXvYqx22pfLbLZN3rVy+56iiOxcVitFGFATgHW0KMrfKkez9rxDFr0mXdcogm3oxMkuuzZKlyMZDX2pALyK1CV2sv8=
X-Received: by 2002:a05:6830:4c1:: with SMTP id
 s1mr1706853otd.232.1571061029851; 
 Mon, 14 Oct 2019 06:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20191014125254.74913-1-hikarupsp@gmail.com>
 <CAFEAcA-iaUraj+AZuGcXw6pNy2aBQ2J0Cm9900COsY+quJc2tA@mail.gmail.com>
 <CAD-w0GAzUvF_ckFviFa+Am2Wph2xGH2ywUAN15hunofaM2OBDw@mail.gmail.com>
In-Reply-To: <CAD-w0GAzUvF_ckFviFa+Am2Wph2xGH2ywUAN15hunofaM2OBDw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Oct 2019 14:50:18 +0100
Message-ID: <CAFEAcA8LFC=swx8EXDRT0+PC=HJ3Qx1hVUszDyEYdKzA2aexmg@mail.gmail.com>
Subject: Re: [PATCH] This patch fixes hanging up Cocoa display on macOS 10.15
 (Catalina)
To: Hikaru Nishida <hikarupsp@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::334
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Oct 2019 at 14:41, Hikaru Nishida <hikarupsp@gmail.com> wrote:
>
> Thank you for your reply.
>
> The event gets fired before applicationDidFinishLaunching is: (output
> of  NSLog(@"event: %@", event);)
> event: NSEvent: type=Kitdefined loc=(0,1440) time=164310.0 flags=0x40
> win=0x0 winNum=0 ctxt=0x0 subtype=1 data1=834 data2=0
>
> I moved allow_events = true just before
> qemu_sem_post(&app_started_sem) and it also works.

OK, great. I think we should go with that, then.
I think a brief comment explaining the purpose of the flag
would also be useful in the handleEvent function; something
like this:

/*
 * Just let OSX have all events that arrive before
applicationDidFinishLaunching.
 * This avoids a deadlock on the iothread lock, which cocoa_display_init()
 * will not drop until after the app_started_sem is posted. (In theory
 * there should not be any such events, but OSX Catalina now emits some.)
 */

Could you send a v2 of the patch with 'allow_events = true' in the
applicationDidFinishLaunching function, and that comment
in handleEvent please, and we'll get that into the tree?

thanks
-- PMM

