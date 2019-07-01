Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A81F2D663
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 09:32:07 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49031 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVt4A-0000uL-Ds
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 03:32:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56149)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hVsuK-00013Q-K6
	for qemu-devel@nongnu.org; Wed, 29 May 2019 03:21:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hVsuJ-0004zu-R5
	for qemu-devel@nongnu.org; Wed, 29 May 2019 03:21:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52704)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hVsuJ-0004zI-IC
	for qemu-devel@nongnu.org; Wed, 29 May 2019 03:21:55 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5F39A9FFD4
	for <qemu-devel@nongnu.org>; Wed, 29 May 2019 07:21:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-59.ams2.redhat.com
	[10.36.116.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3A2A060BE0;
	Wed, 29 May 2019 07:21:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 792F511AAB; Wed, 29 May 2019 09:21:44 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 29 May 2019 09:21:40 +0200
Message-Id: <20190529072144.26737-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 29 May 2019 07:21:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 0/4] add drm modifier support for dmabufs.
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

v2: fix build failure with older mesa versions which don't have
    EGL_DMA_BUF_PLANE0_MODIFIER_LO_EXT

Gerd Hoffmann (4):
  console: add dmabuf modifier field.
  vfio/display: set dmabuf modifier field
  egl-helpers: add modifier support to egl_get_fd_for_texture().
  egl-helpers: add modifier support to egl_dmabuf_import_texture()

 include/ui/console.h     |  1 +
 include/ui/egl-helpers.h |  3 ++-
 hw/vfio/display.c        |  1 +
 ui/egl-helpers.c         | 39 ++++++++++++++++++++++++++++-----------
 ui/spice-display.c       |  7 ++++---
 5 files changed, 36 insertions(+), 15 deletions(-)

--=20
2.18.1


