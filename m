Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2338A20B212
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 15:05:42 +0200 (CEST)
Received: from localhost ([::1]:52848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joo33-0004OO-4o
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 09:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1joo0s-00024A-KP
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 09:03:26 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:45944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1joo0p-0003nh-SF
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 09:03:26 -0400
Received: by mail-yb1-xb41.google.com with SMTP id y17so2331572ybm.12
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 06:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2vCIpbGb4tQEerH6Brj3UPR8b5vg4BpOrr5EOgrKgUE=;
 b=bii3F14w/kht8EVb8ocOxbyK+Q1amtAASn5Frb7Q8rLQta8trE6japTCq/hR58de30
 YL0M5U1exjGXHVpR+zlN6APsYmUZKCuEZLgKu636fTzHAiPuiYUaZ1Ada+pfAwzDKidf
 qnlwJIcVH/qbLyzyuEarg7UvfAQJYx8YnxufwCzHv6c2R51CkPUQE6DPwclIRY0qWJ0q
 URacvgYDy3678HsfALGTLgJBXNtwuodRz9taqFBfnPCBWYNL2VwjFM3MqaCm+QF7b2jp
 MfXmiFl/ybzAMu0RmhzPKv+5ACbjAPETTs+UN9AZJCnta85fDMdocXc6T+RrhoKzTxQo
 4b6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2vCIpbGb4tQEerH6Brj3UPR8b5vg4BpOrr5EOgrKgUE=;
 b=qJpefSNtvgUdJ4tq8jr/07IwczFGFONwT/sJpUVmupZlbk6S3r+Gbj0v2PfJ0M70SW
 TRwdONor7sTZyQ6Ipl4EmwmnsX31uOjWvD7FH5smdkrmHIia+xM84KInSsHveDc9JH9N
 fv2Nugja0tDNjojbhwBSoP7RTVlF/wyN5lwDmBq9VCFOWfA27mS3EUFMsrgVMbFaxLST
 avGJ7R0zZVBWUuOEZlxTi2xfbsu7ZR/MapVJR/y7ChpDxl1mQE/2hnb04TlLK8lx9ZfN
 O28GWUmYd85dJl2kLtOgecir4NDWLfn29xS/vUwCnWqrHNcegoL76eGEn464FBopAdrH
 q3cQ==
X-Gm-Message-State: AOAM530SvKbLY+a8Hs6gBooCKIiK8LsMLmUQyfpEgu7n5pUv26I3XsSs
 +8yr+qukGtHvpr8be3DwZpMhAKxOWh+mEkqbFAc=
X-Google-Smtp-Source: ABdhPJy5yuVRoy+nfPJbz23fkd+VdLR3yVFTMHOkxAwuuExsZ2TeEuQQ6o7+0Nc+o/Sc6JeqwQbwLsSh9PwdOLBCO3M=
X-Received: by 2002:a25:c342:: with SMTP id t63mr4966809ybf.122.1593176602819; 
 Fri, 26 Jun 2020 06:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200625151627.24986-1-thuth@redhat.com>
 <6145edbf-6e30-e26e-d51b-cdf3f3f1259f@redhat.com>
In-Reply-To: <6145edbf-6e30-e26e-d51b-cdf3f3f1259f@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 26 Jun 2020 21:03:11 +0800
Message-ID: <CAEUhbmX5L9tzyTmiyvG34zDr1LwEmdybX36=CmE0Gt-OU8VWmA@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci: Fix the change rules after moving the YML files
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b41;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Thomas Huth <thuth@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Thu, Jun 25, 2020 at 11:28 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 6/25/20 5:16 PM, Thomas Huth wrote:
> > The edk2.yml and opensbi.yml files have recently been moved/renamed,
> > but the change has not been reflected in the rules in the YML files
> > yet.
> >
> > Fixes: 922febe2af ("Move edk2 and opensbi YAML files to .gitlab-ci.d fo=
lder")
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  .gitlab-ci.d/edk2.yml    | 2 +-
> >  .gitlab-ci.d/opensbi.yml | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/.gitlab-ci.d/edk2.yml b/.gitlab-ci.d/edk2.yml
> > index 088ba4b43a..a9990b7147 100644
> > --- a/.gitlab-ci.d/edk2.yml
> > +++ b/.gitlab-ci.d/edk2.yml
> > @@ -2,7 +2,7 @@ docker-edk2:
> >   stage: build
> >   rules: # Only run this job when the Dockerfile is modified
> >   - changes:
> > -   - .gitlab-ci-edk2.yml
> > +   - .gitlab-ci.d/edk2.yml
>
> Thanks!
>
> >     - .gitlab-ci.d/edk2/Dockerfile
> >     when: always
> >   image: docker:19.03.1
> > diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
> > index dd051c0124..6a1750784a 100644
> > --- a/.gitlab-ci.d/opensbi.yml
> > +++ b/.gitlab-ci.d/opensbi.yml
> > @@ -2,7 +2,7 @@ docker-opensbi:
> >   stage: build
> >   rules: # Only run this job when the Dockerfile is modified
> >   - changes:
> > -   - .gitlab-ci-opensbi.yml
> > +   - .gitlab-ci.d/opensbi.yml
>
> FWIW:
>
> ./scripts/get_maintainer.pl -f .gitlab-ci.d/opensbi.yml
> get_maintainer.pl: No maintainers found, printing recent contributors.
> get_maintainer.pl: Do not blindly cc: them on patches!  Use common sense.
>
> Missed in c6fc0fc1a71a (apparently patchew bot was down when Bin
> sent the patch).

I will add an entry to MAINTAINERS file for this. Thanks!

>
> Cc'ing Alistair who Acked the patch (also missed in the same commit,
> see https://www.mail-archive.com/qemu-devel@nongnu.org/msg682407.html)
>
> >     - .gitlab-ci.d/opensbi/Dockerfile
> >     when: always
> >   image: docker:19.03.1
> >
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Regards,
Bin

