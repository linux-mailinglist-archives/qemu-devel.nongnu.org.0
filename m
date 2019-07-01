Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B76C2917B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 09:06:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50125 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hU4Hf-0007S0-DR
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 03:06:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45849)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hU4Ea-0005PU-SM
	for qemu-devel@nongnu.org; Fri, 24 May 2019 03:03:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hU4EY-0006LS-TX
	for qemu-devel@nongnu.org; Fri, 24 May 2019 03:03:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33556)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hU4EW-0006GG-UX
	for qemu-devel@nongnu.org; Fri, 24 May 2019 03:03:18 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2E89C7FDF8
	for <qemu-devel@nongnu.org>; Fri, 24 May 2019 07:03:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-101.ams2.redhat.com
	[10.36.116.101])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7ADF55B683;
	Fri, 24 May 2019 07:03:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id BB71511AB5; Fri, 24 May 2019 09:03:10 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 24 May 2019 09:03:05 +0200
Message-Id: <20190524070310.4952-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 24 May 2019 07:03:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 0/5] usb-hub: cleanups,
 configurable port count, per-port power switching emulation.
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2: codestyle fixes.

Gerd Hoffmann (5):
  usb-hub: tweak feature names
  usb-hub: make number of ports runtime-configurable
  usb-hub: add helpers to update port state
  usb-hub: add usb_hub_port_update()
  usb-hub: emulate per port power switching

 hw/usb/dev-hub.c | 221 +++++++++++++++++++++++++++++++++--------------
 1 file changed, 154 insertions(+), 67 deletions(-)

-- 
2.18.1


