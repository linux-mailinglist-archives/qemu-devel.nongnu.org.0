Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D812363AEBF
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 18:20:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozhmZ-0002Zc-Ic; Mon, 28 Nov 2022 12:19:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <cec784500768222c0b6d0f6351766051d3ca2120@lizzy.crudebyte.com>)
 id 1ozhmX-0002ZR-Pp
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 12:19:02 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <cec784500768222c0b6d0f6351766051d3ca2120@lizzy.crudebyte.com>)
 id 1ozhmW-0003MK-7U
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 12:19:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Message-Id:Cc:To:Subject:Date:From:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=9kvJqiQGnbOYlHZsDYDRVW4RYiPR77uDGNpJvyCVO1U=; b=YxjtP
 FIBtt5lHNw3Kb0mVpb41wW6jwrkMg/AD6rNRCwDvxUYZ/xOhuHybNppUIpGudJvXFVRm6DNCE/Ykh
 orgqX7nBjc5fhq+aR7CQi0NRjhKQryglRMjVzrcEKIhkFAey6ceMQkrr7C9QNuT/JhMYZVsyQLNnM
 yeJqGWCjjpFHdLD0U9N0xQggR90NeMf459J087qBWIdaZMQrY045+sxUWW0q66ET2UN4p7pG3bJxB
 DNBHV09xG1hXz8oCm+lzhfJPP2RdOA1RCZ+EA3qzBr0US/w77ReP9zShujafnX1hKkvcrRZjuciM3
 1oSQYl/lzQl6CEFyMZoSf8yXIzRLg==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 28 Nov 2022 18:12:04 +0100
Subject: [PATCH] MAINTAINERS: Add 9p test client to section "virtio-9p"
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <E1ozhlV-0007BU-0g@lizzy.crudebyte.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=cec784500768222c0b6d0f6351766051d3ca2120@lizzy.crudebyte.com;
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
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cf24910249..4f156a99f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2036,6 +2036,7 @@ X: hw/9pfs/xen-9p*
 F: fsdev/
 F: docs/tools/virtfs-proxy-helper.rst
 F: tests/qtest/virtio-9p-test.c
+F: tests/qtest/libqos/virtio-9p*
 T: git https://gitlab.com/gkurz/qemu.git 9p-next
 T: git https://github.com/cschoenebeck/qemu.git 9p.next
 
-- 
2.30.2


