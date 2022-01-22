Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E40FB496CA5
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 14:51:35 +0100 (CET)
Received: from localhost ([::1]:50366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBGnm-0005s8-KM
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 08:51:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nBGm4-0005AT-B4; Sat, 22 Jan 2022 08:49:50 -0500
Received: from [2a00:1450:4864:20::42b] (port=36736
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nBGm2-00073w-HS; Sat, 22 Jan 2022 08:49:47 -0500
Received: by mail-wr1-x42b.google.com with SMTP id u15so4969146wrt.3;
 Sat, 22 Jan 2022 05:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jzIQf/rh1owyVHr6I4A+AYUYYZWY8UGDu4j+mQfBMHQ=;
 b=MJXfQfDMSez4GRSutlMlOLi8/OAY7hqSX8W+/gFi25aBJGjjeGyLak27MWMz1lQuwq
 Vfm+kTtspMva6v2S4mh5HOMYoOkNnNrMdOkFGf8jWLSsCIUUfSus8HQ8hP6O+7qA4tiJ
 k34EzVhvgqTwFwvoViloQjX8A73cQAqB3xJaJ2GImLqL6cnAV3lmRzS8FidgQA/2jHBX
 nEJkU8oPaRsdiSisheLbUt24FtDSxnnuibMAWC9jbUY+8yjW2dGFbz+DIZiosrqxswrS
 khg3vEc13Ucx/qb5ahDKP8/ew0JNHHWC+IzQVdGmXqp3BmPL4jPwT4v/fPBON0W28TjM
 ui8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=jzIQf/rh1owyVHr6I4A+AYUYYZWY8UGDu4j+mQfBMHQ=;
 b=fR+vHnT/B42E71iMEkG4kTMiD5zkLXXGne/vKW7kWN5GAFL/UjBe/Y/oyZRHIfJGNG
 v6G1OAUDX5k95WzNrAvn0zYX4UggaimorTvWjHUx/Y9a0GU7/Ku6CtcG9WCYST5UJTEi
 hUB6o7A9VWCyLX669t7IwTASihRiGywcgREJw1BZI0BFVQlZ3IvYIxp6oCXwyqPvIbgX
 J67iJp+HXx3mrt2sdk3CesdBN0TgaEvsTYKFwVas9iJGTS9i8i0FjneC8UnFFYl/RCie
 TxPnQ77y1Jh3Dm9/e45MJxwGabBv2gfFTuWRjJ+9EXb9m46gnNLQxG+gzjMbxhyT9N8S
 mhuw==
X-Gm-Message-State: AOAM532/VQKTbLJIjmjm2jL9IkT4/d1Y06+z/I/MXTbWoZm72MStYThs
 2o4gtgAICHcm6f/mFhMAxJPGm95Kn4w=
X-Google-Smtp-Source: ABdhPJwhuuk69np9+KDnQRmNLLT5jAHb9tvrDjL+PQzGhtQpZYthZCF5Pr2Bre7QqqmVHUQ2jDQw0Q==
X-Received: by 2002:a5d:4ac2:: with SMTP id y2mr7471258wrs.587.1642859383718; 
 Sat, 22 Jan 2022 05:49:43 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 l15sm12972415wmh.6.2022.01.22.05.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 05:49:42 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, qemu-block@nongnu.org,
 Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH] block/export/fuse: Fix build failure on FreeBSD
Date: Sat, 22 Jan 2022 14:49:40 +0100
Message-Id: <20220122134940.401590-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

When building on FreeBSD we get:

  [816/6851] Compiling C object libblockdev.fa.p/block_export_fuse.c.o
  ../block/export/fuse.c:628:16: error: use of undeclared identifier 'FALLOC_FL_KEEP_SIZE'
      if (mode & FALLOC_FL_KEEP_SIZE) {
                 ^
  ../block/export/fuse.c:632:16: error: use of undeclared identifier 'FALLOC_FL_PUNCH_HOLE'
      if (mode & FALLOC_FL_PUNCH_HOLE) {
                 ^
  ../block/export/fuse.c:633:22: error: use of undeclared identifier 'FALLOC_FL_KEEP_SIZE'
          if (!(mode & FALLOC_FL_KEEP_SIZE)) {
                       ^
  3 errors generated.
  FAILED: libblockdev.fa.p/block_export_fuse.c.o

Meson indeed reported FALLOC_FL_PUNCH_HOLE is not available:

  C compiler for the host machine: cc (clang 10.0.1 "FreeBSD clang version 10.0.1")
  Checking for function "fallocate" : NO
  Checking for function "posix_fallocate" : YES
  Header <linux/falloc.h> has symbol "FALLOC_FL_PUNCH_HOLE" : NO
  Header <linux/falloc.h> has symbol "FALLOC_FL_ZERO_RANGE" : NO
  ...

Similarly to commit 304332039 ("block/export/fuse.c: fix musl build"),
guard the code requiring FALLOC_FL_KEEP_SIZE / FALLOC_FL_PUNCH_HOLE
definitions under CONFIG_FALLOCATE_PUNCH_HOLE #ifdef'ry.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Fragile #ifdef'ry... Any clever idea?

    ERROR: else should follow close brace '}'
    #17: FILE: block/export/fuse.c:647:
         }
    +    else

    ERROR: else should follow close brace '}'
    #29: FILE: block/export/fuse.c:670:
         }
    +    else

    total: 2 errors, 0 warnings, 28 lines checked
---
 block/export/fuse.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/block/export/fuse.c b/block/export/fuse.c
index 6710d8aed86..d8bad0e53df 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -625,6 +625,7 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
         return;
     }
 
+#ifdef CONFIG_FALLOCATE_PUNCH_HOLE
     if (mode & FALLOC_FL_KEEP_SIZE) {
         length = MIN(length, blk_len - offset);
     }
@@ -643,8 +644,10 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
             length -= size;
         } while (ret == 0 && length > 0);
     }
+    else
+#endif /* CONFIG_FALLOCATE_PUNCH_HOLE */
 #ifdef CONFIG_FALLOCATE_ZERO_RANGE
-    else if (mode & FALLOC_FL_ZERO_RANGE) {
+    if (mode & FALLOC_FL_ZERO_RANGE) {
         if (!(mode & FALLOC_FL_KEEP_SIZE) && offset + length > blk_len) {
             /* No need for zeroes, we are going to write them ourselves */
             ret = fuse_do_truncate(exp, offset + length, false,
@@ -664,8 +667,9 @@ static void fuse_fallocate(fuse_req_t req, fuse_ino_t inode, int mode,
             length -= size;
         } while (ret == 0 && length > 0);
     }
+    else
 #endif /* CONFIG_FALLOCATE_ZERO_RANGE */
-    else if (!mode) {
+    if (!mode) {
         /* We can only fallocate at the EOF with a truncate */
         if (offset < blk_len) {
             fuse_reply_err(req, EOPNOTSUPP);
-- 
2.34.1


