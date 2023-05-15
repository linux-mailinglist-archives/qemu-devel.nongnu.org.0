Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD2D702605
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 09:27:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pySb8-0007Sp-84; Mon, 15 May 2023 03:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1pySaY-0007OM-Fh
 for qemu-devel@nongnu.org; Mon, 15 May 2023 03:25:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shahuang@redhat.com>)
 id 1pySaV-0003V5-VA
 for qemu-devel@nongnu.org; Mon, 15 May 2023 03:25:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684135535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/S2eYSKJnwfoPIHT5pwUtY9lbcWZORchQNUb2AkrBK4=;
 b=Zw+mGC6w/I7RHXYy+diby1SfOx1ySKTH+W6HCF2Zas4MKuDzpJOhFe7nkd5spTG3WMfHbS
 PGaSbw0XwFI9UqzL6xJwFOcPE/6geqcrflzWdSd9vDowwfAa/NMz4X8TS8Y0knJbGLCTiI
 GPHfClKif/OVMjRcZDPs0527xZpVBSk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-lrRyHuJOOo61jHXRU5djKA-1; Mon, 15 May 2023 03:25:30 -0400
X-MC-Unique: lrRyHuJOOo61jHXRU5djKA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9708E185A79C;
 Mon, 15 May 2023 07:25:29 +0000 (UTC)
Received: from virt-mtcollins-01.lab.eng.rdu2.redhat.com
 (virt-mtcollins-01.lab.eng.rdu2.redhat.com [10.8.1.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 695BA63F3D;
 Mon, 15 May 2023 07:25:29 +0000 (UTC)
From: Shaoqin Huang <shahuang@redhat.com>
To: qemu-devel@nongnu.org
Cc: Shaoqin Huang <shahuang@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH] hw: Fix format for comments
Date: Mon, 15 May 2023 03:25:25 -0400
Message-Id: <20230515072525.886221-1-shahuang@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=shahuang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

CC: Igor Mammedov <imammedo@redhat.com>
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


