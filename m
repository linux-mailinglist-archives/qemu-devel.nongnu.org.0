Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 717B23E1CD1
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 21:36:12 +0200 (CEST)
Received: from localhost ([::1]:55090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBjA3-0003vV-Fx
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 15:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mBj8c-0001Y4-TP
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:34:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mBj8b-0001ow-Jh
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:34:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628192081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jE/f6hqX/+iNs4/llyvRovOTFCJT/e+p+d4+5+en0/I=;
 b=OYtTrHjJgekZJ41ctfpzRXJURktAO3zy2uaqG2a1znMDbefogLLWE6zgOmh/hHSy5QNiQz
 jNQVU38bsYBF7xhIAYVbSw8/wkNMZU5TP30YAhOCHsloEjON5+7dwfV17+uoMIl3FfjByz
 +OR5tFplTWoqny4cQ9lGqu1+MyVO81s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-_hPGn9zzOYOutMBdcrs6Kg-1; Thu, 05 Aug 2021 15:34:39 -0400
X-MC-Unique: _hPGn9zzOYOutMBdcrs6Kg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AED681800D41
 for <qemu-devel@nongnu.org>; Thu,  5 Aug 2021 19:34:38 +0000 (UTC)
Received: from localhost (unknown [10.22.11.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE7FB67899;
 Thu,  5 Aug 2021 19:34:32 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 1/6] acpi: Delete broken ACPI_GED_X86 macro
Date: Thu,  5 Aug 2021 15:34:26 -0400
Message-Id: <20210805193431.307761-2-ehabkost@redhat.com>
In-Reply-To: <20210805193431.307761-1-ehabkost@redhat.com>
References: <20210805193431.307761-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The macro never worked and never will, because the
AcpiGedX86State type never existed.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org
---
 include/hw/acpi/generic_event_device.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index 6bed92e8fc5..d49217c445f 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -70,8 +70,6 @@
 OBJECT_DECLARE_SIMPLE_TYPE(AcpiGedState, ACPI_GED)
 
 #define TYPE_ACPI_GED_X86 "acpi-ged-x86"
-#define ACPI_GED_X86(obj) \
-    OBJECT_CHECK(AcpiGedX86State, (obj), TYPE_ACPI_GED_X86)
 
 #define ACPI_GED_EVT_SEL_OFFSET    0x0
 #define ACPI_GED_EVT_SEL_LEN       0x4
-- 
2.31.1


