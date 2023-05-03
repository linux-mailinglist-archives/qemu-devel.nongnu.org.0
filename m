Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 643076F4E14
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 02:16:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu07j-0006V2-4S; Tue, 02 May 2023 20:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pu07g-0006TL-IW
 for qemu-devel@nongnu.org; Tue, 02 May 2023 20:13:32 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pu07Q-0003ef-Sn
 for qemu-devel@nongnu.org; Tue, 02 May 2023 20:13:29 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 97181629CA;
 Wed,  3 May 2023 00:13:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E44C433D2;
 Wed,  3 May 2023 00:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683072795;
 bh=JycUh53CGrt4YUfBzBJnbJm4uTw9mh/4O3nSa9SyOMo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rW7VFhcomrPVshsQeZJBch0EbqYO4POt0bCCyk7XQHf0G3oLUk5rc79UZhFuoS+k+
 FgNIgfBobY/gPGAYmA3LiEF+3vRqAUmvhr3Ockg8huzBctw2K1G3xWwuVTD0+xSHUy
 wNGwSO9RSLbnJmXuuHg36NndTbjxDAGYEM0myFYBtPnQn5sPzHvGht3ftxpEfo/q22
 SqKzB+W+KBzARijIr8dXbyeCBPdSIYsvV6nXVsOx59l1ICrEloNtvfW5+GsOsX7VWa
 DLs8N7fidQiu2moqHigVBEzZk5Su+zfzb1l0OeKchvlihIyJqF7Rmbpw8uP4lGfytm
 waTySRZjsueGw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: peter.maydell@linaro.org
Cc: sstabellini@kernel.org, qemu-devel@nongnu.org, vikram.garhwal@amd.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v3 08/10] meson.build: do not set have_xen_pci_passthrough for
 aarch64 targets
Date: Tue,  2 May 2023 17:13:01 -0700
Message-Id: <20230503001303.1837420-8-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2305021708010.974517@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2305021708010.974517@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=sstabellini@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stefano Stabellini <stefano.stabellini@amd.com>

have_xen_pci_passthrough is only used for Xen x86 VMs.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meson.build b/meson.build
index 77d42898c8..000ef06bfa 100644
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


