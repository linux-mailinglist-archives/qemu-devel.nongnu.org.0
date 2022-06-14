Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E9F54B081
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 14:26:30 +0200 (CEST)
Received: from localhost ([::1]:59222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o15cq-0001CT-Sx
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 08:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o15TC-0006WR-76
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 08:16:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o15T8-0007lE-66
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 08:16:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655208985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PVva2fRC3vGqvRDPoZrUChjHwOIX197Reg0ezh6aFRw=;
 b=b9DTh8wI5uZUByvu/FLdrZQBBg8ee9x5VxjO77Ca1xnBdThKo1sFd6I/2wpko5uRj0CVZv
 pnDXWOXZcCUCm+u+PdL18sklJY+b9N+5xiHSzpHehWPNaeX6aCObu3y+9eZiUHmMgfd8e4
 gTRaxjddhbbhVtvYw0GJhsE0HLbuJms=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-j3ECH_JHNIaqhgvfOeUaig-1; Tue, 14 Jun 2022 08:16:20 -0400
X-MC-Unique: j3ECH_JHNIaqhgvfOeUaig-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A513085A580;
 Tue, 14 Jun 2022 12:16:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CA1A492CA2;
 Tue, 14 Jun 2022 12:16:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6F585180062D; Tue, 14 Jun 2022 14:16:11 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Canokeys.org" <contact@canokeys.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 09/15] MAINTAINERS: add myself as CanoKey maintainer
Date: Tue, 14 Jun 2022 14:16:04 +0200
Message-Id: <20220614121610.508356-10-kraxel@redhat.com>
In-Reply-To: <20220614121610.508356-1-kraxel@redhat.com>
References: <20220614121610.508356-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: "Hongren (Zenithal) Zheng" <i@zenithal.me>

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
Message-Id: <YoY61xI0IcFT1fOP@Sun>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0df25ed4b0a3..4cf6174f9f37 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2427,6 +2427,14 @@ F: hw/intc/s390_flic*.c
 F: include/hw/s390x/s390_flic.h
 L: qemu-s390x@nongnu.org
 
+CanoKey
+M: Hongren (Zenithal) Zheng <i@zenithal.me>
+S: Maintained
+R: Canokeys.org <contact@canokeys.org>
+F: hw/usb/canokey.c
+F: hw/usb/canokey.h
+F: docs/system/devices/canokey.rst
+
 Subsystems
 ----------
 Overall Audio backends
-- 
2.36.1


