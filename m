Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FC62815D7
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 16:54:01 +0200 (CEST)
Received: from localhost ([::1]:55086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOMRc-0005RZ-Lb
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 10:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kOMI4-0001A4-Pj
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 10:44:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kOMI2-0004Vb-72
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 10:44:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601649842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XFeys0fRkZF7aSyHogMPVsv8NICGMjYTpS3rySG33Nk=;
 b=f6gUeeoEyX+cApk3lCofuRz2wQo/hnN/g/LhZY42wrWWwyiTY4njLkdGQDE3nQug1zmDbT
 6tE/flWzr1JaMum89vweWfuBAWXL+XTcwQ35XhlYR8LJAJbfx6tHCB5hGaginlQKsAsBvs
 SgnZ/d4TH0MvMBF+cR1HrBZGnkJbAfM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-9bvrpNG8Ndm0DkD8z7wHtQ-1; Fri, 02 Oct 2020 10:43:58 -0400
X-MC-Unique: 9bvrpNG8Ndm0DkD8z7wHtQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74BBC80B71B;
 Fri,  2 Oct 2020 14:43:57 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-112-139.ams2.redhat.com
 [10.36.112.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DFF65D9D5;
 Fri,  2 Oct 2020 14:43:56 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 05/37] nbd: Remove unused nbd_export_get_blockdev()
Date: Fri,  2 Oct 2020 16:43:13 +0200
Message-Id: <20201002144345.253865-6-kwolf@redhat.com>
In-Reply-To: <20201002144345.253865-1-kwolf@redhat.com>
References: <20201002144345.253865-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 23:37:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20200924152717.287415-2-kwolf@redhat.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/nbd.h | 2 --
 nbd/server.c        | 5 -----
 2 files changed, 7 deletions(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 9bc3bfaeec..0451683d03 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -338,8 +338,6 @@ void nbd_export_remove(NBDExport *exp, NbdServerRemoveMode mode, Error **errp);
 void nbd_export_get(NBDExport *exp);
 void nbd_export_put(NBDExport *exp);
 
-BlockBackend *nbd_export_get_blockdev(NBDExport *exp);
-
 AioContext *nbd_export_aio_context(NBDExport *exp);
 NBDExport *nbd_export_find(const char *name);
 void nbd_export_close_all(void);
diff --git a/nbd/server.c b/nbd/server.c
index 982de67816..bd53f7baea 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1731,11 +1731,6 @@ void nbd_export_put(NBDExport *exp)
     }
 }
 
-BlockBackend *nbd_export_get_blockdev(NBDExport *exp)
-{
-    return exp->blk;
-}
-
 void nbd_export_close_all(void)
 {
     NBDExport *exp, *next;
-- 
2.25.4


