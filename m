Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC772692A1F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 23:29:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQbrx-0002II-IZ; Fri, 10 Feb 2023 17:27:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pQbru-0002Gh-8A
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 17:27:46 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pQbrr-0007kM-Ug
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 17:27:45 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AB77FB825C8;
 Fri, 10 Feb 2023 22:27:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE28C433D2;
 Fri, 10 Feb 2023 22:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676068061;
 bh=k5xgoEDa/EPx7CRTHejQBMFxobY5DqI+984iM5lzqOU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Svvh6YfHX0WH1PpZOAt1mPGpMu08djBD2eyT6QRqX+xw/0aWq/rwa6dpjQRkdWZG9
 qo/VCWw+iTJHX7K9wzGWDlcH47jJ7LoWB20gd75Sq2PAbcmYCAckDm4CdAS1mD3PH5
 QiSZq9o2UDiRvrTbdZXrwslHgkIrrpuG92hthRQGE+HdqYkvxooW2KOBELOE/LG1WQ
 9vrffoiUZ2ZQKMSIYom0Br1f11/vRFhXJ/969y9EgAWxw264huM693ZigWqHmlQeOo
 QKE49i6e+fgmu0FUIhDNQDbufug1VP2FIqbLYXh4xP7X/fesIkPl7oZzUjGJVQmlvx
 5cD/d0iiJOuPQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org, peter.maydell@linaro.org,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 08/10] meson.build: do not set have_xen_pci_passthrough for
 aarch64 targets
Date: Fri, 10 Feb 2023 14:27:27 -0800
Message-Id: <20230210222729.957168-8-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2302101420510.4661@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2302101420510.4661@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=sstabellini@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
index c626ccfa82..fb9fb97bb1 100644
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


