Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E33325BA389
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 02:37:58 +0200 (CEST)
Received: from localhost ([::1]:46500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYzMj-0001xX-KL
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 20:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oYzKl-0000Gt-8g; Thu, 15 Sep 2022 20:35:55 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:37488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oYzKj-0002pB-Mr; Thu, 15 Sep 2022 20:35:55 -0400
Received: by mail-qt1-x832.google.com with SMTP id j10so12100213qtv.4;
 Thu, 15 Sep 2022 17:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ZPsGcFfky7lh02WhyXTmauXeO8U740KHrjHsEEsgXyc=;
 b=UCNR2KR57jIeu12NK2e2t8h9gOT+4LFBITriZGcDFhgOOjPT7w6EzIFlrmGQNLhNzM
 vg7iIjQW0KpFTdh5VVyXivEBhyhiON1XIm4KCbkw9kyC+ZIK5TQ9/UkYJt7CF94oQZTn
 HBdXcddBcaxOxqEi0KuSdn3sZDD/LAHvCntUXRyPKdruhvm3qQ3gW3+k1XYkUw6QBKLW
 LJVLVDj+QaaD96HzCZ9wAZpKSkFyX1CjD2Yg2PooPZhahcJVMo7IAkkEvSA3LS3lZGAp
 /a14tPGa1VLuTK2NDp1a1dnxRgGWb1W3ZMkWevwP9z4kiYmKIhXlm+etWGcm+JUjl41N
 d7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ZPsGcFfky7lh02WhyXTmauXeO8U740KHrjHsEEsgXyc=;
 b=2kxOxH/dsTugayrj72zsPBPraGK+VHxAoPlETKeH8rBms0R4iWsLEs9e0Li1mKsLgs
 TbiTTzsPas/NE2510AWM0yij4wsE4CFIllghhNazrGkj3eCrGzRI/TntH1n5XVQJf15N
 CIoi/Xc82Kw38SehjjXC+sfaXUKlTvAsHxs4CpTRV8MgaV9lWtopF31JCPKfZETIHcZO
 BuQU8Qz1OZg2rbo3Ih7SI72xizWiKKF/4pi6paTs0xvl1VvtENxqE/RdMEVwJZsmz0Tl
 E5VQPLlvYRchN71FAWSIzuaFLSOrRCUSlAZqlvH3ktOEfyPiYoss9BZTOvrwOBZjWw0J
 Hx6Q==
X-Gm-Message-State: ACrzQf29qiQI7cTKH94PZPBI4sreSWPqiT1NDn+Eqp30sEV8Qpe9JCoM
 2fAWNzmPoV8gzcL5ZQdaeqo2SmjJww6ykdcd3JEU40dn
X-Google-Smtp-Source: AMsMyM5VoaSgCm6gA+mkKWnUvkNDDhu//a8zlC0MhL85h8aaxSDcENSiVmSvVbossUIaEciYzmsZsHJg/YR3vjuX6nE=
X-Received: by 2002:ac8:5b0d:0:b0:344:8ba5:420b with SMTP id
 m13-20020ac85b0d000000b003448ba5420bmr2438641qtw.391.1663288551731; Thu, 15
 Sep 2022 17:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
In-Reply-To: <20220908132817.1831008-1-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 16 Sep 2022 08:35:40 +0800
Message-ID: <CAEUhbmW3aq3yFYE7kNmqvjwe9ATDkNyGXQmM+LeEqLDuzEmgfQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] nsis: gitlab-ci: Improve QEMU Windows installer
 packaging
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Stefan Weil <sw@weilnetz.de>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x832.google.com
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

Ping for this series?

