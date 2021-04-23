Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9C9369066
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 12:31:36 +0200 (CEST)
Received: from localhost ([::1]:33632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZt5z-0004SE-J9
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 06:31:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lZt4f-0003vx-Lk
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 06:30:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lZt4c-000314-Oh
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 06:30:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619173809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+sF4Vb4yy2dmW+wlE+GBdJBDsDH2UH89LwFt+Or0/NI=;
 b=Kt1CdcGnhbLQpJ0bzYlTipu0lG42UufayDEIGHAzgkvhcU4HjjU1UlbmGSa7jwBTBSPx38
 Xe9HxT4XWoEPECSusRgdPwSq3iB4rmt3HzjOHIIsLMyYjvmd2jL9XX2LySoiIg0cMI9v1V
 qetuBrYC5H9SXykDRWYZ7VqizyBtm00=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-fASAhu4oPt-yXyAiC1Jv-g-1; Fri, 23 Apr 2021 06:30:06 -0400
X-MC-Unique: fASAhu4oPt-yXyAiC1Jv-g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D17BEC7401;
 Fri, 23 Apr 2021 10:30:05 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-115-2.ams2.redhat.com
 [10.36.115.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 053F4100763B;
 Fri, 23 Apr 2021 10:30:04 +0000 (UTC)
Subject: Re: qemu/kvm tianocore restart stuck
To: VoidCC <raidsmainacc@gmail.com>, qemu-devel@nongnu.org
References: <CABZ9ZfUNmxTPxOBh0SCvaxBFRHKkTfmwAQjqFin=20CwMK64_g@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <4034d473-9902-1a51-0e5a-103109a51e86@redhat.com>
Date: Fri, 23 Apr 2021 12:30:03 +0200
MIME-Version: 1.0
In-Reply-To: <CABZ9ZfUNmxTPxOBh0SCvaxBFRHKkTfmwAQjqFin=20CwMK64_g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/22/21 22:04, VoidCC wrote:
> Hello,
> 
> I'm hitting a hard wall with qemu and efi.
> I'm running multiple windows server 2019 vms which usually reboot on
> updates.
> 
> The issue is, efi breaks on reboot.
> It randomly(race condition?, does not occur consistently) ends up in a
> blackscreen: no bootloader, no efi screen and the only way to get out of
> that state is to destroy the vm.
> moving the host mouse cursor above the console in virt-manager results in a
> flashing mouse cursor.
> there are no physical devices attached and there is currently no virtio
> attachment in use (os has virtio drivers installed)
> 
> 
> Machine is Q35 with tianocore/ovmf efi.
> I managed to reproduce the same behaviour on rhel 8.3 as well as
> voidlinux (kernel 5.11)
> 
> gdb output of qemu is showing nothing worrisome, else ive compiled ovmf
> manually for debug output.
> libvirt logs don't show any issues.
> 
> root · Slexy.org Pastebin <https://slexy.org/view/s2w8CdNBx5>
> 

Please capture the firmware debug log. It's possible that you have
rebooted the VM many times, and the variable store got fragmented, at
the "Fault Tolerant Write" level. During one of these boots, an FTW
"reclaim" (a kind of "defrag") may run, and that's time consuming, if
you're not used to it. The firmware log could help. See the
OvmfPkg/README file for QEMU command line options, for capturing the
OVMF debug log.

Please include your QEMU command lines too, in the issue report.

Thanks
Laszlo


