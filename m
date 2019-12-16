Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 887B8120737
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 14:30:52 +0100 (CET)
Received: from localhost ([::1]:53744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igqSY-0003XV-JN
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 08:30:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47394)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1igqRe-0002xV-I6
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 08:29:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1igqRd-0003Ex-5Z
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 08:29:54 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20658
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1igqRd-0003DH-2S
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 08:29:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576502992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3kaJcfh0spaMxjl6LwdbDaL7zBIZf7w01TlpxB0raCQ=;
 b=C7SJOCddmkPo7/QZnvLD70TvFb+3OwJ+gHIdEDLQgq/3BRReeq2jcsSa39RKOb4zK0HWvt
 qXnJcnYCMkA6645MPdduOh32dRsdD4b38t5vNdncuYaHNei5PA/6xCrdnSw3gLM2K6cuTY
 K6QqTcXFU8yS4UEMm8XLgBPB/lc7XsA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-_r_D6h3EN-eHUwkt-LGveQ-1; Mon, 16 Dec 2019 08:29:48 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6DCD100DF2F;
 Mon, 16 Dec 2019 13:29:47 +0000 (UTC)
Received: from thuth.com (ovpn-117-164.ams2.redhat.com [10.36.117.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 55A3126343;
 Mon, 16 Dec 2019 13:29:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Michael Roth <mdroth@linux.vnet.ibm.com>,
	qemu-devel@nongnu.org
Subject: [PATCH] qemu-doc: Remove the unused "Guest Agent" node
Date: Mon, 16 Dec 2019 14:29:41 +0100
Message-Id: <20191216132941.25729-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: _r_D6h3EN-eHUwkt-LGveQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The node has been removed from the texi file some months ago, so we
should remove it from the menu section, too.

Fixes: 27a296fce982 ("qemu-ga: Convert invocation documentation to rST")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-doc.texi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 3ddf5c0a68..4b62b23264 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -38,7 +38,6 @@
 * Introduction::
 * QEMU PC System emulator::
 * QEMU System emulator for non PC targets::
-* QEMU Guest Agent::
 * QEMU User space emulator::
 * System requirements::
 * Security::
--=20
2.18.1


