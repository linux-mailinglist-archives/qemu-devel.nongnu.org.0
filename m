Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAD35FAFC8
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 11:57:46 +0200 (CEST)
Received: from localhost ([::1]:58660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiC1B-000375-SX
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 05:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hchkuo@avery-design.com.tw>)
 id 1oiBpm-00055Y-0r
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 05:45:58 -0400
Received: from mail.avery-design.com.tw ([60.251.56.247]:42192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hchkuo@avery-design.com.tw>)
 id 1oiBpW-00037R-2F
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 05:45:57 -0400
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.avery-design.com.tw (Postfix) with ESMTPSA id 2E2421003C567
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 17:58:18 +0800 (CST)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-132af5e5543so15224617fac.8
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 02:45:34 -0700 (PDT)
X-Gm-Message-State: ACrzQf1BkPpbjsScJ4MOwz9ruiwZTU8cqqojARzxSQ+L3FamV7jUin9F
 0+UQFflVWvnSsGHbHxzj34HXY2S2bKWHorapamg=
X-Google-Smtp-Source: AMsMyM4tbL4V/VAxeud9ngxhADuwJldpHK07yjDUcalultd6sgpSJmuZDvIZMEYUF5hXQftMvI+CDGKj2dcrh/jx+mM=
X-Received: by 2002:a05:6870:960b:b0:132:e9d6:ea39 with SMTP id
 d11-20020a056870960b00b00132e9d6ea39mr12961632oaq.257.1665481532522; Tue, 11
 Oct 2022 02:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <20221007152156.24883-1-Jonathan.Cameron@huawei.com>
 <20221010112940.00003fc9@huawei.com>
In-Reply-To: <20221010112940.00003fc9@huawei.com>
From: Huai-Cheng <hchkuo@avery-design.com.tw>
Date: Tue, 11 Oct 2022 17:45:20 +0800
X-Gmail-Original-Message-ID: <CA+2kVq8vpOxNE3fHmO_A=6kmU4q=SM64NH-tCEBz2jFOojOkyA@mail.gmail.com>
Message-ID: <CA+2kVq8vpOxNE3fHmO_A=6kmU4q=SM64NH-tCEBz2jFOojOkyA@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] QEMU PCIe DOE for PCIe 4.0/5.0 and CXL 2.0
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, Michael Tsirkin <mst@redhat.com>, 
 Ben Widawsky <bwidawsk@kernel.org>, linux-cxl@vger.kernel.org, 
 Chris Browy <cbrowy@avery-design.com>, ira.weiny@intel.com
Content-Type: multipart/alternative; boundary="00000000000020468905eabf23a2"
Received-SPF: pass client-ip=60.251.56.247;
 envelope-from=hchkuo@avery-design.com.tw; helo=mail.avery-design.com.tw
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--00000000000020468905eabf23a2
Content-Type: text/plain; charset="UTF-8"

Hi Jonathan,

We've reviewed the patches related to DOE and everything looks good. And we
are glad to maintain the code as the maintainers.

Thanks for applying the changes.

Best Regards,
Huai-Cheng Kuo

On Mon, Oct 10, 2022 at 6:30 PM Jonathan Cameron <
Jonathan.Cameron@huawei.com> wrote:

