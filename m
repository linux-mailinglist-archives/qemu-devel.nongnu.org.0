Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326CE54D249
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 22:07:34 +0200 (CEST)
Received: from localhost ([::1]:44696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1ZIb-0005ql-8A
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 16:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1o1ZH8-0004Cc-Bw
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 16:06:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1o1ZH4-0008KF-5Q
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 16:06:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655323556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+tWHkPOlzbJ9bIt0lVysNSxRePdxkc3zcabJyFrkhbI=;
 b=PKXC2K7YrEutu5oer5sAzVvTuAEGBWL8jZhD65Id6raxeYObo8/ywLYVfKr05ulGuj+1+u
 GidF6bsRg4pN1J0XZq67uS6fm7lQrbw993cchvT//ZWnh8mwZVQkuRWa4LlkfQhb+Ognn6
 RPlnQRtYwE5s7CxapGu1Gx1fnxNA1C4=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-kUB-XEKxOeCI76NzM36NSg-1; Wed, 15 Jun 2022 16:05:54 -0400
X-MC-Unique: kUB-XEKxOeCI76NzM36NSg-1
Received: by mail-il1-f199.google.com with SMTP id
 x5-20020a923005000000b002d1a91c4d13so9083373ile.4
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 13:05:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=+tWHkPOlzbJ9bIt0lVysNSxRePdxkc3zcabJyFrkhbI=;
 b=PXj9LdVVx0cv5kTYRnw4rDkGRowl/SuMSW6YxSd05Pxs6fq/XBX+tNsH6+z6KB4c/u
 OS/WxS7xYbiINACbTajwFbUbb8H2hIRt7kpb5O8W9riCrnReisjB9Pk6PJA9X/vO14Uq
 wlE9usl6uz4UX7jUfri1d6qNheMClPeWLZzwgFq91YGfssQztS9NWrg3ijVPqe9310al
 Wp0t1L4svYuDhpOvoG0KLfFDyNGtDDL68A4Gu7ZcvVcUMeMGvzSlPVOMwlJ7a0nRicl9
 A+WH5dgbmHK27cQf1HD+hn/e/N+XxPHEAsCgFhKIwbM+Yf3GT6EETTjOkxMGxsoghsYF
 LsFw==
X-Gm-Message-State: AJIora8VIlBGnSF09oLzMsUBn6jEL2tG2YJ9JJfECtWH85E5g8pU5D/2
 +pgCAfAdQl4p7Bfo8OdTfnEq5UOX2sAG7XqWPJL93gHtZ01XGRgSifhjifbqIjuJuAMvwNr5UzY
 0We4Q+iF9oA7AyT8=
X-Received: by 2002:a5d:9a96:0:b0:669:50d6:815 with SMTP id
 c22-20020a5d9a96000000b0066950d60815mr726539iom.110.1655323554091; 
 Wed, 15 Jun 2022 13:05:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tKMO8xeGCDPD8AJoNJgvnzEYECKgZPXiUFw44vhsZwH8uMxO3/UVz2jiFyLGHeWX0ExHrFzw==
X-Received: by 2002:a5d:9a96:0:b0:669:50d6:815 with SMTP id
 c22-20020a5d9a96000000b0066950d60815mr726526iom.110.1655323553712; 
 Wed, 15 Jun 2022 13:05:53 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 d7-20020a056e020c0700b002d101029626sm7233853ile.62.2022.06.15.13.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 13:05:51 -0700 (PDT)
Date: Wed, 15 Jun 2022 14:05:50 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Laszlo Ersek <lersek@redhat.com>, Kevin Locke <kevin@kevinlocke.name>,
 qemu-devel@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>, Laine Stump
 <laine@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2] docs: add PCIe root bus for VGA compat guideline
Message-ID: <20220615140550.25f94242.alex.williamson@redhat.com>
In-Reply-To: <20220614085252.fyogpqyf7cfcty4x@sirius.home.kraxel.org>
References: <922cc3081ff9c986188f881ef4d1cf15bd3adf48.1654739990.git.kevin@kevinlocke.name>
 <bde9fc450bc5143d616c7e9999c5d39ae9fd9cb8.1655054968.git.kevin@kevinlocke.name>
 <3eebc773-a5ae-6652-95f5-4359872ea4d4@redhat.com>
 <20220614085252.fyogpqyf7cfcty4x@sirius.home.kraxel.org>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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

On Tue, 14 Jun 2022 10:52:52 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> On Mon, Jun 13, 2022 at 03:47:04PM +0200, Laszlo Ersek wrote:
> > On 06/12/22 19:32, Kevin Locke wrote:  
> > > PCI Express devices which use legacy VGA compatibility should be placed
> > > on the Root Complex.  This simplifies ioport access to VGA registers,
> > > which requires use of a special exception bit to work across PCI(e)
> > > bridges.  It is also necessary for ioport access to VESA BIOS Extension
> > > (VBE) registers, which is not forwarded over PCI(e) bridges, even with
> > > the special exception bit for VGA register access.[1]
> > > 
> > > Update the PCI Express Guidelines to add these to the list of devices
> > > which can be placed directly on the Root Complex.
> > > 
> > > Note that the only PCI Express display devices currently supported
> > > (bochs-display and virtio-gpu-pci) do not offer VGA compatibility.
> > > Legacy PCI devices (e.g. vga, qxl-vga, virtio-vga) are already
> > > documented as allowed on the Root Complex by the first item in the list.
> > > However, this item documents an additional consideration for placing
> > > devices which was not previously mentioned, and may be relevant for PCIe
> > > devices offering VGA compatibility in the future.  
> 
> Well, the *key* problem is emulated VGA devices with VBE registers in
> io address space, because those are not forwarded over bridges.
> 
> For normal VGA registers this isn't much of a problem (in theory, not
> fully sure whenever that holds in practice, Alex?).  The linux kernel
> knows how to use the bridge control register to manage access to VGA
> registers.

Yes, AUIU the issue is entirely with the extended VBE requirements, the
VGA ranges are fully routable through the VGA control registers on the
bridge.  The only bare metal issue I'm aware of with VGA routing is
that we cannot route around Intel IGD.  IIRC, this latter quirk is the
only reason that enabling VGA routing for a vfio-pci device is
considered experimental, but it very much does work when there's no
host device silently consuming those ranges.

We've also historically had issues with AMD graphics drivers assuming
an express link which can lead to driver segfaults if those devices are
placed on the root complex.  OTOH, I'm not aware of any specific issues
with placing assigned VGA class GPUs in configurations with a root port.

I'd therefore expect any configuration guidelines we're proposing to be
very specific to devices that make use of VBE, not just VGA devices in
general.  Thanks,

Alex


