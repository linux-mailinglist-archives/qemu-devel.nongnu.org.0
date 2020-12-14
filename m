Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C88502D9BD5
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 17:09:56 +0100 (CET)
Received: from localhost ([::1]:43366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koqQ7-00066K-Ov
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 11:09:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEv-0008JI-VV; Mon, 14 Dec 2020 10:58:21 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:34463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEZ-0001Rt-MH; Mon, 14 Dec 2020 10:58:19 -0500
Received: from localhost.localdomain ([82.252.135.218]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MtOOm-1jyWIC2Xp0-00upm5; Mon, 14 Dec 2020 16:57:42 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 06/19] fsdev: open brace '{' following struct go on the same
 line
Date: Mon, 14 Dec 2020 16:57:20 +0100
Message-Id: <20201214155733.207430-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214155733.207430-1-laurent@vivier.eu>
References: <20201214155733.207430-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pQqctQitfJUvkSvVY3kMl2Wy0lD3cIpkOHQB4FDBXqoyQrFQwNI
 NI8xPRko5RxqK4esqf6dO4EJ0axzX0MztpV+1grnl1HdNJ9MSrhVbwyK987T1DEikkor8nR
 y9xFGFz6DeJ7unH8mRn9UqnrgYpbdksZ2fse+OxkcUwzYNhUXzImn0dnd9ZRuKG86gQdk0P
 ge8n4QW/yf0yt2q/A1qpQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yV9ilGWCju0=:F+6hXJ/tZJyHGd1R2N46jR
 AAHar87MsySpfdVoVO25jbjbG4JwGdFnHf+YUpvDTkCEchxoiJ9barOgJ3hRk+45glhCPPi92
 +IwSTlttVzFmZ7cXLR8ZgSjJPGTzb0ZPxTTWZqZ1ZEFuhjHhs0NtTm9gX5D8QlVHT+yFmeLvC
 NZe7+52KfbLieF/Z4Wd+zNF6RPUHR/+3/7gYClszkLWrbicgnDnNgjf5MZpSADF5ZjPfED8VX
 lN3SdQUfsA3kzTG9vy+0lRjZlRZHJ6z7w72NpbsmEq6j6DZBWhiCrBsGt7q8/2naXigesc8cr
 Z7C/OCDfGDwdmKMjpiGgSGwGbG0RwQoGjkWpfwi7v0/vHon6sEFcv9wgC8Azlqpbw9sH4yWwQ
 eEDkOjUI6MsnqpUSXcn1O2aiA8GlxCLgCqhMsS7gSGQ8TzBJBshpGG/YzjLsD5hSdM7H7hZOF
 D8mj1kzsWA==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_NONE=0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 zhouyang <zhouyang789@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: zhouyang <zhouyang789@huawei.com>

I found some style problems while check the code using checkpatch.pl.
This commit fixs the issue below:
ERROR: open brace '{' following struct go on the same line

Signed-off-by: zhouyang <zhouyang789@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201209060735.2760943-1-zhouyang789@huawei.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 fsdev/9p-marshal.h | 12 ++++--------
 fsdev/file-op-9p.h |  3 +--
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/fsdev/9p-marshal.h b/fsdev/9p-marshal.h
index 8f3babb60a05..ceaf2f521ec4 100644
--- a/fsdev/9p-marshal.h
+++ b/fsdev/9p-marshal.h
@@ -1,21 +1,18 @@
 #ifndef QEMU_9P_MARSHAL_H
 #define QEMU_9P_MARSHAL_H
 
-typedef struct V9fsString
-{
+typedef struct V9fsString {
     uint16_t size;
     char *data;
 } V9fsString;
 
-typedef struct V9fsQID
-{
+typedef struct V9fsQID {
     uint8_t type;
     uint32_t version;
     uint64_t path;
 } V9fsQID;
 
-typedef struct V9fsStat
-{
+typedef struct V9fsStat {
     int16_t size;
     int16_t type;
     int32_t dev;
@@ -35,8 +32,7 @@ typedef struct V9fsStat
     int32_t n_muid;
 } V9fsStat;
 
-typedef struct V9fsIattr
-{
+typedef struct V9fsIattr {
     int32_t valid;
     int32_t mode;
     int32_t uid;
diff --git a/fsdev/file-op-9p.h b/fsdev/file-op-9p.h
index d51cec2f3be0..42f677cf38c2 100644
--- a/fsdev/file-op-9p.h
+++ b/fsdev/file-op-9p.h
@@ -110,8 +110,7 @@ typedef union V9fsFidOpenState V9fsFidOpenState;
 
 void cred_init(FsCred *);
 
-struct FileOperations
-{
+struct FileOperations {
     int (*parse_opts)(QemuOpts *, FsDriverEntry *, Error **errp);
     int (*init)(FsContext *, Error **errp);
     void (*cleanup)(FsContext *);
-- 
2.29.2


