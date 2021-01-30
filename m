Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6711A30962C
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 16:20:20 +0100 (CET)
Received: from localhost ([::1]:48064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5s2s-0003SE-Vp
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 10:20:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <cca07822fe2b26dced782c1cb92e3be4f49dc487@lizzy.crudebyte.com>)
 id 1l5s0S-0002nN-7V
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 10:17:48 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:50629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <cca07822fe2b26dced782c1cb92e3be4f49dc487@lizzy.crudebyte.com>)
 id 1l5s0Q-0007BC-62
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 10:17:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Message-Id:Cc:To:Subject:Date:From:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=6CyYZOXm0VEdfoUu3fdDNP7DnUiyxf7ao88aAEBuOXU=; b=ljos6
 WSULH96PTPzHD+iR2HO1jRq7aqgwTkiyTY15LtGiE5ByXj8Qu8yqqGaHUdPuVQVa9+ZwOywqH+362
 Qeo6+B2PJwOeUqoaEj5iDh40W/kL4JhStXNB77sW7JG80i5x7RniwRvjI4iC1L7Cd2LdzOortQdJZ
 OD0+6CvVc80uzTeXLMnwzjg5iXz55979aWydRls9ORju2EveLuu671gPEn9fd+x+JfREiVgBaseGU
 gb0TTHNPV6Q/xCDUeY8IcYvcH6607vPUMzVlPss+dxDgF11Lj5S7K8a58BI0E64P459TNmJMjj7EU
 JPcp24BQXZ6LR/ExmKEuAaW+BbQcg==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sat, 30 Jan 2021 15:39:14 +0100
Subject: [PATCH] MAINTAINERS: add my github tree URL
To: qemu-devel@nongnu.org
Message-Id: <E1l5rYG-0005sv-87@lizzy.crudebyte.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=cca07822fe2b26dced782c1cb92e3be4f49dc487@lizzy.crudebyte.com;
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
Cc: Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I already used this github URL for PRs before and will continue to use it in
foreseeable future.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bcd88668bc..e8f49aeebd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1832,6 +1832,7 @@ F: fsdev/
 F: docs/interop/virtfs-proxy-helper.rst
 F: tests/qtest/virtio-9p-test.c
 T: git https://gitlab.com/gkurz/qemu.git 9p-next
+T: git https://github.com/cschoenebeck/qemu.git 9p.next
 
 virtio-blk
 M: Stefan Hajnoczi <stefanha@redhat.com>
-- 
2.20.1


