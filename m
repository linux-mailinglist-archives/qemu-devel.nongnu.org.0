Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D55033D88D1
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 09:29:42 +0200 (CEST)
Received: from localhost ([::1]:40938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8e0b-0000ig-DC
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 03:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qwe624758472@163.com>)
 id 1m8dGW-00081c-Of
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 02:42:04 -0400
Received: from mail-m973.mail.163.com ([123.126.97.3]:40346)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qwe624758472@163.com>) id 1m8dGP-0000p2-VC
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 02:42:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=6PJ7W
 E5fldRsIM+hH63J1rcJGnGQgWJnxea0WE6yRS0=; b=TvtMO6VtVpn+J4ze4R+RH
 XoW3ejWpC1/YnYkLmOACw9ByG9kR6/iT+XFx+QMpYsaE2fhwrILMizYPhn01chNh
 m6vqzW2AkD2LSTdKTVVYSq0FWMJytoVrNuyGeqAmCYBRvCVyQjuCMjJc/7BrEKJH
 5Ek60VuvoRYKCaUrmNKNLU=
Received: from localhost.localdomain (unknown [113.200.76.118])
 by smtp3 (Coremail) with SMTP id G9xpCgAXv6Qf_ABh2JKNAA--.69S2;
 Wed, 28 Jul 2021 14:41:35 +0800 (CST)
From: ruoguang <qwe624758472@163.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] format code
Date: Wed, 28 Jul 2021 14:41:32 +0800
Message-Id: <20210728064132.18367-1-qwe624758472@163.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: G9xpCgAXv6Qf_ABh2JKNAA--.69S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruFWDKF4rZF15AFW8Zr4DCFg_yoWkXFX_G3
 Z5ZrnF9rykCF4fuw18G3ZxW3WakFW8Ar4xtw1Sq39Fvr9Fya15ua1qq397Wrn8C3yFk3sx
 Cw1kXFyUJr98KjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUe5PEDUUUUU==
X-Originating-IP: [113.200.76.118]
X-CM-SenderInfo: htzhljauxvmkixs6il2tof0z/1tbiDR-dk1QHXDIj9AAAs2
Received-SPF: pass client-ip=123.126.97.3; envelope-from=qwe624758472@163.com;
 helo=mail-m973.mail.163.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 28 Jul 2021 03:28:53 -0400
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
Cc: qwe624758472 <624758472@qq.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: qwe624758472 <624758472@qq.com>

---
 block/dmg-bz2.c   | 3 +--
 block/dmg-lzfse.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/block/dmg-bz2.c b/block/dmg-bz2.c
index 37f7ee04be..2022eafc81 100644
--- a/block/dmg-bz2.c
+++ b/block/dmg-bz2.c
@@ -52,8 +52,7 @@ static int dmg_uncompress_bz2_do(char *next_in, unsigned int avail_in,
     return 0;
 }
 
-__attribute__((constructor))
-static void dmg_bz2_init(void)
+static void __attribute__((constructor)) dmg_bz2_init(void)
 {
     assert(!dmg_uncompress_bz2);
     dmg_uncompress_bz2 = dmg_uncompress_bz2_do;
diff --git a/block/dmg-lzfse.c b/block/dmg-lzfse.c
index 6798cf4fbf..9438539352 100644
--- a/block/dmg-lzfse.c
+++ b/block/dmg-lzfse.c
@@ -40,8 +40,7 @@ static int dmg_uncompress_lzfse_do(char *next_in, unsigned int avail_in,
     return -1;
 }
 
-__attribute__((constructor))
-static void dmg_lzfse_init(void)
+static void __attribute__((constructor)) dmg_lzfse_init(void)
 {
     assert(!dmg_uncompress_lzfse);
     dmg_uncompress_lzfse = dmg_uncompress_lzfse_do;
-- 
2.20.1


