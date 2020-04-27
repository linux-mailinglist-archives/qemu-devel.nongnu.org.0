Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31691BA681
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Apr 2020 16:33:52 +0200 (CEST)
Received: from localhost ([::1]:48180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jT4pT-00029Y-MS
	for lists+qemu-devel@lfdr.de; Mon, 27 Apr 2020 10:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55464)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jT4nr-0000bb-NG
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 10:32:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jT4nn-00017R-S3
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 10:32:10 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:34415
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jT4nl-00014Z-VJ
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 10:32:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587997924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wF53oQKHsTYpLrSDR4DejZ9174KDt94gCTwACYMoD4Q=;
 b=Q0n4+uNcILxmUWaDI74RT6JHgj3j3MDQq0VL+/uq2LP16MlIoaTzZ7GIbRNTqzS5qdRR2c
 GuJPmGxgEX0Kc9UFm9b9Bb/Q8hwniEGmIIK4yXJssergHDVM8Sq0nQDvJ0ehmZBM8i/IaR
 ruyiJ7vh4CxM1CR4GhNIZ6Typayg0qw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-hjOcA5zrNPO-cMdOVnHuyw-1; Mon, 27 Apr 2020 10:32:02 -0400
X-MC-Unique: hjOcA5zrNPO-cMdOVnHuyw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2F76100A61D;
 Mon, 27 Apr 2020 14:32:00 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-115-95.ams2.redhat.com [10.36.115.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 719B36062C;
 Mon, 27 Apr 2020 14:31:57 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 cohuck@redhat.com
Subject: [PATCH 1/2] tpm: tpm-tis-device: set PPI to false by default
Date: Mon, 27 Apr 2020 16:31:44 +0200
Message-Id: <20200427143145.16251-2-eric.auger@redhat.com>
In-Reply-To: <20200427143145.16251-1-eric.auger@redhat.com>
References: <20200427143145.16251-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/26 23:32:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: drjones@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The tpm-tis-device device does not support PPI. Let's
change the default value for the corresponding property
instead of tricking this latter in the mach-virt machine.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/tpm/tpm_tis_sysbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/tpm/tpm_tis_sysbus.c b/hw/tpm/tpm_tis_sysbus.c
index 18c02aed67..eced1fc843 100644
--- a/hw/tpm/tpm_tis_sysbus.c
+++ b/hw/tpm/tpm_tis_sysbus.c
@@ -91,7 +91,7 @@ static void tpm_tis_sysbus_reset(DeviceState *dev)
 static Property tpm_tis_sysbus_properties[] =3D {
     DEFINE_PROP_UINT32("irq", TPMStateSysBus, state.irq_num, TPM_TIS_IRQ),
     DEFINE_PROP_TPMBE("tpmdev", TPMStateSysBus, state.be_driver),
-    DEFINE_PROP_BOOL("ppi", TPMStateSysBus, state.ppi_enabled, true),
+    DEFINE_PROP_BOOL("ppi", TPMStateSysBus, state.ppi_enabled, false),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
--=20
2.20.1


