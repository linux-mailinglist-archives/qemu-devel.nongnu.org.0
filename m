Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19204287C70
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Oct 2020 21:24:22 +0200 (CEST)
Received: from localhost ([::1]:50278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQbWX-0002YA-3z
	for lists+qemu-devel@lfdr.de; Thu, 08 Oct 2020 15:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <e04e75acb849b085c6d6320b2433a15fa935bcff@lizzy.crudebyte.com>)
 id 1kQbMb-0006zZ-8h
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 15:14:05 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:53715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <e04e75acb849b085c6d6320b2433a15fa935bcff@lizzy.crudebyte.com>)
 id 1kQbMY-0005JC-8k
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 15:14:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=61K9IPek47Lb/jUIgvqHI9x1BIex8Psn2YIHGCS3rpk=; b=Q23oc
 s1W8xK8ENvKqRkxIvAYJ+B3m8Gkuh9zaOX7CPnvffB/lfxVVm7qSTxY8DYHHc0oV1U0Shf4O8P+8L
 NZR4Zo/eRRR/Qnn8SYNO4uLimsHbCBEAsFnvMMV4oF8kn5UCJ386N+kWOkJtJr/cESSXIn31BAPYR
 TjbyPTgqB2MLTJrpvCB2fSQmVxSDyQVivJMy7UVReayC/LR7DuRjgiX4cvcX7S1Pw9rvieHrzTeWX
 pPA11uRo21ZSi00LlhwIEAt4SbeY2VDKGRKg9Z4webZmouM452VXIYwT0guM2fBYaHUS2/6hJH2Iq
 wakfOGtyVXBT0XgzR03LTqokKUCkQ==;
Message-Id: <e04e75acb849b085c6d6320b2433a15fa935bcff.1602182956.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1602182956.git.qemu_oss@crudebyte.com>
References: <cover.1602182956.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 8 Oct 2020 20:34:56 +0200
Subject: [PATCH v4 08/12] tests/9pfs: change qtest name prefix to synth
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
    Laurent Vivier <lvivier@redhat.com>,
    Paolo Bonzini <pbonzini@redhat.com>,
    Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
    Greg Kurz <groug@kaod.org>,
    "Daniel P. Berrangé" <berrange@redhat.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=e04e75acb849b085c6d6320b2433a15fa935bcff@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/08 15:12:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All existing 9pfs test cases are using the 'synth' fs driver so far, which
means they are not accessing real files, but a purely simulated (in RAM
only) file system.

Let's make this clear by changing the prefix of the individual qtest case
names from 'fs/' to 'synth/'. That way they'll be easily distinguishable
from upcoming new 9pfs test cases supposed to be using a different fs
driver.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/virtio-9p-test.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index de30b717b6..3281153b9c 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -897,26 +897,26 @@ static void fs_readdir_split_512(void *obj, void *data,
 
 static void register_virtio_9p_test(void)
 {
-    qos_add_test("config", "virtio-9p", pci_config, NULL);
-    qos_add_test("fs/version/basic", "virtio-9p", fs_version, NULL);
-    qos_add_test("fs/attach/basic", "virtio-9p", fs_attach, NULL);
-    qos_add_test("fs/walk/basic", "virtio-9p", fs_walk, NULL);
-    qos_add_test("fs/walk/no_slash", "virtio-9p", fs_walk_no_slash,
+    qos_add_test("synth/config", "virtio-9p", pci_config, NULL);
+    qos_add_test("synth/version/basic", "virtio-9p", fs_version, NULL);
+    qos_add_test("synth/attach/basic", "virtio-9p", fs_attach, NULL);
+    qos_add_test("synth/walk/basic", "virtio-9p", fs_walk, NULL);
+    qos_add_test("synth/walk/no_slash", "virtio-9p", fs_walk_no_slash,
                  NULL);
-    qos_add_test("fs/walk/dotdot_from_root", "virtio-9p",
+    qos_add_test("synth/walk/dotdot_from_root", "virtio-9p",
                  fs_walk_dotdot, NULL);
-    qos_add_test("fs/lopen/basic", "virtio-9p", fs_lopen, NULL);
-    qos_add_test("fs/write/basic", "virtio-9p", fs_write, NULL);
-    qos_add_test("fs/flush/success", "virtio-9p", fs_flush_success,
+    qos_add_test("synth/lopen/basic", "virtio-9p", fs_lopen, NULL);
+    qos_add_test("synth/write/basic", "virtio-9p", fs_write, NULL);
+    qos_add_test("synth/flush/success", "virtio-9p", fs_flush_success,
                  NULL);
-    qos_add_test("fs/flush/ignored", "virtio-9p", fs_flush_ignored,
+    qos_add_test("synth/flush/ignored", "virtio-9p", fs_flush_ignored,
                  NULL);
-    qos_add_test("fs/readdir/basic", "virtio-9p", fs_readdir, NULL);
-    qos_add_test("fs/readdir/split_512", "virtio-9p",
+    qos_add_test("synth/readdir/basic", "virtio-9p", fs_readdir, NULL);
+    qos_add_test("synth/readdir/split_512", "virtio-9p",
                  fs_readdir_split_512, NULL);
-    qos_add_test("fs/readdir/split_256", "virtio-9p",
+    qos_add_test("synth/readdir/split_256", "virtio-9p",
                  fs_readdir_split_256, NULL);
-    qos_add_test("fs/readdir/split_128", "virtio-9p",
+    qos_add_test("synth/readdir/split_128", "virtio-9p",
                  fs_readdir_split_128, NULL);
 }
 
-- 
2.20.1


