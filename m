Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3216353B60C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 11:28:26 +0200 (CEST)
Received: from localhost ([::1]:48264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwh7w-0004rP-R3
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 05:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nwh3b-0003ds-K9
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 05:23:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nwh3Y-0002Y0-35
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 05:23:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654161824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y8szj85s1SG/j9p/wU/uqh0V7wqyvMqgeNc9TrZ5tVE=;
 b=eAM4R5YsJ4Q4eEETMBRe1ws+2hRPwMc3WtLsaAkToEkJ2ckHVyX5X6zRKPkoCUfOj7CVui
 EejqOochbjl6yo6tTcYANEs+fMO2xYXjUm7UzuqE7jXoSltVVxlWJrPVQ/pUhY2QghWLjT
 4iiXeEHva6/SKKfHcP8mv/JkduA6wKE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-IsDk6mKuOvSAw_HAo_0TgQ-1; Thu, 02 Jun 2022 05:23:42 -0400
X-MC-Unique: IsDk6mKuOvSAw_HAo_0TgQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7962385A5BC;
 Thu,  2 Jun 2022 09:23:42 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C4E21121314;
 Thu,  2 Jun 2022 09:23:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Colin Xu <colin.xu@intel.com>, Wenchao Wang <wenchao.wang@intel.com>,
 haxm-team@intel.com
Subject: [PATCH] Remove Colin Xu's mail address from QEMU's MAINTAINERS files
Date: Thu,  2 Jun 2022 11:23:37 +0200
Message-Id: <20220602092337.235765-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Colin's address bounces - seems like he left Intel. Thus remove
the entry from MAINTAINERS now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 00dc4a8ecb..dbf328cc94 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -488,7 +488,6 @@ Guest CPU Cores (HAXM)
 ---------------------
 X86 HAXM CPUs
 M: Wenchao Wang <wenchao.wang@intel.com>
-M: Colin Xu <colin.xu@intel.com>
 L: haxm-team@intel.com
 W: https://github.com/intel/haxm/issues
 S: Maintained
-- 
2.31.1


