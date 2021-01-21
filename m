Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 127A22FDF83
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 03:44:09 +0100 (CET)
Received: from localhost ([::1]:41462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2PxA-00019P-3G
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 21:44:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2Pqo-0001ir-0X
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 21:37:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2Pql-0003nk-Rq
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 21:37:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611196650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RHhawGn4rhsxMJyB4ULzv09nDqO4CnPhXZDaUmxVi4o=;
 b=Osxq7nnJQyOeiVHocJKcZjDIu2G+gvkyjiarIoDV/SOx6tW686D/v2Ln5Venp/btLqKiQ8
 qPgw2MxP2Ek0GgbGmZJXT6ReVObEoC2ljXXceLjtad938d1yxVB8mwg8mQCSeCxaM5nM+l
 PA0+nqlfdLmuOHddf52dCahaHN8LZ0M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-bfyrasaUMfWr-fKLKWr3aA-1; Wed, 20 Jan 2021 21:37:28 -0500
X-MC-Unique: bfyrasaUMfWr-fKLKWr3aA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D051180A093;
 Thu, 21 Jan 2021 02:37:27 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B9915D764;
 Thu, 21 Jan 2021 02:37:27 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/13] iotests/264: fix style
Date: Wed, 20 Jan 2021 20:36:55 -0600
Message-Id: <20210121023657.1186241-12-eblake@redhat.com>
In-Reply-To: <20210121023657.1186241-1-eblake@redhat.com>
References: <20210121023657.1186241-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Fix long line, extra import and one mypy complaint about incompatible
int and float.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201118180433.11931-7-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/264 | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/264 b/tests/qemu-iotests/264
index 960f0449a4e4..e725cefd47b5 100755
--- a/tests/qemu-iotests/264
+++ b/tests/qemu-iotests/264
@@ -22,8 +22,7 @@
 import time

 import iotests
-from iotests import qemu_img_create, qemu_io_silent_check, file_path, \
-        qemu_nbd_popen, log
+from iotests import qemu_img_create, file_path, qemu_nbd_popen, log

 iotests.script_initialize(
     supported_fmts=['qcow2'],
@@ -32,7 +31,7 @@ iotests.script_initialize(
 disk_a, disk_b, nbd_sock = file_path('disk_a', 'disk_b', 'nbd-sock')
 nbd_uri = 'nbd+unix:///?socket=' + nbd_sock
 size = 5 * 1024 * 1024
-wait_limit = 3
+wait_limit = 3.0
 wait_step = 0.2

 qemu_img_create('-f', iotests.imgfmt, disk_a, str(size))
@@ -49,11 +48,11 @@ with qemu_nbd_popen('-k', nbd_sock, '-f', iotests.imgfmt, disk_b):
                   'file': {'driver': 'nbd',
                            'server': {'type': 'unix', 'path': nbd_sock},
                            'reconnect-delay': 10}})
-    vm.qmp_log('blockdev-backup', device='drive0', sync='full', target='backup0',
-               speed=(1 * 1024 * 1024))
+    vm.qmp_log('blockdev-backup', device='drive0', sync='full',
+               target='backup0', speed=(1 * 1024 * 1024))

     # Wait for some progress
-    t = 0
+    t = 0.0
     while t < wait_limit:
         jobs = vm.qmp('query-block-jobs')['return']
         if jobs and jobs[0]['offset'] > 0:
-- 
2.30.0


