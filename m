Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB8E2DA277
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 22:22:00 +0100 (CET)
Received: from localhost ([::1]:50958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kovI8-0004wP-2B
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 16:22:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kovGr-0004Tl-Fg
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 16:20:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kovGp-0005UN-4o
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 16:20:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607980837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vDPanOGkwpIsSvIxaHKau/zy+ML2we8zZ5r2F4I6CrE=;
 b=AZAVq85PuLAtumm8+DSGHuD3YUbHHhiVHM3sdmq/aws8qnSQHHR/FbRxVGzGU6KERqxD36
 6VCu/WUVXBKEscTeF8TTbtbwWXHT15Iia0xP8WBWKPki2FhjP29+6XFMJVi3dF3JZcAuUk
 6kPSgHe0EI+k4/maTZ7dmiexkLgBICc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-VUvBTaCpOR2flLmKW4m7nQ-1; Mon, 14 Dec 2020 16:20:35 -0500
X-MC-Unique: VUvBTaCpOR2flLmKW4m7nQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AFE61015C82
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 21:20:34 +0000 (UTC)
Received: from localhost (ovpn-116-160.rdu2.redhat.com [10.10.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D88D2BCE6;
 Mon, 14 Dec 2020 21:20:33 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: Update my git repository URLs
Date: Mon, 14 Dec 2020 16:20:32 -0500
Message-Id: <20201214212032.2999853-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm moving my git repositories to gitlab.com, update MAINTAINERS
to point to the correct URL.

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


