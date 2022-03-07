Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3824CFEB7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:33:45 +0100 (CET)
Received: from localhost ([::1]:37490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCYa-0007x1-KN
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:33:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <041b0945f98821fe4b1a3caf5c081ca35032279c@lizzy.crudebyte.com>)
 id 1nRCJo-0007iL-5e
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:18:32 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:33137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <041b0945f98821fe4b1a3caf5c081ca35032279c@lizzy.crudebyte.com>)
 id 1nRCJm-0008SA-Lt
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:18:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=rknlHOgpwDruDxO5phb53nMbnqNJL5CSSyJUNGTZy5I=; b=UnK2A
 Npj8ybRMv+c8G00unkXTeLA6VscoeHw66GNb1pknCJYiQlErCni4bxdmYweC4fMxYCMzfaBM2l28z
 3PcKSRvQLIIq2oCqjA/+yuuCS5oDSv/OmzI3d1Nhmh1MyNKKRcfKTuEv6BCaNBDnXCi5x0RzOAxPN
 OCiVrFeqF6MaMfjBtGcPseOpy3xu1OD6zx/9N1OGUtcezi4QoqiGpvKh1bFC4gC4lYga1v065pyjt
 dM5f20tKGWfBKbGEJTH0zk/2Adlio+oJ8SsmvfOR/bhXLOcVYwtD5joRHwXokj7nFEg8N4OkBDIb5
 653JLix3/rDbalaupYAUr57TrFUog==;
Message-Id: <041b0945f98821fe4b1a3caf5c081ca35032279c.1646651700.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1646651700.git.qemu_oss@crudebyte.com>
References: <cover.1646651700.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 07 Mar 2022 12:15:00 +0100
Subject: [PULL v2 17/19] 9pfs/9p-util.h: convert Doxygen -> kerneldoc format
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>, Will Cohen <wwcohen@gmail.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Fabian Franz <fabianfranz.oss@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=041b0945f98821fe4b1a3caf5c081ca35032279c@lizzy.crudebyte.com;
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
index d0de6be3e2..97e681e167 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -99,7 +99,7 @@ ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
 ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
                                 const char *name);
 
-/**
+/*
  * Darwin has d_seekoff, which appears to function similarly to d_off.
  * However, it does not appear to be supported on all file systems,
  * so ensure it is manually injected earlier and call here when
@@ -115,15 +115,15 @@ static inline off_t qemu_dirent_off(struct dirent *dent)
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


