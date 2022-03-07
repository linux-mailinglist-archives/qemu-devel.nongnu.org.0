Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 043C34CFF57
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:59:47 +0100 (CET)
Received: from localhost ([::1]:44368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCxm-0007I4-4X
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:59:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <63ce31c35da18f9dbd9b7dbea5b6e1d2b85deb24@lizzy.crudebyte.com>)
 id 1nRCDU-0004Ou-D2
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:11:56 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:33469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <63ce31c35da18f9dbd9b7dbea5b6e1d2b85deb24@lizzy.crudebyte.com>)
 id 1nRCDR-0006fX-MW
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:11:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=DrohWPsFuDZVi2PkDVvJ6WDmj/4RKl9cI6t4GNGbvL8=; b=GfmZ7
 Q9smAVLH7lQoGuzliztzOLGCd2CEeXbq8ALp9OBnyUXLm8oSAUKDGJZ18zc9lfnKhTbFImroybvov
 Y1l1FygFU8p/iJsdJE7Qsr0jY96A5pQLk6rsw57yxVXCUhCAAfRFs/cFkr3gSNkx42GzlMfeicVCP
 0CiJi2PtHeQNNcuGrBRZV0eCIfyL+J5FjqFCPMeehkCluC1Dkgn3oJbGbtNCqPZ6VZqPYrvMFv2Aq
 +96CXuaIG1NaVFE4ytWyyOai3LEH0fxCe8lgRCuz3kv+qf7t702n9LtnbGJXHc1N1STJ5/Mjmlr+n
 SB9Zyi0MkaVbcMYWXYL6fhpO1NlQg==;
Message-Id: <63ce31c35da18f9dbd9b7dbea5b6e1d2b85deb24.1646651700.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1646651700.git.qemu_oss@crudebyte.com>
References: <cover.1646651700.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 07 Mar 2022 12:15:00 +0100
Subject: [PULL v2 13/19] 9pfs: drop Doxygen format from qemu_dirent_dup() API
 comment
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>, Will Cohen <wwcohen@gmail.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Fabian Franz <fabianfranz.oss@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=63ce31c35da18f9dbd9b7dbea5b6e1d2b85deb24@lizzy.crudebyte.com;
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

API doc comments in QEMU are supposed to be in kerneldoc format, so drop
occurrences of "@c" which is Doxygen format for fixed-width text.

Link: https://lore.kernel.org/qemu-devel/CAFEAcA89+ENOM6x19OEF53Kd2DWkhN5SN21Va0D7yepJSa3Jyg@mail.gmail.com/
Based-on: <E1nP9Oz-00043L-KJ@lizzy.crudebyte.com>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <E1nPTwO-0006pl-Np@lizzy.crudebyte.com>
---
 hw/9pfs/9p-util.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 408d71c8f7..d0de6be3e2 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -118,8 +118,8 @@ static inline off_t qemu_dirent_off(struct dirent *dent)
  * Duplicate directory entry @dent.
  *
  * It is highly recommended to use this function instead of open coding
- * duplication of @c dirent objects, because the actual @c struct @c dirent
- * size may be bigger or shorter than @c sizeof(struct dirent) and correct
+ * duplication of dirent objects, because the actual struct dirent
+ * size may be bigger or shorter than sizeof(struct dirent) and correct
  * handling is platform specific (see gitlab issue #841).
  *
  * @dent - original directory entry to be duplicated
-- 
2.20.1


