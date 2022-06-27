Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109D555B80D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 08:58:14 +0200 (CEST)
Received: from localhost ([::1]:38714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5ihI-0002MB-C7
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 02:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5ifI-0000YD-I9
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 02:56:09 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:38656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5ifG-0008D2-I4
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 02:56:08 -0400
Received: by mail-ej1-x62e.google.com with SMTP id g26so17037323ejb.5
 for <qemu-devel@nongnu.org>; Sun, 26 Jun 2022 23:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W/SBgG0dJdJrkaOHS43xw7WgW3zchwd0zSES9W6VwfI=;
 b=J2fFAcWbNFPCV935+I8UpVVOluxKrlsVRNhctiZWczj91Xv4upTzkTbqtUUVq/7xg4
 t4A49Qxd0CywFwylGLVDaDa7Pq3bj6FaYr4kbQE7q1E2lcHSGITPXH8LGd8tXIz9rFT2
 tq9yHzlDgvR9WxJWfnozqWRme3ZCj+CxcMta+wq9YiAAxexYeqIYufwoLhVEALK2jqzo
 NVtxams/Rlhb3WI8BruP44yvqA6ViGgZVMZ5mlIQcA9ouJ5201R5HFt1mYsp3EqrNURJ
 CJJ2R6mEQt3yjehhtPQn6g09BsbMykZ2JnTJKixfowqK+wrGlm8uc8tL2UqTWBiLreAB
 VaSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W/SBgG0dJdJrkaOHS43xw7WgW3zchwd0zSES9W6VwfI=;
 b=C1IwZBjL4utl0BXYni69/pECXwgoLcI9U+X+SrF6yZVFmp8bLdCjRGpqhwOg7z+B0S
 UYDy0WkJjK9x0zM0P/HVgYEmbxCzDsYJdTo+sZ+S1SsMkviGiqHRFso1AtvjiaIe7v55
 /VZUbna1U5Cav0Df/crBtaxgdKOg3r3xJhxyoNTGBBOuzWRm1cB4yRACocQhdS7mGRZs
 mzEkKxstLrghRSpu736iv+6yWuWYkQMvxX1MVSRfPJ6MGypaQ2xNATlGrQUPAVdqmQnh
 cCERqKCYdXHpz5l0MIClPh0rG16cmoFO91KtEzFGMrHlY5TBSmAQISUND7gLG3gcRA4b
 YCmg==
X-Gm-Message-State: AJIora9ljevCQAnoC1nhm3SEh0P9bBrQodZcRPU2jiniM9owigM+jvZl
 0l6dMkd/k3OIJUthFz2dATMlG3VxpCiA/yZCowz1SAMbJCmcSSyhmRY=
X-Google-Smtp-Source: AGRyM1skLuIptEDE4EdZGD2u58j+ejlY5ZTYs9zT0StM+2D67Moqn83y9xGdQcrcpRhCxP9pXqXDxGEee5d3KNJwt0E=
X-Received: by 2002:a17:907:97d4:b0:722:e550:7490 with SMTP id
 js20-20020a17090797d400b00722e5507490mr11555803ejc.625.1656312965066; Sun, 26
 Jun 2022 23:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220627064414.1527623-1-ani@anisinha.ca>
 <CAARzgwyKJrzd78enu7y+s-bP9vs6L9Q=3hjrZ8_99FYKt98GrA@mail.gmail.com>
In-Reply-To: <CAARzgwyKJrzd78enu7y+s-bP9vs6L9Q=3hjrZ8_99FYKt98GrA@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 27 Jun 2022 12:25:54 +0530
Message-ID: <CAARzgwxNyByTJhwNT-MobgCPBjm4DPVFL3WpP8kAxp8yjxXrhA@mail.gmail.com>
Subject: Re: [PATCH 00/12] Introduce new acpi/smbios qtests using biosbits
To: qemu-devel@nongnu.org
Cc: imammedo@redhat.com, mst@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::62e;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, Jun 27, 2022 at 12:22 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> On Mon, Jun 27, 2022 at 12:14 PM Ani Sinha <ani@anisinha.ca> wrote:
> >
> > Biosbits is a software written by Josh Triplett that can be downloaded by
> > visiting https://biosbits.org/. The github codebase can be found here:
> > https://github.com/biosbits/bits/tree/master. It is a software that exercizes
> > the bios components such as acpi and smbios tables directly through acpica
> > bios interpreter (a freely available C based library written by Intel,
> > downloadable from https://acpica.org/ and is included with biosbits) without an
> > operating system getting involved in between.
> > There are several advantages to directly testing the bios in a real physical
> > machine or VM as opposed to indirectly discovering bios issues through the
> > operating system. For one thing, the OSes tend to hide bios problems from the
> > end user. The other is that we have more control of what we wanted to test
> > and how by directly using acpica interpreter on top of the bios on a running
> > system. More details on the inspiration for developing biosbits and its real
> > life uses can be found in (a) and (b).
> > This patchset contains QEMU qtests written in python that exercizes the QEMU
> > bios components using biosbits and reports test failures.
> >
> > Details of each of the files added by this patchset are provided in the README
> > file which is part of Patch 11. Every effort to contact Josh, through various
> > means including email, twitter, linkedIn etc has failed. Hence, the changes to
> > build biosbits with the newer compiler, upgrade acpica and other changes are
> > currently maintained in a forked project in my personal github. We may want to
> > maintain bits in a separate fork in a stable repository that is accessible by
> > QEMU developers.
> >
> > The newly introduced qtest currently only run for x86_64 platform. They pass
> > both when running make check on a baremetal box as well as from inside a vm.
> >
> > Thanks to Igor M for pointing me to this work.
> >
> > (a) https://blog.linuxplumbersconf.org/2011/ocw/system/presentations/867/original/bits.pdf
> > (b) https://www.youtube.com/watch?v=36QIepyUuhg
>
> Doh, sending the patch series failed since google won't allow file
> sizes larger than 25 MB. The bits prebuilt binaries have sizes 30 MB
> and 40 MB in two separate patches :(

I have pushed the patchset here:
https://gitlab.com/anisinha/qemu/-/commits/acpi-bits .

>
> >
> > Ani Sinha (12):
> >   qtest: meson.build changes required to integrate python based qtests
> >   acpi/tests/bits: add prebuilt bios bits zip archive
> >   acpi/tests/bits: add prebuilt bits generated grub modules and scripts
> >   acpi/tests/bits: initial commit of test scripts that are run by
> >     biosbits
> >   acpi/tests/bits: disable acpi PSS tests that are failing in biosbits
> >   acpi/tests/bits: add smilatency test suite from bits in order to
> >     disable it
> >   acpi/tests/bits: disable smilatency test since it does not pass
> >     everytime
> >   acpi/tests/bits: add biosbits config file for running bios tests
> >   acpi/tests/bits: add acpi and smbios python tests that uses biosbits
> >   acpi/tests/bits: add acpi bits qtest directory in meson for running
> >     tests
> >   acpi/tests/bits: add README file for bits qtests
> >   MAINTAINERS: add myself as the maintainer for acpi biosbits qtests
> >
> >  MAINTAINERS                                   |    5 +
> >  tests/qtest/acpi-bits/README                  |  168 ++
> >  tests/qtest/acpi-bits/acpi-bits-test-venv.sh  |   59 +
> >  tests/qtest/acpi-bits/acpi-bits-test.py       |  327 +++
> >  .../qtest/acpi-bits/bits-config/bits-cfg.txt  |   18 +
> >  tests/qtest/acpi-bits/bits-config/meson.build |   11 +
> >  tests/qtest/acpi-bits/bits-tests/meson.build  |   11 +
> >  tests/qtest/acpi-bits/bits-tests/smbios.py    | 2430 +++++++++++++++++
> >  .../qtest/acpi-bits/bits-tests/smilatency.py  |  103 +
> >  tests/qtest/acpi-bits/bits-tests/testacpi.py  |  283 ++
> >  tests/qtest/acpi-bits/bits-tests/testcpuid.py |   83 +
> >  tests/qtest/acpi-bits/meson.build             |   39 +
> >  .../acpi-bits/prebuilt/bits-2095-grub.tar.gz  |  Bin 0 -> 41416278 bytes
> >  tests/qtest/acpi-bits/prebuilt/bits-2095.zip  |  Bin 0 -> 31922898 bytes
> >  tests/qtest/acpi-bits/prebuilt/meson.build    |   11 +
> >  tests/qtest/acpi-bits/requirements.txt        |    1 +
> >  tests/qtest/meson.build                       |    7 +-
> >  17 files changed, 3555 insertions(+), 1 deletion(-)
> >  create mode 100644 tests/qtest/acpi-bits/README
> >  create mode 100644 tests/qtest/acpi-bits/acpi-bits-test-venv.sh
> >  create mode 100644 tests/qtest/acpi-bits/acpi-bits-test.py
> >  create mode 100644 tests/qtest/acpi-bits/bits-config/bits-cfg.txt
> >  create mode 100644 tests/qtest/acpi-bits/bits-config/meson.build
> >  create mode 100644 tests/qtest/acpi-bits/bits-tests/meson.build
> >  create mode 100644 tests/qtest/acpi-bits/bits-tests/smbios.py
> >  create mode 100644 tests/qtest/acpi-bits/bits-tests/smilatency.py
> >  create mode 100644 tests/qtest/acpi-bits/bits-tests/testacpi.py
> >  create mode 100644 tests/qtest/acpi-bits/bits-tests/testcpuid.py
> >  create mode 100644 tests/qtest/acpi-bits/meson.build
> >  create mode 100644 tests/qtest/acpi-bits/prebuilt/bits-2095-grub.tar.gz
> >  create mode 100644 tests/qtest/acpi-bits/prebuilt/bits-2095.zip
> >  create mode 100644 tests/qtest/acpi-bits/prebuilt/meson.build
> >  create mode 100644 tests/qtest/acpi-bits/requirements.txt
> >
> > --
> > 2.25.1
> >