> On Fri, 7 Oct 2022 16:21:51 +0100
> Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
>
> > Whilst I have carried on Huai-Cheng Kuo's series version numbering and
> > naming, there have been very substantial changes since v6 so I would
> > suggest fresh review makes sense for anyone who has looked at this
> before.
> > In particularly if the Avery design folks could check I haven't broken
> > anything that would be great.
>
> I forgot to run checkpatch on these and there is some white space that
> will need cleaning up and one instance of missing brackets.
> As that doesn't greatly affect review, I'll wait for a few days to see
> if there is other feedback to incorporate in v8.
>
> Sorry for the resulting noise!
>
> These are now available at
> https://gitlab.com/jic23/qemu/-/commits/cxl-2022-10-09
> along with a bunch of other CXL features:
> * Compliance DOE protocol
> * SPDM / CMA over DOE supprot
> * ARM64 support in general.
> * Various small emulation additions.
> * CPMU support
>
> I'll add a few more features to similarly named branches over the next
> week or so including initial support for standalone switch CCI mailboxes.
>
> Jonathan
>
> >
> > For reference v6: QEMU PCIe DOE for PCIe 4.0/5.0 and CXL 2.0
> >
> https://lore.kernel.org/qemu-devel/1623330943-18290-1-git-send-email-cbrowy@avery-design.com/
> >
> > Summary of changes:
> > 1) Linux headers definitions for DOE are now upstream so drop that patch.
> > 2) Add CDAT for switch upstream port.
> > 3) Generate 'plausible' default CDAT tables when a file is not provided.
> > 4) General refactoring to calculate the correct table sizes and allocate
> >    based on that rather than copying from a local static array.
> > 5) Changes from earlier reviews such as matching QEMU type naming style.
> > 6) Moved compliance and SPDM usecases to future patch sets.
> >
> > Sign-offs on these are complex because the patches were originally
> developed
> > by Huai-Cheng Kuo, but posted by Chris Browy and then picked up by
> Jonathan
> > Cameron who made substantial changes.
> >
> > Huai-Cheng Kuo / Chris Browy, please confirm you are still happy to
> maintain this
> > code as per the original MAINTAINERS entry.
> >
> > What's here?
> >
> > This series brings generic PCI Express Data Object Exchange support (DOE)
> > DOE is defined in the PCIe Base Spec r6.0. It consists of a mailbox in
> PCI
> > config space via a PCIe Extended Capability Structure.
> > The PCIe spec defines several protocols (including one to discover what
> > protocols a given DOE instance supports) and other specification such as
> > CXL define additional protocols using their own vendor IDs.
> >
> > In this series we make use of the DOE to support the CXL spec defined
> > Table Access Protocol, specifically to provide access to CDAT - a
> > table specified in a specification that is hosted by the UEFI forum
> > and is used to provide runtime discoverability of the sort of information
> > that would otherwise be available in firmware tables (memory types,
> > latency and bandwidth information etc).
> >
> > The Linux kernel gained support for DOE / CDAT on CXL type 3 EPs in 6.0.
> > The version merged did not support interrupts (earlier versions did
> > so that support in the emulation was tested a while back).
> >
> > This series provides CDAT emulation for CXL switch upstream ports
> > and CXL type 3 memory devices. Note that to exercise the switch support
> > additional Linux kernel patches are needed.
> >
> https://lore.kernel.org/linux-cxl/20220503153449.4088-1-Jonathan.Cameron@huawei.com/
> > (I'll post a new version of that support shortly)
> >
> > Additional protocols will be supported by follow on patch sets:
> > * CXL compliance protocol.
> > * CMA / SPDM device attestation.
> > (Old version at https://gitlab.com/jic23/qemu/-/commits/cxl-next - will
> refresh
> > that tree next week)
> >
> > Huai-Cheng Kuo (3):
> >   hw/pci: PCIe Data Object Exchange emulation
> >   hw/cxl/cdat: CXL CDAT Data Object Exchange implementation
> >   hw/mem/cxl-type3: Add CXL CDAT Data Object Exchange
> >
> > Jonathan Cameron (2):
> >   hw/mem/cxl-type3: Add MSIX support
> >   hw/pci-bridge/cxl-upstream: Add a CDAT table access DOE
> >
> >  MAINTAINERS                    |   7 +
> >  hw/cxl/cxl-cdat.c              | 222 ++++++++++++++++++++
> >  hw/cxl/meson.build             |   1 +
> >  hw/mem/cxl_type3.c             | 236 +++++++++++++++++++++
> >  hw/pci-bridge/cxl_upstream.c   | 182 +++++++++++++++-
> >  hw/pci/meson.build             |   1 +
> >  hw/pci/pcie_doe.c              | 367 +++++++++++++++++++++++++++++++++
> >  include/hw/cxl/cxl_cdat.h      | 166 +++++++++++++++
> >  include/hw/cxl/cxl_component.h |   7 +
> >  include/hw/cxl/cxl_device.h    |   3 +
> >  include/hw/cxl/cxl_pci.h       |   1 +
> >  include/hw/pci/pci_ids.h       |   3 +
> >  include/hw/pci/pcie.h          |   1 +
> >  include/hw/pci/pcie_doe.h      | 123 +++++++++++
> >  include/hw/pci/pcie_regs.h     |   4 +
> >  15 files changed, 1323 insertions(+), 1 deletion(-)
> >  create mode 100644 hw/cxl/cxl-cdat.c
> >  create mode 100644 hw/pci/pcie_doe.c
> >  create mode 100644 include/hw/cxl/cxl_cdat.h
> >  create mode 100644 include/hw/pci/pcie_doe.h
> >
>
>

--00000000000020468905eabf23a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Jonathan,<br><br>We&#39;ve reviewed the patches re=
lated to DOE and everything looks good. And we are glad to maintain the cod=
e as the maintainers.=C2=A0<br><br>Thanks for applying the changes.<br><br =
class=3D"gmail-Apple-interchange-newline">Best Regards,<br>Huai-Cheng Kuo<b=
r></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Mon, Oct 10, 2022 at 6:30 PM Jonathan Cameron &lt;<a href=3D"mailto:Jo=
nathan.Cameron@huawei.com">Jonathan.Cameron@huawei.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 7 Oct 2022 16=
:21:51 +0100<br>
Jonathan Cameron &lt;<a href=3D"mailto:Jonathan.Cameron@huawei.com" target=
=3D"_blank">Jonathan.Cameron@huawei.com</a>&gt; wrote:<br>
<br>
&gt; Whilst I have carried on Huai-Cheng Kuo&#39;s series version numbering=
 and<br>
&gt; naming, there have been very substantial changes since v6 so I would<b=
r>
&gt; suggest fresh review makes sense for anyone who has looked at this bef=
ore.<br>
&gt; In particularly if the Avery design folks could check I haven&#39;t br=
oken<br>
&gt; anything that would be great.<br>
<br>
I forgot to run checkpatch on these and there is some white space that<br>
will need cleaning up and one instance of missing brackets.<br>
As that doesn&#39;t greatly affect review, I&#39;ll wait for a few days to =
see<br>
if there is other feedback to incorporate in v8.<br>
<br>
Sorry for the resulting noise!<br>
<br>
These are now available at<br>
<a href=3D"https://gitlab.com/jic23/qemu/-/commits/cxl-2022-10-09" rel=3D"n=
oreferrer" target=3D"_blank">https://gitlab.com/jic23/qemu/-/commits/cxl-20=
22-10-09</a><br>
along with a bunch of other CXL features:<br>
* Compliance DOE protocol<br>
* SPDM / CMA over DOE supprot<br>
* ARM64 support in general.<br>
* Various small emulation additions.<br>
* CPMU support<br>
<br>
I&#39;ll add a few more features to similarly named branches over the next<=
br>
week or so including initial support for standalone switch CCI mailboxes.<b=
r>
<br>
Jonathan<br>
<br>
&gt; <br>
&gt; For reference v6: QEMU PCIe DOE for PCIe 4.0/5.0 and CXL 2.0<br>
&gt; <a href=3D"https://lore.kernel.org/qemu-devel/1623330943-18290-1-git-s=
end-email-cbrowy@avery-design.com/" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lore.kernel.org/qemu-devel/1623330943-18290-1-git-send-email-cbrowy@a=
very-design.com/</a><br>
&gt; <br>
&gt; Summary of changes:<br>
&gt; 1) Linux headers definitions for DOE are now upstream so drop that pat=
ch.<br>
&gt; 2) Add CDAT for switch upstream port.<br>
&gt; 3) Generate &#39;plausible&#39; default CDAT tables when a file is not=
 provided.<br>
