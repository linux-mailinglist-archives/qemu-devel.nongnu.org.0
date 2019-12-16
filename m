Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B151205E8
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 13:38:01 +0100 (CET)
Received: from localhost ([::1]:52798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igpdP-0003gW-Pr
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 07:37:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57119)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1igpcU-0003CB-JN
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 07:37:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1igpcR-0002p4-8D
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 07:37:02 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:35794)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1igpcR-0002iy-37
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 07:36:59 -0500
Received: by mail-ot1-x344.google.com with SMTP id o9so9056230ote.2
 for <qemu-devel@nongnu.org>; Mon, 16 Dec 2019 04:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nQO+RaWRG6RN37ts8ibp0wOMougqSwbupGgGW7TZm2M=;
 b=HhV9c9OqS/ymT2B3Pw6mwk3oLd4X/qYGSBiQaURIa/p4jmeek5TgXzezABScXFad0W
 CBxGfMlu9gxASG8Lx+Aq0iYDANr6vJ8+cs5gj2iTbSARtXfjk9XukPOFCLsTRczIEHOm
 wvQV2rSklMoVm3VJ3oA8Y87pdrKaPJlRsppDIvkLI5AyLBv0jGMtZzOuQGaZ58dlodcW
 kIWF30PjUPtmiulHlNy5XZEQaqP5tpjG9hRkoiQSRvWp6imxXQU5Fpe/9nC8DmFhJeKw
 tARayqVhN3eMSJT4rCV12yGq5G23FebStEBOxsGUXWjkDXebWb90g3+NyUfy9v1f3amg
 Exlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nQO+RaWRG6RN37ts8ibp0wOMougqSwbupGgGW7TZm2M=;
 b=XSVKMdwI9pfEGqGXSa+YJgAFlYHykvfRCaLknsDQHMfZLrh+9iO/r9zrHk6XkQxyLj
 PDPWdISvt9O0AG10E5aJdi4OEdbMN9cTrTpg7DCWZoCP7PR9AMBt/Y43IZ+F2ksenajQ
 7v2423GzNsfl6+Ugk70jLWE4ht2b1WcsCzxZeVuAKz335/WtJFxtSJO6YeKVylQnOAhw
 qSCejdc3j2hWXkmB0cybNx+vGAhn8tlafu1jVAyQFC/Przw+xNZccemTKhZFvIg9u1RK
 0sgTl79udM8WwtIt2JBw5SZpWDe5qN1UO008Rd8VKKYB9C0ou5+5D/bk+zopSLfAmuol
 UyFw==
X-Gm-Message-State: APjAAAVbl3fCuNe5R1m8OrByTaHr1Ta7PwmfVjii8Ge54M8i5q4kDKWA
 nl1B6i96xnJ0RrNjbV5mF4Id+J5+msrrUJzC/Zs=
X-Google-Smtp-Source: APXvYqx3w0yp2xXirWZ+hP5nMi6a9YaN2h3+D67HRSpfVlQ3tlHRD7Yqzn7DGwYun+tqFRXMoseVVD/VTcKJy6mEruQ=
X-Received: by 2002:a05:6830:1042:: with SMTP id
 b2mr31452786otp.306.1576499817629; 
 Mon, 16 Dec 2019 04:36:57 -0800 (PST)
MIME-Version: 1.0
References: <1575640687-20744-1-git-send-email-Filip.Bozuta@rt-rk.com>
In-Reply-To: <1575640687-20744-1-git-send-email-Filip.Bozuta@rt-rk.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Mon, 16 Dec 2019 13:36:46 +0100
Message-ID: <CAL1e-=gvSjkZ36j_+A4_G__T5WO6yL8Sh7-SOJSDvFKBT3tzZg@mail.gmail.com>
Subject: Re: [PATCH 0/5] mips: machines: Renovate coding style
To: Filip Bozuta <Filip.Bozuta@rt-rk.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: Paul Burton <pburton@wavecomp.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 6, 2019 at 3:41 PM Filip Bozuta <Filip.Bozuta@rt-rk.com> wrote:
>
> The scripts checkpatch.pl located in scripts folder
> was used to check for errors and warnings in fllowing
> mips machines:
>
>     Jazz
>     Malta
>     Mipssim
>     R4000
>     Fulong 2E
>     Boston
>
> All generated errors and warnings were corrected
> and the script was ran again to make sure there
> are no more errors and warnings
>
> Note:
>
>     Boston machine was already clear of errors
>     and warnings so the boston machine files
>     were not edited.
>
> Note:
>
>     One error occured due to the machro #IF 0.
>     That error was not corrected beacuse there
>     is some reduntant code within that macro that
>     might be used in future versions.
>
> v2:
>
>     * changed lines in hw/mips/mips_malta.c from 848 to
>       995 so that comments begin at the same line
>
>     * changed line 573 in hw/mips/mips_malta.c to fix
>       the build error due to the function g_new0 that is
>       used for allocating
>
>     * changed lines 103 and 107 in tests/acceptance/mips_malta.c
>       so that splitting lines are aligned vertically
>       belove the opening brackets
>
>     * changed line 121 in mips_r4k.c so that INITRD_PAGE_MASK so
>       that it is aligned vertically belove the opening bracket
>
> Filip Bozuta (5):
>   mips: jazz: Renovate coding style
>   mips: malta: Renovate coding style
>   mips: mipssim: Renovate coding style
>   mips: r4000: Renovate coding style
>   mips: fulong 2e: Renovate coding style
>
>  hw/display/jazz_led.c                    | 123 +++++++++++-----------
>  hw/dma/rc4030.c                          |  12 ++-
>  hw/isa/vt82c686.c                        |  23 +++--
>  hw/mips/mips_jazz.c                      |  32 +++---
>  hw/mips/mips_malta.c                     | 169 ++++++++++++++++---------------
>  hw/mips/mips_r4k.c                       |  55 ++++++----
>  hw/net/mipsnet.c                         |  44 ++++----
>  hw/pci-host/bonito.c                     |  60 ++++++-----
>  tests/acceptance/linux_ssh_mips_malta.py |   6 +-
>  9 files changed, 281 insertions(+), 243 deletions(-)
>

Applied to mips queue, with some minor modifications limited to
several lines of code.

Filip, please make sure to test build in future.

(Of course, other applicable unit and integration tests should be executed too.)

Thanks,
Aleksandar

> --
> 2.7.4
>
>

