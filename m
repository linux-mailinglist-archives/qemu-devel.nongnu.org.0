Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5429E544520
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 09:52:13 +0200 (CEST)
Received: from localhost ([::1]:51236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzCxf-0007xZ-Uk
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 03:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1nzCsj-0006sI-Dx
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 03:47:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1nzCsg-0001xH-Dh
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 03:47:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654760820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L3ALatzKLOmj82rUbYlGpYsWuYO0T1BxMhjko9aqxD4=;
 b=LAXZwChGoAgQIf+HJW+KQWLIP/iqlsyunrHoTmyy5jsCxZaaV/qXqOS2ddBCePbWUxZCbM
 v+TXMq+MtIoW8X0Iyq1BXe9xt6Imotuk0QquxsaeWcVve78GTpnKQ4mXXkyCXzV2y/B7Xd
 /n7fMarBjASFj2p7MWnEsM1Pfx36Tog=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-hzhtblw6PNiZJrXDLN6vjA-1; Thu, 09 Jun 2022 03:45:49 -0400
X-MC-Unique: hzhtblw6PNiZJrXDLN6vjA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D1DE811E75;
 Thu,  9 Jun 2022 07:45:49 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CC90A1410DDB;
 Thu,  9 Jun 2022 07:45:47 +0000 (UTC)
Subject: Re: [RFC][PATCH] docs: note exception for PCIe IO port access
To: Kevin Locke <kevin@kevinlocke.name>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel@redhat.com>, Laine Stump <laine@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alex Williamson <alex.williamson@redhat.com>
References: <922cc3081ff9c986188f881ef4d1cf15bd3adf48.1654739990.git.kevin@kevinlocke.name>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <63e991af-0dd2-3aea-2f15-7460a6fb87db@redhat.com>
Date: Thu, 9 Jun 2022 09:45:46 +0200
MIME-Version: 1.0
In-Reply-To: <922cc3081ff9c986188f881ef4d1cf15bd3adf48.1654739990.git.kevin@kevinlocke.name>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

+Alex

On 06/09/22 04:00, Kevin Locke wrote:
> ioport access is required for VESA BIOS Extensions (VBE).  Since ioport
> access is not forwarded over PCI(e) bridges, graphics adapters must be
> attached directly to the Root Complex in order for the BIOS to provide
> VBE modes.  I'm very grateful to Gerd Hoffmann for explaining this on
> the SeaBIOS mailing list.[1]
>
> Update the PCI Express Guidelines to document this as an exception to
> the recommendation to "Place only legacy PCI devices on the Root
> Complex."
>
> [1]: https://mail.coreboot.org/hyperkitty/list/seabios@seabios.org/thread/XG2RN3HKVRDEDTLA2PRELLIENIIH7II7/#XVP3I2KQVZHSTDA4SNVKOITWGRGSDU3F
>
> Signed-off-by: Kevin Locke <kevin@kevinlocke.name>
> ---

I think we're discussing three separate things here:

(a) plugging a legacy PCI device into an Express slot
(b) the inverse: plugging an Express device into a legacy PCI slot
(c) plugging an Express device into a slot on the PCIe root complex

Telling these apart is not easy because:

> QEMU does not have a clear socket-device matching mechanism
> and allows any PCI/PCI Express device to be plugged into any
> PCI/PCI Express slot.

Now,

(a) your original (non-functional) use case:

qemu-system-x86_64 \
    -no-user-config \
    -nodefaults \
    -machine q35,accel=kvm \
    -m 1G \
    -cdrom "$iso" \
    -device pcie-root-port,id=pci.1,bus=pcie.0 \
    -device VGA,bus=pci.1

violates the following part of "pcie.txt":

> Plugging a PCI device into a PCI Express slot might not always work and
> is weird anyway since it cannot be done for "bare metal".

AIUI, what Gerd explains in that SeaBIOS thread is why and how exactly
such an attempt breaks. The statement that it would break is already
spelled out in "pcie.txt".

So I think that, given strictly your original report on the SeaBIOS
list, no updates to "pcie.txt" are necessary.

Note that your original (functional) use case:

qemu-system-x86_64 \
    -no-user-config \
    -nodefaults \
    -machine q35,accel=kvm \
    -m 1G \
    -cdrom "$iso" \
    -device VGA

does not conflict with

> Place only the following kinds of devices directly on the Root Complex:
>     (1) PCI Devices (e.g. network card, graphics card, IDE controller),
>         not controllers. Place only legacy PCI devices on
>         the Root Complex. These will be considered Integrated Endpoints.
>         Note: Integrated Endpoints are not hot-pluggable.
>
>         Although the PCI Express spec does not forbid PCI Express devices as
>         Integrated Endpoints, existing hardware mostly integrates legacy PCI
>         devices with the Root Complex. Guest OSes are suspected to behave
>         strangely when PCI Express devices are integrated
>         with the Root Complex.

because "-device VGA" is a legacy PCI device, not a PCI Express device.
So the second quoted paragraph does not apply to it at all, and the
first paragraph is in sync with your functional use case.

Then,

On 06/09/22 04:00, Kevin Locke wrote:
> This suggested documentation change is the result of my struggles to
> understand why I was seeing a very limited set of display modes in one
> of my virtual machines, as explained in the seabios ML post linked above
> and an earlier post to qemu-discuss.[2]  I hope it may help avoid some
> of these hassles for future users.

Per your original report, the misconfig on your side was not that you
placed a PCIe display controller on the root complex, but that you
placed a legacy PCI device into a PCIe root port (which is physically
impossible on a physical machine).

>
> I'm far from being an expert in PCI(e), BIOS/VBE, or virtualization in
> general, and would appreciate any suggestions on these docs changes.
> I'm also curious about whether graphics devices are the only exception

While VGA is quirky ("there was only ever intended to be one device" --
see
<http://vfio.blogspot.com/2014/08/whats-deal-with-vga-arbitration.html>),
I maintain that it's sufficiently covered already (although not
specifically) by "pcie.txt"; see above. "-device VGA" is a legacy PCI
device, you can't plug it in an Express slot (root complex or port
alike).

