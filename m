Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E4D1316A3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 18:20:40 +0100 (CET)
Received: from localhost ([::1]:55562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioW3T-0004h7-OQ
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 12:20:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51659)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ioW2L-000416-FD
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 12:19:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ioW2K-0003LG-6v
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 12:19:29 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:38106
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ioW2K-0003KP-31
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 12:19:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578331166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WdE/mMa5DL4tuKPiXYMZvaAFUILQ4E3aQN8rlBxNvVk=;
 b=jJlrdArtVsJf0YxiajsjFcossYAdSns1hRryqjY0ieZtVGAge+d7K5x18LjlyILG7SBt8N
 9RwgcqtumxWvTDrMrsA6KPkj2YabPDlJdFCMCCiQpIWBnJNFiUc7SmxvfKY/HODiS3nOzD
 TFVqfaGQoHTPx//Ht/Las30ousy0O8I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-c4Vtb6tRMPGTvbPjRmO7zA-1; Mon, 06 Jan 2020 12:19:23 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C8C4800D54
 for <qemu-devel@nongnu.org>; Mon,  6 Jan 2020 17:19:22 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-53.brq.redhat.com [10.40.204.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03049858B2;
 Mon,  6 Jan 2020 17:19:15 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/timer/Kconfig: Intel 8254 PIT depends of ISA bus
Date: Mon,  6 Jan 2020 18:19:12 +0100
Message-Id: <20200106171912.16523-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: c4Vtb6tRMPGTvbPjRmO7zA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since i8254_common.c calls isa_register_ioport() from "hw/isa/isa.h"
we can not select it when ISA_BUS is disabled. Add a 'depends on'
clause.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/timer/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
index a990f9fe35..59b3f44d69 100644
--- a/hw/timer/Kconfig
+++ b/hw/timer/Kconfig
@@ -15,6 +15,7 @@ config HPET
=20
 config I8254
     bool
+    depends on ISA_BUS
=20
 config ALTERA_TIMER
     bool
--=20
2.21.1


