Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1844CFDF0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:16:25 +0100 (CET)
Received: from localhost ([::1]:46120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCHo-0000nd-Gv
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:16:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <1a7f2400148fd273536daa0adba5ecdea35c4bfb@lizzy.crudebyte.com>)
 id 1nRCEY-0006Tp-TA
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:13:02 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:34619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <1a7f2400148fd273536daa0adba5ecdea35c4bfb@lizzy.crudebyte.com>)
 id 1nRCEX-0007a4-2Q
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:13:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=Vl2X3WYggHpA/TJOsUhXcKaCskBk2BTJ7HU+dytgZhY=; b=Mj3z6
 vERWVViegYaegb3q+0raO/CGHp2z/ToGcwZYJ5uxIlOYLc5VmVUC6gGFcvoX0aXOb7TKTOu7K0VZY
 6cDkPRVazWoZgfIKeQXM6X6v4KTpJiucxKDDrCkvOrUnoNmf9BpNa4NvpV+KwJYLyxQ0nXwNWPu4z
 T3Xp0v2si+i8xHdkBbFQZqgNZ5bdfaR4ElHFTFcXHiM7RYLXmajjEe42nPF8LNOFUqjksTD6Nruou
 6irlmLheu1hXacKPjzqOdVOtJnfcMlVV5jj0BYEw+j0DQ9Fta/cIk1tb7VvZ3v1DuPEGLPNVyfyg9
 JqpWjgkmyLJUTG0YOrpIXYsMiCWNg==;
Message-Id: <1a7f2400148fd273536daa0adba5ecdea35c4bfb.1646651700.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1646651700.git.qemu_oss@crudebyte.com>
References: <cover.1646651700.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 07 Mar 2022 12:15:00 +0100
Subject: [PULL v2 15/19] 9pfs/codir.c: convert Doxygen -> kerneldoc format
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>, Will Cohen <wwcohen@gmail.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Fabian Franz <fabianfranz.oss@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=1a7f2400148fd273536daa0adba5ecdea35c4bfb@lizzy.crudebyte.com;
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
Message-Id: <c76be7d38ea448c6417b2ffb5ccd6b711519a878.1646314856.git.qemu_oss@crudebyte.com>
---
 hw/9pfs/codir.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/hw/9pfs/codir.c b/hw/9pfs/codir.c
index f96d8ac4e6..75148bc985 100644
--- a/hw/9pfs/codir.c
+++ b/hw/9pfs/codir.c
@@ -184,14 +184,25 @@ out:
 }
 
 /**
- * @brief Reads multiple directory entries in one rush.
+ * v9fs_co_readdir_many() - Reads multiple directory entries in one rush.
+ *
+ * @pdu: the causing 9p (T_readdir) client request
+ * @fidp: already opened directory where readdir shall be performed on
+ * @entries: output for directory entries (must not be NULL)
+ * @offset: initial position inside the directory the function shall
+ *          seek to before retrieving the directory entries
+ * @maxsize: maximum result message body size (in bytes)
+ * @dostat: whether a stat() should be performed and returned for
+ *          each directory entry
+ * Return: resulting response message body size (in bytes) on success,
+ *         negative error code otherwise
  *
  * Retrieves the requested (max. amount of) directory entries from the fs
  * driver. This function must only be called by the main IO thread (top half).
  * Internally this function call will be dispatched to a background IO thread
  * (bottom half) where it is eventually executed by the fs driver.
  *
- * @discussion Acquiring multiple directory entries in one rush from the fs
+ * Acquiring multiple directory entries in one rush from the fs
  * driver, instead of retrieving each directory entry individually, is very
  * beneficial from performance point of view. Because for every fs driver
  * request latency is added, which in practice could lead to overall
@@ -199,20 +210,9 @@ out:
  * directory) if every directory entry was individually requested from fs
  * driver.
  *
- * @note You must @b ALWAYS call @c v9fs_free_dirents(entries) after calling
+ * NOTE: You must ALWAYS call v9fs_free_dirents(entries) after calling
  * v9fs_co_readdir_many(), both on success and on error cases of this
- * function, to avoid memory leaks once @p entries are no longer needed.
- *
- * @param pdu - the causing 9p (T_readdir) client request
- * @param fidp - already opened directory where readdir shall be performed on
- * @param entries - output for directory entries (must not be NULL)
- * @param offset - initial position inside the directory the function shall
- *                 seek to before retrieving the directory entries
- * @param maxsize - maximum result message body size (in bytes)
- * @param dostat - whether a stat() should be performed and returned for
- *                 each directory entry
- * @returns resulting response message body size (in bytes) on success,
- *          negative error code otherwise
+ * function, to avoid memory leaks once @entries are no longer needed.
  */
 int coroutine_fn v9fs_co_readdir_many(V9fsPDU *pdu, V9fsFidState *fidp,
                                       struct V9fsDirEnt **entries,
-- 
2.20.1


