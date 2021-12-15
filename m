Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA064756F4
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 11:53:04 +0100 (CET)
Received: from localhost ([::1]:53764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxRuB-000498-Fv
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 05:53:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxRae-00035C-NM
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:32:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxRac-0007L9-8y
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:32:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639564369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wsfxd9XwcRU5pI+YwEZgrYoeYMg68pl5ZZXO9chqf0U=;
 b=QOi+zXHloK37vUTPQTWNyh6AEaB0+4iFUJHrWGCjirYxWd+plQIfENHyVg4QFEGGxdZhoQ
 ioi7eEdB11Y0uM0GPi0l1dMmTA4NYg/vxQZJbl/6Wztiv8I9l5uumijxsP15fZoBAUFPNl
 taZIWDVVXRwgpVekdmRjUqQ/kk2pPk0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-Y5Yod4D8MkqVLcE54pUqmw-1; Wed, 15 Dec 2021 05:32:46 -0500
X-MC-Unique: Y5Yod4D8MkqVLcE54pUqmw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83686190A7A0;
 Wed, 15 Dec 2021 10:32:45 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 599AF6E978;
 Wed, 15 Dec 2021 10:32:40 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/18] multifd: Add missing documention
Date: Wed, 15 Dec 2021 11:32:10 +0100
Message-Id: <20211215103218.17527-11-quintela@redhat.com>
In-Reply-To: <20211215103218.17527-1-quintela@redhat.com>
References: <20211215103218.17527-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/multifd-zlib.c | 2 ++
 migration/multifd-zstd.c | 2 ++
 migration/multifd.c      | 1 +
 3 files changed, 5 insertions(+)

diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index 3fc7813b44..d0437cce2a 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -72,6 +72,7 @@ static int zlib_send_setup(MultiFDSendParams *p, Error **errp)
  * Close the channel and return memory.
  *
  * @p: Params for the channel that we are using
+ * @errp: pointer to an error
  */
 static void zlib_send_cleanup(MultiFDSendParams *p, Error **errp)
 {
@@ -94,6 +95,7 @@ static void zlib_send_cleanup(MultiFDSendParams *p, Error **errp)
  *
  * @p: Params for the channel that we are using
  * @used: number of pages used
+ * @errp: pointer to an error
  */
 static int zlib_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
 {
diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index cc3b8869c0..09ae1cf91a 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -84,6 +84,7 @@ static int zstd_send_setup(MultiFDSendParams *p, Error **errp)
  * Close the channel and return memory.
  *
  * @p: Params for the channel that we are using
+ * @errp: pointer to an error
  */
 static void zstd_send_cleanup(MultiFDSendParams *p, Error **errp)
 {
@@ -107,6 +108,7 @@ static void zstd_send_cleanup(MultiFDSendParams *p, Error **errp)
  *
  * @p: Params for the channel that we are using
  * @used: number of pages used
+ * @errp: pointer to an error
  */
 static int zstd_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
 {
diff --git a/migration/multifd.c b/migration/multifd.c
index 8ea86d81dc..cdeffdc4c5 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -66,6 +66,7 @@ static int nocomp_send_setup(MultiFDSendParams *p, Error **errp)
  * For no compression this function does nothing.
  *
  * @p: Params for the channel that we are using
+ * @errp: pointer to an error
  */
 static void nocomp_send_cleanup(MultiFDSendParams *p, Error **errp)
 {
-- 
2.33.1


