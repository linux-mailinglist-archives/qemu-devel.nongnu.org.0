Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E93386482ED
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 14:50:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3dk7-0006jZ-7l; Fri, 09 Dec 2022 08:48:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3dk4-0006ie-DS
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 08:48:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3dk1-0004ID-E5
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 08:48:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670593688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cHNNOMftHE8TT7dY5U4fmIBkZ/pg4WXNwlnLzXnUoZ0=;
 b=LeGSJkzK1qBL4uULZHwC1SEwLc8d8WkqDu0Nd3aLsH/P7q9FnFw9eXn/FQRPSpWnJnzfhA
 9o5z3afKgUK7BCZR4rn8aUTUhzghETmni7iYhSWp2JmT2btqbyF2E8UfnhXBlz12GmdVTA
 +ew8+gTGOb7gYnQe8FJSH4u4mKJs6B4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-EF794Mt1ODuVaIrnW6MZgw-1; Fri, 09 Dec 2022 08:48:06 -0500
X-MC-Unique: EF794Mt1ODuVaIrnW6MZgw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44127101A54E;
 Fri,  9 Dec 2022 13:48:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E81794C819;
 Fri,  9 Dec 2022 13:48:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DAA6721E6936; Fri,  9 Dec 2022 14:48:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, ben.widawsky@intel.com,
 jonathan.cameron@huawei.com, philmd@linaro.org
Subject: [PATCH 2/5] include/hw/cxl: Include hw/cxl/*.h where needed
Date: Fri,  9 Dec 2022 14:47:59 +0100
Message-Id: <20221209134802.3642942-3-armbru@redhat.com>
In-Reply-To: <20221209134802.3642942-1-armbru@redhat.com>
References: <20221209134802.3642942-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

hw/cxl/cxl_component.h needs CDATObject from hw/cxl/cxl_cdat.h.

hw/cxl/cxl_device.h needs CXLComponentState from
hw/cxl/cxl_component.h.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/hw/cxl/cxl_component.h | 1 +
 include/hw/cxl/cxl_device.h    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_component.h
index 34075cfb72..5dca21e95b 100644
--- a/include/hw/cxl/cxl_component.h
+++ b/include/hw/cxl/cxl_component.h
@@ -18,6 +18,7 @@
 #include "qemu/compiler.h"
 #include "qemu/range.h"
 #include "qemu/typedefs.h"
+#include "hw/cxl/cxl_cdat.h"
 #include "hw/register.h"
 #include "qapi/error.h"
 
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index fd475b947b..3f91969db0 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -10,6 +10,7 @@
 #ifndef CXL_DEVICE_H
 #define CXL_DEVICE_H
 
+#include "hw/cxl/cxl_component.h"
 #include "hw/pci/pci.h"
 #include "hw/register.h"
 
-- 
2.37.3


