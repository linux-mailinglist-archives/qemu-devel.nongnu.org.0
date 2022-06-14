Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DAF54B866
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 20:17:17 +0200 (CEST)
Received: from localhost ([::1]:45676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1B6L-0001aZ-0g
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 14:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin@kevinlocke.name>)
 id 1o1B47-0000mG-5N
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 14:14:59 -0400
Received: from vulcan.kevinlocke.name
 ([2001:19f0:5:727:1e84:17da:7c52:5ab4]:46273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kevin@kevinlocke.name>)
 id 1o1B44-0006xd-8d
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 14:14:57 -0400
Received: from kevinolos.kevinlocke.name
 (2600-6c67-5000-3d1b-c15c-fe7b-05b5-35cd.res6.spectrum.com
 [IPv6:2600:6c67:5000:3d1b:c15c:fe7b:5b5:35cd])
 (Authenticated sender: kevin@kevinlocke.name)
 by vulcan.kevinlocke.name (Postfix) with ESMTPSA id 31BE92F29ABA;
 Tue, 14 Jun 2022 18:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kevinlocke.name;
 s=vulcan; t=1655230490;
 bh=xmXMk0LohHGecfFU/QACTpd3xa5Mz65GdL96BaJiL2Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pq3Wm6BjhfOewq6fgxlgkmkuZdeBXJXuogWmGh0t7RFx8NslGYxhyc7pEsM8kYrdX
 jAEL2m1GKf43lYDsd0NLZCxOchyDbAH7DUjMGnSo/h9cDLqzrJjdeiD/nPVgWTt/AW
 axkRkuKxoj9KYMCZ4Pvio1Mh336wlnp8Yk6gu2VM=
Received: by kevinolos.kevinlocke.name (Postfix, from userid 1000)
 id B9CE01300437; Tue, 14 Jun 2022 12:14:47 -0600 (MDT)
Date: Tue, 14 Jun 2022 12:14:47 -0600
From: Kevin Locke <kevin@kevinlocke.name>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Laine Stump <laine@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2] docs: add PCIe root bus for VGA compat guideline
Message-ID: <YqjQF83XBlnmyM3L@kevinlocke.name>
References: <922cc3081ff9c986188f881ef4d1cf15bd3adf48.1654739990.git.kevin@kevinlocke.name>
 <bde9fc450bc5143d616c7e9999c5d39ae9fd9cb8.1655054968.git.kevin@kevinlocke.name>
 <3eebc773-a5ae-6652-95f5-4359872ea4d4@redhat.com>
 <20220614085252.fyogpqyf7cfcty4x@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220614085252.fyogpqyf7cfcty4x@sirius.home.kraxel.org>
Received-SPF: pass client-ip=2001:19f0:5:727:1e84:17da:7c52:5ab4;
 envelope-from=kevin@kevinlocke.name; helo=vulcan.kevinlocke.name
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, 2022-06-14 at 10:52 +0200, Gerd Hoffmann wrote:
>> On 06/12/22 19:32, Kevin Locke wrote:
>>> PCI Express devices which use legacy VGA compatibility should be placed
>>> on the Root Complex.  This simplifies ioport access to VGA registers,
>>> which requires use of a special exception bit to work across PCI(e)
>>> bridges.  It is also necessary for ioport access to VESA BIOS Extension
>>> (VBE) registers, which is not forwarded over PCI(e) bridges, even with
>>> the special exception bit for VGA register access.[1]
>>> 
>>> Update the PCI Express Guidelines to add these to the list of devices
>>> which can be placed directly on the Root Complex.
>>> 
>>> Note that the only PCI Express display devices currently supported
>>> (bochs-display and virtio-gpu-pci) do not offer VGA compatibility.
>>> Legacy PCI devices (e.g. vga, qxl-vga, virtio-vga) are already
>>> documented as allowed on the Root Complex by the first item in the list.
>>> However, this item documents an additional consideration for placing
>>> devices which was not previously mentioned, and may be relevant for PCIe
>>> devices offering VGA compatibility in the future.
> 
> Well, the *key* problem is emulated VGA devices with VBE registers in
> io address space, because those are not forwarded over bridges.
> 
> For normal VGA registers this isn't much of a problem (in theory, not
> fully sure whenever that holds in practice, Alex?).  The linux kernel
> knows how to use the bridge control register to manage access to VGA
> registers.
> 
> So, if the document already covers vga & qxl & virtio-vga (didn't check
> that beforehand) I'm not sure we actually need an update ...

Section 2.1 Root Bus mentions attaching legacy PCI devices to the Root
Complex.  VGA/qxl-vga/virtio-vga are implicitly included (if the
reader is aware they are PCI, not PCIe), but they are not specifically
mentioned in the document.  By my reading, the document does not
recommend for or against attaching legacy PCI devices to the Root
Complex, other than noting hot-unplugging from the Root Complex is not
supported (in Section 2.3) and the general advice to prefer flat
hierarchies.

There is currently no mention of VGA or VBE in the document.

I think documenting the issue with VBE registers would be helpful.
Doing so with a recommendation for how to avoid the issue seems even
better.  Would a recommendation to attach a device which supports VBE
to the Root Complex if VBE will be used by the guest make sense?

As you noted, applying the recommendation to all VGA compatible
devices may be too broad.  I'm not sure whether it makes sense to
recommend attaching VGA compatible devices to the Root Complex to
avoid the complexity of the VGA exception bits, or if that is a
non-issue.  In fact, if I understand correctly, it may make sense to
recommend attaching VGA compatible devices to separate PCI bridges if
the VM will have multiple VGA compatible devices so that the guest can
perform VGA arbitration.

Unless I hear otherwise, I'll plan to create a v4 which documents the
issue with VBE registers more specifically.  Any suggestions for how
best to do that would be appreciated.

Cheers,
Kevin

