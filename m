Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 277891468F0
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 14:22:46 +0100 (CET)
Received: from localhost ([::1]:56956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iucRY-0004SX-Il
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 08:22:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40522)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iub94-0002OY-KM
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:59:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iub93-0005Ac-85
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:59:34 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:47260
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iub93-0005AF-4k
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:59:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579780772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nf43hP0IRcmDWjQcwTYkWCN3u56GRcr1BZ/k+vIuitE=;
 b=M9JSbcG4//qgd8apgSAtgdwhXcxFCiSzCEGvKlQXWWIJNiu5mJ+Qm0Cvw1n7ZGRYoTF7bk
 +MTILOsgB2+AhWxH1jctyYNBl6fVrhZqYxjU7Gp7c4s1OLE7bDEiYqpsNqmUAMJuMVloqB
 YIyDL0iYg5wvKqBOQSti2SQEdsyV+80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-GULGXatpPziXUr-7PGe29A-1; Thu, 23 Jan 2020 06:59:28 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AE78DB6D
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 11:59:27 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8CBB1CB;
 Thu, 23 Jan 2020 11:59:26 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 033/111] virtiofs: Add maintainers entry
Date: Thu, 23 Jan 2020 11:57:23 +0000
Message-Id: <20200123115841.138849-34-dgilbert@redhat.com>
In-Reply-To: <20200123115841.138849-1-dgilbert@redhat.com>
References: <20200123115841.138849-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: GULGXatpPziXUr-7PGe29A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.81
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

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2c768ed3d8..075fdab372 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1595,6 +1595,14 @@ T: git https://github.com/cohuck/qemu.git s390-next
 T: git https://github.com/borntraeger/qemu.git s390-next
 L: qemu-s390x@nongnu.org
=20
+virtiofs
+M: Dr. David Alan Gilbert <dgilbert@redhat.com>
+M: Stefan Hajnoczi <stefanha@redhat.com>
+S: Supported
+F: tools/virtiofsd/*
+F: hw/virtio/vhost-user-fs*
+F: include/hw/virtio/vhost-user-fs.h
+
 virtio-input
 M: Gerd Hoffmann <kraxel@redhat.com>
 S: Maintained
--=20
2.24.1


