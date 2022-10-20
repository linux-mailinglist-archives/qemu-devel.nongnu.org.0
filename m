Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 885B060597B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 10:17:03 +0200 (CEST)
Received: from localhost ([::1]:50410 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olQjd-0005Gt-TX
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 04:17:01 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olQjc-00054h-Kb
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 04:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olQUG-0003o7-EH
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 04:01:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olQUE-0006Lz-PZ
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 04:01:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666252864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TRFx0hyWiZOQ683oELjOdZqK6M2eDKeo+dzEoCEfN8s=;
 b=fGDSWSlt4ItZVwXm83wN/Kw5NF/J6R6XGyzr0NiVpOlA5XDD8cHFD/taeMV1bhrp5KZ62H
 xWHqIyvQeHghmcleI64uaoGIVnGtV7TLkBBtmJvIHExDqY5mlCFT/fqhWB9q0l6K50rnGD
 lF2nR1TgC9vdRz+M+hjwBA5Q/7JiXHQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-LvmbZWVeMhOaAUa6KRT-Ew-1; Thu, 20 Oct 2022 04:01:03 -0400
X-MC-Unique: LvmbZWVeMhOaAUa6KRT-Ew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B2003C0F7E1
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 08:01:02 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC46D40C6EC2;
 Thu, 20 Oct 2022 08:01:01 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	Jason Wang <jasowang@redhat.com>
Subject: [PATCH] vdpa: Delete duplicated vdpa_feature_bits entry
Date: Thu, 20 Oct 2022 10:00:58 +0200
Message-Id: <20221020080058.318454-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This entry was duplicated on referenced commit. Removing it.

Fixes: 402378407dbd ("vhost-vdpa: multiqueue support")
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 4bc3fd01a8..eebf29f5c1 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -63,7 +63,6 @@ const int vdpa_feature_bits[] = {
     VIRTIO_NET_F_CTRL_RX,
     VIRTIO_NET_F_CTRL_RX_EXTRA,
     VIRTIO_NET_F_CTRL_VLAN,
-    VIRTIO_NET_F_GUEST_ANNOUNCE,
     VIRTIO_NET_F_CTRL_MAC_ADDR,
     VIRTIO_NET_F_RSS,
     VIRTIO_NET_F_MQ,
-- 
2.31.1


