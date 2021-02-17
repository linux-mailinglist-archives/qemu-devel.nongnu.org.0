Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A355131D5AF
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 08:29:02 +0100 (CET)
Received: from localhost ([::1]:57082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCHGf-0002ba-Ny
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 02:29:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lCHF9-0002AU-Fd
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 02:27:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lCHF5-0008MF-LF
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 02:27:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613546842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fq40XYZ5sTBxtKx15e2Jdft9BMabOvGPyh+Pu7bXJcU=;
 b=U8b5qvzcE3JrVMrlhK5yAR96eFLyRy3yE1KweMqBuQ9LHW2FcWcpETnRg/BK4D1ahbGvPy
 IvOXMV8y/EcbYmw8kYIdi5dEuKzwRqQIjGLOsXJXt4hDQA6o7rrU9Ai6UuUQBdcZHTajcb
 YYA0P6WIe0ra/lmWtqydR4loJyPdoDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-1EfCewrRPG2AIvcqR3f7ZQ-1; Wed, 17 Feb 2021 02:27:19 -0500
X-MC-Unique: 1EfCewrRPG2AIvcqR3f7ZQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D843380196C;
 Wed, 17 Feb 2021 07:27:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E07C5B6AD;
 Wed, 17 Feb 2021 07:27:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7445918000A2; Wed, 17 Feb 2021 08:27:16 +0100 (CET)
Date: Wed, 17 Feb 2021 08:27:16 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Howard Spoelstra <hsp.cat7@gmail.com>
Subject: Re: USB pass through into Mac OS 9.x with qemu-system-ppc
Message-ID: <20210217072716.k376o2enckzclszo@sirius.home.kraxel.org>
References: <CABLmASF7YP3qfcuhAQsm8J28e8omZstBf7E5Eir=8MyqnvPLRQ@mail.gmail.com>
 <20210209151221.dxiiydxgxsqu3gmu@sirius.home.kraxel.org>
 <CABLmASEG3FiJ--7bQzZVJ1DtdFJSZ=a41yAf1QgEBf8BoGZk_w@mail.gmail.com>
 <CABLmASGwcpbDe3Gaj5TV5zFmFEaDaeL1-M1AmvfehzD9U=_3iw@mail.gmail.com>
 <20210216144831.cqefndfuvlju2yli@sirius.home.kraxel.org>
 <CABLmASF_r4E85yLQgEYSZWraBO4Uo70o28f6YZQ3-w0+wPW1XA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABLmASF_r4E85yLQgEYSZWraBO4Uo70o28f6YZQ3-w0+wPW1XA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Hi Gerd,
> 
> Thanks for looking into this. It looks to me that the usb storage
> device nicely reports endpoints 1 and 2 when asked, but that the host
> only ever communicates with endpoint 1.

EP 1 is host -> device.
EP 2 is device -> host.

So the host sends requests but the device never answers, probably due to
the wMaxPacketSize mismatch, macos being confused and sending broken
requests ...

> Can this also explain that other (non-mass-storage) devices cannot be
> passed through successfully ?

Yes, you can have simliar issues with other devices.  Devices can have
different interface descriptors for different device speeds.  This can
be rather small differences like the wMacPacketSize for usb sticks.  The
descriptors can be identical.  Or there can be large differences, like
usb-audio devices offering more channels when plugged into a usb2 port
(with enough bandwidth for that).

Problem is when the device is plugged into a usb2 port you can't query
the usb1 descriptors.  So qemu presents the wrong descriptors to the
guest in case host and guest use different usb speeds.  That may or may
not work ...

The other way around is less problematic, when plugging a usb2 device
into a usb3-capable (xhci) port I can tell the guest "this is a usb2
device".  But reporting "this is a usb2 device" via ohci isn't going to
fly for obvious reasons ...

take care,
  Gerd


