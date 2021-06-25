Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F7E3B40BE
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:43:38 +0200 (CEST)
Received: from localhost ([::1]:41690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwiN7-0001BL-5k
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwi07-0003gZ-CA
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:19:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwhzx-0007Ca-Ft
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:19:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624612780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=725ubNB6VE7/IiJdws+rrmWLkX+G9bv+UWr4Egjlim8=;
 b=N/zGbN4gsDIwSVekyyvY2AS+i+5/WGr/PuN0ssM1qwBwW7x03B5wISdWpHa58ILnf6qHaa
 DRspdQ63PXtAfNsEcoorROcRffUf/5lfXLMD1jKPbvIX0DrYGg0FhTnjNlTGrEDhBZPB04
 3hXULbIrTAmw8XiI2F7IaYfi1o4gEho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-22QB1pBMMUemVCWn87-1nA-1; Fri, 25 Jun 2021 05:19:38 -0400
X-MC-Unique: 22QB1pBMMUemVCWn87-1nA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83C47802C80
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 09:19:37 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB8E460C05;
 Fri, 25 Jun 2021 09:19:36 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 40/53] acpi: x86: remove dead code
Date: Fri, 25 Jun 2021 05:18:05 -0400
Message-Id: <20210625091818.1047980-42-imammedo@redhat.com>
In-Reply-To: <20210625091818.1047980-1-imammedo@redhat.com>
References: <20210625091818.1047980-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/acpi/acpi-defs.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index c7fa5caa06..af4fa412a5 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -163,19 +163,6 @@ struct AcpiFacsDescriptorRev1 {
 } QEMU_PACKED;
 typedef struct AcpiFacsDescriptorRev1 AcpiFacsDescriptorRev1;
 
-/*
- * Differentiated System Description Table (DSDT)
- */
-
-/*
- * MADT values and structures
- */
-
-/* Values for MADT PCATCompat */
-
-#define ACPI_DUAL_PIC                0
-#define ACPI_MULTIPLE_APIC           1
-
 /* Values for Type in APIC sub-headers */
 
 #define ACPI_APIC_PROCESSOR          0
-- 
2.27.0


