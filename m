Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A9815D53D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Feb 2020 11:09:50 +0100 (CET)
Received: from localhost ([::1]:36858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2Xuu-0005VC-9U
	for lists+qemu-devel@lfdr.de; Fri, 14 Feb 2020 05:09:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59855)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1j2Xtt-00048M-CT
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 05:08:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1j2Xtr-0005XR-G9
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 05:08:45 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22581
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1j2Xtr-0005V3-CN
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 05:08:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581674921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6SdkFtvFzOTNURNa3/Is+BMJPlczpxu74PYyOzS8buE=;
 b=XgrVjiY8vijecnOWM0kgOUGdpWCrUT+Dfg9z9oKnWoxf7mPkezdcWtIswqPpAmQfNlPhXJ
 JwtGJHg+MgJtORZ33CVG8YEr7TFSp3BtBUBcFK1xa8s3KwAW3wF8qu0bUjok6KJEX2uISd
 5DzFHpyHzQ3TmEQLX0URzxD6o8MSWeE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-ir-l-b-oO72d0wJ54XoyQg-1; Fri, 14 Feb 2020 05:08:39 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82358800D5B;
 Fri, 14 Feb 2020 10:08:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41FF05C115;
 Fri, 14 Feb 2020 10:08:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7AFA545B4; Fri, 14 Feb 2020 11:08:37 +0100 (CET)
Date: Fri, 14 Feb 2020 11:08:37 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 3/3] arm: allwinner: Wire up USB EHCI
Message-ID: <20200214100837.lv2cok5he7epmu7i@sirius.home.kraxel.org>
References: <20200214062109.24494-1-linux@roeck-us.net>
 <20200214062109.24494-3-linux@roeck-us.net>
MIME-Version: 1.0
In-Reply-To: <20200214062109.24494-3-linux@roeck-us.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: ir-l-b-oO72d0wJ54XoyQg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> ehci-platform 1c1c000.usb: new USB bus registered, assigned bus number 2
> ehci-platform 1c1c000.usb: irq 31, io mem 0x01c1c000
> ehci-platform 1c1c000.usb: USB 2.0 started, EHCI 1.00

> +        for (i =3D 0; i < ARRAY_SIZE(s->ehci); i++) {
> +            object_property_set_bool(OBJECT(&s->ehci[i]), true, "realize=
d",
> +                                     &err);

I suspect the ohci controllers are ehci companions, i.e. they handle a
single usb bus, with ehci handling usb2 and ohci handling usb1 devices?

If so then you should initialize ehci first, explicitly assign bus
names and set the masterbus property for the ohci controllers.

See also docs/usb2.txt

cheers,
  Gerd


