Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB194D1D25
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 17:28:21 +0100 (CET)
Received: from localhost ([::1]:54086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRchA-0008JQ-9r
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 11:28:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nRcgD-0007az-RA
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 11:27:22 -0500
Received: from [2a00:1450:4864:20::629] (port=45982
 helo=mail-ej1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nRcgA-0008W3-IG
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 11:27:21 -0500
Received: by mail-ej1-x629.google.com with SMTP id qa43so40359425ejc.12
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 08:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QfW2SuzcTKuzlcJFIViWVNDOfkLI0vkDcC71k6xl+XY=;
 b=mSbvWNgR26zyCqNYzCKEa35mqSoa80JAWRvYkbIpGyLPxtdhJkCU2qx6npps3NU1eX
 5X2mOc90mJZi2wT3514bD9HzZ22l+fh+T4YC8EkmqvtMNcdyBCuyrg/6VZ5THB3F4Hga
 tyjTJCI4e7QHutlvqk5N5EJqo8O9RmpQRIT7yZrxMoN0iato1HDlSVEubGcvKNRd29rl
 4as/KlUCox9+AdOgqKpauSRbLkWQYXlagQpv6N6l/bdLhYa+AYqOFM2qDNYTTQl4OvQU
 3WY/0dFNI74TQzmxW2ajNSUhZ1Eo04JiG10SgNICAgvi9YVDmSGRSfYajxfvI7XPLeJa
 Iy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QfW2SuzcTKuzlcJFIViWVNDOfkLI0vkDcC71k6xl+XY=;
 b=blwQXdmlTF9SMDuz6Uo3nYcFCDykYceCkIgOhAGfbGgoe1x0zquJoJVhvYJ05zA5mS
 t1PtJGRpmHO/bS9JV3QEA+BgOoxzr3ZkBaWqI976D5ytbSXbwhBhfPvt050VwqAYIEQo
 omHzNkpizEUhfwL1nHM8OpTsLm936TIVZQT6Rz592ZtDtYBEbj1z/DnptBaBbVzGcJP6
 b5sUbI/eXI9O7zWldxtZQe6rDDSf5yMn6ulK9t2JC847vCjJQanUjFL+ksCorx9yDJDs
 amcKVfOIddvfXlEX6/U3g5L9JrQCVtampSIU7cDsoO75T4FLQiCqhRnLRoYJg1yGoegV
 7cTQ==
X-Gm-Message-State: AOAM532OA+G+70dFYQ9u2wQ1cvqhL7BwRw0KGLcciSLOExCGGarzfuLS
 an7h8Jn6Saxzp6IKLELEMjbH7yPGa1E8b4ZfjWYV9w==
X-Google-Smtp-Source: ABdhPJyf+JsbU5O8Xyp+8NS/WaYAMMjk8cdl2g/g8mUBRIqTwWuiBtM4+Xb2YW1aMeflw/psW6Q9ZCvhLpZHI3UNJyQ=
X-Received: by 2002:a17:907:2d29:b0:6db:2b1f:333a with SMTP id
 gs41-20020a1709072d2900b006db2b1f333amr9229939ejc.704.1646756836111; Tue, 08
 Mar 2022 08:27:16 -0800 (PST)
MIME-Version: 1.0
References: <20220308063955.2285902-1-ani@anisinha.ca>
 <399ca3a9-8b95-39af-8376-85f2edf00c7e@redhat.com>
 <f744a5f1-6dde-4b57-d52a-9b6104c5e510@redhat.com>
In-Reply-To: <f744a5f1-6dde-4b57-d52a-9b6104c5e510@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 8 Mar 2022 21:57:04 +0530
Message-ID: <CAARzgwzrfZM9xRruVfKnSPvoquGpK4rw4Wx1RAdYZYswOCLpig@mail.gmail.com>
Subject: Re: [libvirt] [PATCH RESEND v2 0/4] re-introduce <acpi-hotplug-bridge>
To: Laine Stump <laine@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000003f927805d9b77476"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::629
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::629;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x629.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: libvir-list@redhat.com, imammedo@redhat.com, jusual@redhat.com,
 qemu list <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003f927805d9b77476
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 8, 2022 at 21:21 Laine Stump <laine@redhat.com> wrote:

> Aha! the domain of qemu-devel@nongnu.org was incorrect in the original
> send (it was "nognu.org"), so none of this thread was making it to that
> list. I've corrected it in this message, but interested parties from
> qemu-devel will need to look on the libvir-list archives for the actual
> patch mails:
>
> https://listman.redhat.com/archives/libvir-list/2022-March/229089.html
>
> Anyone else who responds to any of the mail on this thread should fix
> the qemu-devel address accordingly.


This patch set has been a true test of my diligence and perseverance =F0=9F=
=99=82


>
> On 3/8/22 10:33 AM, Laine Stump wrote:
> > On 3/8/22 1:39 AM, Ani Sinha wrote:
> >> Changelog:
> >> v2 - rebased the patch series to latest master.
> >>
> >> I am re-introducing the patchset for <acpi-hotplug-bridge> which got
> >> reverted here few months back:
> >>
> >> https://www.spinics.net/linux/fedora/libvir/msg224089.html
> >>
> >> The reason for the reversal was that there seemed to be some
> >> instability/issues around the use of the qemu commandline which this
> >> patchset tries to support. In particular, some guest operating systems
> >> did not like the way QEMU was trying to disable native hotplug on pcie
> >> root ports.
> >
> > My memory isn't completely clear, but I think there was also the issue
> > that the option claims to enable ACPI hotplug when set to on, but
> > instead what it actually does (in the Q35 case at least) is to enable
> > native PCI hotplug when set to off (without actually disabling ACPI
> > hotplug) and disable native PCI hotplug when set to on, or something
> > like that. This ends up leaving it up to the guest OS to decide which
> > type of hotplug to use, meaning its decision could override what's in
> > the libvirt config, thus confusing everyone. Again, I probably have the
> > details mixed up, but it was something like this.
> >
> > I asked mst about this this morning, and he suggested something that
> > you've already done - Cc'ing the series to qemu-devel and the relevant
> > maintainers so we can have a discussion with all involved parties about
> > their opinions on whether we really should expose this existing option
> > in libvirt, or if we should instead have two new options that are more
> > orthogonal about enabling/disabling the two types of hotplug, so that
> > libvirt config can more accurately represent what is being presented to
> > the guest rather than a "best guess" of what we think the guest is goin=
g
> > to do with what is presented.
> >
> > (Michael did also say that, with the current flurry of bug reports for
> > the QEMU rc's, this discusion may not happen until closer to release
> > when the bug reports die down. I know this doesn't mesh with your desir=
e
> > to "push now to allow for testing" (which in general would be a good
> > thing if we were certain that we wanted the option like this and were
> > just expecting some minor bugs that could be fixed), but my opinion is
> > that 1) it's possible for anyone interested to test the functionality
> > using <qemu:commandline>, and 2) we should avoid turning libvirt git
> > into a revolving door of experiments. The only practical difference
> > between using <qemu:commandline> and having a dedicated option is that
> > the use of <qemu:commandline> causes the domain to be tainted, and the
> > XML is a bit more complicated. But since the people we're talking about
> > here will already have built their own libvirt binaries, the tainted
> > status of any guests is irrelevant and the extra complexity of using
> > <qemu:commandline> is probably trivial to them :-).
> >
> >> Subsequently, in QEMU 6.2, we have changed our mechanism
> >> using which we disable native hotplug. As I understand, we do not have
> >> any reported issues so far in 6.2 around this area. QEMU will enter a
> >> soft feature freeze in the first week of march in prep for 7.0 release=
.
> >> Libvirt is also entering a new release cycle phaze. Hence, I am
> >> introducing this patchset early enough in the release cycles so that i=
f
> >> we do see any issues on the qemu side during the rc0, rc1 cycles and i=
f
> >> reversal of this patchset is again required, it can be done in time
> >> before the next libvirt release end of March.
> >>
> >> All the patches in this series had been previously reviewed. Some
> >> subsequent fixes were made after my initial patches were pushed. I hav=
e
> >> squashed all those fixes and consolidated them into four patches. I ha=
ve
> >> also updated the documentation to reflect the new changes from the QEM=
U
> >> side and rebased my changes fixing the tests in the process.
> >>
> >> What changed in QEMU post version 6.1 ?
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >> We have made basically two major changes in QEMU. First is this change=
:
> >>
> >> (1) commit 211afe5c69b597acf85fdd577eb497f5be1ffbd8
> >> Author: Julia Suvorova <jusual@redhat.com>
> >> Date:   Fri Nov 12 06:08:56 2021 -0500
> >>
> >>      hw/i386/acpi-build: Deny control on PCIe Native Hot-plug in _OSC
> >>      There are two ways to enable ACPI PCI Hot-plug:
> >>              * Disable the Hot-plug Capable bit on PCIe slots.
> >>      This was the first approach which led to regression [1-2], as
> >>      I/O space for a port is allocated only when it is hot-pluggable,
> >>      which is determined by HPC bit.
> >>              * Leave the HPC bit on and disable PCIe Native Hot-plug
> >> in _OSC
> >>                method.
> >>      This removes the (future) ability of hot-plugging switches with
> PCIe
> >>      Native hotplug since ACPI PCI Hot-plug only works with cold-plugg=
ed
> >>      bridges. If the user wants to explicitely use this feature, they
> can
> >>      disable ACPI PCI Hot-plug with:
> >>              --global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=3D=
off
> >>      Change the bit in _OSC method so that the OS selects ACPI PCI
> >> Hot-plug
> >>      instead of PCIe Native.
> >>      [1] https://gitlab.com/qemu-project/qemu/-/issues/641
> >>      [2] https://bugzilla.redhat.com/show_bug.cgi?id=3D2006409
> >>      Signed-off-by: Julia Suvorova <jusual@redhat.com>
> >>      Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> >>      Message-Id: <20211112110857.3116853-5-imammedo@redhat.com>
> >>      Reviewed-by: Ani Sinha <ani@anisinha.ca>
> >>      Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> >>      Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >>
> >>
> >> The patch description says it all. Instead of masking out the HPC bit =
in
> >> pcie slots, we keep them turned on. Instead, we do not advertize nativ=
e
> >> hotplug capability for PCIE using _OSC control method. See section
> >> 6.2.11 in ACPI spec 6.2. At the same time, we turn on ACPI hotplug for
> >> these slots so now the guest OS can select ACPI hotplug instead.
> >>
> >> The second change is introduction of a property with which we keep the
> >> existing behavior for pc-q35-6.1 machines. This means HPC bit is maske=
d
> >> and ACPI hotplug is enabled by default for pcie root ports.
> >> The QEMU commit is:
> >>
> >> (2) commit c318bef76206c2ecb6016e8e68c4ac6ff9a4c8cb
> >> Author: Julia Suvorova <jusual@redhat.com>
> >> Date:   Fri Nov 12 06:08:54 2021 -0500
> >>
> >>      hw/acpi/ich9: Add compat prop to keep HPC bit set for 6.1 machine
> >> type
> >>      To solve issues [1-2] the Hot Plug Capable bit in PCIe Slots will
> be
> >>      turned on, while the switch to ACPI Hot-plug will be done in the
> >>      DSDT table.
> >>      Introducing 'x-keep-native-hpc' property disables the HPC bit onl=
y
> >>      in 6.1 and as a result keeps the forced 'reserve-io' on
> >>      pcie-root-ports in 6.1 too.
> >>      [1] https://gitlab.com/qemu-project/qemu/-/issues/641
> >>      [2] https://bugzilla.redhat.com/show_bug.cgi?id=3D2006409
> >>      Signed-off-by: Julia Suvorova <jusual@redhat.com>
> >>      Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> >>      Message-Id: <20211112110857.3116853-3-imammedo@redhat.com>
> >>      Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> >>      Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >>
> >> Lastly, as a related side note, because from QEMU 6.2 onwards, we do n=
ot
> >> mask out HPC bit in PCIE, the work done by this patch is no longer
> >> needed:
> >>
> >> (3) commit e2a6290aab578b2170c1f5909fa556385dc0d820
> >> Author: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> >> Date:   Mon Aug 2 12:00:57 2021 +0300
> >>
> >>      hw/pcie-root-port: Fix hotplug for PCI devices requiring IO
> >>      Q35 has now ACPI hotplug enabled by default for PCI(e) devices.
> >>      As opposed to native PCIe hotplug, guests like Fedora 34
> >>      will not assign IO range to pcie-root-ports not supporting
> >>      native hotplug, resulting into a regression.
> >>      Reproduce by:
> >>          qemu-bin -M q35 -device pcie-root-port,id=3Dp1 -monitor stdio
> >>          device_add e1000,bus=3Dp1
> >>      In the Guest OS the respective pcie-root-port will have the IO
> range
> >>      disabled.
> >>      Fix it by setting the "reserve-io" hint capability of the
> >>      pcie-root-ports so the firmware will allocate the IO range instea=
d.
> >>      Acked-by: Igor Mammedov <imammedo@redhat.com>
> >>      Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
> >>      Message-Id: <20210802090057.1709775-1-marcel@redhat.com>
> >>      Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> >>      Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >>
> >> This is what commit (2) alludes to. In pc-q35-6.1 machines we do need
> >> patch (3) since we mask out HPC bit from pcie ports.
> >>
> >>
> >> I know this is convoluted mess. In fairness I am trying all I can in m=
y
> >> spare time to help from the QEMU side. I am determined to see this
> >> patchset through into libvirt.
> >>
> >> Thanks
> >>
> >>
> >> Ani Sinha (4):
> >>    qemu: capablities: detect acpi-pci-hotplug-with-bridge-support
> >>    conf: introduce support for acpi-bridge-hotplug feature
> >>    qemu: command: add support for acpi-bridge-hotplug feature
> >>    NEWS: document new acpi pci hotplug config option
> >>
> >>   NEWS.rst                                      |  8 ++
> >>   docs/formatdomain.rst                         | 32 +++++++
> >>   docs/schemas/domaincommon.rng                 | 15 ++++
> >>   src/conf/domain_conf.c                        | 89 +++++++++++++++++=
+-
> >>   src/conf/domain_conf.h                        |  9 ++
> >>   src/qemu/qemu_capabilities.c                  |  4 +
> >>   src/qemu/qemu_capabilities.h                  |  3 +
> >>   src/qemu/qemu_command.c                       | 19 ++++
> >>   src/qemu/qemu_validate.c                      | 42 +++++++++
> >>   .../caps_6.1.0.x86_64.xml                     |  1 +
> >>   .../caps_6.2.0.x86_64.xml                     |  1 +
> >>   .../caps_7.0.0.x86_64.xml                     |  1 +
> >>   ...-hotplug-bridge-disable.aarch64-latest.err |  1 +
> >>   .../aarch64-acpi-hotplug-bridge-disable.xml   | 13 +++
> >>   ...-hotplug-bridge-disable.x86_64-latest.args | 35 ++++++++
> >>   .../pc-i440fx-acpi-hotplug-bridge-disable.xml | 36 ++++++++
> >>   .../pc-i440fx-acpi-hotplug-bridge-enable.xml  | 36 ++++++++
> >>   ...pi-hotplug-bridge-disable.x86_64-6.0.0.err |  1 +
> >>   ...-hotplug-bridge-disable.x86_64-latest.args | 38 ++++++++
> >>   .../q35-acpi-hotplug-bridge-disable.xml       | 53 +++++++++++
> >>   .../q35-acpi-hotplug-bridge-enable.xml        | 53 +++++++++++
> >>   tests/qemuxml2argvtest.c                      |  7 ++
> >>   ...i-hotplug-bridge-disable.x86_64-latest.xml |  1 +
> >>   ...pi-hotplug-bridge-enable.x86_64-latest.xml |  1 +
> >>   ...i-hotplug-bridge-disable.x86_64-latest.xml |  1 +
> >>   ...pi-hotplug-bridge-enable.x86_64-latest.xml |  1 +
> >>   tests/qemuxml2xmltest.c                       |  4 +
> >>   27 files changed, 504 insertions(+), 1 deletion(-)
> >>   create mode 100644
> >>
> tests/qemuxml2argvdata/aarch64-acpi-hotplug-bridge-disable.aarch64-latest=
.err
>
> >>
> >>   create mode 100644
> >> tests/qemuxml2argvdata/aarch64-acpi-hotplug-bridge-disable.xml
> >>   create mode 100644
> >>
> tests/qemuxml2argvdata/pc-i440fx-acpi-hotplug-bridge-disable.x86_64-lates=
t.args
>
> >>
> >>   create mode 100644
> >> tests/qemuxml2argvdata/pc-i440fx-acpi-hotplug-bridge-disable.xml
> >>   create mode 100644
> >> tests/qemuxml2argvdata/pc-i440fx-acpi-hotplug-bridge-enable.xml
> >>   create mode 100644
> >> tests/qemuxml2argvdata/q35-acpi-hotplug-bridge-disable.x86_64-6.0.0.er=
r
> >>   create mode 100644
> >>
> tests/qemuxml2argvdata/q35-acpi-hotplug-bridge-disable.x86_64-latest.args
> >>   create mode 100644
> >> tests/qemuxml2argvdata/q35-acpi-hotplug-bridge-disable.xml
> >>   create mode 100644
> >> tests/qemuxml2argvdata/q35-acpi-hotplug-bridge-enable.xml
> >>   create mode 120000
> >>
> tests/qemuxml2xmloutdata/pc-i440fx-acpi-hotplug-bridge-disable.x86_64-lat=
est.xml
>
> >>
> >>   create mode 120000
> >>
> tests/qemuxml2xmloutdata/pc-i440fx-acpi-hotplug-bridge-enable.x86_64-late=
st.xml
>
> >>
> >>   create mode 120000
> >>
> tests/qemuxml2xmloutdata/q35-acpi-hotplug-bridge-disable.x86_64-latest.xm=
l
> >>
> >>   create mode 120000
> >>
> tests/qemuxml2xmloutdata/q35-acpi-hotplug-bridge-enable.x86_64-latest.xml
> >>
> >
>
>

