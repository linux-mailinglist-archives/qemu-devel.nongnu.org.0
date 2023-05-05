Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 219356F7DC3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 09:26:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pupoV-0003vG-6c; Fri, 05 May 2023 03:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1pupoT-0003ut-27
 for qemu-devel@nongnu.org; Fri, 05 May 2023 03:25:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1pupoQ-0006Kh-Ju
 for qemu-devel@nongnu.org; Fri, 05 May 2023 03:25:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683271503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=S4s+CdegEKJyVY8JCgfOQ/BbCJ5bdLAKHScJo39rufI=;
 b=BIvZo3Xmk+TYmM5I7tIegH4cfGMJWHWa4NdihAuRYtW6mGjye8u6KyLTOrPCRg4ESJn0Ff
 acJZ1oXkOqZmBz+jMXsmA4BKoIsNlOQE1oShLcPWlUEhJS4qdE0k+9VtK7D3l0Ddi7Zkdc
 tsGV2AVGIspncWHgI0hdTGoZ3hhtUkA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-a7hM_m81Pt6C_Y1xnEk0gQ-1; Fri, 05 May 2023 03:23:47 -0400
X-MC-Unique: a7hM_m81Pt6C_Y1xnEk0gQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 460193800C4D;
 Fri,  5 May 2023 07:23:47 +0000 (UTC)
Received: from virt-mtcollins-01.lab.eng.rdu2.redhat.com
 (virt-mtcollins-01.lab.eng.rdu2.redhat.com [10.8.1.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0227D2026DFD;
 Fri,  5 May 2023 07:23:47 +0000 (UTC)
From: Shaoqin Huang <shahuang@redhat.com>
To: qemu-devel@nongnu.org
Cc: Shaoqin Huang <shahuang@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH] hw: Fix format for comments
Date: Fri,  5 May 2023 03:23:35 -0400
Message-Id: <20230505072335.476438-1-shahuang@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=shahuang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Simply fix the #vcpus_count to @vcpus_count in CPUArchId comments. Since
we are at here, resort the parameters in comments to match the sequence
of parameters which defined in the CPUArchId.

Signed-off-by: Shaoqin Huang <shahuang@redhat.com>
---
 include/hw/boards.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index f4117fdb9a..cefa3d5897 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -101,10 +101,10 @@ MemoryRegion *machine_consume_memdev(MachineState *machine,
 /**
  * CPUArchId:
  * @arch_id - architecture-dependent CPU ID of present or possible CPU
+ * @vcpus_count - number of threads provided by @cpu object
+ * @props - CPU object properties, initialized by board
  * @cpu - pointer to corresponding CPU object if it's present on NULL otherwise
  * @type - QOM class name of possible @cpu object
- * @props - CPU object properties, initialized by board
- * #vcpus_count - number of threads provided by @cpu object
  */
 typedef struct CPUArchId {
     uint64_t arch_id;
-- 
2.39.1


