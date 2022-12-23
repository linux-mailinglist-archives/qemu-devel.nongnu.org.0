Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D97C654F8B
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 12:14:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8fzc-0007fk-Sp; Fri, 23 Dec 2022 06:13:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <6888af46c7849cac8341a32a9da6291270550c5e@lizzy.crudebyte.com>)
 id 1p8fza-0007fJ-7B
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 06:13:34 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <6888af46c7849cac8341a32a9da6291270550c5e@lizzy.crudebyte.com>)
 id 1p8fzY-0007co-WA
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 06:13:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=3mMLkwNJ4FQM3mqgC4grmWMX9irXubj4q7SxaBHivVo=; b=J2d75
 l+Mp9OVit9PhqFkU59sRIXGvOXxEXD7genDCQtZORA+F8i0S3Vy32RXZz+W+LlJczX3EzTYB7bGEK
 oKEG6BasYhBiqRvDgq9DWHg/dUjZdDDK8rR0DIqi0Dvwvb3SK+xxOU6KgR7cx5/8RdqWqOjXBv00U
 8BitGud97hxixAhvmVKMTnnL+RcDUlzmGC4P3QaWkhHE21YDOUvNgXW9y0vtFENowPcBSRe8p1UAK
 tQYgWrEbWfi6Qge1+GiRvlCZiHtsHvulGJiPfMkZH/6lW4KamaVRLqTfJtIQg0Tf9SN1JutfdAccd
 s4zjyeuM9EWLrsY2hv8zLzoVbpRmA==;
Message-Id: <6888af46c7849cac8341a32a9da6291270550c5e.1671793476.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1671793476.git.qemu_oss@crudebyte.com>
References: <cover.1671793476.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 23 Dec 2022 12:04:36 +0100
Subject: [PULL 3/5] qemu/xattr.h: Exclude <sys/xattr.h> for Windows
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>,
    Bin Meng <bin.meng@windriver.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=6888af46c7849cac8341a32a9da6291270550c5e@lizzy.crudebyte.com;
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

Windows does not have <sys/xattr.h>.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <20221219102022.2167736-2-bin.meng@windriver.com>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 include/qemu/xattr.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/qemu/xattr.h b/include/qemu/xattr.h
index f1d0f7be74..b08a934acc 100644
--- a/include/qemu/xattr.h
+++ b/include/qemu/xattr.h
@@ -25,7 +25,9 @@
 #  if !defined(ENOATTR)
 #    define ENOATTR ENODATA
 #  endif
-#  include <sys/xattr.h>
+#  ifndef CONFIG_WIN32
+#    include <sys/xattr.h>
+#  endif
 #endif
 
 #endif
-- 
2.30.2


