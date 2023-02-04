Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ED868AB11
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:09:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOL66-0005RF-2H; Sat, 04 Feb 2023 11:09:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5y-0005Ne-3J
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:54 -0500
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5w-0006ze-Bx
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:53 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M2wbS-1pL3Ir0ORY-003QYL; Sat, 04
 Feb 2023 17:08:41 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Mike Frysinger <vapier@gentoo.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 14/22] linux-user: move target_flat.h to target subdirs
Date: Sat,  4 Feb 2023 17:08:22 +0100
Message-Id: <20230204160830.193093-15-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204160830.193093-1-laurent@vivier.eu>
References: <20230204160830.193093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uzF3dc4th1dKxiw9UOa0Y3dK5GTHMJ9W/ghwV3ffxj1NCwKqbBP
 vMyIO4HRObwmGdINUG7E5ZTjNXmmsAra+b4XEuhl/SIfwLWpRMeERt6/Tv5GuzWjcqh++ts
 ADNwLjvOx5W+xBWLQwjwAafqeTGMUT/VP9LKVJIFYl6Je0puTpAdXNQfK+sTVvpQE3l6ixb
 e9lBKh26mhkccAhI4YgNw==
UI-OutboundReport: notjunk:1;M01:P0:r09LaFXwISY=;6gpTsTVxzThU7fSzlrKwnhN7cV/
 87hkcTBEX5gQrB1JZUARMyTk/iuePU64osjqNd1bcdhxZH0IaGuBpRgRRRjlrW0jIGSbaFqn5
 KXP/YJpA89PoIGdj36cHcrRqbjIMFjGA8IoMAxQRI4VGl0vytMGpNctVbIZEkui45wWtqpAzH
 YOWXzRwixgxFoY4NfQF/XHIcyMgqymLQiNjrb1ksbu/UgU8IXvCcatXWmPsN6NsJpAfuZq9g2
 FTklohTzG/tvPU6jbvIHwno5DQLw5xc01T/VzMeQ81NZgDt0SnMBnmlxy0CwGZgHti9eV8R+U
 UUpfgWGNjZ5gXr/IqSicnsxz9i3ZP0JCmG8VGSe/33bz0yGBcwFQLHDO5ExxLrKaq5tBfubGr
 zbhmgU+zTHrFsh693i889Huu/wQuSjQald6NEE/JcSLBE/N39QE+3SlvxpaA8BqSpjAkx9k/C
 VQzUl4vbBjNLQ0gTbkGA0qCH3N3VGN18SAB8VOlW4N7ELMpSiNzp7R/s0eg9brqsboFAdEKIK
 Uw+QUB+t2NzqXMXnDXFEfE/nyvTcjGEpFzIh1N/6g5W58L69srmgRVQjYcUit+vM/CkmRt27A
 fgPCQnDQS02Xpvt8jZDpig1DPZQcIK7eNBF4ZNOjFxEZksv/3bun6ttaBhT8g0yq+3g3mrhxw
 PtRRZhqp2tvRpzNeHACJ6sA9orIgD72F9oBlrirdvA==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Mike Frysinger <vapier@gentoo.org>

This makes target_flat.h behave like every other target_xxx.h header.
It also makes it actually work -- while the current header says adding
a header to the target subdir overrides the common one, it doesn't.
This is for two reasons:
* meson.build adds -Ilinux-user before -Ilinux-user/$arch
* the compiler search path for "target_flat.h" looks in the same dir
  as the source file before searching -I paths.

This can be seen with the xtensa port -- the subdir settings aren't
used which breaks stack setup.

Move it to the generic/ subdir and add include stubs like every
other target_xxx.h header is handled.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230129004625.11228-1-vapier@gentoo.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/aarch64/target_flat.h       | 1 +
 linux-user/arm/target_flat.h           | 1 +
 linux-user/{ => generic}/target_flat.h | 0
 linux-user/m68k/target_flat.h          | 1 +
 linux-user/microblaze/target_flat.h    | 1 +
 linux-user/sh4/target_flat.h           | 1 +
 6 files changed, 5 insertions(+)
 create mode 100644 linux-user/aarch64/target_flat.h
 create mode 100644 linux-user/arm/target_flat.h
 rename linux-user/{ => generic}/target_flat.h (100%)
 create mode 100644 linux-user/m68k/target_flat.h
 create mode 100644 linux-user/microblaze/target_flat.h
 create mode 100644 linux-user/sh4/target_flat.h

diff --git a/linux-user/aarch64/target_flat.h b/linux-user/aarch64/target_flat.h
new file mode 100644
index 000000000000..bc83224cea12
--- /dev/null
+++ b/linux-user/aarch64/target_flat.h
@@ -0,0 +1 @@
+#include "../generic/target_flat.h"
diff --git a/linux-user/arm/target_flat.h b/linux-user/arm/target_flat.h
new file mode 100644
index 000000000000..bc83224cea12
--- /dev/null
+++ b/linux-user/arm/target_flat.h
@@ -0,0 +1 @@
+#include "../generic/target_flat.h"
diff --git a/linux-user/target_flat.h b/linux-user/generic/target_flat.h
similarity index 100%
rename from linux-user/target_flat.h
rename to linux-user/generic/target_flat.h
diff --git a/linux-user/m68k/target_flat.h b/linux-user/m68k/target_flat.h
new file mode 100644
index 000000000000..bc83224cea12
--- /dev/null
+++ b/linux-user/m68k/target_flat.h
@@ -0,0 +1 @@
+#include "../generic/target_flat.h"
diff --git a/linux-user/microblaze/target_flat.h b/linux-user/microblaze/target_flat.h
new file mode 100644
index 000000000000..bc83224cea12
--- /dev/null
+++ b/linux-user/microblaze/target_flat.h
@@ -0,0 +1 @@
+#include "../generic/target_flat.h"
diff --git a/linux-user/sh4/target_flat.h b/linux-user/sh4/target_flat.h
new file mode 100644
index 000000000000..bc83224cea12
--- /dev/null
+++ b/linux-user/sh4/target_flat.h
@@ -0,0 +1 @@
+#include "../generic/target_flat.h"
-- 
2.39.1


