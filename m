Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 708105FA205
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 18:32:39 +0200 (CEST)
Received: from localhost ([::1]:55558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohvhm-000360-E3
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 12:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ohvM2-0005DF-MJ
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 12:10:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ohvLy-0005x8-14
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 12:10:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665418203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AdeCDBhI2rPU/1X38lxnmAiUp4HyZ5c4cvoyJnD0Dpw=;
 b=fKk9449sss6MWorZK1d3O2Hpg7oO/+K3OSXByDPWmp2SgWk9UKBcPq8YiBKeFyphxrqrye
 CnaOUrNBwEWryxPTjTgOoZFCmatgpbsY+7Qg8FwNMs1nhbfu1YZgSv8rcQivUu4Mr2piXA
 NcdVht22sfI8EiImDrvUy3sk3NLa7mk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-qYvJKN9qNHqVWagSFNT5XQ-1; Mon, 10 Oct 2022 12:10:01 -0400
X-MC-Unique: qYvJKN9qNHqVWagSFNT5XQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 419AE29AB452;
 Mon, 10 Oct 2022 16:10:01 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.39.193.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 754CEC68E4F;
 Mon, 10 Oct 2022 16:10:00 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH] s390x: step down as general arch maintainer
Date: Mon, 10 Oct 2022 18:09:57 +0200
Message-Id: <20221010160957.40779-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I haven't really been working on s390x for some time now, and in
practice, I don't have time for it, either. So let's remove myself
from this entry.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e1530b51a2f3..d7f40605d1da 100644
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
2.37.3


