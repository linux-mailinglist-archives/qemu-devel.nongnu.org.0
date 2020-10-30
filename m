Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A96A2A0836
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 15:47:20 +0100 (CET)
Received: from localhost ([::1]:38642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYVgV-0002Z0-9l
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 10:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <6dc7aa8023ad597322dabc58451b6f6dbd5bfb2e@lizzy.crudebyte.com>)
 id 1kYVeO-0000el-UW
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 10:45:09 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:34255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <6dc7aa8023ad597322dabc58451b6f6dbd5bfb2e@lizzy.crudebyte.com>)
 id 1kYVeN-00036D-38
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 10:45:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=7v/iiCvm1jBrFlOXnQcg1EXergBd4Rt7l38qeLSKKGU=; b=A6NHo
 2sksuieQe02lXXlrCLBSY/QFa7H6vCdly8GZUKBX3ZeRd6g/elJnCk3C82UVt8XqX+Wz7QzcFgzwx
 RDIcdwAE5tCb2qGoO5RK+aZYy8wjWUHqc1jRVvvEz4gXYoqDy1Is4djCDkYa06ZZFDdRFC4ilIpQw
 CAprwmPefUKAmoL9rH/ROWLBTJJ86l83R4MNCDBpPXegEormeY7Rgu77Q/rAliyW27Ym9GZrIxBrF
 zRlAG+62fDDlKtj+j0lalI8L0q3GEh4JwzSh+H91eiLet3mNOI6LXqv9UtJPZniF0EDiFQ/srf0IF
 +ePjQG41C3hMhnqWsiK5yo9OvJM2Q==;
Message-Id: <6dc7aa8023ad597322dabc58451b6f6dbd5bfb2e.1604067568.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1604067568.git.qemu_oss@crudebyte.com>
References: <cover.1604067568.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 30 Oct 2020 13:46:34 +0100
Subject: [PULL v2 03/16] tests/9pfs: Force removing of local 9pfs test
 directory
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=6dc7aa8023ad597322dabc58451b6f6dbd5bfb2e@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 07:59:50
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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

From: Greg Kurz <groug@kaod.org>

No need to get a complaint from "rm" if some path disappeared for some
reason.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <160406199444.312256.8319835906008559151.stgit@bahia.lan>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/libqos/virtio-9p.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/libqos/virtio-9p.c b/tests/qtest/libqos/virtio-9p.c
index 8459a3ee58..580ad09a2f 100644
--- a/tests/qtest/libqos/virtio-9p.c
+++ b/tests/qtest/libqos/virtio-9p.c
@@ -67,7 +67,7 @@ static void create_local_test_dir(void)
 static void remove_local_test_dir(void)
 {
     g_assert(local_test_path != NULL);
-    char *cmd = g_strdup_printf("rm -r '%s'\n", local_test_path);
+    char *cmd = g_strdup_printf("rm -fr '%s'\n", local_test_path);
     int res = system(cmd);
     if (res < 0) {
         /* ignore error, dummy check to prevent compiler error */
-- 
2.20.1


