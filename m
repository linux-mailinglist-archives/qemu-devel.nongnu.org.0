Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F54A83D2
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 15:35:50 +0200 (CEST)
Received: from localhost ([::1]:58068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5VRt-0000qK-8Y
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 09:35:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33506)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1i5VPD-0007b6-GS
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 09:33:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1i5VPB-0003Q0-Cm
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 09:33:03 -0400
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:44289)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1i5VP7-0003MW-HM
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 09:33:00 -0400
Received: by mail-qt1-x843.google.com with SMTP id u40so15746836qth.11
 for <qemu-devel@nongnu.org>; Wed, 04 Sep 2019 06:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ceeIGKVFh0XdwW26L6qvRjcU41Jt7b+hs5MlypX8YIY=;
 b=fmSgrfLyq9NkHoW/YeQRZ9z0R9j8gjBFKvaRRPG/mqhWA2xz0+Ow7LJZaWwMjar9Xw
 QIa1etF9L/B3vZD9nKTNC95HaHQogajgdZmeDg5OdHxrJW3y/A7BJtArC+hUY+7pgkRr
 CQFdaty59nhC4r2nzxXKzQKOMuLhupn9+QuqDPIM62TIB5+sx2obuqxyYbTL2RKF3qr/
 O8PUwucACO4QNim4Vv7TqmZ1Ue/Mq50yJTTRvopC8XuE4MSejIYW8wDJ5Ds0pxXXG0Yb
 sMfAiYAvJMz34aCS2R734LITuHF2HpiOzFO7htisOtOzhNyEfq+8A9RXLlAFWzpYBgCR
 qWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ceeIGKVFh0XdwW26L6qvRjcU41Jt7b+hs5MlypX8YIY=;
 b=PjrdaVtOZhmeMKNGH0FoHrk7GndrvuJQ8WfMm6Wp/fiwVOOqORSEaImFOxttH0T0Px
 6bhDTHMdKVPMOyqrmUsKDq0Ss2MrJdxe3ApmPxpddiJ9PfW83yDBFNeidU6O7P+OSwht
 V8s3ntoedbxnfUvwq78BvbaPJ+DRPLXkjvvESFRstNYEm3wAzK2MDuEjM2KqwyMOsuaH
 XgxBugot3yaECPTaipFiW4RuMmN9zMsOZORdCAbSuKX2xK8l7g3Bf+4Q/SthC077kd9w
 1nxMEHSYe6G9MT2K8/pLY3R5xicbBc4FQtX6qq4kc/9Z7aHSxKemQD2/ZfWhhiBJHQQa
 7/Mw==
X-Gm-Message-State: APjAAAVX/TFxlcI3l0fId/3npeDhLzhM0/HYA+lnqJdP0J3xaPRegB8F
 /9/zYpGbqvk9SuzZgZ4OyO/2+qN9/HtUcKzHHmZQFg==
X-Google-Smtp-Source: APXvYqzekI8g4TyIJGeXYf8lWW9PMYAxfukIGaarB8ENzStTTVOZFPsDWMInfJzJKb8n9aTkOdX2QJMTw1EOJ/esFOM=
X-Received: by 2002:ac8:60d6:: with SMTP id i22mr6098225qtm.250.1567603970897; 
 Wed, 04 Sep 2019 06:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190807143523.15917-1-pbonzini@redhat.com>
In-Reply-To: <20190807143523.15917-1-pbonzini@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 4 Sep 2019 15:32:37 +0200
Message-ID: <CAHFMJ7tA08jsVVJCCcMp3Q+FA3PBKcYNq+yFS7y6Sw5f_K4_oA@mail.gmail.com>
To: qemu-devel <qemu-devel@nongnu.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::843
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH v2 0/3] tests/tcg: disentangle makefiles
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping?

Paolo


Il mer 7 ago 2019, 16:35 Paolo Bonzini <pbonzini@redhat.com> ha scritto:

