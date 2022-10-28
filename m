Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8180611295
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:24:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPKf-0001GN-KZ; Fri, 28 Oct 2022 09:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKS-00010f-AY
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKM-0005H1-Gm
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666963392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CC1nC/KHG+7SzaUWp63YOV+ubgM+z3y+21S9K9cXsQY=;
 b=G6ObgN7845wBmCft+MTR7TOMsahKQxrmB6Dy3lVDFefa98xp598pn/u3s2vnF92j5TdHJi
 7DJgWBw4YpBrdg835Jhc9j4/5nK5YgrkuNrlpYivJ4ZRIAUHiKq059J6DXSIdInxV8rcYj
 8xb66JwdDW2mZZNhH6Ows5vXlRrv0f0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-5i0KYht7NxaYUQmPfbixdQ-1; Fri, 28 Oct 2022 09:23:11 -0400
X-MC-Unique: 5i0KYht7NxaYUQmPfbixdQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30728811E67
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 13:23:11 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 473AD1121319;
 Fri, 28 Oct 2022 13:23:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>
Subject: [PULL 02/21] s390x: step down as general arch maintainer
Date: Fri, 28 Oct 2022 15:22:45 +0200
Message-Id: <20221028132304.829103-3-thuth@redhat.com>
In-Reply-To: <20221028132304.829103-1-thuth@redhat.com>
References: <20221028132304.829103-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Cornelia Huck <cohuck@redhat.com>

I haven't really been working on s390x for some time now, and in
practice, I don't have time for it, either. So let's remove myself
from this entry.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20221010160957.40779-1-cohuck@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 32e495e165..17ff0a0138 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -84,7 +84,6 @@ T: git https://github.com/vivier/qemu.git trivial-patches
 Architecture support
 --------------------
 S390 general architecture support
-M: Cornelia Huck <cohuck@redhat.com>
 M: Thomas Huth <thuth@redhat.com>
 S: Supported
 F: configs/devices/s390x-softmmu/default.mak
@@ -106,7 +105,6 @@ F: docs/system/target-s390x.rst
 F: docs/system/s390x/
 F: tests/migration/s390x/
 K: ^Subject:.*(?i)s390x?
-T: git https://gitlab.com/cohuck/qemu.git s390-next
 L: qemu-s390x@nongnu.org
 
 MIPS general architecture support
-- 
2.31.1