--0000000000003f927805d9b77476
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br></div><div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Tue, Mar 8, 2022 at 21:21 Laine Stump &lt;<a =
href=3D"mailto:laine@redhat.com">laine@redhat.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rg=
b(204,204,204)">Aha! the domain of <a href=3D"mailto:qemu-devel@nongnu.org"=
 target=3D"_blank">qemu-devel@nongnu.org</a> was incorrect in the original =
<br>
send (it was &quot;<a href=3D"http://nognu.org" rel=3D"noreferrer" target=
=3D"_blank">nognu.org</a>&quot;), so none of this thread was making it to t=
hat <br>
list. I&#39;ve corrected it in this message, but interested parties from <b=
r>
qemu-devel will need to look on the libvir-list archives for the actual <br=
>
patch mails:<br>
<br>
<a href=3D"https://listman.redhat.com/archives/libvir-list/2022-March/22908=
9.html" rel=3D"noreferrer" target=3D"_blank">https://listman.redhat.com/arc=
hives/libvir-list/2022-March/229089.html</a><br>
<br>
Anyone else who responds to any of the mail on this thread should fix <br>
the qemu-devel address accordingly.</blockquote><div dir=3D"auto"><br></div=
><div dir=3D"auto">This patch set has been a true test of my diligence and =
perseverance =F0=9F=99=82</div><div dir=3D"auto"><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;b=
order-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"=
 dir=3D"auto"><br>