> The tests/tcg rely a lot on per-target informations from
> the QEMU makefiles, but most of the definitions in there
> aren't really relevant to TCG tests.
>
> This series is just a cleanup, but it could also be
> a useful start in making it possible to compile tests/tcg
> out of QEMU's tree, and/or making it a submodule, and/or
> unifying the system emulation tests with kvm-unit-tests.
>
> Paolo
>
> v1->v2: fix configure from fresh directory, do not use $SHELL
>
> Paolo Bonzini (3):
>   tests/tcg: use EXTRA_CFLAGS everywhere
>   tests/tcg: cleanup Makefile inclusions
>   tests/tcg: move configuration to a sub-shell script
>
>  Makefile                                  |   1 +
>  Makefile.target                           |   3 -
>  configure                                 | 155 ++-------------
>  tests/Makefile.include                    |  25 +--
>  tests/tcg/Makefile.include                |  88 ---------
>  tests/tcg/Makefile.prereqs                |  18 ++
>  tests/tcg/Makefile.probe                  |  31 ---
>  tests/tcg/Makefile.qemu                   |  95 +++++++++
>  tests/tcg/{Makefile => Makefile.target}   |  15 +-
>  tests/tcg/aarch64/Makefile.include        |   8 -
>  tests/tcg/aarch64/Makefile.softmmu-target |   4 +-
>  tests/tcg/aarch64/Makefile.target         |  12 +-
>  tests/tcg/alpha/Makefile.include          |   2 -
>  tests/tcg/alpha/Makefile.softmmu-target   |   4 +-
>  tests/tcg/arm/Makefile.include            |   8 -
>  tests/tcg/arm/Makefile.softmmu-target     |   6 +-
>  tests/tcg/configure.sh                    | 228 ++++++++++++++++++++++
>  tests/tcg/cris/Makefile.include           |   6 -
>  tests/tcg/hppa/Makefile.include           |   2 -
>  tests/tcg/i386/Makefile.include           |   9 -
>  tests/tcg/i386/Makefile.softmmu-target    |  12 +-
>  tests/tcg/i386/Makefile.target            |  13 +-
>  tests/tcg/m68k/Makefile.include           |   2 -
>  tests/tcg/minilib/Makefile.target         |   2 +-
>  tests/tcg/mips/Makefile.include           |  20 --
>  tests/tcg/ppc/Makefile.include            |  10 -
>  tests/tcg/riscv/Makefile.include          |  10 -
>  tests/tcg/s390x/Makefile.include          |   2 -
>  tests/tcg/sh4/Makefile.include            |   4 -
>  tests/tcg/sparc64/Makefile.include        |   2 -
>  tests/tcg/x86_64/Makefile.softmmu-target  |  36 ++++
>  tests/tcg/x86_64/Makefile.target          |   7 +-
>  tests/tcg/xtensa/Makefile.include         |  11 --
>  tests/tcg/xtensa/Makefile.softmmu-target  |   4 +-
>  34 files changed, 435 insertions(+), 420 deletions(-)
>  delete mode 100644 tests/tcg/Makefile.include
>  create mode 100644 tests/tcg/Makefile.prereqs
>  delete mode 100644 tests/tcg/Makefile.probe
>  create mode 100644 tests/tcg/Makefile.qemu
>  rename tests/tcg/{Makefile => Makefile.target} (90%)
>  delete mode 100644 tests/tcg/aarch64/Makefile.include
>  delete mode 100644 tests/tcg/alpha/Makefile.include
>  delete mode 100644 tests/tcg/arm/Makefile.include
>  create mode 100644 tests/tcg/configure.sh
>  delete mode 100644 tests/tcg/cris/Makefile.include
>  delete mode 100644 tests/tcg/hppa/Makefile.include
>  delete mode 100644 tests/tcg/i386/Makefile.include
>  delete mode 100644 tests/tcg/m68k/Makefile.include
>  delete mode 100644 tests/tcg/mips/Makefile.include
>  delete mode 100644 tests/tcg/ppc/Makefile.include
>  delete mode 100644 tests/tcg/riscv/Makefile.include
>  delete mode 100644 tests/tcg/s390x/Makefile.include
>  delete mode 100644 tests/tcg/sh4/Makefile.include
>  delete mode 100644 tests/tcg/sparc64/Makefile.include
>  create mode 100644 tests/tcg/x86_64/Makefile.softmmu-target
>  delete mode 100644 tests/tcg/xtensa/Makefile.include
>
> --
> 2.21.0
>
>
