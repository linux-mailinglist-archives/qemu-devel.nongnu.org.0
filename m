Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AEA55B809
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 08:56:26 +0200 (CEST)
Received: from localhost ([::1]:35560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5ifY-00008W-Iw
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 02:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5ic6-0006ma-Mw
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 02:52:50 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:38602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5ibv-0007R1-Im
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 02:52:50 -0400
Received: by mail-ej1-x629.google.com with SMTP id g26so17021404ejb.5
 for <qemu-devel@nongnu.org>; Sun, 26 Jun 2022 23:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zE+sFRXBWLEwh8bLeOSS4lb7V9fs6c6XBw+sMB8vkVk=;
 b=63csMIw+RC2G5rhpt/5d5XDAMoHr+1ZkBTjdN2zmsW21QqOULQYMmQo+9wHtVoRyVx
 TDBGaxxPwthfLpcm773tPy/c4pb0A1Q4Y42pgX9Rkoi3jRfWiku2FHxfIakEiPQeMMhQ
 6aieg4dhccpjFtIsDppPesz/g54Tf47Zwz6znucvQTW/c+qj//qBOAKwASlOItwdEFwR
 jJz70eNtUs6PwuzVtyBimNrazNGlZ3vopClo4hmlr92RXo6hVMXS7fZq14TKOy/dQoBC
 vfp1rryN4TOwPCXd+4Q2eoPS/qjgKLoo1+ecXbWTKDm0MaI4LSxNjBIOgX2kAHt1z1ie
 BeYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zE+sFRXBWLEwh8bLeOSS4lb7V9fs6c6XBw+sMB8vkVk=;
 b=v1KUOgoymOgnCfle0VoPoKs0aUGuJVcWjCbc9k0xEECKua/HF4sag/RjovXpjFb1R6
 dPRk7Y69uXLIav1lv7BtaWSz8fKMS/1slvt1eg0M5LxFK0ysled3DS/HszKxPXfo32gA
 nDHoGp8yVB7vT6qHiPhrLoFO9+TbseSAnnUpGV+gBU1aAFobNvIBflJxaf5okR67OqdE
 MGZr/bCzDDAZ5oUI6r7XiJRoJ13MEUSiDmsfDbolge6cciV+KXlTpzNr/2h3iA8XHumO
 EXIEs0j3Ptl2Bkhf7RycUYZmiykx0uaJkfJ4krZlzpC1HCss2TnSft2dBNzN5geI1qKK
 uysA==
X-Gm-Message-State: AJIora9g0lr6HBwjD13rXmhrX/kjWJ/8XcfauwjjWE6oHUJJ0tvDWpO8
 QHJVutqNhFgWpIYuA2Uo2q5knnmS4iR5JcKcAvYKEUd3KZ4rgUwz
X-Google-Smtp-Source: AGRyM1sjIlL2Jgt0m5uplRKSiU8dVF81sw1TIbkvyeHPVKoObVrNjteyTlaNlSHLZsITepIkX9iipSaIdCh27O1X4lc=
X-Received: by 2002:a17:907:e93:b0:722:e082:2787 with SMTP id
 ho19-20020a1709070e9300b00722e0822787mr11756115ejc.618.1656312757574; Sun, 26
 Jun 2022 23:52:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220627064414.1527623-1-ani@anisinha.ca>
In-Reply-To: <20220627064414.1527623-1-ani@anisinha.ca>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 27 Jun 2022 12:22:26 +0530
Message-ID: <CAARzgwyKJrzd78enu7y+s-bP9vs6L9Q=3hjrZ8_99FYKt98GrA@mail.gmail.com>
Subject: Re: [PATCH 00/12] Introduce new acpi/smbios qtests using biosbits
To: qemu-devel@nongnu.org
Cc: imammedo@redhat.com, mst@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::629;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, Jun 27, 2022 at 12:14 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> Biosbits is a software written by Josh Triplett that can be downloaded by
> visiting https://biosbits.org/. The github codebase can be found here:
> https://github.com/biosbits/bits/tree/master. It is a software that exercizes
> the bios components such as acpi and smbios tables directly through acpica
> bios interpreter (a freely available C based library written by Intel,
> downloadable from https://acpica.org/ and is included with biosbits) without an
> operating system getting involved in between.
> There are several advantages to directly testing the bios in a real physical
> machine or VM as opposed to indirectly discovering bios issues through the
> operating system. For one thing, the OSes tend to hide bios problems from the
> end user. The other is that we have more control of what we wanted to test
> and how by directly using acpica interpreter on top of the bios on a running
> system. More details on the inspiration for developing biosbits and its real
> life uses can be found in (a) and (b).
> This patchset contains QEMU qtests written in python that exercizes the QEMU
> bios components using biosbits and reports test failures.
>
> Details of each of the files added by this patchset are provided in the README
> file which is part of Patch 11. Every effort to contact Josh, through various
> means including email, twitter, linkedIn etc has failed. Hence, the changes to
> build biosbits with the newer compiler, upgrade acpica and other changes are
> currently maintained in a forked project in my personal github. We may want to
> maintain bits in a separate fork in a stable repository that is accessible by
> QEMU developers.
>
> The newly introduced qtest currently only run for x86_64 platform. They pass
> both when running make check on a baremetal box as well as from inside a vm.
>
> Thanks to Igor M for pointing me to this work.
>
> (a) https://blog.linuxplumbersconf.org/2011/ocw/system/presentations/867/original/bits.pdf
> (b) https://www.youtube.com/watch?v=36QIepyUuhg

Doh, sending the patch series failed since google won't allow file
sizes larger than 25 MB. The bits prebuilt binaries have sizes 30 MB
and 40 MB in two separate patches :(

>
> Ani Sinha (12):
>   qtest: meson.build changes required to integrate python based qtests
>   acpi/tests/bits: add prebuilt bios bits zip archive
>   acpi/tests/bits: add prebuilt bits generated grub modules and scripts
>   acpi/tests/bits: initial commit of test scripts that are run by
>     biosbits
>   acpi/tests/bits: disable acpi PSS tests that are failing in biosbits
>   acpi/tests/bits: add smilatency test suite from bits in order to
>     disable it
>   acpi/tests/bits: disable smilatency test since it does not pass
>     everytime
>   acpi/tests/bits: add biosbits config file for running bios tests
>   acpi/tests/bits: add acpi and smbios python tests that uses biosbits
>   acpi/tests/bits: add acpi bits qtest directory in meson for running
>     tests
>   acpi/tests/bits: add README file for bits qtests
>   MAINTAINERS: add myself as the maintainer for acpi biosbits qtests
>
>  MAINTAINERS                                   |    5 +
>  tests/qtest/acpi-bits/README                  |  168 ++
>  tests/qtest/acpi-bits/acpi-bits-test-venv.sh  |   59 +
>  tests/qtest/acpi-bits/acpi-bits-test.py       |  327 +++
>  .../qtest/acpi-bits/bits-config/bits-cfg.txt  |   18 +
>  tests/qtest/acpi-bits/bits-config/meson.build |   11 +
>  tests/qtest/acpi-bits/bits-tests/meson.build  |   11 +
>  tests/qtest/acpi-bits/bits-tests/smbios.py    | 2430 +++++++++++++++++
>  .../qtest/acpi-bits/bits-tests/smilatency.py  |  103 +
>  tests/qtest/acpi-bits/bits-tests/testacpi.py  |  283 ++
>  tests/qtest/acpi-bits/bits-tests/testcpuid.py |   83 +
>  tests/qtest/acpi-bits/meson.build             |   39 +
>  .../acpi-bits/prebuilt/bits-2095-grub.tar.gz  |  Bin 0 -> 41416278 bytes
>  tests/qtest/acpi-bits/prebuilt/bits-2095.zip  |  Bin 0 -> 31922898 bytes
>  tests/qtest/acpi-bits/prebuilt/meson.build    |   11 +
>  tests/qtest/acpi-bits/requirements.txt        |    1 +
>  tests/qtest/meson.build                       |    7 +-
>  17 files changed, 3555 insertions(+), 1 deletion(-)
>  create mode 100644 tests/qtest/acpi-bits/README
>  create mode 100644 tests/qtest/acpi-bits/acpi-bits-test-venv.sh
>  create mode 100644 tests/qtest/acpi-bits/acpi-bits-test.py
>  create mode 100644 tests/qtest/acpi-bits/bits-config/bits-cfg.txt
>  create mode 100644 tests/qtest/acpi-bits/bits-config/meson.build
>  create mode 100644 tests/qtest/acpi-bits/bits-tests/meson.build
>  create mode 100644 tests/qtest/acpi-bits/bits-tests/smbios.py
>  create mode 100644 tests/qtest/acpi-bits/bits-tests/smilatency.py
>  create mode 100644 tests/qtest/acpi-bits/bits-tests/testacpi.py
>  create mode 100644 tests/qtest/acpi-bits/bits-tests/testcpuid.py
>  create mode 100644 tests/qtest/acpi-bits/meson.build
>  create mode 100644 tests/qtest/acpi-bits/prebuilt/bits-2095-grub.tar.gz
>  create mode 100644 tests/qtest/acpi-bits/prebuilt/bits-2095.zip
>  create mode 100644 tests/qtest/acpi-bits/prebuilt/meson.build
>  create mode 100644 tests/qtest/acpi-bits/requirements.txt
>
> --
> 2.25.1
>

