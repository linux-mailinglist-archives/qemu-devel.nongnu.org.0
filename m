Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB554CD51D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 14:27:39 +0100 (CET)
Received: from localhost ([::1]:59622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ7y6-0000ya-Jy
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 08:27:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <c626a3151a004689918ab65a5ecdeea06755580c@lizzy.crudebyte.com>)
 id 1nQ7mx-0001BJ-BP
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:16:08 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:34941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <c626a3151a004689918ab65a5ecdeea06755580c@lizzy.crudebyte.com>)
 id 1nQ7mv-0006Ek-AE
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:16:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=C0n5rb3uf8xpWdqiD2GEa2RdawEtGlxmub4/foc/Crk=; b=W+eUz
 SJJQexphlmMVV1te2F3SYJYDTwbFymx/OJJ2gaXsOtPaz5Yiv/io+T1TLUmKalE5/AlVVD/ihC4KD
 QMIUOHF7RuE555rcQOOAMJv6Rp5QdDU8zps2BeW4BNfE66/8xlUk8oM8pVsI2gfHLlKCheVob+HNV
 QnxxsyG6K0BqVYlDGyJswdeurPkSDVEVR/SU60M227gNA91D06+Yg+HJx7NtSuXnAkUEZgl8Wf4io
 r7bjd69qJ6bkb1QurVWfMH1SPH9J3561KK8TaoezAN4EK1zlwoAaqFGFTxrOTp6D8w6cq1GbnvS9m
 5ryooPBFtVy2HDQucFJkRHxxWv4sQ==;
Message-Id: <c626a3151a004689918ab65a5ecdeea06755580c.1646396869.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1646396869.git.qemu_oss@crudebyte.com>
References: <cover.1646396869.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 04 Mar 2022 13:27:49 +0100
Subject: [PULL 17/19] 9pfs/9p-util.h: convert Doxygen -> kerneldoc format
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=c626a3151a004689918ab65a5ecdeea06755580c@lizzy.crudebyte.com;
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
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <dc1c4a85e233f5884ee5f6ec96b87db286083df7.1646314856.git.qemu_oss@crudebyte.com>
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
2.20.1


