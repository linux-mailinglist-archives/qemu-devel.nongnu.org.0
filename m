Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 130D51468A7
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 14:05:27 +0100 (CET)
Received: from localhost ([::1]:56724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iucAn-0007Md-JO
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 08:05:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40267)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iub8o-00021O-45
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:59:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iub8m-0004yu-4s
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:59:17 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27033
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iub8m-0004xg-0c
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:59:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579780754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OItQPinroiBJ0nrS4PUsgR+xJPIxf1WyoHv3BQuuxNE=;
 b=RuCT8n0WRuHKVd/WaBQ/iAdNtppaWwetqPkLkWWTIiPIZjPspIKXa417ENBKjxfGQo9p2k
 nMVq+J29M6zhpHVFoUwUalQpoa2zQW/Tdyizd8j6zF06IVPB4JloKgVB2RaghmlEHENSXl
 YRcw5ZDhhxtNtSG938EcUTriU6/sS4U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-UROcihecMai7hJPseZzZow-1; Thu, 23 Jan 2020 06:59:13 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91AFE100551A
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 11:59:12 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF1271CB;
 Thu, 23 Jan 2020 11:59:11 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 021/111] virtiofsd: get/set features callbacks
Date: Thu, 23 Jan 2020 11:57:11 +0000
Message-Id: <20200123115841.138849-22-dgilbert@redhat.com>
In-Reply-To: <20200123115841.138849-1-dgilbert@redhat.com>
References: <20200123115841.138849-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: UROcihecMai7hJPseZzZow-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Add the get/set features callbacks.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 1928a2025c..4819e56568 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -46,6 +46,17 @@ struct virtio_fs_config {
     uint32_t num_queues;
 };
=20
+/* Callback from libvhost-user */
+static uint64_t fv_get_features(VuDev *dev)
+{
+    return 1ULL << VIRTIO_F_VERSION_1;
+}
+
+/* Callback from libvhost-user */
+static void fv_set_features(VuDev *dev, uint64_t features)
+{
+}
+
 /*
  * Callback from libvhost-user if there's a new fd we're supposed to liste=
n
  * to, typically a queue kick?
@@ -78,7 +89,9 @@ static bool fv_queue_order(VuDev *dev, int qidx)
 }
=20
 static const VuDevIface fv_iface =3D {
-    /* TODO: Add other callbacks */
+    .get_features =3D fv_get_features,
+    .set_features =3D fv_set_features,
+
     .queue_is_processed_in_order =3D fv_queue_order,
 };
=20
--=20
2.24.1


