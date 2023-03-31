Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0486D238B
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 17:05:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piGIo-0007LW-DB; Fri, 31 Mar 2023 11:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1piGIf-0007LC-Nu
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 11:04:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1piGIe-0003WL-A2
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 11:04:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680275057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8qnPjZFLAy75TlFx58UOIcBVBBsrsD/UC4J7M+vE1qg=;
 b=WfdpBwjrTaOLzgrv9FjBEj/FBz+RdZR9YK35x4wzLSqGorKnF2idTeLaMkexC4kzCZ6KU4
 x8ZtRxIl5mkJdvr+tOM442tB4rbTtSIeS02NB4cyuYrON67rNk3WS+DaeombvGmkYKssvF
 Vjw7kjdyHuROnNmvbDpg1q4E3Crv5T4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-21HTh3snPQm3TgrlQC_8tA-1; Fri, 31 Mar 2023 11:04:15 -0400
X-MC-Unique: 21HTh3snPQm3TgrlQC_8tA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CCD71C189B8
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 15:04:14 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46AF5112131B;
 Fri, 31 Mar 2023 15:04:13 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH] =?UTF-8?q?MAINTAINERS:=20Add=20Eugenio=20P=C3=A9rez=20as?=
 =?UTF-8?q?=20vhost-shadow-virtqueue=20reviewer?=
Date: Fri, 31 Mar 2023 17:04:10 +0200
Message-Id: <20230331150410.2627214-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

I'd like to be notified on SVQ patches and review them.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ef45b5e71e..986119e8ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2061,6 +2061,10 @@ F: backends/vhost-user.c
 F: include/sysemu/vhost-user-backend.h
 F: subprojects/libvhost-user/
 
+vhost-shadow-virtqueue
+R: Eugenio Pérez <eperezma@redhat.com>
+F: hw/virtio/vhost-shadow-virtqueue.*
+
 virtio
 M: Michael S. Tsirkin <mst@redhat.com>
 S: Supported
-- 
2.31.1


