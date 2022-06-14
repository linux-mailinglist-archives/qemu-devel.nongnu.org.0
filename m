Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F6754AC9B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 10:55:13 +0200 (CEST)
Received: from localhost ([::1]:58946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o12KN-00060s-Ln
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 04:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o12IK-0004Ao-CK
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 04:53:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o12IH-0000gI-3u
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 04:53:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655196779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aZMUCPS5RPIJWiWlVyZiB86K75+2t0WQary0EhoXEhE=;
 b=haRRG/JL99Qt5q+Bjb7mODWpabNUMpvOa4SgEkn5CyQ6b7u7q6TuoK9hELPkD3HNvKYHSB
 0IU2yMDACZPm7HHwCUzAZbObnXNc4j2DtMzYKC0vWKaaHmAH/0dsDbunWrfyMDiVTw5Hgk
 jtYe7Rg8kZwPPOpfU/EaA+nQzQ6jJdk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-pgQkazwUPluXlQL1HmEjBA-1; Tue, 14 Jun 2022 04:52:54 -0400
X-MC-Unique: pgQkazwUPluXlQL1HmEjBA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41F61804196;
 Tue, 14 Jun 2022 08:52:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E32DD40C1247;
 Tue, 14 Jun 2022 08:52:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7F7E91800084; Tue, 14 Jun 2022 10:52:52 +0200 (CEST)
Date: Tue, 14 Jun 2022 10:52:52 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: Kevin Locke <kevin@kevinlocke.name>, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Laine Stump <laine@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v2] docs: add PCIe root bus for VGA compat guideline
Message-ID: <20220614085252.fyogpqyf7cfcty4x@sirius.home.kraxel.org>
References: <922cc3081ff9c986188f881ef4d1cf15bd3adf48.1654739990.git.kevin@kevinlocke.name>
 <bde9fc450bc5143d616c7e9999c5d39ae9fd9cb8.1655054968.git.kevin@kevinlocke.name>
 <3eebc773-a5ae-6652-95f5-4359872ea4d4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3eebc773-a5ae-6652-95f5-4359872ea4d4@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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

On Mon, Jun 13, 2022 at 03:47:04PM +0200, Laszlo Ersek wrote:
> On 06/12/22 19:32, Kevin Locke wrote:
> > PCI Express devices which use legacy VGA compatibility should be placed
> > on the Root Complex.  This simplifies ioport access to VGA registers,
> > which requires use of a special exception bit to work across PCI(e)
> > bridges.  It is also necessary for ioport access to VESA BIOS Extension
> > (VBE) registers, which is not forwarded over PCI(e) bridges, even with
> > the special exception bit for VGA register access.[1]
> > 
> > Update the PCI Express Guidelines to add these to the list of devices
> > which can be placed directly on the Root Complex.
> > 
> > Note that the only PCI Express display devices currently supported
> > (bochs-display and virtio-gpu-pci) do not offer VGA compatibility.
> > Legacy PCI devices (e.g. vga, qxl-vga, virtio-vga) are already
> > documented as allowed on the Root Complex by the first item in the list.
> > However, this item documents an additional consideration for placing
> > devices which was not previously mentioned, and may be relevant for PCIe
> > devices offering VGA compatibility in the future.

Well, the *key* problem is emulated VGA devices with VBE registers in
io address space, because those are not forwarded over bridges.

For normal VGA registers this isn't much of a problem (in theory, not
fully sure whenever that holds in practice, Alex?).  The linux kernel
knows how to use the bridge control register to manage access to VGA
registers.

So, if the document already covers vga & qxl & virtio-vga (didn't check
that beforehand) I'm not sure we actually need an update ...

take care,
  Gerd


