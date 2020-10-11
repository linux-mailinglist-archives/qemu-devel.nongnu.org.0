Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B945728A7A5
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Oct 2020 15:55:05 +0200 (CEST)
Received: from localhost ([::1]:58746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRboW-0001fj-P6
	for lists+qemu-devel@lfdr.de; Sun, 11 Oct 2020 09:55:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yubihong@huawei.com>)
 id 1kRYYA-00011C-43; Sun, 11 Oct 2020 06:25:58 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:52134 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yubihong@huawei.com>)
 id 1kRYY8-0003IG-3h; Sun, 11 Oct 2020 06:25:57 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E76ACD955EE26CB46FB0;
 Sun, 11 Oct 2020 18:25:48 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Sun, 11 Oct 2020
 18:25:38 +0800
From: Bihong Yu <yubihong@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v1 4/8] migration: Open brace '{' following struct go on the
 same line
Date: Sun, 11 Oct 2020 18:57:39 +0800
Message-ID: <1602413863-19513-5-git-send-email-yubihong@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1602413863-19513-1-git-send-email-yubihong@huawei.com>
References: <1602413863-19513-1-git-send-email-yubihong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=yubihong@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/11 06:25:44
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 11 Oct 2020 09:36:19 -0400
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
Cc: yubihong@huawei.com, zhengchuan@huawei.com, quintela@redhat.com,
 dgilbert@redhat.com, alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by:Bihong Yu <yubihong@huawei.com>
Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>
Signed-off-by: Bihong Yu <yubihong@huawei.com>
---
 migration/migration.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index deb411a..99784b4 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -124,8 +124,7 @@ struct MigrationClass {
     DeviceClass parent_class;
 };
 
-struct MigrationState
-{
+struct MigrationState {
     /*< private >*/
     DeviceState parent_obj;
 
-- 
1.8.3.1


