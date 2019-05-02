Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E97A011A11
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 15:22:21 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51101 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMBfI-0008TE-T7
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 09:22:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55239)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hMBeG-0008Bv-Te
	for qemu-devel@nongnu.org; Thu, 02 May 2019 09:21:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hMBeF-00073K-0G
	for qemu-devel@nongnu.org; Thu, 02 May 2019 09:21:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:31494)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hMBeD-000703-4z
	for qemu-devel@nongnu.org; Thu, 02 May 2019 09:21:14 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 930A83097032;
	Thu,  2 May 2019 13:21:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3025D608A6;
	Thu,  2 May 2019 13:21:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 3DB7611AAF; Thu,  2 May 2019 15:21:05 +0200 (CEST)
Date: Thu, 2 May 2019 15:21:05 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190502132105.qkudeunhcueadka7@sirius.home.kraxel.org>
References: <20190502073543.4391-1-kraxel@redhat.com>
	<CAFEAcA-OyrwAqp1Kwt-sFJY3xj=0mUszGtF3RewwLs25vOhNLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA-OyrwAqp1Kwt-sFJY3xj=0mUszGtF3RewwLs25vOhNLg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Thu, 02 May 2019 13:21:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PULL 0/7] Usb 20190502 patches
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Hi -- I'm afraid this failed to compile on one of my systems:
>=20
>   CC      hw/usb/hcd-xhci.o
> /home/petmay01/linaro/qemu-for-merges/hw/usb/hcd-xhci.c: In function
> =E2=80=98usb_xhci_realize=E2=80=99:
> /home/petmay01/linaro/qemu-for-merges/hw/usb/hcd-xhci.c:3340:66:
> error: =E2=80=98%d=E2=80=99 directive output may be truncated writing b=
etween 1 and 11
> bytes into a region of size 5 [-Werror=3Dformat-truncation=3D]
>              snprintf(port->name, sizeof(port->name), "usb2 port #%d", =
i+1);

Which system/compiler is this?

cheers,
  Gerd


