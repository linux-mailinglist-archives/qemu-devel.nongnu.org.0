Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D887861129D
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:25:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPKZ-0001EK-QA; Fri, 28 Oct 2022 09:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKM-0000wW-Pg
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKK-0005Gf-Ot
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666963391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O69b7ToGLa0VIKZ6QG1+wEQwPv38BGFRRKNXgqoY2x0=;
 b=XTuwkYQnTAFp8X3hc0aY9N4gqZPj9bIJ2PfYbmZloYvbi7SEiTsS1WvNlOwFS2F2tpqTM7
 GurKyBNwVdlEEhja8Gm2XoAJFVBj/vf6A7XHxcBj/E7SFEYgSWI2+dK7V4r3BTLXDWUwjY
 NE5/kzwxfzvOz0z/0Em0AqNEEMHo3cA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-7eZ9HSscM3mHRrnmZTttFQ-1; Fri, 28 Oct 2022 09:23:10 -0400
X-MC-Unique: 7eZ9HSscM3mHRrnmZTttFQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D682F88B7A6;
 Fri, 28 Oct 2022 13:23:09 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BFB11121319;
 Fri, 28 Oct 2022 13:23:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PULL 01/21] s390x/pv: remove semicolon from macro definition
Date: Fri, 28 Oct 2022 15:22:44 +0200
Message-Id: <20221028132304.829103-2-thuth@redhat.com>
In-Reply-To: <20221028132304.829103-1-thuth@redhat.com>
References: <20221028132304.829103-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Claudio Imbrenda <imbrenda@linux.ibm.com>

Remove spurious semicolon at the end of the macro s390_pv_cmd

Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20221010151041.89071-1-imbrenda@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/s390x/pv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
index 728ba24547..8dfe92d8df 100644
--- a/hw/s390x/pv.c
+++ b/hw/s390x/pv.c
@@ -50,7 +50,7 @@ static int __s390_pv_cmd(uint32_t cmd, const char *cmdname, void *data)
  * This macro lets us pass the command as a string to the function so
  * we can print it on an error.
  */
-#define s390_pv_cmd(cmd, data) __s390_pv_cmd(cmd, #cmd, data);
+#define s390_pv_cmd(cmd, data) __s390_pv_cmd(cmd, #cmd, data)
 #define s390_pv_cmd_exit(cmd, data)    \
 {                                      \
     int rc;                            \
-- 
2.31.1


