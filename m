Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE252D592
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 08:34:00 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48074 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVs9v-0003Ph-CJ
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 02:33:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hVs4o-0000am-Av
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:28:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hVs4l-0004ek-UN
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:28:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47422)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hVs4l-0004dv-Ex
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:28:39 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9C3AD305D65A;
	Wed, 29 May 2019 06:28:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-59.ams2.redhat.com
	[10.36.116.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B4E0A53E1B;
	Wed, 29 May 2019 06:28:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 01A6A11AAB; Wed, 29 May 2019 08:28:32 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 29 May 2019 08:28:23 +0200
Message-Id: <20190529062832.26483-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Wed, 29 May 2019 06:28:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/9] Usb 20190529 patches
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit da35f7f1eeff9f249a9597400fc514c83fd3a0=
f8:

  virtio-gpu: add sanity check (2019-05-28 08:14:44 +0200)

are available in the Git repository at:

  git://git.kraxel.org/qemu tags/usb-20190529-pull-request

for you to fetch changes up to 442bac16a6cd708a9f87adb0a263f9d833f03ed5:

  usb-tablet: fix serial compat property (2019-05-29 07:10:02 +0200)

----------------------------------------------------------------
usb-hub: port count config option, emulate power switching, cleanups.
usb-tablet, usb-host: bugfixes.

----------------------------------------------------------------

Gerd Hoffmann (9):
  usb: call reset handler before updating state
  usb-host: skip reset for untouched devices
  usb-host: avoid libusb_set_configuration calls
  usb-hub: tweak feature names
  usb-hub: make number of ports runtime-configurable
  usb-hub: add helpers to update port state
  usb-hub: add usb_hub_port_update()
  usb-hub: emulate per port power switching
  usb-tablet: fix serial compat property

 hw/core/machine.c    |   2 +-
 hw/usb/core.c        |   2 +-
 hw/usb/dev-hub.c     | 221 ++++++++++++++++++++++++++++++-------------
 hw/usb/host-libusb.c |  21 ++--
 4 files changed, 169 insertions(+), 77 deletions(-)

--=20
2.18.1


