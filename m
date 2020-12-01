Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174112CA5BE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 15:35:42 +0100 (CET)
Received: from localhost ([::1]:50504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk6kn-000251-5w
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 09:35:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1kk6jA-00019s-FR
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 09:34:00 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1kk6j7-0004A6-I1
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 09:34:00 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cll23195Xz15Vtb;
 Tue,  1 Dec 2020 22:32:59 +0800 (CST)
Received: from DESKTOP-F1615D3.china.huawei.com (10.174.186.85) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Tue, 1 Dec 2020 22:33:14 +0800
From: Zihao Chang <changzihao1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] docs/devel/writing-qmp-commands.txt: Fix docs
Date: Tue, 1 Dec 2020 22:33:08 +0800
Message-ID: <20201201143308.1626-1-changzihao1@huawei.com>
X-Mailer: git-send-email 2.22.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.85]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=changzihao1@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: changzihao1@huawei.com, armbru@redhat.com, xiexiangyou@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix the example of add qmp hello-world example.
Without ":", make will report error:
../qapi/misc.json:573:2: line should end with ':'

Signed-off-by: Zihao Chang <changzihao1@huawei.com>
---
 docs/devel/writing-qmp-commands.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/writing-qmp-commands.txt b/docs/devel/writing-qmp-commands.txt
index 46a6c48683..28984686c9 100644
--- a/docs/devel/writing-qmp-commands.txt
+++ b/docs/devel/writing-qmp-commands.txt
@@ -243,7 +243,7 @@ There are many examples of such documentation in the schema file already, but
 here goes "hello-world"'s new entry for qapi/misc.json:
 
 ##
-# @hello-world
+# @hello-world:
 #
 # Print a client provided string to the standard output stream.
 #
-- 
2.23.0


