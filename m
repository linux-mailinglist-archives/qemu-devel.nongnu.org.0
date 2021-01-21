Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 388B82FDF7F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 03:40:17 +0100 (CET)
Received: from localhost ([::1]:56366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2PtQ-00042q-8W
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 21:40:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2Pqi-0001gb-93
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 21:37:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2Pqc-0003l6-Sk
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 21:37:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611196642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gZZvISYi2oucvobdDY3cabyzy0W9sPjwXSly/SvC350=;
 b=S91zG425GZC4VK5GdA6qoEQ28j8MBwTDAnr317XcyH9F2XjTLbJRuSEj0VIuUjHD4KTe/N
 6HEBS0kdXpUq9B+4GDpA94Rr6uPhsJLqdB9hnsdr6PF2QQOCrMNq2q+o2B8lMgUZ8K/t7f
 IbFYBsLkh9i0hSrS3zq3NLRyUA5vHsE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-wXM9YObgNHijt6F3Thzg1Q-1; Wed, 20 Jan 2021 21:37:17 -0500
X-MC-Unique: wXM9YObgNHijt6F3Thzg1Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADEE08030B4;
 Thu, 21 Jan 2021 02:37:16 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FB4E629DB;
 Thu, 21 Jan 2021 02:37:16 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/13] iotests/303: use dot slash for qcow2.py running
Date: Wed, 20 Jan 2021 20:36:50 -0600
Message-Id: <20210121023657.1186241-7-eblake@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

If you run './check 303', check includes common.config which adjusts
$PATH to include '.' first, and therefore finds qcow2.py on PATH.  But
if you run './303' directly, there is nothing to adjust PATH, and if
'.' is not already on your PATH by other means, the test fails because
the executable is not found.  Adjust how we invoke the helper
executable to avoid needing a PATH search in the first place.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210116134424.82867-3-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/303 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/303 b/tests/qemu-iotests/303
index 6c2177448348..11cd9eeb266e 100755
--- a/tests/qemu-iotests/303
+++ b/tests/qemu-iotests/303
@@ -56,7 +56,7 @@ qemu_img_create('-f', iotests.imgfmt, disk, '10M')

 add_bitmap(1, 0, 6, False)
 add_bitmap(2, 6, 8, True)
-dump = ['qcow2.py', disk, 'dump-header']
+dump = ['./qcow2.py', disk, 'dump-header']
 subprocess.run(dump)
 # Dump the metadata in JSON format
 dump.append('-j')
-- 
2.30.0


