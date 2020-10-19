Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4396B2922CD
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 09:08:25 +0200 (CEST)
Received: from localhost ([::1]:53860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUPHM-00009f-3t
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 03:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kUPGK-0008Bc-9G
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 03:07:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kUPGH-00008L-MK
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 03:07:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603091235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AfUV+ETDhRALqNaL0JEe7Miu5HIZDZsL2RoLW8VMYho=;
 b=f4C7hfxnl8VhuvS45PWaV6i03wqXWRoUT3l+bksc97BUI/ej3ZVnVRrhIvoxe4yJAXwQst
 i54r8/KTF30IOBMcrlu9EqZb20LAGtXDaXf/7k2tqX4cnOhoRo9kHAM5aXjKVrhSHOYz/a
 suLQwp8YRJF7IWGVmyV4w+UAHDgJ7RY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-I3avSKg9NcWMAa0ywqCXJg-1; Mon, 19 Oct 2020 03:07:13 -0400
X-MC-Unique: I3avSKg9NcWMAa0ywqCXJg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 369D51005504;
 Mon, 19 Oct 2020 07:07:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF5561992D;
 Mon, 19 Oct 2020 07:07:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CBB4416E31; Mon, 19 Oct 2020 09:07:04 +0200 (CEST)
Date: Mon, 19 Oct 2020 09:07:04 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 0/4] RfC: microvm: add second ioapic
Message-ID: <20201019070704.a2tjfea4sycivmnt@sirius.home.kraxel.org>
References: <20201016114328.18835-1-kraxel@redhat.com>
 <ffd81f03-b2a0-2c58-9f13-c956dfd1ca17@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ffd81f03-b2a0-2c58-9f13-c956dfd1ca17@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 01:44:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 16, 2020 at 03:16:20PM +0200, Philippe Mathieu-Daudé wrote:
> On 10/16/20 1:43 PM, Gerd Hoffmann wrote:
> > Add a second ioapic to microvm.  Gives us more IRQ lines we can
> > use for virtio-mmio devices.  Bump number of possible virtio-mmio
> > devices from 8 to 24.
> > 
> > Gerd Hoffmann (4):
> >    microvm: make number of virtio transports runtime configurable
> >    microvm: make pcie irq base runtime configurable
> >    microvm: add second ioapic
> >    microvm: reconfigure irqs if second ioapic is available
> 
> After looking at Laurent's m68k virt machine,
> I wonder if it is possible to use the Goldfish-PIC
> with the MicroVM instead (or another Goldfish machine
> type).

/me updates the WIP microvm blog post ;)

Problem with goldfish is that it tries to drag over stuff from the arm
world to x86.  Specifically device trees.  On arm this works reasonable
well meanwhile.  Firmware and bootloaders have support for using device
trees and passing them on in the boot chain, so the linux kernel has a
device tree which it can use to figure which hardware is present on the
system.

On x86 this doesn't work at all, so you'll end up building a custom
kernel for the goldfish platform.  A stock distro kernel is not going
to work.

I'm to driving microvm the opposite direction:  Add acpi support.  That
is the standard x86 way to do hardware discovery (for hardware you can't
detect in other ways like pci devices).  Which in turn allows us to drop
microvm-specific quirks (like adding virtio-mmio devices to the kernel
command line) when booting linux.

So, for microvm this is not going to happen.  But feel free to add a
goldfish machine type if you want play with that.  The microvm merge
also cleaned up the x86 code base which in turn should make this
relatively easy now.

take care,
  Gerd


