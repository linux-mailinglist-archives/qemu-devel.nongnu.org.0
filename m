Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6693AE8CC
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 14:10:18 +0200 (CEST)
Received: from localhost ([::1]:36172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvIkr-0004Bt-TO
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 08:10:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lvIcY-00008Y-P3
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 08:01:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lvIcV-0001JC-IW
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 08:01:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624276895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sq/HOf5JeM++yPpoAuW9iDbVyUCOqpnC/SE0OJmi7vg=;
 b=LwRBMGnYcPbtQqs1sQCZwsa9Tgc4HqnRaG1mSWLKpPk/OAI5firFRDnHlXrLwEjTM46tE+
 XyXGPVqZzb9v80fucEN1P3ybiLrbGToLc5fu9vpRKP/774ZtUrHe0S6VFlu3pNjxoMdmL6
 zscKV1TIo0/mhUyw3DDGqLAKQuzmV/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-W-435PgmNTOc-61ELCq_gw-1; Mon, 21 Jun 2021 08:01:33 -0400
X-MC-Unique: W-435PgmNTOc-61ELCq_gw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4ED061018722;
 Mon, 21 Jun 2021 12:01:32 +0000 (UTC)
Received: from thuth.com (ovpn-112-31.ams2.redhat.com [10.36.112.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DC3A19C46;
 Mon, 21 Jun 2021 12:01:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/7] docs/tools/virtiofsd.rst: Do not hard-code the QEMU binary
 name
Date: Mon, 21 Jun 2021 14:01:20 +0200
Message-Id: <20210621120125.116377-3-thuth@redhat.com>
In-Reply-To: <20210621120125.116377-1-thuth@redhat.com>
References: <20210621120125.116377-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In downstream, we want to use a different name for the QEMU binary,
and some people might also use the docs for non-x86 binaries, that's
why we already created the |qemu_system| placeholder in the past.
Use it now in the virtiofsd doc, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20210607174250.920226-1-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/tools/virtiofsd.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
index 00554c75bd..265a39b0cf 100644
--- a/docs/tools/virtiofsd.rst
+++ b/docs/tools/virtiofsd.rst
@@ -298,13 +298,13 @@ Examples
 Export ``/var/lib/fs/vm001/`` on vhost-user UNIX domain socket
 ``/var/run/vm001-vhost-fs.sock``:
 
-::
+.. parsed-literal::
 
   host# virtiofsd --socket-path=/var/run/vm001-vhost-fs.sock -o source=/var/lib/fs/vm001
-  host# qemu-system-x86_64 \
-      -chardev socket,id=char0,path=/var/run/vm001-vhost-fs.sock \
-      -device vhost-user-fs-pci,chardev=char0,tag=myfs \
-      -object memory-backend-memfd,id=mem,size=4G,share=on \
-      -numa node,memdev=mem \
-      ...
+  host# |qemu_system| \\
+        -chardev socket,id=char0,path=/var/run/vm001-vhost-fs.sock \\
+        -device vhost-user-fs-pci,chardev=char0,tag=myfs \\
+        -object memory-backend-memfd,id=mem,size=4G,share=on \\
+        -numa node,memdev=mem \\
+        ...
   guest# mount -t virtiofs myfs /mnt
-- 
2.27.0


