Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B355832F141
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:34:10 +0100 (CET)
Received: from localhost ([::1]:57494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEL3-0001RM-Ml
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:34:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkS-00078e-6e
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkB-0007FU-46
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614963359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fkFDSkSOG52uvLLT0GztWJFV+seyxuV6TSvuSDLBo0Q=;
 b=htEnW+4M6FkuCo4BOLKImariMwGOlaE1puhnw6/9Z/bvw6WU2N+ALb4Yo1qYhwgUp9KNrk
 SlfjKFE5gblDM6ZMNJdF98gye/Qb0+gAadKl40QyYk/mJgoF3lpbzXETcMaU/q+8eJHPrt
 zRNGX3mFf1lFcH8C9FUTRoeNgsoTyw4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-1Sn4U_AYPSWXBRxUojV0_g-1; Fri, 05 Mar 2021 11:55:57 -0500
X-MC-Unique: 1Sn4U_AYPSWXBRxUojV0_g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77CFF18C026E;
 Fri,  5 Mar 2021 16:55:22 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68ABA60BF3;
 Fri,  5 Mar 2021 16:55:21 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 11/31] docs: replace insecure /tmp examples in qsd docs
Date: Fri,  5 Mar 2021 17:54:34 +0100
Message-Id: <20210305165454.356840-12-kwolf@redhat.com>
In-Reply-To: <20210305165454.356840-1-kwolf@redhat.com>
References: <20210305165454.356840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

World-writeable directories have security issues. Avoid showing them in
the documentation since someone might accidentally use them in
situations where they are insecure.

There tend to be 3 security problems:
1. Denial of service. An adversary may be able to create the file
   beforehand, consume all space/inodes, etc to sabotage us.
2. Impersonation. An adversary may be able to create a listen socket and
   accept incoming connections that were meant for us.
3. Unauthenticated client access. An adversary may be able to connect to
   us if we did not set the uid/gid and permissions correctly.

These can be prevented or mitigated with private /tmp, carefully setting
the umask, etc but that requires special action and does not apply to
all situations. Just avoid using /tmp in examples.

Reported-by: Richard W.M. Jones <rjones@redhat.com>
Reported-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210301172728.135331-3-stefanha@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/tools/qemu-storage-daemon.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu-storage-daemon.rst
index 5714794775..fe3042d609 100644
--- a/docs/tools/qemu-storage-daemon.rst
+++ b/docs/tools/qemu-storage-daemon.rst
@@ -69,7 +69,7 @@ Standard options:
   a description of character device properties. A common character device
   definition configures a UNIX domain socket::
 
-  --chardev socket,id=char1,path=/tmp/qmp.sock,server=on,wait=off
+  --chardev socket,id=char1,path=/var/run/qsd-qmp.sock,server=on,wait=off
 
 .. option:: --export [type=]nbd,id=<id>,node-name=<node-name>[,name=<export-name>][,writable=on|off][,bitmap=<name>]
   --export [type=]vhost-user-blk,id=<id>,node-name=<node-name>,addr.type=unix,addr.path=<socket-path>[,writable=on|off][,logical-block-size=<block-size>][,num-queues=<num-queues>]
@@ -108,9 +108,10 @@ Standard options:
   below). TLS encryption can be configured using ``--object`` tls-creds-* and
   authz-* secrets (see below).
 
-  To configure an NBD server on UNIX domain socket path ``/tmp/nbd.sock``::
+  To configure an NBD server on UNIX domain socket path
+  ``/var/run/qsd-nbd.sock``::
 
-  --nbd-server addr.type=unix,addr.path=/tmp/nbd.sock
+  --nbd-server addr.type=unix,addr.path=/var/run/qsd-nbd.sock
 
 .. option:: --object help
   --object <type>,help
-- 
2.29.2


