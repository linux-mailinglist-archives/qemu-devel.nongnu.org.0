Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id E103F1C8C01
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 15:23:00 +0200 (CEST)
Received: from localhost ([::1]:55298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWgUN-0001QL-U7
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 09:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jWgOc-0000cD-2e
 for qemu-devel@nongnu.org; Thu, 07 May 2020 09:17:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41533
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jWgOb-0005Ue-2k
 for qemu-devel@nongnu.org; Thu, 07 May 2020 09:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588857420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+v0dEXwfOyZQys03fFhgx4hZXvu3IdSTnH14KvhWAc0=;
 b=Yb0z9DwyuuzcqeGFNHKQDovYOqy+7Y3CAztvVPz+P1cH7cqEXpavKpm+z8xvyef0jZDvju
 Jsap21Yx10b8jsHnSX8ecpCdFXQ6ccpd8QKy0TthFC9F1yft0bn7aFzCGeuqh7ftP0m6mQ
 x16Yv9hjlbafGvFF1+W4bgEZC4KTQWY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-dYUDGW_hM1qWt7TZ8hgKLA-1; Thu, 07 May 2020 09:16:53 -0400
X-MC-Unique: dYUDGW_hM1qWt7TZ8hgKLA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBC508064D8;
 Thu,  7 May 2020 13:16:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 664625D9DA;
 Thu,  7 May 2020 13:16:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D68659D55; Thu,  7 May 2020 15:16:40 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 14/15] acpi: q35: drop _SB.PCI0.ISA.LPCD opregion.
Date: Thu,  7 May 2020 15:16:39 +0200
Message-Id: <20200507131640.14041-15-kraxel@redhat.com>
In-Reply-To: <20200507131640.14041-1-kraxel@redhat.com>
References: <20200507131640.14041-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 03:56:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Seems to be unused.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/i386/acpi-build.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index c1e63cce5e8e..1afb47b09ee9 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1417,7 +1417,6 @@ static void build_q35_isa_bridge(Aml *table)
 {
     Aml *dev;
     Aml *scope;
-    Aml *field;
=20
     scope =3D  aml_scope("_SB.PCI0");
     dev =3D aml_device("ISA");
@@ -1427,16 +1426,6 @@ static void build_q35_isa_bridge(Aml *table)
     aml_append(dev, aml_operation_region("PIRQ", AML_PCI_CONFIG,
                                          aml_int(0x60), 0x0C));
=20
-    aml_append(dev, aml_operation_region("LPCD", AML_PCI_CONFIG,
-                                         aml_int(0x80), 0x02));
-    field =3D aml_field("LPCD", AML_ANY_ACC, AML_NOLOCK, AML_PRESERVE);
-    aml_append(field, aml_named_field("COMA", 3));
-    aml_append(field, aml_reserved_field(1));
-    aml_append(field, aml_named_field("COMB", 3));
-    aml_append(field, aml_reserved_field(1));
-    aml_append(field, aml_named_field("LPTD", 2));
-    aml_append(dev, field);
-
     aml_append(scope, dev);
     aml_append(table, scope);
 }
--=20
2.18.4


