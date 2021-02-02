Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2248F30CF59
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 23:51:07 +0100 (CET)
Received: from localhost ([::1]:55090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l74Vl-0004T3-Qy
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 17:51:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74QX-0007Gm-Ry
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:45:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74QT-0005nO-Sf
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:45:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612305935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q39ZBU7w+73D/8mDqCjpE1GwPFYcsUYEqRfsTk4kM/g=;
 b=YIV1N3nOiRitQrXmL8AtbOxYUhfZ0Bwk560DCVjZ3Js1ce+VQMMaM4T3snv6ZNhMSC9onl
 HUbh1H/Cc6ud6CZZrX/CaAqNqjGXetLtUW4H3DNY+XMBuAD4uPmpUIQQ6WBrYiq/GfZRuc
 EAgr0ZAeamyi+izT27hn8UtdZNp5oxw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-7i7laG5FMIKJ6kBzFgpJmQ-1; Tue, 02 Feb 2021 17:45:33 -0500
X-MC-Unique: 7i7laG5FMIKJ6kBzFgpJmQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD7F7804023;
 Tue,  2 Feb 2021 22:45:32 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5ED6E10016F5;
 Tue,  2 Feb 2021 22:45:32 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/20] iotests: Fix expected whitespace for 185
Date: Tue,  2 Feb 2021 16:45:10 -0600
Message-Id: <20210202224529.642055-2-eblake@redhat.com>
In-Reply-To: <20210202224529.642055-1-eblake@redhat.com>
References: <20210202224529.642055-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit f93e19fb03b adjusted various iotest whitespace discrepancies.
But another one snuck in during 61623f82153788e, and we missed the
semantic merge conflict at the time because 185 is not run as part of
the default 'make check'.

Signed-off-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210202185914.614705-1-eblake@redhat.com>
[eblake: adjust commit message]
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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