<br>
On 3/8/22 10:33 AM, Laine Stump wrote:<br>
&gt; On 3/8/22 1:39 AM, Ani Sinha wrote:<br>
&gt;&gt; Changelog:<br>
&gt;&gt; v2 - rebased the patch series to latest master.<br>
&gt;&gt;<br>
&gt;&gt; I am re-introducing the patchset for &lt;acpi-hotplug-bridge&gt; w=
hich got<br>
&gt;&gt; reverted here few months back:<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://www.spinics.net/linux/fedora/libvir/msg224089.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://www.spinics.net/linux/fed=
ora/libvir/msg224089.html</a><br>
&gt;&gt;<br>
&gt;&gt; The reason for the reversal was that there seemed to be some<br>
&gt;&gt; instability/issues around the use of the qemu commandline which th=
is<br>
&gt;&gt; patchset tries to support. In particular, some guest operating sys=
tems<br>
&gt;&gt; did not like the way QEMU was trying to disable native hotplug on =
pcie<br>
&gt;&gt; root ports.<br>
&gt; <br>
&gt; My memory isn&#39;t completely clear, but I think there was also the i=
ssue <br>
&gt; that the option claims to enable ACPI hotplug when set to on, but <br>
&gt; instead what it actually does (in the Q35 case at least) is to enable =
<br>
&gt; native PCI hotplug when set to off (without actually disabling ACPI <b=
r>
&gt; hotplug) and disable native PCI hotplug when set to on, or something <=
br>
&gt; like that. This ends up leaving it up to the guest OS to decide which =
<br>
&gt; type of hotplug to use, meaning its decision could override what&#39;s=
 in <br>
