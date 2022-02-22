Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CB84BF5CB
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 11:28:26 +0100 (CET)
Received: from localhost ([::1]:33512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMSPA-0001aL-39
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 05:28:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nMSMF-0000jG-Jz
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 05:25:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nMSMA-0005cO-Jv
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 05:25:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645525514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/IhipV6ZbjcIGgzXcu6Rqm19F6SRY97NYc55X0N+92I=;
 b=UfnvwoHplUB8sI4OYEaNHvbSBcsg7ld1pD+Mp1BuU1zGkTHwfcNAKr5LFxTaX4l6UU6Y4o
 whkqNoP6e3e7CTeJcbB0U6pEiCim8ne5E4CiEJCNTkCB2waNF0bWKXDHRIe+AWxFrv90aJ
 zxkJ25oC9TL2ENFgQaai4r6DRXdR4Qc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-ssZiXX9_OJaGwM9rPjX-mA-1; Tue, 22 Feb 2022 05:25:12 -0500
X-MC-Unique: ssZiXX9_OJaGwM9rPjX-mA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 165EB1006AA6
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 10:25:12 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DD542B5B4;
 Tue, 22 Feb 2022 10:25:06 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] pci: drop COMPAT_PROP_PCP for 2.0 machine types
Date: Tue, 22 Feb 2022 05:25:04 -0500
Message-Id: <20220222102504.3080104-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

COMPAT_PROP_PCP is 'on' by default and it's used for turning
off PCP capability on PCIe slots for 2.0 machine types using
compat machinery.
Drop not needed compat glue as Q35 supports migration starting
from 2.4 machine types.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/pc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c8696ac01e..f8cb6057d5 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -318,8 +318,6 @@ GlobalProperty pc_compat_2_0[] = {
     { "pci-serial-4x", "prog_if", "0" },
     { "virtio-net-pci", "guest_announce", "off" },
     { "ICH9-LPC", "memory-hotplug-support", "off" },
-    { "xio3130-downstream", COMPAT_PROP_PCP, "off" },
-    { "ioh3420", COMPAT_PROP_PCP, "off" },
 };
 const size_t pc_compat_2_0_len = G_N_ELEMENTS(pc_compat_2_0);
 
-- 
2.31.1


