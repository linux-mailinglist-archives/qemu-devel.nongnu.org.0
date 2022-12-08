Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 776DE6471FA
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 15:41:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3I3z-0001pu-Pa; Thu, 08 Dec 2022 09:39:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3I3x-0001oj-AD
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:39:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3I3u-0000GY-MJ
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:39:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670510386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SbnEfUnEEslNsVyNJzGQFFO2ov1RZX74a0CfLs63bO0=;
 b=Jh5KZNgmG1C8aMl403zKzyYBY4hKXihoYXMgHuHHjQJJqIHIU2DWzyrrFQzSt7H6xZALGP
 0hOv26KxRYv5w/kHaQNPlW6VqBcDrK7QAkAO+ZDMBVD2fA9W8dnY9Q6mqYuTpfiCe9Ty7+
 VppBEOB+7BaUS+tMzUzhA4B5IlEc7iw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-zMj9_W5MNkaenoJbR-qn_Q-1; Thu, 08 Dec 2022 09:39:42 -0500
X-MC-Unique: zMj9_W5MNkaenoJbR-qn_Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DB5B803533;
 Thu,  8 Dec 2022 14:39:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B28040C6EC2;
 Thu,  8 Dec 2022 14:39:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5D3FA21E688F; Thu,  8 Dec 2022 15:39:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	hreitz@redhat.com,
	qemu-block@nongnu.org
Subject: [PATCH 3/3] include/hw/block: Include hw/block/block.h where needed
Date: Thu,  8 Dec 2022 15:39:39 +0100
Message-Id: <20221208143939.2775453-4-armbru@redhat.com>
In-Reply-To: <20221208143939.2775453-1-armbru@redhat.com>
References: <20221208143939.2775453-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

hw/block/swim.h needs BlockConf.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/hw/block/swim.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/block/swim.h b/include/hw/block/swim.h
index c1bd5f6555..9b3dcb029d 100644
--- a/include/hw/block/swim.h
+++ b/include/hw/block/swim.h
@@ -11,6 +11,7 @@
 #ifndef SWIM_H
 #define SWIM_H
 
+#include "hw/block/block.h"
 #include "hw/sysbus.h"
 #include "qom/object.h"
 
-- 
2.37.3


