Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E23548598
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 15:53:08 +0200 (CEST)
Received: from localhost ([::1]:59250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0kV8-0005AU-W1
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 09:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1o0kPV-00054o-TG
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 09:47:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1o0kPT-0008Uk-7N
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 09:47:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655128032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jXh4ph/nIAIN3fKiCUCB8cFUTlpN5sOCIB38OaEldFM=;
 b=gt/5KbdDFFqql8xitDNthNAky4DYu2FG/T9+m3129YWqcs+dSOvaRoMbgi615B12syqEgO
 UCXt/fD+LiQxuLIjTeMHrYYxRyxUOPnqMOkGIjaM+X+1koFfyCgaRS/SaMFa7RS2YJ9+xN
 FvD3PW30ZplMR33KMl7MoeI0nOuXmFI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-UK11roZXN-m4yitpECirTw-1; Mon, 13 Jun 2022 09:47:09 -0400
X-MC-Unique: UK11roZXN-m4yitpECirTw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D224885A581;
 Mon, 13 Jun 2022 13:47:07 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.39.193.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 004E0492CA2;
 Mon, 13 Jun 2022 13:47:05 +0000 (UTC)
Subject: Re: [PATCH v2] docs: add PCIe root bus for VGA compat guideline
To: Kevin Locke <kevin@kevinlocke.name>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Laine Stump <laine@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Gerd Hoffmann <kraxel@redhat.com>
References: <922cc3081ff9c986188f881ef4d1cf15bd3adf48.1654739990.git.kevin@kevinlocke.name>
 <bde9fc450bc5143d616c7e9999c5d39ae9fd9cb8.1655054968.git.kevin@kevinlocke.name>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <3eebc773-a5ae-6652-95f5-4359872ea4d4@redhat.com>
Date: Mon, 13 Jun 2022 15:47:04 +0200
MIME-Version: 1.0
In-Reply-To: <bde9fc450bc5143d616c7e9999c5d39ae9fd9cb8.1655054968.git.kevin@kevinlocke.name>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

On 06/12/22 19:32, Kevin Locke wrote:
> PCI Express devices which use legacy VGA compatibility should be placed
> on the Root Complex.  This simplifies ioport access to VGA registers,
> which requires use of a special exception bit to work across PCI(e)
> bridges.  It is also necessary for ioport access to VESA BIOS Extension
> (VBE) registers, which is not forwarded over PCI(e) bridges, even with
> the special exception bit for VGA register access.[1]
> 
> Update the PCI Express Guidelines to add these to the list of devices
> which can be placed directly on the Root Complex.
> 
> Note that the only PCI Express display devices currently supported
> (bochs-display and virtio-gpu-pci) do not offer VGA compatibility.
> Legacy PCI devices (e.g. vga, qxl-vga, virtio-vga) are already
> documented as allowed on the Root Complex by the first item in the list.
> However, this item documents an additional consideration for placing
> devices which was not previously mentioned, and may be relevant for PCIe
> devices offering VGA compatibility in the future.
> 
> [1]: https://mail.coreboot.org/hyperkitty/list/seabios@seabios.org/thread/XG2RN3HKVRDEDTLA2PRELLIENIIH7II7/#XVP3I2KQVZHSTDA4SNVKOITWGRGSDU3F
> 
> Signed-off-by: Laszlo Ersek <lersek@redhat.com>

Please make this a "Suggested-by: Laszlo Ersek <lersek@redhat.com>"
(concerning the text in the patch body).

The commit message looks OK to me, but I'd like Gerd and/or Alex to
approve it.

Thanks!
Laszlo

> Signed-off-by: Kevin Locke <kevin@kevinlocke.name>
> ---
> Changes since v1:
>  * Replace my overly-broad exception for devices requiring ioport access
>    with a list item specifically for PCI Express devices offering VGA
>    Compatibility provided by Laszlo Ersek.
>  * Rewrite the commit message based on my improved understanding of the
>    issue and the improved scope of the change.
> 
> P.S. Let me know if the Signed-off-by tag is not appropriate for either
> of us.  I'm not clear on the etiquette of including someone else's
> sign-off, but also don't want to misrepresent myself as the source of
> your work.
> 
>  docs/pcie.txt | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/pcie.txt b/docs/pcie.txt
> index 89e3502075..59b26817f9 100644
> --- a/docs/pcie.txt
> +++ b/docs/pcie.txt
> @@ -48,13 +48,17 @@ Place only the following kinds of devices directly on the Root Complex:
>          strangely when PCI Express devices are integrated
>          with the Root Complex.
>  
> -    (2) PCI Express Root Ports (ioh3420), for starting exclusively PCI Express
> +    (2) Assigned PCI Express GPUs that offer legacy VGA compatibility, and
> +        that such compatibility is expected of (due to booting with SeaBIOS,
> +        or due to UEFI driver bugs or native OS driver bugs).
> +
> +    (3) PCI Express Root Ports (ioh3420), for starting exclusively PCI Express
>          hierarchies.
>  
> -    (3) PCI Express to PCI Bridge (pcie-pci-bridge), for starting legacy PCI
> +    (4) PCI Express to PCI Bridge (pcie-pci-bridge), for starting legacy PCI
>          hierarchies.
>  
> -    (4) Extra Root Complexes (pxb-pcie), if multiple PCI Express Root Buses
> +    (5) Extra Root Complexes (pxb-pcie), if multiple PCI Express Root Buses
>          are needed.
>  
>     pcie.0 bus
> 