&gt; the libvirt config, thus confusing everyone. Again, I probably have th=
e <br>
&gt; details mixed up, but it was something like this.<br>
&gt; <br>
&gt; I asked mst about this this morning, and he suggested something that <=
br>
&gt; you&#39;ve already done - Cc&#39;ing the series to qemu-devel and the =
relevant <br>
&gt; maintainers so we can have a discussion with all involved parties abou=
t <br>
&gt; their opinions on whether we really should expose this existing option=
 <br>
&gt; in libvirt, or if we should instead have two new options that are more=
 <br>
&gt; orthogonal about enabling/disabling the two types of hotplug, so that =
<br>
&gt; libvirt config can more accurately represent what is being presented t=
o <br>
&gt; the guest rather than a &quot;best guess&quot; of what we think the gu=
est is going <br>
&gt; to do with what is presented.<br>
&gt; <br>
&gt; (Michael did also say that, with the current flurry of bug reports for=
 <br>
&gt; the QEMU rc&#39;s, this discusion may not happen until closer to relea=
se <br>
&gt; when the bug reports die down. I know this doesn&#39;t mesh with your =
desire <br>
&gt; to &quot;push now to allow for testing&quot; (which in general would b=
e a good <br>
&gt; thing if we were certain that we wanted the option like this and were =
<br>
&gt; just expecting some minor bugs that could be fixed), but my opinion is=
 <br>
&gt; that 1) it&#39;s possible for anyone interested to test the functional=
ity <br>
&gt; using &lt;qemu:commandline&gt;, and 2) we should avoid turning libvirt=
 git <br>
