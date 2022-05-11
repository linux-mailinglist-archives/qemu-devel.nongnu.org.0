Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7015C5230F9
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 12:48:55 +0200 (CEST)
Received: from localhost ([::1]:51218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nojtm-0004MX-27
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 06:48:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nojrn-0002cG-Ii
 for qemu-devel@nongnu.org; Wed, 11 May 2022 06:46:53 -0400
Received: from mail-yb1-f171.google.com ([209.85.219.171]:34530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nojrl-0004t8-RT
 for qemu-devel@nongnu.org; Wed, 11 May 2022 06:46:51 -0400
Received: by mail-yb1-f171.google.com with SMTP id y76so3232497ybe.1
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 03:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iIC6ZD9hmsg8MHEC4vfuvyXqGoSh+jG6s89PDHI/SuE=;
 b=j5zucUbe4zTGsHFR21/iRnRu/0hColBg4963EAtm06QHNXd/KmimX3ARVTUxEqMs/s
 Qvaetw/YHrlhFXrpWi8L2602woOOVXNKlFDJAcJeWzsKYuWraHeZZQHyg+WaUAoOjoo3
 7faGTzFNwjpGVGdMGkyW6SvfqFvbSmgZoQsxSXgLm1O2KJXBtfFANSG9I9sVIp6HKYI4
 fnD3bnbtqp9AtKb3A4WwbPSWpT281qT8fvhq5cyJEglqcxsADb/ZUXfh7/8ZixYjsss8
 w0EfvOngl/bb8UG6urMk/34Zxx38KyNVLsgfX8L/uFWcxM5rv0B7HS2uHP5jkyDijk2V
 HG6w==
X-Gm-Message-State: AOAM533qYPtpx3MuIxnJ1+7507tmaNNgVMR5HE39Sn56TJB/Uz6LpgZc
 3wpskn5tUBFEYJAqmyvFCvELeIVucAJJZqCa9jA=
X-Google-Smtp-Source: ABdhPJy7qVnYOk2Lk9NjGPqT0RzLvKDhxzwjJZSZlIeYQf9nIMumoS8ScSF8ZSUoR3gXsU7lLvXZLxC+hJmHWc0j9DY=
X-Received: by 2002:a25:b095:0:b0:649:d59e:4c07 with SMTP id
 f21-20020a25b095000000b00649d59e4c07mr22515091ybj.627.1652266008606; Wed, 11
 May 2022 03:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220510195612.677494-1-thuth@redhat.com>
 <YnuCEPOj70J+1NXx@redhat.com>
In-Reply-To: <YnuCEPOj70J+1NXx@redhat.com>
Date: Wed, 11 May 2022 12:46:37 +0200
Message-ID: <CAAdtpL45Bn0wrDX6nQzkzQW=eqxrja4zOFcfG_gTz84LExSpoA@mail.gmail.com>
Subject: Re: [PATCH] Remove Ubuntu 18.04 support from the repository
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Robert Foley <robert.foley@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.219.171;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-yb1-f171.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

+Robert

 On Wed, May 11, 2022 at 11:30 AM Daniel P. Berrang=C3=A9
<berrange@redhat.com> wrote:
>
> On Tue, May 10, 2022 at 09:56:12PM +0200, Thomas Huth wrote:
> > According to our "Supported build platforms" policy, we now do not supp=
ort
> > Ubuntu 18.04 anymore. Remove the related files and entries from our CI.
> >
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  Seems like nobody touched the 18.04-based tests/vm/ubuntu* files in a
> >  very long time, so I assume these are not used anymore and can complet=
ely
> >  be removed now.
>
> Or it could mean that they are working fine and so haven't needed
> changes...

Yes :)

> The cross-compiler container envs give us build coverage for
> non-x86, but the VMs give developers on x86 the ability to
> actually run the unit tests / I/O tests. Personally I've
> never used them, but someone might be ?

I'd say Peter / Alex / Gerd / myself are using it from time to time.

It has been proven useful to test x86_64 on aarch64, so I'd rather
upgrade it. Robert, what do you think?

> I'd suggest splitting this patch into several pieces. One
> to fixup all the custom runner related pieces to remove
> references to 18.04. One to delete the 18.04 container
> related pieces. One to delete the 18.04 VM related pieces.
>
> If you're adventurous, add a 22.04 container since that
> is released now and in the QEMU platform target scope.
>
> >
> >  .gitlab-ci.d/containers.yml                   |   5 -
> >  .../custom-runners/ubuntu-20.04-aarch32.yml   |   2 +-
> >  .../custom-runners/ubuntu-20.04-aarch64.yml   |   2 +-
> >  scripts/ci/setup/build-environment.yml        |  14 +-
> >  tests/docker/dockerfiles/ubuntu1804.docker    | 144 ------------------
> >  tests/lcitool/refresh                         |   7 -
> >  tests/vm/ubuntu.aarch64                       |  68 ---------
> >  tests/vm/ubuntu.i386                          |  40 -----
> >  tests/vm/ubuntuvm.py                          |  60 --------
> >  9 files changed, 4 insertions(+), 338 deletions(-)
> >  delete mode 100644 tests/docker/dockerfiles/ubuntu1804.docker
> >  delete mode 100755 tests/vm/ubuntu.aarch64
> >  delete mode 100755 tests/vm/ubuntu.i386
> >  delete mode 100644 tests/vm/ubuntuvm.py

