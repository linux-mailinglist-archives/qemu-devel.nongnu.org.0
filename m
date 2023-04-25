Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD466EDBCD
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 08:43:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prCNu-0003vy-8U; Tue, 25 Apr 2023 02:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prCNo-0003ot-ML
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 02:42:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1prCNj-0004LS-FG
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 02:42:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682404950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bAiIXkTR4yMwAvoN0NHiE4OcT5TSg9eON9JUsUnjpyo=;
 b=To5hEC0A+AXxwdgs6z0S3r7Kq8Qasssq/saxT32Tv98C5ODzGckjULmGhnk7AysDJeV+kS
 kJJDDEPaNRIMU0XujZNvlrTk6Y2EYJhGeS01fuFt1UJ6WRDpr2JguzJ90iuL0LA9ghhek1
 hGYIqhJaBELJq7pIdiFKW2cBF5cRsF4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-bWD-vWKNN-aNvt25tHX35g-1; Tue, 25 Apr 2023 02:42:27 -0400
X-MC-Unique: bWD-vWKNN-aNvt25tHX35g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 684CA1C06EDF;
 Tue, 25 Apr 2023 06:42:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 465032166B41;
 Tue, 25 Apr 2023 06:42:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DDEF621F9831; Tue, 25 Apr 2023 08:42:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, eblake@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 arei.gonglei@huawei.com, pizhenwei@bytedance.com, jsnow@redhat.com,
 vsementsov@yandex-team.ru, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, quintela@redhat.com, jasowang@redhat.com,
 yuval.shaia.ml@gmail.com, stefanha@redhat.com, kraxel@redhat.com,
 kkostiuk@redhat.com, qemu-block@nongnu.org, marcandre.lureau@gmail.com,
 david@redhat.com
Subject: [PATCH v2 14/16] qapi: Fix misspelled section tags in doc comments
Date: Tue, 25 Apr 2023 08:42:21 +0200
Message-Id: <20230425064223.820979-15-armbru@redhat.com>
In-Reply-To: <20230425064223.820979-1-armbru@redhat.com>
References: <20230425064223.820979-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Section tags are case sensitive and end with a colon.  Screwing up
either gets them interpreted as ordinary paragraph.  Fix a few.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qapi/machine.json   | 4 ++--
 qapi/migration.json | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 5a18913767..fcd69965e5 100644
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


