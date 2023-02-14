Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 605EA6971F9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 00:44:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS4xk-0005Md-E7; Tue, 14 Feb 2023 18:43:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pS4xc-0005KX-Fg
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 18:43:45 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pS4xa-0003ml-SQ
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 18:43:44 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 631E461953;
 Tue, 14 Feb 2023 23:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27681C433EF;
 Tue, 14 Feb 2023 23:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676418220;
 bh=42Jxyu7MuQJSn29FeRbED62pUkX788RofzkHPycEJUI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OKS9drivMmGx6ih1KIvAS72C1jueAO4VDrtjyV8SXQXtGJlpL8VSqKNLzJzdBpCbU
 NmOMBunSMIDLveHPLULoSKs6WTPs+e1RNkDNutR0ZcPfndTVpsZvTWxsV3OY2zQ29S
 5xZSGPXRjLBmibOQ9uu6hnJhI8PITzYGrHIWpaWmM3NfI8xigI5AFs3YvEVj6bURoi
 9wTsmpZEw6HVMVmRyQrZ0xwDoZmlrx7QJDHALrrUFozgMNKCoOOlbTljBAW0SvKXjQ
 cLIo0u6PmuJ0S2MqggFHFrlKxRcArC+ich0DYPSyHT3S3m8HyKtGdbiCTGekh01xAA
 4jIKub1sFS7WA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: peter.maydell@linaro.org
Cc: sstabellini@kernel.org, qemu-devel@nongnu.org,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 08/10] meson.build: do not set have_xen_pci_passthrough for
 aarch64 targets
Date: Tue, 14 Feb 2023 15:43:28 -0800
Message-Id: <20230214234330.2107879-8-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2302141541100.2025117@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2302141541100.2025117@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=sstabellini@kernel.org; helo=dfw.source.kernel.org
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

From: Stefano Stabellini <stefano.stabellini@amd.com>

have_xen_pci_passthrough is only used for Xen x86 VMs.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meson.build b/meson.build
index a76c855312..8292cdcec5 100644
--- a/meson.build
+++ b/meson.build
@@ -1471,6 +1471,8 @@ have_xen_pci_passthrough = get_option('xen_pci_passthrough') \
            error_message: 'Xen PCI passthrough requested but Xen not enabled') \
   .require(targetos == 'linux',
            error_message: 'Xen PCI passthrough not available on this platform') \
+  .require(cpu == 'x86'  or cpu == 'x86_64',
+           error_message: 'Xen PCI passthrough not available on this platform') \
   .allowed()
 
 
-- 
2.25.1


