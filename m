Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F90DF5BF
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 21:12:20 +0200 (CEST)
Received: from localhost ([::1]:46994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMd6J-000064-V0
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 15:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57931)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iMd1S-0003oP-90
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 15:07:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iMd1R-0001tO-Bp
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 15:07:18 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:45446
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iMd1Q-0001rL-Sp
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 15:07:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571684831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PxxT2q26ZZUAHp7TQylAM5LKENoqgx0DKKAcchaygfY=;
 b=WOsS7HisBxpgAAxXWfsgp4LCKl63S7bb/gn9eDUV4vp0rMtSqys7g/eizVkNZP02qVhT1x
 VeNb15Bbhlmxscu5HiNpWEsAMevp3rMpsrLTcsRVgeybgCvy8sNmeXrUyOOrI292xqKUDp
 DOTb8jtDIykV2YEx9aa2t81G/57qwJo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-QaTmpAHUNfmX5dOoxMB3Xw-1; Mon, 21 Oct 2019 15:07:08 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AA11107AD31;
 Mon, 21 Oct 2019 19:07:06 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-124.brq.redhat.com [10.40.204.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24B81196AE;
 Mon, 21 Oct 2019 19:07:02 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 1/6] hw/arm/xilinx_zynq: Use the IEC binary prefix
 definitions
Date: Mon, 21 Oct 2019 21:06:48 +0200
Message-Id: <20191021190653.9511-2-philmd@redhat.com>
In-Reply-To: <20191021190653.9511-1-philmd@redhat.com>
References: <20191021190653.9511-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: QaTmpAHUNfmX5dOoxMB3Xw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

IEC binary prefixes ease code review: the unit is explicit.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/xilinx_zynq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index c14774e542..3a0fa5b23f 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -16,6 +16,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
@@ -194,7 +195,7 @@ static void zynq_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem, 0, ext_ram);
=20
     /* 256K of on-chip memory */
-    memory_region_init_ram(ocm_ram, NULL, "zynq.ocm_ram", 256 << 10,
+    memory_region_init_ram(ocm_ram, NULL, "zynq.ocm_ram", 256 * KiB,
                            &error_fatal);
     memory_region_add_subregion(address_space_mem, 0xFFFC0000, ocm_ram);
=20
--=20
2.21.0