&gt; into a revolving door of experiments. The only practical difference <b=
r>
&gt; between using &lt;qemu:commandline&gt; and having a dedicated option i=
s that <br>
&gt; the use of &lt;qemu:commandline&gt; causes the domain to be tainted, a=
nd the <br>
&gt; XML is a bit more complicated. But since the people we&#39;re talking =
about <br>
&gt; here will already have built their own libvirt binaries, the tainted <=
br>
&gt; status of any guests is irrelevant and the extra complexity of using <=
br>
&gt; &lt;qemu:commandline&gt; is probably trivial to them :-).<br>
&gt; <br>
&gt;&gt; Subsequently, in QEMU 6.2, we have changed our mechanism<br>
&gt;&gt; using which we disable native hotplug. As I understand, we do not =
have<br>
&gt;&gt; any reported issues so far in 6.2 around this area. QEMU will ente=
r a<br>
&gt;&gt; soft feature freeze in the first week of march in prep for 7.0 rel=
ease.<br>
&gt;&gt; Libvirt is also entering a new release cycle phaze. Hence, I am<br=
>
&gt;&gt; introducing this patchset early enough in the release cycles so th=
at if<br>
&gt;&gt; we do see any issues on the qemu side during the rc0, rc1 cycles a=
nd if<br>
&gt;&gt; reversal of this patchset is again required, it can be done in tim=
e<br>
&gt;&gt; before the next libvirt release end of March.<br>
&gt;&gt;<br>
&gt;&gt; All the patches in this series had been previously reviewed. Some<=
br>
&gt;&gt; subsequent fixes were made after my initial patches were pushed. I=
 have<br>
&gt;&gt; squashed all those fixes and consolidated them into four patches. =
I have<br>
&gt;&gt; also updated the documentation to reflect the new changes from the=
 QEMU<br>
