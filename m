Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E6F6FC134
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 10:06:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwIGq-0008UY-IF; Tue, 09 May 2023 04:00:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwIGk-0008Tz-Jl
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:00:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwIGj-0008UB-3Q
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:00:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683619220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f8GkCEEclTa/vCiWYYZKkp9W8uMgp+i41cL/VV1rFZY=;
 b=Ul2ta1zFLWII92o3yd7TSORbw2G+9rBdiQL/xbTDdh23obBzQJATVgMdrw98z5kg03V1rn
 uOOlZqzNEWfyGw9yoh/8QeUlPpXFjWmyzRcQ3LV1y1TVhN7xzr+dluD7NiuCCFrhjaNvHA
 /4/VV5L6Cf8QOBQeA3+rvBxu2aWaOAg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-6sl1HN6MPDKpC5UG0g6SCA-1; Tue, 09 May 2023 04:00:19 -0400
X-MC-Unique: 6sl1HN6MPDKpC5UG0g6SCA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDA2A3C10692;
 Tue,  9 May 2023 08:00:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB3D640C6E68;
 Tue,  9 May 2023 08:00:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 31BB221E660B; Tue,  9 May 2023 10:00:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	Juan Quintela <quintela@redhat.com>
Subject: [PULL 09/17] tests/qapi-schema/doc-good: Improve a comment
Date: Tue,  9 May 2023 10:00:03 +0200
Message-Id: <20230509080011.3231661-10-armbru@redhat.com>
In-Reply-To: <20230509080011.3231661-1-armbru@redhat.com>
References: <20230509080011.3231661-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The QAPI generator doesn't reject undocumented members and
features (yet).  doc-good.json covers this, with clear "is
undocumented" notes to signal intent.

Except for @Variant1 member @var1, where it's "(but no @var: line)".
Less clear.  Replace by "@var1 is undocumented".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230428105429.1687850-10-armbru@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
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


