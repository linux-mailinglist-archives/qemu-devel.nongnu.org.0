Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D7762587A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 11:36:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otRJP-0007Xj-HO; Fri, 11 Nov 2022 05:31:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1otRJJ-0007Sx-Bs
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:30:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1otRJH-0000ew-FA
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 05:30:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668162654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hO0blnUiKklTUc6JYlVnaGbNc2kBwJ0tpMZ4AMe1CZE=;
 b=O498NHiysljv1ug9Jrn7UnJMaY57R2EZvnhvSfOhw/3vDpBYK4DVnYFA2Y0ASoLvhyHpsB
 HOJArI/JTGOPa+a5LLiZdIm3fopnnjuPcfmZluvg5Rwl2WL05P3o6VmRx09dVIKROSDdzY
 1N/dM/QCq0FsXuWb3//dCYYgzemVnmg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-hNXOWSsSNhit_TF_fUrQVQ-1; Fri, 11 Nov 2022 05:30:53 -0500
X-MC-Unique: hNXOWSsSNhit_TF_fUrQVQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10A66811E67
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 10:30:53 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 829642023A16;
 Fri, 11 Nov 2022 10:30:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Miroslav Rezanina <mrezanin@redhat.com>
Subject: [PULL 3/8] qemu-img: remove unused variable
Date: Fri, 11 Nov 2022 11:30:43 +0100
Message-Id: <20221111103048.202519-4-thuth@redhat.com>
In-Reply-To: <20221111103048.202519-1-thuth@redhat.com>
References: <20221111103048.202519-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Miroslav Rezanina <mrezanin@redhat.com>

Variable block_count used in img_dd function is only incremented but never read.
This causes 'Unused but set variable' warning on Clang 15.0.1 compiler.

Removing the variable to prevent the warning.

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <e86d5b57f9d13bde995c616a533b876f1fb8a527.1668009030.git.mrezanin@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-img.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index a3b64c88af..a9b3a8103c 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -4922,7 +4922,7 @@ static int img_dd(int argc, char **argv)
     const char *out_fmt = "raw";
     const char *fmt = NULL;
     int64_t size = 0;
-    int64_t block_count = 0, out_pos, in_pos;
+    int64_t out_pos, in_pos;
     bool force_share = false;
     struct DdInfo dd = {
         .flags = 0,
@@ -5122,7 +5122,7 @@ static int img_dd(int argc, char **argv)
 
     in.buf = g_new(uint8_t, in.bsz);
 
-    for (out_pos = 0; in_pos < size; block_count++) {
+    for (out_pos = 0; in_pos < size; ) {
         int bytes = (in_pos + in.bsz > size) ? size - in_pos : in.bsz;
 
         ret = blk_pread(blk1, in_pos, bytes, in.buf, 0);
-- 
2.31.1