&gt;&gt; side and rebased my changes fixing the tests in the process.<br>
&gt;&gt;<br>
&gt;&gt; What changed in QEMU post version 6.1 ?<br>
&gt;&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt;<br>
&gt;&gt; We have made basically two major changes in QEMU. First is this ch=
ange:<br>
&gt;&gt;<br>
&gt;&gt; (1) commit 211afe5c69b597acf85fdd577eb497f5be1ffbd8<br>
&gt;&gt; Author: Julia Suvorova &lt;<a href=3D"mailto:jusual@redhat.com" ta=
rget=3D"_blank">jusual@redhat.com</a>&gt;<br>
&gt;&gt; Date:=C2=A0=C2=A0 Fri Nov 12 06:08:56 2021 -0500<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 hw/i386/acpi-build: Deny control on PCIe =
Native Hot-plug in _OSC<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 There are two ways to enable ACPI PCI Hot=
-plug:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 * Disable the Hot-plug Capable bit on PCIe slots.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 This was the first approach which led to =
regression [1-2], as<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 I/O space for a port is allocated only wh=
en it is hot-pluggable,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 which is determined by HPC bit.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 * Leave the HPC bit on and disable PCIe Native Hot-plug <br>
&gt;&gt; in _OSC<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 method.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 This removes the (future) ability of hot-=
plugging switches with PCIe<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 Native hotplug since ACPI PCI Hot-plug on=
ly works with cold-plugged<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 bridges. If the user wants to explicitely=
 use this feature, they can<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 disable ACPI PCI Hot-plug with:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 --global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=3Doff<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 Change the bit in _OSC method so that the=
 OS selects ACPI PCI <br>
&gt;&gt; Hot-plug<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 instead of PCIe Native.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 [1] <a href=3D"https://gitlab.com/qemu-pr=
oject/qemu/-/issues/641" rel=3D"noreferrer" target=3D"_blank">https://gitla=
b.com/qemu-project/qemu/-/issues/641</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 [2] <a href=3D"https://bugzilla.redhat.co=
m/show_bug.cgi?id=3D2006409" rel=3D"noreferrer" target=3D"_blank">https://b=
ugzilla.redhat.com/show_bug.cgi?id=3D2006409</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 Signed-off-by: Julia Suvorova &lt;<a href=
=3D"mailto:jusual@redhat.com" target=3D"_blank">jusual@redhat.com</a>&gt;<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 Signed-off-by: Igor Mammedov &lt;<a href=
=3D"mailto:imammedo@redhat.com" target=3D"_blank">imammedo@redhat.com</a>&g=
t;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 Message-Id: &lt;<a href=3D"mailto:2021111=
2110857.3116853-5-imammedo@redhat.com" target=3D"_blank">20211112110857.311=
6853-5-imammedo@redhat.com</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 Reviewed-by: Ani Sinha &lt;<a href=3D"mai=
lto:ani@anisinha.ca" target=3D"_blank">ani@anisinha.ca</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 Reviewed-by: Michael S. Tsirkin &lt;<a hr=
ef=3D"mailto:mst@redhat.com" target=3D"_blank">mst@redhat.com</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 Signed-off-by: Michael S. Tsirkin &lt;<a =
href=3D"mailto:mst@redhat.com" target=3D"_blank">mst@redhat.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; The patch description says it all. Instead of masking out the HPC =
bit in<br>
&gt;&gt; pcie slots, we keep them turned on. Instead, we do not advertize n=
ative<br>
&gt;&gt; hotplug capability for PCIE using _OSC control method. See section=
<br>
&gt;&gt; 6.2.11 in ACPI spec 6.2. At the same time, we turn on ACPI hotplug=
 for<br>
&gt;&gt; these slots so now the guest OS can select ACPI hotplug instead.<b=
r>
&gt;&gt;<br>
&gt;&gt; The second change is introduction of a property with which we keep=
 the<br>
&gt;&gt; existing behavior for pc-q35-6.1 machines. This means HPC bit is m=
asked<br>
&gt;&gt; and ACPI hotplug is enabled by default for pcie root ports.<br>
&gt;&gt; The QEMU commit is:<br>
&gt;&gt;<br>
&gt;&gt; (2) commit c318bef76206c2ecb6016e8e68c4ac6ff9a4c8cb<br>
&gt;&gt; Author: Julia Suvorova &lt;<a href=3D"mailto:jusual@redhat.com" ta=
rget=3D"_blank">jusual@redhat.com</a>&gt;<br>
&gt;&gt; Date:=C2=A0=C2=A0 Fri Nov 12 06:08:54 2021 -0500<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 hw/acpi/ich9: Add compat prop to keep HPC=
 bit set for 6.1 machine <br>
