Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 300D655B863
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:58:53 +0200 (CEST)
Received: from localhost ([::1]:43046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5je0-00055F-0r
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5jEq-0000E5-86
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:32:52 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:43566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5jEo-0006Ne-4D
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:32:51 -0400
Received: by mail-ej1-x636.google.com with SMTP id u15so17189460ejc.10
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 00:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WfSNDqZMfjmfd8Ej1wKy50gDrLFSzwDb11KbTv85BzQ=;
 b=Z1rZDLhAt3EJ6zSd0dq42CaGlX2ZpSnWPVeXAQNSlgY9aW7HunfrumDTEsVCtcneUm
 MTRsCqqQhE/Bj+EYXurw4KqZpJEGc/XJIiEOIfJBQkT136RBz5IMMHfAj5xW92V2k5+Y
 el0vNGYqFRgleIF1eD7iF4x+6oT0qs7n8ge+OdbLT42lUTbUjNpTe5KUVLgy0/+8E1kF
 E21wYSxugvDTAmwhEp5d9KMq0sBucxyjIEVjnWRiOzE1revxBSGTvstTmtDxnS7RGB/m
 j9DGcLi7mnRPaSDpRtKqsBOzBYL+rTaOahJ337gBsfrW9JNm03nFfH7Q3/gpa1XgHB75
 HrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WfSNDqZMfjmfd8Ej1wKy50gDrLFSzwDb11KbTv85BzQ=;
 b=zl11mGaJWnk+jk86mR+ll/raAjNHDem89iC57Tq8kysPLnywvZNe7hqIwp4G/uIPgv
 sMJM2A3Wq+Lj5nCkpm7ucdcqz1Bp6jzXqVwhtA/IG35fdK7Z/Pq40xX3AA5R4JmczODe
 +NrC/mz6/nyq7QwbPqx5qP45HcJKdUK4y7g0APShdFk2JVoBJazs/XVxBy+Tv5enk1MO
 X86bub2KoJQ/4vZH6PCHmLDYkWFKXFj5YKqt9l7Jhl+VOH0l8yzzqvEE/rQzoGOoGCxG
 TOdl94zdWEi5cP595ydgLdwZUZgGK8ou8e1rGQ0aSVWsZKVBIb0k79/iJCBALbr+ZZH9
 aJdw==
X-Gm-Message-State: AJIora+c04bFgFWMm/G3i25zVuRd0u+PwPqlzXlpqYoPJMTDTg7C+55X
 vmoNwqQC1UDrZXKeNR0I7lgpNgT2XtcVXKizBalaaKR/cNlwISlN
X-Google-Smtp-Source: AGRyM1tNqPyv2azDbGdpw6kxnuo3TLILbo8raHhPqLt3x2TajUpoxi7yxs+vKkX6/uDiudlqiPnReB5AMwZbfFKe6b0=
X-Received: by 2002:a17:907:e93:b0:722:e082:2787 with SMTP id
 ho19-20020a1709070e9300b00722e0822787mr11893479ejc.618.1656315168559; Mon, 27
 Jun 2022 00:32:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220627064414.1527623-1-ani@anisinha.ca>
 <CAARzgwyKJrzd78enu7y+s-bP9vs6L9Q=3hjrZ8_99FYKt98GrA@mail.gmail.com>
 <CAARzgwxNyByTJhwNT-MobgCPBjm4DPVFL3WpP8kAxp8yjxXrhA@mail.gmail.com>
In-Reply-To: <CAARzgwxNyByTJhwNT-MobgCPBjm4DPVFL3WpP8kAxp8yjxXrhA@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 27 Jun 2022 13:02:37 +0530
Message-ID: <CAARzgwzGj_qr219YrOHDZRtd9GfFwjRhAj_KTY7TfJ4kYm+k9g@mail.gmail.com>
Subject: Re: [PATCH 00/12] Introduce new acpi/smbios qtests using biosbits
To: qemu-devel@nongnu.org
Cc: imammedo@redhat.com, mst@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::636;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x636.google.com
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

On Mon, Jun 27, 2022 at 12:25 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> On Mon, Jun 27, 2022 at 12:22 PM Ani Sinha <ani@anisinha.ca> wrote:
> >
> > On Mon, Jun 27, 2022 at 12:14 PM Ani Sinha <ani@anisinha.ca> wrote:
> > >
> > > Biosbits is a software written by Josh Triplett that can be downloaded by
> > > visiting https://biosbits.org/. The github codebase can be found here:
> > > https://github.com/biosbits/bits/tree/master. It is a software that exercizes
> > > the bios components such as acpi and smbios tables directly through acpica
> > > bios interpreter (a freely available C based library written by Intel,
> > > downloadable from https://acpica.org/ and is included with biosbits) without an
> > > operating system getting involved in between.
> > > There are several advantages to directly testing the bios in a real physical
> > > machine or VM as opposed to indirectly discovering bios issues through the
> > > operating system. For one thing, the OSes tend to hide bios problems from the
> > > end user. The other is that we have more control of what we wanted to test
> > > and how by directly using acpica interpreter on top of the bios on a running
> > > system. More details on the inspiration for developing biosbits and its real
> > > life uses can be found in (a) and (b).
> > > This patchset contains QEMU qtests written in python that exercizes the QEMU
> > > bios components using biosbits and reports test failures.
> > >
> > > Details of each of the files added by this patchset are provided in the README
> > > file which is part of Patch 11. Every effort to contact Josh, through various
> > > means including email, twitter, linkedIn etc has failed. Hence, the changes to
> > > build biosbits with the newer compiler, upgrade acpica and other changes are
> > > currently maintained in a forked project in my personal github. We may want to
> > > maintain bits in a separate fork in a stable repository that is accessible by
> > > QEMU developers.
> > >
> > > The newly introduced qtest currently only run for x86_64 platform. They pass
> > > both when running make check on a baremetal box as well as from inside a vm.
> > >
> > > Thanks to Igor M for pointing me to this work.
> > >
> > > (a) https://blog.linuxplumbersconf.org/2011/ocw/system/presentations/867/original/bits.pdf
> > > (b) https://www.youtube.com/watch?v=36QIepyUuhg
> >
> > Doh, sending the patch series failed since google won't allow file
> > sizes larger than 25 MB. The bits prebuilt binaries have sizes 30 MB
> > and 40 MB in two separate patches :(
>
> I have pushed the patchset here:
> https://gitlab.com/anisinha/qemu/-/commits/acpi-bits .

I have re-sent all the patches except patches 2 and 3 that contain
pre-built biosbits archives. For those two patches, please see the
gitlab repo above.

>
> >
> > >
> > > Ani Sinha (12):
> > >   qtest: meson.build changes required to integrate python based qtests
> > >   acpi/tests/bits: add prebuilt bios bits zip archive
> > >   acpi/tests/bits: add prebuilt bits generated grub modules and scripts
> > >   acpi/tests/bits: initial commit of test scripts that are run by
> > >     biosbits
> > >   acpi/tests/bits: disable acpi PSS tests that are failing in biosbits
> > >   acpi/tests/bits: add smilatency test suite from bits in order to
> > >     disable it
> > >   acpi/tests/bits: disable smilatency test since it does not pass
> > >     everytime
> > >   acpi/tests/bits: add biosbits config file for running bios tests
> > >   acpi/tests/bits: add acpi and smbios python tests that uses biosbits
> > >   acpi/tests/bits: add acpi bits qtest directory in meson for running
> > >     tests
> > >   acpi/tests/bits: add README file for bits qtests
> > >   MAINTAINERS: add myself as the maintainer for acpi biosbits qtests
> > >
> > >  MAINTAINERS                                   |    5 +
> > >  tests/qtest/acpi-bits/README                  |  168 ++
> > >  tests/qtest/acpi-bits/acpi-bits-test-venv.sh  |   59 +
> > >  tests/qtest/acpi-bits/acpi-bits-test.py       |  327 +++
> > >  .../qtest/acpi-bits/bits-config/bits-cfg.txt  |   18 +
> > >  tests/qtest/acpi-bits/bits-config/meson.build |   11 +
> > >  tests/qtest/acpi-bits/bits-tests/meson.build  |   11 +
> > >  tests/qtest/acpi-bits/bits-tests/smbios.py    | 2430 +++++++++++++++++
> > >  .../qtest/acpi-bits/bits-tests/smilatency.py  |  103 +
> > >  tests/qtest/acpi-bits/bits-tests/testacpi.py  |  283 ++
> > >  tests/qtest/acpi-bits/bits-tests/testcpuid.py |   83 +
> > >  tests/qtest/acpi-bits/meson.build             |   39 +
> > >  .../acpi-bits/prebuilt/bits-2095-grub.tar.gz  |  Bin 0 -> 41416278 bytes
> > >  tests/qtest/acpi-bits/prebuilt/bits-2095.zip  |  Bin 0 -> 31922898 bytes
> > >  tests/qtest/acpi-bits/prebuilt/meson.build    |   11 +
> > >  tests/qtest/acpi-bits/requirements.txt        |    1 +
> > >  tests/qtest/meson.build                       |    7 +-
> > >  17 files changed, 3555 insertions(+), 1 deletion(-)
> > >  create mode 100644 tests/qtest/acpi-bits/README
> > >  create mode 100644 tests/qtest/acpi-bits/acpi-bits-test-venv.sh
> > >  create mode 100644 tests/qtest/acpi-bits/acpi-bits-test.py
> > >  create mode 100644 tests/qtest/acpi-bits/bits-config/bits-cfg.txt
> > >  create mode 100644 tests/qtest/acpi-bits/bits-config/meson.build
> > >  create mode 100644 tests/qtest/acpi-bits/bits-tests/meson.build
> > >  create mode 100644 tests/qtest/acpi-bits/bits-tests/smbios.py
> > >  create mode 100644 tests/qtest/acpi-bits/bits-tests/smilatency.py
> > >  create mode 100644 tests/qtest/acpi-bits/bits-tests/testacpi.py
> > >  create mode 100644 tests/qtest/acpi-bits/bits-tests/testcpuid.py
> > >  create mode 100644 tests/qtest/acpi-bits/meson.build
> > >  create mode 100644 tests/qtest/acpi-bits/prebuilt/bits-2095-grub.tar.gz
> > >  create mode 100644 tests/qtest/acpi-bits/prebuilt/bits-2095.zip
> > >  create mode 100644 tests/qtest/acpi-bits/prebuilt/meson.build
> > >  create mode 100644 tests/qtest/acpi-bits/requirements.txt
> > >
> > > --
> > > 2.25.1
> > >

