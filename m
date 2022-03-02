Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 805B34CAE5B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 20:13:31 +0100 (CET)
Received: from localhost ([::1]:58006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPUPi-00057K-6o
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 14:13:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <5dbe4870cb5af4ede424e8529f2d4b114254c65a@lizzy.crudebyte.com>)
 id 1nPUN7-0002Np-HM
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 14:10:49 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:57561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <5dbe4870cb5af4ede424e8529f2d4b114254c65a@lizzy.crudebyte.com>)
 id 1nPUN5-0003ec-AD
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 14:10:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Message-Id:Cc:To:Subject:Date:From:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=En4hKNhARgIxQNggid9z+ncqqwZZjjE7feIvMod08qI=; b=Eq/nO
 pgFoUtunMg5xlxO27omSWA327jo2p//2hu9RZUOiRrhb+Vk1Gz2Pd94zn6Ipqx9GBkhhlaBlWj5TB
 vnykUQk8isNwHS1jwae0ksgHqoK0YmIZgAHmZTxie8Sw0IKKy4F3VnfXcuZvTSWOXYHKW2b6GOlVJ
 4rkBKLXGAQPov5dAS7GdgHK2Ak5eulNl4z3bc3NljmVjFMS77FmuozFHH6B5oxPDPKDmgOTRkVLmO
 +cttvBa1szab0slfGfMjeO62uo0KcdjeKA7eRV/XhHfK90gIBpzCUVRrmxnOnLLLq2XJUrUDcqBlj
 q1HG77bBWpMW1JMpisuOUGS87q+gw==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Wed, 2 Mar 2022 19:30:39 +0100
Subject: [PATCH] 9pfs: drop Doxygen format from qemu_dirent_dup() API comment
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
    Peter Maydell <peter.maydell@linaro.org>
Message-Id: <E1nPTwO-0006pl-Np@lizzy.crudebyte.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=5dbe4870cb5af4ede424e8529f2d4b114254c65a@lizzy.crudebyte.com;
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
---
 hw/9pfs/9p-util.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 8b92614e6c..22835c5f61 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -116,8 +116,8 @@ static inline off_t qemu_dirent_off(struct dirent *dent)
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
2.30.2


