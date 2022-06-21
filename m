Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92418552E3C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 11:27:02 +0200 (CEST)
Received: from localhost ([::1]:46358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3a9z-0002pi-JG
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 05:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o3a8n-00026W-8t
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 05:25:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o3a8l-0004m0-Gx
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 05:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655803543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=o8AHjn9KKm4PG+L7M95T+smP/SKSkKz8KTatO9T5Rtc=;
 b=V3iRTb60pj1zbCXIwei47K6wplJGsKwEHT9t9orqEyi5Gl6FBo4EGw4ANcKfFi9Piumojk
 CHrk63O562C8QSwHFQXIUy+t4/nskGyZmsBdQLQFlmeGYBCo8YsemmDnlLUKNbOp81MdZP
 p+Jnpxm3nXPmuwZGdueCAlFloLEvsfg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-MNKm6dIjPyGGGpEaZzj7FA-1; Tue, 21 Jun 2022 05:25:38 -0400
X-MC-Unique: MNKm6dIjPyGGGpEaZzj7FA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B6E785A58A;
 Tue, 21 Jun 2022 09:25:38 +0000 (UTC)
Received: from localhost (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3759840EC003;
 Tue, 21 Jun 2022 09:25:38 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH] iotests/297: Have mypy ignore unused ignores
Date: Tue, 21 Jun 2022 11:25:36 +0200
Message-Id: <20220621092536.19837-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

e7874a50ff3f5b20fb46f36958ad ("python: update for mypy 0.950") has added
`warn_unused_ignores = False` to python/setup.cfg, to be able to keep
compatibility with both pre- and post-0.950 mypy versions.

The iotests' mypy.ini needs the same, or 297 will fail (on both pre- and
post-0.950 mypy, as far as I can tell; just for different `ignore`
lines).

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/mypy.ini | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/mypy.ini b/tests/qemu-iotests/mypy.ini
index 4c0339f558..d66ffc2e3c 100644
--- a/tests/qemu-iotests/mypy.ini
+++ b/tests/qemu-iotests/mypy.ini
@@ -9,4 +9,4 @@ no_implicit_optional = True
 scripts_are_modules = True
 warn_redundant_casts = True
 warn_unused_configs = True
-warn_unused_ignores = True
+warn_unused_ignores = False
-- 
2.35.3


