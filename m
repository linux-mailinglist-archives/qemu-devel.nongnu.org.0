Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3E0374BD5
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:23:18 +0200 (CEST)
Received: from localhost ([::1]:36628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leQrN-0006Fg-41
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1leQqM-0005R2-7m
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:22:14 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:46078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1leQqK-0007sp-IG
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:22:13 -0400
Received: by mail-io1-xd2f.google.com with SMTP id z14so3172876ioc.12
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 16:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EplQ1G4iIaWm59vtJw+43gMuA7RlxeXasKH2aDJPjXc=;
 b=nO7c1aCruIheLM3LWKXsoqF7MFyUtyXLJszTggVAXGzYstklpHpB2KFAwNSlYUGrVT
 dKTJyqyuXb7eZ4pqkaq0dXwLMxZfaYH+ccfOYvfMhmRpEwXSN5/RytRrp4Z896XjsHIC
 P7y5QOWtvBCACH8sp/XBNkYBGqccb1ZpIKncGQHdAwQffW62CWUQtBOwlKHyFUIssfvk
 5RT45VCErNMxVsUsRBlu+dE//rPqyLlqxhKxYoWhRiVUMNOO8UCeZbtWF5XZzByJJhsA
 /hTJnAdXZ4eRlfFbyWsmhkNrbozp1aX8loYChVYQixdOCh4VTpy+3J/fW4L9MNzvRNem
 8mBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EplQ1G4iIaWm59vtJw+43gMuA7RlxeXasKH2aDJPjXc=;
 b=gSXwYqICZz8F+ApU9rkbi6BqsEKQoytvlki5eEzgoh3OpRBulLmpQ10Y8yJASInj+d
 WY8kjwVyxK4soQPXR1nNvGB4+AgfdeAQRoaHMorE2lVOQLav/R1v5vO3+tUmgHzJ0Ri3
 CDAyimEojmZAQ8G2bYyA6v0hIkVwJeykvbUMxqUXWhEYxn7B4/+1UIzeiD9c8Uz/ramX
 Fw2mzLTlNi90HnS+f5luHgqkGoJMEC8N+kExaUjUY91qM6GtI3yF8+dDk7Rnqs7A5eTO
 ecVJbROsI8tcrzYnXwb1eX/Oil9zAk6qSaCcI98pjqkjvoQZRbf3oFm7nTSFQCIk9WZ+
 Da8Q==
X-Gm-Message-State: AOAM533eAvsW5wR2FqtXGIOJPoC2DKVBFsi7TfBua3IdFSPc5pMpR6UT
 c8geUWPSGM6rydYwmK6dIy0Dp5TghY2sDFhU3f4=
X-Google-Smtp-Source: ABdhPJwVoVh1KqmiMyk9T7KqJyvh1lYyYRNABQ4Pw33jK/LrTmPBLTRQ09hAhk3CARKmkmk7OeNTa6qHAkj5e4EeBLY=
X-Received: by 2002:a5d:944e:: with SMTP id x14mr787806ior.175.1620256931361; 
 Wed, 05 May 2021 16:22:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210503221327.3068768-1-alistair.francis@wdc.com>
 <CAFEAcA8NCczfX=tmBe6E+gaq4089bnWMVhba5GU1cqt7mrxxcg@mail.gmail.com>
In-Reply-To: <CAFEAcA8NCczfX=tmBe6E+gaq4089bnWMVhba5GU1cqt7mrxxcg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 May 2021 09:21:43 +1000
Message-ID: <CAKmqyKPh0oLBNgYqnMQgOB21Aa-M1rpViE3JiarVk=C4FZLwFQ@mail.gmail.com>
Subject: Re: [PULL 00/42] riscv-to-apply queue
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 6, 2021 at 5:28 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 3 May 2021 at 23:13, Alistair Francis <alistair.francis@wdc.com> wrote:
> >
> > The following changes since commit 15106f7dc3290ff3254611f265849a314a93eb0e:
> >
> >   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-hex-20210502' into staging (2021-05-02 16:23:05 +0100)
> >
> > are available in the Git repository at:
> >
> >   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210504-2
> >
> > for you to fetch changes up to 7a98eab3a704139020bdad35bfae0356d2a31fa0:
> >
> >   target/riscv: Fix the RV64H decode comment (2021-05-04 08:03:43 +1000)
> >
> > ----------------------------------------------------------------
> > A large collection of RISC-V fixes, improvements and features
> >
> >  - Clenaup some left over v1.9 code
> >  - Documentation improvements
> >  - Support for the shakti_c machine
> >  - Internal cleanup of the CSR accesses
> >  - Updates to the OpenTitan platform
> >  - Support for the virtio-vga
> >  - Fix for the saturate subtract in vector extensions
> >  - Experimental support for the ePMP spec
> >  - A range of other internal code cleanups and bug fixes
>
> This fails building the docs:
>
> Warning, treated as error:
> /home/petmay01/linaro/qemu-for-merges/docs/system/riscv/shakti-c.rst:document
> isn't included in any toctree
>
> The new board doc file needs to be referenced from the
> toctree in docs/system/target-riscv.rst .

Argh!

I have fixed this and am sending a v2. A patch to fix it was already
on the list so I squashed it in this PR. I am also going to add the
docs build to my tests.

Alistair

>
> thanks
> -- PMM

