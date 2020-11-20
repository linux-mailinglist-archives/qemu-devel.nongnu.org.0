Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82752BAAC3
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 14:04:30 +0100 (CET)
Received: from localhost ([::1]:35070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg65V-0007gW-Et
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 08:04:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kg64U-0007F7-P8
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 08:03:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kg64S-0007jG-L1
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 08:03:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605877403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RFNe/cs/1GLTGtc6Ft0eI8qQ7W7pKqh16d248c9r+wM=;
 b=BrXIOckoOx21ssjpByLWICXaLmuRptmyng+HUZPwnLPxOEXXUxKyPG/u8pAEhNz1QiKtTu
 dYwo5waW6SYBCwCaLOtF/w8QB+U6nIqiZLldGkNxPaifFSzdBNWDTIn1BrdNGz3F7/uW70
 YRpH3fRJ2nfWjQ2UF3ualnf7w9W6BcI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-8x_EMnsvPlyN3fsfVIkqaQ-1; Fri, 20 Nov 2020 08:03:22 -0500
X-MC-Unique: 8x_EMnsvPlyN3fsfVIkqaQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00764801B1A;
 Fri, 20 Nov 2020 13:03:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4B4960BE2;
 Fri, 20 Nov 2020 13:03:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7491517535; Fri, 20 Nov 2020 14:03:19 +0100 (CET)
Date: Fri, 20 Nov 2020 14:03:19 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for-5.2] microvm: fix kconfig for non-default devices
Message-ID: <20201120130319.ux3cwkvwbggtgzqy@sirius.home.kraxel.org>
References: <20201120085524.108200-1-pbonzini@redhat.com>
 <20201120093830.zgm6fn63xnvr7fxx@sirius.home.kraxel.org>
 <cda9f7eb-c2a8-5f87-8bb0-9e256094bfea@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cda9f7eb-c2a8-5f87-8bb0-9e256094bfea@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Bruce Rogers <brogers@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 20, 2020 at 01:08:40PM +0100, Paolo Bonzini wrote:
> On 20/11/20 10:38, Gerd Hoffmann wrote:
> > On Fri, Nov 20, 2020 at 09:55:24AM +0100, Paolo Bonzini wrote:
> > > PCIe and USB support can be disabled on the command line, and therefore
> > > should not be included if QEMU is configured --without-default-devices.
> > 
> > I don't think this will work.  I expect linking will fail due to
> > xhci_sysbus_build_aml and acpi_dsdt_add_gpex being not available.
> 
> Hmm, you're right.  On the other hand that also means that you're missing a
> depends on ACPI for USB_XHCI_SYSBUS.

No, we have hw/acpi/aml-build-stub.c ...

> What about moving those two directly
> to hw/acpi/aml-build.c?

Well, I like the aml generator being grouped with the device code and
not at a completely different place.

We could try plumb this through a sysbus class function, so the direct
symbol reference goes away.  Simliar to ISADeviceClass->build_aml().
Maybe also add build_dt() while being at it.

Problem is that with the way sysbus resource management is designed it
isn't that easy to do.  The device just provides the resources (memory
regions, irqs), the machine maps them.  So the device has no clue where
memory is mapped and how the irq is wired.  Also sysbus devices can be
alot more complex than isa devices which basically have ioports and irq
and nothing else.

take care,
  Gerd


