Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9445860C695
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:35:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFMW-0004LD-DC; Tue, 25 Oct 2022 04:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1onEU5-0001L5-3W
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 03:36:30 -0400
Received: from mout.kundenserver.de ([212.227.126.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1onETw-0003Gt-Or
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 03:36:24 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MLRDv-1oUsW00Gzz-00ITZZ; Tue, 25
 Oct 2022 09:36:11 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 5/8] linux-user: add more compat ioctl definitions
Date: Tue, 25 Oct 2022 09:36:03 +0200
Message-Id: <20221025073606.3114355-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025073606.3114355-1-laurent@vivier.eu>
References: <20221025073606.3114355-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:U03RBkbM0HhcdIqqQzHoBpd+sAwSy2RCFZT35yev4XV941zUn8i
 wNUGukZ2K7HLmmedZLeKu0gwaeI9wP1LO+YaC4JUGKvrkhRxZQQ4LDiryftyS7nd2GxQIH3
 w/gc6RQzlmsC7rjAgIvX6hOOHryaDPu3cetcZ5oB0ZmHhPJpuxhVwYZWkNzZf+vESi1JoZi
 u4Irp+vc9ooBBFXQ54vSg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gq0JphV1rOU=:hVi9N1fjUkSDaUYvUf1DaE
 aacyLBH7g80UJAg0OHoKrWBQu4Dpi+BR9iHcskq24Y5xBLx/x2x9DTXYLJYnEZeeHlbuo0wgz
 GiRBtb3EFk3VKjOOtvc4RTNjcDe98fR4Z8Yj0hKQUTg3NIs0r4O6XMSLFGMkhlM+V+lYmEnEb
 sXlHEqalodt0X97bBuCjUeH8I28N4I2g01F4Oba3CzzD3W+vOwjmyn3N2RQqzq3ZjeUiFTCm+
 9r4lTt2JTy4xTurAZN+kt2gI3USKH7TzofVbHWzUhgpkdjQBY92X9SwuaKkWCIIb3OHh83n+J
 KqMDsEn1sHiVbGoRGu6yhZXTb4LZMimw6rpvf0qTaEXTbpUteg3ETOMly+kGzMXIDY48B1sQM
 64fBt8QnPJ/ceaACLMKFmVnHlUANPfgU30VdJx7i0p/Pbs8niQlk+uqrl44pz6WaMpclVYE5f
 N9CYNUKC/MIDAULrzZk2DuXYzT6+3kKZl+D7kX3nfEy6Nk0WCGX22g1jdD+gBjgglSYrTNfO3
 cn1NUEeTO+ATJ3UYsA27qbHtCHBD3jbPqpf4PzcLNwaDe0aGuBcg0xAhWYGIORW6sdusLjR+s
 e4KDHdQT6Z9eGn04gLaQnxnL80A04xBVjyIUNYMKABLY4E9Clcdd7RQ15Kcu8TTGZn+/3D617
 atPXfrswC5KgaA7Z5OqYG23PAMPeSRjpS3owK2DTC44+QCXKH6Wv4nXhrA94f3REaKEAM25Dh
 VvODytla/S1BYv1hDI0C173W0cWIK1/VY7q+eMqDNs96jy0OBnQpwWLfFXtnqebnoYpzyxalm
 hue2lVq
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Daniel P. Berrangé <berrange@redhat.com>

GLibc changes prevent us from including linux/fs.h anymore,
and we previously adjusted to this in

  commit 3cd3df2a9584e6f753bb62a0028bd67124ab5532
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Tue Aug 2 12:41:34 2022 -0400

    linux-user: fix compat with glibc >= 2.36 sys/mount.h

That change required adding compat ioctl definitions on the
QEMU side for any ioctls that we would otherwise obtain
from linux/fs.h.  This commit adds more that were initially
missed, due to their usage being conditionalized in QEMU.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20221004093206.652431-2-berrange@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 665db67c0598..d499cac1d5d1 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -111,6 +111,31 @@
 #define FS_IOC32_SETFLAGS              _IOW('f', 2, int)
 #define FS_IOC32_GETVERSION            _IOR('v', 1, int)
 #define FS_IOC32_SETVERSION            _IOW('v', 2, int)
+
+#define BLKGETSIZE64 _IOR(0x12,114,size_t)
+#define BLKDISCARD _IO(0x12,119)
+#define BLKIOMIN _IO(0x12,120)
+#define BLKIOOPT _IO(0x12,121)
+#define BLKALIGNOFF _IO(0x12,122)
+#define BLKPBSZGET _IO(0x12,123)
+#define BLKDISCARDZEROES _IO(0x12,124)
+#define BLKSECDISCARD _IO(0x12,125)
+#define BLKROTATIONAL _IO(0x12,126)
+#define BLKZEROOUT _IO(0x12,127)
+
+#define FIBMAP     _IO(0x00,1)
+#define FIGETBSZ   _IO(0x00,2)
+
+struct file_clone_range {
+        __s64 src_fd;
+        __u64 src_offset;
+        __u64 src_length;
+        __u64 dest_offset;
+};
+
+#define FICLONE         _IOW(0x94, 9, int)
+#define FICLONERANGE    _IOW(0x94, 13, struct file_clone_range)
+
 #else
 #include <linux/fs.h>
 #endif
-- 
2.37.3