&gt;&gt; type<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 To solve issues [1-2] the Hot Plug Capabl=
e bit in PCIe Slots will be<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 turned on, while the switch to ACPI Hot-p=
lug will be done in the<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 DSDT table.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 Introducing &#39;x-keep-native-hpc&#39; p=
roperty disables the HPC bit only<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 in 6.1 and as a result keeps the forced &=
#39;reserve-io&#39; on<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 pcie-root-ports in 6.1 too.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 [1] <a href=3D"https://gitlab.com/qemu-pr=
oject/qemu/-/issues/641" rel=3D"noreferrer" target=3D"_blank">https://gitla=
b.com/qemu-project/qemu/-/issues/641</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 [2] <a href=3D"https://bugzilla.redhat.co=
m/show_bug.cgi?id=3D2006409" rel=3D"noreferrer" target=3D"_blank">https://b=
ugzilla.redhat.com/show_bug.cgi?id=3D2006409</a><br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 Signed-off-by: Julia Suvorova &lt;<a href=
=3D"mailto:jusual@redhat.com" target=3D"_blank">jusual@redhat.com</a>&gt;<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 Signed-off-by: Igor Mammedov &lt;<a href=
=3D"mailto:imammedo@redhat.com" target=3D"_blank">imammedo@redhat.com</a>&g=
t;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 Message-Id: &lt;<a href=3D"mailto:2021111=
2110857.3116853-3-imammedo@redhat.com" target=3D"_blank">20211112110857.311=
6853-3-imammedo@redhat.com</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 Reviewed-by: Michael S. Tsirkin &lt;<a hr=
ef=3D"mailto:mst@redhat.com" target=3D"_blank">mst@redhat.com</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 Signed-off-by: Michael S. Tsirkin &lt;<a =
href=3D"mailto:mst@redhat.com" target=3D"_blank">mst@redhat.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Lastly, as a related side note, because from QEMU 6.2 onwards, we =
do not<br>
&gt;&gt; mask out HPC bit in PCIE, the work done by this patch is no longer=
<br>
&gt;&gt; needed:<br>
&gt;&gt;<br>
&gt;&gt; (3) commit e2a6290aab578b2170c1f5909fa556385dc0d820<br>
&gt;&gt; Author: Marcel Apfelbaum &lt;<a href=3D"mailto:marcel.apfelbaum@gm=
ail.com" target=3D"_blank">marcel.apfelbaum@gmail.com</a>&gt;<br>
&gt;&gt; Date:=C2=A0=C2=A0 Mon Aug 2 12:00:57 2021 +0300<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 hw/pcie-root-port: Fix hotplug for PCI de=
vices requiring IO<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 Q35 has now ACPI hotplug enabled by defau=
lt for PCI(e) devices.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 As opposed to native PCIe hotplug, guests=
 like Fedora 34<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 will not assign IO range to pcie-root-por=
