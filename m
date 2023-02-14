Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1157D6971F4
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 00:44:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS4xl-0005Mw-PM; Tue, 14 Feb 2023 18:43:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pS4xe-0005Lb-Ol
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 18:43:47 -0500
Received: from ams.source.kernel.org ([145.40.68.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pS4xd-0003nN-9I
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 18:43:46 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 21EBEB81E4A;
 Tue, 14 Feb 2023 23:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20055C4339B;
 Tue, 14 Feb 2023 23:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676418222;
 bh=cp6daikvP3t+RpE/9gvp0uFZJNJEku9+tHJf5P14uPE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mB+HmhJsQPB0wSHnnH56AMqu2xsW+P+lKf5Yr1sgBp9IUlTXo3qV+optMR7tt/WCw
 XQqKUH1Pv7sB76yrtPToXSoOBoBh2CQIBnQjreAbRwNjCBabUPd445UIx8mqonDQlg
 MAXZxYdNB320kkL3knx9KRzY9hszPhanHMjN4HpkgQ0hEeS/Cn70gbJ5aPuTx5zyUh
 K3DFy8aV4WJcBmjHru8rTmgt2e41nw5AfhvalIo1BZAmOAGiEbTKFC6inJuv2bZt2r
 JoUdz/IW5wT5GQ6+nwO9qXMma0bNlRkHAQs+LbTsD0nUqIKodkUeBt5XjttgcfMOPD
 0DlMNVOlYA0vQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: peter.maydell@linaro.org
Cc: sstabellini@kernel.org, qemu-devel@nongnu.org,
 Vikram Garhwal <vikram.garhwal@amd.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 10/10] meson.build: enable xenpv machine build for ARM
Date: Tue, 14 Feb 2023 15:43:30 -0800
Message-Id: <20230214234330.2107879-10-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2302141541100.2025117@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2302141541100.2025117@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75; envelope-from=sstabellini@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

From: Vikram Garhwal <vikram.garhwal@amd.com>

Add CONFIG_XEN for aarch64 device to support build for ARM targets.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 8292cdcec5..3f08bceba0 100644
--- a/meson.build
+++ b/meson.build
@@ -135,7 +135,7 @@ endif
 if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
   # i386 emulator provides xenpv machine type for multiple architectures
   accelerator_targets += {
-    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
+    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu', 'aarch64-softmmu'],
   }
 endif
 if cpu in ['x86', 'x86_64']
-- 
2.25.1


