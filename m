Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C7035F7C1
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 17:38:08 +0200 (CEST)
Received: from localhost ([::1]:45358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWhag-0000qQ-Gy
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 11:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lWhZC-0008OX-GS
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:36:35 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lWhZA-0003Af-BW
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 11:36:34 -0400
Received: by mail-wr1-x431.google.com with SMTP id j5so19341989wrn.4
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 08:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=hCWFBe3oELuzK3fVkMONplMWEwr3KSM2+ShieSL9jkw=;
 b=cffOAbqTE3vUklJRwr29t+Yl7g/5QRtPkObi6M9SUncve7+xDO1qZyKykeX4wkNEqh
 rKIoNvd0U4NoqXLK/jhoDvlX+FW4bZAGCUHyUKfGFZXAupxTzelTEdfvH1CnZPuKQoQN
 qckr/sGTdGoatvVSaJ/5HLuSO9OvCC/Nh1mDsckSoMbTypMBF8K9jfJzaTTEyyDaMPM0
 U0asFeYwu3s5Vh0md7WLM4EsHPNOdVIYnqqmJx9KIEK4uVyvq8lsmNzasH/FVIL9z4q4
 WxiLstPUNtCoFIOZ3Z9FiZwhoOUx4TdqULzF/QCLXK4VV8Y/2162qasAOhSzI2HF0GPl
 7NVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=hCWFBe3oELuzK3fVkMONplMWEwr3KSM2+ShieSL9jkw=;
 b=IoDOPLGcjuI5SfiDPUoh/G6lI4HvmaMZ+zSqBraJkBb5/OimNm1Dcfh2neJGatlOgU
 xpyH/BQ8Ao/h2MDqQHv++XKMyPtvBvdaPmwlJKyWu+NpCXHrAdAIAqssGJHiNGwPrtGf
 Kp1GE0Z2yQO0hK6w6lVnY3Z26X1MKRYfkuxLI3/ASvVn4tcZEMdo2e7Ld0YXd3yWdUFN
 zSdlay+xC/U5mNiSvuaUWLPejLVU/gurzJgd5bx2M7dxoS7VjYHIq4T8UwugY4XO64f8
 BHl+NUdiwcy6c6fQ/KLgen64BfX73NqpSjsqowN0ilwG3hZ+qchejCat1BFYv2YR7cQS
 o8ew==
X-Gm-Message-State: AOAM532pegYKTRVWwBXy7Cwj7hcqlwAnwnGZ0vscG+wZmi2Or+tTncjA
 GuqaORM+UpxGTJ1oDI9IwlVxnQ==
X-Google-Smtp-Source: ABdhPJzuQEfaeYQ1jSjVZLSozFYQGvuCujRnVhvn4FbHo3qNcrrUZdUb0Ri7XeLKDIHeUZw7FUrykQ==
X-Received: by 2002:adf:f58f:: with SMTP id f15mr9232055wro.348.1618414589017; 
 Wed, 14 Apr 2021 08:36:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r5sm5661121wmr.15.2021.04.14.08.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 08:36:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 972521FF7E;
 Wed, 14 Apr 2021 16:36:27 +0100 (BST)
References: <20210305170045.869437-1-kbastian@mail.uni-paderborn.de>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: Re: [PATCH v3 00/15] tests/tcg: Add TriCore tests
Date: Wed, 14 Apr 2021 16:34:52 +0100
In-reply-to: <20210305170045.869437-1-kbastian@mail.uni-paderborn.de>
Message-ID: <87o8eglvyc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Bastian Koppelmann <kbastian@mail.uni-paderborn.de> writes:

> Hi Alex,
>
> after a long while and thanks to Thomas reminder, I finally came back to =
this
> series. I addressed most of your comments except for the timeout --foregr=
ound
> problem (see https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg009=
21.html).=20
> I just couldn't figure out why QEMU hangs when run from the Makefile.

As I'm refactoring configure.sh anyway I have pulled the series and made
the suggested changes myself. Queued to testing/next, thanks.
>
> You can find the full tree here:
> https://github.com/bkoppelmann/qemu/tree/tricore-tcg-tests2
>
> Cheers,
> Bastian
>
> Bastian Koppelmann (15):
>   tests/tcg: Add docker_as and docker_ld cmds
>   tests/tcg: Run timeout cmds using --foreground
>   hw/tricore: Add testdevice for tests in tests/tcg/
>   tests/tcg/tricore: Add build infrastructure
>   configure: Emit HOST_CC to config-host.mak
>   tests/tcg/tricore: Add macros to create tests and first test 'abs'
>   tests/tcg/tricore: Add bmerge test
>   tests/tcg/tricore: Add clz test
>   tests/tcg/tricore: Add dvstep test
>   tests/tcg/tricore: Add fadd test
>   tests/tcg/tricore: Add fmul test
>   tests/tcg/tricore: Add ftoi test
>   tests/tcg/tricore: Add madd test
>   tests/tcg/tricore: Add msub test
>   tests/tcg/tricore: Add muls test
>
>  MAINTAINERS                                   |   1 +
>  configure                                     |   1 +
>  hw/tricore/meson.build                        |   1 +
>  hw/tricore/tricore_testboard.c                |   8 ++
>  hw/tricore/tricore_testdevice.c               |  82 +++++++++++
>  include/hw/tricore/tricore_testdevice.h       |  38 ++++++
>  tests/tcg/Makefile.qemu                       |  15 ++
>  tests/tcg/Makefile.target                     |   5 +-
>  tests/tcg/configure.sh                        |  27 +++-
>  tests/tcg/tricore/Makefile.softmmu-target     |  26 ++++
>  .../tcg/tricore/Makefile.softmmu-target.orig  |  25 ++++
>  tests/tcg/tricore/link.ld                     |  60 ++++++++
>  tests/tcg/tricore/macros.h                    | 129 ++++++++++++++++++
>  tests/tcg/tricore/test_abs.S                  |   7 +
>  tests/tcg/tricore/test_bmerge.S               |   8 ++
>  tests/tcg/tricore/test_clz.S                  |   9 ++
>  tests/tcg/tricore/test_dvstep.S               |  15 ++
>  tests/tcg/tricore/test_fadd.S                 |  16 +++
>  tests/tcg/tricore/test_fmul.S                 |   8 ++
>  tests/tcg/tricore/test_ftoi.S                 |  10 ++
>  tests/tcg/tricore/test_madd.S                 |  11 ++
>  tests/tcg/tricore/test_msub.S                 |   9 ++
>  tests/tcg/tricore/test_muls.S                 |   9 ++
>  23 files changed, 517 insertions(+), 3 deletions(-)
>  create mode 100644 hw/tricore/tricore_testdevice.c
>  create mode 100644 include/hw/tricore/tricore_testdevice.h
>  create mode 100644 tests/tcg/tricore/Makefile.softmmu-target
>  create mode 100644 tests/tcg/tricore/Makefile.softmmu-target.orig
>  create mode 100644 tests/tcg/tricore/link.ld
>  create mode 100644 tests/tcg/tricore/macros.h
>  create mode 100644 tests/tcg/tricore/test_abs.S
>  create mode 100644 tests/tcg/tricore/test_bmerge.S
>  create mode 100644 tests/tcg/tricore/test_clz.S
>  create mode 100644 tests/tcg/tricore/test_dvstep.S
>  create mode 100644 tests/tcg/tricore/test_fadd.S
>  create mode 100644 tests/tcg/tricore/test_fmul.S
>  create mode 100644 tests/tcg/tricore/test_ftoi.S
>  create mode 100644 tests/tcg/tricore/test_madd.S
>  create mode 100644 tests/tcg/tricore/test_msub.S
>  create mode 100644 tests/tcg/tricore/test_muls.S


--=20
Alex Benn=C3=A9e

