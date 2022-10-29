Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5008361235D
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 15:47:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oomA0-0001yZ-WF; Sat, 29 Oct 2022 09:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oom9y-0001yA-VP; Sat, 29 Oct 2022 09:46:03 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oom9x-0007ku-BD; Sat, 29 Oct 2022 09:46:02 -0400
Received: by mail-qt1-x830.google.com with SMTP id h21so85926qtu.2;
 Sat, 29 Oct 2022 06:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EEPTzVEKttvaT4/STxTSMJLDN0CHGgkFXLCP4fr49U0=;
 b=V5McyCDsgUqAjV18k0S5cy8E4DB5ruzB1XRtdE/qjAK5fe+KUShdoQuO1QwEntw8is
 0DJYIjcwBnyWHPxkSSqt/KBGxozxmZO9XAeVz42lrqTunAuy5tIXOgp0L4IUmdRLEMm1
 iwoS4A6omiRIi9dunnVq+hZLCUHwMYeHN9ertn99uBOCXKwXZzULgPD6t5XwCXHxejgw
 ah9rWcSanszoVraFx7O5O530PZi03O3SMlh2FRXpK5Rk1YqT+ybXQCy06dJBEtU/X9eP
 LHAQLEhoGvBQoPlXIej57sE6+gT1eWOJpzx9BBjcwwOXLk5K5VcLxWTTCR6H/G4+xVHh
 kn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EEPTzVEKttvaT4/STxTSMJLDN0CHGgkFXLCP4fr49U0=;
 b=5ryrCIU6/2l5ThHODxFhbvlSqCuaaR35SBijXklYszmR0CL20+RmGy0zMQgsg0C9Nj
 ps824CCWwqSHVqS5ufG7kwxV9S49m6UwWfXGbx88R6lKIjguddFJe4qjfxUCw9JU5YGh
 56zWRQ16h9oTIpc3DlZjYKnR5hF3AiuqHV/sPUHk8WI+mh/D2vHQ6kCPsCwjSfw0G3Dv
 t0nsgKX/Bso5jLt5iN0e9bBqdpWKZgE8iZaQdOPLeOt8h/X0Of20Wk3ogKQKUKs+URDw
 EOQFWspGHpIScd+O8oVbNYPpuhqmgDa44sGxOZxkhsY6Q7jv2aVB08/9U6vA+3J0kENj
 4VbA==
X-Gm-Message-State: ACrzQf3AX+E3O8We276oXkn8xL2Fd8jhRQxrH65355h0C50PRKhrOgaz
 RiaVbFsuiHDSzG4YkUwiO0srVv9/fviXhINCl6I=
X-Google-Smtp-Source: AMsMyM7yGBeffDlK7MZItXEEweRq8p9xDMUurJ6AjNYUvwVCaXH1u0bioifI6XgAtuBcRmb13JxO67sNzMQIGJrU698=
X-Received: by 2002:ac8:5dce:0:b0:3a4:f665:453d with SMTP id
 e14-20020ac85dce000000b003a4f665453dmr3611108qtx.276.1667051159806; Sat, 29
 Oct 2022 06:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <CAEUhbmVvxoZD7dJbMGud5LLp3fmZTyovgXUvEEdyuneg=K_LUg@mail.gmail.com>
 <1013abdd-1e46-1121-21f5-522cb9bb5cd1@redhat.com>
In-Reply-To: <1013abdd-1e46-1121-21f5-522cb9bb5cd1@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 29 Oct 2022 21:45:48 +0800
Message-ID: <CAEUhbmX=pVTK1VdCz6XcpYdUb8_4Og2T2BXGWEs2znpxp9c6mw@mail.gmail.com>
Subject: Re: [PATCH 0/7] nsis: gitlab-ci: Improve QEMU Windows installer
 packaging
To: Thomas Huth <thuth@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Stefan Weil <sw@weilnetz.de>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, 
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Lieven <pl@kamp.de>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x830.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Thomas,

On Wed, Sep 21, 2022 at 8:24 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 21/09/2022 14.18, Bin Meng wrote:
> > Hi,
> >
> > On Thu, Sep 8, 2022 at 9:28 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>
> >> At present packaging the required DLLs of QEMU executables is a
> >> manual process, and error prone.
> >>
> >> Improve scripts/nsis.py by adding a logic to automatically package
> >> required DLLs of QEMU executables.
> >>
> >> 'make installer' is tested in the cross-build on Linux in CI, but
> >> not in the Windows native build. Update CI to test the installer
> >> generation on Windows too.
> >>
> >> During testing a 32-bit build issue was exposed in block/nfs.c and
> >> the fix is included in this series.
> >>
> >>
> >> Bin Meng (7):
> >>    scripts/nsis.py: Drop the unnecessary path separator
> >>    scripts/nsis.py: Fix destination directory name when invoked on
> >>      Windows
> >>    scripts/nsis.py: Automatically package required DLLs of QEMU
> >>      executables
> >>    .gitlab-ci.d/windows.yml: Drop the sed processing in the 64-bit build
> >>    block/nfs: Fix 32-bit Windows build
> >>    .gitlab-ci.d/windows.yml: Unify the prerequisite packages
> >>    .gitlab-ci.d/windows.yml: Test 'make installer' in the CI
> >>
> >>   meson.build              |  1 +
> >>   block/nfs.c              |  8 ++++++
> >>   .gitlab-ci.d/windows.yml | 40 ++++++++++++++++++++-------
> >>   scripts/nsis.py          | 60 +++++++++++++++++++++++++++++++++-------
> >>   4 files changed, 89 insertions(+), 20 deletions(-)
> >>
> >
> > I see Thomas only queued patch #4 (".gitlab-ci.d/windows.yml: Drop the
> > sed processing in the 64-bit build")
> >
> > What about other patches?
>
> I hope that Stefan Weil (our W32 maintainer) could have a look at these first...
>

Stefan has reviewed / tested patch 1-3. Not sure who is going to queue
these 3 patches?

Regards,
Bin

