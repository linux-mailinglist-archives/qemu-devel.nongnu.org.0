Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D8261004E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 20:35:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7fo-00017W-5v; Thu, 27 Oct 2022 14:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7fk-00015S-I8
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7fi-0002Kj-Pg
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QrQh4F+16yPErQW8AxYex4ZMAJxGLbSFFsGUqhjzynM=;
 b=LfZTWCJ3CYH2qqFDGo/HHykRtf//j0NWKih1PderlWSsqxtnnQ7lxj3D6+7SEk4lXMMr5c
 /ZKgNdtFMJ27aedkStVp/Z/vFDFbqOyQOTLh1yIQyuCK+8vO8NEyryemsFjyCpiwKFMCfB
 QstDNzu5a04+wzFiKQX3nFDwU/dBpiA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-Ecv6N4_UN6i_QgC8yV-69g-1; Thu, 27 Oct 2022 14:32:04 -0400
X-MC-Unique: Ecv6N4_UN6i_QgC8yV-69g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFC01858F13;
 Thu, 27 Oct 2022 18:32:03 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5294F112C06B;
 Thu, 27 Oct 2022 18:31:55 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 01/58] MAINTAINERS: Fold "Block QAPI, monitor,
 ..." into "Block layer core"
Date: Thu, 27 Oct 2022 20:30:49 +0200
Message-Id: <20221027183146.463129-2-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Markus Armbruster <armbru@redhat.com>

Section "Block QAPI, monitor, command line" is about the external
interfaces we provide for block devices.  It covers the relevant QAPI
schema parts, monitor and command line code, more or less.

The section's files are also covered by section "Block layer core",
except for the QAPI schema files.

I haven't acted as maintainer in this area for a long time.  Make it
official: add the QAPI schema files to section "Block layer core", and
delete section "Block QAPI, monitor, command line".

Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20221020120541.80757-1-armbru@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 MAINTAINERS | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 32e495e165..07a022b0d0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2509,6 +2509,8 @@ S: Supported
 F: block*
 F: block/
 F: hw/block/
+F: qapi/block*.json
+F: qapi/transaction.json
 F: include/block/
 F: qemu-img*
 F: docs/tools/qemu-img.rst
@@ -2582,16 +2584,6 @@ F: include/qemu/co-shared-resource.h
 T: git https://gitlab.com/jsnow/qemu.git jobs
 T: git https://gitlab.com/vsementsov/qemu.git block
 
-Block QAPI, monitor, command line
-M: Markus Armbruster <armbru@redhat.com>
-S: Supported
-F: blockdev.c
-F: blockdev-hmp-cmds.c
-F: block/qapi.c
-F: qapi/block*.json
-F: qapi/transaction.json
-T: git https://repo.or.cz/qemu/armbru.git block-next
-
 Compute Express Link
 M: Ben Widawsky <ben.widawsky@intel.com>
 M: Jonathan Cameron <jonathan.cameron@huawei.com>
-- 
2.37.3


