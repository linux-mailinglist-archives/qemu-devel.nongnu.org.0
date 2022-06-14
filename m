Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3324454AECC
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 12:50:07 +0200 (CEST)
Received: from localhost ([::1]:50920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o147a-0004Gb-A6
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 06:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o13yz-0004vs-EL
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 06:41:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o13ym-000374-Fx
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 06:41:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655203259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5JKtGqU3eI1v+0sNBNtVPG7TVBgoksXbfo40t6iY2Ag=;
 b=HOLnqQttJkhcanbwhHlhRNdvNqWPxkw5d7NFufvtzrlB0b0WfRks64PFdU8y0PKnFnGh6Q
 xCw2xaKhPROPLnY0dY5TePCipoqX5dA+x6DoZEEtTbvUzNEbsk7vZ0RRXZB8gK0H7wEc9g
 LZ13Q9z9faMgQRR9AP1P1u3MVjB4okI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-r2WxgE0yO3ChunAyl0rNIw-1; Tue, 14 Jun 2022 06:40:56 -0400
X-MC-Unique: r2WxgE0yO3ChunAyl0rNIw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD840299E757;
 Tue, 14 Jun 2022 10:40:55 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F341492C3B;
 Tue, 14 Jun 2022 10:40:54 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, laurent@vivier.eu,
 mjt@tls.msk.ru
Cc: danielhb413@gmail.com, clg@kaod.org, mst@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, kbusch@kernel.org, its@irrelevant.dk
Subject: [PATCH 2/2] trivial typos: namesapce
Date: Tue, 14 Jun 2022 11:40:45 +0100
Message-Id: <20220614104045.85728-3-dgilbert@redhat.com>
In-Reply-To: <20220614104045.85728-1-dgilbert@redhat.com>
References: <20220614104045.85728-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

'namespace' is misspelled in a bunch of places.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/9pfs/9p-xattr-user.c | 8 ++++----
 hw/acpi/nvdimm.c        | 2 +-
 hw/nvme/ctrl.c          | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/9pfs/9p-xattr-user.c b/hw/9pfs/9p-xattr-user.c
index f2ae9582e6..535677ed60 100644
--- a/hw/9pfs/9p-xattr-user.c
+++ b/hw/9pfs/9p-xattr-user.c
@@ -27,7 +27,7 @@ static ssize_t mp_user_getxattr(FsContext *ctx, const char *path,
 {
     if (strncmp(name, "user.virtfs.", 12) == 0) {
         /*
-         * Don't allow fetch of user.virtfs namesapce
+         * Don't allow fetch of user.virtfs namespace
          * in case of mapped security
          */
         errno = ENOATTR;
@@ -49,7 +49,7 @@ static ssize_t mp_user_listxattr(FsContext *ctx, const char *path,
             name_size -= 12;
         } else {
             /*
-             * Don't allow fetch of user.virtfs namesapce
+             * Don't allow fetch of user.virtfs namespace
              * in case of mapped security
              */
             return 0;
@@ -74,7 +74,7 @@ static int mp_user_setxattr(FsContext *ctx, const char *path, const char *name,
 {
     if (strncmp(name, "user.virtfs.", 12) == 0) {
         /*
-         * Don't allow fetch of user.virtfs namesapce
+         * Don't allow fetch of user.virtfs namespace
          * in case of mapped security
          */
         errno = EACCES;
@@ -88,7 +88,7 @@ static int mp_user_removexattr(FsContext *ctx,
 {
     if (strncmp(name, "user.virtfs.", 12) == 0) {
         /*
-         * Don't allow fetch of user.virtfs namesapce
+         * Don't allow fetch of user.virtfs namespace
          * in case of mapped security
          */
         errno = EACCES;
diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index 0d43da19ea..5f85b16327 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -476,7 +476,7 @@ struct NvdimmFuncGetLabelDataOut {
     /* the size of buffer filled by QEMU. */
     uint32_t len;
     uint32_t func_ret_status; /* return status code. */
-    uint8_t out_buf[]; /* the data got via Get Namesapce Label function. */
+    uint8_t out_buf[]; /* the data got via Get Namespace Label function. */
 } QEMU_PACKED;
 typedef struct NvdimmFuncGetLabelDataOut NvdimmFuncGetLabelDataOut;
 QEMU_BUILD_BUG_ON(sizeof(NvdimmFuncGetLabelDataOut) > NVDIMM_DSM_MEMORY_SIZE);
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 1e6e0fcad9..770a38381a 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -71,7 +71,7 @@
  *   the SUBNQN field in the controller will report the NQN of the subsystem
  *   device. This also enables multi controller capability represented in
  *   Identify Controller data structure in CMIC (Controller Multi-path I/O and
- *   Namesapce Sharing Capabilities).
+ *   Namespace Sharing Capabilities).
  *
  * - `aerl`
  *   The Asynchronous Event Request Limit (AERL). Indicates the maximum number
-- 
2.36.1


