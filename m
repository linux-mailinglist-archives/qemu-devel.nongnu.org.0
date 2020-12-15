Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5712DB01A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:32:24 +0100 (CET)
Received: from localhost ([::1]:37892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCJL-0006rj-N8
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:32:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpC93-0008T2-DW
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpC8z-0002S6-8Y
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:21:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608045698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zblTDPD6j9yQIXarY+q5fARVngRj8I3IqoqBwU5PYJo=;
 b=b2II7R4MBnpNW6m3M6b9MAAdoRe+3cX9nyKYPFfHog0+aEpKWWMW2AgZ7nP78lEMZp3l/m
 hE21uQHzxxJy7pwLsZtlgYCafPxWI8Pa5VCsGsc3EPNc6U8KFCfz6ZmgfbL7p+m5kc9gXM
 edmfdX1lAP2nIiX/YQ//qcf+atg5mQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-Jzk8hWOVOfaeJHX9pAwR2Q-1; Tue, 15 Dec 2020 10:21:34 -0500
X-MC-Unique: Jzk8hWOVOfaeJHX9pAwR2Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D2748030D8;
 Tue, 15 Dec 2020 15:20:49 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 233D85D9D7;
 Tue, 15 Dec 2020 15:20:48 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 25/25] MAINTAINERS: Update my git repository URLs
Date: Tue, 15 Dec 2020 10:19:42 -0500
Message-Id: <20201215151942.3125089-26-ehabkost@redhat.com>
In-Reply-To: <20201215151942.3125089-1-ehabkost@redhat.com>
References: <20201215151942.3125089-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm moving my git repositories to gitlab.com, update MAINTAINERS
to point to the correct URL.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20201214212032.2999853-1-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4663c143c3..6714257cf7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -344,7 +344,7 @@ F: tests/tcg/x86_64/
 F: hw/i386/
 F: disas/i386.c
 F: docs/system/cpu-models-x86.rst.inc
-T: git https://github.com/ehabkost/qemu.git x86-next
+T: git https://gitlab.com/ehabkost/qemu.git x86-next
 
 Xtensa TCG CPUs
 M: Max Filippov <jcmvbkbc@gmail.com>
@@ -1557,7 +1557,7 @@ F: include/hw/boards.h
 F: include/hw/core/cpu.h
 F: include/hw/cpu/cluster.h
 F: include/sysemu/numa.h
-T: git https://github.com/ehabkost/qemu.git machine-next
+T: git https://gitlab.com/ehabkost/qemu.git machine-next
 
 Xtensa Machines
 ---------------
@@ -2412,7 +2412,7 @@ M: Igor Mammedov <imammedo@redhat.com>
 S: Maintained
 F: backends/hostmem*.c
 F: include/sysemu/hostmem.h
-T: git https://github.com/ehabkost/qemu.git machine-next
+T: git https://gitlab.com/ehabkost/qemu.git machine-next
 
 Cryptodev Backends
 M: Gonglei <arei.gonglei@huawei.com>
-- 
2.28.0


