Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D963368C5B6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 19:26:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP6Bn-0001uE-HD; Mon, 06 Feb 2023 13:26:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pP6Bd-0001pV-MX
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:25:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pP6BZ-0001CJ-Pu
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:25:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675707947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=iL5SfASu0qjk5DzDdE9ca6DCEViV26jy212tqL09KMk=;
 b=g6ADoSPE+muepW49JNz9mixJ+eS2B3qw9yMR74aBu2q4KdJOHzXEgV8w+duONKjCx337AH
 KrNjMHgPExKCwTU9FrkI3K4nFEUdFMt90XIGvQYjNjYUaFPueplnm9WKQMdqNNBemb3kSP
 RqGOEidCjyxSAT3mE+pEfzJJ2kUfOmY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-MfmAxIcOOViPEDdpLIjeQA-1; Mon, 06 Feb 2023 13:25:46 -0500
X-MC-Unique: MfmAxIcOOViPEDdpLIjeQA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAA1918A6463;
 Mon,  6 Feb 2023 18:25:45 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3E722026D37;
 Mon,  6 Feb 2023 18:25:44 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Lev Kujawski <lkujaw@mailbox.org>, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH] MAINTAINERS: Mark IDE and Floppy as "Odd Fixes"
Date: Mon,  6 Feb 2023 13:25:44 -0500
Message-Id: <20230206182544.711117-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

I have not been able to give these devices the love they need for a
while now. Update the maintainers file to reflect the truth of the
matter.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa10ecaeb94..97d0f2fdc8f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1784,7 +1784,7 @@ F: hw/misc/edu.c
 IDE
 M: John Snow <jsnow@redhat.com>
 L: qemu-block@nongnu.org
-S: Supported
+S: Odd Fixes
 F: include/hw/ide.h
 F: include/hw/ide/
 F: hw/ide/
@@ -1809,7 +1809,7 @@ T: git https://github.com/cminyard/qemu.git master-ipmi-rebase
 Floppy
 M: John Snow <jsnow@redhat.com>
 L: qemu-block@nongnu.org
-S: Supported
+S: Odd Fixes
 F: hw/block/fdc.c
 F: hw/block/fdc-internal.h
 F: hw/block/fdc-isa.c
-- 
2.39.0


