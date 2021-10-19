Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D12433604
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 14:30:55 +0200 (CEST)
Received: from localhost ([::1]:41828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcoGc-0004rT-AV
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 08:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mcoB2-0001TC-OS
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 08:25:08 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:40605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mcoB0-0003b2-6c
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 08:25:08 -0400
Received: by mail-ed1-x52e.google.com with SMTP id 5so11818773edw.7
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 05:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8ghuzqagYRpNaamew+FagY/12PWrk7bYFQ3mi8P6OII=;
 b=kbC9noZ/6bY65sGWu31MdyEC9VGa0+3SSdvbQ+7x8IR8GW622oUmw8hLMqNBRfhpHF
 tXka4xRT0B7m6wJ9Bf5IXw78kznCd1Q+RlLAe0hPmTNUpbjmVpjsbKpoVIQyBb0lYl/1
 /8K0SA9HpTTTrcGBzLMq+NIVbFaYNjOzn+b1ID4prBNNktxaOZQ0xXtIAs3XWtFBpwiD
 BDbDVBoKBglrlTVA12ewEEK6X7FYb12tafpwaRc3PBah5DlwLgYqWtZ1MTJLJa/4TYDv
 Ofm9ojwdr8Pzq04IGF/4wnaQZRFqZro1Es1z5KU7/GtJhk35RZ/BxghKe2qn1qxkFx55
 priQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8ghuzqagYRpNaamew+FagY/12PWrk7bYFQ3mi8P6OII=;
 b=daklYGh5Tf4SyFNCP2t39EFAtIikB+6wXau/VqdgZ7xKx2S2xSn1wo5tHNvgnZ+DeF
 3NtznR3zT6NPv0JJgVDlXTMMFFbWNrHAUXgD14TaP8zHNMK5kZwe29jFX9ixcrnfRxPU
 ZcodtmSC5cvGu2gGcOY6HV5mrn/c+25X1Qi/oSr2ZVb1B8SvuqrDLOItXeFI9BP8CsS+
 /7qHrN1zJOZwFEO+6en+/IFxEfNI597pjndr3+XCDWv/4xQwoKTsY+0FF/xwY5GaxJxn
 ZmMc5zPF53NcY3fd+YbxwM9yceNLgjI6IvfKG0/ntjDytM8AxzhBDDyjSms/jn+UGeag
 mk6w==
X-Gm-Message-State: AOAM532XNh7lztBV0iHl4BpIaq9QlpZxSsD5fiZlFpLuD74kFHfQ7vM0
 eIR0JKXkQLvOGwrU9oJNRRqlUEdnTVYkmAkvbSA5nQ==
X-Google-Smtp-Source: ABdhPJzOZMYybq79I1x2UNjPcxzbQBmDBpdKzUAELCC6vxMthgk3fm14fjQCMv7d8AJZLqLqAbTRDe+kmMg2fEEp/14=
X-Received: by 2002:a05:6402:c05:: with SMTP id
 co5mr53702049edb.65.1634646302188; 
 Tue, 19 Oct 2021 05:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <1634324580-27120-1-git-send-email-eric.devolder@oracle.com>
 <alpine.DEB.2.22.394.2110191728580.168116@anisinha-lenovo>
In-Reply-To: <alpine.DEB.2.22.394.2110191728580.168116@anisinha-lenovo>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 19 Oct 2021 17:54:51 +0530
Message-ID: <CAARzgwxyEaTGSPkSqRZHMJADKhf3dnOvnTiEdY5baTjb318Mzg@mail.gmail.com>
Subject: Re: [PATCH v8 00/10] acpi: Error Record Serialization Table, ERST,
 support for QEMU
To: Eric DeVolder <eric.devolder@oracle.com>
Content-Type: multipart/alternative; boundary="0000000000002cfac805ceb3c065"
Received-SPF: none client-ip=2a00:1450:4864:20::52e;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 mst@redhat.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002cfac805ceb3c065
Content-Type: text/plain; charset="UTF-8"

Oh sorry. Please disregard that. I see you did send all the patches in the
series for v8. My Gmail tagging went wrong.

On Tue, Oct 19, 2021 at 17:30 Ani Sinha <ani@anisinha.ca> wrote:

> Hi Eric:
>
> So I do not see all the patches in the series for v8. Just so you know,
> when you spin out a new version, please do send all the patches in the
> series again, including the ones that might have been already reviewed.
>
> Ani
>
>
> On Fri, 15 Oct 2021, Eric DeVolder wrote:
>
> > This patchset introduces support for the ACPI Error Record
> > Serialization Table, ERST.
> >
> > For background and implementation information, please see
> > docs/specs/acpi_erst.rst, which is patch 2/10.
> >
> > Suggested-by: Konrad Wilk <konrad.wilk@oracle.com>
> > Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> >
> > ---
> > v8: 15oct2021
> >  - Added Kconfig option for ERST, per Ani Sinha
> >  - Fixed patch ordering, per Ani
> >
> > v7: 7oct2021
> >  - style improvements, per Igor
> >  - use of endian accessors for storage header, per Igor
> >  - a number of optimizations and improvements, per Igor
> >  - updated spec for header, per Igor
> >  - updated spec for rst format, per Michael Tsirkin
> >  - updated spec for new record_size parameter
> >    Due to changes in the spec, I am not carrying the
> >    Acked-by from Ani Sinha.
> >  - changes for and testing of migration to systems with
> >    differing ERST_RECORD_SIZE
> >
> > v6: 5aug2021
> >  - Fixed compile warning/error, per Michael Tsirkin
> >  - Fixed mingw32 build error, per Michael
> >  - Converted exchange buffer to MemoryBackend, per Igor
> >  - Migrated test to PCI, per Igor
> >  - Significantly reduced amount of copying, per Igor
> >  - Corrections/enhancements to acpi_erst.txt, per Igor
> >  - Many misc/other small items, per Igor
> >
> > v5: 30jun2021
> >  - Create docs/specs/acpi_erst.txt, per Igor
> >  - Separate PCI BARs for registers and memory, per Igor
> >  - Convert debugging to use trace infrastructure, per Igor
> >  - Various other fixups, per Igor
> >
> > v4: 11jun2021
> >  - Converted to a PCI device, per Igor.
> >  - Updated qtest.
> >  - Rearranged patches, per Igor.
> >
> > v3: 28may2021
> >  - Converted to using a TYPE_MEMORY_BACKEND_FILE object rather than
> >    internal array with explicit file operations, per Igor.
> >  - Changed the way the qdev and base address are handled, allowing
> >    ERST to be disabled at run-time. Also aligns better with other
> >    existing code.
> >
> > v2: 8feb2021
> >  - Added qtest/smoke test per Paolo Bonzini
> >  - Split patch into smaller chunks, per Igor Mammedov
> >  - Did away with use of ACPI packed structures, per Igor Mammedov
> >
> > v1: 26oct2020
> >  - initial post
> >
> > ---
> > Eric DeVolder (10):
> >   ACPI ERST: bios-tables-test.c steps 1 and 2
> >   ACPI ERST: specification for ERST support
> >   ACPI ERST: PCI device_id for ERST
> >   ACPI ERST: header file for ERST
> >   ACPI ERST: support for ACPI ERST feature
> >   ACPI ERST: build the ACPI ERST table
> >   ACPI ERST: create ACPI ERST table for pc/x86 machines
> >   ACPI ERST: qtest for ERST
> >   ACPI ERST: bios-tables-test testcase
> >   ACPI ERST: step 6 of bios-tables-test.c
> >
> >  docs/specs/acpi_erst.rst          |  200 +++++++
> >  hw/acpi/Kconfig                   |    6 +
> >  hw/acpi/erst.c                    | 1077
> +++++++++++++++++++++++++++++++++++++
> >  hw/acpi/meson.build               |    1 +
> >  hw/acpi/trace-events              |   15 +
> >  hw/i386/acpi-build.c              |    9 +
> >  hw/i386/acpi-microvm.c            |    9 +
> >  include/hw/acpi/erst.h            |   24 +
> >  include/hw/pci/pci.h              |    1 +
> >  tests/data/acpi/microvm/ERST.pcie |  Bin 0 -> 912 bytes
> >  tests/data/acpi/pc/DSDT.acpierst  |  Bin 0 -> 5969 bytes
> >  tests/data/acpi/pc/ERST           |    0
> >  tests/data/acpi/q35/DSDT.acpierst |  Bin 0 -> 8306 bytes
> >  tests/data/acpi/q35/ERST          |    0
> >  tests/qtest/bios-tables-test.c    |   55 ++
> >  tests/qtest/erst-test.c           |  167 ++++++
> >  tests/qtest/meson.build           |    2 +
> >  17 files changed, 1566 insertions(+)
> >  create mode 100644 docs/specs/acpi_erst.rst
> >  create mode 100644 hw/acpi/erst.c
> >  create mode 100644 include/hw/acpi/erst.h
> >  create mode 100644 tests/data/acpi/microvm/ERST.pcie
> >  create mode 100644 tests/data/acpi/pc/DSDT.acpierst
> >  create mode 100644 tests/data/acpi/pc/ERST
> >  create mode 100644 tests/data/acpi/q35/DSDT.acpierst
> >  create mode 100644 tests/data/acpi/q35/ERST
> >  create mode 100644 tests/qtest/erst-test.c
> >
> > --
> > 1.8.3.1
> >
> >
>

--0000000000002cfac805ceb3c065
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Oh sorry. Please disregard that. I see you did send all t=
he patches in the series for v8. My Gmail tagging went wrong.</div><div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, O=
ct 19, 2021 at 17:30 Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca">ani@a=
nisinha.ca</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Eric:=
<br>
<br>
So I do not see all the patches in the series for v8. Just so you know,<br>
when you spin out a new version, please do send all the patches in the<br>
series again, including the ones that might have been already reviewed.<br>
<br>
Ani<br>
<br>
<br>
On Fri, 15 Oct 2021, Eric DeVolder wrote:<br>
<br>
&gt; This patchset introduces support for the ACPI Error Record<br>
&gt; Serialization Table, ERST.<br>
&gt;<br>
&gt; For background and implementation information, please see<br>
&gt; docs/specs/acpi_erst.rst, which is patch 2/10.<br>
&gt;<br>
&gt; Suggested-by: Konrad Wilk &lt;<a href=3D"mailto:konrad.wilk@oracle.com=
" target=3D"_blank">konrad.wilk@oracle.com</a>&gt;<br>
&gt; Signed-off-by: Eric DeVolder &lt;<a href=3D"mailto:eric.devolder@oracl=
e.com" target=3D"_blank">eric.devolder@oracle.com</a>&gt;<br>
&gt;<br>
&gt; ---<br>
&gt; v8: 15oct2021<br>
&gt;=C2=A0 - Added Kconfig option for ERST, per Ani Sinha<br>
&gt;=C2=A0 - Fixed patch ordering, per Ani<br>
&gt;<br>
&gt; v7: 7oct2021<br>
&gt;=C2=A0 - style improvements, per Igor<br>
&gt;=C2=A0 - use of endian accessors for storage header, per Igor<br>
&gt;=C2=A0 - a number of optimizations and improvements, per Igor<br>
&gt;=C2=A0 - updated spec for header, per Igor<br>
&gt;=C2=A0 - updated spec for rst format, per Michael Tsirkin<br>
&gt;=C2=A0 - updated spec for new record_size parameter<br>
&gt;=C2=A0 =C2=A0 Due to changes in the spec, I am not carrying the<br>
&gt;=C2=A0 =C2=A0 Acked-by from Ani Sinha.<br>
&gt;=C2=A0 - changes for and testing of migration to systems with<br>
&gt;=C2=A0 =C2=A0 differing ERST_RECORD_SIZE<br>
&gt;<br>
&gt; v6: 5aug2021<br>
&gt;=C2=A0 - Fixed compile warning/error, per Michael Tsirkin<br>
&gt;=C2=A0 - Fixed mingw32 build error, per Michael<br>
&gt;=C2=A0 - Converted exchange buffer to MemoryBackend, per Igor<br>
&gt;=C2=A0 - Migrated test to PCI, per Igor<br>
&gt;=C2=A0 - Significantly reduced amount of copying, per Igor<br>
&gt;=C2=A0 - Corrections/enhancements to acpi_erst.txt, per Igor<br>
&gt;=C2=A0 - Many misc/other small items, per Igor<br>
&gt;<br>
&gt; v5: 30jun2021<br>
&gt;=C2=A0 - Create docs/specs/acpi_erst.txt, per Igor<br>
&gt;=C2=A0 - Separate PCI BARs for registers and memory, per Igor<br>
&gt;=C2=A0 - Convert debugging to use trace infrastructure, per Igor<br>
&gt;=C2=A0 - Various other fixups, per Igor<br>
&gt;<br>
&gt; v4: 11jun2021<br>
&gt;=C2=A0 - Converted to a PCI device, per Igor.<br>
&gt;=C2=A0 - Updated qtest.<br>
&gt;=C2=A0 - Rearranged patches, per Igor.<br>
&gt;<br>
&gt; v3: 28may2021<br>
&gt;=C2=A0 - Converted to using a TYPE_MEMORY_BACKEND_FILE object rather th=
an<br>
&gt;=C2=A0 =C2=A0 internal array with explicit file operations, per Igor.<b=
r>
&gt;=C2=A0 - Changed the way the qdev and base address are handled, allowin=
g<br>
&gt;=C2=A0 =C2=A0 ERST to be disabled at run-time. Also aligns better with =
other<br>
&gt;=C2=A0 =C2=A0 existing code.<br>
&gt;<br>
&gt; v2: 8feb2021<br>
&gt;=C2=A0 - Added qtest/smoke test per Paolo Bonzini<br>
&gt;=C2=A0 - Split patch into smaller chunks, per Igor Mammedov<br>
&gt;=C2=A0 - Did away with use of ACPI packed structures, per Igor Mammedov=
<br>
&gt;<br>
&gt; v1: 26oct2020<br>
&gt;=C2=A0 - initial post<br>
&gt;<br>
&gt; ---<br>
&gt; Eric DeVolder (10):<br>
&gt;=C2=A0 =C2=A0ACPI ERST: bios-tables-test.c steps 1 and 2<br>
&gt;=C2=A0 =C2=A0ACPI ERST: specification for ERST support<br>
&gt;=C2=A0 =C2=A0ACPI ERST: PCI device_id for ERST<br>
&gt;=C2=A0 =C2=A0ACPI ERST: header file for ERST<br>
&gt;=C2=A0 =C2=A0ACPI ERST: support for ACPI ERST feature<br>
&gt;=C2=A0 =C2=A0ACPI ERST: build the ACPI ERST table<br>
&gt;=C2=A0 =C2=A0ACPI ERST: create ACPI ERST table for pc/x86 machines<br>
&gt;=C2=A0 =C2=A0ACPI ERST: qtest for ERST<br>
&gt;=C2=A0 =C2=A0ACPI ERST: bios-tables-test testcase<br>
&gt;=C2=A0 =C2=A0ACPI ERST: step 6 of bios-tables-test.c<br>
&gt;<br>
&gt;=C2=A0 docs/specs/acpi_erst.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 200 +++++++<br>
&gt;=C2=A0 hw/acpi/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 6 +<br>
&gt;=C2=A0 hw/acpi/erst.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 1077 +++++++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 hw/acpi/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 hw/acpi/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A015 +<br>
&gt;=C2=A0 hw/i386/acpi-build.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 9 +<br>
&gt;=C2=A0 hw/i386/acpi-microvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 9 +<br>
&gt;=C2=A0 include/hw/acpi/erst.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A024 +<br>
&gt;=C2=A0 include/hw/pci/pci.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 tests/data/acpi/microvm/ERST.pcie |=C2=A0 Bin 0 -&gt; 912 bytes<=
br>
&gt;=C2=A0 tests/data/acpi/pc/DSDT.acpierst=C2=A0 |=C2=A0 Bin 0 -&gt; 5969 =
bytes<br>
&gt;=C2=A0 tests/data/acpi/pc/ERST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 =C2=A0 0<br>
&gt;=C2=A0 tests/data/acpi/q35/DSDT.acpierst |=C2=A0 Bin 0 -&gt; 8306 bytes=
<br>
&gt;=C2=A0 tests/data/acpi/q35/ERST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 0<br>
&gt;=C2=A0 tests/qtest/bios-tables-test.c=C2=A0 =C2=A0 |=C2=A0 =C2=A055 ++<=
br>
&gt;=C2=A0 tests/qtest/erst-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 167 ++++++<br>
&gt;=C2=A0 tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 =C2=A0 2 +<br>
&gt;=C2=A0 17 files changed, 1566 insertions(+)<br>
&gt;=C2=A0 create mode 100644 docs/specs/acpi_erst.rst<br>
&gt;=C2=A0 create mode 100644 hw/acpi/erst.c<br>
&gt;=C2=A0 create mode 100644 include/hw/acpi/erst.h<br>
&gt;=C2=A0 create mode 100644 tests/data/acpi/microvm/ERST.pcie<br>
&gt;=C2=A0 create mode 100644 tests/data/acpi/pc/DSDT.acpierst<br>
&gt;=C2=A0 create mode 100644 tests/data/acpi/pc/ERST<br>
&gt;=C2=A0 create mode 100644 tests/data/acpi/q35/DSDT.acpierst<br>
&gt;=C2=A0 create mode 100644 tests/data/acpi/q35/ERST<br>
&gt;=C2=A0 create mode 100644 tests/qtest/erst-test.c<br>
&gt;<br>
&gt; --<br>
&gt; 1.8.3.1<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--0000000000002cfac805ceb3c065--

