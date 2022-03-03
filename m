Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 642174CBF9E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 15:11:43 +0100 (CET)
Received: from localhost ([::1]:53014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPmBC-0000lV-H7
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 09:11:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <dc1c4a85e233f5884ee5f6ec96b87db286083df7@lizzy.crudebyte.com>)
 id 1nPmAK-0008Ol-9e
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:10:48 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:36437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <dc1c4a85e233f5884ee5f6ec96b87db286083df7@lizzy.crudebyte.com>)
 id 1nPmAI-0004XG-Hr
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:10:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=DVTDwcXvRype59yN2sXQXKcvUnpXIYBnZNqAPCNetxA=; b=itSP8
 exuZQvUuFxrANj9kWhCxD8ckpxMEJ2vAy6pCQSkNfwhvjjQxAu6Cq9RSsOq8WYaCOGVKUnhiYBqcF
 TAZnZdtN3ZMEvHQOtl75nYUCzUFR6WZqOrxuehlmy7s8OYlsGtYDGxcrkyqLmVBeB6Q+OA6HO9qN9
 ZrfwdonxszL4q2rfiXfq3/tAYtvcjWZyPvWiQeMkdH+bM3w5qXblnPKMPT91gvX/KmB6QhD/7thbl
 /rUpxPTqBKOknWPyhyMhryZQk6MGysDAnE2yMVzqOx1ryIjl6CFe5sAVDzscuDbJlNA8urObxIyHb
 11EBs/UVcAdJghFsXftF2fU50c8Yg==;
Message-Id: <dc1c4a85e233f5884ee5f6ec96b87db286083df7.1646314856.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1646314856.git.qemu_oss@crudebyte.com>
References: <cover.1646314856.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 3 Mar 2022 14:20:29 +0100
Subject: [PATCH 4/6] 9pfs/9p-util.h: convert Doxygen -> kerneldoc format
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=dc1c4a85e233f5884ee5f6ec96b87db286083df7@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

API doc comments in QEMU are supposed to be in kerneldoc format, so
convert API doc comments from Doxygen format to kerneldoc format.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p-util.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 22835c5f61..cfa7af43c5 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -97,7 +97,7 @@ ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
 ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
                                 const char *name);
 
-/**
+/*
  * Darwin has d_seekoff, which appears to function similarly to d_off.
  * However, it does not appear to be supported on all file systems,
  * so ensure it is manually injected earlier and call here when
@@ -113,15 +113,15 @@ static inline off_t qemu_dirent_off(struct dirent *dent)
 }
 
 /**
- * Duplicate directory entry @dent.
+ * qemu_dirent_dup() - Duplicate directory entry @dent.
+ *
+ * @dent: original directory entry to be duplicated
+ * Return: duplicated directory entry which should be freed with g_free()
  *
  * It is highly recommended to use this function instead of open coding
  * duplication of dirent objects, because the actual struct dirent
  * size may be bigger or shorter than sizeof(struct dirent) and correct
  * handling is platform specific (see gitlab issue #841).
- *
- * @dent - original directory entry to be duplicated
- * @returns duplicated directory entry which should be freed with g_free()
  */
 static inline struct dirent *qemu_dirent_dup(struct dirent *dent)
 {
-- 
2.30.2


