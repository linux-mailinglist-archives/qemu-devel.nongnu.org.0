Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758B23D1508
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 19:23:56 +0200 (CEST)
Received: from localhost ([::1]:52584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Fwp-0003fo-3N
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 13:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6Fvc-0002m9-Ud
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 13:22:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6Fva-0008OI-39
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 13:22:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626888156;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type; bh=d7WlMDyNIHamovnEvgVEKa83sVpA0kUPUpVelMTM0aM=;
 b=J9RSKhf9ZgEz+XSFwSVmDQmHTepbW9egST/YNFiIqFUO4hshuN6EjK9MS6nxH0TjBxSYQd
 iRlqnQjxnwm1iV4yo4xI6lg/yPRoU8mM+dMSYPb8A/zt4Bk+jkOEKZBe2WrX+3iC8Xn66o
 J8UySPPTBA+JHbJJl1M6rnhbHTECqk0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-ex_aErzyPm-zSksNRbEGUw-1; Wed, 21 Jul 2021 13:22:35 -0400
X-MC-Unique: ex_aErzyPm-zSksNRbEGUw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8212107BEF5;
 Wed, 21 Jul 2021 17:22:33 +0000 (UTC)
Received: from redhat.com (ovpn-112-39.ams2.redhat.com [10.36.112.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCE415D9DD;
 Wed, 21 Jul 2021 17:22:32 +0000 (UTC)
Date: Wed, 21 Jul 2021 18:22:29 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Transient fail of iotests 215 and 197
Message-ID: <YPhX1TakNJjH0RaA@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter caught the following transient fail on the staging tree:

  https://gitlab.com/qemu-project/qemu/-/jobs/1438817749

--- /builds/qemu-project/qemu/tests/qemu-iotests/197.out
+++ 197.out.bad
@@ -12,13 +12,12 @@
 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 read 0/0 bytes at offset 0
 0 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-read 2147483136/2147483136 bytes at offset 1024
-2 GiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+./common.rc: Killed                  ( VALGRIND_QEMU="${VALGRIND_QEMU_IO}" _qemu_proc_exec "${VALGRIND_LOGFILE}" "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@" )
 read 1024/1024 bytes at offset 3221226496
 1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 qemu-io: can't open device TEST_DIR/t.wrap.qcow2: Can't use copy-on-read on read-only device
-2 GiB (0x80010000) bytes     allocated at offset 0 bytes (0x0)
-1023.938 MiB (0x3fff0000) bytes not allocated at offset 2 GiB (0x80010000)
+2 GiB (0x80000000) bytes     allocated at offset 0 bytes (0x0)
+1 GiB (0x40000000) bytes not allocated at offset 2 GiB (0x80000000)
 64 KiB (0x10000) bytes     allocated at offset 3 GiB (0xc0000000)
 1023.938 MiB (0x3fff0000) bytes not allocated at offset 3 GiB (0xc0010000)
 No errors were found on the image.


--- /builds/qemu-project/qemu/tests/qemu-iotests/215.out
+++ 215.out.bad
@@ -12,13 +12,12 @@
 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 read 0/0 bytes at offset 0
 0 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-read 2147483136/2147483136 bytes at offset 1024
-2 GiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+./common.rc: Killed                  ( VALGRIND_QEMU="${VALGRIND_QEMU_IO}" _qemu_proc_exec "${VALGRIND_LOGFILE}" "$QEMU_IO_PROG" $QEMU_IO_ARGS "$@" )
 read 1024/1024 bytes at offset 3221226496
 1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 qemu-io: can't open device TEST_DIR/t.wrap.qcow2: Block node is read-only
-2 GiB (0x80010000) bytes     allocated at offset 0 bytes (0x0)
-1023.938 MiB (0x3fff0000) bytes not allocated at offset 2 GiB (0x80010000)
+2 GiB (0x80000000) bytes     allocated at offset 0 bytes (0x0)
+1 GiB (0x40000000) bytes not allocated at offset 2 GiB (0x80000000)
 64 KiB (0x10000) bytes     allocated at offset 3 GiB (0xc0000000)
 1023.938 MiB (0x3fff0000) bytes not allocated at offset 3 GiB (0xc0010000)
 No errors were found on the image.


Looks like the process might have been killed off by the OS part way
through.

Interestingly both test cases have a comment:

  #                                        Since a 2G read may exhaust
  # memory on some machines (particularly 32-bit), we skip the test if
  # that fails due to memory pressure.


I'm wondering if the logic for handling this failure is flawed, as being
killed by the OS for exhuasting memory limits for the CI container looks
like a plausible scenario to explain the failure.

The CI shared runners supposedly have 3.75 GB of RAM for the VM as a whole.
If the tests are run in parallel this could still be an issue.

Maybe we need to skip these tests by default if they are known to require
a significant amount of memory to run ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


