Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401B23469EC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 21:36:53 +0100 (CET)
Received: from localhost ([::1]:41410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOnlk-0000zH-99
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 16:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bbc74655d54f2fa9c3eabf485e87f995253b8cfd@lizzy.crudebyte.com>)
 id 1lOnj9-0007Zq-QE
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:34:11 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:57417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bbc74655d54f2fa9c3eabf485e87f995253b8cfd@lizzy.crudebyte.com>)
 id 1lOnj7-0007YD-VU
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:34:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=LEONK0NeptQfAU9yfJ1wBMffXNQgEI2NFrFO0ojDx98=; b=Gia7E
 mTcXkKIqCpFDdE6JptrB+CldeeE1Vjh6WxxOmPOjxTmKexE/5QdXUcbtFOHzkIOhaL3MAKwTdJ61K
 Ba70Q/Pxv6Zhrl7n/WEd3o4QV6kHg8WZdFpfn//HxWnGnG57vA2X1LjuIOtP5UhI3CmujRQEtBtXN
 MKr66wAwILRkNfqH2x4+/0BOvTkgoeCJ0FtBgO8hf5Y4KbusMtIfPcO+QzCA2NlkyPqXPOwQQ45WX
 Cg9LhJYRnYRDxJ7JWfAoQ17TPfT8BZLMZlNXw6sRjxTKFmzc4leeWVrhbzRpfd6Sm1VN+T3QjsKZv
 vXtoq8HkObTZT6I3MJg+AOsIm45CA==;
Message-Id: <bbc74655d54f2fa9c3eabf485e87f995253b8cfd.1616528420.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1616528420.git.qemu_oss@crudebyte.com>
References: <cover.1616528420.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 23 Mar 2021 20:31:44 +0100
Subject: [PATCH 4/4] MAINTAINERS: add responsibility for docs/devel/9p.rst
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=bbc74655d54f2fa9c3eabf485e87f995253b8cfd@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add recently added file docs/devel/9p.rst into responsibility
of 9p maintainers.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9147e9a429..62b1928a38 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1885,6 +1885,7 @@ S: Odd Fixes
 F: hw/9pfs/
 X: hw/9pfs/xen-9p*
 F: fsdev/
+F: docs/devel/9p.rst
 F: docs/tools/virtfs-proxy-helper.rst
 F: tests/qtest/virtio-9p-test.c
 T: git https://gitlab.com/gkurz/qemu.git 9p-next
-- 
2.20.1


