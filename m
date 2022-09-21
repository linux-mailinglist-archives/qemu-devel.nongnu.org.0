Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8505BFEBF
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 15:14:11 +0200 (CEST)
Received: from localhost ([::1]:48932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oazYI-0006P8-WE
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 09:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaygi-0000Pu-DO; Wed, 21 Sep 2022 08:18:55 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:43605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaygb-00087H-Lw; Wed, 21 Sep 2022 08:18:47 -0400
Received: by mail-qt1-x829.google.com with SMTP id a20so3866841qtw.10;
 Wed, 21 Sep 2022 05:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=2/UJmOMGUUZ74qmKKgv+GTzpavZehoAkCMfIEzp4WrU=;
 b=PhczOSIiKZhZ/jVVBVvgaqe1kxKH4+ETl90Y796yCrFBR7DuBujkSBA9AO4GU4msv5
 GETJO+UcdbleGfHSD+IO5crae24ynaXopaaSfQO/TNFtRd2VoONDjp9oloR5uNoISPiN
 XZci0nSKBG2Kn9bHVUVG1V+yK9IhU1uB1z2Lzud+7v/plDfTDfLXPLzo8qdsG4YazJS1
 LgxwS9jMY3lTiUTPbOceOp6BYzX6cl/g0dzjt6nJNjlI8cM/VHxwxKqUJs6zgcWYVW/G
 xZ2bNNCFbM+fDADyYqqG0KkhRxnBJEy/RTGkXCN63IY8CZm+655dtwYIEqHE+4U/C86L
 nQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=2/UJmOMGUUZ74qmKKgv+GTzpavZehoAkCMfIEzp4WrU=;
 b=z372Ijs90g4fN+gjlpWldOAu4JarYZ1q1BPCvnTVyQ0tMTzd9zfCbjAJ6Z2ttvTNRl
 naD1MrYYDXqIcWmysW8PLk13h9wKyEiIyYws9sZ+TxBx/UGny9X2ndR76L0pGCVB9wPa
 Co3cvxbKNpinMsr/DnE9kj6wJX9X05PlS9onzhf9uP0PV7MwNqckb3K+CDtmP7ukUjvd
 L2dcpKo7l6ZlgVQujMyHnBQ+11kCdlQJpJPL3/qLHgqbV/G3DMpkyAvavs0CZPStlqab
 VhrC0eHjzH2Njr18gRz33dvz2v/HL1IVb/+pcoUSyA1Gj7VsHJZw34akapDmnsEyz0Qk
 SaOg==
X-Gm-Message-State: ACrzQf1X5IRkzFPhiLVV+9lan57lDxzyCbf17JRXaCxywUirJfcNu4rZ
 QVuEwsuqR4CoHiocLxjnP5DzEszDy1qKDr7GSbHmYW+1sxM=
X-Google-Smtp-Source: AMsMyM4i+thSyDU6YhmQVF4Yglc4GeHfHePfhqmblmIzXag/b3x2GvdwDbeDhwKF8o0RPnLOYCRseIOU+/94A07bonc=
X-Received: by 2002:a05:622a:1803:b0:35b:aff1:aba0 with SMTP id
 t3-20020a05622a180300b0035baff1aba0mr23771950qtc.334.1663762719855; Wed, 21
 Sep 2022 05:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
In-Reply-To: <20220908132817.1831008-1-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 21 Sep 2022 20:18:28 +0800
Message-ID: <CAEUhbmVvxoZD7dJbMGud5LLp3fmZTyovgXUvEEdyuneg=K_LUg@mail.gmail.com>
Subject: Re: [PATCH 0/7] nsis: gitlab-ci: Improve QEMU Windows installer
 packaging
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, 
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Lieven <pl@kamp.de>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x829.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Hi,

On Thu, Sep 8, 2022 at 9:28 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> At present packaging the required DLLs of QEMU executables is a
> manual process, and error prone.
>
> Improve scripts/nsis.py by adding a logic to automatically package
> required DLLs of QEMU executables.
>
> 'make installer' is tested in the cross-build on Linux in CI, but
> not in the Windows native build. Update CI to test the installer
> generation on Windows too.
>
> During testing a 32-bit build issue was exposed in block/nfs.c and
> the fix is included in this series.
>
>
> Bin Meng (7):
>   scripts/nsis.py: Drop the unnecessary path separator
>   scripts/nsis.py: Fix destination directory name when invoked on
>     Windows
>   scripts/nsis.py: Automatically package required DLLs of QEMU
>     executables
>   .gitlab-ci.d/windows.yml: Drop the sed processing in the 64-bit build
>   block/nfs: Fix 32-bit Windows build
>   .gitlab-ci.d/windows.yml: Unify the prerequisite packages
>   .gitlab-ci.d/windows.yml: Test 'make installer' in the CI
>
>  meson.build              |  1 +
>  block/nfs.c              |  8 ++++++
>  .gitlab-ci.d/windows.yml | 40 ++++++++++++++++++++-------
>  scripts/nsis.py          | 60 +++++++++++++++++++++++++++++++++-------
>  4 files changed, 89 insertions(+), 20 deletions(-)
>

I see Thomas only queued patch #4 (".gitlab-ci.d/windows.yml: Drop the
sed processing in the 64-bit build")

What about other patches?

Regards,
Bin

