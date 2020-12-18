Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AB12DE278
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 13:13:18 +0100 (CET)
Received: from localhost ([::1]:47002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqEdI-0003hV-Vi
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 07:13:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEbB-0001qg-MW
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:11:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEb6-0001fH-6u
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:11:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608293459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9bXSjMFhnK3KRuZwSkGmvSVGzZQJgcjXl2wklsYBL7U=;
 b=F7vKDOIoRFV5+j3K4juRkSlnEulkBnSrsEzEgXL2SZ1JEK2QDNb8Isd1QBKbmLKNcM1Oy2
 8pQCQ9UjkkQmGzDnkuMEAzRMwF78y7kbjh2YXUrbqDlBSFhb8/aTcMwbYBQEN+wT/yRV2K
 op++ERdoHjc4ceyd+IrRwhBpIRTAAJE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-Nnp-ZrYENk2z2zhJCZSvOg-1; Fri, 18 Dec 2020 07:10:55 -0500
X-MC-Unique: Nnp-ZrYENk2z2zhJCZSvOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39009CE642;
 Fri, 18 Dec 2020 12:10:54 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-34.ams2.redhat.com [10.36.115.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FA8F60C15;
 Fri, 18 Dec 2020 12:10:53 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 06/17] MAINTAINERS: add Kevin Wolf as storage daemon maintainer
Date: Fri, 18 Dec 2020 13:10:30 +0100
Message-Id: <20201218121041.299788-7-kwolf@redhat.com>
In-Reply-To: <20201218121041.299788-1-kwolf@redhat.com>
References: <20201218121041.299788-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Stefan Hajnoczi <stefanha@redhat.com>

The MAINTAINERS file was not updated when the storage daemon was merged.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Acked-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201209103802.350848-4-stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e7c8f0488..0e139d9612 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2165,6 +2165,15 @@ F: qobject/block-qdict.c
 F: tests/check-block-qdict.c
 T: git https://repo.or.cz/qemu/kevin.git block
 
+Storage daemon
+M: Kevin Wolf <kwolf@redhat.com>
+L: qemu-block@nongnu.org
+S: Supported
+F: storage-daemon/
+F: docs/interop/qemu-storage-daemon-qmp-ref.rst
+F: docs/tools/qemu-storage-daemon.rst
+T: git https://repo.or.cz/qemu/kevin.git block
+
 Block I/O path
 M: Stefan Hajnoczi <stefanha@redhat.com>
 M: Fam Zheng <fam@euphon.net>
-- 
2.29.2


