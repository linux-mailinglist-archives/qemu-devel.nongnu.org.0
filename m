Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1356645B84A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:22:07 +0100 (CET)
Received: from localhost ([::1]:37308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mppPi-0002pg-5w
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:22:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mppAq-0007hF-AR
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:06:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mppAc-0006hV-7u
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:06:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637748389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iPYxMrCOWugGC2Ig3skogvxaOmXOSxKYsh8Dbjvo4MY=;
 b=cXn0NFL2VLBUZQYueuKrteEAQC437k487w0UfmTzYvOD0C7e8UvDJd/9nuSYD4KwslFGKb
 bdQicqaGUJR3iw8Jn+SOn6izenhkff20r3jdt53Oo/BUQzacoJghVchm3GbkWIPD75x7pf
 Uvlb7l4ZDZ6G/KWj0zRERoa33zGFByc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-tu9JHYPJOgeaslc3hIJmhQ-1; Wed, 24 Nov 2021 05:06:28 -0500
X-MC-Unique: tu9JHYPJOgeaslc3hIJmhQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BECB83DD2D
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 10:06:27 +0000 (UTC)
Received: from redhat.mitica.com (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C985314104;
 Wed, 24 Nov 2021 10:06:25 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/23] multifd: Add missing documention
Date: Wed, 24 Nov 2021 11:05:58 +0100
Message-Id: <20211124100617.19786-5-quintela@redhat.com>
In-Reply-To: <20211124100617.19786-1-quintela@redhat.com>
References: <20211124100617.19786-1-quintela@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
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


