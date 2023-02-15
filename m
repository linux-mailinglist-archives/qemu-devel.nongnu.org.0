Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F15C69725C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 01:01:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS5Dl-0006By-HT; Tue, 14 Feb 2023 19:00:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pS5Dc-0006BP-P3
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 19:00:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pS5Da-00076A-Qw
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 19:00:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676419214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xHmFj3MrllEaw4U4G5YhOZVicHZFP4J7v6YVMN6Hq9g=;
 b=O+yE/CB60uLASPadsmQun0YxpVDs1lG/ZSdULjmzS4lo4iOC4UQAnhWPtyoE3X6FHjlAgT
 I/cSEavrpTzmHLt5gm/L0HGT3cUpfWi1/VaQ1OFgsltBGr79OwpNnqvv8Nrim2XPXUoJEt
 9uHkhGld1j01hZp/6j6lEyfW8kJr3mE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-7zzGIlG_Pdmx7fZOmWQR6g-1; Tue, 14 Feb 2023 19:00:12 -0500
X-MC-Unique: 7zzGIlG_Pdmx7fZOmWQR6g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 334F3384798D;
 Wed, 15 Feb 2023 00:00:12 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0736F2166B26;
 Wed, 15 Feb 2023 00:00:11 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v4 2/6] qapi: update pylint configuration
Date: Tue, 14 Feb 2023 19:00:07 -0500
Message-Id: <20230215000011.1725012-3-jsnow@redhat.com>
In-Reply-To: <20230215000011.1725012-1-jsnow@redhat.com>
References: <20230215000011.1725012-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Newer versions of pylint disable the "no-self-use" message by
default. Older versions don't, though. If we leave the suppressions in,
pylint yelps about useless options. Just tell pylint to shush.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/pylintrc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/qapi/pylintrc b/scripts/qapi/pylintrc
index a7246282030..90546df5345 100644
--- a/scripts/qapi/pylintrc
+++ b/scripts/qapi/pylintrc
@@ -23,6 +23,7 @@ disable=fixme,
         too-many-statements,
         too-many-instance-attributes,
         consider-using-f-string,
+        useless-option-value,
 
 [REPORTS]
 
-- 
2.39.0


