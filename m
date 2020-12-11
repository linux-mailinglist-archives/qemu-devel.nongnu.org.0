Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C332D7D25
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:41:03 +0100 (CET)
Received: from localhost ([::1]:56480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmPe-0000da-Cn
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:41:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluz-0004Bj-Bu
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluR-0002Dk-Jf
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9bLvWWq8ylxzJiVSvMxxdy1clocGP94myryRr59obHs=;
 b=KQCrPcWQPsN/D/GgGrwiTVzUSjRPW5Nyb/cfIzCrrWQ28Mj7HI6VeczjrLIHJbi5qdw4gL
 o5Ndr3gN8Uof9Ig4EODTUHftQBqtjLzls1CoBuqKpYTmx+l4hSS7pCOjxv1OuDsqAqCt06
 bb6hD2OsiolikiLmai2Ng76GTWidUH8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-FpLqifqOMPy_Ouh-PkIVFg-1; Fri, 11 Dec 2020 12:08:42 -0500
X-MC-Unique: FpLqifqOMPy_Ouh-PkIVFg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3ED5A107ACE6;
 Fri, 11 Dec 2020 17:08:41 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D2DB5D6A8;
 Fri, 11 Dec 2020 17:08:40 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 17/34] iotests: Restrict some Python tests to file
Date: Fri, 11 Dec 2020 18:07:55 +0100
Message-Id: <20201211170812.228643-18-kwolf@redhat.com>
In-Reply-To: <20201211170812.228643-1-kwolf@redhat.com>
References: <20201211170812.228643-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

From: Max Reitz <mreitz@redhat.com>

Most Python tests are restricted to the file protocol (without
explicitly saying so), but these are the ones that would break
./check -fuse -qcow2.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20201027190600.192171-14-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/206 | 3 ++-
 tests/qemu-iotests/242 | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/206 b/tests/qemu-iotests/206
index 11bc51f256..0a3ee5ef00 100755
--- a/tests/qemu-iotests/206
+++ b/tests/qemu-iotests/206
@@ -23,7 +23,8 @@
 import iotests
 from iotests import imgfmt
 
-iotests.script_initialize(supported_fmts=['qcow2'])
+iotests.script_initialize(supported_fmts=['qcow2'],
+                          supported_protocols=['file'])
 iotests.verify_working_luks()
 
 with iotests.FilePath('t.qcow2') as disk_path, \
diff --git a/tests/qemu-iotests/242 b/tests/qemu-iotests/242
index 64f1bd95e4..a16de3085f 100755
--- a/tests/qemu-iotests/242
+++ b/tests/qemu-iotests/242
@@ -24,7 +24,8 @@ import struct
 from iotests import qemu_img_create, qemu_io, qemu_img_pipe, \
     file_path, img_info_log, log, filter_qemu_io
 
-iotests.script_initialize(supported_fmts=['qcow2'])
+iotests.script_initialize(supported_fmts=['qcow2'],
+                          supported_protocols=['file'])
 
 disk = file_path('disk')
 chunk = 256 * 1024
-- 
2.29.2


