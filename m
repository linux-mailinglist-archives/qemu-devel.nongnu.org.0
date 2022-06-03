Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1201E53C5EB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 09:20:44 +0200 (CEST)
Received: from localhost ([::1]:54008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx1bv-0004Es-28
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 03:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nx1HH-0005eG-Mt
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 02:59:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nx1HG-0003J6-4s
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 02:59:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654239561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y7pc7qYDrs4ciBs9EJXEeDWtHxOAmKa2lNkD3Gm/0J8=;
 b=Eb/Z62W+91Ntym80RKmDcNraLgi/kFrmMUWxjJrLVwH60rXQgSGzMbPx6SEhNnfzSnNTni
 FPA2tgTm18UBbaM83Nm80uTwc/S5dmYwOp1CTvo4n6T4nh+du8Y9f7JtiGbwjh+n2YG0Vc
 P5UEICtgokitE/hJ9Au/wSrdMEW/Pfc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-Ndzi96cWNrO19YGPanhBwQ-1; Fri, 03 Jun 2022 02:59:18 -0400
X-MC-Unique: Ndzi96cWNrO19YGPanhBwQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C20D802809;
 Fri,  3 Jun 2022 06:59:18 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AE992166B26;
 Fri,  3 Jun 2022 06:59:15 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-s390x@nongnu.org, Eric Farman <farman@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PULL 04/12] MAINTAINERS: Update s390 vhost entries
Date: Fri,  3 Jun 2022 08:58:57 +0200
Message-Id: <20220603065905.23805-5-thuth@redhat.com>
In-Reply-To: <20220603065905.23805-1-thuth@redhat.com>
References: <20220603065905.23805-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Eric Farman <farman@linux.ibm.com>

Commit 7a523d96a0 ("virtio-ccw: move vhost_ccw_scsi to a separate file")
introduced a new file hw/s390x/vhost-scsi-ccw.c, which received a
couple comments [1][2] to update MAINTAINERS that were missed.

Fix that by making the vhost CCW entries a wildcard.

[1] https://lore.kernel.org/r/d8d2bbd5021076bdba444d31a6da74f507baede3.camel@linux.ibm.com/
[2] https://lore.kernel.org/r/87k0c4gb9f.fsf@redhat.com/

Signed-off-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20220525145814.2750501-1-farman@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 00dc4a8ecb..7b7d3f9c02 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2018,8 +2018,7 @@ M: Halil Pasic <pasic@linux.ibm.com>
 M: Eric Farman <farman@linux.ibm.com>
 S: Supported
 F: hw/s390x/virtio-ccw*.[hc]
-F: hw/s390x/vhost-vsock-ccw.c
-F: hw/s390x/vhost-user-fs-ccw.c
+F: hw/s390x/vhost-*-ccw.c
 T: git https://gitlab.com/cohuck/qemu.git s390-next
 T: git https://github.com/borntraeger/qemu.git s390-next
 L: qemu-s390x@nongnu.org
-- 
2.31.1


