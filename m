Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AEB5E71E8
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 04:31:30 +0200 (CEST)
Received: from localhost ([::1]:38180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obYTL-00016n-0U
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 22:31:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1obYQO-0007Ir-Ps; Thu, 22 Sep 2022 22:28:20 -0400
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733]:39430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1obYQN-0005Pa-8s; Thu, 22 Sep 2022 22:28:20 -0400
Received: by mail-qk1-x733.google.com with SMTP id x18so7480130qkn.6;
 Thu, 22 Sep 2022 19:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=xhAGNljccR4/qBcdqYr6uFSo6gdJUSN/553Y11TMVAY=;
 b=GcC9I8ZsjeEpFIPM1lpiGyPV/5p6VVrCCOUbzW/mXXiU21EsMcbVdmyhmGoyb+zOZ5
 fMvtGuD4QMSSrWC/DRRdS8xfpcjwHYmNIKdVm8TwgZWiGdeQA5viID1MoAJ7NkR9F/Ns
 zVIP3bVsPL7qpeQdiG6KQCS/HRHZlDXZixKu9jFVoHo5qCr8HwqCc4RYJ90aD5cxW/m6
 RYZqEtimDi/IHvoTLWtSF29mxQMKn3jPcc1HeSAt8qhpApTZxQT91Tk9DUbWwFwRH99y
 rkANUO5ld22i5Rs28jEEZ/YW9g7cWI/Gvi/1VPsIeKiZPoYRt++GztIRAIOiG/Y24zvY
 03Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=xhAGNljccR4/qBcdqYr6uFSo6gdJUSN/553Y11TMVAY=;
 b=uPAY8uaVEO+1gQUnmIOSBHTsYGHVCjpjjpNep/p0yVC3pa4YmRtxDIqcn5Uk/i6WMY
 wK5LJ2BWum6/M9FSIO2chryd/zEtL95sxHfaM0rfotADYQu3lpp0Q07EDIuDqLhxEsmX
 VBSAf57b730ypjgTZz5fiVDyVEVke5HCdu+78tEGMZr5LooljuRq95DinvC0XtjoxUu2
 vGNHoux0Cw3Rmf4i0P2AcqcUnOhqCsT12j5rHW37Xzi0Gcg35wEn6oHpVEu3qgP0H5GH
 JmtUGjYMvXFxmM9nfjMu/sI7nJ7k9Tbv+W2nU2Egki5kIxRrD5Wr3b681iDksCWdjAEG
 OGBQ==
X-Gm-Message-State: ACrzQf0vd24zDP5c6dztbE9+2Vp9X1Nbr68xJcKeHYMdBqZFWkkosdk9
 xZq+vDZ0mYrm1N1ZkAryu1fb9lcIGI4MoJ9DvDU=
X-Google-Smtp-Source: AMsMyM5qaY2HC0mz7PNv8LS2P8vAYoleQOKZOH/A8lODDLHn74pmAVrfwKx1H+cvp6AUi9rRpbhDe3WISDdFhDzMDUg=
X-Received: by 2002:ae9:e410:0:b0:6cb:e230:8df8 with SMTP id
 q16-20020ae9e410000000b006cbe2308df8mr4202967qkc.132.1663900097926; Thu, 22
 Sep 2022 19:28:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <CAEUhbmVvxoZD7dJbMGud5LLp3fmZTyovgXUvEEdyuneg=K_LUg@mail.gmail.com>
 <1013abdd-1e46-1121-21f5-522cb9bb5cd1@redhat.com>
In-Reply-To: <1013abdd-1e46-1121-21f5-522cb9bb5cd1@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 23 Sep 2022 10:28:07 +0800
Message-ID: <CAEUhbmVbOmiEVGvGU+hWvnUJ775kXJFERoSTNB8G6Boswbxz_Q@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::733;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x733.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

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

Would you please comment this series? Thanks!

Regards,
Bin

