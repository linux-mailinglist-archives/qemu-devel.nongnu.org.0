Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AB4682A30
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:15:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnd6-0002Yh-Pe; Tue, 31 Jan 2023 05:12:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMncu-0002LA-82
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMncr-0002WM-KE
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675159948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=taCB1s4H2tGurGFExqb/GQ/idVgUQ1SBBYtQH50ces8=;
 b=aL3pDY/WzWzLYezodwznhoT28HhHbSipPXWgNgY42Eh26LIbES62LXE1GF6xWnH8np51ut
 4sPX02gOhBuBXY/7D5bqK+OTn01SSGRIwn0W/ZEtf6yXxXdlVAWu6R1D2XWagCLbfxfZcr
 gUk2aRufzHzRq/lEtdKc6JKswbfyFds=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-Vanrbcx-PZikbdN-YYDlAA-1; Tue, 31 Jan 2023 05:12:27 -0500
X-MC-Unique: Vanrbcx-PZikbdN-YYDlAA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6B92885622;
 Tue, 31 Jan 2023 10:12:26 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2568C15BAD;
 Tue, 31 Jan 2023 10:12:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Wenchao Wang <wenchao.wang@intel.com>,
	Hang Yuan <hang.yuan@intel.com>
Subject: [PULL 15/27] MAINTAINERS: Abort HAXM maintenance
Date: Tue, 31 Jan 2023 11:11:53 +0100
Message-Id: <20230131101205.1499867-16-thuth@redhat.com>
In-Reply-To: <20230131101205.1499867-1-thuth@redhat.com>
References: <20230131101205.1499867-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

From: Wenchao Wang <wenchao.wang@intel.com>

Abort the maintenance of Guest CPU Cores (HAXM).

* Clean up the maintainer list of X86 HAXM CPUs
* Remove the web page URL and the mailing list
* Change the status to Orphan

Reviewed-by: Hang Yuan <hang.yuan@intel.com>
Signed-off-by: Wenchao Wang <wenchao.wang@intel.com>
Message-Id: <DM6PR11MB40903B55C23D5140E5BEF17687C49@DM6PR11MB4090.namprd11.prod.outlook.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c581c11a64..307a9d5d4c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -500,10 +500,7 @@ F: stubs/xen-hw-stub.c
 Guest CPU Cores (HAXM)
 ---------------------
 X86 HAXM CPUs
-M: Wenchao Wang <wenchao.wang@intel.com>
-L: haxm-team@intel.com
-W: https://github.com/intel/haxm/issues
-S: Maintained
+S: Orphan
 F: accel/stubs/hax-stub.c
 F: include/sysemu/hax.h
 F: target/i386/hax/
-- 
2.31.1


