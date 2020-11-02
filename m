Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 407382A2799
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 10:59:24 +0100 (CET)
Received: from localhost ([::1]:55442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZWcV-0004d4-A5
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 04:59:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <382619eff506bd229c7ba0d5671c84b6f1a0a415@lizzy.crudebyte.com>)
 id 1kZWTu-0002O7-VI
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 04:50:31 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:57319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <382619eff506bd229c7ba0d5671c84b6f1a0a415@lizzy.crudebyte.com>)
 id 1kZWTt-0006q1-Ne
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 04:50:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=WMCfNs2uGPY8dPeNDE/WSVYNFrsHd3Yq7E9fSS3IzcA=; b=MZaai
 wJw/REuPIBQUKXSUCA/OuIv+4h/9gdbEUv/3yiiYu0V+591dP49uCpRTVUwZmzwT0DURSkSgGIfda
 nRUbfqGmkhWXHXQQMUpF/kBVywiIry8++z+Oo8WM/P07wBLwqzLxF/MKRczUT7/F51tJQ+ga8V1fi
 8t1T6qNDj54JAYwvDUSL34nUFyuKNO/U8Je0fi/28X7VukBWhqcH1PIM6B6V8zVCB7iTp0gWBYRT8
 kcjNIxhzkCoQNH1slsAiDsQJN0N2VGNpAKk2RbO/B8eQsPENr67EM+cqONKAsEbdcRE8hFNihCy3U
 mOWyonrnPMR4EcLzM/k51iQbHdAtw==;
Message-Id: <382619eff506bd229c7ba0d5671c84b6f1a0a415.1604309512.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1604309512.git.qemu_oss@crudebyte.com>
References: <cover.1604309512.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 20 Oct 2020 18:09:27 +0200
Subject: [PULL v3 06/17] tests/9pfs: Set alloc in fs_create_dir()
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=382619eff506bd229c7ba0d5671c84b6f1a0a415@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 04:48:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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

From: Greg Kurz <groug@kaod.org>

fs_create_dir() is a top level test function. It should set alloc.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <160321016764.266767.3763279057643874020.stgit@bahia.lan>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/virtio-9p-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 92d12f5e02..ab59431d79 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -1019,6 +1019,7 @@ static void fs_readdir_split_512(void *obj, void *data,
 static void fs_create_dir(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
+    alloc = t_alloc;
     struct stat st;
     char *root_path = virtio_9p_test_path("");
     char *new_dir = virtio_9p_test_path("01");
-- 
2.20.1


