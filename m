Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 724D760C6B1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:41:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFMT-0003bD-JA; Tue, 25 Oct 2022 04:32:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1onETz-0001JO-5S
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 03:36:24 -0400
Received: from mout.kundenserver.de ([212.227.126.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1onETw-0003Gx-PT
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 03:36:18 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MLAF0-1oV9dB2Cjy-00ICSO; Tue, 25
 Oct 2022 09:36:11 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 6/8] linux-user: remove conditionals for many fs.h ioctls
Date: Tue, 25 Oct 2022 09:36:04 +0200
Message-Id: <20221025073606.3114355-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025073606.3114355-1-laurent@vivier.eu>
References: <20221025073606.3114355-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1p8GCLFQVIWBjHEWTGWIcGZOI9FslGEHLLfcknTtckVTz0uFXRw
 UM/7k4JNOwmCGqOSosnqbb/8BL91DEKV8xqSM8Z+069ckz4J57njjh+QluxG1APJ2/wtvnA
 Lnjzm5xFPpOjg5OKJzw6jNxt3tQfTGafDLPV3OzEnHTAdc1KD1XXsSL5Xv/x2ssUdQY1Nik
 4NILndIkny0/HdGkcuNtA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ykZfpIo+SZM=:CEqTtFuPbn8vlGBqttEwrc
 c94stDNC78GDvxgt0ZwARqV3NGKCZZgHeta/43RJjHvXIOteZVEFfLyj5gjd9C00G87rcTGb1
 iGNAIRLU5WAjWYGAF8s8gjEfaWuGtNmjSuaBNM8ZYZxfwCusr73kg6ewK/rQo/LSYut2pg+A8
 olOnw57q8SCH/u/qIgl42jeKBJ4jtYg8oMPUwbWQ30FMibuL3eq+67gxTzizzQe2NwiTq4TUE
 EcSrmsIy3/RGYbrJDRyvogeG6t+UkqoV+9BzsteIOWJJt5qPQjalcmHwmvOilhFk/rZNnQ0ZC
 1hDxqvj6Ue47ZfXV30iwRgW1aTJ0y1xHrLrw0LgetVITGO9emKLJcxpC9auiI7/GaE6wleQ2z
 9+3HG5Sn+JL9mtXYd9IqqEelLvKUur10W0yaHvDVoYyYoEoY+yJpDgnx+QCmcerLJzcEs+gUU
 eByNpbQGgH8y340H1gtCQNIS4bA4EJdV1q9abqlMCP/AeVieQ7zYNAlW1wazRV1D8AzLMZxAT
 RvcaBvuSbGk+IBNIRJMA1ARAb6/uZwZ7ily+3dmYgTLv3n814xCRS6VT5to0v38Dwo15b7Mkh
 4gejpwDyrgHsvCbK6pxMu6/KHAiGLZa57Tdr7ncTA7nWUgqs33b4EVXGHuxw8tgfsGvKW4ItZ
 j69YF+c69EpgwhaO5t4Yr2+VnXXUE1yU50vO7fcCbEkbldYQGfDHptNNuILpUOnEmg0W4+3g2
 vap3CCukkn5CYMlDx0tzdTjPVJaono206xoLOUg/y035Bp+pT/5tR3tyPQ/fVdls93qwa/ikw
 TPONPUc
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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

These ioctls have been defined in linux/fs.h for a long time

  * BLKGETSIZE64 - <2.6.12 (linux.git epoch)
  * BLKDISCARD - 2.6.28 (d30a2605be9d5132d95944916e8f578fcfe4f976)
  * BLKIOMIN - 2.6.32 (ac481c20ef8f6c6f2be75d581863f40c43874ef7)
  * BLKIOOPT - 2.6.32 (ac481c20ef8f6c6f2be75d581863f40c43874ef7)
  * BLKALIGNOFF - 2.6.32 (ac481c20ef8f6c6f2be75d581863f40c43874ef7)
  * BLKPBSZGET - 2.6.32 (ac481c20ef8f6c6f2be75d581863f40c43874ef7)
  * BLKDISCARDZEROES - 2.6.32 (98262f2762f0067375f83824d81ea929e37e6bfe)
  * BLKSECDISCARD - 2.6.36 (8d57a98ccd0b4489003473979da8f5a1363ba7a3)
  * BLKROTATIONAL - 3.2 (ef00f59c95fe6e002e7c6e3663cdea65e253f4cc)
  * BLKZEROOUT - 3.6 (66ba32dc167202c3cf8c86806581a9393ec7f488)
  * FIBMAP - <2.6.12 (linux.git epoch)
  * FIGETBSZ - <2.6.12 (linux.git epoch)

and when building with latest glibc, we'll see compat definitions
in syscall.c anyway thanks to the previous patch. Thus we can
assume they always exist and remove the conditional checks.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20221004093206.652431-3-berrange@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/ioctls.h | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index f182d40190ed..071f7ca25375 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -96,9 +96,7 @@
      IOCTL(BLKROGET, IOC_R, MK_PTR(TYPE_INT))
      IOCTL(BLKRRPART, 0, TYPE_NULL)
      IOCTL(BLKGETSIZE, IOC_R, MK_PTR(TYPE_ULONG))
-#ifdef BLKGETSIZE64
      IOCTL(BLKGETSIZE64, IOC_R, MK_PTR(TYPE_ULONGLONG))
-#endif
      IOCTL(BLKFLSBUF, 0, TYPE_NULL)
      IOCTL(BLKRASET, 0, TYPE_INT)
      IOCTL(BLKRAGET, IOC_R, MK_PTR(TYPE_LONG))
@@ -107,33 +105,15 @@
      IOCTL_SPECIAL(BLKPG, IOC_W, do_ioctl_blkpg,
                    MK_PTR(MK_STRUCT(STRUCT_blkpg_ioctl_arg)))
 
-#ifdef BLKDISCARD
      IOCTL(BLKDISCARD, IOC_W, MK_PTR(MK_ARRAY(TYPE_ULONGLONG, 2)))
-#endif
-#ifdef BLKIOMIN
      IOCTL(BLKIOMIN, IOC_R, MK_PTR(TYPE_INT))
-#endif
-#ifdef BLKIOOPT
      IOCTL(BLKIOOPT, IOC_R, MK_PTR(TYPE_INT))
-#endif
-#ifdef BLKALIGNOFF
      IOCTL(BLKALIGNOFF, IOC_R, MK_PTR(TYPE_INT))
-#endif
-#ifdef BLKPBSZGET
      IOCTL(BLKPBSZGET, IOC_R, MK_PTR(TYPE_INT))
-#endif
-#ifdef BLKDISCARDZEROES
      IOCTL(BLKDISCARDZEROES, IOC_R, MK_PTR(TYPE_INT))
-#endif
-#ifdef BLKSECDISCARD
      IOCTL(BLKSECDISCARD, IOC_W, MK_PTR(MK_ARRAY(TYPE_ULONGLONG, 2)))
-#endif
-#ifdef BLKROTATIONAL
      IOCTL(BLKROTATIONAL, IOC_R, MK_PTR(TYPE_SHORT))
-#endif
-#ifdef BLKZEROOUT
      IOCTL(BLKZEROOUT, IOC_W, MK_PTR(MK_ARRAY(TYPE_ULONGLONG, 2)))
-#endif
 
      IOCTL(FDMSGON, 0, TYPE_NULL)
      IOCTL(FDMSGOFF, 0, TYPE_NULL)
@@ -149,17 +129,13 @@
      IOCTL(FDTWADDLE, 0, TYPE_NULL)
      IOCTL(FDEJECT, 0, TYPE_NULL)
 
-#ifdef FIBMAP
      IOCTL(FIBMAP, IOC_W | IOC_R, MK_PTR(TYPE_LONG))
-#endif
 #ifdef FICLONE
      IOCTL(FICLONE, IOC_W, TYPE_INT)
      IOCTL(FICLONERANGE, IOC_W, MK_PTR(MK_STRUCT(STRUCT_file_clone_range)))
 #endif
 
-#ifdef FIGETBSZ
      IOCTL(FIGETBSZ, IOC_R, MK_PTR(TYPE_LONG))
-#endif
 #ifdef CONFIG_FIEMAP
      IOCTL_SPECIAL(FS_IOC_FIEMAP, IOC_W | IOC_R, do_ioctl_fs_ioc_fiemap,
                    MK_PTR(MK_STRUCT(STRUCT_fiemap)))
-- 
2.37.3


