Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7683A654F83
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 12:14:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8fzU-0007eU-SC; Fri, 23 Dec 2022 06:13:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <818e42fe2fad033bfd991096451b9994971852ec@lizzy.crudebyte.com>)
 id 1p8fzT-0007eM-OO
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 06:13:27 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <818e42fe2fad033bfd991096451b9994971852ec@lizzy.crudebyte.com>)
 id 1p8fzS-0007bp-93
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 06:13:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:Date:From:References:In-Reply-To:Message-Id:Content-ID:
 Content-Description; bh=r72rxktupxHtnoYXVxJNJbe5ZQdVW4lers168Yzl9eE=; b=lJ3Aw
 Mg3BOzQDI5g6wFEqcyBZtlhcTCVC4vgg5tse8p+E6qRmICjUWSLsnXJP1c0F3lE3kuNzSSbub/rsh
 ZL+jvugRqHbKBLODunC9qIo1Olx5W2Ejrs7Nip02FvyNaylIbCl+gWXGY7y3vyMpE9VnOvz6eMLD5
 Sq9dqraavDHac8D3AfHNY4xc/kOd6kNBPvUY+bELFk2mXdiKUG762AmAN387OGArX/K+5UOoXPSkZ
 P1Ws+o20I/rIKKuy/xIA39Ik2hBFCkg97OSU9F+tPhsEExGE6FtakU99zZI7ge/P8uXHikr3QU3FZ
 1eGjJvAlMQttY7XU1WNI557H+v60g==;
Message-Id: <818e42fe2fad033bfd991096451b9994971852ec.1671793476.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1671793476.git.qemu_oss@crudebyte.com>
References: <cover.1671793476.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 23 Dec 2022 12:04:36 +0100
Subject: [PULL 2/5] MAINTAINERS: Add 9p test client to section "virtio-9p"
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>,
    Philippe Mathieu-Daudé <philmd@linaro.org>,
    Wilfred Mallawa <wilfred.mallawa@wdc.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=818e42fe2fad033bfd991096451b9994971852ec@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

The 9p test cases use a dedicated, lite-weight 9p client implementation
(using virtio transport) under tests/qtest/libqos/ to communicate with
QEMU's 9p server.

It's already there for a long time. Let's officially assign it to 9p
maintainers.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Message-Id: <E1ozhlV-0007BU-0g@lizzy.crudebyte.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b270eb8e5b..b0091d2ad8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2053,6 +2053,7 @@ X: hw/9pfs/xen-9p*
 F: fsdev/
 F: docs/tools/virtfs-proxy-helper.rst
 F: tests/qtest/virtio-9p-test.c
+F: tests/qtest/libqos/virtio-9p*
 T: git https://gitlab.com/gkurz/qemu.git 9p-next
 T: git https://github.com/cschoenebeck/qemu.git 9p.next
 
-- 
2.30.2


