Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640276DC5A9
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 12:12:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ploV0-00059T-Su; Mon, 10 Apr 2023 06:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tanxiongchuan@isrc.iscas.ac.cn>)
 id 1ploUu-000595-KR
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 06:11:40 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tanxiongchuan@isrc.iscas.ac.cn>) id 1ploUr-00021O-Fy
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 06:11:40 -0400
Received: from localhost.localdomain (unknown [223.72.42.7])
 by APP-05 (Coremail) with SMTP id zQCowAD35xTR4DNkglhzEA--.63784S3;
 Mon, 10 Apr 2023 18:11:29 +0800 (CST)
From: Xiongchuan Tan <tanxiongchuan@isrc.iscas.ac.cn>
To: qemu-devel@nongnu.org
Cc: Xiongchuan Tan <tanxiongchuan@isrc.iscas.ac.cn>
Subject: [PATCH 1/3] linux-user: Add compile flag for amdgpu drm support
Date: Mon, 10 Apr 2023 18:11:16 +0800
Message-Id: <20230410101118.59564-2-tanxiongchuan@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410101118.59564-1-tanxiongchuan@isrc.iscas.ac.cn>
References: <20230410101118.59564-1-tanxiongchuan@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAD35xTR4DNkglhzEA--.63784S3
X-Coremail-Antispam: 1UD129KBjvJXoWxWrW8tF4xtF4kuw45Xr1fWFg_yoWrGFWkpF
 95Ja17JrWrtF1fX39rta1kWFnYq3WDKw17Ca10y398Ar92yF48Zw1qk3W3ZF1fZFW0yFW0
 qF95u343C3yUu3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9a14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWUJVWUGwAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE
 2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjc
 xK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAI
 cxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14
 v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY
 c2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMxC20s026x
 CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
 JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
 1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_
 Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr
 UvcSsGvfC2KfnxnUUI43ZEXa7VUbdHUDUUUUU==
X-Originating-IP: [223.72.42.7]
X-CM-SenderInfo: xwdq5xprqjuxxxdqqxxvufhxpvfd2hldfou0/
Received-SPF: none client-ip=159.226.251.25;
 envelope-from=tanxiongchuan@isrc.iscas.ac.cn; helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, FORGED_SPF_HELO=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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

Signed-off-by: Xiongchuan Tan <tanxiongchuan@isrc.iscas.ac.cn>
---
 configure                 |  2 ++
 linux-user/ioctls.h       |  4 ++++
 linux-user/syscall.c      | 10 ++++++++++
 linux-user/syscall_defs.h |  5 +++++
 meson.build               |  1 +
 meson_options.txt         |  3 +++
 6 files changed, 25 insertions(+)

diff --git a/configure b/configure
index 800b5850f4..a93f5426ef 100755
--- a/configure
+++ b/configure
@@ -836,6 +836,8 @@ for opt do
   ;;
   --enable-linux-user) linux_user="yes"
   ;;
+  --enable-linux-user-drm-amdgpu) meson_option_add "-Ddrm_amdgpu=true"
+  ;;
   --disable-bsd-user) bsd_user="no"
   ;;
   --enable-bsd-user) bsd_user="yes"
diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index 071f7ca253..54b44a29a9 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -686,8 +686,12 @@
   IOCTL_SPECIAL(DRM_IOCTL_VERSION, IOC_RW, do_ioctl_drm,
                 MK_PTR(MK_STRUCT(STRUCT_drm_version)))
 
+#ifdef CONFIG_DRM_AMDGPU
+#else
   IOCTL_SPECIAL(DRM_IOCTL_I915_GETPARAM, IOC_RW, do_ioctl_drm_i915,
                 MK_PTR(MK_STRUCT(STRUCT_drm_i915_getparam)))
+#endif /* CONFIG_DRM_AMDGPU */
+
 #endif
 
 #ifdef TARGET_TIOCSTART
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 69f740ff98..bb0db61990 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -123,8 +123,12 @@
 #endif
 #ifdef HAVE_DRM_H
 #include <libdrm/drm.h>
+#ifdef CONFIG_DRM_AMDGPU
+#include <libdrm/amdgpu_drm.h>
+#else
 #include <libdrm/i915_drm.h>
 #endif
+#endif
 #include "linux_loop.h"
 #include "uname.h"
 
@@ -5648,6 +5652,10 @@ static abi_long do_ioctl_drm(const IOCTLEntry *ie, uint8_t *buf_temp,
     return -TARGET_ENOSYS;
 }
 
+#ifdef CONFIG_DRM_AMDGPU
+
+#else
+
 static abi_long do_ioctl_drm_i915_getparam(const IOCTLEntry *ie,
                                            struct drm_i915_getparam *gparam,
                                            int fd, abi_long arg)
@@ -5682,6 +5690,8 @@ static abi_long do_ioctl_drm_i915(const IOCTLEntry *ie, uint8_t *buf_temp,
     }
 }
 
+#endif /* CONFIG_DRM_AMDGPU */
+
 #endif
 
 static abi_long do_ioctl_TUNSETTXFILTER(const IOCTLEntry *ie, uint8_t *buf_temp,
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index cc37054cb5..e435649693 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -1227,9 +1227,14 @@ struct target_rtc_pll_info {
 /* drm ioctls */
 #define TARGET_DRM_IOCTL_VERSION      TARGET_IOWRU('d', 0x00)
 
+#ifdef CONFIG_DRM_AMDGPU
+
+#else
 /* drm i915 ioctls */
 #define TARGET_DRM_IOCTL_I915_GETPARAM              TARGET_IOWRU('d', 0x46)
 
+#endif /* CONFIG_DRM_AMDGPU */
+
 /* from asm/termbits.h */
 
 #define TARGET_NCC 8
diff --git a/meson.build b/meson.build
index c44d05a13f..841306f414 100644
--- a/meson.build
+++ b/meson.build
@@ -1962,6 +1962,7 @@ config_host_data.set('CONFIG_GPROF', get_option('gprof'))
 config_host_data.set('CONFIG_LIVE_BLOCK_MIGRATION', get_option('live_block_migration').allowed())
 config_host_data.set('CONFIG_QOM_CAST_DEBUG', get_option('qom_cast_debug'))
 config_host_data.set('CONFIG_REPLICATION', get_option('replication').allowed())
+config_host_data.set('CONFIG_DRM_AMDGPU', get_option('drm_amdgpu'))
 
 # has_header
 config_host_data.set('CONFIG_EPOLL', cc.has_header('sys/epoll.h'))
diff --git a/meson_options.txt b/meson_options.txt
index fc9447d267..f85f76f355 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -327,3 +327,6 @@ option('slirp_smbd', type : 'feature', value : 'auto',
 
 option('hexagon_idef_parser', type : 'boolean', value : true,
        description: 'use idef-parser to automatically generate TCG code for the Hexagon frontend')
+
+option('drm_amdgpu', type : 'boolean', value: false,
+       description: 'drm amdgpu ioctl support')
\ No newline at end of file
-- 
2.40.0


