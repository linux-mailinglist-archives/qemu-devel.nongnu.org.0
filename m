Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 397953551D1
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 13:18:57 +0200 (CEST)
Received: from localhost ([::1]:50550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTjjU-0003Nd-AV
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 07:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lTjf4-0000Tj-RM
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 07:14:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lTjf3-0005vQ-8q
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 07:14:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617707660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=86rFKf/dpnhWd5MFpmO2yEWECsP2Q5v5meodLK7mXCw=;
 b=d9WIzlvMnJAYDtLGvq4/Zi8IyjCF1F/Mkxjj9qUJTPz4PYmUe3C3wUC7Z1ViySnsgPbCGN
 GlQgdS6AdHmOF4kn9sQ9+xUEIt+kKTAivojT67IgtYAtBdsUvyr3m0EipPw/5ggW8um94F
 9/50EA0uWeqBzuw/tkVSmzHLfqWfa4c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-FM4NzLYoPL2DH-x_cw2OMQ-1; Tue, 06 Apr 2021 07:14:18 -0400
X-MC-Unique: FM4NzLYoPL2DH-x_cw2OMQ-1
Received: by mail-wr1-f69.google.com with SMTP id t14so9794424wrx.12
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 04:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=86rFKf/dpnhWd5MFpmO2yEWECsP2Q5v5meodLK7mXCw=;
 b=klejvO47Zr0NSl8KfR166EvMTUXc6CXwPkCA+BBItYOQ+WFQJwHQMvIUSu3AuNV8l2
 wXAKwEh2WmjgsaVeNQr2PL13BTRyqsC3WHXL6nDmRGuYvRlmeC/ODa4HTntwj6SzE/B+
 PErMOJgGWAmeW2bnOuq2EP/Nxpyo6xWB0QUD1ohusRD7IXt+bg8fP2ijvf5jipyCN9u0
 ncWhKLZAOBNgkUVC1iffQexvyeo00lfp/Az6+1q9rXZcTZapFJSzYsfTFHde6RLVoYK9
 ODpxac2oINQGcZbM8y1Od3KG7haE0dHWTVPE2UtTQXGUcrLAdWbmw8svdHC9MVZLEBjF
 6/pA==
X-Gm-Message-State: AOAM530f4dBj7aeufdgW9fF0kqFIWR1MHkPw3FLbIumPVAcWJ5TyaGj6
 fUZsQ8NogNPxpbASDlh2Rfb4O9tdXKv19RK/pUUjgn5ycGgxDw8NREUgiwk4J9zK+yhlC4LoyIZ
 wTeLgidR9DTFfCbJ1SehnEtQG6cw+AhQNpHFLIOFYgqdwT5bwYzs8Wy2dgZ5V
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr35814637wrn.338.1617707656983; 
 Tue, 06 Apr 2021 04:14:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3cwNKNV+qW7g6E3EVLa3uHDlMmd8fXhxLlUrUN2hrNSNJIDy07rM4/6kLKdsJKwj6D5SFcQ==
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr35814617wrn.338.1617707656824; 
 Tue, 06 Apr 2021 04:14:16 -0700 (PDT)
Received: from redhat.com (bzq-79-183-252-180.red.bezeqint.net.
 [79.183.252.180])
 by smtp.gmail.com with ESMTPSA id o1sm4834072wrw.23.2021.04.06.04.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 04:14:16 -0700 (PDT)
Date: Tue, 6 Apr 2021 07:14:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] x86: rename oem-id and oem-table-id properties
Message-ID: <20210406111359.302193-2-mst@redhat.com>
References: <20210406111359.302193-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210406111359.302193-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

After introducing non-scalar machine properties, it would be preferrable
to have a single acpitable property which includes both generic
information (such as the OEM ids) and custom tables currently
passed via -acpitable.

Do not saddle ourselves with legacy oem-id and oem-table-id
properties, instead mark them as experimental.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210402082128.13854-1-pbonzini@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/i386/x86.h          | 4 ++--
 hw/arm/virt.c                  | 8 ++++----
 tests/qtest/bios-tables-test.c | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 26c9cc45a4..c09b648dff 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -78,8 +78,8 @@ struct X86MachineState {
 
 #define X86_MACHINE_SMM              "smm"
 #define X86_MACHINE_ACPI             "acpi"
-#define X86_MACHINE_OEM_ID           "oem-id"
-#define X86_MACHINE_OEM_TABLE_ID     "oem-table-id"
+#define X86_MACHINE_OEM_ID           "x-oem-id"
+#define X86_MACHINE_OEM_TABLE_ID     "x-oem-table-id"
 
 #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
 OBJECT_DECLARE_TYPE(X86MachineState, X86MachineClass, X86_MACHINE)
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index aa2bbd14e0..bc5f948367 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2670,19 +2670,19 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "Set on/off to enable/disable "
                                           "ITS instantiation");
 
-    object_class_property_add_str(oc, "oem-id",
+    object_class_property_add_str(oc, "x-oem-id",
                                   virt_get_oem_id,
                                   virt_set_oem_id);
-    object_class_property_set_description(oc, "oem-id",
+    object_class_property_set_description(oc, "x-oem-id",
                                           "Override the default value of field OEMID "
                                           "in ACPI table header."
                                           "The string may be up to 6 bytes in size");
 
 
-    object_class_property_add_str(oc, "oem-table-id",
+    object_class_property_add_str(oc, "x-oem-table-id",
                                   virt_get_oem_table_id,
                                   virt_set_oem_table_id);
-    object_class_property_set_description(oc, "oem-table-id",
+    object_class_property_set_description(oc, "x-oem-table-id",
                                           "Override the default value of field OEM Table ID "
                                           "in ACPI table header."
                                           "The string may be up to 8 bytes in size");
diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index e020c83d2a..156d4174aa 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -73,7 +73,7 @@
 
 #define OEM_ID             "TEST"
 #define OEM_TABLE_ID       "OEM"
-#define OEM_TEST_ARGS      "-machine oem-id="OEM_ID",oem-table-id="OEM_TABLE_ID
+#define OEM_TEST_ARGS      "-machine x-oem-id="OEM_ID",x-oem-table-id="OEM_TABLE_ID
 
 typedef struct {
     bool tcg_only;
-- 
MST


