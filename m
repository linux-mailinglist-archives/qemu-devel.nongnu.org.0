Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ED210FC13
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Dec 2019 11:54:24 +0100 (CET)
Received: from localhost ([::1]:51480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ic5p0-0001j5-2d
	for lists+qemu-devel@lfdr.de; Tue, 03 Dec 2019 05:54:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37907)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1ic5jF-00007T-2C
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 05:48:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1ic5j8-00054C-Ck
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 05:48:20 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29259
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1ic5j7-0004zG-Ta
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 05:48:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575370095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kTuwcXauzUnD2M6lY1412ifP/pkH6M9FORf7bE6UR9U=;
 b=E/oMkBl7INLegUoGtL/t/FXesAZI3H8prfDYELJ6wyzECGAcvKQqOrtag9gjNHr4zvIELK
 FIBS7GfdCQStQ6k89emCiHYcX8VlRhR9Za+2NyzHVS9HggE4oUSJ3rbz8BpTIql0kR/Y60
 96xLv87g5V/ubCBJa1bPD1eZjeY4e+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-R5HF19d4ObG_C4xiR3AYlg-1; Tue, 03 Dec 2019 05:48:12 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F6F8800D4E;
 Tue,  3 Dec 2019 10:48:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73AD85C1B5;
 Tue,  3 Dec 2019 10:48:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3485011AB5; Tue,  3 Dec 2019 11:48:08 +0100 (CET)
Date: Tue, 3 Dec 2019 11:48:08 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [PATCH 1/2] usb-host: remove 'remote wakeup' flag from
 configuration descriptor
Message-ID: <20191203104808.w23xl73o6wy5qtrp@sirius.home.kraxel.org>
References: <20191202123430.7125-1-yuri.benditovich@daynix.com>
 <20191202123430.7125-2-yuri.benditovich@daynix.com>
MIME-Version: 1.0
In-Reply-To: <20191202123430.7125-2-yuri.benditovich@daynix.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: R5HF19d4ObG_C4xiR3AYlg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: yan@daynix.com, ehabkost@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> +        /* If this is GET_DESCRIPTOR request for configuration descripto=
r,
> +         * remove 'remote wakeup' flag from it to prevent idle power dow=
n
> +         * in Windows guest */

scripts/checkpatch.pl complains about that, please fix (and also the
other checkpatch warnings).

> +        if (s->suppress_remote_wake &&
> +            udev->setup_buf[0] =3D=3D USB_DIR_IN &&
> +            udev->setup_buf[1] =3D=3D USB_REQ_GET_DESCRIPTOR &&
> +            udev->setup_buf[3] =3D=3D USB_DT_CONFIG && udev->setup_buf[2=
] =3D=3D 0 &&
> +            xfer->actual_length > offsetof(struct libusb_config_descript=
or, bmAttributes) &&
> +            (conf->bmAttributes & USB_CFG_ATT_WAKEUP)) {
> +                struct libusb_device_descriptor desc;
> +                libusb_get_device_descriptor(s->dev, &desc);
> +                trace_usb_host_remote_wakeup_removed(desc.idVendor, desc=
.idProduct);

Please use s->bus_num and s->addr to identify the device, like all the
other trace points do.  I don't think there is a need to log
desc.idVendor and desc.idProduct here.


Otherwise the patch looks fine.

cheers,
  Gerd


