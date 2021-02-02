Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D56130CAC2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 20:01:07 +0100 (CET)
Received: from localhost ([::1]:51918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l70vC-0005T9-Et
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 14:01:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l70tW-000522-QR
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 13:59:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l70tV-0007MM-Ah
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 13:59:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612292360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4nEu6pwf8nHyq/STWIPUG4Xuf8N3MI8Y27dZoBp0BjY=;
 b=A/zkVGpTnlcsKJDqVNhRRhY3KrDi823GTgBTHqCJGSTC0AUyeom9SKfR6zfGB1apqzVt6l
 gM92htIp5pHB8ZcpJa1Rm+Ja8vpxdTRzd7LhqRODp4LeJFn0Zc07XSrFPJIHDBrktco1LD
 RGL9+oAHhA5fFadQx1iM2fLJJ+2xr5g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-bYhjq5ziMP2M_SIswgNVLQ-1; Tue, 02 Feb 2021 13:59:17 -0500
X-MC-Unique: bYhjq5ziMP2M_SIswgNVLQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A18621005501;
 Tue,  2 Feb 2021 18:59:16 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42171100AE2D;
 Tue,  2 Feb 2021 18:59:16 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] iotests: Fix expected whitespace for 185
Date: Tue,  2 Feb 2021 12:59:14 -0600
Message-Id: <20210202185914.614705-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit f93e19fb03b adjusted various iotest whitespace discrepancies,
but missed a test that is not part of default 'make check'.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/185.out | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/185.out b/tests/qemu-iotests/185.out
index 9dedc8eacbed..754a64125865 100644
--- a/tests/qemu-iotests/185.out
+++ b/tests/qemu-iotests/185.out
@@ -89,7 +89,7 @@ Formatting 'TEST_DIR/t.qcow2.copy', fmt=qcow2 cluster_size=65536 extended_l2=off
                       'format': 'IMGFMT',
                       'sync': 'full',
                       'speed': 65536,
-                      'x-perf': { 'max-chunk': 65536 } } }
+                      'x-perf': {'max-chunk': 65536} } }
 Formatting 'TEST_DIR/t.qcow2.copy', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=67108864 lazy_refcounts=off refcount_bits=16
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "disk"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "disk"}}
-- 
2.30.0


