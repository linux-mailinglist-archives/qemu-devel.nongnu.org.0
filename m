Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EB621BB1B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jul 2020 18:36:02 +0200 (CEST)
Received: from localhost ([::1]:56744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtw0H-0000pp-14
	for lists+qemu-devel@lfdr.de; Fri, 10 Jul 2020 12:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jtvxQ-0004AJ-DC
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 12:33:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25135
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jtvxO-0007wF-Jy
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 12:33:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594398781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1qvgfdDbJyx0FSKKYpjGqjvLuz7TsNE3OArmZbqiiGM=;
 b=I6dtjP460tWBRQGerBqNEAeOGEz++PL7imx+vDeXWdAwKF2Pcc+26hhJWG3Gi67mreQe91
 uIjfEr2Q584N8sZT8ZzDe3fyHzakdN8EZ4BKzRiWWpOZjKrQ+lznhJbROy3Ei7XDGYgF1v
 jrjtQexcIvq04P/fjUvAfwqS/Kja2mM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-j1scYp37OkOJRR9pTFUalw-1; Fri, 10 Jul 2020 12:33:00 -0400
X-MC-Unique: j1scYp37OkOJRR9pTFUalw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22BF2800685;
 Fri, 10 Jul 2020 16:32:59 +0000 (UTC)
Received: from localhost (ovpn-113-127.ams2.redhat.com [10.36.113.127])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA69E1A913;
 Fri, 10 Jul 2020 16:32:58 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/2] iotests: Set LC_ALL=C for sort
Date: Fri, 10 Jul 2020 18:32:52 +0200
Message-Id: <20200710163253.381630-3-mreitz@redhat.com>
In-Reply-To: <20200710163253.381630-1-mreitz@redhat.com>
References: <20200710163253.381630-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/10 04:36:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Otherwise the result is basically unpredictable.

(Note that the precise environment variable to control sorting order is
LC_COLLATE, but LC_ALL overrides LC_COLLATE, and we do not want the
sorting order to be messed up if LC_ALL is set in the environment.)

Reported-by: John Snow <jsnow@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/common.filter | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common.filter
index 345c3ca03e..4fd5c29b2a 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -177,7 +177,7 @@ _do_filter_img_create()
             -e 's/^\(data_file\)/3-\1/' \
             -e 's/^\(encryption\)/4-\1/' \
             -e 's/^\(preallocation\)/8-\1/' \
-        | sort \
+        | LC_ALL=C sort \
         | $SED -e 's/^[0-9]-//' \
         | tr '\n\0' ' \n' \
         | $SED -e 's/^ *$//' -e 's/ *$//'
-- 
2.26.2


