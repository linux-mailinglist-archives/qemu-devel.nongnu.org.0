Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25031592E90
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 13:59:02 +0200 (CEST)
Received: from localhost ([::1]:58622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNYkG-0002J5-Ox
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 07:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oNYiS-0008Ti-Pb
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 07:57:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oNYiO-0003lG-Q4
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 07:57:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660564623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JZnOYyiaHBblbXR1mz4DXFWjz9HZqyuatQ2UWM8dFj4=;
 b=PskPbTitQ8LXu80DPe+iaxm/BkVJwOywlJVifkhIvOJ69x/Zfg5Ilw1aojvmejYbySAEmY
 wP5j87BRwzfDpFcNRA/tfxjjM/japltNpfWvOV0Yo9reZTHcowrZdWUYvZzFbrN9qCbPo1
 OVkcqt1/VlHKb/VqZNbhpeKYtdlhCIA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-k6y5IftzNaOlF2O3Aw41DA-1; Mon, 15 Aug 2022 07:56:59 -0400
X-MC-Unique: k6y5IftzNaOlF2O3Aw41DA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 970D4811E76;
 Mon, 15 Aug 2022 11:56:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D9252026D64;
 Mon, 15 Aug 2022 11:56:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 93E791800082; Mon, 15 Aug 2022 13:56:57 +0200 (CEST)
Date: Mon, 15 Aug 2022 13:56:57 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Elliot Nunn <elliot@nunn.io>
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 hsp.cat7@gmail.com
Subject: Re: VGA hardware cursor query
Message-ID: <20220815115657.5szgmhoqvqz7xep4@sirius.home.kraxel.org>
References: <9A92120A-46B5-48A4-9424-8E606143291F@nunn.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9A92120A-46B5-48A4-9424-8E606143291F@nunn.io>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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

On Mon, Aug 01, 2022 at 11:58:51AM +0800, Elliot Nunn wrote:
> Dear all,
> 
> I want to give Mac OS 9 clients access to hardware cursor support, to improve
> responsiveness in absolute-cursor mode.
> 
> Would it be acceptable to add a hardware cursor interface to the VGA device?
> And if so, can anyone advise on an appropriate register layout?

Certainly acceptable.  Toyed with the idea, but never actually did it
because in most cases it is easier to just use virtio-gpu instead ;)

> +#define VBE_DISPI_INDEX_CURSOR_IMG      0xb
> +#define VBE_DISPI_INDEX_CURSOR_HOTSPOT  0xc
> +#define VBE_DISPI_INDEX_CURSOR_ABS      0xd

There already is a qemu-specific register extension set (see
pci_vga_qext_ops in hw/display/vga-pci.c).  Right now it has two
registers:  One r/o register returning the size of the register
area, and one register to get/set the frame buffer byte order.

So, when adding hardware cursor support I'd strongly suggest to
add the registers there.  First because that is already
qemu-specific, and second because handling backward compatibility
is much easier then.  Guests can easily figure whenever hardware
cursors are supported by checking the size register and see
whenever the hwcursor registers are there or not.

I'd also suggest to use more verbose register names and use a separate
register for each value, i.e.

PCI_VGA_QEXT_REG_HWCURSOR_ENABLE
PCI_VGA_QEXT_REG_HWCURSOR_VRAM_OFFSET
PCI_VGA_QEXT_REG_HWCURSOR_HOTSPOT_X
PCI_VGA_QEXT_REG_HWCURSOR_HOTSPOT_Y
PCI_VGA_QEXT_REG_HWCURSOR_POSITION_X
PCI_VGA_QEXT_REG_HWCURSOR_POSITION_Y

Also define clear semantics for each register and for the cursor format.

Do we want just a fixed 64x64 rgba format?
If not we need more registers ...

Is position the upper left corner of the image or the hotspot?

take care,
  Gerd


