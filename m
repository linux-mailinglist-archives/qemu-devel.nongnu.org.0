Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FF72C0D94
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 15:35:47 +0100 (CET)
Received: from localhost ([::1]:60594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khCwU-0005h1-SR
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 09:35:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khCdn-0005nl-2g
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:16:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khCdl-0008Uf-Cx
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:16:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606140984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rxAzQW7QJ8ZspnZy7D74NFQ+Bvg+ZhD+1qJeFzLXxlw=;
 b=Su+buW03xcz4zNWOwlPA2PX8hMHCJC0pVI9oR4kdTH0EJUTsqxfso8lkWVY16XQ22Qw6Pc
 3grpDgApPKqNIK+Zbg3QcqEGbVcM1s0TwBFs850KyOBfS40UnywDQsY15Z+7BzuBFk9ptH
 JGE0JallEYB45VjDjJR/gq8kzXwYMxo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-_8uudI7PMwaNdytvPb4kng-1; Mon, 23 Nov 2020 09:14:59 -0500
X-MC-Unique: _8uudI7PMwaNdytvPb4kng-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55B18805BEA
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 14:14:58 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1864160C13
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 14:14:58 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 34/36] vl: remove serial_max_hds
Date: Mon, 23 Nov 2020 09:14:33 -0500
Message-Id: <20201123141435.2726558-35-pbonzini@redhat.com>
In-Reply-To: <20201123141435.2726558-1-pbonzini@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

serial_hd(i) is NULL if and only if i >= serial_max_hds().  Test
serial_hd(i) instead of bounding the loop at serial_max_hds(),
thus removing one more function that vl.c is expected to export.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/ppc/spapr.c          | 6 ++----
 include/sysemu/sysemu.h | 4 ----
 softmmu/vl.c            | 5 -----
 3 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 049efa0bbf..b7e0894019 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2878,10 +2878,8 @@ static void spapr_machine_init(MachineState *machine)
     /* Set up VIO bus */
     spapr->vio_bus = spapr_vio_bus_init();
 
-    for (i = 0; i < serial_max_hds(); i++) {
-        if (serial_hd(i)) {
-            spapr_vty_create(spapr->vio_bus, serial_hd(i));
-        }
+    for (i = 0; serial_hd(i); i++) {
+        spapr_vty_create(spapr->vio_bus, serial_hd(i));
     }
 
     /* We always have at least the nvram device on VIO */
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 3dac3229ec..0e7b405d22 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -74,10 +74,6 @@ void hmp_pcie_aer_inject_error(Monitor *mon, const QDict *qdict);
 
 /* Return the Chardev for serial port i, or NULL if none */
 Chardev *serial_hd(int i);
-/* return the number of serial ports defined by the user. serial_hd(i)
- * will always return NULL for any i which is greater than or equal to this.
- */
-int serial_max_hds(void);
 
 /* parallel ports */
 
diff --git a/softmmu/vl.c b/softmmu/vl.c
index fce15c249a..d76f87028d 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1439,11 +1439,6 @@ Chardev *serial_hd(int i)
     return NULL;
 }
 
-int serial_max_hds(void)
-{
-    return num_serial_hds;
-}
-
 static int parallel_parse(const char *devname)
 {
     static int index = 0;
-- 
2.26.2



