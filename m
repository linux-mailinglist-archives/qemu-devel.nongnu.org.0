Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2274E1F6260
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 09:33:57 +0200 (CEST)
Received: from localhost ([::1]:45090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjHim-0005DO-6L
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 03:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jjHeo-0000Bn-Af
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 03:29:50 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:46555
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jjHen-0004js-Jo
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 03:29:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591860589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=7pT/m32IlVrGoibXKxVStOiRuQansqkMi2DPhVM/YD0=;
 b=MFhg+3RkYItadOaGkJ+h1hbfkdEuI8a2Oj8yed8Et1Zy9+VDfqq/9G9McOt3ERtflW7j1E
 vQM93TyP9tCdRI/lVAeRUikGq9nOIH//ewYRw+KQYwvAzCyi/1Kc2Kqfb45D/yMvKYpvHj
 fYkG7a2fWPWDzY92E6rhTXJpme5hllY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-V97QMCPxPW-mr6oN4tOjdw-1; Thu, 11 Jun 2020 03:29:45 -0400
X-MC-Unique: V97QMCPxPW-mr6oN4tOjdw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C66E1009616;
 Thu, 11 Jun 2020 07:29:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 160D76E71C;
 Thu, 11 Jun 2020 07:29:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 011669D56; Thu, 11 Jun 2020 09:29:20 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 08/10] acpi: drop serial/parallel enable bits from dsdt
Date: Thu, 11 Jun 2020 09:29:17 +0200
Message-Id: <20200611072919.16638-9-kraxel@redhat.com>
In-Reply-To: <20200611072919.16638-1-kraxel@redhat.com>
References: <20200611072919.16638-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 03:29:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The _STA methods for COM+LPT used to reference them,
but that isn't the case any more.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index c8e47700fc53..750fcf9baa37 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1316,15 +1316,6 @@ static void build_q35_isa_bridge(Aml *table)
     aml_append(field, aml_named_field("LPTD", 2));
     aml_append(dev, field);
 
-    aml_append(dev, aml_operation_region("LPCE", AML_PCI_CONFIG,
-                                         aml_int(0x82), 0x02));
-    /* enable bits */
-    field = aml_field("LPCE", AML_ANY_ACC, AML_NOLOCK, AML_PRESERVE);
-    aml_append(field, aml_named_field("CAEN", 1));
-    aml_append(field, aml_named_field("CBEN", 1));
-    aml_append(field, aml_named_field("LPEN", 1));
-    aml_append(dev, field);
-
     aml_append(scope, dev);
     aml_append(table, scope);
 }
@@ -1348,7 +1339,6 @@ static void build_piix4_isa_bridge(Aml *table)
 {
     Aml *dev;
     Aml *scope;
-    Aml *field;
 
     scope =  aml_scope("_SB.PCI0");
     dev = aml_device("ISA");
@@ -1357,19 +1347,6 @@ static void build_piix4_isa_bridge(Aml *table)
     /* PIIX PCI to ISA irq remapping */
     aml_append(dev, aml_operation_region("P40C", AML_PCI_CONFIG,
                                          aml_int(0x60), 0x04));
-    /* enable bits */
-    field = aml_field("^PX13.P13C", AML_ANY_ACC, AML_NOLOCK, AML_PRESERVE);
-    /* Offset(0x5f),, 7, */
-    aml_append(field, aml_reserved_field(0x2f8));
-    aml_append(field, aml_reserved_field(7));
-    aml_append(field, aml_named_field("LPEN", 1));
-    /* Offset(0x67),, 3, */
-    aml_append(field, aml_reserved_field(0x38));
-    aml_append(field, aml_reserved_field(3));
-    aml_append(field, aml_named_field("CAEN", 1));
-    aml_append(field, aml_reserved_field(3));
-    aml_append(field, aml_named_field("CBEN", 1));
-    aml_append(dev, field);
 
     aml_append(scope, dev);
     aml_append(table, scope);
-- 
2.18.4


