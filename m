Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCEB31526D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 16:13:45 +0100 (CET)
Received: from localhost ([::1]:44222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Ui0-0005Hp-Ar
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 10:13:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l9Ugp-0004pq-Of
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:12:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l9Ugm-0005Zi-Va
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:12:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612883546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v3fOYCGcr4Oc/yhXSnraEdijpVHpyk9BgaojzYDAc44=;
 b=BSYGaGeLoOiVELZcLXVvxIx90nFLpNVKga1UVcbXNaIr/hku8gYwJZAY6PDIdiv19arBHz
 GIo04ahwRX7UcvmBN7IBJzDEHReRL9rRD2XjNes3mAs/W9U6tdWPCNm2rV8RpjOD9qgjnu
 /MpgrSmACZENz1/CRvsXrESGokr9qSo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-fdfZ7u3iMlmMptPVSXxNOw-1; Tue, 09 Feb 2021 10:12:24 -0500
X-MC-Unique: fdfZ7u3iMlmMptPVSXxNOw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3548EC1A1;
 Tue,  9 Feb 2021 15:12:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-161.ams2.redhat.com
 [10.36.112.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 876C25D736;
 Tue,  9 Feb 2021 15:12:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 035BA18000A0; Tue,  9 Feb 2021 16:12:22 +0100 (CET)
Date: Tue, 9 Feb 2021 16:12:21 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Howard Spoelstra <hsp.cat7@gmail.com>
Subject: Re: USB pass through into Mac OS 9.x with qemu-system-ppc
Message-ID: <20210209151221.dxiiydxgxsqu3gmu@sirius.home.kraxel.org>
References: <CABLmASF7YP3qfcuhAQsm8J28e8omZstBf7E5Eir=8MyqnvPLRQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABLmASF7YP3qfcuhAQsm8J28e8omZstBf7E5Eir=8MyqnvPLRQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> A noticeable issue when comparing the pcap files seems to be at Fedora pcap
> frame 8 and Mac OS 9.2 pcap frame 28 (configuration descriptor). It seems
> the Mac OS side is missing 5 bytes and hence the packet is malformed.
> (A run with Mac OS 9.0 as guest showed that this guest only missed 1 byte
> in the response.)

That is normal.  Note that the configuration descriptor is requested
twice:  Once with a buffer large enough to see the wTotalLength field.
and then again with a buffer large enough for the whole descriptor.

> Also visible in the Mac OS pcap file at frame 53 is that it seems a setup
> package is contained in an URB that is not suited for it.

Looks more like a bug in the qemu pcap code, probably have to set some
flag to indicate the setup section doesn't contain valid data instead
of just leaving it all blank.

Frame 55 is probably the problematic one.  Look at the timestamps.  The
device seems to not answer, then after a while macos seems to try reset
the device.

Also the fedora trace has the bulk transfer data so wireshark can decode
usb-storage commands and the scsi command wrapped inside.  That is not
the case in the macos trace.  Not sure whenever that is another bug in
the pcap code.  It could also indicate the bug in the ohci emulation
which in turn causes macos fail ...

> Qemu-system-ppc is started like this for the Mac OS guest:
> ./qemu-system-ppc \
> -M mac99,via=pmu \
> -m 512 \
> -boot c \
> -serial stdio \
> -L pc-bios \
> -drive file=/home/hsp/Mac-disks/9.2.img,format=raw,media=disk \
> -device usb-host,vendorid=0x058f,productid=0x6387,pcap=macos92.pcap

Does an emulated usb stick work with macos?

take care,
  Gerd