In the blog post at
<https://www.kraxel.org/blog/2019/09/display-devices-in-qemu/>, Gerd
explains that (effectively) only "bochs-display" and "virtio-gpu-pci"
(from QEMU's emulated devices) may be placed in PCI Express slots (root
complex or separate port, alike).

*In theory*, scenario (b) applies to "bochs-display" and
"virtio-gpu-pci" when you plug them into a legacy PCI slot:

> Plugging a PCI Express device into a PCI slot will hide the Extended
> Configuration Space thus is also not recommended.

But this is fine, as these device models don't have extended
capabilities in practice. IOW, I'd imagine them (if they were physical
cards) as PCI Express devices without any use for their extended config
spaces. You could plug them into legacy PCI slots, but would see no
difference in behavior (apart from speed perhaps).

But, we might want to update "pcie.txt" for scenario (c):

On 06/09/22 04:00, Kevin Locke wrote:
> and whether "Guest OSes are suspected to behave strangely when PCI
> Express devices are integrated with the Root Complex" is still the case.

I vaguely recall that Alex didn't fully agree with this statement when
the document was being reviewed.

> David Gibson had previously noted that graphics cards appear on the Root
> Complex on real hardware.[3]

You forgot to provide the link for [3].

Anyway, the full paragraph in the document goes like

>         Although the PCI Express spec does not forbid PCI Express devices as
>         Integrated Endpoints, existing hardware mostly integrates legacy PCI
>         devices with the Root Complex. Guest OSes are suspected to behave
>         strangely when PCI Express devices are integrated
>         with the Root Complex.

So the recommendation is based on motherboards seen in the wild, and the
potential consequent assumptions in OSes. Whether that still holds up
with today's motherboards (and OSes), I have no clue about.

>
> I notice that the HD Audio Controller on my T430 is an "Express Root
> Complex Integrated Endpoint".  Is this a non-graphics example, or am I
> misinterpreting the lspci output?
>
> 00:1b.0 Audio device: Intel Corporation 7 Series/C216 Chipset Family High Definition Audio Controller (rev 04)
> 	Subsystem: Lenovo 7 Series/C216 Chipset Family High Definition Audio Controller
> 	Flags: bus master, fast devsel, latency 0, IRQ 29, IOMMU group 6
> 	Memory at f1530000 (64-bit, non-prefetchable) [size=16K]
> 	Capabilities: [50] Power Management version 2
> 	Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit+
> 	Capabilities: [70] Express Root Complex Integrated Endpoint, MSI 00
> 	Capabilities: [100] Virtual Channel
> 	Capabilities: [130] Root Complex Link
> 	Kernel driver in use: snd_hda_intel
> 	Kernel modules: snd_hda_intel
>
> Thanks,
> Kevin
>
>  docs/pcie.txt | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/docs/pcie.txt b/docs/pcie.txt
> index 89e3502075..a23d93849b 100644
> --- a/docs/pcie.txt
> +++ b/docs/pcie.txt
> @@ -48,6 +48,11 @@ Place only the following kinds of devices directly on the Root Complex:
>          strangely when PCI Express devices are integrated
>          with the Root Complex.
>
> +        An exception to this rule is PCI Express devices which will be
> +        accessed using IO ports.

I find this too general; a PCI Express device is supposed to work
without IO resources. Graphics cards with legacy VGA compatibility are
the exception AIUI (see again Alex's blog about VGA arbitration), so we
should spell that out.

Furthermore, from QEMU's emulated graphics cards, all device models that
provide VGA compatibility are legacy PCI (not PCI Express) devices (see
again Gerd's post: VGA, virtio-vga, qxl-vga, cirrus-vga, ati-vga), so
I'd even restrict this docs update to assigned GPUs.

>                                   For example, guests using BIOS firmware
> +        require IO port access for graphics devices to provide VESA BIOS
> +        Extensions (VBE).
> +
>      (2) PCI Express Root Ports (ioh3420), for starting exclusively PCI Express
>          hierarchies.
>
>

How about inserting a new paragraph here, instead:

    (2) Assigned PCI Express GPUs that offer legacy VGA compatibility,
        and that such compatibility is expected of (due to booting with
        SeaBIOS, or due to UEFI driver bugs or native OS driver bugs).

Thanks
Laszlo


