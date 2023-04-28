Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BF26F162C
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 12:57:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psLkS-0008Nl-Mz; Fri, 28 Apr 2023 06:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psLkQ-0008Mh-5j
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:54:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psLkM-0003yU-JI
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:54:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682679278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iVvvPS2dqAgWTfaMRuiVetY5mBN48Fdbpg9a+jBHono=;
 b=bJzjkNOAUpqYcEd1t7aKffDZ7QQz7b5nurV5ygzGtwSclCarSgmqrhnomGJYTDKZssqufE
 SLABnV2dgs2m2EG4Z8AuewVjfc7Rx/+RF45rDHxQ4CBm/GU0qYVVQ8ypQkWAByQwYUIWki
 oKKxMQ1jrlci60ljaCP3S+VgyAKZ2xU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-_B3_BmH7NcOgLuqJl7pEdg-1; Fri, 28 Apr 2023 06:54:33 -0400
X-MC-Unique: _B3_BmH7NcOgLuqJl7pEdg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7A6B885635;
 Fri, 28 Apr 2023 10:54:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 93A4E1410F1E;
 Fri, 28 Apr 2023 10:54:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9494921D191B; Fri, 28 Apr 2023 12:54:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, peter.maydell@linaro.org, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, mst@redhat.com, imammedo@redhat.com,
 anisinha@redhat.com, eblake@redhat.com, kraxel@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com, arei.gonglei@huawei.com,
 pizhenwei@bytedance.com, jsnow@redhat.com, vsementsov@yandex-team.ru,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 quintela@redhat.com, peterx@redhat.com, leobras@redhat.com,
 jasowang@redhat.com, yuval.shaia.ml@gmail.com, pavel.dovgaluk@ispras.ru,
 jiri@resnulli.us, stefanb@linux.vnet.ibm.com, stefanha@redhat.com,
 lukasstraub2@web.de, kkostiuk@redhat.com, qemu-block@nongnu.org,
 victortoso@redhat.com
Subject: [PATCH 09/17] tests/qapi-schema/doc-good: Improve a comment
Date: Fri, 28 Apr 2023 12:54:21 +0200
Message-Id: <20230428105429.1687850-10-armbru@redhat.com>
In-Reply-To: <20230428105429.1687850-1-armbru@redhat.com>
References: <20230428105429.1687850-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The QAPI generator doesn't reject undocumented members and
features (yet).  doc-good.json covers this, with clear "is
undocumented" notes to signal intent.

Except for @Variant1 member @var1, where it's "(but no @var: line)".
Less clear.  Replace by "@var1 is undocumented".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/qapi-schema/doc-good.json | 4 +++-
 tests/qapi-schema/doc-good.out  | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/qapi-schema/doc-good.json b/tests/qapi-schema/doc-good.json
index 74745fb405..445471daee 100644
--- a/tests/qapi-schema/doc-good.json
+++ b/tests/qapi-schema/doc-good.json
@@ -83,7 +83,9 @@
 #
 # A paragraph
 #
-# Another paragraph (but no @var: line)
+# Another paragraph
+#
+# @var1 is undocumented
 #
 # Features:
 # @variant1-feat: a feature
diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.out
index 9dd65b9d92..afa48dcd94 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -123,6 +123,8 @@ doc symbol=Variant1
 A paragraph
 
 Another paragraph (but no @var: line)
+
+@var1 is undocumented
     arg=var1
 
     feature=variant1-feat
-- 
2.39.2


