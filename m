Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D20C66D5FD1
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 14:01:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjfKG-0002Z9-Mo; Tue, 04 Apr 2023 07:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjfJs-0002Ms-U3
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 07:59:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pjfJo-0007wv-Cu
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 07:59:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680609559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zOkTxhxnEMsz9QrCbErAl8VDU/augOlq2j34ALLaSKI=;
 b=WUGJOtTlzko8zufu9XooJTh2VmrUb2slSjG3c+1dQtN19K8vR7k1CcwwMIztjw5uVl53er
 XYpvaq8475kGF5qS/PkSX/uvYrSj6L4Fc5naX10Eg/VGUEwYhEBsGbirnc4jVV9IS01ReH
 err29Fz/bmORumcei+2CLm+EkdyAnuU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-cEXbOri7Nh-TzkIAjogubQ-1; Tue, 04 Apr 2023 07:59:16 -0400
X-MC-Unique: cEXbOri7Nh-TzkIAjogubQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A03E9857FB4;
 Tue,  4 Apr 2023 11:59:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DF9D40C845F;
 Tue,  4 Apr 2023 11:59:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E5B4421E5DC2; Tue,  4 Apr 2023 13:59:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, eblake@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 arei.gonglei@huawei.com, pizhenwei@bytedance.com, jsnow@redhat.com,
 vsementsov@yandex-team.ru, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, quintela@redhat.com, jasowang@redhat.com,
 yuval.shaia.ml@gmail.com, stefanha@redhat.com, kraxel@redhat.com,
 kkostiuk@redhat.com, qemu-block@nongnu.org
Subject: [PATCH 14/16] qapi: Fix misspelled section tags in doc comments
Date: Tue,  4 Apr 2023 13:59:10 +0200
Message-Id: <20230404115912.2829251-15-armbru@redhat.com>
In-Reply-To: <20230404115912.2829251-1-armbru@redhat.com>
References: <20230404115912.2829251-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Section tags are case sensitive and end with a colon.  Screwing up
either gets them interpreted as ordinary paragraph.  Fix a few.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/machine.json   | 4 ++--
 qapi/migration.json | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 172ef0ad96..135a4926a9 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -517,7 +517,7 @@
 # @targets: Target root bridge IDs from -device ...,id=<ID> for each root
 #           bridge.
 #
-# Since 7.1
+# Since: 7.1
 ##
 { 'struct': 'CXLFixedMemoryWindowOptions',
   'data': {
@@ -532,7 +532,7 @@
 #
 # @cxl-fmw: List of CXLFixedMemoryWindowOptions
 #
-# Since 7.1
+# Since: 7.1
 ##
 { 'struct' : 'CXLFMWProperties',
   'data': { 'cxl-fmw': ['CXLFixedMemoryWindowOptions'] }
diff --git a/qapi/migration.json b/qapi/migration.json
index 477ee4d35b..1b6c7b19e4 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1991,7 +1991,7 @@
 #
 # data: migration thread name
 #
-# returns: information about migration threads
+# Returns: information about migration threads
 #
 # Since: 7.2
 ##
-- 
2.39.2


