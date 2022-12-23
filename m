Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62754654F87
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 12:14:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8fzi-0007gb-Dg; Fri, 23 Dec 2022 06:13:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <09f0080ecd9238ee1f23414935eead36d5b2b31c@lizzy.crudebyte.com>)
 id 1p8fzg-0007gI-H1
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 06:13:40 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <09f0080ecd9238ee1f23414935eead36d5b2b31c@lizzy.crudebyte.com>)
 id 1p8fzf-0007dg-3j
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 06:13:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=jDlojV5MVbbswIIWZz1tn0PXXa63KVmx5D3IWJGv400=; b=EbXrC
 cfruEuDAGS74b4qfhAuhjVe7Ln4ZSnv0zZ0KkStwIiUX/w6enbyNXA2zi1QV8UXfVUxM+ErmjV85B
 rpIYvxy3yuR99OGX/0z/mT8Y4sm/R1Z4jn6UfTNlUT31DQrHHe78I7ZTcSWkcgAmlT/FtQpn/J0wo
 kjohMas4xpVGOAOAAC/rUXtGuYCU8GdfqhQpEWQecA5S47GJID1cWKc0f6xQxzGZta2bRD77IOlK5
 9pXQBzLIRjPExoRhH2pSjtgH2yMcSRQPAFAxCFrBqe6cgRBFtPiA/QVoJ9kLn7HThKcsXYCFVstMM
 diaolSWCFM/1AodptJ1pVW+KlYavg==;
Message-Id: <09f0080ecd9238ee1f23414935eead36d5b2b31c.1671793476.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1671793476.git.qemu_oss@crudebyte.com>
References: <cover.1671793476.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 23 Dec 2022 12:04:36 +0100
Subject: [PULL 4/5] hw/9pfs: Drop unnecessary *xattr wrapper API declarations
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>,
    Bin Meng <bin.meng@windriver.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=09f0080ecd9238ee1f23414935eead36d5b2b31c@lizzy.crudebyte.com;
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

From: Bin Meng <bin.meng@windriver.com>

These are not used anywhere in the source tree. Drop them.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <20221219102022.2167736-3-bin.meng@windriver.com>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p-util.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index c3526144c9..ccfc8b1cb3 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -90,19 +90,8 @@ static inline int errno_to_dotl(int err) {
 
 #ifdef CONFIG_DARWIN
 #define qemu_fgetxattr(...) fgetxattr(__VA_ARGS__, 0, 0)
-#define qemu_lgetxattr(...) getxattr(__VA_ARGS__, 0, XATTR_NOFOLLOW)
-#define qemu_llistxattr(...) listxattr(__VA_ARGS__, XATTR_NOFOLLOW)
-#define qemu_lremovexattr(...) removexattr(__VA_ARGS__, XATTR_NOFOLLOW)
-static inline int qemu_lsetxattr(const char *path, const char *name,
-                                 const void *value, size_t size, int flags) {
-    return setxattr(path, name, value, size, 0, flags | XATTR_NOFOLLOW);
-}
 #else
 #define qemu_fgetxattr fgetxattr
-#define qemu_lgetxattr lgetxattr
-#define qemu_llistxattr llistxattr
-#define qemu_lremovexattr lremovexattr
-#define qemu_lsetxattr lsetxattr
 #endif
 
 static inline void close_preserve_errno(int fd)
-- 
2.30.2


