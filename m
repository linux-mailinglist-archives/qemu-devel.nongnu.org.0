Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7884519969A
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 14:33:46 +0200 (CEST)
Received: from localhost ([::1]:37286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJG5R-0002bD-Gk
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 08:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36156)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jJG4S-00022P-RB
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 08:32:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jJG4R-0008GE-2B
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 08:32:44 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:33581)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jJG4P-0008FB-U3
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 08:32:42 -0400
Received: by mail-ot1-x32f.google.com with SMTP id 22so21813972otf.0
 for <qemu-devel@nongnu.org>; Tue, 31 Mar 2020 05:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KX3bx5nyjmkbYRDFDbwXaLCvlYWCK2kdnAEMVPtWuSw=;
 b=cpY4HskHmBCCE2R2O4324GGsnFU3iAHs237N5cgLpY5vheJ2EUnT0ieJZv31n/XSd0
 lJq+s6Djc34X/QJ/49w9OC+qSdVqgZ6o4OZM/9CqwugHvBsenZx6EmMq2+Zqo4idl+ZE
 DQZBO5WdTNTtspm8dR+8HUQs/y9J6fp2cFP70s0sW/RgHIhbsjDwbDRsf9KTFUGlKgDl
 Fv3sj7oHHczqVzjwCdUHEiPsDP7faSaAMDKiCwWHS4G/RncJrIZt+X7ZVf1oz/93rvgI
 KqycLpyiLYFl7gcK0rxY0BAs4bS9PTOGZHaByOFpXoGy7UXfU0fqWpgwNZv1A71tWDXI
 Or7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KX3bx5nyjmkbYRDFDbwXaLCvlYWCK2kdnAEMVPtWuSw=;
 b=i09wPm4MCGRr/juMoGetOmhWRHtG+zxYTGtiFQML3/gLDTnLp68N+g+Dws5G5u5ayW
 Xp+eorxzoQFb6XDZrjO+/G3pcL1phZiEWJQnUVF6IuAkOfs4gF1KdRpDdeFFPnfHiIZV
 rr31GMFqyx7G+Tku65HlcKyducXb/SpI+rtESx82xxjVpWrJEUEpCmQbIWHTIAjr8zvF
 u3IsOqwy5ly8ZeJVdirfXJwNCPSdd+SNRS9VXwrVLviGYRbj/zgSfpYqqAqGmAq/Eaq5
 kKoEc4OfkF/yiquLY243fzerSOCuONrP33kzfd7lDDQ+Tt+XXGpSo4KUV0pN2cxTgaqX
 iZnQ==
X-Gm-Message-State: ANhLgQ1WD99VCp0IAJ1pGH73h4skAx/fQxNI3ds8zQPl2WRirhGjUx5w
 P5JMFbtTom2cHy/MNVxtJ6vn49mswuue5JAtylnwhQ==
X-Google-Smtp-Source: ADFU+vth2bmk7s7pXCiRpYgtcmsTG3G4NaZH9x1nMOvm+C/rb+P/TANJnOPxOlqYIUvGP92eYbv94PQuGgSubH7beII=
X-Received: by 2002:a05:6830:11d5:: with SMTP id
 v21mr1463432otq.91.1585657960993; 
 Tue, 31 Mar 2020 05:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA8E6goDHb-7kKCTp=wSpBsuJcfjMmLP0EgymiEL348r4A@mail.gmail.com>
 <87v9mmug73.fsf@dusky.pond.sub.org>
 <CAFEAcA-9U=EAXAtPDh_AnO3eUbM_jcRBuf4x=0Rec0EC-v2mNA@mail.gmail.com>
 <20200330134212.GO236854@redhat.com> <20200330143759.GD6139@linux.fritz.box>
 <c0a1dc94-c3f2-696e-743f-aa15ef995094@redhat.com>
 <20200331120220.GA7030@linux.fritz.box>
 <CAFEAcA_p1T4--Re5=-x=q=cCX-8YDAk_keS72NURe3T23j89sA@mail.gmail.com>
 <20200331122428.GD7030@linux.fritz.box>
In-Reply-To: <20200331122428.GD7030@linux.fritz.box>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Mar 2020 13:32:29 +0100
Message-ID: <CAFEAcA9_3zSisDBv652q2G4uv_hgo4m5yo07w=qtULwKjqF2_g@mail.gmail.com>
Subject: Re: deprecation of in-tree builds
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32f
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 31 Mar 2020 at 13:24, Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 31.03.2020 um 14:05 hat Peter Maydell geschrieben:
> > On Tue, 31 Mar 2020 at 13:02, Kevin Wolf <kwolf@redhat.com> wrote:
> > > Mainly because it allows me to start everything (most importantly: my
> > > editor, git and make) from the same directory.
> >
> > You can use 'make -C build/whatever' to avoid having to change directory.
>
> Which is about five times as long as 'make'.

True; but once you've done it once then the second time is
usually C-r <some letters from the last command> RET
to pull it out of the shell history. (Usually I run something
like 'make -C build/foo -j8 && make -C build/foo -j8 check &&
make -C build/foo check-acceptance', which I'm definitely not
typing out every time.)

> I'm not sure what the problem would be with a Makefile in the source
> tree that just calls make in the build directory? It's convenient and
> doesn't hurt anyone who prefers to work directly in the build directory.

I don't object to it particularly; I'm just mentioning that you
don't need to cd all over the place if you do decide to switch
to using build dirs. (I think the main benefit of build dirs
is that you get to have more than one at once, at which point
you need to specify which one you meant somehow.)

thanks
-- PMM

