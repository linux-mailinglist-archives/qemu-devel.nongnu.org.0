Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6446A14A217
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 11:38:40 +0100 (CET)
Received: from localhost ([::1]:42630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iw1mw-00043v-P8
	for lists+qemu-devel@lfdr.de; Mon, 27 Jan 2020 05:38:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42141)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1iw1lR-0002PB-DT
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 05:37:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1iw1lO-0002W0-Pv
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 05:37:04 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30679
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1iw1lN-0002TC-ER
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 05:37:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580121420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sFkjv3btebeOLT0oNDEIwq9+w4CTYhbKRM0g2bdv1d0=;
 b=BqmxnWVE+T60zrxgXX66eF3Za5YJgZHLjzZ6hhOnyy5pR6fVPc9J4wWH052xsBB485E3j/
 n7Wvy5ohVJ8tgy2Sn40+gumvcLq6cuRgGMGUiNr/8Tq3KREaw+kooBzUaGf6/ubToBTnFC
 O97cAdoqCBJLG+9RRSRJZBlPS+CQapU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-SeCwTx_9PtmIIzixYrp3MA-1; Mon, 27 Jan 2020 05:36:58 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30B63800D41;
 Mon, 27 Jan 2020 10:36:57 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DC59F6C1;
 Mon, 27 Jan 2020 10:36:54 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/13] usb/dev-storage: remove unused include
Date: Mon, 27 Jan 2020 12:36:35 +0200
Message-Id: <20200127103647.17761-2-mlevitsk@redhat.com>
In-Reply-To: <20200127103647.17761-1-mlevitsk@redhat.com>
References: <20200127103647.17761-1-mlevitsk@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: SeCwTx_9PtmIIzixYrp3MA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 hw/usb/dev-storage.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
index 8545193488..50d12244ab 100644
--- a/hw/usb/dev-storage.c
+++ b/hw/usb/dev-storage.c
@@ -19,7 +19,6 @@
 #include "hw/scsi/scsi.h"
 #include "ui/console.h"
 #include "migration/vmstate.h"
-#include "monitor/monitor.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/block-backend.h"
 #include "qapi/visitor.h"
--=20
2.17.2