&gt; 4) General refactoring to calculate the correct table sizes and alloca=
te<br>
&gt;=C2=A0 =C2=A0 based on that rather than copying from a local static arr=
ay.<br>
&gt; 5) Changes from earlier reviews such as matching QEMU type naming styl=
e.<br>
&gt; 6) Moved compliance and SPDM usecases to future patch sets.<br>
&gt; <br>
&gt; Sign-offs on these are complex because the patches were originally dev=
eloped<br>
&gt; by Huai-Cheng Kuo, but posted by Chris Browy and then picked up by Jon=
athan<br>
&gt; Cameron who made substantial changes.<br>
&gt; <br>
&gt; Huai-Cheng Kuo / Chris Browy, please confirm you are still happy to ma=
intain this<br>
&gt; code as per the original MAINTAINERS entry.<br>
&gt; <br>
&gt; What&#39;s here?<br>
&gt; <br>
&gt; This series brings generic PCI Express Data Object Exchange support (D=
OE)<br>
&gt; DOE is defined in the PCIe Base Spec r6.0. It consists of a mailbox in=
 PCI<br>
&gt; config space via a PCIe Extended Capability Structure.<br>
&gt; The PCIe spec defines several protocols (including one to discover wha=
t<br>
&gt; protocols a given DOE instance supports) and other specification such =
as<br>
&gt; CXL define additional protocols using their own vendor IDs.<br>
&gt; <br>
&gt; In this series we make use of the DOE to support the CXL spec defined<=
br>
&gt; Table Access Protocol, specifically to provide access to CDAT - a<br>
&gt; table specified in a specification that is hosted by the UEFI forum<br=
>
&gt; and is used to provide runtime discoverability of the sort of informat=
ion<br>
&gt; that would otherwise be available in firmware tables (memory types,<br=
>
&gt; latency and bandwidth information etc).<br>
&gt; <br>
&gt; The Linux kernel gained support for DOE / CDAT on CXL type 3 EPs in 6.=
0.<br>
&gt; The version merged did not support interrupts (earlier versions did<br=
>
&gt; so that support in the emulation was tested a while back).<br>
&gt; <br>
&gt; This series provides CDAT emulation for CXL switch upstream ports<br>
&gt; and CXL type 3 memory devices. Note that to exercise the switch suppor=
t<br>
&gt; additional Linux kernel patches are needed.<br>
&gt; <a href=3D"https://lore.kernel.org/linux-cxl/20220503153449.4088-1-Jon=
athan.Cameron@huawei.com/" rel=3D"noreferrer" target=3D"_blank">https://lor=
e.kernel.org/linux-cxl/20220503153449.4088-1-Jonathan.Cameron@huawei.com/</=
a><br>
&gt; (I&#39;ll post a new version of that support shortly)<br>
&gt; <br>
&gt; Additional protocols will be supported by follow on patch sets:<br>
&gt; * CXL compliance protocol.<br>
&gt; * CMA / SPDM device attestation.<br>
&gt; (Old version at <a href=3D"https://gitlab.com/jic23/qemu/-/commits/cxl=
-next" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/jic23/qemu/-=
/commits/cxl-next</a> - will refresh<br>
&gt; that tree next week)<br>
&gt; <br>
&gt; Huai-Cheng Kuo (3):<br>
&gt;=C2=A0 =C2=A0hw/pci: PCIe Data Object Exchange emulation<br>
&gt;=C2=A0 =C2=A0hw/cxl/cdat: CXL CDAT Data Object Exchange implementation<=
br>
&gt;=C2=A0 =C2=A0hw/mem/cxl-type3: Add CXL CDAT Data Object Exchange<br>
&gt; <br>
&gt; Jonathan Cameron (2):<br>
&gt;=C2=A0 =C2=A0hw/mem/cxl-type3: Add MSIX support<br>
&gt;=C2=A0 =C2=A0hw/pci-bridge/cxl-upstream: Add a CDAT table access DOE<br=
>
&gt; <br>
&gt;=C2=A0 MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +<br>
&gt;=C2=A0 hw/cxl/cxl-cdat.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 222 ++++++++++++++++++++<br>
&gt;=C2=A0 hw/cxl/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 hw/mem/cxl_type3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 236 +++++++++++++++++++++<br>
&gt;=C2=A0 hw/pci-bridge/cxl_upstream.c=C2=A0 =C2=A0| 182 +++++++++++++++-<=
br>
&gt;=C2=A0 hw/pci/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 hw/pci/pcie_doe.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 367 +++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 include/hw/cxl/cxl_cdat.h=C2=A0 =C2=A0 =C2=A0 | 166 ++++++++++++=
+++<br>
&gt;=C2=A0 include/hw/cxl/cxl_component.h |=C2=A0 =C2=A07 +<br>
&gt;=C2=A0 include/hw/cxl/cxl_device.h=C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 include/hw/cxl/cxl_pci.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
&gt;=C2=A0 include/hw/pci/pci_ids.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A03 +<br>
&gt;=C2=A0 include/hw/pci/pcie.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 +<br>
&gt;=C2=A0 include/hw/pci/pcie_doe.h=C2=A0 =C2=A0 =C2=A0 | 123 +++++++++++<=
br>
&gt;=C2=A0 include/hw/pci/pcie_regs.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<=
br>
&gt;=C2=A0 15 files changed, 1323 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 hw/cxl/cxl-cdat.c<br>
&gt;=C2=A0 create mode 100644 hw/pci/pcie_doe.c<br>
&gt;=C2=A0 create mode 100644 include/hw/cxl/cxl_cdat.h<br>
&gt;=C2=A0 create mode 100644 include/hw/pci/pcie_doe.h<br>
&gt; <br>
<br>
</blockquote></div>

--00000000000020468905eabf23a2--

