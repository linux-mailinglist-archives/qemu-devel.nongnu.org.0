Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE2341BE8F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 07:11:47 +0200 (CEST)
Received: from localhost ([::1]:58744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVRsg-0002Tn-Ge
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 01:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mVRqJ-0001ft-CA
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 01:09:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mVRqF-0004Fp-MR
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 01:09:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632892153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vZ1B0ArULdjvB65onyfgnG/mhNAWC5haMufbMm+4gYk=;
 b=cT7kCb6oLf64RzmKbVorpnm7XMDG+L8Ml5JEYiN1aXT2XiEfOfo71T0BXNOPU8zAhd5dnH
 pyYeXS8iWKELHTxl856XpQe7/wF4XSflkVMmM5myzff2lwbEMHlTcUh7ua73/rK0WT6ruW
 +ySuNVScKV36vG6++/YK9nSnJ8Fc2CU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-wrZxD1g5N7OCvkuu6x2tig-1; Wed, 29 Sep 2021 01:09:11 -0400
X-MC-Unique: wrZxD1g5N7OCvkuu6x2tig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B46E8015C7;
 Wed, 29 Sep 2021 05:09:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4279219739;
 Wed, 29 Sep 2021 05:09:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A3B371800386; Wed, 29 Sep 2021 07:09:08 +0200 (CEST)
Date: Wed, 29 Sep 2021 07:09:08 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Jose R. Ziviani" <jziviani@suse.de>
Subject: Re: [PATCH v3 0/2] modules: Improve modinfo.c support
Message-ID: <20210929050908.3fqf3wwbk6vrtziu@sirius.home.kraxel.org>
References: <20210928204628.20001-1-jziviani@suse.de>
MIME-Version: 1.0
In-Reply-To: <20210928204628.20001-1-jziviani@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 28, 2021 at 05:46:26PM -0300, Jose R. Ziviani wrote:
> This patchset introduces the modinfo_kconfig aiming for a fine-tune
> control of module loading by simply checking Kconfig options during the
> compile time, then generates one modinfo-<target>-softmmu.c per target.
> 
> The main reason of this change is to fix problems like:
> $ ./qemu-system-s390x -nodefaults -display none -accel tcg -M none -device help | head
> Failed to open module: /.../hw-display-qxl.so: undefined symbol: vga_ioport_read
> Failed to open module: /.../hw-display-virtio-vga.so: undefined symbol: vmstate_vga_common
> Failed to open module: /.../hw-display-virtio-vga.so: undefined symbol: vmstate_vga_common
> Failed to open module: /.../hw-display-virtio-vga-gl.so: undefined symbol: have_vga
> Failed to open module: /.../hw-usb-smartcard.so: undefined symbol: ccid_card_ccid_attach
> Failed to open module: /.../hw-usb-redirect.so: undefined symbol: vmstate_usb_device
> Failed to open module: /.../hw-usb-host.so: undefined symbol: vmstate_usb_device
> 
> With this patch, I run this small script successfuly:
>     #!/bin/bash
>     pushd ~/suse/virtualization/qemu/build
>     for qemu in qemu-system-*
>     do
>         [[ -f "$qemu" ]] || continue
>         res=$(./$qemu -nodefaults -display none -accel tcg -M none -device help 2>&1 | grep "Failed to" > /dev/null; echo $?)
>         [[ $res -eq 0 ]] && echo "Error: $qemu"
>     done
>     popd
> 
> Also run 'make check' and 'check-acceptance' without any failures.

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd


