Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D68606524
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:56:04 +0200 (CEST)
Received: from localhost ([::1]:50786 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXtr-0000LH-Ba
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:56:03 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXsi-0001fa-Ln
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1olUIO-0008A2-63
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:05:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1olUII-0005vk-A4
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:05:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666267501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=K42cM0qqMwxHTFL6wcvLlfAtW9sGytJc8XCKCAn7EBk=;
 b=Cqy4WPOhSnEhF5JuhLeOF4U72eNy4a97fxhc5aBmSgcsVzooKt9VLvEjo8eYwq3CIQ8P61
 PxcBHK+vF4hUbQ/PGvQqtio5lNkDF3XSMJ3DPOTQLWtjPBO8s5uFD6YmU3MjkrDqnBe1Oe
 6QHGFPSHK3ZABmwVFcujuOhtojukaeI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-LGJrSaP0Pf-qzqZ5PJUjXA-1; Thu, 20 Oct 2022 08:04:59 -0400
X-MC-Unique: LGJrSaP0Pf-qzqZ5PJUjXA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3F46185A79C
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 12:04:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C70AC15BA5;
 Thu, 20 Oct 2022 12:04:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 65E8B21E6808; Thu, 20 Oct 2022 14:04:58 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH] MAINTAINERS: Add qapi/virtio.json to section "virtio"
Date: Thu, 20 Oct 2022 14:04:58 +0200
Message-Id: <20221020120458.80709-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e3d5b7e09c..f2eff9ee85 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2000,6 +2000,7 @@ S: Supported
 F: hw/*/virtio*
 F: hw/virtio/Makefile.objs
 F: hw/virtio/trace-events
+F: qapi/virtio.json
 F: net/vhost-user.c
 F: include/hw/virtio/
 
-- 
2.37.3


