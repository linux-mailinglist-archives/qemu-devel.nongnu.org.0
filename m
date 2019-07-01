Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7673D26165
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 12:07:19 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39538 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTO9W-0001K8-G4
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 06:07:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50843)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hTO6u-0008Qa-Tf
	for qemu-devel@nongnu.org; Wed, 22 May 2019 06:04:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hTO11-0005Fv-Dd
	for qemu-devel@nongnu.org; Wed, 22 May 2019 05:58:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56934)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hTO11-0005FD-6k
	for qemu-devel@nongnu.org; Wed, 22 May 2019 05:58:31 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8217C3079B62
	for <qemu-devel@nongnu.org>; Wed, 22 May 2019 09:58:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
	[10.36.117.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2819F619B1;
	Wed, 22 May 2019 09:58:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 0C0E2A1E7; Wed, 22 May 2019 11:58:21 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 22 May 2019 11:58:18 +0200
Message-Id: <20190522095821.15240-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Wed, 22 May 2019 09:58:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/3] add drm modifier support for dmabufs.
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
Cc: Alex Williamson <alex.williamson@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Gerd Hoffmann (3):
  console: add dmabuf modifier field.
  vfio/display: set dmabuf modifier field
  egl-helpers: add dmabuf modifier support.

 include/ui/console.h     |  1 +
 include/ui/egl-helpers.h |  3 ++-
 hw/vfio/display.c        |  1 +
 ui/egl-helpers.c         | 37 ++++++++++++++++++++++++++-----------
 ui/spice-display.c       |  7 ++++---
 5 files changed, 34 insertions(+), 15 deletions(-)

-- 
2.18.1


