Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4A6274055
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 13:02:53 +0200 (CEST)
Received: from localhost ([::1]:44270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKg4S-0006FD-TL
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 07:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kKfsr-0001KY-KX
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 06:50:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30537
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kKfsp-0000mx-Eu
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 06:50:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600771850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6myIzIpPpfQk7f8cX7ESa28mxlQ3CXxT0+4no5Nq+1Y=;
 b=IkygV+qfXBvJqDCC1Wt/QLkwKXD6l5o9HoGE/CHNPP3o6UPDUyHq04OSFPL6/GU3ZofCxA
 /LeEsyotAjqXCjIi17xDHBkdpCRKit/mz4S3t9iF8712jpPbtwXzDdSl4JujG77AO+qlCh
 AiUiPSuRsDvC0MAVMBukBBJA6xFIyxE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-9jS_P2HlOJ2B_bif1fiytA-1; Tue, 22 Sep 2020 06:50:49 -0400
X-MC-Unique: 9jS_P2HlOJ2B_bif1fiytA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10D441007464;
 Tue, 22 Sep 2020 10:50:48 +0000 (UTC)
Received: from localhost (ovpn-114-26.ams2.redhat.com [10.36.114.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A81C23782;
 Tue, 22 Sep 2020 10:50:47 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 15/20] iotests/287: Clean up subshell test image
Date: Tue, 22 Sep 2020 12:49:27 +0200
Message-Id: <20200922104932.46384-16-mreitz@redhat.com>
In-Reply-To: <20200922104932.46384-1-mreitz@redhat.com>
References: <20200922104932.46384-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 01:57:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

287 creates an image in a subshell (thanks to the pipe) to see whether
that is possible with compression_type=zstd.  If _make_test_img were to
modify any global state, this global state would then be lost before we
could cleanup the image.

When using FUSE as the test protocol, this global state is important, so
clean up the image before the state is lost.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/287 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/287 b/tests/qemu-iotests/287
index f98a4cadc1..036cc09e82 100755
--- a/tests/qemu-iotests/287
+++ b/tests/qemu-iotests/287
@@ -51,8 +51,8 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 CLUSTER_SIZE=65536
 
 # Check if we can run this test.
-if IMGOPTS='compression_type=zstd' _make_test_img 64M |
-    grep "Invalid parameter 'zstd'"; then
+output=$(_make_test_img -o 'compression_type=zstd' 64M; _cleanup_test_img)
+if echo "$output" | grep -q "Invalid parameter 'zstd'"; then
     _notrun "ZSTD is disabled"
 fi
 
-- 
2.26.2


