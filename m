Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15851100BD3
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 19:51:41 +0100 (CET)
Received: from localhost ([::1]:38242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWm7g-0003i3-4p
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 13:51:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40943)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.williamson@redhat.com>) id 1iWm3P-0000jR-Sm
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 13:47:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.williamson@redhat.com>) id 1iWm3N-0002gp-Ul
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 13:47:15 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:47288
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
 id 1iWm3L-0002et-UO
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 13:47:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574102831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ySwRSgaVx3PPsIMtMoJQ4P/YomcbXMZ9gQlhSDXoP5w=;
 b=YA/b3TsQXMFZVeMrN6owJzuckw3fRogs4KwUKP/hSHfJGtEr7GwdZf802fSNM0BMplvlXn
 Niw6FqqzBzY8qoSd+A2Sm0tIM+thQyVD0QMaluZ8uGkzglwU4cHcgLy/D86Aj3nkHzmdJ0
 rpDj0lpn4IXeMfzRwG8STL+/0jFrMig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-Rx3j4rQ4Na6Khy5QJVeuZg-1; Mon, 18 Nov 2019 13:47:09 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 230A0107ACC4
 for <qemu-devel@nongnu.org>; Mon, 18 Nov 2019 18:47:09 +0000 (UTC)
Received: from gimli.home (ovpn-116-56.phx2.redhat.com [10.3.116.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E388760D7C;
 Mon, 18 Nov 2019 18:47:06 +0000 (UTC)
Subject: [PULL 3/3] vfio: vfio-pci requires EDID
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 18 Nov 2019 11:47:05 -0700
Message-ID: <157410282158.24655.5169563707493153404.stgit@gimli.home>
In-Reply-To: <157410270703.24655.9333886493163056872.stgit@gimli.home>
References: <157410270703.24655.9333886493163056872.stgit@gimli.home>
User-Agent: StGit/0.19-dirty
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: Rx3j4rQ4Na6Khy5QJVeuZg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

hw/vfio/display.c needs the EDID subsystem, select it.

Cc: Alex Williamson <alex.williamson@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/vfio/Kconfig b/hw/vfio/Kconfig
index 34da2a3cfdd9..f0eaa75ce712 100644
--- a/hw/vfio/Kconfig
+++ b/hw/vfio/Kconfig
@@ -6,6 +6,7 @@ config VFIO_PCI
     bool
     default y
     select VFIO
+    select EDID
     depends on LINUX && PCI
=20
 config VFIO_CCW


