Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 272B4572365
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 20:48:12 +0200 (CEST)
Received: from localhost ([::1]:39056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBKva-0002uI-TK
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 14:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKI9-0003tS-9o
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:07:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKI7-0006lg-Px
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:07:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657649242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1hcMCrIEhLH/YVRJJNCyQOsQ9yipu0+PDDEYamGsazM=;
 b=bH+TkPWRmICyqbtRnkmUFQz2TcMBBiuzrSrdzQDRFreUlbJz2+jfMtXs3Mq09YntR9zHFy
 TlGCXntCZsZVkCOsZuSImL0Zux72P7Rtlg2JsBXXz+QNUzqzj18ipD04eIqn71QN7hbRza
 D6N0l6hBpXkBAKzot28Jngma+Fqok98=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-8TcJaDCJMfShuaIl1fNKiw-1; Tue, 12 Jul 2022 14:07:14 -0400
X-MC-Unique: 8TcJaDCJMfShuaIl1fNKiw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 702D1804184;
 Tue, 12 Jul 2022 18:07:14 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E8962026D07;
 Tue, 12 Jul 2022 18:07:14 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 32/35] iotests/297: Have mypy ignore unused ignores
Date: Tue, 12 Jul 2022 20:06:14 +0200
Message-Id: <20220712180617.1362407-33-hreitz@redhat.com>
In-Reply-To: <20220712180617.1362407-1-hreitz@redhat.com>
References: <20220712180617.1362407-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Message-Id: <20220621092536.19837-1-hreitz@redhat.com>
Acked-by: John Snow <jsnow@redhat.com>
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


