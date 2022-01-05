Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB538485073
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 10:55:32 +0100 (CET)
Received: from localhost ([::1]:42478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5311-0000ST-UO
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 04:55:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1n52xt-000751-SU
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 04:52:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1n52xs-0003he-9E
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 04:52:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641376332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Ygd6Kbim4Zgrn65iytho/Ov4JaUjhHPrPvywQjEpkqE=;
 b=Incu4B7TE4U0gtK1BGaJLoCs39SohemvrVndGi9/WPE03o0R1OrD2ocOU3UXdfs6MsiNHM
 CbuuBMmezH/dC0TEZbhcYuWVIqCEQPPIcqg/voleupU9kRBIib/peW+E/6Ilq9MNF/8uX7
 ZAN2FNcYTo9xx3jdnW3OaTTuagGYif8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-KkY2es4oNcOk_Mud3LjwfQ-1; Wed, 05 Jan 2022 04:51:01 -0500
X-MC-Unique: KkY2es4oNcOk_Mud3LjwfQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5216F1023F4D;
 Wed,  5 Jan 2022 09:51:00 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.40.194.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4471C1059146;
 Wed,  5 Jan 2022 09:50:58 +0000 (UTC)
From: Kostiantyn Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH] MAINTAINERS: Add entry for QEMU Guest Agent Windows components
Date: Wed,  5 Jan 2022 11:50:55 +0200
Message-Id: <20220105095055.44475-1-kkostiuk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kkostiuk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f871d759fd..1f255ec874 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2729,6 +2729,14 @@ F: scripts/qemu-guest-agent/
 F: tests/unit/test-qga.c
 T: git https://github.com/mdroth/qemu.git qga

+QEMU Guest Agent Win32
+M: Konstantin Kostiuk <kkostiuk@redhat.com>
+S: Maintained
+F: qga/*win32*
+F: qga/vss-win32/
+F: qga/installer/
+T: git https://github.com/kostyanf14/qemu.git qga-win32
+
 QOM
 M: Paolo Bonzini <pbonzini@redhat.com>
 R: Daniel P. Berrange <berrange@redhat.com>
--
2.25.1


