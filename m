Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB2C4A4CF1
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 18:16:55 +0100 (CET)
Received: from localhost ([::1]:52948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEaIQ-0006z1-Jh
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 12:16:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEa6i-0001Xr-CB
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 12:04:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEa6f-0007S5-Ju
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 12:04:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643648684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XV71P2sLnR/qPqyPAEYdGjxWcG9soMr4fWGGZbFMakM=;
 b=dRwyNpEIXUIyAV4FbpTdJ1rkhEtmir7FgsQX7PGpfuS1a3HpHLSzQPP6wmBcFS2i4O5AaX
 rr8AaA7vwg8DLCCGys5HzTaeER1onEBcoRUrwKN1skZb/ySA/VUx88LtmxakX4lplFNb3E
 jXjl6i45nIlGmzN2F/iFucK1NKAbbrI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-6g8QVN8TOr-nn05Cb0D7VQ-1; Mon, 31 Jan 2022 12:04:41 -0500
X-MC-Unique: 6g8QVN8TOr-nn05Cb0D7VQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DC871091DA2;
 Mon, 31 Jan 2022 17:04:39 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1535510A48D5;
 Mon, 31 Jan 2022 17:04:37 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 5/5] docs: Only mention gluster in the man page when available
Date: Mon, 31 Jan 2022 18:04:11 +0100
Message-Id: <20220131170411.125198-6-kwolf@redhat.com>
In-Reply-To: <20220131170411.125198-1-kwolf@redhat.com>
References: <20220131170411.125198-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 timao@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If gluster is disabled in the build, the man page shouldn't contain
information on how to use the gluster block driver.

This patch is best viewed with whitespace changes ignored.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/system/device-url-syntax.rst.inc | 64 ++++++++++++++-------------
 1 file changed, 33 insertions(+), 31 deletions(-)

diff --git a/docs/system/device-url-syntax.rst.inc b/docs/system/device-url-syntax.rst.inc
index d55622847a..79270c8709 100644
--- a/docs/system/device-url-syntax.rst.inc
+++ b/docs/system/device-url-syntax.rst.inc
@@ -89,44 +89,46 @@ special URL syntax.
        Currently authentication must be done using ssh-agent. Other
        authentication methods may be supported in future.
 
-``GlusterFS``
-   GlusterFS is a user space distributed file system. QEMU supports the
-   use of GlusterFS volumes for hosting VM disk images using TCP, Unix
-   Domain Sockets and RDMA transport protocols.
+.. only:: not DISABLE_GLUSTERFS
 
-   Syntax for specifying a VM disk image on GlusterFS volume is
+    ``GlusterFS``
+       GlusterFS is a user space distributed file system. QEMU supports the
+       use of GlusterFS volumes for hosting VM disk images using TCP, Unix
+       Domain Sockets and RDMA transport protocols.
 
-   .. parsed-literal::
+       Syntax for specifying a VM disk image on GlusterFS volume is
 
-      URI:
-      gluster[+type]://[host[:port]]/volume/path[?socket=...][,debug=N][,logfile=...]
+       .. parsed-literal::
 
-      JSON:
-      'json:{"driver":"qcow2","file":{"driver":"gluster","volume":"testvol","path":"a.img","debug":N,"logfile":"...",
-                                       "server":[{"type":"tcp","host":"...","port":"..."},
-                                                 {"type":"unix","socket":"..."}]}}'
+          URI:
+          gluster[+type]://[host[:port]]/volume/path[?socket=...][,debug=N][,logfile=...]
 
-   Example
+          JSON:
+          'json:{"driver":"qcow2","file":{"driver":"gluster","volume":"testvol","path":"a.img","debug":N,"logfile":"...",
+                                           "server":[{"type":"tcp","host":"...","port":"..."},
+                                                     {"type":"unix","socket":"..."}]}}'
 
-   .. parsed-literal::
+       Example
+
+       .. parsed-literal::
 
-      URI:
-      |qemu_system| --drive file=gluster://192.0.2.1/testvol/a.img,
-                                     file.debug=9,file.logfile=/var/log/qemu-gluster.log
-
-      JSON:
-      |qemu_system| 'json:{"driver":"qcow2",
-                                "file":{"driver":"gluster",
-                                         "volume":"testvol","path":"a.img",
-                                         "debug":9,"logfile":"/var/log/qemu-gluster.log",
-                                         "server":[{"type":"tcp","host":"1.2.3.4","port":24007},
-                                                   {"type":"unix","socket":"/var/run/glusterd.socket"}]}}'
-      |qemu_system| -drive driver=qcow2,file.driver=gluster,file.volume=testvol,file.path=/path/a.img,
-                                            file.debug=9,file.logfile=/var/log/qemu-gluster.log,
-                                            file.server.0.type=tcp,file.server.0.host=1.2.3.4,file.server.0.port=24007,
-                                            file.server.1.type=unix,file.server.1.socket=/var/run/glusterd.socket
-
-   See also http://www.gluster.org.
+          URI:
+          |qemu_system| --drive file=gluster://192.0.2.1/testvol/a.img,
+                                         file.debug=9,file.logfile=/var/log/qemu-gluster.log
+
+          JSON:
+          |qemu_system| 'json:{"driver":"qcow2",
+                                    "file":{"driver":"gluster",
+                                             "volume":"testvol","path":"a.img",
+                                             "debug":9,"logfile":"/var/log/qemu-gluster.log",
+                                             "server":[{"type":"tcp","host":"1.2.3.4","port":24007},
+                                                       {"type":"unix","socket":"/var/run/glusterd.socket"}]}}'
+          |qemu_system| -drive driver=qcow2,file.driver=gluster,file.volume=testvol,file.path=/path/a.img,
+                                                file.debug=9,file.logfile=/var/log/qemu-gluster.log,
+                                                file.server.0.type=tcp,file.server.0.host=1.2.3.4,file.server.0.port=24007,
+                                                file.server.1.type=unix,file.server.1.socket=/var/run/glusterd.socket
+
+       See also http://www.gluster.org.
 
 .. only:: not DISABLE_CURL
 
-- 
2.31.1


