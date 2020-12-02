Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BCE2CB70D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:27:53 +0100 (CET)
Received: from localhost ([::1]:58522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNUO-0006s1-Aa
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:27:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCE-0002fA-Qt
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNC8-0003bh-5g
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Q/MQ+Ntyc6dcfpNs+OQsVO2nBRfCw5LnAgTVEhalio=;
 b=QLSyvNVZBdEOLPwyi6zwCYfi5TTRdUF2H8snkQb+/1JrZ3lvV3CIhpJe3RwCNEgHo04DXG
 CcIx86XZOHWIEckl1zJg8aZTIGoe1dqR+8zIeCPEiIJA/fG/tne9CrksGvSlLFRqj64UNZ
 ux+7py9ucbTlyK/0zXNwCOIhPxrZmRE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-PmOlTWvmPWuMbNh5NLv1yw-1; Wed, 02 Dec 2020 03:08:57 -0500
X-MC-Unique: PmOlTWvmPWuMbNh5NLv1yw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95190803651
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:08:56 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 617C45D9C6
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:08:56 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 016/113] hw/ssi: Update coding style to make checkpatch.pl happy
Date: Wed,  2 Dec 2020 03:07:12 -0500
Message-Id: <20201202080849.4125477-17-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

To make the next commit easier to review, clean this code first.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201012124955.3409127-3-f4bug@amsat.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/hw/ssi/ssi.h | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
index fe3028c39d..c15548425a 100644
--- a/include/hw/ssi/ssi.h
+++ b/include/hw/ssi/ssi.h
@@ -1,12 +1,14 @@
 /* QEMU Synchronous Serial Interface support.  */
 
-/* In principle SSI is a point-point interface.  As such the qemu
-   implementation has a single slave device on a "bus".
-   However it is fairly common for boards to have multiple slaves
-   connected to a single master, and select devices with an external
-   chip select.  This is implemented in qemu by having an explicit mux device.
-   It is assumed that master and slave are both using the same transfer width.
-   */
+/*
+ * In principle SSI is a point-point interface.  As such the qemu
+ * implementation has a single slave device on a "bus".
+ * However it is fairly common for boards to have multiple slaves
+ * connected to a single master, and select devices with an external
+ * chip select.  This is implemented in qemu by having an explicit mux device.
+ * It is assumed that master and slave are both using the same transfer
+ * width.
+ */
 
 #ifndef QEMU_SSI_H
 #define QEMU_SSI_H
-- 
2.26.2



