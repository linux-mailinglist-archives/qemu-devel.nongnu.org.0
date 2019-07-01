Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FEC1137F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 08:45:15 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46078 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hM5T0-0000Ha-NN
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 02:45:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hM5S5-0008RZ-Bo
	for qemu-devel@nongnu.org; Thu, 02 May 2019 02:44:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hM5S1-0005WT-QE
	for qemu-devel@nongnu.org; Thu, 02 May 2019 02:44:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41102)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hM5Rv-0005Ry-GE
	for qemu-devel@nongnu.org; Thu, 02 May 2019 02:44:11 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 52DA7307D935;
	Thu,  2 May 2019 06:44:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 034F51001DCF;
	Thu,  2 May 2019 06:44:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 3C5D211AAF; Thu,  2 May 2019 08:44:00 +0200 (CEST)
Date: Thu, 2 May 2019 08:44:00 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Message-ID: <20190502064400.cvfkul7aelyyfme5@sirius.home.kraxel.org>
References: <20190412121626.19829-1-berrange@redhat.com>
	<20190412121626.19829-5-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190412121626.19829-5-berrange@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Thu, 02 May 2019 06:44:01 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 4/5] hw/usb: avoid format truncation
 warning when formatting port name
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 12, 2019 at 01:16:25PM +0100, Daniel P. Berrang=C3=A9 wrote:
> hw/usb/hcd-xhci.c: In function =E2=80=98usb_xhci_realize=E2=80=99:
> hw/usb/hcd-xhci.c:3339:66: warning: =E2=80=98%d=E2=80=99 directive outp=
ut may be truncated writing between 1 and 10 bytes into a region of size =
5 [-Wformat-trunca\
> tion=3D]
>  3339 |             snprintf(port->name, sizeof(port->name), "usb2 port=
 #%d", i+1);
>       |                                                                =
  ^~
> hw/usb/hcd-xhci.c:3339:54: note: directive argument in the range [1, 21=
47483647]
>  3339 |             snprintf(port->name, sizeof(port->name), "usb2 port=
 #%d", i+1);
>       |                                                      ^~~~~~~~~~=
~~~~~
>=20
> The xhci code formats the port name into a fixed length
> buffer which is only large enough to hold port numbers
> upto 5 digits in decimal representation. We're never
> going to have a port number that large, so aserting the
> port number is sensible is sufficient to tell GCC the
> formatted string won't be truncated.

Picked into the usb queue.

thanks,
  Gerd


