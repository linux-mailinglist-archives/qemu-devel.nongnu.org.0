Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCA739E5FA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:56:09 +0200 (CEST)
Received: from localhost ([::1]:54500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJTs-0006fB-Ou
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqJMN-0006X3-Rt
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 13:48:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqJHA-0001oI-UG
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 13:43:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623087780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jfpfzr6Z20D006yVTqHh3oM++FGsDR5ck1PDjf/TwRA=;
 b=V4rPZ2JTVVXNlE5jxWMPjFyHrTJF4EH1mTMUDEg6VxJD6j2Q0Zc3Ct0/uBt5XbF4+/d7HE
 W8PAC1+vaN9ajF8kU+AWRXoQTNCzHDEsAtJVPwENXzvyvd44UJ8aCbmTd6yy1T16DMDGAg
 vOvJ1QdXX6sqWS0EtygN1kgx5izSLNo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-yWJv8k7zPxKbZ1NMmbfp-w-1; Mon, 07 Jun 2021 13:42:58 -0400
X-MC-Unique: yWJv8k7zPxKbZ1NMmbfp-w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 022E31020C36;
 Mon,  7 Jun 2021 17:42:58 +0000 (UTC)
Received: from thuth.com (ovpn-112-83.ams2.redhat.com [10.36.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D8865D6D5;
 Mon,  7 Jun 2021 17:42:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH] docs/tools/virtiofsd.rst: Do not hard-code the QEMU binary
 name
Date: Mon,  7 Jun 2021 19:42:50 +0200
Message-Id: <20210607174250.920226-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In downstream, we want to use a different name for the QEMU binary,
and some people might also use the docs for non-x86 binaries, that's
why we already created the |qemu_system| placeholder in the past.
Use it now in the virtiofsd doc, too.

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


