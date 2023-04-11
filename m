Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF14E6DD7B5
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 12:17:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmB3w-00086D-CB; Tue, 11 Apr 2023 06:17:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pmB3u-000862-K9
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:17:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pmB3s-0004cX-HF
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 06:17:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681208234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=hfvdWo9ZJRgjgPFQF0RKUY3adoB1XvH5v2Z+uyMCrNg=;
 b=U0Im/1yAnj+mewTr4xESYMwci5VRgBqY7Cs1sMWRhdLZwQgIBeKc2KtA8//Je/nvic8/YQ
 EKV462qr1upWhYIKHpKpUoiTFlQCZKEyad+7KdkWvGL+NeDh9a/r/Hc5uLhfyn8NXfZbt9
 f0NkB1fUmh7C97rQHsigzyU0I3Up4q4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-8dj332_ZOzeNnf8T-4N_NA-1; Tue, 11 Apr 2023 06:17:11 -0400
X-MC-Unique: 8dj332_ZOzeNnf8T-4N_NA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3FFD185A78B;
 Tue, 11 Apr 2023 10:17:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C33B8202701F;
 Tue, 11 Apr 2023 10:17:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 823301802393; Tue, 11 Apr 2023 12:17:09 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	Olaf Hering <olaf@aepfle.de>
Subject: [PATCH] roms: add back edk2-basetools target
Date: Tue, 11 Apr 2023 12:17:09 +0200
Message-Id: <20230411101709.445259-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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

The efi nic boot rom builds depend on this, they need the
EfiRom utility from edk2 BaseTools.

Fixes: 22e11539e167 ("edk2: replace build scripts")
Reported-by: Olaf Hering <olaf@aepfle.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 roms/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/roms/Makefile b/roms/Makefile
index 6859685290bf..73127445a515 100644
--- a/roms/Makefile
+++ b/roms/Makefile
@@ -153,6 +153,9 @@ efi:
 	rm -f ../pc-bios/edk2-*.fd.bz2
 	bzip2 --verbose ../pc-bios/edk2-*.fd
 
+edk2-basetools:
+	python3 edk2-build.py --config edk2-build.config -m none
+
 opensbi32-generic:
 	$(MAKE) -C opensbi \
 		CROSS_COMPILE=$(riscv32_cross_prefix) \
-- 
2.39.2


