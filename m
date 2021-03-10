Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2AA33393A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 10:52:49 +0100 (CET)
Received: from localhost ([::1]:51636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJvWK-0006fv-Kp
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 04:52:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJvVG-00066T-Sd
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 04:51:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJvVE-0003fk-Ne
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 04:51:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615369899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hPBNS53WNUSuDn2iFlGY53MUn/HGYWD7MX8qUf4auSM=;
 b=SiOKbt4z2eWXuQU3UHNsMe3wY2Ji4waqusWjsDK1UBDmIkRJlizFjke8FGE1xnW0QB1r3B
 /pWHXXaucSH81vacx+Xh24J/0xHbiisuLcW4YZ8Y+6m970EhtwoA1S4TAFGUZJyXvLSVVO
 /vqme7M6KAzINxoVlN09mI+y6FzFMjs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-46e986FBO2i6q0g-UI1lHA-1; Wed, 10 Mar 2021 04:51:35 -0500
X-MC-Unique: 46e986FBO2i6q0g-UI1lHA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82E5818397F1;
 Wed, 10 Mar 2021 09:51:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 350FD1800D;
 Wed, 10 Mar 2021 09:51:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 09D5318000AC; Wed, 10 Mar 2021 10:51:26 +0100 (CET)
Date: Wed, 10 Mar 2021 10:51:26 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Joelle van Dyne <j@getutm.app>
Subject: Re: [RFC] hw/display: add virtio-ramfb device
Message-ID: <20210310095126.fqxigwoczqkckosp@sirius.home.kraxel.org>
References: <20210309213513.12925-1-j@getutm.app>
MIME-Version: 1.0
In-Reply-To: <20210309213513.12925-1-j@getutm.app>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?utf-8?B?TMOhc3psw7Mgw4lyc2Vr?= <lersek@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 09, 2021 at 01:35:13PM -0800, Joelle van Dyne wrote:
> Like virtio-vga, but using ramfb instead of legacy vga.
> Useful for booting from OVMF (with updated drivers) into Windows
> ARM which expects a linear FB that the virtio-gpu driver in OVMF
> does not provide.

What is wrong with "-device ramfb" for that use case?

> This code was originally written by Gerd Hoffmann and was
> updated to contain later changes to the display driver tree.

Well, the tricky part with that is OVMF driver binding.  We don't
want two drivers bind to the same device.

We have QemuRamfbDxe + QemuVideoDxe + VirtioGpuDxe.

 - QemuRamfbDxe handles ramfb.
 - QemuVideoDxe handles all vga devices (including virtio-vga)
   plus bochs-display.
 - VirtioGpuDxe handles all virtio-gpu devices (except virtio-vga).

VirtioGpuDxe could easily handle virtio-vga too but doesn't to avoid
the conflict with QemuVideoDxe.  It detects that by looking at the pci
class code.  virtio-vga is tagged as display/vga whereas virtio-gpu-pci
is display/other.

Problem of the virtio-ramfb device is that the guest can't figure
whenever the virtio-gpu device comes with ramfb support or not.
Merging this is a non-starter unless we have a solution for that
problem.

A use case which actually needs that would be helpful to drive that
effort.  I don't see one.  If your guest comes with virtio-gpu drivers
you don't need ramfb support.  The VirtioGpuDxe driver covers the boot
loader, and the guest driver everything else.  If your guest has no
virtio-gpu drivers the virtio-ramfb combo device is useless, you can
simply use standalone ramfb instead.

take care,
  Gerd