ts not supporting<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 native hotplug, resulting into a regressi=
on.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 Reproduce by:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qemu-bin -M q35 -=
device pcie-root-port,id=3Dp1 -monitor stdio<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_add e1000,=
bus=3Dp1<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 In the Guest OS the respective pcie-root-=
port will have the IO range<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 disabled.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 Fix it by setting the &quot;reserve-io&qu=
ot; hint capability of the<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 pcie-root-ports so the firmware will allo=
cate the IO range instead.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 Acked-by: Igor Mammedov &lt;<a href=3D"ma=
ilto:imammedo@redhat.com" target=3D"_blank">imammedo@redhat.com</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 Signed-off-by: Marcel Apfelbaum &lt;<a hr=
ef=3D"mailto:marcel@redhat.com" target=3D"_blank">marcel@redhat.com</a>&gt;=
<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 Message-Id: &lt;<a href=3D"mailto:2021080=
2090057.1709775-1-marcel@redhat.com" target=3D"_blank">20210802090057.17097=
75-1-marcel@redhat.com</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 Reviewed-by: Michael S. Tsirkin &lt;<a hr=
ef=3D"mailto:mst@redhat.com" target=3D"_blank">mst@redhat.com</a>&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0 Signed-off-by: Michael S. Tsirkin &lt;<a =
href=3D"mailto:mst@redhat.com" target=3D"_blank">mst@redhat.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; This is what commit (2) alludes to. In pc-q35-6.1 machines we do n=
eed<br>
&gt;&gt; patch (3) since we mask out HPC bit from pcie ports.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I know this is convoluted mess. In fairness I am trying all I can =
in my<br>
&gt;&gt; spare time to help from the QEMU side. I am determined to see this=
<br>
&gt;&gt; patchset through into libvirt.<br>
&gt;&gt;<br>
&gt;&gt; Thanks<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Ani Sinha (4):<br>
&gt;&gt; =C2=A0=C2=A0 qemu: capablities: detect acpi-pci-hotplug-with-bridg=
e-support<br>
&gt;&gt; =C2=A0=C2=A0 conf: introduce support for acpi-bridge-hotplug featu=
re<br>
&gt;&gt; =C2=A0=C2=A0 qemu: command: add support for acpi-bridge-hotplug fe=
ature<br>
&gt;&gt; =C2=A0=C2=A0 NEWS: document new acpi pci hotplug config option<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0 NEWS.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++<br>
&gt;&gt; =C2=A0 docs/formatdomain.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 32 +++++++<br>
&gt;&gt; =C2=A0 docs/schemas/domaincommon.rng=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 15 +++=
+<br>
&gt;&gt; =C2=A0 src/conf/domain_conf.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 89 ++++++++++++++++++-<br>
&gt;&gt; =C2=A0 src/conf/domain_conf.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 ++<br>
&gt;&gt; =C2=A0 src/qemu/qemu_capabilities.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 4 +<br>
&gt;&gt; =C2=A0 src/qemu/qemu_capabilities.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 3 +<br>
&gt;&gt; =C2=A0 src/qemu/qemu_command.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 19 ++++<br>
&gt;&gt; =C2=A0 src/qemu/qemu_validate.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 42 +++++++++<br>
&gt;&gt; =C2=A0 .../caps_6.1.0.x86_64.xml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 1 +<br>
&gt;&gt; =C2=A0 .../caps_6.2.0.x86_64.xml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 1 +<br>
&gt;&gt; =C2=A0 .../caps_7.0.0.x86_64.xml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 1 +<br>
&gt;&gt; =C2=A0 ...-hotplug-bridge-disable.aarch64-latest.err |=C2=A0 1 +<b=
r>
&gt;&gt; =C2=A0 .../aarch64-acpi-hotplug-bridge-disable.xml=C2=A0=C2=A0 | 1=
3 +++<br>
&gt;&gt; =C2=A0 ...-hotplug-bridge-disable.x86_64-latest.args | 35 ++++++++=
<br>
&gt;&gt; =C2=A0 .../pc-i440fx-acpi-hotplug-bridge-disable.xml | 36 ++++++++=
<br>
&gt;&gt; =C2=A0 .../pc-i440fx-acpi-hotplug-bridge-enable.xml=C2=A0 | 36 +++=
+++++<br>
&gt;&gt; =C2=A0 ...pi-hotplug-bridge-disable.x86_64-6.0.0.err |=C2=A0 1 +<b=
r>
&gt;&gt; =C2=A0 ...-hotplug-bridge-disable.x86_64-latest.args | 38 ++++++++=
<br>
&gt;&gt; =C2=A0 .../q35-acpi-hotplug-bridge-disable.xml=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 53 +++++++++++<br>
&gt;&gt; =C2=A0 .../q35-acpi-hotplug-bridge-enable.xml=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 53 +++++++++++<br>
&gt;&gt; =C2=A0 tests/qemuxml2argvtest.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 7 ++<br>
&gt;&gt; =C2=A0 ...i-hotplug-bridge-disable.x86_64-latest.xml |=C2=A0 1 +<b=
r>
&gt;&gt; =C2=A0 ...pi-hotplug-bridge-enable.x86_64-latest.xml |=C2=A0 1 +<b=
r>
&gt;&gt; =C2=A0 ...i-hotplug-bridge-disable.x86_64-latest.xml |=C2=A0 1 +<b=
r>
&gt;&gt; =C2=A0 ...pi-hotplug-bridge-enable.x86_64-latest.xml |=C2=A0 1 +<b=
r>
&gt;&gt; =C2=A0 tests/qemuxml2xmltest.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +<br>
&gt;&gt; =C2=A0 27 files changed, 504 insertions(+), 1 deletion(-)<br>
&gt;&gt; =C2=A0 create mode 100644 <br>
&gt;&gt; tests/qemuxml2argvdata/aarch64-acpi-hotplug-bridge-disable.aarch64=
-latest.err <br>
&gt;&gt;<br>
&gt;&gt; =C2=A0 create mode 100644 <br>
&gt;&gt; tests/qemuxml2argvdata/aarch64-acpi-hotplug-bridge-disable.xml<br>
&gt;&gt; =C2=A0 create mode 100644 <br>
&gt;&gt; tests/qemuxml2argvdata/pc-i440fx-acpi-hotplug-bridge-disable.x86_6=
4-latest.args <br>
&gt;&gt;<br>
&gt;&gt; =C2=A0 create mode 100644 <br>
&gt;&gt; tests/qemuxml2argvdata/pc-i440fx-acpi-hotplug-bridge-disable.xml<b=
r>
&gt;&gt; =C2=A0 create mode 100644 <br>
&gt;&gt; tests/qemuxml2argvdata/pc-i440fx-acpi-hotplug-bridge-enable.xml<br=
>
&gt;&gt; =C2=A0 create mode 100644 <br>
&gt;&gt; tests/qemuxml2argvdata/q35-acpi-hotplug-bridge-disable.x86_64-6.0.=
0.err<br>
&gt;&gt; =C2=A0 create mode 100644 <br>
&gt;&gt; tests/qemuxml2argvdata/q35-acpi-hotplug-bridge-disable.x86_64-late=
st.args<br>
&gt;&gt; =C2=A0 create mode 100644 <br>
&gt;&gt; tests/qemuxml2argvdata/q35-acpi-hotplug-bridge-disable.xml<br>
&gt;&gt; =C2=A0 create mode 100644 <br>
&gt;&gt; tests/qemuxml2argvdata/q35-acpi-hotplug-bridge-enable.xml<br>
&gt;&gt; =C2=A0 create mode 120000 <br>
&gt;&gt; tests/qemuxml2xmloutdata/pc-i440fx-acpi-hotplug-bridge-disable.x86=
_64-latest.xml <br>
&gt;&gt;<br>
&gt;&gt; =C2=A0 create mode 120000 <br>
&gt;&gt; tests/qemuxml2xmloutdata/pc-i440fx-acpi-hotplug-bridge-enable.x86_=
64-latest.xml <br>
&gt;&gt;<br>
&gt;&gt; =C2=A0 create mode 120000 <br>
&gt;&gt; tests/qemuxml2xmloutdata/q35-acpi-hotplug-bridge-disable.x86_64-la=
test.xml <br>
&gt;&gt;<br>
&gt;&gt; =C2=A0 create mode 120000 <br>
&gt;&gt; tests/qemuxml2xmloutdata/q35-acpi-hotplug-bridge-enable.x86_64-lat=
est.xml<br>
&gt;&gt;<br>
&gt; <br>
<br>
</blockquote></div></div>

--0000000000003f927805d9b77476--

