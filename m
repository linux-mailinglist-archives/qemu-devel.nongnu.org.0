Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 485FE50A3DE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:20:23 +0200 (CEST)
Received: from localhost ([::1]:44946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhYbW-00084A-Ba
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhYXW-0003Rg-R0
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:16:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhYXQ-0005n7-PY
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:16:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650554168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UZpYjYmkQdxxTMsFybgk7JKFyXqlK7dc9B0geYKfyVE=;
 b=MINfR+RBz+GCZLg5pNnPiGVCQPg64FRd0XMgQF4IFj0VJjv+FP/AAi/O7NuDtu9BeXmWP/
 jrVPK/z4k8UgGdMs9aRnkiVK1C9w0Xa0dElKXUKDGAoWx+fzMc3ZtENrXgyNG5bRmPuu5G
 eFqkbGjGwVdjAWwV2znO5GFRAUD63zw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-dqRzuFbDM3SRsrM5ATZeJQ-1; Thu, 21 Apr 2022 11:16:07 -0400
X-MC-Unique: dqRzuFbDM3SRsrM5ATZeJQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DBAA1014A66;
 Thu, 21 Apr 2022 15:16:06 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 070AC40D016A;
 Thu, 21 Apr 2022 15:16:05 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/17] python: temporarily silence pylint duplicate-code
 warnings
Date: Thu, 21 Apr 2022 11:15:52 -0400
Message-Id: <20220421151600.984189-10-jsnow@redhat.com>
In-Reply-To: <20220421151600.984189-1-jsnow@redhat.com>
References: <20220421151600.984189-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The next several commits copy some code from qemu.qmp to qemu.aqmp, then
delete qemu.qmp. In the interim, to prevent test failures, the duplicate
code detection needs to be silenced to prevent bisect problems with CI
testing.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-id: 20220330172812.3427355-2-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/setup.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/python/setup.cfg b/python/setup.cfg
index 241f243e8b9..cdeced44d2b 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -119,6 +119,7 @@ disable=consider-using-f-string,
         too-many-function-args,  # mypy handles this with less false positives.
         too-many-instance-attributes,
         no-member,  # mypy also handles this better.
+        duplicate-code,  # To be removed by the end of this patch series.
 
 [pylint.basic]
 # Good variable names which should always be accepted, separated by a comma.
-- 
2.34.1


